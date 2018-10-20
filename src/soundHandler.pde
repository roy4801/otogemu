import java.util.*;

class SoundHandler
{
	Map<String, Integer> fileToIdx = new HashMap<String, Integer> ();

	ArrayList<SoundFile> fileList = new ArrayList<SoundFile>();
	// ArrayList<Boolean> playStat = new ArrayList<Boolean>();

	int now = 0;

	SoundHandler()
	{
	}

	void addSoundFile(String name, SoundFile s)
	{
		if(fileToIdx.containsKey(name))
		{
			println("SoundHandler: The file " + name + " is already in list");
			return;
		}

		fileToIdx.put(name, now++);
		fileList.add(s);
		// playStat.add(false);
	}

	void play(String name)
	{
		int idx = fileToIdx.get(name);
		play(idx);
	}

	void play(int idx)
	{
		SoundFile tar = fileList.get(idx);
		
		if(tar.isPlaying())
		{
			tar.stop();
			tar.play();
		}
		else
		{
			tar.play();
		}
	}
}