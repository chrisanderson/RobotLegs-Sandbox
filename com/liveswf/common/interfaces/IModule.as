package com.liveswf.common.interfaces
{	
	import com.liveswf.common.signals.ModuleDataSentSignal;
	import com.liveswf.common.signals.ShellDataSentSignal;

	public interface IModule extends IDisposable
	{
		function get moduleId():int;
		function set moduleId(value:int):void;
		
		//signals
		function set shellDataSent(value:ShellDataSentSignal):void;
		function set moduleDataSent(value:ModuleDataSentSignal):void;
	}
}