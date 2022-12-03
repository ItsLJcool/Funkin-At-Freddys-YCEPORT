import Section;

function create() {
    defaultCamZoom = 0.9;
    boyfriend.x += 100;
    boyfriend.y += 50;
    dad.x += 50;
    gf.y += 160;
    gf.scrollFactor.set(1,1);

    stageFront = new FlxSprite(-100, -200).loadGraphic(Paths.image('stages/matpat/MatPat_Carpet'));
    add(stageFront);

    bg = new FlxSprite(-100, -200).loadGraphic(Paths.image('stages/matpat/MatPat_Walls'));
    add(bg);

    couch = new FlxSprite(-100, -200).loadGraphic(Paths.image('stages/matpat/MatPat_Couch'));
    add(couch);

    table =  bg = new FlxSprite(-100, -200).loadGraphic(Paths.image('stages/matpat/MatPat_Table'));
    add(table);

    matpatBG =  bg = new FlxSprite(-500, -200).loadGraphic(Paths.image('stages/matpat/Background'));
    matpatBG.alpha = 0;
    matpatBG.setGraphicSize(Std.int(matpatBG.width * 1.5));
    matpatBG.antialiasing = true;
    add(matpatBG);

    matLogo = new FlxSprite(-180, -100);

    matLogo.frames = Paths.getSparrowAtlas('stages/matpat/gt logo');
    matLogo.animation.addByPrefix('static', "gt logo stat", 16);
    matLogo.animation.addByPrefix('topleft', "gt logo tl", 16);
    matLogo.animation.addByPrefix('topright', "gt logo tr", 16);
    matLogo.animation.addByPrefix('bottomleft', "gt logo bl", 16);
    matLogo.animation.addByPrefix('bottomright', "gt logo br", 16);
    matLogo.animation.addByPrefix('shine', "gt logo shine", 16);
    matLogo.animation.addByPrefix('shinestat', "gt logo stashine", 16);
    matLogo.scrollFactor.set(0.5,0.3);
    matLogo.setGraphicSize(Std.int(matLogo.width * 0.75));
    matLogo.antialiasing = true;
    matLogo.updateHitbox();
    matLogo.alpha = 0;
    add(matLogo);
    matLogo.animation.play('static');

    logoArrayAnim = ['static', 'topleft', 'topright', 'bottomleft', 'bottomright', 'shine'];

    matpatFloor =  bg = new FlxSprite(-800, -350).loadGraphic(Paths.image('stages/matpat/Floor'));
    matpatFloor.alpha = 0;
    matpatFloor.setGraphicSize(Std.int(matpatFloor.width * 3));
    matpatFloor.antialiasing = true;
    add(matpatFloor);
    
    dadSecondCharacter= new Character(300, 1000, mod + ":" + "matpat-pixel");
    PlayState.dads.push(dadSecondCharacter);
    dadSecondCharacter.visible = false; 
    PlayState.add(dadSecondCharacter);
    
    bfSecondCharacter = PlayState.boyfriend; 
  
    bfSecondCharacter = new Boyfriend(800,1000, mod + ":" + "bf-matpat");
    bfSecondCharacter.visible = false; 
    PlayState.boyfriends.push(bfSecondCharacter);
    PlayState.add(bfSecondCharacter);
}

function createPost() {
    iconP1.changeCharacter(mod + ":bf-matpat");
}

function MatpatPixel() {
    camGame.flash(0xFF0ec30c, 1);

    matpatBG.alpha = 1;
    matpatFloor.alpha = 1;
    matLogo.alpha = 1;
    defaultCamZoom = 1;
    gf.alpha = 0;

    boyfriend.visible = false;
    dad.visible = false;
    gf.visible = false;
    dadSecondCharacter.visible = true; 
    bfSecondCharacter.visible = true; 
}
function Matpattopixelfirst() {
    curMatAnim = 1;

    matpatBG.alpha = 1;
    matpatFloor.alpha = 1;
    matLogo.alpha = 1;
    defaultCamZoom = 0.8;
    gf.alpha = 0;

    camHUD.visible = false;
    camFollow.x = 300;
    camFollow.y = -800;
    isCameraOnForcedPos = true;

    boyfriend.visible = false;
    dad.visible = false;
    gf.visible = false;
    dadSecondCharacter.visible = true; 
    bfSecondCharacter.visible = true; 

    matLogo.animation.play(logoArrayAnim[curMatAnim]);
    curMatAnim += 1;
}

function gtlogo() {
    matLogo.animation.play(logoArrayAnim[curMatAnim]);
    curMatAnim += 1;
}
function Zoomoutmoment() {
    camHUD.zoom += 2.4;
    matLogo.animation.play('shinestat');
    defaultCamZoom = 1;
    isCameraOnForcedPos = false;
    camHUD.visible = true;
    FlxTween.tween(bfSecondCharacter, { y: 700}, 2, {ease: FlxEase.quadInOut});
    FlxTween.tween(dadSecondCharacter, { y: 600}, 2, {ease: FlxEase.quadInOut});
    FlxTween.tween(matpatFloor, { y: -850}, 2, {ease: FlxEase.quadInOut});
}
function matpattonormal() {
    camGame.flash(0xFFFFFFFF, 2);
    
    matpatBG.alpha = 0;
    matpatFloor.alpha = 0;
    matLogo.alpha = 0;
    defaultCamZoom = 0.9;
    gf.alpha = 1;

    boyfriend.visible = true;
    dad.visible = true;
    gf.visible = true;
    dadSecondCharacter.visible = false; 
    bfSecondCharacter.visible = false; 
}

function update() {
    if(!Section.mustHitSection && !dad.visible) {
        camFollow.y += 200;   
    }
}