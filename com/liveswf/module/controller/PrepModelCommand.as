﻿package com.liveswf.module.controller
{
	import com.liveswf.module.model.ModuleViewProxy;
	import com.liveswf.module.signals.ModuleDataUpdatedSignal;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class PrepModelCommand
	 * @author Chris Anderson
	 * @date 03/12/2010
	 * @version 1.0
	 * @see
	 */
	
	public class PrepModelCommand extends SignalCommand
	{
		override public function execute():void
		{
			injector.mapSingleton(ModuleViewProxy);
			
			signalCommandMap.mapSignalClass(ModuleDataUpdatedSignal, ModuleDataUpdatedCommand);
		}
	}
}