package ai;

import entities.Entity;

/**
 * ...
 * @author Dave
 */
class AIDead extends AI 
{

	public function new(ent:Entity) 
	{
		super(ent);
	}
	
	override public function changeTo() 
	{
		//e.animation.play('dead');
	}
}