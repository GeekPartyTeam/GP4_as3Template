package novelle.animators {
	import flash.display.*;
	import novelle.*;
	/**
	 * ...
	 * @author Frost
	 */
	public class Animator_4 implements IAnimator {
		
		public function Animator_4() { }
		
		private var optionsLink:PictureData;
		private var picLink:Bitmap;
		private var container:Sprite;
		
		public function Animate(container:Sprite, picture:Bitmap, options:PictureData):void {
			this.container = container;
			optionsLink = options;
			picLink = picture;
			picture.x = -picture.width;
			picture.y = Number(options.point.y);
			TimeUtils.delay(options.delay, tween);
		}	
		
		private function tween():void {
			container.addChild(picLink);
			Actuate.tween(picLink, optionsLink.animationTime, { x:optionsLink.point.x } );
		}		
	}
}