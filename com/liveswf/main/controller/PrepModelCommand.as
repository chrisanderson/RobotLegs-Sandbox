﻿package com.liveswf.main.controller
{
	import com.liveswf.main.controller.MainViewDataCommand;
	import com.liveswf.main.controller.ModuleLoadRequestedCommand;
	import com.liveswf.main.model.MainViewProxy;
	import com.liveswf.main.signals.MainViewUpdatedSignal;
	import com.liveswf.main.signals.ModuleLoadRequestedSignal;
	import com.liveswf.main.signals.ServerResponseSignal;
	import com.liveswf.main.view.MainViewMediator;
	
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
			injector.mapSingleton(MainViewProxy);
			
			signalCommandMap.mapSignalClass(MainViewUpdatedSignal, MainViewDataCommand);
			signalCommandMap.mapSignalClass(ModuleLoadRequestedSignal, ModuleLoadRequestedCommand);
		}
	}
}