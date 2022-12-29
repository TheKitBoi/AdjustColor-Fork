package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{

	var framerate:Int = 60;
	
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, PlayState, #if (flixel < "5.0.0") 1, #end framerate, framerate, true, false));
	}
}
