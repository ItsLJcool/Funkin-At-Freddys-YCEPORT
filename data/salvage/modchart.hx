function onCountdown(countdown:Int) {
    switch(countdown) {
        case 3:
        case 2:
        case 1:
        case 0:
    }
    return false;
}

function onGenerateStaticArrows() {
    blackScreen = new FlxSprite(-1000, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFF000000);
    blackScreen.alpha = 1;
    blackScreen.cameras = [PlayState.camHUD];
    PlayState.add(blackScreen);

    night = new FlxSprite(0, 0).loadGraphic(Paths.image("stages/fright/5thNight"));
    night.updateHitbox();
    night.screenCenter();
    night.setGraphicSize(Std.int(night.width * 1));
    night.cameras = [PlayState.camHUD];
    night.alpha = 0;
    PlayState.add(night);

    puppet = new FlxSprite(0, 0);
    if(EngineSettings.downscroll && EngineSettings.middleScroll) {
        puppet.x = 330;
        puppet.y = 570;
        puppet.flipY = true;
    } else if(EngineSettings.downscroll && !EngineSettings.middleScroll) {
        puppet.x = 650;
        puppet.y = 570;
        puppet.flipY = true;
    } else if(!EngineSettings.downscroll && !EngineSettings.middleScroll) {
        puppet.x = 650;
        puppet.y = -200;
    } else if(!EngineSettings.downscroll && EngineSettings.middleScroll) {
        puppet.x = 330;
        puppet.y = -200;
    }
    puppet.frames = Paths.getSparrowAtlas('stages/fright/phantom_poopet');
    puppet.animation.addByPrefix('poopet', 'phantom_poopet appear', 24, true);
    puppet.updateHitbox();
    puppet.scale.set(1,1);
    puppet.cameras = [PlayState.camHUD];
    add(puppet);

    glitch = new FlxSprite(-2000, 1000);
    glitch.frames = Paths.getSparrowAtlas('stages/fright/newNightGlitch');
    glitch.animation.addByPrefix('glitch', 'newNightGlitch glitch', 24, true);
    glitch.updateHitbox();
    glitch.screenCenter();
    glitch.scale.set(1,1);
    glitch.cameras = [PlayState.camHUD];
    glitch.alpha = 0;
    add(glitch);
}

function create() {
    autoCamZooming = false;
    defaultCamZoom = 1.5;
    PlayState.camHUD.zoom += 0.01;
}

function stepHit(curStep:Int) {
    if(curStep == 1) {
        night.alpha = 1;
        glitch.alpha = 1;
        glitch.animation.play('glitch');
    }
    if(curStep == 5) {
        glitch.alpha = 0;
    }
    if(curStep == 25) {
        FlxTween.tween(night, {alpha: 0}, 3);
    }
    if(curStep == 64) {
        autoCamZooming = true;
        blackScreen.alpha = 0;
        FlxTween.tween(camGame, {zoom: 1}, 0.5);
        PlayState.camHUD.zoom += 2;
        defaultCamZoom = 1;
    }
    if(curStep == 688) {
        poopet();
    }
}

function poopet() {
    puppet.animation.play('poopet');
    if(EngineSettings.downscroll && EngineSettings.middleScroll) {
        FlxTween.tween(puppet, {y: 370}, 1.5, {onComplete: function() {
            FlxTween.tween(puppet, {y: 570}, 3);
        }});
    } else if(EngineSettings.downscroll && !EngineSettings.middleScroll) {
        FlxTween.tween(puppet, {y: 370}, 1.5, {onComplete: function() {
            FlxTween.tween(puppet, {y: 570}, 3);
        }});
    } else if(!EngineSettings.downscroll && !EngineSettings.middleScroll) {
        FlxTween.tween(puppet, {y: -200}, 1.5, {onComplete: function() {
            FlxTween.tween(puppet, {y: 0}, 3);
        }});
    } else if(!EngineSettings.downscroll && EngineSettings.middleScroll) {
        FlxTween.tween(puppet, {y: -200}, 1.5, {onComplete: function() {
            FlxTween.tween(puppet, {y: 0}, 3);
        }});
    }
}