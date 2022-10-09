import flixel.math.FlxRandom;

var fazIP:FlxTypedGroup<FlxText>;
var yeah:Array<Int> = [];
var rdm = new FlxRandom();

function createPost() {
	PlayState.iconP1.antialiasing = PlayState.iconP2.antialiasing = PlayState.dad.antialiasing = PlayState.boyfriend.antialiasing = false;

	fazIP = new FlxTypedGroup();
	add(fazIP);
	fazIP.visible = false;

	for (i in 0...4) {
		var ip:FlxText = new FlxText(-2000, 0, FlxG.width, "", 20);
		ip.setFormat(null, 50, 0xFF000000, "center");
		ip.text = FlxG.random.int(5, 255);
		ip.screenCenter();
		ip.x += i * 150;
		fazIP.add(ip);
		ip.cameras = [PlayState.camHUD];

		var dot:FlxText = new FlxText(-2000, 0, FlxG.width, ".", 20);
		dot.setFormat(null, 50, 0xFF000000, "center");
		dot.screenCenter();
		dot.x = ip.x + 70;
		if (i != 3)
			fazIP.add(dots);
		dot.cameras = [PlayState.camHUD];
	}
}

function stepHit(curStep) {
	if (curStep == 1399) {
		fazIP.visible = true;
	}
}