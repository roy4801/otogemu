static final int RES_IMG   = 0;
static final int RES_SE    = 1;
static final int RES_SONG  = 2;

String getPath(int type, String file)
{
	String path = new String();;
	switch(type)
	{
		case RES_IMG:
			path = "data/img/" + file;
		break;

		case RES_SE:
			path = "data/se/" + file;
		break;

		case RES_SONG:
			path = "song/" + file;
		break;

		default:
			println("getPath(): Wrong type " + type + file);
			exit();
		break;
	}
	return path;
}

PImage LoadImage(String file)
{
	return loadImage(getPath(RES_IMG, file));
}

SoundFile LoadSoundEffect(String file)
{
	return new SoundFile(this, getPath(RES_SE, file));
}

SoundFile LoadSong(String file)
{
	return new SoundFile(this, getPath(RES_SONG, file));
}