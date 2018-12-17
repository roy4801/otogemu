import java.io.File;
import java.util.Date;

class GetbgmName
{
	String path;

	GetbgmName()
	{
		if(OsUtils.isWindows())
			path = sketchPath() + "\\song";
		else if(OsUtils.isMacos())
		{
			path = sketchPath() + "/song";
			println("GetbgmName: " + path);
		}
	}

	String getPath()
	{
		return path;
	}

	String [] listFileNames(String dir)
	{
		File file = new File(dir);
		if(file.isDirectory())
		{
			String names[] = file.list();
			return names;
		}
		else
		{
			return null;
		}
	}

	void changePos(String [] str, int i, int j)
	{
		String tmp;
		tmp = str[i];
		str[i] = str[j];
		str[j] = tmp;
	}
	void rightShift(String [] str)
	{
		String tmp = str[str.length-1];
		for(int i = str.length-1; i > 0 ; i--)
		{
			str[i] = str[i-1];
		}
		str[0] = tmp;
	}
}




// String bgmPath = sketchPath() + "\\song";

// String [] songName = listFileNames(bgmPath);
// int textMidIdx = 3;
// boolean addFlag = false;
// boolean minFlag = false;
// int topStatus;
// int bottomStatus;

// int RANGE = songName.length;

// String [] listFileNames(String dir)
// {
// 	File file = new File(dir);
// 	if(file.isDirectory())
// 	{
// 		String name[] = file.list();
// 		return name;
// 	}
// 	else
// 	{
// 		return null;
// 	}
// }