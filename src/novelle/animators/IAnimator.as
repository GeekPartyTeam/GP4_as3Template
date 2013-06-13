package novelle.animators {	
	import flash.display.*;
	import novelle.*;
	/**
	 * ...
	 * @author Frost
	 */
	public interface IAnimator {
		function Animate(container:Sprite, picture:Bitmap, options:PictureData):void;
	}	
}