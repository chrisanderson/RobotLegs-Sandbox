package com.liveswf.main.signals
{
	import com.liveswf.main.model.vo.MainViewData;
	
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Chris Anderson
	 */
	public class MainViewUpdatedSignal extends Signal
	{
		public function MainViewUpdatedSignal()
		{
			super(MainViewData);
		}
	}
}