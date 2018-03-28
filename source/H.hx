package;
import entities.Attack;
import entities.Entity;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.math.FlxRect;
import tmxtools.TmxRect;

/**
 * ...
 * @author Dave
 */
class H
{

	//Holds a copy of the game data.  This is the one that should be updated.
	public static var gd:GameData;
	
	public static var paused:Bool = false;
	public static var allowInput:Bool = true;
	public static var health:Int = 0;
	public static var textureAtlas:FlxAtlasFrames;
	public static var attacks:FlxTypedGroup<FlxSprite>;
	
	public static var ENEMY_FLICKER_TIME:Float = .2;
	
	public static var GRAVITY:Float = 1200;
	
	public static var bgScrollValue:FlxPoint;
	
	public static var ps:PlayState;

	public static var r:FlxRandom;
	
	public static function getScrollValue():FlxPoint {
		if (bgScrollValue == null)
		bgScrollValue = new FlxPoint(.8, .8);
		return bgScrollValue;
	}
	
	public static function distanceBetween(e1:Entity, e2:Entity):Float {
		return e1.getPosition().distanceTo(e2.getPosition());
	}
	
	/**
	 * Takse a number and returns the path to the TMX file.
	 * @param	i number of the level to load.
	 * @return	The path to the TMX file.
	 */
	public static function getLevel(i:Int):String {
		switch (i) 
		{
			case 0:
				return 'assets/data/temple2.tmx';
			case 1:
				return 'assets/data/temple1.tmx';
			case 2:
				return 'assets/data/thepit.tmx';
			case 3:
				return 'assets/data/forest1.tmx';
			case 4:
				return 'assets/data/forest2.tmx';
				
				
			default:
				return 'assets/data/TestMap.tmx';
		}
	}
	
	public static function getTileset(i:Int):String {
		switch (i) 
		{
			case 1:
					return 'templemgsheet';
			case 3:
					return 'forestTileset';
			case 4:
					return 'forestTileset';
					
			
			default:
				return 'templemgsheet';
		}
	}
	public static function getBGTileset(i:Int):String {
		switch (i) 
		{
			case 1:
					return 'templemgsheet';
			case 3:
					return 'forestTileset';
			case 4:
					return 'forestTileset';
			default:
				return 'templemgsheet';
		}
	}
	
	public static function initPackedTexture() {
		//FlxG.log.add('added packed texture in H');
		textureAtlas = FlxAtlasFrames.fromTexturePackerJson("assets/images/packed.png", "assets/images/packed.json");
		
	}
	
	public static function worldToTileLocation(p:FlxPoint):FlxPoint {
		p.x = Math.floor(p.x / 64) * 64;
		p.y = Math.floor(p.y / 64) * 64;
		
		return p;
	}

	/**
	 * Changes a TmxRect object to fill the tile that it is in.  
	 * So a rect drawn in the center of a tile will expand to fill the entire tile.
	 * Measured from the upper left point
	 * @param	rect	The rect to change.
	 */
	public static function rectToTile(rect:TmxRect) {
		var startPoint = worldToTileLocation(FlxPoint.weak(rect.r.x, rect.r.y));
		rect.r.x = startPoint.x;
		rect.r.y = startPoint.y;
		rect.r.width = 64;
		rect.r.height = 64;
	}
	
	public static function rectToRects(rect:TmxRect):Array<TmxRect> {
		var startPoint = worldToTileLocation(FlxPoint.weak(rect.r.x, rect.r.y));
		var width:Int = Std.int((rect.r.width / 64) + 1);
		var height:Int = Std.int((rect.r.height / 64) + 1);
		
		var newrects:Array<TmxRect> = [];
		
		for (w in 0...width) {
			for (h in 0...height) {
				var newr:TmxRect = {
				name:rect.name,
				properties:rect.properties,
				r: new FlxRect(startPoint.x + (w * 64), startPoint.y + (h * 64), 64, 64)};
				newrects.push(newr);
			}
		}
		
		return newrects;
	}
	
	public static function setPlaystate(playState:PlayState) {
		ps = playState;
	}
	
	public static function signalAll(signal:String, ?data:Dynamic) {
		H.ps.entities.forEachAlive(function(e:Entity) { e.signal(signal); } );
	}
	
	public static function getIndexesByPrefix(frames:FlxAtlasFrames, prefix:String):Array<Int> {
		var ret:Array<Int> = [];
		
		for (i in 0...frames.frames.length) {
			if (StringTools.startsWith(frames.frames[i].name, prefix))
			ret.push(i);
			
		}
		
		return ret;
	}
	
}