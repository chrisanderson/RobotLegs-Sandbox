package com.liveswf.main.controller
{
	import com.liveswf.main.view.components.MainView;
	import com.liveswf.main.view.MainViewMediator;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class PrepViewCommand
	 * @author Chris Anderson
	 * @date 03/12/2010
	 * @version 1.0
	 * @see
	 */
	
	public class PrepViewCommand extends SignalCommand
	{
		override public function execute():void
		{
			mediatorMap.mapView(MainView, MainViewMediator);
		}
	}
}