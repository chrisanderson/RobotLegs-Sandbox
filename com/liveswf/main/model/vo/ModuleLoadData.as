package com.liveswf.main.model.vo
{
	import com.liveswf.common.model.vo.ModuleData;

	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class ModuleLoadData
	 * @author Chris Anderson
	 * @date 03/17/2010
	 * @version 1.0
	 * @see
	 */
	
	[Bindable]
	public class ModuleLoadData
	{
		public var moduleLoadCount:int;
		public var currentModuleData:ModuleData;
		public var loadModule:Boolean;
		public var modulePath:String;
	}
}