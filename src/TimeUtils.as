package {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Frost
	 */
	public class TimeUtils {
		
		public static function delay(time:int, operation:Function):void {
			var timer:Timer = new Timer(time, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent):void { operation(); } );
			timer.start();
		}		
	}
}