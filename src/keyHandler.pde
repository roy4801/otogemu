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

	void processingInput()
	{
		
	}

	void setKey(KeyType type, boolean flag)
	{
		kState[type.ordinal()] = flag;
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