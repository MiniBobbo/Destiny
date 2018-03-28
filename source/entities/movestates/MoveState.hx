package entities.movestates;
import entities.Entity;


enum MovementStateEnum {
	GROUND;
	AIR;
	CROUCHING;
	STANDING;
	ATTACKING;
}


/**
 * ...
 * @author Dave
 */
class MoveState 
{
	
	var entity:Entity;
	var nextState:MovementStateEnum;
	
	public function new(e:Entity) 
	{
		entity = e;
	}
	
	public function changeTo() {
		
	}
	
	public function changeFrom() {
		
	}
	
	public function update(dt:Float) {
		
	}
}