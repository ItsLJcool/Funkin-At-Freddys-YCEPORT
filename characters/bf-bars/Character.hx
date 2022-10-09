function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	character.loadJSON(true);

	character.flipX = true;
}