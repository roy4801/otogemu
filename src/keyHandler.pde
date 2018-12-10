import java.util.Arrays;
import processing.serial.*;

enum KeyType
{
    KEY_D,
    KEY_F,
    KEY_J,
    KEY_K,
    KEY_ESC,
    KEY_TOTAL
}

static final int KEY_NONE = -1;
static final int KEY_D = 0;
static final int KEY_F = 1;
static final int KEY_J = 2;
static final int KEY_K = 3;
static final int KEY_ESC = 4;

static final int TotalKeys = KeyType.KEY_TOTAL.ordinal();

int getKeyType(char c)
{
	int keyType = KEY_NONE;
	switch(c)
	{
		case 'd':
		case 'D':
			keyType = KEY_D;
		break;

		case 'f':
		case 'F':
			keyType = KEY_F;
		break;

		case 'j':
		case 'J':
			keyType = KEY_J;
		break;

		case 'k':
		case 'K':
			keyType = KEY_K;
		break;
	}

	return keyType;
}

class KeyHandler
{
	boolean [] kState;
	Serial port = null;

	KeyHandler()
	{
		kState = new boolean[TotalKeys];

		Arrays.fill(kState, false);

		port = new Serial(application, serial_port, 9600);
	}
	//
	void serialEvent(Serial p)
	{
	    int pRead = p.read();
	    for(int i = 0; i < 4; i++)
		{
			kState[i] = pRead % 2 != 0 ? true : false;
			pRead /= 2;
		}
	}
	void setKey(KeyType type, boolean flag)
	{
		kState[type.ordinal()] = flag;
	}
	void setKey(char c, boolean flag)
	{
		if(c == 'd' || c == 'D')
			setKey(KeyType.KEY_D, flag);
		if(c == 'f' || c == 'F')
			setKey(KeyType.KEY_F, flag);
		if(c == 'j' || c == 'J')
			setKey(KeyType.KEY_J, flag);
		if(c == 'k' || c == 'K')
			setKey(KeyType.KEY_K, flag);
		if(c == 27)							//ESC ASCII 27
			setKey(KeyType.KEY_ESC, flag);
	}
	boolean getKey(KeyType type)
	{
		return kState[type.ordinal()];
	}
	boolean getKey(int type)
	{
		return kState[type];
	}
}