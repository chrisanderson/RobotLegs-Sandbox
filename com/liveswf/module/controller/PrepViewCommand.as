package com.liveswf.module.controller
{
	import com.liveswf.module.view.ModuleViewMediator;
	import com.liveswf.module.view.components.ModuleView;
	
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
			mediatorMap.mapView(ModuleView, ModuleViewMediator);
		}
	}
}