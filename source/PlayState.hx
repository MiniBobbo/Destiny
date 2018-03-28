package;

import entities.Attack;
import entities.EnemyFactory;
import entities.Entity;
import entities.Player;
import entities.Zone;
import entities.gameentites.Crystal;
import entities.gameentites.Enemy;
import entities.zones.HelpMessageZone;
import entities.zones.SignalZone;
import entities.zones.TravelZone;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import inputhelper.InputHelper;
import tmxtools.TmxRect;
import tmxtools.TmxTools;

class PlayState extends FlxState
{
	var maps:TmxTools;
	public var entities:FlxTypedGroup<Entity>;
	public var zones:FlxTypedGroup<Zone>;
	var rects:Array<TmxRect>;
	
	
	public var collision(default, null):FlxTilemap;
	var bg:FlxTilemap;
	var mg:FlxTilemap;
	public var player(default, null):Player;
	
	var enemies:FlxTypedGroup<Enemy>;
	var playerAttacks:FlxTypedGroup<Attack>;
	var enemyAttacks:FlxTypedGroup<Attack>;
	
	var timeInLevel:Float = 0;
	
	public var helpText(default, null):FlxText;
	
	override public function create():Void
	{
		super.create();
		
		H.setPlaystate(this);
		helpText = new FlxText(FlxG.width * .1, FlxG.height * .1, FlxG.width * .8, '', 16);
		helpText.visible = false;
		helpText.setFormat(null, 16, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE_FAST, FlxColor.BLACK);
		helpText.scrollFactor.set();
		maps = getMap();
		
		entities = new FlxTypedGroup<Entity>();
		enemies = new FlxTypedGroup<Enemy>();
		zones = new FlxTypedGroup<Zone>();
		playerAttacks= new FlxTypedGroup<Attack>();
		enemyAttacks = new FlxTypedGroup<Attack>();
		
		collision = maps.getMap('collision');
		mg= maps.getMap('mg');
		FlxG.worldBounds.set(collision.width, collision.height);
		FlxG.camera.bgColor = FlxColor.fromRGBFloat(.2,0,.2);
		rects = maps.getTmxRectanges();
		
		//FlxG.watch.add(helpText, 'visible');
		
		placeZones();
		
		
		bg = maps.getMap('bg');
		if (bg != null)
			add(bg);
		add(mg);
		collision.visible = true;
		
		playerAttacks.add(player.attack);
		
		FlxG.watch.add(playerAttacks.members, 'length', 'Player attacks');
		FlxG.watch.add(enemies.members, 'length', 'enemies');
		//FlxG.watch.add('Player attacks: ' + playerAttacks.countLiving());
		add(player);
		add(enemies);
		add(enemyAttacks);
		add(playerAttacks);
		add(helpText);
		add(zones);
		FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER, 1);
		FlxG.camera.setScrollBoundsRect(0,0,collision.width, collision.height);
	}

	private function createPlayer(r:TmxRect) {
		player = new Player(collision);
		entities.add(player);
		player.setBottom(r.r.bottom);
		player.x = r.r.x;
		
		//add(player);
	}
	
	override public function update(elapsed:Float):Void
	{
		timeInLevel += elapsed;
		helpText.visible = false;
		InputHelper.updateKeys(elapsed);
		FlxG.overlap(player, enemies, playerOverlapEntity);
		FlxG.overlap(playerAttacks, enemies, attackHits);
		FlxG.overlap(enemyAttacks, collision, attackHitsMap);
		FlxG.overlap(enemyAttacks, player, attackHits);
		if(timeInLevel > .5)
			FlxG.overlap(entities, zones, EntityOverlapZone);
		FlxG.collide(player, collision);
		FlxG.collide(enemies, collision);
		super.update(elapsed);
	}
	
	public function attackHits(a:Attack, e:Entity) {
		if (a.ID != e.IDLastAttackHit && FlxG.pixelPerfectOverlap(a, e)) {
			e.signal('hit', a);
		}
		
	}
	
	public function attackHitsMap(a:Attack, collision:FlxTilemap) {
		a.hitMap();
	}
	
	public function playerOverlapEntity(p:Player, e:Entity) {
		p.overlapEntity(e);
		e.overlapEntity(p);
	}
	
	public function EntityOverlapZone(e:Entity, z:Zone) {
		z.overlapEntity(e);
	}
	
	/**
	 * Lazy loads an enemy attack object.
	 * @return	A new or recycled attack object.
	 */
	public function getEnemyAttack():Attack {
		var a = enemyAttacks.getFirstAvailable();
		if (a == null) {
			a = new Attack();
			enemyAttacks.add(a);
		}
			
		return a;
	}
	
	private function placeZones() {
		for (r in rects) {
			//FlxG.log.add(r);
			switch (r.name) 
			{
				case 'd':
					if (r.properties.get('type') == H.gd.checkpoint){
						createPlayer(r);
					}
				case 'enemy':
					var enemy = EnemyFactory.createEnemy(r.properties.get('type'), r, collision);
					enemies.add(enemy);
					entities.add(enemy);
				case 'message':
					var m:HelpMessageZone = new HelpMessageZone(r.r.x, r.r.y, r.r.width, r.r.height, r.properties.get('type'));
					zones.add(m);
				case 'travel':
					var type:String = r.properties.get('type');
					var s = type.split('_');
					var t = new TravelZone(r.r.x, r.r.y, r.r.width, r.r.height, Std.parseInt(s[0]), s[1]);
					zones.add(t);
				case 'door':
					var d = EnemyFactory.createEnemy('door', r, collision);
					entities.add(d);
					enemies.add(d);
				case 'signal':
					var s = new SignalZone(r.r.x, r.r.y, r.r.width, r.r.height, r.properties.get('type'));
					zones.add(s);
				case 'crystal':
					var c = EnemyFactory.createEnemy('crystal', r, collision);
					entities.add(c);
					enemies.add(c);
					
				default:
					trace( 'Problem with a zone.  ');
			}
		}
	}
	
	private function getMap() {
		switch (H.gd.world) 
		{
			case 1:
				return new TmxTools('assets/data/levels/1.tmx', 'assets/data/levels/');
			case 2:
				return new TmxTools('assets/data/levels/2.tmx', 'assets/data/levels/');
				
			default:
				return new TmxTools('assets/data/levels/1.tmx', 'assets/data/levels/');

		}
	}
	
	/**
	 * Removes this state and creates a new one.  Used when traveling or when the player dies.
	 */
	public function resetState() {
		FlxG.camera.fade(FlxColor.BLACK, .2, false, function() {
			var s = new PlayState();
			FlxG.switchState(s);
			
		});
	}
}
