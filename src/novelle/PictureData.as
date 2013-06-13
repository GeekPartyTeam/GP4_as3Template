package novelle {
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Point;	
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Frost
	 */
	public class PictureData {		
		public var animationTime:Number;
		public var pictureURL:String;
		public var animated:Boolean;
		public var animator:int;
		public var point:Point;
		public var delay:int;
		
		public var bitmap:Bitmap;
		
		private var loadingPicureCompleteCallBack:Function;
		
		public function PictureData(config:Object) {
			animator = parseInt(config.animator);
			pictureURL = config.pic;
			point = new Point();
			if (animator == 0) {
				animated = false;
				return;
			}
			point = new Point(config.point.x, config.point.y);
			animationTime = (parseInt(config.time) / 1000);
			delay = parseInt(config.delay);
			animated = true;
		}
		
		public function loadPicture(complete_cb:Function):void {
			loadingPicureCompleteCallBack = complete_cb;
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadingComplete);
			loader.load(new URLRequest(pictureURL));
		}
		
		private function onLoadingComplete(e:Event):void {
			bitmap = e.target.content as Bitmap;
			loadingPicureCompleteCallBack();
		}
	}
}