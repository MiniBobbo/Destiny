package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/0.tmx", "assets/data/levels/0.tmx");
			type.set ("assets/data/levels/0.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/1.tmx", "assets/data/levels/1.tmx");
			type.set ("assets/data/levels/1.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/2.tmx", "assets/data/levels/2.tmx");
			type.set ("assets/data/levels/2.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/3.tmx", "assets/data/levels/3.tmx");
			type.set ("assets/data/levels/3.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/32blocks.png", "assets/data/levels/32blocks.png");
			type.set ("assets/data/levels/32blocks.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/levels/32Blocks.tsx", "assets/data/levels/32Blocks.tsx");
			type.set ("assets/data/levels/32Blocks.tsx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/4.tmx", "assets/data/levels/4.tmx");
			type.set ("assets/data/levels/4.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/5.tmx", "assets/data/levels/5.tmx");
			type.set ("assets/data/levels/5.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/50blocks.png", "assets/data/levels/50blocks.png");
			type.set ("assets/data/levels/50blocks.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/levels/6.tmx", "assets/data/levels/6.tmx");
			type.set ("assets/data/levels/6.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/64blocks.png", "assets/data/levels/64blocks.png");
			type.set ("assets/data/levels/64blocks.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/levels/7.tmx", "assets/data/levels/7.tmx");
			type.set ("assets/data/levels/7.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/castle.png", "assets/data/levels/castle.png");
			type.set ("assets/data/levels/castle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/levels/finalRoom.tmx", "assets/data/levels/finalRoom.tmx");
			type.set ("assets/data/levels/finalRoom.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/monsterTest.tmx", "assets/data/levels/monsterTest.tmx");
			type.set ("assets/data/levels/monsterTest.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/stonetileset.png", "assets/data/levels/stonetileset.png");
			type.set ("assets/data/levels/stonetileset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/levels/test3.tmx", "assets/data/levels/test3.tmx");
			type.set ("assets/data/levels/test3.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/testlevel.tmx", "assets/data/levels/testlevel.tmx");
			type.set ("assets/data/levels/testlevel.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levels/testlevel2.tmx", "assets/data/levels/testlevel2.tmx");
			type.set ("assets/data/levels/testlevel2.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/32blocks.png", "assets/images/32blocks.png");
			type.set ("assets/images/32blocks.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/heroleap.png", "assets/images/heroleap.png");
			type.set ("assets/images/heroleap.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/herostand.png", "assets/images/herostand.png");
			type.set ("assets/images/herostand.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/main.png", "assets/images/main.png");
			type.set ("assets/images/main.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/mainAtlas.json", "assets/images/mainAtlas.json");
			type.set ("assets/images/mainAtlas.json", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/mainAtlas.png", "assets/images/mainAtlas.png");
			type.set ("assets/images/mainAtlas.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/portraits.json", "assets/images/portraits.json");
			type.set ("assets/images/portraits.json", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/portraits.png", "assets/images/portraits.png");
			type.set ("assets/images/portraits.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/titlebg.png", "assets/images/titlebg.png");
			type.set ("assets/images/titlebg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/titlefg.png", "assets/images/titlefg.png");
			type.set ("assets/images/titlefg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/mainloop.ogg", "assets/music/mainloop.ogg");
			type.set ("assets/music/mainloop.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/dead", "assets/sounds/dead");
			type.set ("assets/sounds/dead", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/sounds/dead.ogg", "assets/sounds/dead.ogg");
			type.set ("assets/sounds/dead.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/deflect", "assets/sounds/deflect");
			type.set ("assets/sounds/deflect", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/sounds/deflect.ogg", "assets/sounds/deflect.ogg");
			type.set ("assets/sounds/deflect.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/explode.ogg", "assets/sounds/explode.ogg");
			type.set ("assets/sounds/explode.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/explode.wav", "assets/sounds/explode.wav");
			type.set ("assets/sounds/explode.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/fire", "assets/sounds/fire");
			type.set ("assets/sounds/fire", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/sounds/fire.ogg", "assets/sounds/fire.ogg");
			type.set ("assets/sounds/fire.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Flames.ogg", "assets/sounds/Flames.ogg");
			type.set ("assets/sounds/Flames.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Flames.wav", "assets/sounds/Flames.wav");
			type.set ("assets/sounds/Flames.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/jump.ogg", "assets/sounds/jump.ogg");
			type.set ("assets/sounds/jump.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/jump.wav", "assets/sounds/jump.wav");
			type.set ("assets/sounds/jump.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/jump2.ogg", "assets/sounds/jump2.ogg");
			type.set ("assets/sounds/jump2.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/jump2.wav", "assets/sounds/jump2.wav");
			type.set ("assets/sounds/jump2.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/land.ogg", "assets/sounds/land.ogg");
			type.set ("assets/sounds/land.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/land.wav", "assets/sounds/land.wav");
			type.set ("assets/sounds/land.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/miniondeath.ogg", "assets/sounds/miniondeath.ogg");
			type.set ("assets/sounds/miniondeath.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/miniondeath.wav", "assets/sounds/miniondeath.wav");
			type.set ("assets/sounds/miniondeath.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/open.ogg", "assets/sounds/open.ogg");
			type.set ("assets/sounds/open.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/open.wav", "assets/sounds/open.wav");
			type.set ("assets/sounds/open.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/swoosh.ogg", "assets/sounds/swoosh.ogg");
			type.set ("assets/sounds/swoosh.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/swoosh.wav", "assets/sounds/swoosh.wav");
			type.set ("assets/sounds/swoosh.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
