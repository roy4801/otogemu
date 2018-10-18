import java.util.Arrays;

enum KeyType
{
    KEY_D,
    KEY_F,
    KEY_J,
    KEY_K,
    KEY_TOTAL
}

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