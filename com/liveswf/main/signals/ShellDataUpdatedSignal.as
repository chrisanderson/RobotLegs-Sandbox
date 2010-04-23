package com.liveswf.main.signals
{
	import com.liveswf.common.interfaces.IDataArguments;
	
	import org.osflash.signals.Signal;
	
	public class ShellDataUpdatedSignal extends Signal
	{
		public var arguments:IDataArguments;
		
		public function ShellDataUpdatedSignal()
		{
			super();
		}
	}
}