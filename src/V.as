package
{
	import net.flashpunk.Sfx;
	
	import players.Cloner;
	import players.Player;
	
	import utils.Quake;

	public class V
	{
		public static var pPlayer:Player;
		public static var pCloner:Cloner;
		public static var SfxVolume:Number = 1;
		public static var MusicVolume:Number = 1;
		
		// Define global sounds.
		public static var BabyGiggle:Sfx = new Sfx(C.SFX_BABYGIGGLE);
		public static var BabyCry:Sfx = new Sfx(C.SFX_BABYCRY);
		
		public static var Friendship:Number = 100;
		
		public static var Shaker:Quake = new Quake();
		
		public static function PlaySfx(sfx:Sfx):void
		{
			try
			{
				sfx.play(V.SfxVolume);
			}
			catch (e:Error) {}
		}
	}
}