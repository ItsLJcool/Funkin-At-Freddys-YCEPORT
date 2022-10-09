//a
var stage:Stage = null;

function create() {
	stage = loadStage('bars');
}

function update(elapsed) {
	stage.update(elapsed);
}

function beatHit(curBeat) {
	stage.onBeat();
}
//a
var fazIP:Array<FlxText> = [];

function createPost() {
	PlayState.iconP1.antialiasing = PlayState.iconP2.antialiasing = PlayState.dad.antialiasing = PlayState.boyfriend.antialiasing = false;
}

function stepHit(curStep) {
	if (curStep == 1399) {
		fuckYouIPADRESS();
	}
}

function fuckYouIPADRESS() {
	for (i in 0...7){
		var ip:FlxText = new FlxText(-2000, 0, FlxG.width, "", 20);
		ip.setFormat(null, 50, 0xFF000000, "center");
		ip.text = "" + FlxG.random.int(5, 255);
		ip.screenCenter();
		ip.x += i * 150;
		fazIP.push(ip);
		add(fazIP[i]);
		ip.cameras = [camHUD];
		
		var dots:FlxText = new FlxText(-2000, 0, FlxG.width, "", 20);
		dots.setFormat(null, 50, 0xFF000000, "center");
		dots.text = ".";
		dots.screenCenter();
		dots.x = ip.x + 70;
		if(i != 3) {
			fazIP.push(dots);
			add(fazIP[i]);
		}
		dots.cameras = [camHUD];
	}
}