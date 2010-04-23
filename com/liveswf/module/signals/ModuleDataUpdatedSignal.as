package com.liveswf.module.signals
{
	import com.liveswf.common.interfaces.IDataArguments;
	
	import org.osflash.signals.Signal;
	
	public class ModuleDataUpdatedSignal extends Signal
	{
		//public var arguments:IDataArguments;
		
		public function ModuleDataUpdatedSignal()
		{
			super(IDataArguments);
		}
	}
}