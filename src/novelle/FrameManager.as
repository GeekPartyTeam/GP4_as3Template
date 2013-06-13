package novelle {
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Frost
	 */
	public class FrameManager {
		
		private static var _inst:FrameManager;
		private static function get instance():FrameManager {
			if (_inst == null) {
				_inst = new FrameManager();
			}
			return _inst;
		}
		
		private var currentFrameID:int;
		
		public var frameContainer:Sprite;
		
		public function FrameManager() { }
		
		
		private var nextFrame:Frame;
		
		private function prepareFrame():void {
			nextFrame = AppData.instance.GetFrameById(currentFrameID);
			nextFrame.Prepare(onFramePrepared);
		}
		
		private function onFramePrepared():void {
			while (frameContainer.numChildren) {
				frameContainer.removeChildAt(0);
			}
			frameContainer.addChild(nextFrame);
			nextFrame.Show();
		}
		
		public function Change(frameID:int):void {
			currentFrameID = frameID;	
			prepareFrame();
		}
		
		public static function Change(frameID:int):void {
			instance.Change(frameID);
		}
		
		static public function InitScene(scene:Sprite):void {
			instance.frameContainer = scene;
		}
	}
}