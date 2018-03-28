package entities;

import entities.gameentites.Enemy;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author Dave
 */
class Acid extends Enemy 
{

	public function new(collisionMap:FlxTilemap) 
	{
		super(collisionMap);
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('flow', 'acid_flow', 4);
		animation.play('flow');
		setSize(64, 64);

	}
	
}