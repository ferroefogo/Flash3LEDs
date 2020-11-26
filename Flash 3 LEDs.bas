;Flashes 3 LEDs on and off
init:				; Initiate program here
	clrf PORTB		; Clear PORTB output latches
	bsf STATUS,RP0	; Memory Page 1
	movlw b'11111111'	; Set PORTA pins to be inputs
	movwf TRISA		; Write to TRIS register
	movlw b'00000000'	; Set PORTB pins to be outputs
	bcf STATUS,RP0	; Memory Page 0

main:				; Main program function
	movlw b'00000010'	; Set pin B.1 to high, others low
	movwf PORTB		; Write to PORT register
	call wait1000ms	; Delay 1 second
	movlw b'00000101'	; Set pin B.1 low, others high
	movwf PORTB		; Write to PORT register
	call wait1000ms	; Delay 1 second
	goto main		; Repeat the previous instructions within main