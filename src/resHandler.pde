static final int RES_IMG   = 0;
static final int RES_SOUND = 1;


String getPath(int type, String file)
{
	String path;
	switch(type)
	{
		case RES_IMG:
			path = "data/img/" + file;
		break;

		case RES_SOUND:
			path = "data/sound/" + file;
		break;

		default:
			println("Failed to load resource: " + type + file);
			exit();
		break;
	}
	return "";
}

PImage LoadImage(int type, String file)
{
	return loadImage(type, getPath(type, file));
}