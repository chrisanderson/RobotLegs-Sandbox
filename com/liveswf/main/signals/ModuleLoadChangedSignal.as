package com.liveswf.main.signals
{
	import com.liveswf.main.model.vo.ModuleLoadData;
	
	import org.osflash.signals.Signal;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class ModuleLoadChangedSignal
	 * @author Chris Anderson
	 * @date 03/18/2010
	 * @version 1.0
	 * @see
	 */
	
	public class ModuleLoadChangedSignal extends Signal
	{
		public function ModuleLoadChangedSignal()
		{
			super(ModuleLoadData);
		}
	}
}