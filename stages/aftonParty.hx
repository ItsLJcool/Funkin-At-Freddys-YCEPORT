//a
var stage:Stage = null;
function create() {
	stage = loadStage('aftonParty');
    kids = new FlxSprite(-200,0);
    kids.frames = Paths.getSparrowAtlas('stages/aftonParty/front');
    kids.animation.addByPrefix('kids', 'front kids', 24, true);
    kids.animation.play('kids');
    kids.antialiasing = EngineSettings.antialiasing;
    kids.scale.set(2.5,2);    
    kids.updateHitbox();
    kids.screenCenter();
    PlayState.add(kids);
}
function update(elapsed) {
	stage.update(elapsed);
    PlayState.camFollow.y = 500;
    PlayState.camFollow.x = 600;
    FlxG.camera.focusOn(PlayState.camFollow.getPosition());
}
function beatHit(curBeat) {
	stage.onBeat();
}