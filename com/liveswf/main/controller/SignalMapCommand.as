﻿package com.liveswf.main.controller
{
	import com.liveswf.common.signals.ModuleDataSentSignal;
	import com.liveswf.common.signals.ShellDataSentSignal;
	import com.liveswf.main.signals.MainViewUpdatedSignal;
	import com.liveswf.main.signals.ModuleLoadChangedSignal;
	import com.liveswf.main.signals.ModuleLoadRequestedSignal;
	import com.liveswf.main.signals.ServerResponseSignal;
	
	import org.robotlegs.mvcs.Command;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class SignalMapCommand
	 * @author Chris Anderson
	 * @date 03/13/2010
	 * @version 1.0
	 * @see
	 */
	
	public class SignalMapCommand extends Command
	{
		override public function execute():void
		{
			injector.mapSingleton(ShellDataSentSignal);
			injector.mapSingleton(ModuleDataSentSignal);
			injector.mapSingleton(MainViewUpdatedSignal);
			injector.mapSingleton(ServerResponseSignal);
			injector.mapSingleton(ModuleLoadChangedSignal);
			injector.mapSingleton(ModuleLoadRequestedSignal);
		}
  }
}