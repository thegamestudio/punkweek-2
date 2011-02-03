package
{	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	import worlds.*;
	
	[SWF(width=800, height=600)]
	public class Main extends Engine
	{
		
		public function Main()
		{
			super(800,600);
			//FP.console.enable();
		}
		
		override public function init():void
		{
			FP.screen.color = 0x00ff00;
			FP.world = new GameWorld;
		}
	}
}