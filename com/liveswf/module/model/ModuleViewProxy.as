package com.liveswf.module.model
{
	import com.liveswf.common.interfaces.IDisposable;
	
	import org.robotlegs.mvcs.Actor;
	
	public class ModuleViewProxy extends Actor implements IDisposable
	{		
		public function ModuleViewProxy()
		{
			super();
		}
		
		public function dispose():void
		{
		}
	}
}