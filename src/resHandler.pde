static final int RES_IMG   = 0;
static final int RES_SE    = 1;
static final int RES_SONG  = 2;
static final int RES_FUMEN = 3;
static final int RES_UI    = 4;

static final class OsUtils
{
	private static String OS = null;
	public static String getOsName()
	{
		if(OS == null) { OS = System.getProperty("os.name"); }
		return OS;
	}
	public static boolean isWindows()
	{
  		return getOsName().startsWith("Windows");
	}

	public static boolean isMacos()
	{
		return Objects.equals(getOsName(), "Mac OS X");
	}
}

String getPath(int type, String file)
{
	String path = new String();
	switch(type)
	{
		case RES_IMG:
			path = "data/img/" + file;
		break;

		case RES_SE:
			path = "data/se/" + file;
		break;

		case RES_SONG:
		case RES_FUMEN:
			path = "song/" + file;
		break;
		case RES_UI:
			path = "data/img/UI/" + file;
		break;

		default:
			println("getPath(): Wrong type " + type + file);
			exit();
		break;
	}
	return path;
}

PImage LoadUI(String file)
{
	return loadImage(getPath(RES_UI, file));
}
PImage LoadImage(String file)
{
	return loadImage(getPath(RES_IMG, file));
}

SoundFile LoadSoundEffect(String file)
{
	return new SoundFile(this, getPath(RES_SE, file));
}

File LoadFumenFile(String dir)
{
	return new File(proj_path + getPath(RES_FUMEN, String.format("%s/%s.txt", dir, dir)));
}

SoundFile LoadFumenSong(String dir)
{
	println("LoadFumenSong(): dir = " + dir);
	println("LoadFumenSong():     " + getPath(RES_SONG, String.format("%s/%s.mp3", dir, dir)));
	return new SoundFile(this, getPath(RES_SONG, String.format("%s/%s.mp3", dir, dir)));
}