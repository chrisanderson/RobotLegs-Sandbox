﻿package com.liveswf.module.controller
{
	import com.liveswf.common.signals.ModuleDataSentSignal;
	import com.liveswf.module.signals.ModuleViewSelectedSignal;
	
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
			//injector.mapSingleton(ModuleDataSentSignal);//should be mapped in main's SignalMapCommand
			injector.mapSingleton(ModuleViewSelectedSignal);
		}
  }
}