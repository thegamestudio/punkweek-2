package
{	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	import worlds.*;
	
	[SWF(width=800, height=600, backgroundColor=0x003300)]
	public class Main extends Engine
	{
		
		public function Main()
		{
			super(800,600);
			FP.screen.color = 0x003300;
			//FP.console.enable();
		}
		
		override public function init():void
		{
			FP.screen.color = 0x003300;
			FP.world = new Title;
		}
	}
}