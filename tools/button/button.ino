typedef unsigned long UL;

// from left to right
// idx 0 1 2 3
int  btnPin[] = {7, 8, 9, 10};
int ledPin[] = {A0, A1, A2, A3};
const int BTN_NUM = sizeof(btnPin)/sizeof(int);
bool btnState[BTN_NUM];
bool prevState[BTN_NUM];

#define DBG 0

#define BIT(x) (1<<x)
bool need_zero = false;
bool send = false;
int prev;

// debounce
UL bounce = 5; // ms
UL lastTime[BTN_NUM];

void setup()
{
    for(int i = 0; i < BTN_NUM; i++)
        pinMode(btnPin[i], INPUT);
    for(int i = 0; i < BTN_NUM; i++)
        pinMode(ledPin[i], OUTPUT);
    Serial.begin(9600);
}

void loop()
{
    bool reading[BTN_NUM];
    for(int i = 0; i < BTN_NUM; i++)
    {
        reading[i] = digitalRead(btnPin[i]);
        if(reading[i] != prevState[i])
        {
            lastTime[i] = millis();
            // wait = true;
        }
    }

    for(int i = 0; i < BTN_NUM; i++)
    {
        if(millis() - lastTime[i] > bounce)
        {
            if(reading[i] != btnState[i])
            {
                btnState[i] = reading[i];
                send = true;
            }
        }
    }

    for(int i = 0; i < BTN_NUM; i++)
        prevState[i] = reading[i];

    // Send
    if(!send)
        return;
    else
        send = false;

    // Light
    // for(int i = 0; i < BTN_NUM; i++)
    //     digitalWrite(ledPin[i], btnState[i]);

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
