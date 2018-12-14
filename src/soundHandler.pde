import java.util.*;
import ddf.minim.*;

static final int PLAY_STOP     = 0;
static final int PLAY_IGNORE   = 1;

// Minim object
Minim minim = new Minim(this);

class SoundHandler
{
	Map<String, Integer> fileToIdx = new HashMap<String, Integer> ();
	ArrayList<AudioPlayer> fileList = new ArrayList<AudioPlayer>();

	int now = 0;
	int type;
	// for PLAY_IGNORE
	ArrayList<Boolean> played = new ArrayList<Boolean>();

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
	SoundHandler(int type, String name, AudioPlayer file)
	{
		this.type = type;
		addSoundFile(name, file);
	}
	SoundHandler(String name, AudioPlayer file)
	{
		addSoundFile(name, file);
	}

	//////////////////////
	/// Main functions
	void addSoundFile(String name, AudioPlayer s)
	{
		if(fileToIdx.containsKey(name))
		{
			println("SoundHandler: The file " + name + " is already in list");
			return;
		}

		fileToIdx.put(name, now++);
		fileList.add(s);
		played.add(false);
	}
	// helper function
	int getIdx(String name)
	{
		// may have bug here
		return fileToIdx.get(name);
	}
 	// Play the music
	void play(String name)
	{
		play(getIdx(name));
	}
	void play(int idx)
	{
		AudioPlayer tar = fileList.get(idx);
		// TODO(roy4801): Need refactoring
		switch(type)
		{
			case PLAY_STOP:
				if(tar.isPlaying())
				{
					tar.pause();
          			tar.rewind();
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
	// Stop the music
	void stop(String name)
	{
		stop(getIdx(name));
	}
	void stop(int idx)
	{
		AudioPlayer tar = fileList.get(idx);
		tar.pause();
		tar.rewind();
	}

//// WTF is this by roy4801 ///////////////////////
	void Pplay(String name)
	{
		Pplay(getIdx(name));
	}
	void Pplay(int idx)
	{
		AudioPlayer tar = fileList.get(idx);
		tar.play();
	}
//// WTF is this by roy4801 ///////////////////////
	// Pause the music
	void pause(String name)
	{	
		pause(getIdx(name));
	}
	void pause(int idx)
	{
		AudioPlayer tar = fileList.get(idx);
		tar.pause();
	}
	// 
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
		AudioPlayer tar = fileList.get(idx);
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
		AudioPlayer tar = fileList.get(idx);

		return played.get(idx) && !tar.isPlaying(); // 1 && !0
	}
	// Get the current pos of a music, if a music is not playing
	// then it returns -1
	int getPos(String name)
	{
		return getPos(getIdx(name));
	}
	int getPos(int idx)
	{
		AudioPlayer tar = fileList.get(idx);
		return tar.isPlaying() ? tar.position() : -1;
	}
}
