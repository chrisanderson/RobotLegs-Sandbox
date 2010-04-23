package com.liveswf.main.signals
{
	import com.liveswf.main.model.vo.ServerResponseData;
	
	import org.osflash.signals.Signal;
	
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class ServerResponseSignal
	 * @author Chris Anderson
	 * @date 03/12/2010
	 * @version 1.0
	 * @see
	 */
	
	public class ServerResponseSignal extends Signal
	{
		public function ServerResponseSignal()
		{
			super(ServerResponseData);
		}
	}
}