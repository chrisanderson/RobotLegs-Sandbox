package com.liveswf.module
{
	import com.liveswf.common.signals.ApplicationStartedSignal;
	import com.liveswf.module.controller.PrepModelCommand;
	import com.liveswf.module.controller.PrepViewCommand;
	import com.liveswf.module.controller.SignalMapCommand;
	
	import org.robotlegs.mvcs.SignalContext;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class MainContext
	 * @author Chris Anderson
	 * @date 03/18/2010
	 * @version 1.0
	 * @see
	 */
	
	public class ModuleContext extends SignalContext
	{
		override public function startup():void
		{
			var applicationStarted:ApplicationStartedSignal = new ApplicationStartedSignal();
			signalCommandMap.mapSignal(applicationStarted, SignalMapCommand, true);
			signalCommandMap.mapSignal(applicationStarted, PrepModelCommand, true);
			signalCommandMap.mapSignal(applicationStarted, PrepViewCommand, true);
			applicationStarted.dispatch();
			
			super.startup();
		}
		
		public function mapValue(whenAskedFor:Class, useValue:Object, named:String = ""):*
		{
			return injector.mapValue(whenAskedFor, useValue, named);
		}
  }
}