package com.liveswf.module.view
{
	import com.liveswf.common.interfaces.IDataArguments;
	import com.liveswf.common.model.vo.dataArguments.*;
	import com.liveswf.common.signals.*;
	import com.liveswf.module.IModuleViewMediator;
	import com.liveswf.module.signals.*;
	import com.liveswf.module.view.components.ModuleView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ModuleViewMediator extends Mediator implements IModuleViewMediator
	{
		protected var _moduleDataSent:ModuleDataSentSignal;
		protected var _moduleDataUpdated:ModuleDataUpdatedSignal;
		protected var _moduleViewSelected:ModuleViewSelectedSignal;
		
		public function ModuleViewMediator()
		{
		}
		
		override public function onRegister():void
		{
			_moduleDataSent.add(_onModuleDataSent);
			
			_moduleView.moduleViewSelected.add(_onModuleViewSelected);
			
			var arguments:ModuleReadyArguments = new ModuleReadyArguments();
			arguments.moduleId = _moduleView.moduleId;
			_onModuleDataUpdated(arguments);
		}
		
		override public function onRemove():void
		{
			_moduleView.dispose();
			
			super.onRemove();
		}
		
		//inbound signals
		[Inject]
		public function set moduleDataSent(value:ModuleDataSentSignal):void
		{
			_moduleDataSent = value;
		}
		
		//outbound signals
		[Inject]
		public function set moduleDataUpdated(value:ModuleDataUpdatedSignal):void
		{
			_moduleDataUpdated = value;
		}
		[Inject]
		public function set moduleViewSelected(value:ModuleViewSelectedSignal):void
		{
			_moduleViewSelected = value;
		}
		
		private function get _moduleView():ModuleView
		{
			return viewComponent as ModuleView;
		}
		
		//inbound signal handlers
		private function _onModuleDataSent(arguments:IDataArguments):void
		{
			if(arguments is ModuleReadyArguments)
			{
				_moduleView.moduleId = (arguments as ModuleReadyArguments).moduleId;
			}
			
			if(arguments is ModuleDataSentArguments)
			{
				trace("test33 message: " + (arguments as ModuleDataSentArguments).message);
			}
		}
		
		//outbound signal handlers
		private function _onModuleDataUpdated(arguments:IDataArguments):void
		{
			//_moduleDataUpdated.arguments = arguments;
			//_moduleDataUpdated.dispatch(arguments);//fix here
		}
		private function _onModuleViewSelected(moduleId:int):void
		{
			//external signal used to communicate with shell
			var arguments:ModuleViewSelectedArguments = new ModuleViewSelectedArguments();
			arguments.moduleId = _moduleView.moduleId;
			//_moduleDataUpdated.arguments = arguments;
			_moduleDataUpdated.dispatch(arguments);
			
			//internal signal used by module (currently not mapped to a command so does nothing)
			_moduleViewSelected.dispatch(moduleId);
		}
	}
}