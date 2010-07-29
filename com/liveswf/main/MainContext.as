package com.liveswf.main
{
	import com.liveswf.main.controller.*;
	import com.liveswf.module.view.module;
	import com.liveswf.common.signals.ApplicationStartedSignal;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.SignalContext;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class MainContext
	 * @author Chris Anderson
	 * @date 03/12/2010
	 * @version 1.0
	 * @see
	 */
	
	public class MainContext extends SignalContext
	{
		override public function startup():void
		{
			//map modules
			viewMap.mapType(module);
			
			var startupSignal:ApplicationStartedSignal = new ApplicationStartedSignal();
			signalCommandMap.mapSignal(startupSignal, SignalMapCommand, true);
			signalCommandMap.mapSignal(startupSignal, PrepModelCommand, true);
			signalCommandMap.mapSignal(startupSignal, PrepViewCommand, true);
			startupSignal.dispatch();
			
			super.startup();
		}
	}
}