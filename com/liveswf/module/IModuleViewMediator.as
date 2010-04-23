package com.liveswf.module
{
	import com.liveswf.common.signals.ModuleDataSentSignal;
	import com.liveswf.module.signals.ModuleDataUpdatedSignal;
	import com.liveswf.module.signals.ModuleViewSelectedSignal;
	
	import org.robotlegs.core.IMediator;
	
	public interface IModuleViewMediator extends IMediator
	{		
		//injected signals
		function set moduleDataSent(value:ModuleDataSentSignal):void;
		function set moduleDataUpdated(value:ModuleDataUpdatedSignal):void;
		function set moduleViewSelected(value:ModuleViewSelectedSignal):void;
	}
}