package com.liveswf.common.interfaces
{	
	import com.liveswf.common.signals.ModuleDataSentSignal;
	import com.liveswf.common.signals.ShellDataSentSignal;
	
	import org.robotlegs.core.IInjector;

	public interface IModule extends IDisposable
	{
		function get moduleId():int;
		function set moduleId(value:int):void;
		
		function set parentInjector(value:IInjector):void;
	}
}