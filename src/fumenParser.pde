import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

class Fumen
{
	String title;
	SoundFile bm;
	ArrayList<Note> noteList;

	Fumen()
	{
		title = "";
	}
	//

	// Get/Set functions
	void setTitle(String s)
	{
		title = s;
	}
	void setSong(SoundFile song)
	{
		bm = song;
	}

	String getTitle()
	{
		return title;
	}
	SoundFile getSong()
	{
		return bm;
	}
	ArrayList<Note> getNoteList()
	{
		return noteList;
	}
}

class FumenParser
{
	String path;
	Scanner scan;
	File fumenText;
	//
	
	FumenParser()
	{
		
	}

	Fumen parse()
	{
		return new Fumen(); // dummy
	}
}