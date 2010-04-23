package com.liveswf.main.signals
{
	import com.liveswf.main.model.vo.ModuleLoadData;
	
	import org.osflash.signals.Signal;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class ModuleSignal
	 * @author Chris Anderson
	 * @date 03/17/2010
	 * @version 1.0
	 * @see
	 */
	
	public class ModuleLoadRequestedSignal extends Signal
	{
		public function ModuleLoadRequestedSignal()
		{
			super(ModuleLoadData);
		}
	}
}