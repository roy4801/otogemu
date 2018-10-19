import java.util.Arrays;

enum KeyType
{
    KEY_D,
    KEY_F,
    KEY_J,
    KEY_K,
    KEY_ESC,
    KEY_TOTAL
}

static final int KEY_D = 0;
static final int KEY_F = 1;
static final int KEY_J = 2;
static final int KEY_K = 3;
static final int KEY_ESC = 4;

static final int TotalKeys = KeyType.KEY_TOTAL.ordinal();

class KeyHandler
{
	boolean [] kState;

	KeyHandler()
	{
		kState = new boolean[TotalKeys];

		Arrays.fill(kState, false);
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