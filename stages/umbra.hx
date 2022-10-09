//a
var stage:Stage = null;
var umbraZoom:Bool = false;
var sbStage:FlxSprite;
function create() {
    autoCamZooming = false;
	stage = loadStage('umbra');
	PlayState.remove(PlayState.boyfriend);
	PlayState.remove(PlayState.dad);

	sbStage = new FlxSprite(PlayState.dad.x - 950, -802);
	sbStage.frames = Paths.getSparrowAtlas('stages/sb/shadow_bonnie');
	sbStage.animation.addByPrefix('stage', "shadow_bonnie fredbear", 2);
	sbStage.animation.addByPrefix('static', "shadow_bonnie glitch", 12);
	sbStage.animation.addByPrefix('balloons', "shadow_bonnie balloon", 2);
	sbStage.animation.addByPrefix('chica', "shadow_bonnie chica", 2);
	sbStage.animation.addByPrefix('night', "shadow_bonnie mangle", 2);
	sbStage.animation.addByPrefix('cupcake', "shadow_bonnie cupcakes", 2);
	sbStage.animation.addByPrefix('puppet', "shadow_bonnie puppet", 2);
	sbStage.animation.addByPrefix('tree', "shadow_bonnie tree", 2);
	sbStage.animation.addByPrefix('happy', "shadow_bonnie happy", 2);
	//sbStage.scrollFactor.set(1,1);
	sbStage.setGraphicSize(Std.int(sbStage.width * 3.2));
	sbStage.antialiasing = false;
	sbStage.updateHitbox();
	sbStage.alpha = 0;
	add(sbStage);

	sbError = new FlxSprite(0, 200);
	sbError.frames = Paths.getSparrowAtlas('stages/sb/error');
	sbError.animation.addByPrefix('error', "error", 2);
	sbError.animation.play('error');
	sbError.antialiasing = false;
	sbError.setGraphicSize(Std.int(sbError.width * 3));
	sbError.updateHitbox();
	sbError.screenCenter(FlxAxes.X);
	sbError.x -= 350;
	sbError.alpha = 0;
	add(sbError);
	PlayState.gf.visible = false;

	PlayState.add(PlayState.boyfriend);
	PlayState.add(PlayState.dad);
	PlayState.dad.alpha = 0;
}
function update(elapsed) {
	stage.update(elapsed);
	if (umbraZoom){
		FlxG.camera.zoom = FlxMath.lerp(defaultCamZoom, FlxG.camera.zoom, boundTo(1 - (elapsed * 20), 0, 1));
		camHUD.zoom = FlxMath.lerp(1, camHUD.zoom, boundTo(1 - (elapsed * 20), 0, 1));
	}
	PlayState.camFollow.y += 40;
}

function boundTo(value:Float, min:Float, max:Float):Float {
	var newValue:Float = value;
	if(newValue < min) newValue = min;
	else if(newValue > max) newValue = max;
	return newValue;
}

function beatHit(curBeat) {
	stage.onBeat();
}

var canChangeBoner:Bool = false;
var sbAnims:Array<String> = ['stage', 'balloons', 'chica', 'night', 'cupcake', 'tree', 'puppet'];
function shadowBonerStageSwap(){
	if(canChangeBoner == true){
		var sbAnimPlay:Int = FlxG.random.int(0, sbAnims.length - 1);

		sbStage.animation.play('static');

		new FlxTimer().start(0.3, function(tmr:FlxTimer){
			if(canChangeBoner == true)
				sbStage.animation.play(sbAnims[sbAnimPlay]);
			else
				sbStage.animation.play('happy');
		});
	}
	else
		sbStage.animation.play('happy');
}

function onDadHit(note:Note) {
	if (!note.isSustainNote) {
	if(FlxG.random.int(0, 5) == 3)
		shadowBonerStageSwap();
	}
}

function ending() {
	canChangeBoner = false;
}
function FadeDad(?value1:Int = 0) {
	if (value1 == null) value1 = 0;
	var charType:Int = Std.parseInt(value1);
	if(Math.isNaN(charType)) charType = 0;
	switch(charType) {
		case 0:
			PlayState.dad.alpha += 0.2;
		case 1:
			PlayState.dad.alpha -= 0.4;
	}
}

function daError(value1:Int = 0) {
	var charType:Int = Std.parseInt(value1);
	if(Math.isNaN(charType)) charType = 0;
	switch(charType) {
		case 0:
			dad.alpha = 0;
			boyfriend.alpha = 0;
			camHUD.visible = false;
			sbError.alpha = 1;
		case 1:
			canChangeBoner = true;
			FlxG.camera.zoom += 1.2;
			camHUD.zoom += 2.4;
			dad.alpha = 1;
			boyfriend.alpha = 1;
			camHUD.visible = true;
			sbError.alpha = 0;
			umbraZoom = true;
			sbStage.alpha = 1;
	}
}