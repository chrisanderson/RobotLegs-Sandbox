package com.liveswf.module.controller
{
	import com.liveswf.common.interfaces.IDataArguments;
	import com.liveswf.common.signals.ShellDataSentSignal;
	import com.liveswf.module.signals.ModuleDataUpdatedSignal;
	
	import org.robotlegs.mvcs.Command;
	
	public class ModuleDataUpdatedCommand extends Command
	{
		[Inject]
		public var shellDataSent:ShellDataSentSignal;
		//[Inject]
		//public var moduleDataUpdated:ModuleDataUpdatedSignal;
		[Inject]
		public var arguments:IDataArguments;
		
		override public function execute():void
		{
			trace(this + " execute() arguments: " + arguments + " shellDataSent: " + shellDataSent);//fix here
			//see http://joelhooks.com/2010/02/14/robotlegs-as3-signals-and-the-signalcommandmap-example/
			//arguments passed to signal should get injected into the command
			
			//shellDataSent.dispatch(moduleDataUpdated.arguments);
			//shellDataSent.dispatch(arguments);
		}
	}
}