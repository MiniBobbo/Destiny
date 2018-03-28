package entities.gameentites;

import ai.AIDetect;
import ai.AIState;
import ai.AIXBowMinion;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author Dave
 */
class XBowMinion extends Enemy 
{

		public function new(collisionMap:FlxTilemap) 
	{
		super(collisionMap);
		acceleration.y = H.GRAVITY;
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('stand', 'xbowminion_stand', 4);
		animation.addByPrefix('move', 'xbowminion_move', 4);
		animation.addByPrefix('angry', 'xbowminion_angry_', 4);
		animation.addByPrefix('angrymove', 'xbowminion_angrymove', 12);
		animation.addByPrefix('fire', 'xbowminion_fire', 12);
		animation.addByPrefix('reload', 'xbowminion_reload', 6);
		animation.addByPrefix('hit', 'xbowminion_hit', 12, false);
		animation.play('stand');
		
		hp = 2;
		
		drag.x = 1500;
		setSize(40, 50);
		centerOrigin();
		centerOffsets();
		offset.y += 72;
		
		addAIStateToMap(AIState.PASSIVE, new AIDetect(this));
		addAIStateToMap(AIState.ACTIVE, new AIXBowMinion(this));
		changeAIState(AIState.PASSIVE);
	}
}