var bb:FlxSprite;
var canGlitchSalvage = false;
//a
function onGenerateStaticArrows() {
    puppet = new FlxSprite(0, -400);
    puppet.frames = Paths.getSparrowAtlas('stages/fright/phantom_poopet');
    puppet.animation.addByPrefix('scare', "phantom_poopet appear", 24);
    puppet.setGraphicSize(Std.int(puppet.width * 1.5));
    puppet.animation.play('scare');
    puppet.antialiasing = EngineSettings.antialiasing;
    puppet.cameras = [camHUD];
    add(puppet);

    if(EngineSettings.middleScroll == true){
        puppet.screenCenter(FlxAxes.X);
    } else {
        puppet.x = 650;
    }
    if(EngineSettings.downscroll == true){
        puppet.flipY = true;
        puppet.y = 600;
    }

    chica = new FlxSprite(0, 0);
    chica.frames = Paths.getSparrowAtlas('stages/fright/phantom_chica');
    chica.animation.addByPrefix('scare', "phantom_chica scare", 16);
    chica.alpha = 0;
    chica.antialiasing = EngineSettings.antialiasing;
    chica.cameras = [camHUD];
    add(chica);

    bb = new FlxSprite(0, 0);
    bb.frames = Paths.getSparrowAtlas('stages/fright/phantom_bb');
    bb.animation.addByPrefix('scare', "phantom_bb idle", 20);
    bb.animation.addByPrefix('empty', "phantom_bb empty", 20);
    bb.animation.play('empty');
    bb.alpha = 0;
    bb.antialiasing = true;
    bb.cameras = [camHUD];
    add(bb);
    
    salvageBlack = new FlxSprite(-600, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFF000000);
    salvageBlack.alpha = 1;
    salvageBlack.cameras = [camHUD];
    salvageBlack.screenCenter();
    add(salvageBlack);

    glitchSixAM = new FlxSprite(0, 0);
    glitchSixAM.frames = Paths.getSparrowAtlas('stages/fright/nightBeatGlitch');
    glitchSixAM.animation.addByPrefix('glitch', "glitch", 12);
    glitchSixAM.alpha = 0;
    glitchSixAM.antialiasing = false;
    glitchSixAM.screenCenter(FlxAxes.X);
    glitchSixAM.setGraphicSize(Std.int(glitchSixAM.width * 2));
    glitchSixAM.animation.play('glitch');
    glitchSixAM.cameras = [camHUD];
    add(glitchSixAM);

    sixAM = new FlxSprite(0, 0);
    sixAM.frames = Paths.getSparrowAtlas('stages/fright/6am');
    sixAM.animation.addByPrefix('static', "6am static", 24);
    sixAM.animation.addByPrefix('chime', "6am chime", 24);
    sixAM.alpha = 0;
    sixAM.antialiasing = false;
    sixAM.screenCenter();
    sixAM.cameras = [camHUD];
    add(sixAM);

    nightNewGlitch = new FlxSprite(0, 0);
    nightNewGlitch.frames = Paths.getSparrowAtlas('stages/fright/newNightGlitch');
    nightNewGlitch.animation.addByPrefix('glitch', "newNightGlitch glitch", 12);
    nightNewGlitch.antialiasing = false;
    nightNewGlitch.screenCenter();
    nightNewGlitch.alpha = 0;
    nightNewGlitch.cameras = [camHUD];
    add(nightNewGlitch);

    nightNewSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/fright/5thNight'));
    nightNewSprite.antialiasing = false;
    nightNewSprite.screenCenter();
    nightNewSprite.alpha = 0;
    nightNewSprite.cameras = [camHUD];
    add(nightNewSprite);
}

function create() {
    autoCamZooming = false;
    defaultCamZoom = 1;
}

function stepHit(curStep:Int) {
    switch(curStep) {
        case 1:
            nightNewSprite.alpha = 1;
            nightNewGlitch.alpha = 1;
            nightNewGlitch.animation.play('glitch');
        case 5:
            nightNewGlitch.alpha = 0;
        case 25:
            FlxTween.tween(nightNewSprite, {alpha: 0}, 3);
        case 64: 
            autoCamZooming = true;
            salvageBlack.alpha = 0;
            FlxG.camera.zoom = 0.7;
            defaultCamZoom = 1;
            camHUD.zoom += 2.4;
    }
}

function poopet(value1) {
    var charType:Int = Std.parseInt(value1);
    if(Math.isNaN(charType)) charType = 0;
            
    switch(charType) {
        case 0:
            if(EngineSettings.downscroll == true)
                FlxTween.tween(puppet, { y: 300}, 1.5);
            else
                FlxTween.tween(puppet, { y: FlxG.height - 650}, 1.5);
        case 1:
            if(EngineSettings.downscroll == true)
                FlxTween.tween(puppet, { y: 600}, 3);
            else
                FlxTween.tween(puppet, { y: -400}, 3);
    }
}

function babyBoy() {
    trace("OH MY GOD");
        bb.alpha = 1;
        bb.animation.play('scare');
        FlxTween.tween(bb, {alpha: 0}, 2, {onComplete:
            function (twn:FlxTween) {
                bb.animation.play('empty');
            }
        });
}

function chicamoment(value1) {
    var charType:Int = Std.parseInt(value1);
    if(Math.isNaN(charType)) charType = 0;
                
    switch(charType) {
        case 1:
            chica.alpha = 1;
            chica.animation.play('scare');
            FlxG.sound.play(Paths.sound('jumpscare'));
            new FlxTimer().start(0.8, function(tmr:FlxTimer){
                chica.alpha = 0;
            });
    }
}

function sixam() {
    canGlitchSalvage = false;
    sixAM.animation.play('static');
    autoCamZooming = false;

    FlxTween.tween(salvageBlack, {alpha: 1}, 1);
    FlxTween.tween(sixAM, {alpha: 1}, 1, {onComplete:
        function (twn:FlxTween) {
            canGlitchSalvage = true;
            new FlxTimer().start(5.1, function(tmr:FlxTimer){
                canGlitchSalvage = false;
                glitchSixAM.alpha = 0;
            });
        }
    });
}

function update() {
    if(glitchSixAM.animation.curAnim.curFrame == 5){
        if(canGlitchSalvage){
            glitchSixAM.alpha = 1;
            glitch6amY = FlxG.random.int(300, 380);
            sixAM.animation.play('chime');
            glitchSixAM.y = glitch6amY;
        }
    }
}