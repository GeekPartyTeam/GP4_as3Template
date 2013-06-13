package novelle {
	import flash.display.*
	import flash.events.*;
	import flash.net.*;
	/**
	 * ...
	 * @author Frost
	 */
	public class AppData {
		
		public var frames:Vector.<Frame>;
		
		public var hero:Hero;
		
		private static var _inst:AppData;
		
		public static function get instance():AppData {
			if (_inst == null) {
				_inst = new AppData();
			}
			return _inst;
		}
		
		public function AppData() {
			hero = new Hero();	
			frames = new Vector.<Frame>();
		}
		
		private var initializeCompleteCallBack:Function;		
		
		public function Init(complete_cb:Function):void {
			initializeCompleteCallBack = complete_cb;
			var loader:URLLoader = new URLLoader();			
			loader.addEventListener(Event.COMPLETE, onConfigurationLoaded);
			loader.load(new URLRequest('frames.gp'));
		}
		
		private var loaderCount:int;
		
		private function onConfigurationLoaded(e:Event):void {		
			loaderCount = 0;
			var framesURLs:Array = JSON.parse(e.target.data) as Array;
			var i:int;
			var loaders:Vector.<URLLoader> = new Vector.<URLLoader>();
			for (i = 0; i < framesURLs.length; i++) {
				var loader:URLLoader = new URLLoader();			
				loader.addEventListener(Event.COMPLETE, onFrameConfigurationLoaded);
				loaders.push(loader);
				loaderCount++;
			}
			for (i = 0; i < loaders.length; i++) {
				loaders[i].load(new URLRequest('frames/'+framesURLs[i]+'.gp'));
			}
		}
		
		private function onFrameConfigurationLoaded(e:Event):void {
			loaderCount--;
			
			var frame:Frame = new Frame();
			frame.Init(JSON.parse(e.target.data));
			frames.push(frame);
			
			if (loaderCount == 0) {							
				initializeCompleteCallBack();				
			}
		}		
		
		public function GetFrameById(frameID:int):Frame {
			var i:int;
			for (i = 0; i < frames.length; i++) {
				if (frames[i].frameID == frameID) {
					return frames[i];
				}
			}
			trace('frame not found');
			return null;
		}
	}
}