package entities;
import entities.gameentites.Crystal;
import entities.gameentites.Door;
import entities.gameentites.Enemy;
import entities.gameentites.Hopper;
import entities.gameentites.Minion;
import entities.gameentites.Squid;
import entities.gameentites.Wallgun;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import tmxtools.TmxRect;

/**
 * ...
 * @author Dave
 */
class EnemyFactory 
{

	/**
	 * Creates an enemy and places it in the correct location and then returns it.
	 * @param	type	The type to create
	 * @param	rect	The rectangle to create it in.  really, just lines up the bottom
	 * @return	The new enemy.  Be sure to add it to the game.
	 */
	public static function createEnemy(type:String, rect:TmxRect, map:FlxTilemap):Enemy {
		var e:Enemy = null;
		switch (type) 
		{
			case 'hopper':
				e = new Hopper(map);
				H.rectToTile(rect);
				e.reset(rect.r.x, rect.r.bottom - 64);
			case 'minion':
				e = new Minion(map);
				H.rectToTile(rect);
				e.reset(rect.r.x, rect.r.bottom - e.height);
				
			case 'door':
				e = new Door(map, rect.properties.get('type') );
				H.rectToTile(rect);
				e.reset(rect.r.x, rect.r.y - 128);
				e.immovable = true;
				
			case 'crystal':
				e = new Crystal(map, rect.properties.get('type'));
				H.rectToTile(rect);
				e.reset(rect.r.x, rect.r.y);
				e.immovable = true;
			case 'wallgun':
				e = new Wallgun(map);
				H.rectToTile(rect);
				e.reset(rect.r.x, rect.r.y);
				e.immovable = true;
			
			case 'squid':
				e = new Squid(map);
				H.rectToTile(rect);
				e.reset(rect.r.x, rect.r.y);
			case 'acid':
				e = new Acid(map);
				H.rectToTile(rect);
				e.reset(rect.r.x,rect.r.y);
			default:
				
		}
		if (rect.properties.exists('facing'))
			e.flipX = true;
		
		return e;
	}
	
}