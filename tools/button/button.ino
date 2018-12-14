
// from left to right
// idx 0 1 2 3
int  btnPin[] = {7, 8, 9, 10};
const int BTN_NUM = sizeof(btnPin)/sizeof(int);
bool btnState[BTN_NUM];
void setup()
{
    for(int i = 0; i < BTN_NUM; i++)
        pinMode(btnPin[i], INPUT);
    Serial.begin(9600); // Start serial communication at 9600 bps
}

#define DBG 0

#define BIT(x) (1<<x)
bool need_zero = false;
int prev;

void loop()
{
    for(int i = 0; i < BTN_NUM; i++)
        btnState[i] = digitalRead(btnPin[i]);

    int payload = 0;

    for(int i = 0; i < BTN_NUM; i++)
    {
        if (btnState[i] == HIGH)
        {
            payload |= BIT(i);
            need_zero = true;
        }
        else
        {
            payload &= ~BIT(i);
        }
    }

    if(payload)
    {
    	if(prev != payload)
    	{
	    	#if DBG
	    	Serial.println(payload);
	    	#else
	    	Serial.write(payload);
	    	#endif
	    }
    }
    else
    {
    	if(need_zero)
    	{
    		#if DBG
    		Serial.println(0);
    		#else
    		Serial.write(0);
    		#endif
    		need_zero = false;
    	}
    }
    prev = payload;
}