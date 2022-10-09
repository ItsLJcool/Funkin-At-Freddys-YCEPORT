//Need Help Moving Camera On Character Change

function create() {
    defaultCamZoom = 0.9;
    boyfriend.x += 100;
    boyfriend.y += 50;
    dad.x += 50;
    gf.y += 160;
    gf.scrollFactor.set(1,1);

    carpet = new FlxSprite(-200,-200).loadGraphic(Paths.image('stages/matpat/MatPat_Carpet'));
    carpet.antialiasing = EngineSettings.antialiasing;
    carpet.scale.set(1,1);
    carpet.updateHitbox();
    PlayState.add(carpet);

    walls = new FlxSprite(-200,-200).loadGraphic(Paths.image('stages/matpat/MatPat_Walls'));
    walls.antialiasing = EngineSettings.antialiasing;
    walls.scale.set(1,1);
    walls.updateHitbox();
    PlayState.add(walls);

    couch = new FlxSprite(-200,-200).loadGraphic(Paths.image('stages/matpat/MatPat_Couch'));
    couch.antialiasing = EngineSettings.antialiasing;
    couch.scale.set(1,1);
    couch.updateHitbox();
    PlayState.add(couch);

    table = new FlxSprite(-300,-200).loadGraphic(Paths.image('stages/matpat/MatPat_Table'));
    table.antialiasing = EngineSettings.antialiasing;
    table.scale.set(1,1);
    table.updateHitbox();
    PlayState.add(table);

    background = new FlxSprite(-200,-200).loadGraphic(Paths.image('stages/matpat/Background'));
    background.antialiasing = EngineSettings.antialiasing;
    background.scale.set(1,1);
    background.scrollFactor.set();
    background.updateHitbox();
    background.visible = false;
    PlayState.add(background);

    gt = new FlxSprite(50,100);
    gt.frames = Paths.getSparrowAtlas('stages/matpat/gt logo');
    gt.animation.addByPrefix('stat', 'gt logo stat', 24, true);
    gt.animation.addByPrefix('left', 'gt logo tl', 24, true);
    gt.animation.addByPrefix('right', 'gt logo tr', 24, true);
    gt.animation.addByPrefix('down', 'gt logo bl', 24, true);
    gt.animation.addByPrefix('up', 'gt logo br', 24, true);
    gt.animation.addByPrefix('shine', 'gt logo shine', 24, true);
    gt.animation.addByPrefix('shinestat', 'gt logo stashine', 24, true);
    gt.scrollFactor.set();
    gt.animation.play('stat');
    gt.antialiasing = EngineSettings.antialiasing;
    gt.scale.set(0.6,0.6);
    gt.updateHitbox();
    gt.visible = false;
    PlayState.add(gt);

    floor = new FlxSprite(-200,-200).loadGraphic(Paths.image('stages/matpat/Floor'));
    floor.antialiasing = EngineSettings.antialiasing;
    floor.scale.set(1,1);
    floor.updateHitbox();
    floor.visible = false;
    PlayState.add(floor);
    
    dadSecondCharacter= new Character(300, 80, mod + ":" + "matpat-pixel");
    PlayState.dads.push(dadSecondCharacter);
    dadSecondCharacter.visible = false; 
    PlayState.add(dadSecondCharacter);
    
    bfSecondCharacter = PlayState.boyfriend; 
  
    bfSecondCharacter = new Boyfriend(800,100, mod + ":" + "bf-matpat");
    bfSecondCharacter.visible = false; 
    PlayState.boyfriends.push(bfSecondCharacter);
    PlayState.add(bfSecondCharacter);
}

function createPost() {
    iconP1.changeCharacter(mod + ":bf-matpat");
}

function onGenerateStaticArrows() {
    whiteScreen = new FlxSprite(-600, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFFFFFFFF);
    whiteScreen.alpha = 0;
    PlayState.add(whiteScreen);

    greenscreen = new FlxSprite(-600, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFF00FF15);
    greenscreen.alpha = 0;
    PlayState.add(greenscreen);
}

function stepHit(curStep) {
    if(curStep == 256) {
        gt.visible = true;
        background.visible = true;
        floor.visible = true;
        gf.visible = false;
        dad.visible = false;
        boyfriend.visible = false;
        bfSecondCharacter.visible = true; 
        dadSecondCharacter.visible = true; 
        gt.animation.play('left');
    }
    if(curStep == 260) {
        gt.animation.play('right');
    }
    if(curStep == 264) {
        gt.animation.play('down');
    }
    if(curStep == 266) {
        gt.animation.play('up');
    }
    if(curStep == 270) {
        gt.animation.play('shine');
    }
    if(curStep == 272) {
        gt.animation.play('shinestat');
        defaultCamZoom = 1.2;
        gt.scrollFactor.set(0.7,0.7);
        defaultCamZoom = 1.5;
        PlayState.camHUD.zoom += 2;
    }
    if(curStep == 576) {
        whiteScreen.alpha = 1;
        FlxTween.tween(whiteScreen, {alpha: 0}, 1);
        gt.visible = false;
        background.visible = false;
        floor.visible = false;
        gf.visible = true;
        dad.visible = true;
        boyfriend.visible = true;
        bfSecondCharacter.visible = false; 
        dadSecondCharacter.visible = false; 
    }
    if(curStep == 960) {
        greenscreen.alpha = 1;
        FlxTween.tween(greenscreen, {alpha: 0}, 1);
        gt.visible = true;
        background.visible = true;
        floor.visible = true;
        gf.visible = false;
        dad.visible = false;
        boyfriend.visible = false;
        bfSecondCharacter.visible = true; 
        dadSecondCharacter.visible = true;
        defaultCamZoom = 1.2;
    }
    if(curStep == 1088) {
        whiteScreen.alpha = 1;
        FlxTween.tween(whiteScreen, {alpha: 0}, 1);
        gt.visible = false;
        background.visible = false;
        floor.visible = false;
        gf.visible = true;
        dad.visible = true;
        boyfriend.visible = true;
        bfSecondCharacter.visible = false; 
        dadSecondCharacter.visible = false; 
        defaultCamZoom = 0.9;
    }
}

function update() {
    if(!dad.visible) {
        PlayState.camFollow.y = 600;
    }
}