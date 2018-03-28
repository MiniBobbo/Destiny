package entities.gameentites;

import ai.AIDetect;
import ai.AIMinion;
import ai.AIState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author Dave
 */
class Minion extends Enemy 
{

	public function new(collisionMap:FlxTilemap) 
	{
		super(collisionMap);
		acceleration.y = H.GRAVITY;
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('stand', 'minion_stand', 4);
		animation.addByPrefix('move', 'minion_move', 4);
		animation.addByPrefix('angry', 'minion_angry_', 4);
		animation.addByPrefix('angrymove', 'minion_angrymove', 12);
		animation.addByPrefix('swingready', 'minion_swingready', 12, false);
		animation.addByPrefix('swingsword', 'minion_swingsword', 12, false);
		animation.addByPrefix('hit', 'minion_hit', 12, false);
		animation.play('stand');
		
		hp = 2;
		
		drag.x = 1500;
		setSize(40, 50);
		centerOrigin();
		centerOffsets();
		offset.y += 72;
		
		addAIStateToMap(AIState.PASSIVE, new AIDetect(this));
		addAIStateToMap(AIState.ACTIVE, new AIMinion(this));
		changeAIState(AIState.PASSIVE);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
	
}