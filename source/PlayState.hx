package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.FlxG;
import flxanimate.motion.AdjustColor;

class PlayState extends FlxState
{
	var adjust = new AdjustColor();
	var adjust:AdjustColor = null;

	override public function create()
	{
		adjust.brightness = 0;
		adjust.contrast = 0;
		adjust.saturation = 0;
		adjust.hue = 0;
		
		var background = FlxGridOverlay.create(10, 10);
		add(background);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		var bf = new FlxSprite(AssetPaths.bf__png);
		bf.screenCenter();
		bf.antialiasing = true;
		var shader = new AdjustShader();
		shader.matrix = adjust.calculateFinalFlatArray();
		bf.shader = shader.shader;
		add(bf);
		
		var filteredbf = new FlxSprite(bf.x + bf.width, bf.y, AssetPaths.filtered_bf__png);
		filteredbf.antialiasing = true;
		add(filteredbf);
		
		if (FlxG.keys.pressed.W)
			bf.shader.brightness -= elapsed * 0.1;
		if (FlxG.keys.pressed.S)
			bf.shader.brightness += elapsed * 0.1;
		if (FlxG.keys.pressed.R)
			bf.adjust.contrast -= elapsed * 0.1;
		if (FlxG.keys.pressed.F)
			bf.adjust.contrast += elapsed * 0.1;
		if (FlxG.keys.pressed.Y)
			bf.adjust.saturation -= elapsed * 0.1;
		if (FlxG.keys.pressed.H)
			bf.adjust.saturation += elapsed * 0.1;
		if (FlxG.keys.pressed.I)
			bf.adjust.hue -= elapsed * 0.1;
		if (FlxG.keys.pressed.K)
			bf.adjust.hue += elapsed * 0.1;
		
		super.update(elapsed);
	}
}
