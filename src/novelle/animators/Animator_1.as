package novelle.animators {
	import flash.display.*;
	import novelle.*;
	/**
	 * ...
	 * @author Frost
	 */
	public class Animator_1 implements IAnimator {
		
		public function Animator_1() { }
		
		private var optionsLink:PictureData;
		private var picLink:Bitmap;
		private var container:Sprite;
		
		public function Animate(container:Sprite, picture:Bitmap, options:PictureData):void {
			this.container = container;
			optionsLink = options;
			picLink = picture;
			picture.x = Number(options.point.x);
			picture.y = - picture.height;
			TimeUtils.delay(options.delay, tween);
		}	
		
		private function tween():void {
			container.addChild(picLink);
			Actuate.tween(picLink, optionsLink.animationTime, { y:optionsLink.point.y } );
		}
	}
}