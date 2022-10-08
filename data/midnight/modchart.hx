//a
function update() {
    PlayState.camFollow.y = 720;
    PlayState.camFollow.x = 1000;
    FlxG.camera.focusOn(PlayState.camFollow.getPosition());
}

function onGenerateStaticArrows() {
    blackScreen = new FlxSprite(-600, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFF000000);
    blackScreen.alpha = 0.0001;
    PlayState.add(blackScreen);
}

function alphaScreens(value1) {
    var charType:Int = Std.parseInt(value1);
    if(Math.isNaN(charType)) charType = 0;

    switch(charType) {
        case 0:
            blackScreen.alpha = 0.4;
        case 1:
            blackScreen.alpha += 0.2;
        case 2:
            blackScreen.alpha = 1;
            camHUD.visible = false;
            FlxG.camera.flash(FlxColor.WHITE, 3);
    }
}