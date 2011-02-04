package utils
{
	import net.flashpunk.FP;
	
	public class Quake
	{
		protected var intensity:Number=0;
		
		protected var timer:Number=0;
		
		public function start(intensity:Number=0.5, duration:Number=0.5):void
		{
			stop();
			this.intensity = intensity * 0.05;
			timer = duration;
		}
		
		public function stop():void
		{
			FP.screen.x = 0;
			FP.screen.y = 0;
			intensity = 0;
			timer = 0;
		}
		
		public function update():void
		{
			if(timer > 0)
			{
				timer -= FP.elapsed;
				if(timer <= 0)
				{
					stop();
				}
				else
				{
					FP.screen.x = (Math.random()*intensity*FP.width*2-intensity*FP.width)*0.5;
					FP.screen.y = (Math.random()*intensity*FP.height*2-intensity*FP.height)*0.5;
				}
			}
		}
	}
}