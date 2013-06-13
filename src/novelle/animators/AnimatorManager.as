package novelle.animators {
	/**
	 * ...
	 * @author Frost
	 */
	public class AnimatorManager {
		
		public static function GetAnimatorById(id:int):IAnimator {
			switch (id) {
				case 1:
					return new Animator_1() as IAnimator;					
				case 2:
					return new Animator_2() as IAnimator;					
				case 3:
					return new Animator_3() as IAnimator;
				case 4:
					return new Animator_4() as IAnimator;
			}
			return null;
		}
	}
}