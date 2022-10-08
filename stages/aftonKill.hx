//a
var stage:Stage = null;
function create() {
	stage = loadStage('aftonKill');

    blood = new FlxSprite(100, 300);
    blood.frames = Paths.getSparrowAtlas('stages/aftonKill/blood');
    blood.animation.addByPrefix('blood', 'blood blood', 24, true);
    blood.scale.set(4, 4);
    blood.updateHitbox();
    blood.visible = false;
    PlayState.add(blood);

    dadSecondCharacter= new Character(450, 300, mod + ":" + "suitedAftonPanic");
    PlayState.dads.push(dadSecondCharacter);
    dadSecondCharacter.visible = false; 
    PlayState.add(dadSecondCharacter);
}
var altIdle1:Bool = false;
var altIdle2:Bool = false;
var altIdle3:Bool = false;
var altIdle4:Bool = false;

function update(elapsed) {
	stage.update(elapsed);
    PlayState.camFollow.y = 720;
    PlayState.camFollow.x = 1000;
    FlxG.camera.focusOn(PlayState.camFollow.getPosition());

	if (altIdle1 && dadSecondCharacter.animation.curAnim.name == "idle")
        dadSecondCharacter.animation.play('idle-alt');
	if (altIdle2 && dadSecondCharacter.animation.curAnim.name == "idle")
        dadSecondCharacter.animation.play('idle-alt1');
	if (altIdle3 && dadSecondCharacter.animation.curAnim.name == "idle")
        dadSecondCharacter.animation.play('idle-alt2');
	if (altIdle4 && dadSecondCharacter.animation.curAnim.name == "idle")
        dadSecondCharacter.animation.play('idle-alt3');
}
function beatHit(curBeat) {
	stage.onBeat();
}

function stepHit(curStep:Int) {
	switch (curStep) {
		case 784:
			dadSecondCharacter.visible = true; 
			dad.visible = false;
		case 1551:
			dadSecondCharacter.animation.play('drop');
			blood.visible = true;
			blood.animation.play('blood');
		case 1600:
			blood.visible = false;
		case 1712,1728,1744,1760,1776:
			boyfriend.alpha -= 0.2;
	}
    if(curStep >= 1552 && curStep <= 1617)
		altIdle1 = true;
    if(curStep >= 1617 && curStep <= 1648) {
		altIdle1 = false;
		altIdle2 = true; }
    if(curStep >= 1648 && curStep <= 1696) {
		altIdle2 = false;
		altIdle3 = true; }
    if(curStep >= 1696) {
		altIdle3 = false;
		altIdle4 = true; }
}