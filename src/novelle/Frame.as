package novelle {
	import flash.net.URLRequest;
	import novelle.animators.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.text.*;
	/**
	 * ...
	 * @author Frost
	 */
	public class Frame extends Sprite {	
		
		public var picturesData:Vector.<PictureData>;
		public var variantsData:Vector.<VariantData>;
		public var text:String;
		public var frameID:int;
		
		public var layout:UI_frameLayout;
		
		private var variantsContainer:Sprite;
		private var picturesContainer:Sprite;
		private var frameTextField:TextField;
		
		public function Frame() {
			picturesData = new Vector.<PictureData>();
			variantsData = new Vector.<VariantData>();			
		}
		
		private function initLayout():void {
			frameTextField = layout.getChildByName('frameText') as TextField;
			frameTextField.selectable = false;
			frameTextField.text = text;
			
			var picsMainContainer:MovieClip = layout.getChildByName('picContainer') as MovieClip;
			picsMainContainer.scrollRect = new Rectangle(0, 0, picsMainContainer.width, picsMainContainer.height);
			picturesContainer = new Sprite();
			picsMainContainer.addChild(picturesContainer);
			
			var variantsMainContainer:MovieClip = layout.getChildByName('variants') as MovieClip;
			variantsContainer = new Sprite();
			variantsMainContainer.addChild(variantsContainer);			
			
			var i:int;
			var offset:Point = new Point();
			for (i = 0; i < variantsData.length; i++) {
				var _v:FrameVariant = new FrameVariant(variantsData[i]);
				_v.x = offset.x;
				_v.y = offset.y;
				offset.x = (offset.y == _v.height) ? offset.x + _v.width : offset.x;
				offset.y = (offset.y == _v.height) ? 0 : _v.height;
				variantsContainer.addChild(_v);
			}
			variantsContainer.x = (variantsMainContainer.width - variantsContainer.width) / 2;
			variantsContainer.y = (variantsMainContainer.height - variantsContainer.height) / 2;
			
			variantsContainer.addEventListener(MouseEvent.CLICK, onVariantClick, true);
			
			addChild(layout);
		}
		
		private function onVariantClick(e:MouseEvent):void {
			var fv:FrameVariant = e.target.parent.parent as FrameVariant;
			FrameManager.Change(fv.data.gotoFrame);
		}
		
		
		public function Init(config:Object):void {
			frameID = parseInt(config.id);
			text = config.text;
			var i:int;
			var animationsArray:Array = config.animations as Array;
			for (i = 0; i < animationsArray.length; i++) {
				var pData:PictureData = new PictureData(animationsArray[i]);
				picturesData.push(pData);
			}
			var variantsArray:Array = config.variants as Array;
			for (i = 0; i < variantsArray.length; i++) {
				var vData:VariantData = new VariantData(variantsArray[i]);
				variantsData.push(vData);
			}
		}
		
		private var prepareCallBack:Function;
		private var loadersCounter:int;
		
		public function Prepare(complete_cb:Function):void {
			prepareCallBack = complete_cb;
			layout = new UI_frameLayout();
			initLayout();
			
			var loaders:Array = [];
			loadersCounter = picturesData.length;
			var i:int;
			for (i = 0; i < picturesData.length; i++) {
				picturesData[i].loadPicture(onLoadingPictureComplete);
			}
		}
		
		private function onLoadingPictureComplete():void {
			loadersCounter--;			
			if (loadersCounter == 0) {
				prepareCallBack();			
			}
		}
		
		public function Show():void {			
			var i:int;
			for (i = 0; i < picturesData.length; i++) {
				if (picturesData[i].animated) {
					AnimatorManager.GetAnimatorById(picturesData[i].animator).Animate(picturesContainer, picturesData[i].bitmap, picturesData[i]);
				} else {
					picturesContainer.addChild(picturesData[i].bitmap);
				}
			}
		}
	}
}