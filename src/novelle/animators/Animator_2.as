package novelle.animators {
	import flash.display.*;
	import novelle.*;
	/**
	 * ...
	 * @author Frost
	 */
	public class Animator_2 implements IAnimator {
		
		public function Animator_2() { }
		
		private var optionsLink:PictureData;
		private var picLink:Bitmap;
		private var container:Sprite;
		
		public function Animate(container:Sprite, picture:Bitmap, options:PictureData):void {
			this.container = container;
			optionsLink = options;
			picLink = picture;
			picture.x = 2000;
			picture.y = Number(options.point.y);
			TimeUtils.delay(options.delay, tween);
		}	
		
		private function tween():void {
			container.addChild(picLink);
			Actuate.tween(picLink, optionsLink.animationTime, { x:optionsLink.point.x } );
		}				
	}
}