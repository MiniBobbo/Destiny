package entities.gameentites;

import entities.Entity;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author Dave
 */
class Wallgun extends Enemy 
{

	var SHOT_DELAY:Float = 1.5;
	var SHOT_SPEED:Float = 400;
	var SHOT_LIFESPAN:Float = 5;
	
	var elapsedShot:Float;
	
	public function new(collisionMap:FlxTilemap) 
	{
		super(collisionMap);
		elapsedShot = SHOT_DELAY;
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('idle', 'wallgun_idle', 4);
		animation.addByPrefix('fire', 'wallgun_fire', 18, false);
		animation.play('idle');
		setSize(64, 64);

	}
	
	override public function overlapEntity(entity:Entity, ?data:Dynamic) 
	{
		FlxG.collide(this, entity);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		elapsedShot -= elapsed;
		if (elapsedShot <= 0) {
			elapsedShot = SHOT_DELAY;
			var s = H.ps.getEnemyAttack();
			var shotVel = FlxPoint.get(SHOT_SPEED, 0);
			if (flipX)
				shotVel.x *= -1;
			s.initAttack(shotVel, SHOT_LIFESPAN, 'ball');
			s.reset(x + 10, y + 10);
			
			//shotVel.put();
		}
	}
	
}