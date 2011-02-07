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
		[Embed(source="../assets/graphics/clone.png")] public static const GFX_CLONE:Class;
		[Embed(source="../assets/graphics/baby-particle.png")] public static const GFX_BABY_PARTICLE:Class;
		[Embed(source="../assets/graphics/background.png")] public static const GFX_BACKGROUND:Class;
		[Embed(source="../assets/graphics/friendship.png")] public static const GFX_FRIENDSHIP:Class;
		[Embed(source="../assets/graphics/kitten.png")] public static const GFX_KITTEN:Class;
		[Embed(source="../assets/graphics/boss.png")] public static const GFX_BOSS:Class;
		[Embed(source="../assets/graphics/b-ear.png")] public static const GFX_BOSSEAR:Class;
		[Embed(source="../assets/graphics/b-nose.png")] public static const GFX_BOSSNOSE:Class;
		[Embed(source="../assets/graphics/b-tongue.png")] public static const GFX_BOSSTONGUE:Class;
		[Embed(source="../assets/graphics/winscreen.png")] public static const GFX_WIN:Class;
		[Embed(source="../assets/graphics/losescreen.png")] public static const GFX_LOSE:Class;
		[Embed(source="../assets/graphics/title.png")] public static const GFX_TITLE:Class;
		[Embed(source="../assets/graphics/instructions.png")] public static const GFX_INSTRUCTIONS:Class;
		
		// Sounds
		[Embed(source = '../assets/sound/sound.swf', symbol = 'babycry')] public static const SFX_BABYCRY:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'babygiggle')] public static const SFX_BABYGIGGLE:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'woofwoof')] public static const SFX_WOOF:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'dog_hit')] public static const SFX_DOGHIT:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'man_hit')] public static const SFX_MANHIT:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'tiger_hit')] public static const SFX_TIGERHIT:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'cat_die')] public static const SFX_CATEXIT:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'meow')] public static const SFX_CATENTER:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'bosshit')] public static const SFX_BOSSHIT:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'bosskill')] public static const SFX_BOSSKILL:Class;
		[Embed(source = '../assets/sound/sound.swf', symbol = 'title')] public static const SFX_TITLE:Class;
		
		// Bullet values.
		public static const SPEED_BULLET:uint = 400;
		public static const ACC_BULLET:uint = 5;
		
		// Fetus values
		public static const SPEED_FETUS:uint = 500;
		
		// Player values.
		public static const SPEED_PLAYER:uint = 400;
		
		// Cloner values.
		public static const SPEED_CLONER:uint = 300;
		public static const RATE_SHOOT:Number = 0.1;
		
		// Enemy values.
		public static const SPEED_ENEMY_SHOOT:uint = 500;
		public static const RATE_ENEMIES:Number = 0.5;
		public static const DAMAGE_ENEMY:Number = 10;
		
		
		// Friendship values.
		public static const RATE_COLLIDE_DAMAGE:Number = 50;
		public static const RATE_FRIENDSHIP_GAIN:Number = 10;
		
		// Background values.
		public static const SPEED_SCROLL:uint = 50;
		
		// Types
		public static const TYPE_CLONER:String = "cloner";
		public static const TYPE_PLAYER:String = "player";
		public static const TYPE_BULLET:String = "bullet";
		public static const TYPE_FETUS:String = "fetus";
		public static const TYPE_ENEMY:String = "enemy";
	}
}