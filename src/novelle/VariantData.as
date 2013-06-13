package novelle {
	/**
	 * ...
	 * @author Frost
	 */
	public class VariantData {
		
		public var gotoFrame:int;
		public var text:String;
		
		public function VariantData(config:Object) {
			gotoFrame = parseInt(config.gotoFrame);
			text = config.text;
		}		
	}
}