package com.liveswf.main.controller
{
	import com.liveswf.main.model.MainViewProxy;
	import com.liveswf.main.model.vo.MainViewData;
	
	import org.robotlegs.mvcs.Command;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class HandleMainViewDataCommand
	 * @author Chris Anderson
	 * @date 03/12/2010
	 * @version 1.0
	 * @see
	 */
	
	public class MainViewDataCommand extends Command
	{
		[Inject]
		public var mainViewData:MainViewData;
		[Inject]
		public var mainViewProxy:MainViewProxy;
		
		override public function execute():void
		{
			mainViewProxy.mainViewData = mainViewData;
		}
	}
}