package com.liveswf.main.view
{
	import com.liveswf.common.signals.ModuleDataSentSignal;
	import com.liveswf.common.signals.ShellDataSentSignal;
	import com.liveswf.main.model.vo.MainViewData;
	import com.liveswf.main.model.vo.ModuleLoadData;
	import com.liveswf.main.model.vo.ServerResponseData;
	import com.liveswf.main.signals.MainViewUpdatedSignal;
	import com.liveswf.main.signals.ModuleLoadChangedSignal;
	import com.liveswf.main.signals.ModuleLoadRequestedSignal;
	import com.liveswf.main.signals.ServerResponseSignal;
	import com.liveswf.main.view.components.MainView;
	
	import org.robotlegs.core.IMediator;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class IMainViewMediator
	 * @author Chris Anderson
	 * @date 03/14/2010
	 * @version 1.0
	 * @see
	 */
	
	public interface IMainViewMediator extends IMediator
	{
		function get mainViewData():MainViewData;
		function set serverResponseData(value:ServerResponseData):void;
		function set moduleLoadData(value:ModuleLoadData):void;
		
		//injected signals
		function set shellDataSent(value:ShellDataSentSignal):void;
		function set mainViewUpdated(value:MainViewUpdatedSignal):void;
		function set serverResponded(value:ServerResponseSignal):void;
		function set moduleLoadChanged(value:ModuleLoadChangedSignal):void;
		function set moduleLoadRequested(value:ModuleLoadRequestedSignal):void;
	}
}