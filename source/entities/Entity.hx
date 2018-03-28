package entities;

import ai.AI;
import ai.AIState;
import entities.movestates.MoveState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tile.FlxTilemap;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Dave
 */
class Entity extends FlxSprite
{

	public var collisionMap(default, null):FlxTilemap;

	
	var currentMoveEnum:MovementStateEnum;
	var currentMoveState:MoveState;
	var currentAIEnum:AIState;
	var currentAIState:AI;
	var moveStateMap:Map<MovementStateEnum, MoveState>;
	var restoreSize:Float = 0;
	
	public var attack(default, null):Attack;
	
	var aiStateMap:Map<AIState, AI>;
	
	//What is the ID of the last hit on this entity?  Basically allows an entity to not be hit by the same attack multiple times.
	public var IDLastAttackHit(default, null):Int;
	
	//How many HP does this entity have?  If -1, then it is invincible.
	public var hp:Int = -1;
	
	public function new(collisionMap:FlxTilemap) 
	{
		super();
		this.collisionMap = collisionMap;
		moveStateMap = new Map<MovementStateEnum, MoveState>();
		aiStateMap = new Map<AIState, AI>();
	}
	
	public function addAIStateToMap(aiState:AIState, ai:AI) {
		aiStateMap.set(aiState, ai);
	}
	
	
	public function addMoveStateToMap(moveStateEnum:MovementStateEnum, moveState:MoveState) {
		moveStateMap.set(moveStateEnum, moveState);
	}
	
	public function changeAIState(newState:AIState) {
		FlxG.log.add('Changing state');
		if (!aiStateMap.exists(newState))
			return;
		if (currentAIState != null) {
			currentAIState.changeFrom();
		}
		currentAIState = aiStateMap.get(newState);
		currentAIState.changeTo();
		currentAIEnum = newState;
	}
	
	public function changeMoveState(newState:MovementStateEnum) {
		if (!moveStateMap.exists(newState))
			return;
		if (currentMoveState != null) {
			currentMoveState.changeFrom();
		}
		currentMoveState = moveStateMap.get(newState);
		currentMoveState.changeTo();
		currentMoveEnum = newState;
	}
	
	/**
	 * When two entities overlap, this is passed to each entity.  
	 * @param	entity  The entity that overlaps with this one.
	 * @param   data	Misc data.  This can be anything.
	 */
	public function overlapEntity(entity:Entity, ?data:Dynamic) {
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (H.paused)
		return;
		if (currentAIState != null)
			currentAIState.update(elapsed);
		
		super.update(elapsed);
	}
	
	/**
	 * Sends a signal to this entity.  Use H.signal to send it to all entities.  Override this on entities to do something.
	 * @param	signal  The signal to send.
	 * @param	data	Optional data parameter.
	 */
	public function signal(signal:String, ?data:Dynamic) {
		
	}
	
	public function takeDamage(damage:Int = 1) {
		if (hp == -1)
		return;
		if (FlxSpriteUtil.isFlickering(this))
		return;
		hp -= damage;
		FlxSpriteUtil.flicker(this, .3);
		if (hp <= 0) {
			if (attack != null)
				attack.kill();
			FlxSpriteUtil.fadeOut(this, .3, function(_) { this.kill(); } );
		}
	}
	
	/**
	 * Shrinks the hitbox down from the top, leaving the bottom of the hitbox in the same place.
	 * @param	percent		The percent to shrink the hitbox.
	 */
	public function shrinkHitboxY(percent:Float = .5) {
		restoreSize = height;
		var bottom = y + height;
		var change = height * percent;
		height = change;
		y += change;
		offset.y += change;
		
	}
	
	public function restoreHitboxY() {
		var bottom = y + height;
		var change = restoreSize - height;
		y -= change;
		height = restoreSize;
		offset.y -= change;
		
	}
	
	public function dropDown() {
		y += 4;
	}
	
	public function registerAttack(a:Attack) {
		attack = a;
	}
	
	public function releaseAttack() {
		attack = null;
	}
	
}