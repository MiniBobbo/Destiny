package entities.gameentites;
import entities.gameentites.Enemy.EnemyState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class Hopper extends Enemy 
{

	var attackDelay:Float;
	var delayBase:Float = 3;
	var delayVar:Float = 1;
	
	var jumpStrength:Float;
	
	public function new(collisionMap:FlxTilemap) 
	{
		super(collisionMap);
		acceleration.y = H.GRAVITY;
		enemyState = EnemyState.ATTACK;
		
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('stand', 'hopper_stand', 4);
		animation.play('stand');
		setSize(60, 50);
		centerOrigin();
		offset.y += 16;
	}
	
	
	
	
	
	override public function update(elapsed:Float):Void 
	{
		var touchFloor = isTouching(FlxObject.FLOOR);
		
		super.update(elapsed);
		//FlxG.log.add('Hopper Touching floor');
		switch (enemyState) 
		{
			//case EnemyState.ATTACK:
				//if (touchFloor) {
					//attackDelay -= elapsed;
					//var p = H.ps.player;
					//if (p.x < this.x) 
						//flipX = true;
					//else
						//flipX = false;
				//}
				//if (attackDelay <= 0 )
					//jump();
			default:
				
		}
		
	}
	
	private function jump() {
		FlxG.log.add('Jump');
		attackDelay = delayBase + FlxG.random.float(0, delayVar);
		var jumpVector = FlxPoint.get(0, jumpStrength);
		jumpVector.rotate(FlxPoint.weak(), FlxG.random.int(0, 50));
		jumpVector.y *= -1;
		if (flipX)
			jumpVector.x *= -1;
		velocity.copyFrom(jumpVector);
		jumpVector.put();
	}
	
}