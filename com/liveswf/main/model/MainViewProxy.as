package com.liveswf.main.model
{
	import com.liveswf.common.interfaces.IDataArguments;
	import com.liveswf.common.interfaces.IModule;
	import com.liveswf.common.model.vo.ModuleData;
	import com.liveswf.common.model.vo.dataArguments.ModuleReadyArguments;
	import com.liveswf.common.signals.ModuleDataSentSignal;
	import com.liveswf.common.signals.ShellDataSentSignal;
	import com.liveswf.main.MainContext;
	import com.liveswf.main.model.vo.MainViewData;
	import com.liveswf.main.model.vo.ModuleLoadData;
	import com.liveswf.main.model.vo.ServerResponseData;
	import com.liveswf.main.signals.ModuleLoadChangedSignal;
	import com.liveswf.main.signals.ServerResponseSignal;
	import com.liveswf.main.view.components.MainView;
	
	import flash.display.DisplayObject;
	
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleManager;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class MainViewProxy
	 * @author Chris Anderson
	 * @date 03/12/2010
	 * @version 1.0
	 * @see
	 */
	
	public class MainViewProxy extends Actor
	{
		[Inject]
		public var serverResponded:ServerResponseSignal;
		[Inject]
		public var moduleLoadChanged:ModuleLoadChangedSignal;
		[Inject]
		public var shellDataSent:ShellDataSentSignal;
		[Inject]
		public var moduleDataSent:ModuleDataSentSignal;
		
		private var _serverResponseData:ServerResponseData;
		private var _moduleLoadData:ModuleLoadData;
		private var _moduleInfoCollection:Array = new Array();
		private var _moduleId:int;
		
		public function MainViewProxy()
		{			
			super();
		}
		
		public function set mainViewData(value:MainViewData):void
		{
			trace(this + " set mainViewData() email: " + value.email + " password: " + value.password);
			
			//faking server call & response
			var tempServerResponseData:ServerResponseData = new ServerResponseData();
			tempServerResponseData.response = "Server Response: email: " + value.email + " password: " + value.password;
			
			_setServerResponseData(tempServerResponseData);
		}
		
		public function get serverResponseData():ServerResponseData
		{
			return _serverResponseData;
		}
		private function _setServerResponseData(value:ServerResponseData):void
		{
			_serverResponseData = value;
			serverResponded.dispatch(_serverResponseData);
		}
		
		//
		public function loadModule(moduleLoadData:ModuleLoadData):void
		{
			_moduleLoadData = moduleLoadData;
			
			var moduleInfo:IModuleInfo = ModuleManager.getModule(moduleLoadData.modulePath);
			moduleInfo.addEventListener(ModuleEvent.ERROR, _onModuleError, false, 0, true);
			moduleInfo.addEventListener(ModuleEvent.READY, _onModuleReady, false, 0, true);
			
			var moduleData:ModuleData = new ModuleData();
			moduleData.id = _moduleId++;
			moduleInfo.data = moduleData;
			moduleInfo.load();
			
			_moduleInfoCollection.push(moduleInfo);
		}
		private function _onModuleError(event:ModuleEvent):void
		{
			event.module.removeEventListener(ModuleEvent.ERROR, _onModuleError);
			throw new Error(this + " _onModuleError() errorText: " + event.errorText);
		}
		private function _onModuleReady(event:ModuleEvent):void
		{
			_moduleLoadData.moduleLoadCount += 1;
			
			var moduleInfo:IModuleInfo = event.module;
			var moduleData:ModuleData = moduleInfo.data as ModuleData;
			moduleData.view = moduleInfo.factory.create() as DisplayObject;
			
			var moduleView:IModule = moduleData.view as IModule;
			moduleView.moduleId = moduleData.id;
			moduleView.shellDataSent = shellDataSent;
			moduleView.moduleDataSent = moduleDataSent;
			
			_moduleLoadData.currentModuleData = moduleData;
			moduleLoadChanged.dispatch(_moduleLoadData);
		}
		
		public function unloadModule():void
		{
			//fix here have the module dispose of any memory before removing it
			//dispatchEvent(new common.events.ModuleEvent(common.events.ModuleEvent.UNLOAD_REQUEST));
			
			if(_moduleInfoCollection.length > 0)
			{
				var moduleInfo:IModuleInfo = _moduleInfoCollection.pop();
				
				moduleInfo.addEventListener(ModuleEvent.UNLOAD, _onModuleUnload);
				
				if(moduleInfo.hasEventListener(ModuleEvent.ERROR))
				{
					moduleInfo.removeEventListener(ModuleEvent.ERROR, _onModuleError);
					//trace(this + " unloadModule() removeEventListener(ModuleEvent.ERROR)");
				}
				if(moduleInfo.hasEventListener(ModuleEvent.READY))
				{
					moduleInfo.removeEventListener(ModuleEvent.READY, _onModuleReady);
					//trace(this + " unloadModule() removeEventListener(ModuleEvent.READY)");
				}
				
				try
				{
					moduleInfo.release();
					//trace(this + " unloadModule() moduleInfo.release()");
				}catch(error:*){}
				
				try
				{
					moduleInfo.unload();
					//trace(this + " unloadModule() moduleInfo.unload()");
				}catch(error:*){}
				
				moduleInfo = null;
				_moduleLoadData.currentModuleData.view = null;
				moduleLoadChanged.dispatch(_moduleLoadData);
			}
		}
		private function _onModuleUnload(event:ModuleEvent):void
		{
			event.module.removeEventListener(ModuleEvent.UNLOAD, _onModuleUnload);
			_moduleLoadData.moduleLoadCount -= 1;
		}
		
		public function getModuleView(moduleId:int):DisplayObject
		{
			for each(var moduleInfo:IModuleInfo in _moduleInfoCollection)
			{
				var moduleData:ModuleData = moduleInfo.data as ModuleData;
				
				if(moduleData.id == moduleId)
				{
					return moduleData.view;
				}
			}
			
			return null;
		}
	}
}