package {
	import flash.display.*;
	import flash.events.*;
	import novelle.*;
	/**
	 * ...
	 * @author Frost
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite {
		
		private var scene:Sprite;

		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			scene = new Sprite();
			scene.graphics.beginFill(0);
			scene.graphics.drawRect(0, 0, 800, 800);
			scene.graphics.endFill();
			
			addChild(scene);
			AppData.instance.Init(onAppDataInitialized);
		}
		
		private function onAppDataInitialized():void {
			FrameManager.InitScene(scene);
			FrameManager.Change(1);
		}
	}
}