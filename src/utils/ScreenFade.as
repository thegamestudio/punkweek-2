package utils
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.NumTween;
	import net.flashpunk.utils.Ease;
	
	public class ScreenFade extends Entity
	{
		public var fader:NumTween = new NumTween(faderEnd);
		private var _fadeTime:Number;
		public var fade:Image = Image.createRect(FP.width, FP.height, 0);
		/**
		 * Tween completion callback.
		 */
		public var complete:Function;
		
		public function ScreenFade(fadeTime:Number=75,complete:Function=null)
		{
			super(0, 0, fade);
			layer = -1;
			_fadeTime = fadeTime;
			this.complete = complete;
			addTween(fader);
		}
		
		override public function update():void 
		{
			fade.alpha = fader.value;
			fade.x = FP.camera.x;
			fade.y = FP.camera.y;
		}
		
		/**
		 * Fades the splash screen in.
		 */
		public function fadeIn():void
		{
			fade.visible = true;
			this.active = true;
			fade.alpha = 1;
			fader.value = 1;
			fader.tween(1, 0, _fadeTime, Ease.cubeOut);
		}
		
		/**
		 * Fades the splash screen out.
		 */
		public function fadeOut():void
		{
			fade.visible = true;
			this.active = true;
			fade.alpha = 0;
			fader.value = 0;
			fader.tween(0, 1, _fadeTime, Ease.cubeIn);
		}
		
		/**
		 * When the fade tween completes.
		 */
		private function faderEnd():void
		{
			if (fader.value==0)
			{
				fade.visible = false;
				this.active = false;
			}
			complete();
		}
		
	}
}