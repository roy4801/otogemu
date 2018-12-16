import ddf.minim.*;
import java.util.Arrays;

static final int KEY_D = 0;
static final int KEY_F = 1;
static final int KEY_J = 2;
static final int KEY_K = 3;

Minim minim;
AudioSample []se = new AudioSample[4];

String []se_name = {"soft-hitclap.wav", "soft-hitfinish.wav", "soft-hitnormal.wav", "soft-hitwhistle.wav"};

boolean[] keyState = new boolean[4];

void setup()
{
	size(300, 200, P3D);
	minim = new Minim(this);

	for(int i = 0; i < 4; i++)
	{
		se[i] = minim.loadSample(se_name[i], 512);
		if(se[i] == null)
			println("Cannot open file: " + se_name[i]);
	}
}

void draw()
{
	for(int i = 0; i < 4; i++)
		if(keyState[i])
			se[i].trigger();

	Arrays.fill(keyState, false);
}

void keyPressed()
{
	if(key == 'd')
		keyState[KEY_D] = true;
	if(key == 'f')
		keyState[KEY_F] = true;
	if(key == 'j')
		keyState[KEY_J] = true;
	if(key == 'k')
		keyState[KEY_K] = true;
}