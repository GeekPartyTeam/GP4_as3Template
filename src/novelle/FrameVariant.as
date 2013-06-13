package novelle {
	import flash.display.*;
	import flash.text.*;
	/**
	 * ...
	 * @author Frost
	 */
	public class FrameVariant extends Sprite {
		
		private var layout:UI_frameVariant;
		private var textField:TextField;
		private var hit:MovieClip;
		public var data:VariantData;
		
		public function FrameVariant(data:VariantData) {
			this.data = data;
			layout = new UI_frameVariant();
			initLayout();
		}				
		
		private function initLayout():void {
			textField = layout.getChildByName('variantText') as TextField;
			textField.selectable = false;
			textField.text = data.text;	
			
			hit = layout.getChildByName('hit') as MovieClip;
			hit.buttonMode = true;			
			addChild(layout);
		}
	}
}