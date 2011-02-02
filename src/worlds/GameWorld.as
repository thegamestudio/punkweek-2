package worlds
{
	import net.flashpunk.World;
	import players.*
	
	public class GameWorld extends World
	{
		public function GameWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			V.pPlayer = Player(add(new Player()));
			V.pCloner = Cloner(add(new Cloner()));
		}
	}
}