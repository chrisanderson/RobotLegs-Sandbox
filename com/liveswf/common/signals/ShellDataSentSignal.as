package com.liveswf.common.signals
{
	import com.liveswf.common.interfaces.IDataArguments;
	
	import org.osflash.signals.Signal;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class ModuleMessageSignal
	 * @author Chris Anderson
	 * @date 03/22/2010
	 * @version 1.0
	 * @see
	 */
	
	public class ShellDataSentSignal extends Signal
	{
		public function ShellDataSentSignal()
		{
			super(IDataArguments);
		}
	}
}