import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileNotFoundException;

class Fumen
{
	String title = null;
	SoundFile music = null;
	ArrayList<Note> noteList = null;

	Fumen()
	{
		title = "";
	}
	Fumen(String title)
	{
		this.title = title;
	}
	Fumen(String title, SoundFile music, ArrayList<Note> noteList)
	{
		this.title = title;
		this.music = music;
		this.noteList = noteList;
	}
	//
	//
	void addNote(Note note)
	{
		noteList.add(note);
	}
	//
	// Get/Set functions
	void setTitle(String s)
	{
		title = s;
	}
	void setSong(SoundFile song)
	{
		music = song;
	}
	void setNoteList(ArrayList<Note> list)
	{
		noteList = list;
	}

	String getTitle()
	{
		return title;
	}
	SoundFile getSong()
	{
		return music;
	}
	ArrayList<Note> getNoteList()
	{
		return noteList;
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
            	token = tokenizer.nextToken();

                if(Objects.equals("s", token))
                {
                	now.setType(NOTE_SHORT);

                	// Get notePos(KEY_X)
                	token = tokenizer.nextToken();
                	now.setCol(getKeyType(token.charAt(0)));

                	// Get touchTime
                	token = tokenizer.nextToken();
                	now.setTouchTime(Integer.parseInt(token));
                }
                else if(Objects.equals("l", token))
                {
                	now.setType(NOTE_LONG);

                	// Get notCol(KEY_X): which column
                	token = tokenizer.nextToken();
                	now.setCol(getKeyType(token.charAt(0)));
                	

                	// Get touchTime
                	token = tokenizer.nextToken();
                	now.setTouchTime(Integer.parseInt(token));

                	// Get endTime
                	token = tokenizer.nextToken();
                	now.setEndTime(Integer.parseInt(token));
                }

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