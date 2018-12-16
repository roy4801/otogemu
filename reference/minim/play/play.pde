import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup()
{
	size(300, 200, P3D);

	minim = new Minim(this);

	player = minim.loadFile("pochi.mp3");
	println("len = " + player.length());
}

void draw()
{
	background(0);
  	stroke(255);

  	// Background of the progress bar
  	fill(255);
  	rect(20, 50, 260, 5);
  	// Foreground of the progress bar
  	int nowProgress = (int)map(player.position(), 0, player.length(), 0, 260);
  	println("Now progress = " + nowProgress);
  	fill(128);
  	rect(20, 50, nowProgress, 5);

  	fill(255);
  	if ( player.isPlaying() )
	{
		text("Press any key to pause playback.", 10, 20 );
		text("~ Playing ~", 10, 40);
	}
	else
	{
		text("Press any key to start playback.", 10, 20 );
	}
}

void keyPressed()
{
	if(key == ' ')
	{
		if(player.isPlaying())
			player.pause();
		else
			player.play();
	}
	else if(key == 's' || key == 'S')
	{
		player.pause();
		player.rewind();
	}
}