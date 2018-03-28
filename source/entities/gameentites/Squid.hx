package entities.gameentites;

import ai.AIDetect;
import ai.AISquid;
import ai.AIState;
import entities.Entity;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author Dave
 */
class Squid extends Enemy 
{

	public function new(collisionMap:FlxTilemap) 
	{
		super(collisionMap);
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('idle', 'squid_idle', 8);
		animation.addByPrefix('follow', 'squid_follow', 8);
		animation.play('idle');
		setSize(64, 64);
		centerOffsets();
		centerOrigin();

		hp = 1;
		collideMap = false;
		addAIStateToMap(AIState.PASSIVE, new AIDetect(this));
		addAIStateToMap(AIState.ACTIVE, new AISquid(this));
		changeAIState(AIState.PASSIVE);
	}
	
	override public function update(elapsed:Float):Void 
	{
		angle = FlxPoint.weak(0, 1).angleBetween(velocity);
		super.update(elapsed);
	}
	
	override public function overlapEntity(entity:Entity, ?data:Dynamic) 
	{
		if (Std.is(entity, Player)) {
			entity.takeDamage(1);
			var a = FlxPoint.get(0, -400);
			a.rotate(FlxPoint.weak(), entity.getMidpoint().angleBetween(this.getMidpoint()));
			velocity.copyFrom(a);
			a.put();
		}
	}
	
}