package com.liveswf.main.view
{
	import com.liveswf.common.interfaces.IDataArguments;
	import com.liveswf.common.model.vo.dataArguments.ModuleReadyArguments;
	import com.liveswf.common.model.vo.dataArguments.ModuleViewSelectedArguments;
	import com.liveswf.common.signals.ShellDataSentSignal;
	import com.liveswf.main.model.MainViewProxy;
	import com.liveswf.main.model.vo.MainViewData;
	import com.liveswf.main.model.vo.ModuleLoadData;
	import com.liveswf.main.model.vo.ServerResponseData;
	import com.liveswf.main.signals.MainViewUpdatedSignal;
	import com.liveswf.main.signals.ModuleLoadChangedSignal;
	import com.liveswf.main.signals.ModuleLoadRequestedSignal;
	import com.liveswf.main.signals.ServerResponseSignal;
	import com.liveswf.main.view.components.MainView;
	
	import flash.utils.describeType;
	
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class MainViewMediator
	 * @author Chris Anderson
	 * @date 03/12/2010
	 * @version 1.0
	 * @see
	 */
	
	public class MainViewMediator extends Mediator implements IMainViewMediator
	{
		protected var _shellDataSent:ShellDataSentSignal;
		protected var _mainViewUpdated:MainViewUpdatedSignal;
		protected var _serverResponded:ServerResponseSignal;
		protected var _moduleLoadChanged:ModuleLoadChangedSignal;
		protected var _moduleLoadRequested:ModuleLoadRequestedSignal;
		protected var _shellResponseRequested:ShellDataSentSignal;
		
		public function MainViewMediator()
		{
			//
		}
		
		override public function onRegister():void
		{
			_shellDataSent.add(_onShellDataSent);
			
			//view signals
			_mainView.viewUpdated.add(_onViewUpdated);
			_mainView.moduleLoadRequested.add(_onModuleLoadRequested);
			
			//mediator signals
			_serverResponded.add(_onServerResponded);
			_moduleLoadChanged.add(_onModuleLoadChanged);
		}
		
		override public function onRemove():void
		{
			_mainView.viewUpdated.remove(_onViewUpdated);
			_mainView.moduleLoadRequested.remove(_onModuleLoadRequested);
			_serverResponded.remove(_onServerResponded);
			
			super.onRemove();
		}
		
		[Inject]
		public function set shellDataSent(value:ShellDataSentSignal):void
		{
			_shellDataSent = value;
		}
		
		[Inject]
		public function set mainViewUpdated(value:MainViewUpdatedSignal):void
		{
			_mainViewUpdated = value;
		}
		
		[Inject]
		public function set serverResponded(value:ServerResponseSignal):void
		{
			_serverResponded = value;
		}
		
		[Inject]
		public function set moduleLoadChanged(value:ModuleLoadChangedSignal):void
		{
			_moduleLoadChanged = value;
		}
		
		[Inject]
		public function set moduleLoadRequested(value:ModuleLoadRequestedSignal):void
		{
			_moduleLoadRequested = value;
		}
		
		[Inject]
		public function set shellResponseRequested(value:ShellDataSentSignal):void
		{
			_shellResponseRequested = value;
		}
		
		private function get _mainView():MainView
		{
			return viewComponent as MainView;
		}
		
		public function get mainViewData():MainViewData
		{
			return _mainView.mainViewData;
		}
		
		public function set serverResponseData(value:ServerResponseData):void
		{
			_mainView.serverResponseData = value;
		}
		
		public function set moduleLoadData(value:ModuleLoadData):void
		{
			_mainView.moduleLoadData = value;
		}
		
		//
		private function _onShellDataSent(value:IDataArguments):void
		{
			trace(this + " _onShellDataSent() value type: " + describeType(value).@name);//fix here
			
			//fix here tie _shellDataSent to a ShellDataSentCommand use this command to route signals throughout the app
			//update the proxy using ShellDataSentCommand
			//might have problems in the command with reaching signal properties might have to use the arguments property
			
			if(value is ModuleReadyArguments)
			{
				//fix here safe to send messages to the module now
				//would like to notify the proxy that a module is ready to listen for events (Module.moduleReady?)
			}
			else if(value is ModuleViewSelectedArguments)
			{
				//fix here
				//would like to notify the proxy that a module is selected (proxy.selectedModuleId?)
			}
		}
		
		private function _onViewUpdated(value:MainViewData):void
		{
			_mainViewUpdated.dispatch(value);
		}
		
		private function _onServerResponded(value:ServerResponseData):void
		{
			serverResponseData = value;
		}
		
		private function _onModuleLoadRequested(value:ModuleLoadData):void
		{
			_moduleLoadRequested.dispatch(value);
		}
		
		private function _onModuleLoadChanged(value:ModuleLoadData):void
		{
			moduleLoadData = value;
		}
	}
}