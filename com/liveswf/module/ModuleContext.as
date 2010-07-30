package com.liveswf.module
{
	import com.liveswf.common.signals.ApplicationStartedSignal;
	import com.liveswf.module.controller.*;
	
	import flash.display.DisplayObjectContainer;
	import flash.system.ApplicationDomain;
	
	import org.robotlegs.core.IInjector;
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
		public function ModuleContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true, parentInjector:IInjector = null, applicationDomain:ApplicationDomain = null)
    {
	    if(parentInjector)
	    {
    		_injector = parentInjector.createChild(applicationDomain || ApplicationDomain.currentDomain);
	    }
	    
	    super(contextView, autoStartup);
    }
    
		override public function startup():void
		{
			var applicationStarted:ApplicationStartedSignal = new ApplicationStartedSignal();
			signalCommandMap.mapSignal(applicationStarted, SignalMapCommand, true);
			signalCommandMap.mapSignal(applicationStarted, PrepModelCommand, true);
			signalCommandMap.mapSignal(applicationStarted, PrepViewCommand, true);
			applicationStarted.dispatch();
			
			super.startup();
		}
		
		override public function shutdown():void
		{
			//fix here
		}
  }
}