function create() {
    

    defaultCamZoom = 0.9;
    gf.visible = false;
    boyfriend.x += 100;
    boyfriend.y += 50;
    dad.x += 50;

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
    background.updateHitbox();
    background.visible = false;
    PlayState.add(background);

    gt = new FlxSprite(50,100);
    gt.frames = Paths.getSparrowAtlas('stages/matpat/gt logo');
    gt.animation.addByPrefix('shine', 'gt logo stashine', 24, true);
    gt.scrollFactor.set(0.7,0.7);
    gt.animation.play('shine');
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
    
    dadSecondCharacter= new Character(300, 0, mod + ":" + "matpat-pixel");
    PlayState.dads.push(dadSecondCharacter);
    dadSecondCharacter.visible = false; 
    PlayState.add(dadSecondCharacter);
    
    // bfSecondCharacter = PlayState.boyfriend; 
  
    // bfSecondCharacter = new Boyfriend(800,-50, mod + ":" + "bf-matpat");
    // bfSecondCharacter.visible = false; 
    // PlayState.boyfriends.push(bfSecondCharacter);
    // PlayState.add(bfSecondCharacter);
}