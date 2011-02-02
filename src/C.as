package
{
	public class C
	{
		[Embed(source="../assets/graphics/cloner.png")] public static const GFX_CLONER:Class;
		[Embed(source="../assets/graphics/player.png")] public static const GFX_PLAYER:Class;
		[Embed(source="../assets/graphics/bullet.png")] public static const GFX_BULLET:Class;
		[Embed(source="../assets/graphics/baby-cry.png")] public static const GFX_BABY_CRY:Class;
		[Embed(source="../assets/graphics/man-mask.png")] public static const MSK_MAN:Class;
		[Embed(source="../assets/graphics/dog-mask.png")] public static const MSK_DOG:Class;
		
		// Bullet values.
		public static const SPEED_BULLET:uint = 700;
		
		// Player values.
		public static const SPEED_PLAYER:uint = 200;
		
		// Cloner values.
		public static const SPEED_CLONER:uint = 150;
		public static const RATE_SHOOT:Number = 0.1;
		
		// Types
		public static const TYPE_CLONER:String = "cloner";
		public static const TYPE_PLAYER:String = "player";
	}
}