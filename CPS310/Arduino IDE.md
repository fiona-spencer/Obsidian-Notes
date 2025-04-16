

- Blinking using Processing language

```c
void setup(){
	pinMode(LED_BUILTIN, OUTPUT);
}

void loop(){
	digitalWrite(LED_BUILTIN, HIGH);
	delay(1000);
	digitalWrite(LED_BUILTIN, LOW);
	delay(1000);
}

```


- LED is set to PB5 (data direction register)
- Set pin 5 to high (data register)
- LED is bit 5




- Blinging using inline Assembly language

```Java
void setup(){
	asm(" sbi 0x04, 5");
}

void loop(){
	asm(" sbi 0x05, 5");
	delay(1000);
	asm(" cbi 0x05, 5 ");
	delau(1000);
}
```


- rjmp is that label

```java
void setup(){
	asm(" sbi 0x04, 5");
	asm(" rjmp start ");
}

void loop(){
	asm(" start: ");
	asm(" sbi 0x05, 5");
	delay(200);
	asm(" cbi 0x05, 5 ");
	delau(200);
	asm(" rjmp start ");
}
```


