import java.util.*;

static final int PLAY_STOP     = 0;
static final int PLAY_IGNORE   = 1;

class SoundHandler
{
	Map<String, Integer> fileToIdx = new HashMap<String, Integer> ();

	ArrayList<SoundFile> fileList = new ArrayList<SoundFile>();
	// ArrayList<Boolean> playStat = new ArrayList<Boolean>();

	int now = 0;
	int type;

	SoundHandler()
	{
		type = PLAY_STOP;
	}

	SoundHandler(int type)
	{
		this.type = type;
	}

	SoundHandler(int type, String name, SoundFile file)
	{
		this.type = type;
		addSoundFile(name, file);
	}

	SoundHandler(String name, SoundFile file)
	{
		addSoundFile(name, file);
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
		
		switch(type)
		{
			case PLAY_STOP:
				if(tar.isPlaying())
				{
					tar.stop();
          			tar.amp(0.5);
					tar.play();
				}
				else
				{
					tar.play();
				}
			break;

			case PLAY_IGNORE:
				if(!tar.isPlaying())
					tar.play();
			break;
		}
		
	}
}
