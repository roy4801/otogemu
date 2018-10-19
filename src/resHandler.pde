static final int RES_IMG   = 0;
static final int RES_SOUND = 1;


String getPath(int type, String file)
{
	String path = new String();;
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
	return path;
}

PImage LoadImage(String file)
{
	return loadImage(getPath(RES_IMG, file));
}