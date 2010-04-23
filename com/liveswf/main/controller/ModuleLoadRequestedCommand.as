package com.liveswf.main.controller
{
	import com.liveswf.main.model.MainViewProxy;
	import com.liveswf.main.model.vo.ModuleLoadData;
	
	import org.robotlegs.mvcs.Command;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class HandleModuleLoadDataCommand
	 * @author Chris Anderson
	 * @date 03/17/2010
	 * @version 1.0
	 * @see
	 */
	
	public class ModuleLoadRequestedCommand extends Command
	{
		[Inject]
		public var moduleLoadData:ModuleLoadData;
		[Inject]
		public var mainViewProxy:MainViewProxy;
		
		override public function execute():void
		{
			if(moduleLoadData.loadModule)
			{
				mainViewProxy.loadModule(moduleLoadData);
			}
			else
			{
				mainViewProxy.unloadModule();
			}
		}
  }
}