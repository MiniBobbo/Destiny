package entities.gameentites;

import ai.AIState;
import entities.Attack;
import entities.Entity;
import entities.gameentites.Enemy.EnemyState;
import flixel.FlxG;
import flixel.tile.FlxTilemap;

enum EnemyState {
	PATROL;
	ATTACK;
}

/**
 * ...
 * @author Dave
 */
class Enemy extends Entity 
{

	var lastHitID:Int;
	
	var enemyState:EnemyState;
	
	public function new(collisionMap:FlxTilemap) 
	{
		super(collisionMap);
		this.collisionMap = collisionMap;
		enemyState = EnemyState.PATROL;
	}
	
	override public function signal(signal:String, ?data:Dynamic) 
	{
		switch (signal) 
		{
			case 'hit':
				var a:Attack = cast data;
				var damage = a.strength;
				if (currentAIEnum == AIState.PASSIVE)
					damage *= 2;
				takeDamage(damage);
				
			default:
				
		}
	}
	
	
	
}