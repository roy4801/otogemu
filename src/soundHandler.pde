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

	ArrayList<Boolean> played = new ArrayList<Boolean>(); // for PLAY_IGNORE

	//////////////////////
	/// Constructor
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

	//////////////////////
	/// Main functions
	void addSoundFile(String name, SoundFile s)
	{
		if(fileToIdx.containsKey(name))
		{
			println("SoundHandler: The file " + name + " is already in list");
			return;
		}

		fileToIdx.put(name, now++);
		fileList.add(s);
		played.add(false);
		// playStat.add(false);
	}

	int getIdx(String name)
	{
		return fileToIdx.get(name); // may have bug here
	}

	void play(String name)
	{
		play(getIdx(name));
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
				if(!played.get(idx) && !tar.isPlaying())
				{
					tar.play();
				}
			break;
		}

		played.set(idx, true);
	}
	///////////////test///////////////////////////////
	void stop(String name)
	{
		stop(getIdx(name));
	}

	void stop(int idx)
	{
		SoundFile tar = fileList.get(idx);
		tar.jump(0.0);
		tar.stop();
	}

	void Pplay(String name)
	{
		Pplay(getIdx(name));
	}
	void Pplay(int idx)
	{
		SoundFile tar = fileList.get(idx);
		tar.play();
	}

	void pause(String name)
	{	
		pause(getIdx(name));
	}

	void pause(int idx)
	{
		SoundFile tar = fileList.get(idx);
		tar.pause();
	}
	///////////////test///////////////////////////////

	void reset(String name)
	{
		reset(getIdx(name));
	}
	void reset(int idx)
	{
		for(int i = 0; i < played.size(); i++)
			played.set(i, false);
	}

	boolean isPlaying(String name)
	{
		return isPlaying(getIdx(name));
	}
	boolean isPlaying(int idx)
	{
		SoundFile tar = fileList.get(idx);
		return tar.isPlaying();
	}

	boolean isPlayed(String name)
	{
		return isPlayed(getIdx(name));
	}
	boolean isPlayed(int idx)
	{
		return played.get(idx);
	}

	boolean isStopped(String name)
	{
		return isStopped(getIdx(name));
	}
	boolean isStopped(int idx)
	{
		SoundFile tar = fileList.get(idx);

		return played.get(idx) && !tar.isPlaying();
	}
}
