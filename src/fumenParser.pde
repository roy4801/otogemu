import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileNotFoundException;

class Fumen
{
	String title = null;
	SoundHandler music = null;
	ArrayList<Note> noteList = null;

	Fumen()
	{
		title = "";
		music = new SoundHandler(PLAY_IGNORE);
	}
	Fumen(String title, SoundFile m, ArrayList<Note> noteList)
	{
		this.title = title;
		music = new SoundHandler(PLAY_IGNORE, title, m);
		this.noteList = noteList;
	}
	//
	//
	void addNote(Note note)
	{
		noteList.add(note);
	}
	//
	void playMusic()
	{
		if(music != null)
			music.play(title);
		else
		{
			println("Fumen.play(): music is null");
			exit();
		}
	}

	////////////////////////test////////////////////////////
	void stop()
	{
		if(music != null)
			music.stop(title);
	}

	void pause()
	{
		if(music != null)
			music.pause(title);
	}
	void Pplay()
	{
		if(music != null)
			music.Pplay(title);
	}
	////////////////////////test////////////////////////////

	void resetFumen()
	{
		music.reset(title);

		for(int i = 0; i < noteList.size(); i++)
		{
			noteList.get(i).reset();
		}
	}
	// judge
	boolean isMusicEnd()
	{
		return music.isStopped(title); // this is return true once the music was stopped and played before.
	}
	//
	// Get/Set functions
	void setSong(String title, SoundFile song)
	{
		this.title = title;
		music.addSoundFile(title, song);
	}
	void setNoteList(ArrayList<Note> list)
	{
		noteList = list;
	}
	String getTitle()
	{
		return title;
	}
	SoundHandler getSong()
	{
		return music;
	}
	ArrayList<Note> getNoteList()
	{
		return noteList;
	}
	int getNoteListSize()
	{
		return noteList.size();
	}
}

class FumenParser
{
	Scanner scan = null;
	//
	
	FumenParser()
	{
	}

	Fumen getFumen(String dir)
	{
		SoundFile music = LoadFumenSong(dir);
		ArrayList<Note> noteList = this.parse(dir);
		
		return new Fumen(dir, music, noteList);
	}

	////////////////////////////////////////
	// private
	ArrayList<Note> parse(String dir)
	{
		try
		{
			scan = new Scanner(LoadFumenFile(dir));
		}
		catch(FileNotFoundException ex)
		{
			ex.printStackTrace();
		}

		String line, token;
		StringTokenizer tokenizer;
		ArrayList<Note> noteList = new ArrayList<Note>();

		// Start parsing the fumen into noteList
		while (scan.hasNextLine())
        {
        	Note now = new Note();
            line = scan.nextLine();

            tokenizer = new StringTokenizer(line);

            while(tokenizer.hasMoreTokens())
            {
            	int keyCol = -1;
            	token = tokenizer.nextToken();

                if(Objects.equals("s", token))
                {
                	now.setType(NOTE_SHORT);

                	// Get notePos(KEY_X)
                	token = tokenizer.nextToken();
                	keyCol = getKeyType(token.charAt(0));
                	now.setCol(keyCol);
                	now.setInitPos(endPoint[getKeyType(token.charAt(0))][POS_X], 0);

                	// Get touchTime
                	token = tokenizer.nextToken();
                	now.setTouchTime(Integer.parseInt(token));
                }
                else if(Objects.equals("l", token))
                {
                	now.setType(NOTE_LONG);

                	// Get notCol(KEY_X): which column
                	token = tokenizer.nextToken();
                	keyCol = getKeyType(token.charAt(0));
                	now.setCol(keyCol);
                	now.setInitPos(endPoint[getKeyType(token.charAt(0))][POS_X], 0);

                	// Get touchTime
                	token = tokenizer.nextToken();
                	now.setTouchTime(Integer.parseInt(token));

                	// Get endTime
                	token = tokenizer.nextToken();
                	now.setEndTime(Integer.parseInt(token));
                }
                // Calculating the startTime = touchTime - time form 0 to endPoint (ms)
                now.setStartTime((int)(now.getTouchTime() - offsetToStartTime));

            	// init notes
                if(now.getStartTime() < 0)
                {
                	now.setY((int)(endPoint[keyCol][1] - (now.getTouchTime() * unit / 1000.f)));
                }

                // println(offsetToStartTime);

                noteList.add(now);
                // now.printDbg();
                // print("\n");
            }
        }

        // Close the scanner
        if(scan != null)
        {
			scan.close();
			scan = null;
        }

		return noteList;
	}
}