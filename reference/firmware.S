.do_clear_bss_loop:
	st	X+, R

.do_clear_bss_start:
	cpi	R, 0xDA	;	218
	cpc	R, R
	brne	<.do_clear_bss_loop>

__addsf3:
	eor	R, R
	eor	R, R
	call	<__addsf3x>
	jmp	<__fp_round>
	call	<__fp_pscA>
	brcs	<__addsf3+X>
	call	<__fp_pscB>
	brcs	<__addsf3+X>
	brne	<__addsf3+X>
	cpi	R, 0xFF	;	255
	brne	<__addsf3+X>
	brtc	<__addsf3+X>
	jmp	<__fp_nan>
	brtc	<__addsf3+X>
	com	R
	bst	R, 7
	jmp	<__fp_inf>

__addsf3x:
	mov	R, R
	call	<__fp_split3>
	brcs	<__addsf3+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<__addsf3x+X>
	brne	<__addsf3x+X>
	brtc	<__addsf3x+X>
	jmp	<__fp_zero>
	brtc	<__addsf3x+X>
	com	R
	mov	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	eor	R, R
	eor	R, R
	sub	R, R
	breq	<__addsf3x+X>
	cpi	R, 0xF9	;	249
	brcc	<__addsf3x+X>
	cpi	R, 0xE0	;	224
	brcs	<__addsf3x+X>
	cp	R, R
	sbci	R, 0x00	;	0
	mov	R, R
	mov	R, R
	mov	R, R
	eor	R, R
	subi	R, 0xF8	;	248
	rjmp	<__addsf3x+X>
	lsr	R
	ror	R
	ror	R
	ror	R
	sbci	R, 0x00	;	0
	inc	R
	brne	<__addsf3x+X>
	brtc	<__addsf3x+X>
	cp	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	brmi	<__addsf3x+X>
	subi	R, 0x01	;	1
	breq	<__addsf3x+X>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	brpl	<__addsf3x+X>
	rjmp	<__addsf3x+X>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	brcc	<__addsf3x+X>
	ror	R
	ror	R
	ror	R
	ror	R
	ror	R
	cpi	R, 0xFE	;	254
	brcs	<__addsf3x+X>
	rjmp	<__addsf3+X>
	inc	R
	add	R, R
	brcs	<__addsf3x+X>
	eor	R, R
	add	R, R
	ror	R
	ror	R
	ret

__bad_interrupt:
	jmp	0

__cmpsf2:
	call	<__fp_cmp>
	brcc	<__cmpsf2+X>
	ldi	R, 0x01	;	1
	ret

__ctors_end:
	eor	R, R
	out	0x3f, R	;	63
	ldi	R, 0xFF	;	255
	ldi	R, 0x0A	;	10
	out	0x3e, R	;	62
	out	0x3d, R	;	61

__ctors_start:
	eor	R, R

__ctype_isfalse:
	eor	R, R
	eor	R, R

__ctype_istrue:
	ret

__cxa_pure_virtual:
	call	<abort>

__divmodsi4:
	mov	R, R
	bst	R, 7
	brtc	<__divmodsi4+X>
	com	R
	call	<__negsi2>
	sbrc	R, 7
	rcall	<__divmodsi4_neg2>
	call	<__udivmodsi4>
	sbrc	R, 7
	rcall	<__divmodsi4_neg2>
	brtc	<__divmodsi4_exit>
	jmp	<__negsi2>

__divmodsi4_exit:
	ret

__divmodsi4_neg2:
	com	R
	com	R
	com	R
	neg	R
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255

__divsf3:
	call	<__divsf3x>
	jmp	<__fp_round>
	call	<__fp_pscB>
	brcs	<__divsf3+X>
	call	<__fp_pscA>
	brcs	<__divsf3+X>
	brne	<__divsf3+X>
	cpi	R, 0xFF	;	255
	breq	<__divsf3+X>
	jmp	<__fp_inf>
	cpse	R, R
	jmp	<__fp_szero>
	jmp	<__fp_nan>

__divsf3_pse:
	and	R, R
	breq	<__divsf3+X>
	and	R, R
	breq	<__divsf3+X>
	sub	R, R
	sbc	R, R
	eor	R, R
	eor	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	brcs	<__divsf3_pse+X>
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	breq	<__divsf3_pse+X>
	rcall	<__divsf3_pse+X>
	mov	R, R
	brmi	<__divsf3_pse+X>
	ldi	R, 0x80	;	128
	rcall	<__divsf3_pse+X>
	subi	R, 0x01	;	1
	sbci	R, 0x00	;	0
	lsr	R
	adc	R, R
	brpl	<__divsf3_pse+X>
	rcall	<__divsf3_pse+X>
	mov	R, R
	rcall	<__divsf3_pse+X>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	ldi	R, 0x80	;	128
	breq	<__divsf3_pse+X>
	sbc	R, R
	mov	R, R
	movw	R, R
	eor	R, R
	subi	R, 0x83	;	131
	sbci	R, 0xFF	;	255
	brmi	<__divsf3_pse+X>
	cpi	R, 0xFE	;	254
	cpc	R, R
	brcs	<__divsf3_pse+X>
	jmp	<__fp_inf>
	jmp	<__fp_szero>
	cpi	R, 0xFF	;	255
	brlt	<__divsf3_pse+X>
	cpi	R, 0xE8	;	232
	brlt	<__divsf3_pse+X>
	lsr	R
	ror	R
	ror	R
	ror	R
	ror	R
	subi	R, 0xFF	;	255
	brne	<__divsf3_pse+X>
	add	R, R
	adc	R, R
	lsr	R
	ror	R
	bld	R, 7
	ret
	ldi	R, 0x01	;	1
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<__divsf3_pse+X>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	adc	R, R
	brcc	<__divsf3_pse+X>
	com	R
	ret

__divsf3x:
	call	<__fp_split3>
	brcs	<__divsf3+X>

__do_clear_bss:
	ldi	R, 0x08	;	8
	ldi	R, 0x56	;	86
	ldi	R, 0x02	;	2
	rjmp	<.do_clear_bss_start>

__do_copy_data:
	ldi	R, 0x02	;	2
	ldi	R, 0x00	;	0
	ldi	R, 0x01	;	1
	ldi	R, 0x9A	;	154
	ldi	R, 0x6E	;	110
	rjmp	<__do_copy_data+X>
	lpm	R, Z+
	st	X+, R
	cpi	R, 0x56	;	86
	cpc	R, R
	brne	<__do_copy_data+X>

__do_global_ctors:
	ldi	R, 0x03	;	3
	ldi	R, 0xA2	;	162
	ldi	R, 0x03	;	3
	rjmp	<__do_global_ctors+X>
	sbiw	R, 0x01	;	1
	movw	R, R
	call	<__tablejump2__>
	cpi	R, 0xA1	;	161
	cpc	R, R
	brne	<__do_global_ctors+X>
	call	<main>
	jmp	<_exit>

__epilogue_restores__:
	ldd	R, Y+18	;	0x12
	ldd	R, Y+17	;	0x11
	ldd	R, Y+16	;	0x10
	ldd	R, Y+15	;	0x0f
	ldd	R, Y+14	;	0x0e
	ldd	R, Y+13	;	0x0d
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+11	;	0x0b
	ldd	R, Y+10	;	0x0a
	ldd	R, Y+9	;	0x09
	ldd	R, Y+8	;	0x08
	ldd	R, Y+7	;	0x07
	ldd	R, Y+6	;	0x06
	ldd	R, Y+5	;	0x05
	ldd	R, Y+4	;	0x04
	ldd	R, Y+3	;	0x03
	ldd	R, Y+2	;	0x02
	ldd	R, Y+1	;	0x01
	add	R, R
	adc	R, R
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	movw	R, R
	ret

__fixsfsi:
	call	<__fixunssfsi>
	set
	cpse	R, R
	jmp	<__fp_szero>
	ret

__fixunssfsi:
	call	<__fp_splitA>
	brcs	<__fixunssfsi+X>
	subi	R, 0x7F	;	127
	brcs	<__fixunssfsi+X>
	mov	R, R
	eor	R, R
	subi	R, 0x17	;	23
	brcs	<__fixunssfsi+X>
	breq	<__fixunssfsi+X>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	brmi	<__fixunssfsi+X>
	dec	R
	brne	<__fixunssfsi+X>
	rjmp	<__fixunssfsi+X>
	cpi	R, 0x01	;	1
	breq	<__fixunssfsi+X>
	call	<__fp_zero>
	ldi	R, 0x01	;	1
	ret
	jmp	<__fp_zero>
	mov	R, R
	mov	R, R
	eor	R, R
	subi	R, 0xF8	;	248
	breq	<__fixunssfsi+X>
	cpi	R, 0xF9	;	249
	brlt	<__fixunssfsi+X>
	lsr	R
	ror	R
	ror	R
	inc	R
	brne	<__fixunssfsi+X>
	brtc	<__fixunssfsi+X>
	com	R
	com	R
	com	R
	neg	R
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	ret

__floatsisf:
	bst	R, 7
	brtc	<__floatsisf+X>
	com	R
	com	R
	com	R
	neg	R
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	and	R, R
	breq	<__floatsisf+X>
	mov	R, R
	ldi	R, 0x96	;	150
	eor	R, R
	inc	R
	lsr	R
	ror	R
	ror	R
	ror	R
	ror	R
	cpse	R, R
	rjmp	<__floatsisf+X>
	brpl	<__floatsisf+X>
	add	R, R
	brne	<__floatsisf+X>
	sbrs	R, 0
	rjmp	<__floatsisf+X>
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	rjmp	<__floatsisf+X>
	and	R, R
	breq	<__floatsisf+X>
	ldi	R, 0x96	;	150
	rjmp	<__floatsisf+X>
	and	R, R
	breq	<__floatsisf+X>
	ldi	R, 0x8E	;	142
	mov	R, R
	mov	R, R
	rjmp	<__floatsisf+X>
	and	R, R
	breq	<__floatsisf+X>
	ldi	R, 0x86	;	134
	mov	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	brmi	<__floatsisf+X>
	dec	R
	add	R, R
	adc	R, R
	adc	R, R
	brpl	<__floatsisf+X>
	add	R, R
	lsr	R
	ror	R
	bld	R, 7
	ret

__floatunsisf:
	clt
	rjmp	<__floatsisf+X>

__fp_cmp:
	add	R, R
	sbc	R, R
	add	R, R
	sbc	R, R
	ldi	R, 0x80	;	128
	ldi	R, 0xFE	;	254
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<__fp_cmp+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<__fp_cmp+X>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	brne	<__fp_cmp+X>
	eor	R, R
	breq	<__fp_cmp+X>
	or	R, R
	or	R, R
	or	R, R
	brne	<__fp_cmp+X>
	ret
	eor	R, R
	brne	<__fp_cmp+X>
	sbci	R, 0x01	;	1
	lsr	R
	ldi	R, 0xFF	;	255
	adc	R, R
	adc	R, R
	ret

__fp_inf:
	bld	R, 7
	ori	R, 0x7F	;	127
	ldi	R, 0x80	;	128
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ret

__fp_nan:
	ldi	R, 0xFF	;	255
	ldi	R, 0xC0	;	192
	ret

__fp_pscA:
	eor	R, R
	dec	R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	ret

__fp_pscB:
	eor	R, R
	dec	R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	ret

__fp_round:
	mov	R, R
	inc	R
	add	R, R
	brne	<__fp_round+X>
	and	R, R
	brmi	<__fp_round+X>
	add	R, R
	brcc	<__fp_round+X>
	or	R, R
	brne	<__fp_round+X>
	sbrs	R, 0
	rjmp	<__fp_round+X>
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	ret

__fp_split3:
	sbrc	R, 7
	subi	R, 0x80	;	128
	add	R, R
	adc	R, R
	breq	<__fp_splitA+X>
	cpi	R, 0xFF	;	255
	breq	<__fp_splitA+X>
	ror	R

__fp_splitA:
	add	R, R
	bst	R, 7
	adc	R, R
	breq	<__fp_splitA+X>
	cpi	R, 0xFF	;	255
	breq	<__fp_splitA+X>
	ror	R
	ret
	cp	R, R
	cpc	R, R
	cpc	R, R
	adc	R, R
	rjmp	<__fp_split3+X>
	lsr	R
	rcall	<__fp_splitA>
	rjmp	<__fp_splitA+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	adc	R, R
	rjmp	<__fp_splitA+X>
	lsr	R
	cpc	R, R
	cpc	R, R
	sec
	ret

__fp_szero:
	eor	R, R
	eor	R, R
	eor	R, R
	movw	R, R
	bld	R, 7
	ret

__fp_zero:
	clt

__gesf2:
	call	<__fp_cmp>
	brcc	<__gesf2+X>
	ldi	R, 0xFF	;	255
	ret

__mulhisi3:
	call	<__umulhisi3>
	and	R, R
	brpl	<__mulhisi3+X>
	sub	R, R
	sbc	R, R
	jmp	<__usmulhisi3_tail>

__mulohisi3:
	call	<__muluhisi3>
	sub	R, R
	sbc	R, R
	ret

__mulsf3:
	call	<__mulsf3x>
	jmp	<__fp_round>
	call	<__fp_pscA>
	brcs	<__mulsf3+X>
	call	<__fp_pscB>
	brcs	<__mulsf3+X>
	and	R, R
	breq	<__mulsf3+X>
	jmp	<__fp_inf>
	jmp	<__fp_nan>
	eor	R, R
	jmp	<__fp_szero>

__mulsf3_pse:
	mul	R, R
	breq	<__mulsf3+X>
	add	R, R
	ldi	R, 0x00	;	0
	adc	R, R
	mul	R, R
	movw	R, R
	mul	R, R
	eor	R, R
	add	R, R
	adc	R, R
	mul	R, R
	eor	R, R
	add	R, R
	adc	R, R
	adc	R, R
	mul	R, R
	eor	R, R
	add	R, R
	adc	R, R
	adc	R, R
	mul	R, R
	eor	R, R
	add	R, R
	adc	R, R
	adc	R, R
	mul	R, R
	add	R, R
	adc	R, R
	adc	R, R
	mul	R, R
	add	R, R
	adc	R, R
	adc	R, R
	mul	R, R
	eor	R, R
	add	R, R
	adc	R, R
	adc	R, R
	mul	R, R
	add	R, R
	adc	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	eor	R, R
	subi	R, 0x7F	;	127
	sbci	R, 0x00	;	0
	brmi	<__mulsf3_pse+X>
	breq	<__mulsf3_pse+X>
	and	R, R
	brmi	<__mulsf3_pse+X>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	subi	R, 0x01	;	1
	sbci	R, 0x00	;	0
	brne	<__mulsf3_pse+X>
	cpi	R, 0xFE	;	254
	cpc	R, R
	brcs	<__mulsf3_pse+X>
	jmp	<__fp_inf>
	jmp	<__fp_szero>
	cpi	R, 0xFF	;	255
	brlt	<__mulsf3_pse+X>
	cpi	R, 0xE8	;	232
	brlt	<__mulsf3_pse+X>
	lsr	R
	ror	R
	ror	R
	ror	R
	ror	R
	ror	R
	subi	R, 0xFF	;	255
	brne	<__mulsf3_pse+X>
	or	R, R
	add	R, R
	adc	R, R
	lsr	R
	ror	R
	bld	R, 7
	ret

__mulsf3x:
	call	<__fp_split3>
	brcs	<__mulsf3+X>

__mulshisi3:
	sbrs	R, 7
	jmp	<__muluhisi3>

__mulsi3:
	movw	R, R
	push	R
	push	R
	call	<__muluhisi3>
	pop	R
	pop	R
	mul	R, R
	add	R, R
	adc	R, R
	mul	R, R
	add	R, R
	mul	R, R
	add	R, R
	eor	R, R
	ret

__mulsi_const_10:
	mov	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	ret

__muluhisi3:
	call	<__umulhisi3>
	mul	R, R
	add	R, R
	mul	R, R
	add	R, R
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	ret

__negsi2:
	com	R
	com	R
	com	R
	neg	R
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	ret

__prologue_saves__:
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	sub	R, R
	sbc	R, R
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	ijmp

__stop_program:
	rjmp	<__stop_program>

__subsf3:
	subi	R, 0x80	;	128

__tablejump2__:
	add	R, R
	adc	R, R
	lpm	R, Z+
	lpm	R, Z
	mov	R, R
	ijmp

__trampolines_end:
	sbci	R, 0x1E	;	30
4e 49       	Address 0x00000000000000ae is out of bounds.

__udivmodsi4:
	ldi	R, 0x21	;	33
	mov	R, R
	sub	R, R
	sub	R, R
	movw	R, R
	rjmp	<__udivmodsi4_ep>

__udivmodsi4_ep:
	adc	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	dec	R
	brne	<__udivmodsi4_loop>
	com	R
	com	R
	com	R
	com	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	ret

__udivmodsi4_loop:
	adc	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<__udivmodsi4_ep>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R

__umulhisi3:
	mul	R, R
	movw	R, R
	mul	R, R
	movw	R, R
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	adc	R, R
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	adc	R, R
	ret

__usmulhisi3:
	call	<__umulhisi3>

__usmulhisi3_tail:
	sbrs	R, 7
	ret
	sub	R, R
	sbc	R, R
	ret

__vector_10:
	push	R
	push	R
	in	R, 0x3f	;	63
	push	R
	eor	R, R
	push	R
	push	R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xF3	;	243
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sbrs	R, 3
	rjmp	<__vector_10+X>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0x32	;	50
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<_usbConfiguration>, R
	ldi	R, 0x08	;	8
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sbrs	R, 2
	rjmp	<__vector_10+X>
	ldi	R, 0x03	;	3
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	and	R, R
	breq	<__vector_10+X>
	ldi	R, 0x3A	;	58
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <TxLEDPulse>
	and	R, R
	breq	<__vector_10+X>
	lds	R, <TxLEDPulse>
	subi	R, 0x01	;	1
	sts	<TxLEDPulse>, R
	lds	R, <RxLEDPulse>
	and	R, R
	breq	<__vector_10+X>
	lds	R, <RxLEDPulse>
	subi	R, 0x01	;	1
	sts	<RxLEDPulse>, R
	sbrs	R, 4
	rjmp	<__vector_10+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xEE	;	238
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xEF	;	239
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <_usbSuspendState>
	andi	R, 0xEE	;	238
	ori	R, 0x10	;	16
	sts	<_usbSuspendState>, R
	pop	R
	pop	R
	pop	R
	out	0x3f, R	;	63
	pop	R
	pop	R
	reti
	sbrs	R, 0
	rjmp	<__vector_10+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xEE	;	238
	ori	R, 0x10	;	16
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xEE	;	238
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <_usbSuspendState>
	andi	R, 0xEE	;	238
	ori	R, 0x01	;	1
	rjmp	<__vector_10+X>

__vector_11:
	push	R
	push	R
	in	R, 0x3f	;	63
	push	R
	eor	R, R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	sbiw	R, 0x1c	;	28
	out	0x3e, R	;	62
	out	0x3d, R	;	61
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrs	R, 3
	rjmp	<__vector_11+X>
	ldi	R, 0x09	;	9
	movw	R, R
	adiw	R, 0x15	;	21
	mov	R, R
	mov	R, R
	subi	R, 0x01	;	1
	breq	<__vector_11+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	st	Z, R
	adiw	R, 0x01	;	1
	rjmp	<__vector_11+X>
	ldi	R, 0x64	;	100
	sts	<RxLEDPulse>, R
	ldi	R, 0xF2	;	242
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldd	R, Y+21	;	0x15
	sbrs	R, 7
	rjmp	<__vector_11+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrs	R, 0
	rjmp	<__vector_11+X>
	mov	R, R
	andi	R, 0x60	;	96
	breq	<__vector_11+X>
	rjmp	<__vector_11+X>
	ldd	R, Y+22	;	0x16
	ldd	R, Y+23	;	0x17
	ldd	R, Y+24	;	0x18
	ldd	R, Y+23	;	0x17
	ldd	R, Y+24	;	0x18
	cpse	R, R
	rjmp	<__vector_11+X>
	cpi	R, 0x80	;	128
	brne	<__vector_11+X>
	lds	R, <_usbCurrentStatus>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0xFE	;	254
	sts	<__TEXT_REGION_LENGTH__+X>, R
	adiw	R, 0x1c	;	28
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	out	0x3f, R	;	63
	pop	R
	pop	R
	reti
	ldi	R, 0xFE	;	254
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<__vector_11+X>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<__vector_11+X>
	cpi	R, 0x01	;	1
	brne	<__vector_11+X>
	cpse	R, R
	rjmp	<__vector_11+X>
	cpi	R, 0x01	;	1
	cpc	R, R
	brne	<__vector_11+X>
	lds	R, <_usbCurrentStatus>
	andi	R, 0xFD	;	253
	sts	<_usbCurrentStatus>, R
	rjmp	<__vector_11+X>
	cpi	R, 0x03	;	3
	brne	<__vector_11+X>
	cpse	R, R
	rjmp	<__vector_11+X>
	cpi	R, 0x01	;	1
	cpc	R, R
	brne	<__vector_11+X>
	lds	R, <_usbCurrentStatus>
	ori	R, 0x02	;	2
	rjmp	<__vector_11+X>
	cpi	R, 0x05	;	5
	brne	<__vector_11+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrs	R, 0
	rjmp	<__vector_11+X>
	ori	R, 0x80	;	128
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<__vector_11+X>
	cpi	R, 0x06	;	6
	breq	<__vector_11+X>
	rjmp	<__vector_11+X>
	ldd	R, Y+27	;	0x1b
	ldd	R, Y+28	;	0x1c
	ldi	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<_cmark+X>, R
	sts	<_cmark>, R
	cpse	R, R
	rjmp	<__vector_11+X>
	sts	<_cend+X>, R
	sts	<_cend>, R
	call	<SendInterfaces()>
	std	Y+7, R	;	0x07
	ldi	R, 0x09	;	9
	std	Y+1, R	;	0x01
	std	Y+2, R	;	0x02
	ldi	R, 0x01	;	1
	std	Y+6, R	;	0x06
	ldi	R, 0xA0	;	160
	std	Y+8, R	;	0x08
	ldi	R, 0xFA	;	250
	std	Y+9, R	;	0x09
	lds	R, <_cmark>
	lds	R, <_cmark+X>
	subi	R, 0xF7	;	247
	sbci	R, 0xFF	;	255
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	std	Y+5, R	;	0x05
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<_cmark+X>, R
	sts	<_cmark>, R
	sts	<_cend+X>, R
	sts	<_cend>, R
	ldi	R, 0x09	;	9
	ldi	R, 0x00	;	0
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	ldi	R, 0x00	;	0
	call	<USB_SendControl(unsigned char, void const*, int)>
	call	<SendInterfaces()>
	rjmp	<__vector_11+X>
	sts	<_cend+X>, R
	sts	<_cend>, R
	call	<PluggableUSB()>
	movw	R, R
	adiw	R, 0x02	;	2
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brne	<__vector_11+X>
	rjmp	<__vector_11+X>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+4	;	0x04
	ldd	R, Z+5	;	0x05
	mov	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	icall
	sbiw	R, 0x00	;	0
	breq	<__vector_11+X>
	rjmp	<__vector_11+X>
	movw	R, R
	ldd	R, Z+8	;	0x08
	ldd	R, Z+9	;	0x09
	rjmp	<__vector_11+X>
	ldi	R, 0x03	;	3
	cpse	R, R
	rjmp	<__vector_11+X>
	ldd	R, Y+23	;	0x17
	and	R, R
	brne	<__vector_11+X>
	rjmp	<__vector_11+X>
	cpi	R, 0x02	;	2
	brne	<__vector_11+X>
	ldi	R, 0x80	;	128
	ldi	R, 0x0C	;	12
	ldi	R, 0x48	;	72
	ldi	R, 0x06	;	6
	call	<USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)>
	cpse	R, R
	rjmp	<__vector_11+X>
	ldi	R, 0x21	;	33
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<__vector_11+X>
	cpi	R, 0x01	;	1
	brne	<__vector_11+X>
	ldi	R, 0x80	;	128
	ldi	R, 0x08	;	8
	ldi	R, 0x3F	;	63
	ldi	R, 0x06	;	6
	rjmp	<__vector_11+X>
	cpi	R, 0x03	;	3
	brne	<__vector_11+X>
	call	<PluggableUSB()>
	movw	R, R
	adiw	R, 0x02	;	2
	ld	R, X+
	ld	R, X
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	cp	R, R
	cpc	R, R
	breq	<__vector_11+X>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+6	;	0x06
	ldd	R, Z+7	;	0x07
	mov	R, R
	movw	R, R
	movw	R, R
	icall
	add	R, R
	adc	R, R
	movw	R, R
	ldd	R, Z+8	;	0x08
	ldd	R, Z+9	;	0x09
	rjmp	<__vector_11+X>
	movw	R, R
	st	X, R
	movw	R, R
	ld	R, Z+
	and	R, R
	brne	<__vector_11+X>
	sbiw	R, 0x01	;	1
	movw	R, R
	sub	R, R
	sbc	R, R
	ldi	R, 0x00	;	0
	movw	R, R
	rjmp	<__vector_11+X>
	ldi	R, 0x29	;	41
	ldi	R, 0x06	;	6
	movw	R, R
	lpm	R, Z
	ldi	R, 0x00	;	0
	ldi	R, 0x80	;	128
	call	<USB_SendControl(unsigned char, void const*, int)>
	rjmp	<__vector_11+X>
	cpi	R, 0x07	;	7
	brne	<__vector_11+X>
	rjmp	<__vector_11+X>
	cpi	R, 0x08	;	8
	brne	<__vector_11+X>
	ldi	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<__vector_11+X>
	cpi	R, 0x09	;	9
	breq	<__vector_11+X>
	rjmp	<__vector_11+X>
	andi	R, 0x03	;	3
	breq	<__vector_11+X>
	rjmp	<__vector_11+X>
	ldi	R, 0x35	;	53
	ldi	R, 0x01	;	1
	ldi	R, 0x01	;	1
	ldi	R, 0x01	;	1
	ldi	R, 0x36	;	54
	ld	R, Z+
	and	R, R
	breq	<__vector_11+X>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	movw	R, R
	sbiw	R, 0x01	;	1
	ld	R, X
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	subi	R, 0xFF	;	255
	cpi	R, 0x07	;	7
	brne	<__vector_11+X>
	ldi	R, 0x7E	;	126
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldd	R, Y+23	;	0x17
	sts	<_usbConfiguration>, R
	rjmp	<__vector_11+X>
	ldd	R, Y+27	;	0x1b
	ldd	R, Y+28	;	0x1c
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<_cmark+X>, R
	sts	<_cmark>, R
	sts	<_cend+X>, R
	sts	<_cend>, R
	ldd	R, Y+25	;	0x19
	cpse	R, R
	rjmp	<__vector_11+X>
	ldd	R, Y+22	;	0x16
	ldd	R, Y+21	;	0x15
	cpi	R, 0xA1	;	161
	brne	<__vector_11+X>
	cpi	R, 0x21	;	33
	breq	<__vector_11+X>
	rjmp	<__vector_11+X>
	ldi	R, 0x07	;	7
	ldi	R, 0x00	;	0
	ldi	R, 0x08	;	8
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	rjmp	<__vector_11+X>
	cpi	R, 0x21	;	33
	breq	<__vector_11+X>
	rjmp	<__vector_11+X>
	cpi	R, 0x23	;	35
	brne	<__vector_11+X>
	ldd	R, Y+23	;	0x17
	ldd	R, Y+24	;	0x18
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	sts	<breakValue>, R
	sts	<breakValue+X>, R
	sts	<breakValue+X>, R
	sts	<breakValue+X>, R
	rjmp	<__vector_11+X>
	cpi	R, 0x20	;	32
	brne	<__vector_11+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrs	R, 2
	rjmp	<__vector_11+X>
	ldi	R, 0x08	;	8
	ldi	R, 0x08	;	8
	ldi	R, 0x01	;	1
	subi	R, 0x01	;	1
	breq	<__vector_11+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	st	Z, R
	adiw	R, 0x01	;	1
	rjmp	<__vector_11+X>
	ldi	R, 0x64	;	100
	sts	<RxLEDPulse>, R
	ldi	R, 0xFB	;	251
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<__vector_11+X>
	cpi	R, 0x22	;	34
	breq	<__vector_11+X>
	rjmp	<__vector_11+X>
	ldd	R, Y+23	;	0x17
	sts	<_usbLineInfo+X>, R
	ldi	R, 0xFE	;	254
	ldi	R, 0x7F	;	127
	lpm	R, Z+
	lpm	R, Z
	cpi	R, 0xFB	;	251
	sbci	R, 0xDC	;	220
	breq	<__vector_11+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x08	;	8
	lds	R, <_usbLineInfo>
	lds	R, <_usbLineInfo+X>
	lds	R, <_usbLineInfo+X>
	lds	R, <_usbLineInfo+X>
	cpi	R, 0xB0	;	176
	sbci	R, 0x04	;	4
	cpc	R, R
	cpc	R, R
	brne	<__vector_11+X>
	lds	R, <_usbLineInfo+X>
	sbrc	R, 0
	rjmp	<__vector_11+X>
	cpi	R, 0xFE	;	254
	ldi	R, 0x0A	;	10
	cpc	R, R
	brne	<__vector_11+X>
	ldi	R, 0x77	;	119
	ldi	R, 0x77	;	119
	std	Z+1, R	;	0x01
	st	Z, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sts	<wdtcsr_save>, R
	ldi	R, 0x18	;	24
	ldi	R, 0x0B	;	11
	in	R, 0x3f	;	63
	cli
	wdr
	sts	<__TEXT_REGION_LENGTH__+X>, R
	out	0x3f, R	;	63
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<__vector_11+X>
	ldi	R, 0xFE	;	254
	ldi	R, 0x0A	;	10
	rjmp	<__vector_11+X>
	ld	R, Z
	ldd	R, Z+1	;	0x01
	cpi	R, 0x77	;	119
	sbci	R, 0x77	;	119
	breq	<__vector_11+X>
	rjmp	<__vector_11+X>
	wdr
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x18	;	24
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <wdtcsr_save>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	cpi	R, 0xFE	;	254
	ldi	R, 0x0A	;	10
	cpc	R, R
	breq	<__vector_11+X>
	lds	R, <__bss_end+X>
	lds	R, <__bss_end+X>
	std	Z+1, R	;	0x01
	st	Z, R
	rjmp	<__vector_11+X>
	ld	R, Z
	ldd	R, Z+1	;	0x01
	cpi	R, 0x77	;	119
	cpc	R, R
	breq	<__vector_11+X>
	sts	<__bss_end+X>, R
	sts	<__bss_end+X>, R
	rjmp	<__vector_11+X>
	sts	<__bss_end+X>, R
	sts	<__bss_end+X>, R
	rjmp	<__vector_11+X>
	call	<PluggableUSB()>
	movw	R, R
	adiw	R, 0x02	;	2
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brne	<__vector_11+X>
	rjmp	<__vector_11+X>
	movw	R, R
	ld	R, X+
	ld	R, X
	ld	R, Z+
	ld	R, Z
	mov	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	icall
	cpse	R, R
	rjmp	<__vector_11+X>
	movw	R, R
	ldd	R, Z+8	;	0x08
	ldd	R, Z+9	;	0x09
	rjmp	<__vector_11+X>
	cp	R, R
	cpc	R, R
	brge	<__vector_11+X>
	rjmp	<__vector_11+X>
	rjmp	<__vector_11+X>
	ldi	R, 0x01	;	1
	cpse	R, R
	rjmp	<__vector_11+X>
	ldi	R, 0x2D	;	45
	ldi	R, 0x06	;	6
	rjmp	<__vector_11+X>

__vector_23:
	push	R
	push	R
	in	R, 0x3f	;	63
	push	R
	eor	R, R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	lds	R, <timer0_millis>
	lds	R, <timer0_millis+X>
	lds	R, <timer0_millis+X>
	lds	R, <timer0_millis+X>
	lds	R, <timer0_fract>
	ldi	R, 0x06	;	6
	add	R, R
	cpi	R, 0x7D	;	125
	brcc	<__vector_23+X>
	adiw	R, 0x02	;	2
	adc	R, R
	adc	R, R
	sts	<timer0_fract>, R
	sts	<timer0_millis>, R
	sts	<timer0_millis+X>, R
	sts	<timer0_millis+X>, R
	sts	<timer0_millis+X>, R
	lds	R, <timer0_overflow_count>
	lds	R, <timer0_overflow_count+X>
	lds	R, <timer0_overflow_count+X>
	lds	R, <timer0_overflow_count+X>
	adiw	R, 0x01	;	1
	adc	R, R
	adc	R, R
	sts	<timer0_overflow_count>, R
	sts	<timer0_overflow_count+X>, R
	sts	<timer0_overflow_count+X>, R
	sts	<timer0_overflow_count+X>, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	out	0x3f, R	;	63
	pop	R
	pop	R
	reti
	ldi	R, 0x89	;	137
	add	R, R
	adiw	R, 0x03	;	3
	adc	R, R
	adc	R, R
	rjmp	<__vector_23+X>

__vector_25:
	push	R
	push	R
	in	R, 0x3f	;	63
	push	R
	eor	R, R
	push	R
	push	R
	push	R
	push	R
	push	R
	lds	R, <Serial1+X>
	lds	R, <Serial1+X>
	ld	R, Z
	lds	R, <Serial1+X>
	lds	R, <Serial1+X>
	sbrc	R, 2
	rjmp	<__vector_25+X>
	ld	R, Z
	lds	R, <Serial1+X>
	subi	R, 0xFF	;	255
	andi	R, 0x3F	;	63
	lds	R, <Serial1+X>
	cp	R, R
	breq	<__vector_25+X>
	lds	R, <Serial1+X>
	ldi	R, 0x00	;	0
	subi	R, 0x10	;	16
	sbci	R, 0xFA	;	250
	std	Z+29, R	;	0x1d
	sts	<Serial1+X>, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	out	0x3f, R	;	63
	pop	R
	pop	R
	reti
	ld	R, Z
	rjmp	<__vector_25+X>

__vector_26:
	push	R
	push	R
	in	R, 0x3f	;	63
	push	R
	eor	R, R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	ldi	R, 0xF0	;	240
	ldi	R, 0x05	;	5
	call	<HardwareSerial::_tx_udr_empty_irq()>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	out	0x3f, R	;	63
	pop	R
	pop	R
	reti

__vector_36:
	push	R
	push	R
	in	R, 0x3f	;	63
	push	R
	eor	R, R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xF8	;	248
	cpi	R, 0x60	;	96
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	brcc	<__vector_36+X>
	cpi	R, 0x28	;	40
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	brcc	<__vector_36+X>
	cpi	R, 0x10	;	16
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	brcc	<__vector_36+X>
	and	R, R
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	cpi	R, 0x08	;	8
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	out	0x3f, R	;	63
	pop	R
	pop	R
	reti
	cpi	R, 0x18	;	24
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	cpi	R, 0x20	;	32
	brne	<__vector_36+X>
	sts	<twi_error>, R
	rjmp	<__vector_36+X>
	cpi	R, 0x40	;	64
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	brcc	<__vector_36+X>
	cpi	R, 0x30	;	48
	breq	<__vector_36+X>
	cpi	R, 0x38	;	56
	brne	<__vector_36+X>
	sts	<twi_error>, R
	ldi	R, 0xC5	;	197
	rjmp	<__vector_36+X>
	cpi	R, 0x50	;	80
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	cpi	R, 0x58	;	88
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	cpi	R, 0x48	;	72
	brne	<__vector_36+X>
	call	<twi_stop>
	rjmp	<__vector_36+X>
	cpi	R, 0x98	;	152
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	brcc	<__vector_36+X>
	cpi	R, 0x78	;	120
	breq	<__vector_36+X>
	brcc	<__vector_36+X>
	cpi	R, 0x68	;	104
	breq	<__vector_36+X>
	cpi	R, 0x70	;	112
	brne	<__vector_36+X>
	ldi	R, 0x03	;	3
	sts	<twi_state>, R
	sts	<twi_rxBufferIndex>, R
	rjmp	<__vector_36+X>
	cpi	R, 0x88	;	136
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	cpi	R, 0x90	;	144
	breq	<__vector_36+X>
	cpi	R, 0x80	;	128
	breq	<__vector_36+X>
	rjmp	<__vector_36+X>
	lds	R, <twi_rxBufferIndex>
	cpi	R, 0x20	;	32
	brcs	<__vector_36+X>
	rjmp	<__vector_36+X>
	lds	R, <twi_rxBufferIndex>
	ldi	R, 0x01	;	1
	add	R, R
	sts	<twi_rxBufferIndex>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ldi	R, 0x00	;	0
	subi	R, 0x36	;	54
	sbci	R, 0xFB	;	251
	st	Z, R
	rjmp	<__vector_36+X>
	cpi	R, 0xB0	;	176
	breq	<__vector_36+X>
	brcc	<__vector_36+X>
	cpi	R, 0xA0	;	160
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	cpi	R, 0xA8	;	168
	breq	<__vector_36+X>
	rjmp	<__vector_36+X>
	ldi	R, 0x04	;	4
	sts	<twi_state>, R
	sts	<twi_txBufferIndex>, R
	sts	<twi_txBufferLength>, R
	lds	R, <twi_onSlaveTransmit>
	lds	R, <twi_onSlaveTransmit+X>
	icall
	lds	R, <twi_txBufferLength>
	cpse	R, R
	rjmp	<__vector_36+X>
	ldi	R, 0x01	;	1
	sts	<twi_txBufferLength>, R
	sts	<twi_txBuffer>, R
	rjmp	<__vector_36+X>
	cpi	R, 0xC0	;	192
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	cpi	R, 0xC8	;	200
	brne	<__vector_36+X>
	rjmp	<__vector_36+X>
	cpi	R, 0xB8	;	184
	breq	<__vector_36+X>
	rjmp	<__vector_36+X>
	lds	R, <twi_txBufferIndex>
	ldi	R, 0x01	;	1
	add	R, R
	sts	<twi_txBufferIndex>, R
	ldi	R, 0x00	;	0
	subi	R, 0x58	;	88
	sbci	R, 0xFB	;	251
	ld	R, Z
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <twi_txBufferIndex>
	lds	R, <twi_txBufferLength>
	rjmp	<__vector_36+X>
	lds	R, <twi_slarw>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0xC5	;	197
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<__vector_36+X>
	lds	R, <twi_masterBufferIndex>
	lds	R, <twi_masterBufferLength>
	cp	R, R
	brcc	<__vector_36+X>
	lds	R, <twi_masterBufferIndex>
	ldi	R, 0x01	;	1
	add	R, R
	sts	<twi_masterBufferIndex>, R
	ldi	R, 0x00	;	0
	subi	R, 0x04	;	4
	sbci	R, 0xFB	;	251
	ld	R, Z
	rjmp	<__vector_36+X>
	lds	R, <twi_masterBufferIndex>
	ldi	R, 0x01	;	1
	add	R, R
	sts	<twi_masterBufferIndex>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ldi	R, 0x00	;	0
	subi	R, 0x04	;	4
	sbci	R, 0xFB	;	251
	st	Z, R
	lds	R, <twi_masterBufferIndex>
	lds	R, <twi_masterBufferLength>
	cp	R, R
	brcs	<__vector_36+X>
	ldi	R, 0x85	;	133
	rjmp	<__vector_36+X>
	lds	R, <twi_masterBufferIndex>
	ldi	R, 0x01	;	1
	add	R, R
	sts	<twi_masterBufferIndex>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ldi	R, 0x00	;	0
	subi	R, 0x04	;	4
	sbci	R, 0xFB	;	251
	st	Z, R
	lds	R, <twi_sendStop>
	cpse	R, R
	rjmp	<__vector_36+X>
	ldi	R, 0x01	;	1
	sts	<twi_inRepStart>, R
	ldi	R, 0xA4	;	164
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<twi_state>, R
	rjmp	<__vector_36+X>
	ldi	R, 0xC5	;	197
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<twi_state>, R
	lds	R, <twi_rxBufferIndex>
	cpi	R, 0x20	;	32
	brcc	<__vector_36+X>
	lds	R, <twi_rxBufferIndex>
	ldi	R, 0x00	;	0
	subi	R, 0x36	;	54
	sbci	R, 0xFB	;	251
	st	Z, R
	lds	R, <twi_rxBufferIndex>
	ldi	R, 0x00	;	0
	lds	R, <twi_onSlaveReceive>
	lds	R, <twi_onSlaveReceive+X>
	ldi	R, 0xCA	;	202
	ldi	R, 0x04	;	4
	icall
	sts	<twi_rxBufferIndex>, R
	rjmp	<__vector_36+X>
	sts	<twi_error>, R
	rjmp	<__vector_36+X>

__vectors:
	jmp	<__ctors_end>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__vector_10>
	jmp	<__vector_11>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__vector_23>
	jmp	<__bad_interrupt>
	jmp	<__vector_25>
	jmp	<__vector_26>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__vector_36>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>
	jmp	<__bad_interrupt>

_cdcInterface:
08 0b 00 02 02 02 00 00 09 04 00 00 01 02 02 00     ................
00 05 24 00 10 01 05 24 01 01 01 04 24 02 06 05     ..$....$....$...
24 06 00 01 07 05 81 03 10 00 40 09 04 01 00 02     $.........@.....
0a 00 00 00 07 05 02 02 40 00 00 07 05 83 02 40     ........@......@

_exit:
	cli

abort:
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	cli
	jmp	<_exit>

Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	sbiw	R, 0x1a	;	26
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	std	Y+26, R	;	0x1a
	std	Y+25, R	;	0x19
	std	Y+2, R	;	0x02
	std	Y+1, R	;	0x01
	movw	R, R
	mov	R, R
	std	Y+8, R	;	0x08
	std	Y+7, R	;	0x07
	movw	R, R
	mov	R, R
	movw	R, R
	adiw	R, 0x19	;	25
	ld	R, X+
	ld	R, X
	sbiw	R, 0x1a	;	26
	cp	R, R
	cpc	R, R
	breq	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	adiw	R, 0x08	;	8
	ld	R, X+
	ld	R, X
	sbiw	R, 0x09	;	9
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	adiw	R, 0x0a	;	10
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	mov	R, R
	mov	R, R
	ldi	R, 0x06	;	6
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	std	Y+12, R	;	0x0c
	std	Y+11, R	;	0x0b
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	mov	R, R
	ldi	R, 0x00	;	0
	std	Y+10, R	;	0x0a
	std	Y+9, R	;	0x09
	ldi	R, 0x03	;	3
	add	R, R
	adc	R, R
	dec	R
	brne	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	std	Y+16, R	;	0x10
	std	Y+15, R	;	0x0f
	movw	R, R
	add	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	adiw	R, 0x18	;	24
	ld	R, X
	cpse	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldi	R, 0xAF	;	175
	cp	R, R
	brcc	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	inc	R
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	ld	R, X+
	ld	R, X
	sbiw	R, 0x01	;	1
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	movw	R, R
	icall
	ldi	R, 0x05	;	5
	mul	R, R
	movw	R, R
	eor	R, R
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	mov	R, R
	mov	R, R
	movw	R, R
	subi	R, 0x19	;	25
	sbci	R, 0xFF	;	255
	std	Y+24, R	;	0x18
	std	Y+23, R	;	0x17
	mov	R, R
	ldi	R, 0x00	;	0
	std	Y+22, R	;	0x16
	std	Y+21, R	;	0x15
	ldd	R, Y+23	;	0x17
	ldd	R, Y+24	;	0x18
	add	R, R
	adc	R, R
	lpm	R, Z
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	mov	R, R
	mov	R, R
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	add	R, R
	adc	R, R
	std	Y+18, R	;	0x12
	std	Y+17, R	;	0x11
	mov	R, R
	ldi	R, 0x00	;	0
	std	Y+20, R	;	0x14
	std	Y+19, R	;	0x13
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	ld	R, Z
	ldd	R, Z+1	;	0x01
	sbrs	R, 0
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldi	R, 0x01	;	1
	cpse	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	cpse	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	adiw	R, 0x0c	;	12
	ld	R, X+
	ld	R, X
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	movw	R, R
	add	R, R
	adc	R, R
	ldd	R, Y+17	;	0x11
	ldd	R, Y+18	;	0x12
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	icall
	ldd	R, Y+19	;	0x13
	ldd	R, Y+20	;	0x14
	asr	R
	ror	R
	mov	R, R
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	ldd	R, Y+21	;	0x15
	ldd	R, Y+22	;	0x16
	add	R, R
	adc	R, R
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	ldi	R, 0x08	;	8
	cp	R, R
	cpc	R, R
	brne	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	ldd	R, Y+3	;	0x03
	ldd	R, Y+4	;	0x04
	add	R, R
	adc	R, R
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	ldi	R, 0x05	;	5
	cp	R, R
	cpc	R, R
	breq	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	cp	R, R
	cpc	R, R
	breq	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	ld	R, X+
	ld	R, X
	ldi	R, 0x01	;	1
	cpse	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	cpse	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	subi	R, 0xFB	;	251
	sbci	R, 0xFF	;	255
	ldd	R, Z+16	;	0x10
	ldd	R, Z+17	;	0x11
	mov	R, R
	movw	R, R
	ldi	R, 0x08	;	8
	ldi	R, 0x00	;	0
	movw	R, R
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	icall
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	ld	R, X+
	ld	R, X
	sbiw	R, 0x01	;	1
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	adiw	R, 0x1a	;	26
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp
	adiw	R, 0x0e	;	14
	ld	R, X+
	ld	R, X
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	ldd	R, Y+9	;	0x09
	ldd	R, Y+10	;	0x0a
	movw	R, R
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	ldd	R, Y+3	;	0x03
	ldd	R, Y+4	;	0x04
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	icall
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	cp	R, R
	cpc	R, R
	brne	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldi	R, 0x01	;	1
	cpse	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	cpse	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	adiw	R, 0x0c	;	12
	ld	R, X+
	ld	R, X
	movw	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	adiw	R, 0x0e	;	14
	ld	R, X+
	ld	R, X
	movw	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldd	R, Y+11	;	0x0b
	ldd	R, Y+12	;	0x0c
	sub	R, R
	sbc	R, R
	ldd	R, Z+14	;	0x0e
	ldd	R, Z+15	;	0x0f
	mov	R, R
	movw	R, R
	ldd	R, Y+15	;	0x0f
	ldd	R, Y+16	;	0x10
	movw	R, R
	movw	R, R
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	icall
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	movw	R, R
	adiw	R, 0x04	;	4
	lpm	R, Z
	sbiw	R, 0x02	;	2
	lpm	R, Z+
	lpm	R, Z
	sub	R, R
	ldi	R, 0x07	;	7
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	movw	R, R
	lpm	R, Z+
	lpm	R, Z
	std	Y+20, R	;	0x14
	std	Y+19, R	;	0x13
	movw	R, R
	lpm	R, Z+
	lpm	R, Z
	movw	R, R
	adiw	R, 0x02	;	2
	lpm	R, Z
	adiw	R, 0x01	;	1
	lpm	R, Z
	std	Y+17, R	;	0x11
	adiw	R, 0x02	;	2
	lpm	R, Z
	adiw	R, 0x01	;	1
	lpm	R, Z
	ldi	R, 0x01	;	1
	cp	R, R
	brcs	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	cp	R, R
	brcs	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	mov	R, R
	mov	R, R
	add	R, R
	sbc	R, R
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	mov	R, R
	mov	R, R
	add	R, R
	sbc	R, R
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	ld	R, X+
	ld	R, X
	sbiw	R, 0x01	;	1
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	movw	R, R
	icall
	mov	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	ldi	R, 0x00	;	0
	std	Y+10, R	;	0x0a
	std	Y+9, R	;	0x09
	mov	R, R
	ldi	R, 0x00	;	0
	std	Y+12, R	;	0x0c
	std	Y+11, R	;	0x0b
	movw	R, R
	add	R, R
	adc	R, R
	sbrc	R, 7
	dec	R
	std	Y+24, R	;	0x18
	std	Y+23, R	;	0x17
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	add	R, R
	adc	R, R
	sbrc	R, 7
	dec	R
	std	Y+14, R	;	0x0e
	std	Y+13, R	;	0x0d
	ldd	R, Y+17	;	0x11
	cp	R, R
	brcs	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	mov	R, R
	ldi	R, 0x00	;	0
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	add	R, R
	adc	R, R
	ldd	R, Y+9	;	0x09
	ldd	R, Y+10	;	0x0a
	mul	R, R
	movw	R, R
	mul	R, R
	add	R, R
	mul	R, R
	add	R, R
	eor	R, R
	movw	R, R
	add	R, R
	adc	R, R
	std	Y+16, R	;	0x10
	std	Y+15, R	;	0x0f
	mov	R, R
	mov	R, R
	ldd	R, Y+23	;	0x17
	ldd	R, Y+24	;	0x18
	add	R, R
	adc	R, R
	std	Y+22, R	;	0x16
	std	Y+21, R	;	0x15
	cp	R, R
	brcs	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	eor	R, R
	inc	R
	add	R, R
	andi	R, 0x07	;	7
	brne	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	movw	R, R
	adiw	R, 0x01	;	1
	ldd	R, Y+19	;	0x13
	ldd	R, Y+20	;	0x14
	add	R, R
	adc	R, R
	lpm	R, Z
	movw	R, R
	sbrs	R, 7
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	ld	R, X+
	ld	R, X
	mov	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x01	;	1
	cpse	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	cpse	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldd	R, Y+13	;	0x0d
	ldd	R, Y+14	;	0x0e
	add	R, R
	adc	R, R
	ldd	R, Z+12	;	0x0c
	ldd	R, Z+13	;	0x0d
	mov	R, R
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	ldd	R, Y+21	;	0x15
	ldd	R, Y+22	;	0x16
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	icall
	add	R, R
	inc	R
	mov	R, R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	ldd	R, Y+3	;	0x03
	ldd	R, Y+4	;	0x04
	add	R, R
	adc	R, R
	ldd	R, Y+11	;	0x0b
	ldd	R, Y+12	;	0x0c
	mul	R, R
	movw	R, R
	mul	R, R
	add	R, R
	mul	R, R
	add	R, R
	eor	R, R
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	add	R, R
	adc	R, R
	ldd	R, Z+14	;	0x0e
	ldd	R, Z+15	;	0x0f
	mov	R, R
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	ldd	R, Y+9	;	0x09
	ldd	R, Y+10	;	0x0a
	movw	R, R
	ldd	R, Y+15	;	0x0f
	ldd	R, Y+16	;	0x10
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	icall
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	add	R, R
	inc	R
	rjmp	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)+X>
	adiw	R, 0x1a	;	26
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_GFX::drawFastHLine(int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	icall
	movw	R, R
	add	R, R
	adc	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+20	;	0x14
	ldd	R, Z+21	;	0x15
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp

Adafruit_GFX::drawFastVLine(int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	icall
	add	R, R
	adc	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+20	;	0x14
	ldd	R, Z+21	;	0x15
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp

Adafruit_GFX::drawLine(int, int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brne	<Adafruit_GFX::drawLine(int, int, int, int, unsigned int)+X>
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::drawLine(int, int, int, int, unsigned int)+X>
	mov	R, R
	mov	R, R
	movw	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	sub	R, R
	sbc	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	ldd	R, Z+28	;	0x1c
	ldd	R, Z+29	;	0x1d
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	cp	R, R
	cpc	R, R
	brne	<Adafruit_GFX::drawLine(int, int, int, int, unsigned int)+X>
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::drawLine(int, int, int, int, unsigned int)+X>
	mov	R, R
	movw	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	sub	R, R
	sbc	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	ldd	R, Z+30	;	0x1e
	ldd	R, Z+31	;	0x1f
	mov	R, R
	movw	R, R
	movw	R, R
	rjmp	<Adafruit_GFX::drawLine(int, int, int, int, unsigned int)+X>
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	icall
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+20	;	0x14
	ldd	R, Z+21	;	0x15
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp

Adafruit_GFX::drawRect(int, int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	icall
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+18	;	0x12
	ldd	R, Z+19	;	0x13
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	movw	R, R
	add	R, R
	adc	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+18	;	0x12
	ldd	R, Z+19	;	0x13
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+16	;	0x10
	ldd	R, Z+17	;	0x11
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	add	R, R
	adc	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+16	;	0x10
	ldd	R, Z+17	;	0x11
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp

Adafruit_GFX::fillRect(int, int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	icall
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brge	<Adafruit_GFX::fillRect(int, int, int, int, unsigned int)+X>
	ldd	R, Z+16	;	0x10
	ldd	R, Z+17	;	0x11
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	adiw	R, 0x01	;	1
	rjmp	<Adafruit_GFX::fillRect(int, int, int, int, unsigned int)+X>
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp

Adafruit_GFX::fillScreen(unsigned int):
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	adiw	R, 0x0a	;	10
	ld	R, X+
	ld	R, X
	sbiw	R, 0x0b	;	11
	adiw	R, 0x08	;	8
	ld	R, X+
	ld	R, X
	sbiw	R, 0x09	;	9
	ld	R, X+
	ld	R, X
	ldd	R, Z+32	;	0x20
	ldd	R, Z+33	;	0x21
	mov	R, R
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	icall
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_GFX::invertDisplay(bool):
	ret

Adafruit_GFX::setRotation(unsigned char):
	movw	R, R
	andi	R, 0x03	;	3
	std	Z+22, R	;	0x16
	ldd	R, Z+4	;	0x04
	ldd	R, Z+5	;	0x05
	ldd	R, Z+6	;	0x06
	ldd	R, Z+7	;	0x07
	cpi	R, 0x01	;	1
	breq	<Adafruit_GFX::setRotation(unsigned char)+X>
	cpi	R, 0x03	;	3
	breq	<Adafruit_GFX::setRotation(unsigned char)+X>
	std	Z+9, R	;	0x09
	std	Z+8, R	;	0x08
	std	Z+11, R	;	0x0b
	std	Z+10, R	;	0x0a
	ret
	std	Z+9, R	;	0x09
	std	Z+8, R	;	0x08
	std	Z+11, R	;	0x0b
	std	Z+10, R	;	0x0a
	ret

Adafruit_GFX::startWrite():
	ret

Adafruit_GFX::write(unsigned char):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	mov	R, R
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	sbiw	R, 0x00	;	0
	breq	<Adafruit_GFX::write(unsigned char)+X>
	rjmp	<Adafruit_GFX::write(unsigned char)+X>
	cpi	R, 0x0A	;	10
	brne	<Adafruit_GFX::write(unsigned char)+X>
	std	Y+13, R	;	0x0d
	std	Y+12, R	;	0x0c
	ldd	R, Y+21	;	0x15
	ldi	R, 0x08	;	8
	mul	R, R
	movw	R, R
	eor	R, R
	ldd	R, Y+14	;	0x0e
	ldd	R, Y+15	;	0x0f
	add	R, R
	adc	R, R
	std	Y+15, R	;	0x0f
	std	Y+14, R	;	0x0e
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	cpi	R, 0x0D	;	13
	breq	<Adafruit_GFX::write(unsigned char)+X>
	ldd	R, Y+20	;	0x14
	ldd	R, Y+21	;	0x15
	ldd	R, Y+23	;	0x17
	and	R, R
	breq	<Adafruit_GFX::write(unsigned char)+X>
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	ldi	R, 0x06	;	6
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	ldd	R, Y+8	;	0x08
	ldd	R, Y+9	;	0x09
	cp	R, R
	cpc	R, R
	brge	<Adafruit_GFX::write(unsigned char)+X>
	ldd	R, Y+14	;	0x0e
	ldd	R, Y+15	;	0x0f
	std	Y+13, R	;	0x0d
	std	Y+12, R	;	0x0c
	ldi	R, 0x08	;	8
	mul	R, R
	movw	R, R
	eor	R, R
	add	R, R
	adc	R, R
	std	Y+15, R	;	0x0f
	std	Y+14, R	;	0x0e
	ldd	R, Y+18	;	0x12
	ldd	R, Y+19	;	0x13
	ldd	R, Y+16	;	0x10
	ldd	R, Y+17	;	0x11
	ldd	R, Y+14	;	0x0e
	ldd	R, Y+15	;	0x0f
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	movw	R, R
	call	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)>
	ldd	R, Y+20	;	0x14
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	ldi	R, 0x06	;	6
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	std	Y+13, R	;	0x0d
	std	Y+12, R	;	0x0c
	rjmp	<Adafruit_GFX::write(unsigned char)+X>
	cpi	R, 0x0A	;	10
	brne	<Adafruit_GFX::write(unsigned char)+X>
	std	Y+13, R	;	0x0d
	std	Y+12, R	;	0x0c
	movw	R, R
	adiw	R, 0x08	;	8
	lpm	R, Z
	ldd	R, Y+21	;	0x15
	ldd	R, Y+14	;	0x0e
	ldd	R, Y+15	;	0x0f
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	rjmp	<Adafruit_GFX::write(unsigned char)+X>
	cpi	R, 0x0D	;	13
	brne	<Adafruit_GFX::write(unsigned char)+X>
	rjmp	<Adafruit_GFX::write(unsigned char)+X>
	movw	R, R
	adiw	R, 0x04	;	4
	lpm	R, Z
	cp	R, R
	brcc	<Adafruit_GFX::write(unsigned char)+X>
	rjmp	<Adafruit_GFX::write(unsigned char)+X>
	adiw	R, 0x02	;	2
	lpm	R, Z
	cp	R, R
	brcc	<Adafruit_GFX::write(unsigned char)+X>
	rjmp	<Adafruit_GFX::write(unsigned char)+X>
	movw	R, R
	adiw	R, 0x02	;	2
	lpm	R, Z+
	lpm	R, Z
	mov	R, R
	sub	R, R
	mov	R, R
	ldi	R, 0x07	;	7
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	movw	R, R
	adiw	R, 0x02	;	2
	lpm	R, Z
	adiw	R, 0x01	;	1
	lpm	R, Z
	and	R, R
	breq	<Adafruit_GFX::write(unsigned char)+X>
	and	R, R
	breq	<Adafruit_GFX::write(unsigned char)+X>
	ldd	R, Y+20	;	0x14
	movw	R, R
	adiw	R, 0x05	;	5
	lpm	R, Z
	ldd	R, Y+21	;	0x15
	ldd	R, Y+23	;	0x17
	and	R, R
	breq	<Adafruit_GFX::write(unsigned char)+X>
	mov	R, R
	add	R, R
	sbc	R, R
	add	R, R
	adc	R, R
	mul	R, R
	movw	R, R
	mul	R, R
	add	R, R
	eor	R, R
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	add	R, R
	adc	R, R
	ldd	R, Y+8	;	0x08
	ldd	R, Y+9	;	0x09
	cp	R, R
	cpc	R, R
	brge	<Adafruit_GFX::write(unsigned char)+X>
	ldd	R, Y+14	;	0x0e
	ldd	R, Y+15	;	0x0f
	std	Y+13, R	;	0x0d
	std	Y+12, R	;	0x0c
	movw	R, R
	adiw	R, 0x08	;	8
	lpm	R, Z
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	std	Y+15, R	;	0x0f
	std	Y+14, R	;	0x0e
	ldd	R, Y+18	;	0x12
	ldd	R, Y+19	;	0x13
	ldd	R, Y+16	;	0x10
	ldd	R, Y+17	;	0x11
	ldd	R, Y+14	;	0x0e
	ldd	R, Y+15	;	0x0f
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	movw	R, R
	call	<Adafruit_GFX::drawChar(int, int, unsigned char, unsigned int, unsigned int, unsigned char, unsigned char)>
	movw	R, R
	adiw	R, 0x04	;	4
	lpm	R, Z
	ldd	R, Y+20	;	0x14
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	mul	R, R
	add	R, R
	adc	R, R
	eor	R, R
	rjmp	<Adafruit_GFX::write(unsigned char)+X>

Adafruit_GFX::writeFastHLine(int, int, int, unsigned int):
	push	R
	push	R
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+30	;	0x1e
	ldd	R, Z+31	;	0x1f
	mov	R, R
	icall
	pop	R
	pop	R
	ret

Adafruit_GFX::writeFastVLine(int, int, int, unsigned int):
	push	R
	push	R
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+28	;	0x1c
	ldd	R, Z+29	;	0x1d
	mov	R, R
	icall
	pop	R
	pop	R
	ret

Adafruit_GFX::writeFillRect(int, int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+32	;	0x20
	ldd	R, Z+33	;	0x21
	mov	R, R
	icall
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_GFX::writeLine(int, int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	rcall	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	rcall	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	rcall	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	movw	R, R
	movw	R, R
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	movw	R, R
	sub	R, R
	sbc	R, R
	sbrs	R, 7
	rjmp	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	neg	R
	neg	R
	sbc	R, R
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	sub	R, R
	sbc	R, R
	sbrs	R, 7
	rjmp	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	neg	R
	neg	R
	sbc	R, R
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	mov	R, R
	mov	R, R
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	std	Y+5, R	;	0x05
	std	Y+6, R	;	0x06
	mov	R, R
	mov	R, R
	movw	R, R
	mov	R, R
	mov	R, R
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	mov	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	sub	R, R
	sbc	R, R
	sbrs	R, 7
	rjmp	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	neg	R
	neg	R
	sbc	R, R
	movw	R, R
	sbrs	R, 7
	rjmp	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	asr	R
	ror	R
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	cp	R, R
	cpc	R, R
	brge	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	std	Y+2, R	;	0x02
	std	Y+1, R	;	0x01
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+12	;	0x0c
	ldd	R, Z+13	;	0x0d
	mov	R, R
	ldd	R, Y+3	;	0x03
	ldd	R, Y+4	;	0x04
	movw	R, R
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	movw	R, R
	movw	R, R
	icall
	sub	R, R
	sbc	R, R
	sbrs	R, 7
	rjmp	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	add	R, R
	adc	R, R
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	add	R, R
	adc	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	rjmp	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	std	Y+2, R	;	0x02
	std	Y+1, R	;	0x01
	rjmp	<Adafruit_GFX::writeLine(int, int, int, int, unsigned int)+X>
	adiw	R, 0x06	;	6
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_GFX::writePixel(int, int, unsigned int):
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+8	;	0x08
	ldd	R, Z+9	;	0x09
	mov	R, R
	ijmp

Adafruit_GPS::begin(unsigned long) [clone .constprop.80]:
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	rcall	<Adafruit_GPS::begin(unsigned long) [clone .constprop.80]+X>
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	movw	R, R
	movw	R, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	cp	R, R
	cpc	R, R
	brne	<Adafruit_GPS::begin(unsigned long) [clone .constprop.80]+X>
	rjmp	<Adafruit_GPS::begin(unsigned long) [clone .constprop.80]+X>
	movw	R, R
	adiw	R, 0x10	;	16
	ld	R, X+
	ld	R, X
	sbiw	R, 0x11	;	17
	ldi	R, 0x02	;	2
	st	Z, R
	adiw	R, 0x0c	;	12
	ld	R, X+
	ld	R, X
	sbiw	R, 0x0d	;	13
	st	Z, R
	adiw	R, 0x0e	;	14
	ld	R, X+
	ld	R, X
	ldi	R, 0x80	;	128
	ldi	R, 0x84	;	132
	ldi	R, 0x1E	;	30
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	call	<__udivmodsi4>
	subi	R, 0x01	;	1
	sbc	R, R
	sbc	R, R
	sbc	R, R
	lsr	R
	ror	R
	ror	R
	ror	R
	movw	R, R
	st	Z, R
	movw	R, R
	adiw	R, 0x18	;	24
	st	X, R
	sbiw	R, 0x18	;	24
	adiw	R, 0x14	;	20
	ld	R, X+
	ld	R, X
	sbiw	R, 0x15	;	21
	ldi	R, 0x06	;	6
	st	Z, R
	adiw	R, 0x12	;	18
	ld	R, X+
	ld	R, X
	sbiw	R, 0x13	;	19
	ld	R, Z
	ori	R, 0x10	;	16
	st	Z, R
	adiw	R, 0x12	;	18
	ld	R, X+
	ld	R, X
	sbiw	R, 0x13	;	19
	ld	R, Z
	ori	R, 0x08	;	8
	st	Z, R
	adiw	R, 0x12	;	18
	ld	R, X+
	ld	R, X
	sbiw	R, 0x13	;	19
	ld	R, Z
	ori	R, 0x80	;	128
	st	Z, R
	adiw	R, 0x12	;	18
	ld	R, X+
	ld	R, X
	ld	R, Z
	andi	R, 0xDF	;	223
	st	Z, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	or	R, R
	breq	<Adafruit_GPS::begin(unsigned long) [clone .constprop.80]+X>
	sts	<TwoWire::rxBufferIndex>, R
	sts	<TwoWire::rxBufferLength>, R
	sts	<TwoWire::txBufferIndex>, R
	sts	<TwoWire::txBufferLength>, R
	call	<twi_init>
	ldi	R, 0xCC	;	204
	ldi	R, 0x03	;	3
	sts	<twi_onSlaveTransmit+X>, R
	sts	<twi_onSlaveTransmit>, R
	ldi	R, 0xCD	;	205
	ldi	R, 0x03	;	3
	sts	<twi_onSlaveReceive+X>, R
	sts	<twi_onSlaveReceive>, R
	ldi	R, 0x10	;	16
	sts	<GPS+X>, R
	ldi	R, 0x01	;	1
	sts	<TwoWire::transmitting>, R
	sts	<TwoWire::txAddress>, R
	ldi	R, 0x01	;	1
	call	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]>
	ldi	R, 0x01	;	1
	cpse	R, R
	ldi	R, 0x00	;	0
	mov	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	or	R, R
	breq	<Adafruit_GPS::begin(unsigned long) [clone .constprop.80]+X>
	call	<SPIClass::begin()>
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	movw	R, R
	adiw	R, 0x01	;	1
	call	<SPISettings::SPISettings(unsigned long, unsigned char, unsigned char) [clone .constprop.90]>
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	lds	R, <GPS+X>
	sbrc	R, 7
	rjmp	<Adafruit_GPS::begin(unsigned long) [clone .constprop.80]+X>
	ldi	R, 0x01	;	1
	call	<pinMode>
	ldi	R, 0x01	;	1
	lds	R, <GPS+X>
	call	<digitalWrite>
	ldi	R, 0x0A	;	10
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<delay>
	ldi	R, 0x01	;	1
	rjmp	<Adafruit_GPS::begin(unsigned long) [clone .constprop.80]+X>

Adafruit_GPS::isEmpty(char*) [clone .constprop.51]:
	movw	R, R
	ld	R, Z
	cpi	R, 0x2C	;	44
	breq	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]+X>
	cpi	R, 0x2A	;	42
	breq	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]+X>
	ldi	R, 0x01	;	1
	or	R, R
	breq	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]+X>
	ldi	R, 0x00	;	0
	ret
	ldi	R, 0x01	;	1
	ret

Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]:
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	sbiw	R, 0x18	;	24
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	movw	R, R
	std	Y+20, R	;	0x14
	std	Y+19, R	;	0x13
	std	Y+22, R	;	0x16
	std	Y+21, R	;	0x15
	std	Y+24, R	;	0x18
	std	Y+23, R	;	0x17
	movw	R, R
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	ldi	R, 0x0A	;	10
	movw	R, R
	st	Z+, R
	dec	R
	brne	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	ldi	R, 0x2E	;	46
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	movw	R, R
	sbiw	R, 0x00	;	0
	brne	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	cpi	R, 0x07	;	7
	cpc	R, R
	brlt	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	movw	R, R
	movw	R, R
	call	<strncpy>
	movw	R, R
	call	<atol>
	movw	R, R
	movw	R, R
	movw	R, R
	call	<atof>
	std	Y+15, R	;	0x0f
	std	Y+16, R	;	0x10
	std	Y+17, R	;	0x11
	std	Y+18, R	;	0x12
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	movw	R, R
	adiw	R, 0x01	;	1
	call	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]>
	cpse	R, R
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	movw	R, R
	movw	R, R
	ldi	R, 0x64	;	100
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<__divmodsi4>
	movw	R, R
	movw	R, R
	ldi	R, 0x9C	;	156
	ldi	R, 0xFF	;	255
	call	<__mulohisi3>
	movw	R, R
	movw	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	std	Y+11, R	;	0x0b
	std	Y+12, R	;	0x0c
	std	Y+13, R	;	0x0d
	std	Y+14, R	;	0x0e
	movw	R, R
	ldd	R, Z+1	;	0x01
	ldi	R, 0x80	;	128
	ldi	R, 0x96	;	150
	ldi	R, 0x98	;	152
	ldi	R, 0x00	;	0
	call	<__mulsi3>
	ldi	R, 0x3C	;	60
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<__divmodsi4>
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	ldi	R, 0x80	;	128
	ldi	R, 0x96	;	150
	ldi	R, 0x98	;	152
	ldi	R, 0x00	;	0
	call	<__mulsi3>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	call	<__floatsisf>
	movw	R, R
	movw	R, R
	ldi	R, 0x80	;	128
	ldi	R, 0x96	;	150
	ldi	R, 0x18	;	24
	ldi	R, 0x4B	;	75
	ldd	R, Y+15	;	0x0f
	ldd	R, Y+16	;	0x10
	ldd	R, Y+17	;	0x11
	ldd	R, Y+18	;	0x12
	call	<__mulsf3>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x70	;	112
	ldi	R, 0x42	;	66
	call	<__divsf3>
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	call	<__addsf3>
	call	<__fixsfsi>
	movw	R, R
	movw	R, R
	call	<__floatsisf>
	ldi	R, 0x80	;	128
	ldi	R, 0x96	;	150
	ldi	R, 0x18	;	24
	ldi	R, 0x4B	;	75
	call	<__divsf3>
	movw	R, R
	movw	R, R
	mov	R, R
	andi	R, 0xFB	;	251
	cpi	R, 0x53	;	83
	breq	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	com	R
	com	R
	com	R
	com	R
	adc	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	bst	R, 7
	com	R
	bld	R, 7
	com	R
	cpi	R, 0x53	;	83
	breq	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	cpi	R, 0x57	;	87
	brne	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	ldi	R, 0x00	;	0
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	movw	R, R
	call	<__gesf2>
	cp	R, R
	brlt	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0xB4	;	180
	ldi	R, 0x42	;	66
	movw	R, R
	movw	R, R
	call	<__gesf2>
	cp	R, R
	brlt	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x34	;	52
	ldi	R, 0x43	;	67
	movw	R, R
	movw	R, R
	call	<__gesf2>
	cp	R, R
	brlt	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	ldd	R, Y+21	;	0x15
	ldd	R, Y+22	;	0x16
	or	R, R
	breq	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	ldi	R, 0x64	;	100
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	call	<__muluhisi3>
	ldd	R, Y+11	;	0x0b
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	ldd	R, Y+14	;	0x0e
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	call	<__floatsisf>
	ldd	R, Y+15	;	0x0f
	ldd	R, Y+16	;	0x10
	ldd	R, Y+17	;	0x11
	ldd	R, Y+18	;	0x12
	call	<__addsf3>
	ldd	R, Y+21	;	0x15
	ldd	R, Y+22	;	0x16
	st	Z, R
	std	Z+1, R	;	0x01
	std	Z+2, R	;	0x02
	std	Z+3, R	;	0x03
	ldd	R, Y+23	;	0x17
	ldd	R, Y+24	;	0x18
	cp	R, R
	cpc	R, R
	breq	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	movw	R, R
	st	Z, R
	std	Z+1, R	;	0x01
	std	Z+2, R	;	0x02
	std	Z+3, R	;	0x03
	ldd	R, Y+19	;	0x13
	ldd	R, Y+20	;	0x14
	cp	R, R
	cpc	R, R
	breq	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	movw	R, R
	st	Z, R
	std	Z+1, R	;	0x01
	std	Z+2, R	;	0x02
	std	Z+3, R	;	0x03
	cp	R, R
	cpc	R, R
	breq	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	movw	R, R
	st	Z, R
	ldi	R, 0x01	;	1
	adiw	R, 0x18	;	24
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0xB4	;	180
	ldi	R, 0xC2	;	194
	movw	R, R
	movw	R, R
	call	<__cmpsf2>
	sbrc	R, 7
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	movw	R, R
	call	<__gesf2>
	cp	R, R
	brge	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x34	;	52
	ldi	R, 0xC3	;	195
	movw	R, R
	movw	R, R
	call	<__cmpsf2>
	sbrc	R, 7
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	cpi	R, 0x4E	;	78
	brne	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	cpi	R, 0x45	;	69
	breq	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>
	rjmp	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]+X>

Adafruit_GPS::tokenOnList(char*, char const**) [clone .constprop.42]:
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	ldi	R, 0x2E	;	46
	sub	R, R
	ldi	R, 0xF8	;	248
	sbc	R, R
	movw	R, R
	ld	R, Z+
	ld	R, Z+
	movw	R, R
	ldi	R, 0x02	;	2
	ldi	R, 0x00	;	0
	ldi	R, 0xB3	;	179
	ldi	R, 0x01	;	1
	movw	R, R
	call	<strncmp>
	or	R, R
	breq	<Adafruit_GPS::tokenOnList(char*, char const**) [clone .constprop.42]+X>
	cp	R, R
	cpc	R, R
	breq	<Adafruit_GPS::tokenOnList(char*, char const**) [clone .constprop.42]+X>
	movw	R, R
	ld	R, Z+
	and	R, R
	brne	<Adafruit_GPS::tokenOnList(char*, char const**) [clone .constprop.42]+X>
	sbiw	R, 0x01	;	1
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	movw	R, R
	call	<strncmp>
	or	R, R
	brne	<Adafruit_GPS::tokenOnList(char*, char const**) [clone .constprop.42]+X>
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	rjmp	<Adafruit_GPS::tokenOnList(char*, char const**) [clone .constprop.42]+X>

Adafruit_GPS::write(unsigned char):
	push	R
	push	R
	push	R
	movw	R, R
	subi	R, 0x41	;	65
	sbci	R, 0xFF	;	255
	ld	R, Z
	ldd	R, Z+1	;	0x01
	sbiw	R, 0x00	;	0
	breq	<Adafruit_GPS::write(unsigned char)+X>
	ld	R, X+
	ld	R, X
	sbiw	R, 0x01	;	1
	ld	R, Z+
	ld	R, Z
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	ijmp
	mov	R, R
	movw	R, R
	movw	R, R
	subi	R, 0x3F	;	63
	sbci	R, 0xFF	;	255
	ld	R, Z
	ldd	R, Z+1	;	0x01
	sbiw	R, 0x00	;	0
	brne	<Adafruit_GPS::write(unsigned char)+X>
	movw	R, R
	subi	R, 0x3D	;	61
	sbci	R, 0xFF	;	255
	ld	R, Z
	ldd	R, Z+1	;	0x01
	or	R, R
	brne	<Adafruit_GPS::write(unsigned char)+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	ret
	movw	R, R
	subi	R, 0xD4	;	212
	sbci	R, 0xFE	;	254
	ld	R, Z
	ldi	R, 0x01	;	1
	sts	<TwoWire::transmitting>, R
	sts	<TwoWire::txAddress>, R
	sts	<TwoWire::txBufferIndex>, R
	sts	<TwoWire::txBufferLength>, R
	movw	R, R
	ld	R, X+
	ld	R, X
	ld	R, Z+
	ld	R, Z
	mov	R, R
	icall
	sbiw	R, 0x01	;	1
	brne	<Adafruit_GPS::write(unsigned char)+X>
	ldi	R, 0x01	;	1
	call	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]>
	cpse	R, R
	rjmp	<Adafruit_GPS::write(unsigned char)+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	rjmp	<Adafruit_GPS::write(unsigned char)+X>
	movw	R, R
	subi	R, 0x3A	;	58
	sbci	R, 0xFF	;	255
	ld	R, Z
	ldd	R, Z+1	;	0x01
	call	<SPIClass::beginTransaction(SPISettings)>
	subi	R, 0x3B	;	59
	sbci	R, 0xFF	;	255
	ld	R, Y
	sbrc	R, 7
	rjmp	<Adafruit_GPS::write(unsigned char)+X>
	ldi	R, 0x00	;	0
	call	<digitalWrite>
	mov	R, R
	call	<SPIClass::transfer(unsigned char)>
	ld	R, Y
	sbrc	R, 7
	rjmp	<Adafruit_GPS::write(unsigned char)+X>
	ldi	R, 0x01	;	1
	call	<digitalWrite>
	rjmp	<Adafruit_GPS::write(unsigned char)+X>

Adafruit_GPS::~Adafruit_GPS():
	jmp	<free>

Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x0a	;	10
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	sbiw	R, 0x00	;	0
	brne	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x01	;	1
	add	R, R
	adc	R, R
	neg	R
	neg	R
	sbc	R, R
	movw	R, R
	ldd	R, Z+8	;	0x08
	ldd	R, Z+9	;	0x09
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	mov	R, R
	mov	R, R
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::drawFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	movw	R, R
	icall
	movw	R, R
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	call	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x08	;	8
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	sbiw	R, 0x00	;	0
	brne	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x01	;	1
	add	R, R
	adc	R, R
	neg	R
	neg	R
	sbc	R, R
	movw	R, R
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	mov	R, R
	mov	R, R
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::drawFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	movw	R, R
	icall
	movw	R, R
	movw	R, R
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	movw	R, R
	call	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::drawPixel(int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	sbrc	R, 7
	rjmp	<__stack+X>
	ldd	R, Y+8	;	0x08
	ldd	R, Y+9	;	0x09
	cp	R, R
	cpc	R, R
	brge	<__stack+X>
	sbrc	R, 7
	rjmp	<__stack+X>
	ldd	R, Y+10	;	0x0a
	ldd	R, Y+11	;	0x0b
	cp	R, R
	cpc	R, R
	brge	<__stack+X>
	movw	R, R
	movw	R, R
	movw	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	movw	R, R
	icall
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+42	;	0x2a
	ldd	R, Z+43	;	0x2b
	mov	R, R
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	movw	R, R
	icall
	movw	R, R
	movw	R, R
	call	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)>
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::endWrite():
	movw	R, R
	ldd	R, Z+55	;	0x37
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::endWrite()+X>
	ldd	R, Z+27	;	0x1b
	ldd	R, Z+28	;	0x1c
	ld	R, X
	ldd	R, Z+49	;	0x31
	or	R, R
	st	X, R
	ret

Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	sbiw	R, 0x00	;	0
	brne	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	cp	R, R
	cpc	R, R
	brne	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x01	;	1
	add	R, R
	adc	R, R
	neg	R
	neg	R
	sbc	R, R
	movw	R, R
	ldd	R, Z+8	;	0x08
	ldd	R, Z+9	;	0x09
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x01	;	1
	add	R, R
	adc	R, R
	neg	R
	neg	R
	sbc	R, R
	movw	R, R
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	mov	R, R
	mov	R, R
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	mov	R, R
	mov	R, R
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::fillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	movw	R, R
	icall
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	call	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ijmp
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::invertDisplay(bool):
	push	R
	push	R
	push	R
	movw	R, R
	mov	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	icall
	and	R, R
	breq	<Adafruit_SPITFT::invertDisplay(bool)+X>
	ldd	R, Y+61	;	0x3d
	movw	R, R
	call	<Adafruit_SPITFT::writeCommand(unsigned char)>
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	mov	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	ijmp
	ldd	R, Y+62	;	0x3e
	rjmp	<Adafruit_SPITFT::invertDisplay(bool)+X>

Adafruit_SPITFT::sendCommand(unsigned char, unsigned char*, unsigned char) [clone .constprop.67]:
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	call	<Adafruit_SPITFT::SPI_BEGIN_TRANSACTION()>
	ldd	R, Y+55	;	0x37
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::sendCommand(unsigned char, unsigned char*, unsigned char) [clone .constprop.67]+X>
	ldd	R, Y+27	;	0x1b
	ldd	R, Y+28	;	0x1c
	ld	R, Z
	ldd	R, Y+50	;	0x32
	and	R, R
	st	Z, R
	ldd	R, Y+29	;	0x1d
	ldd	R, Y+30	;	0x1e
	ld	R, Z
	ldd	R, Y+52	;	0x34
	and	R, R
	st	Z, R
	ldi	R, 0x36	;	54
	movw	R, R
	call	<Adafruit_SPITFT::spiWrite(unsigned char)>
	ldd	R, Y+29	;	0x1d
	ldd	R, Y+30	;	0x1e
	ld	R, Z
	ldd	R, Y+51	;	0x33
	or	R, R
	st	Z, R
	ldd	R, Y+53	;	0x35
	movw	R, R
	cpi	R, 0x02	;	2
	breq	<Adafruit_SPITFT::sendCommand(unsigned char, unsigned char*, unsigned char) [clone .constprop.67]+X>
	ld	R, Z
	movw	R, R
	call	<Adafruit_SPITFT::spiWrite(unsigned char)>
	ldd	R, Y+55	;	0x37
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::sendCommand(unsigned char, unsigned char*, unsigned char) [clone .constprop.67]+X>
	ldd	R, Y+27	;	0x1b
	ldd	R, Y+28	;	0x1c
	ld	R, Z
	ldd	R, Y+49	;	0x31
	or	R, R
	st	Z, R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ldd	R, Y+48	;	0x30
	and	R, R
	breq	<Adafruit_SPITFT::sendCommand(unsigned char, unsigned char*, unsigned char) [clone .constprop.67]+X>
	ld	R, Z
	ldd	R, Z+1	;	0x01
	movw	R, R
	call	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)>
	rjmp	<Adafruit_SPITFT::sendCommand(unsigned char, unsigned char*, unsigned char) [clone .constprop.67]+X>

Adafruit_SPITFT::SPI_BEGIN_TRANSACTION():
	movw	R, R
	ldd	R, Z+53	;	0x35
	cpse	R, R
	rjmp	<Adafruit_SPITFT::SPI_BEGIN_TRANSACTION()+X>
	ldd	R, Z+33	;	0x21
	ldd	R, Z+34	;	0x22
	jmp	<SPIClass::beginTransaction(SPISettings)>
	ret

Adafruit_SPITFT::SPI_MOSI_HIGH():
	movw	R, R
	adiw	R, 0x21	;	33
	ld	R, X+
	ld	R, X
	sbiw	R, 0x22	;	34
	ld	R, Z
	adiw	R, 0x25	;	37
	ld	R, X
	or	R, R
	st	Z, R
	ret

Adafruit_SPITFT::SPI_MOSI_LOW():
	movw	R, R
	adiw	R, 0x21	;	33
	ld	R, X+
	ld	R, X
	sbiw	R, 0x22	;	34
	ld	R, Z
	adiw	R, 0x26	;	38
	ld	R, X
	and	R, R
	st	Z, R
	ret

Adafruit_SPITFT::SPI_SCK_HIGH():
	movw	R, R
	adiw	R, 0x23	;	35
	ld	R, X+
	ld	R, X
	sbiw	R, 0x24	;	36
	ld	R, Z
	adiw	R, 0x27	;	39
	ld	R, X
	or	R, R
	st	Z, R
	ret

Adafruit_SPITFT::SPI_SCK_LOW():
	movw	R, R
	adiw	R, 0x23	;	35
	ld	R, X+
	ld	R, X
	sbiw	R, 0x24	;	36
	ld	R, Z
	adiw	R, 0x28	;	40
	ld	R, X
	and	R, R
	st	Z, R
	ret

Adafruit_SPITFT::SPI_WRITE16(unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	ldd	R, Y+53	;	0x35
	cpse	R, R
	rjmp	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)+X>
	out	0x2e, R	;	46
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)+X>
	out	0x2e, R	;	46
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)+X>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	cpi	R, 0x01	;	1
	brne	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)+X>
	ldi	R, 0x10	;	16
	mov	R, R
	movw	R, R
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_HIGH()>
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_HIGH()>
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_LOW()>
	add	R, R
	adc	R, R
	dec	R
	cpse	R, R
	rjmp	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)+X>
	rjmp	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_LOW()>
	rjmp	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)+X>
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	st	Z, R
	movw	R, R
	call	<Adafruit_SPITFT::TFT_WR_STROBE()>
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	st	Z, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	jmp	<Adafruit_SPITFT::TFT_WR_STROBE()>

Adafruit_SPITFT::SPI_WRITE32(unsigned long):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	ldd	R, Y+53	;	0x35
	cpse	R, R
	rjmp	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	mov	R, R
	eor	R, R
	eor	R, R
	eor	R, R
	out	0x2e, R	;	46
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	movw	R, R
	eor	R, R
	eor	R, R
	out	0x2e, R	;	46
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	eor	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	out	0x2e, R	;	46
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	out	0x2e, R	;	46
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	cpi	R, 0x01	;	1
	brne	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	ldi	R, 0x20	;	32
	movw	R, R
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_HIGH()>
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_HIGH()>
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_LOW()>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	subi	R, 0x01	;	1
	brne	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	rjmp	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_LOW()>
	rjmp	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)+X>
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	mov	R, R
	eor	R, R
	eor	R, R
	eor	R, R
	st	Z, R
	movw	R, R
	call	<Adafruit_SPITFT::TFT_WR_STROBE()>
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	movw	R, R
	eor	R, R
	eor	R, R
	st	Z, R
	movw	R, R
	call	<Adafruit_SPITFT::TFT_WR_STROBE()>
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	eor	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	st	Z, R
	movw	R, R
	call	<Adafruit_SPITFT::TFT_WR_STROBE()>
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	st	Z, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	jmp	<Adafruit_SPITFT::TFT_WR_STROBE()>

Adafruit_SPITFT::spiWrite(unsigned char):
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	mov	R, R
	ldd	R, Y+53	;	0x35
	cpse	R, R
	rjmp	<Adafruit_SPITFT::spiWrite(unsigned char)+X>
	out	0x2e, R	;	46
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::spiWrite(unsigned char)+X>
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	cpi	R, 0x01	;	1
	brne	<Adafruit_SPITFT::spiWrite(unsigned char)+X>
	ldi	R, 0x08	;	8
	movw	R, R
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::spiWrite(unsigned char)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_HIGH()>
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_HIGH()>
	add	R, R
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_LOW()>
	subi	R, 0x01	;	1
	brne	<Adafruit_SPITFT::spiWrite(unsigned char)+X>
	rjmp	<Adafruit_SPITFT::spiWrite(unsigned char)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_LOW()>
	rjmp	<Adafruit_SPITFT::spiWrite(unsigned char)+X>
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	st	Z, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	jmp	<Adafruit_SPITFT::TFT_WR_STROBE()>

Adafruit_SPITFT::startWrite():
	push	R
	push	R
	movw	R, R
	call	<Adafruit_SPITFT::SPI_BEGIN_TRANSACTION()>
	ldd	R, Y+55	;	0x37
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::startWrite()+X>
	ldd	R, Y+27	;	0x1b
	ldd	R, Y+28	;	0x1c
	ld	R, Z
	ldd	R, Y+50	;	0x32
	and	R, R
	st	Z, R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::TFT_WR_STROBE():
	movw	R, R
	ldd	R, Z+37	;	0x25
	ldd	R, Z+38	;	0x26
	ld	R, X
	ldd	R, Z+42	;	0x2a
	and	R, R
	st	X, R
	ldd	R, Z+37	;	0x25
	ldd	R, Z+38	;	0x26
	ld	R, X
	ldd	R, Z+41	;	0x29
	or	R, R
	st	X, R
	ret

Adafruit_SPITFT::writeCommand(unsigned char):
	push	R
	push	R
	movw	R, R
	ldd	R, Y+29	;	0x1d
	ldd	R, Y+30	;	0x1e
	ld	R, Z
	ldd	R, Y+52	;	0x34
	and	R, R
	st	Z, R
	movw	R, R
	call	<Adafruit_SPITFT::spiWrite(unsigned char)>
	ldd	R, Y+29	;	0x1d
	ldd	R, Y+30	;	0x1e
	ld	R, Z
	ldd	R, Y+51	;	0x33
	or	R, R
	st	Z, R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::writeFastHLine(int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::writeFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x0a	;	10
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::writeFastHLine(int, int, int, unsigned int)+X>
	cp	R, R
	cpc	R, R
	breq	<Adafruit_SPITFT::writeFastHLine(int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x01	;	1
	add	R, R
	adc	R, R
	neg	R
	neg	R
	sbc	R, R
	movw	R, R
	adiw	R, 0x08	;	8
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::writeFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	sbiw	R, 0x01	;	1
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::writeFastHLine(int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::writeFastHLine(int, int, int, unsigned int)+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	call	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::writeFastVLine(int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::writeFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x08	;	8
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::writeFastVLine(int, int, int, unsigned int)+X>
	cp	R, R
	cpc	R, R
	breq	<Adafruit_SPITFT::writeFastVLine(int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x01	;	1
	add	R, R
	adc	R, R
	neg	R
	neg	R
	sbc	R, R
	movw	R, R
	adiw	R, 0x0a	;	10
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::writeFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	sbiw	R, 0x01	;	1
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::writeFastVLine(int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::writeFastVLine(int, int, int, unsigned int)+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	movw	R, R
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	call	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	cp	R, R
	cpc	R, R
	brne	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	cp	R, R
	cpc	R, R
	brne	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x01	;	1
	add	R, R
	adc	R, R
	neg	R
	neg	R
	sbc	R, R
	movw	R, R
	adiw	R, 0x08	;	8
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	adiw	R, 0x01	;	1
	add	R, R
	adc	R, R
	neg	R
	neg	R
	sbc	R, R
	movw	R, R
	adiw	R, 0x0a	;	10
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	sbiw	R, 0x01	;	1
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	sbiw	R, 0x01	;	1
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	brlt	<Adafruit_SPITFT::writeFillRect(int, int, int, int, unsigned int)+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	call	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+42	;	0x2a
	ldd	R, Z+43	;	0x2b
	mov	R, R
	icall
	movw	R, R
	movw	R, R
	call	<__mulhisi3>
	movw	R, R
	movw	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	ldd	R, Y+53	;	0x35
	cpse	R, R
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	ldi	R, 0xFF	;	255
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	out	0x2e, R	;	46
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	out	0x2e, R	;	46
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	cpi	R, 0x01	;	1
	brne	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	ldi	R, 0xFF	;	255
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	mov	R, R
	ldi	R, 0x08	;	8
	movw	R, R
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_HIGH()>
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_HIGH()>
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_LOW()>
	add	R, R
	subi	R, 0x01	;	1
	brne	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	mov	R, R
	ldi	R, 0x08	;	8
	movw	R, R
	sbrs	R, 7
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_HIGH()>
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_HIGH()>
	movw	R, R
	call	<Adafruit_SPITFT::SPI_SCK_LOW()>
	add	R, R
	subi	R, 0x01	;	1
	brne	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_LOW()>
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	call	<Adafruit_SPITFT::SPI_MOSI_LOW()>
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	cpse	R, R
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	st	Z, R
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	ldi	R, 0xFF	;	255
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	breq	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	movw	R, R
	call	<Adafruit_SPITFT::TFT_WR_STROBE()>
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	ldi	R, 0xFF	;	255
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	breq	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	st	Z, R
	movw	R, R
	call	<Adafruit_SPITFT::TFT_WR_STROBE()>
	ldd	R, Y+31	;	0x1f
	ldd	R, Y+32	;	0x20
	st	Z, R
	movw	R, R
	call	<Adafruit_SPITFT::TFT_WR_STROBE()>
	rjmp	<Adafruit_SPITFT::writeFillRectPreclipped(int, int, int, int, unsigned int)+X>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_SPITFT::writePixel(int, int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::writePixel(int, int, unsigned int)+X>
	ldd	R, Y+8	;	0x08
	ldd	R, Y+9	;	0x09
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::writePixel(int, int, unsigned int)+X>
	sbrc	R, 7
	rjmp	<Adafruit_SPITFT::writePixel(int, int, unsigned int)+X>
	ldd	R, Y+10	;	0x0a
	ldd	R, Y+11	;	0x0b
	cp	R, R
	cpc	R, R
	brge	<Adafruit_SPITFT::writePixel(int, int, unsigned int)+X>
	movw	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Z+42	;	0x2a
	ldd	R, Z+43	;	0x2b
	mov	R, R
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	icall
	movw	R, R
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	jmp	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_ST7735::setRotation(unsigned char):
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	movw	R, R
	std	Y+1, R	;	0x01
	andi	R, 0x03	;	3
	std	Z+22, R	;	0x16
	movw	R, R
	subi	R, 0xBA	;	186
	sbci	R, 0xFF	;	255
	ld	R, X
	mov	R, R
	andi	R, 0xFB	;	251
	movw	R, R
	subi	R, 0xBC	;	188
	sbci	R, 0xFF	;	255
	cpi	R, 0x01	;	1
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0x03	;	3
	cpi	R, 0x02	;	2
	brcs	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0x01	;	1
	movw	R, R
	st	X, R
	movw	R, R
	subi	R, 0xBD	;	189
	sbci	R, 0xFF	;	255
	cpi	R, 0x02	;	2
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>
	cpi	R, 0x03	;	3
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>
	cpi	R, 0x01	;	1
	breq	<Adafruit_ST7735::setRotation(unsigned char)+X>
	cpi	R, 0x02	;	2
	breq	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0xC8	;	200
	cpi	R, 0x04	;	4
	breq	<Adafruit_ST7735::setRotation(unsigned char)+X>
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0xC0	;	192
	std	Y+1, R	;	0x01
	cpi	R, 0x01	;	1
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0x80	;	128
	ldi	R, 0x00	;	0
	std	Z+11, R	;	0x0b
	std	Z+10, R	;	0x0a
	std	Z+9, R	;	0x09
	std	Z+8, R	;	0x08
	movw	R, R
	ld	R, X
	ldi	R, 0x00	;	0
	std	Z+58, R	;	0x3a
	std	Z+57, R	;	0x39
	movw	R, R
	ld	R, X
	ldi	R, 0x00	;	0
	std	Z+60, R	;	0x3c
	std	Z+59, R	;	0x3b
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<Adafruit_SPITFT::sendCommand(unsigned char, unsigned char*, unsigned char) [clone .constprop.67]>
	pop	R
	pop	R
	pop	R
	ret
	cpi	R, 0x04	;	4
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0xA0	;	160
	ldi	R, 0x00	;	0
	std	Z+11, R	;	0x0b
	std	Z+10, R	;	0x0a
	ldi	R, 0x50	;	80
	ldi	R, 0x00	;	0
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>
	cpi	R, 0x02	;	2
	breq	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0xA8	;	168
	cpi	R, 0x04	;	4
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0xA0	;	160
	std	Y+1, R	;	0x01
	cpi	R, 0x01	;	1
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0x80	;	128
	ldi	R, 0x00	;	0
	std	Z+9, R	;	0x09
	std	Z+8, R	;	0x08
	std	Z+11, R	;	0x0b
	std	Z+10, R	;	0x0a
	movw	R, R
	ld	R, X
	ldi	R, 0x00	;	0
	std	Z+60, R	;	0x3c
	std	Z+59, R	;	0x3b
	movw	R, R
	ld	R, X
	ldi	R, 0x00	;	0
	std	Z+58, R	;	0x3a
	std	Z+57, R	;	0x39
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>
	cpi	R, 0x02	;	2
	breq	<Adafruit_ST7735::setRotation(unsigned char)+X>
	cpi	R, 0x04	;	4
	breq	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0x08	;	8
	std	Y+1, R	;	0x01
	cpi	R, 0x01	;	1
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0xA0	;	160
	ldi	R, 0x00	;	0
	std	Z+11, R	;	0x0b
	std	Z+10, R	;	0x0a
	ldi	R, 0x80	;	128
	ldi	R, 0x00	;	0
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>
	cpi	R, 0x02	;	2
	breq	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0x68	;	104
	cpi	R, 0x04	;	4
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0x60	;	96
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>
	std	Y+1, R	;	0x01
	cpi	R, 0x01	;	1
	breq	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0xA0	;	160
	ldi	R, 0x00	;	0
	std	Z+9, R	;	0x09
	std	Z+8, R	;	0x08
	ldi	R, 0x80	;	128
	ldi	R, 0x00	;	0
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>
	cpi	R, 0x04	;	4
	brne	<Adafruit_ST7735::setRotation(unsigned char)+X>
	ldi	R, 0xA0	;	160
	ldi	R, 0x00	;	0
	std	Z+9, R	;	0x09
	std	Z+8, R	;	0x08
	ldi	R, 0x50	;	80
	ldi	R, 0x00	;	0
	rjmp	<Adafruit_ST7735::setRotation(unsigned char)+X>

Adafruit_ST77xx::begin(unsigned long):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	rcall	<Adafruit_ST77xx::begin(unsigned long)+X>
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	movw	R, R
	movw	R, R
	movw	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<Adafruit_ST77xx::begin(unsigned long)+X>
	mov	R, R
	ldi	R, 0x48	;	72
	mov	R, R
	ldi	R, 0xE8	;	232
	mov	R, R
	eor	R, R
	inc	R
	movw	R, R
	adiw	R, 0x3f	;	63
	st	Z, R
	std	Z+1, R	;	0x01
	std	Z+2, R	;	0x02
	std	Z+3, R	;	0x03
	ldi	R, 0x21	;	33
	movw	R, R
	std	Z+61, R	;	0x3d
	ldi	R, 0x20	;	32
	std	Z+62, R	;	0x3e
	subi	R, 0xBB	;	187
	sbci	R, 0xFF	;	255
	ld	R, Z
	movw	R, R
	ldd	R, Z+55	;	0x37
	sbrc	R, 7
	rjmp	<Adafruit_ST77xx::begin(unsigned long)+X>
	ldi	R, 0x01	;	1
	call	<pinMode>
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+55	;	0x37
	call	<digitalWrite>
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+56	;	0x38
	call	<pinMode>
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+56	;	0x38
	call	<digitalWrite>
	movw	R, R
	ldd	R, Z+53	;	0x35
	cpse	R, R
	rjmp	<Adafruit_ST77xx::begin(unsigned long)+X>
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	adiw	R, 0x01	;	1
	call	<SPISettings::SPISettings(unsigned long, unsigned char, unsigned char) [clone .constprop.90]>
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	movw	R, R
	std	Z+34, R	;	0x22
	std	Z+33, R	;	0x21
	mov	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	std	Z+35, R	;	0x23
	std	Z+36, R	;	0x24
	std	Z+37, R	;	0x25
	std	Z+38, R	;	0x26
	call	<SPIClass::begin()>
	movw	R, R
	ldd	R, Z+54	;	0x36
	sbrc	R, 7
	rjmp	<Adafruit_ST77xx::begin(unsigned long)+X>
	ldi	R, 0x01	;	1
	call	<pinMode>
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+54	;	0x36
	call	<digitalWrite>
	ldi	R, 0x64	;	100
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<delay>
	ldi	R, 0x00	;	0
	movw	R, R
	ldd	R, Z+54	;	0x36
	call	<digitalWrite>
	ldi	R, 0x64	;	100
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<delay>
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+54	;	0x36
	call	<digitalWrite>
	ldi	R, 0xC8	;	200
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<delay>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ldi	R, 0x22	;	34
	mov	R, R
	ldi	R, 0x07	;	7
	mov	R, R
	mov	R, R
	cpi	R, 0x01	;	1
	brne	<Adafruit_ST77xx::begin(unsigned long)+X>
	ldi	R, 0x01	;	1
	ldd	R, Z+42	;	0x2a
	call	<pinMode>
	ldi	R, 0x00	;	0
	movw	R, R
	ldd	R, Z+42	;	0x2a
	call	<digitalWrite>
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+44	;	0x2c
	call	<pinMode>
	ldi	R, 0x00	;	0
	movw	R, R
	ldd	R, Z+44	;	0x2c
	call	<digitalWrite>
	movw	R, R
	ldd	R, Z+43	;	0x2b
	sbrc	R, 7
	rjmp	<Adafruit_ST77xx::begin(unsigned long)+X>
	ldi	R, 0x00	;	0
	call	<pinMode>
	rjmp	<Adafruit_ST77xx::begin(unsigned long)+X>
	movw	R, R
	lpm	R, Z
	mov	R, R
	ldi	R, 0x00	;	0
	add	R, R
	adc	R, R
	subi	R, 0xEC	;	236
	sbci	R, 0xF8	;	248
	lpm	R, Z+
	lpm	R, Z
	movw	R, R
	ldd	R, Z+31	;	0x1f
	ldd	R, Z+32	;	0x20
	cp	R, R
	cpc	R, R
	brne	<Adafruit_ST77xx::begin(unsigned long)+X>
	ldi	R, 0x01	;	1
	mov	R, R
	call	<pinMode>
	ldi	R, 0x00	;	0
	mov	R, R
	call	<digitalWrite>
	inc	R
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	ldi	R, 0x1F	;	31
	cpse	R, R
	rjmp	<Adafruit_ST77xx::begin(unsigned long)+X>
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+46	;	0x2e
	call	<pinMode>
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+46	;	0x2e
	call	<digitalWrite>
	movw	R, R
	ldd	R, Z+47	;	0x2f
	sbrc	R, 7
	rjmp	<Adafruit_ST77xx::begin(unsigned long)+X>
	ldi	R, 0x01	;	1
	call	<pinMode>
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+47	;	0x2f
	call	<digitalWrite>
	rjmp	<Adafruit_ST77xx::begin(unsigned long)+X>

Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]:
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	lpm	R, Z
	subi	R, 0x01	;	1
	brcc	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	rjmp	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	movw	R, R
	lpm	R, Z
	movw	R, R
	ldi	R, 0x02	;	2
	add	R, R
	adc	R, R
	movw	R, R
	adiw	R, 0x01	;	1
	lpm	R, Z
	mov	R, R
	andi	R, 0x7F	;	127
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_SPITFT::SPI_BEGIN_TRANSACTION()>
	lds	R, <tft+X>
	sbrc	R, 7
	rjmp	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	lds	R, <tft+X>
	lds	R, <tft+X>
	ld	R, Z
	lds	R, <tft+X>
	and	R, R
	st	Z, R
	lds	R, <tft+X>
	lds	R, <tft+X>
	ld	R, Z
	lds	R, <tft+X>
	and	R, R
	st	Z, R
	mov	R, R
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_SPITFT::spiWrite(unsigned char)>
	lds	R, <tft+X>
	lds	R, <tft+X>
	ld	R, Z
	lds	R, <tft+X>
	or	R, R
	st	Z, R
	movw	R, R
	mov	R, R
	mov	R, R
	ldi	R, 0x00	;	0
	cp	R, R
	cpc	R, R
	brge	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	lds	R, <tft+X>
	movw	R, R
	cpi	R, 0x02	;	2
	brne	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	lds	R, <tft+X>
	and	R, R
	breq	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	ld	R, Z+
	ld	R, Z+
	movw	R, R
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_SPITFT::SPI_WRITE16(unsigned int)>
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	movw	R, R
	rjmp	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	lpm	R, Z
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_SPITFT::spiWrite(unsigned char)>
	rjmp	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	lds	R, <tft+X>
	sbrc	R, 7
	rjmp	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	lds	R, <tft+X>
	lds	R, <tft+X>
	ld	R, Z
	lds	R, <tft+X>
	or	R, R
	st	Z, R
	movw	R, R
	add	R, R
	adc	R, R
	sbrs	R, 7
	rjmp	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	movw	R, R
	adiw	R, 0x01	;	1
	movw	R, R
	lpm	R, Z
	ldi	R, 0x00	;	0
	cpi	R, 0xFF	;	255
	cpc	R, R
	brne	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	ldi	R, 0xF4	;	244
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<delay>
	movw	R, R
	rjmp	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]+X>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Adafruit_ST77xx::setAddrWindow(unsigned int, unsigned int, unsigned int, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	ldd	R, Y+57	;	0x39
	ldd	R, Y+58	;	0x3a
	add	R, R
	adc	R, R
	ldd	R, Y+59	;	0x3b
	ldd	R, Y+60	;	0x3c
	add	R, R
	adc	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	add	R, R
	adc	R, R
	movw	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	eor	R, R
	eor	R, R
	or	R, R
	or	R, R
	or	R, R
	or	R, R
	movw	R, R
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	add	R, R
	adc	R, R
	mov	R, R
	mov	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	eor	R, R
	eor	R, R
	or	R, R
	or	R, R
	or	R, R
	or	R, R
	ldi	R, 0x2A	;	42
	movw	R, R
	call	<Adafruit_SPITFT::writeCommand(unsigned char)>
	movw	R, R
	movw	R, R
	movw	R, R
	call	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)>
	ldi	R, 0x2B	;	43
	movw	R, R
	call	<Adafruit_SPITFT::writeCommand(unsigned char)>
	movw	R, R
	movw	R, R
	movw	R, R
	call	<Adafruit_SPITFT::SPI_WRITE32(unsigned long)>
	ldi	R, 0x2C	;	44
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	jmp	<Adafruit_SPITFT::writeCommand(unsigned char)>

Adafruit_ST77xx::setRotation(unsigned char):
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	movw	R, R
	std	Y+1, R	;	0x01
	andi	R, 0x03	;	3
	std	Z+22, R	;	0x16
	movw	R, R
	subi	R, 0xBD	;	189
	sbci	R, 0xFF	;	255
	ld	R, X
	ldi	R, 0x00	;	0
	adiw	R, 0x01	;	1
	ld	R, X
	ldi	R, 0x00	;	0
	cpi	R, 0x02	;	2
	breq	<Adafruit_ST77xx::setRotation(unsigned char)+X>
	cpi	R, 0x03	;	3
	breq	<Adafruit_ST77xx::setRotation(unsigned char)+X>
	cpi	R, 0x01	;	1
	breq	<Adafruit_ST77xx::setRotation(unsigned char)+X>
	ldi	R, 0xC0	;	192
	std	Y+1, R	;	0x01
	std	Z+58, R	;	0x3a
	std	Z+57, R	;	0x39
	std	Z+60, R	;	0x3c
	std	Z+59, R	;	0x3b
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<Adafruit_SPITFT::sendCommand(unsigned char, unsigned char*, unsigned char) [clone .constprop.67]>
	pop	R
	pop	R
	pop	R
	ret
	ldi	R, 0xA0	;	160
	std	Y+1, R	;	0x01
	std	Z+60, R	;	0x3c
	std	Z+59, R	;	0x3b
	std	Z+58, R	;	0x3a
	std	Z+57, R	;	0x39
	rjmp	<Adafruit_ST77xx::setRotation(unsigned char)+X>
	ldi	R, 0x60	;	96
	rjmp	<Adafruit_ST77xx::setRotation(unsigned char)+X>

atof:
	eor	R, R
	eor	R, R
	jmp	<strtod>

atol:
	push	R
	movw	R, R
	eor	R, R
	eor	R, R
	movw	R, R
	clt
	ld	R, Z+
	cpi	R, 0x20	;	32
	breq	<atol+X>
	cpi	R, 0x09	;	9
	brcs	<atol+X>
	cpi	R, 0x0E	;	14
	brcs	<atol+X>
	cpi	R, 0x2B	;	43
	breq	<atol+X>
	cpi	R, 0x2D	;	45
	brne	<atol+X>
	set
	rjmp	<atol+X>
	call	<__mulsi_const_10>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	ld	R, Z+
	subi	R, 0x30	;	48
	cpi	R, 0x0A	;	10
	brcs	<atol+X>
	brtc	<atol+X>
	com	R
	com	R
	com	R
	neg	R
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	pop	R
	ret

delay:
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	call	<micros>
	movw	R, R
	movw	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	breq	<delay+X>
	call	<micros>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	cpi	R, 0xE8	;	232
	sbci	R, 0x03	;	3
	cpc	R, R
	cpc	R, R
	brcs	<delay+X>
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	ldi	R, 0xE8	;	232
	add	R, R
	ldi	R, 0x03	;	3
	adc	R, R
	adc	R, R
	adc	R, R
	rjmp	<delay+X>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

digital_pin_to_bit_mask_PGM:
04 08 02 01 10 40 80 40 10 20 40 80 40 80 08 02     .....@.@. @.@...
04 01 80 40 20 10 02 01 10 80 10 20 40 40 20        ...@ ...... @@

digital_pin_to_port_PGM:
04 04 04 04 04 03 04 05 02 02 02 02 04 03 02 02     ................
02 02 06 06 06 06 06 06 04 04 02 02 02 04 04 00     ................

digital_pin_to_timer_PGM:
00 00 00 02 00 09 0f 00 00 03 04 01 00 0c 00 00     ................

digitalWrite:
	mov	R, R
	ldi	R, 0x00	;	0
	movw	R, R
	subi	R, 0x38	;	56
	sbci	R, 0xF9	;	249
	lpm	R, Z
	movw	R, R
	subi	R, 0x0B	;	11
	sbci	R, 0xF9	;	249
	lpm	R, Z
	subi	R, 0xDE	;	222
	sbci	R, 0xF8	;	248
	movw	R, R
	lpm	R, Z
	and	R, R
	brne	<digitalWrite+X>
	rjmp	<digitalWrite+X>
	and	R, R
	breq	<digitalWrite+X>
	subi	R, 0x01	;	1
	cpi	R, 0x0F	;	15
	brcc	<digitalWrite+X>
	mov	R, R
	ldi	R, 0x00	;	0
	subi	R, 0x38	;	56
	sbci	R, 0xF6	;	246
	jmp	<__tablejump2__>
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0x7F	;	127
	sts	<__TEXT_REGION_LENGTH__+X>, R
	mov	R, R
	ldi	R, 0x00	;	0
	add	R, R
	adc	R, R
	subi	R, 0xEC	;	236
	sbci	R, 0xF8	;	248
	lpm	R, Z+
	lpm	R, Z
	in	R, 0x3f	;	63
	cli
	ld	R, X
	cpse	R, R
	rjmp	<digitalWrite+X>
	com	R
	and	R, R
	st	X, R
	out	0x3f, R	;	63
	ret
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xDF	;	223
	rjmp	<digitalWrite+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xF7	;	247
	rjmp	<digitalWrite+X>
	in	R, 0x24	;	36
	andi	R, 0x7F	;	127
	out	0x24, R	;	36
	rjmp	<digitalWrite+X>
	in	R, 0x24	;	36
	andi	R, 0xDF	;	223
	rjmp	<digitalWrite+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0x7F	;	127
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<digitalWrite+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xDF	;	223
	rjmp	<digitalWrite+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xF7	;	247
	rjmp	<digitalWrite+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0x7F	;	127
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<digitalWrite+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xDF	;	223
	rjmp	<digitalWrite+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xF7	;	247
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<digitalWrite+X>
	or	R, R
	rjmp	<digitalWrite+X>

font:
00 00 00 00 00 3e 5b 4f 5b 3e 3e 6b 4f 6b 3e 1c     .....>[O[>>kOk>.
3e 7c 3e 1c 18 3c 7e 3c 18 1c 57 7d 57 1c 1c 5e     >|>..<~<..W}W..^
7f 5e 1c 00 18 3c 18 00 ff e7 c3 e7 ff 00 18 24     .^...<.........$
18 00 ff e7 db e7 ff 30 48 3a 06 0e 26 29 79 29     .......0H:..&)y)
26 40 7f 05 05 07 40 7f 05 25 3f 5a 3c e7 3c 5a     &@....@..%?Z<.<Z
7f 3e 1c 1c 08 08 1c 1c 3e 7f 14 22 7f 22 14 5f     .>......>.."."._
5f 00 5f 5f 06 09 7f 01 7f 00 66 89 95 6a 60 60     _.__......f..j``
60 60 60 94 a2 ff a2 94 08 04 7e 04 08 10 20 7e     ```.......~... ~
20 10 08 08 2a 1c 08 08 1c 2a 08 08 1e 10 10 10      ...*....*......
10 0c 1e 0c 1e 0c 30 38 3e 38 30 06 0e 3e 0e 06     ......08>80..>..
00 00 00 00 00 00 00 5f 00 00 00 07 00 07 00 14     ......._........
7f 14 7f 14 24 2a 7f 2a 12 23 13 08 64 62 36 49     ....$*.*.#..db6I
56 20 50 00 08 07 03 00 00 1c 22 41 00 00 41 22     V P......."A..A"
1c 00 2a 1c 7f 1c 2a 08 08 3e 08 08 00 80 70 30     ..*...*..>....p0
00 08 08 08 08 08 00 00 60 60 00 20 10 08 04 02     ........``. ....
3e 51 49 45 3e 00 42 7f 40 00 72 49 49 49 46 21     >QIE>.B.@.rIIIF!
41 49 4d 33 18 14 12 7f 10 27 45 45 45 39 3c 4a     AIM3.....'EEE9<J
49 49 31 41 21 11 09 07 36 49 49 49 36 46 49 49     II1A!...6III6FII
29 1e 00 00 14 00 00 00 40 34 00 00 00 08 14 22     ).......@4....."
41 14 14 14 14 14 00 41 22 14 08 02 01 59 09 06     A......A"....Y..
3e 41 5d 59 4e 7c 12 11 12 7c 7f 49 49 49 36 3e     >A]YN|...|.III6>
41 41 41 22 7f 41 41 41 3e 7f 49 49 49 41 7f 09     AAA".AAA>.IIIA..
09 09 01 3e 41 41 51 73 7f 08 08 08 7f 00 41 7f     ...>AAQs......A.
41 00 20 40 41 3f 01 7f 08 14 22 41 7f 40 40 40     A. @A?...."A.@@@
40 7f 02 1c 02 7f 7f 04 08 10 7f 3e 41 41 41 3e     @..........>AAA>
7f 09 09 09 06 3e 41 51 21 5e 7f 09 19 29 46 26     .....>AQ!^...)F&
49 49 49 32 03 01 7f 01 03 3f 40 40 40 3f 1f 20     III2.....?@@@?.
40 20 1f 3f 40 38 40 3f 63 14 08 14 63 03 04 78     @ .?@8@?c...c..x
04 03 61 59 49 4d 43 00 7f 41 41 41 02 04 08 10     ..aYIMC..AAA....
20 00 41 41 41 7f 04 02 01 02 04 40 40 40 40 40      .AAA......@@@@@
00 03 07 08 00 20 54 54 78 40 7f 28 44 44 38 38     ..... TTx@.(DD88
44 44 44 28 38 44 44 28 7f 38 54 54 54 18 00 08     DDD(8DD(.8TTT...
7e 09 02 18 a4 a4 9c 78 7f 08 04 04 78 00 44 7d     ~......x....x.D}
40 00 20 40 40 3d 00 7f 10 28 44 00 00 41 7f 40     @. @@=...(D..A.@
00 7c 04 78 04 78 7c 08 04 04 78 38 44 44 44 38     .|.x.x|...x8DDD8
fc 18 24 24 18 18 24 24 18 fc 7c 08 04 04 08 48     ..$$..$$..|....H
54 54 54 24 04 04 3f 44 24 3c 40 40 20 7c 1c 20     TTT$..?D$<@@ |.
40 20 1c 3c 40 30 40 3c 44 28 10 28 44 4c 90 90     @ .<@0@<D(.(DL..
90 7c 44 64 54 4c 44 00 08 36 41 00 00 00 77 00     .|DdTLD..6A...w.
00 00 41 36 08 00 02 01 02 04 02 3c 26 23 26 3c     ..A6.......<&#&<
1e a1 a1 61 12 3a 40 40 20 7a 38 54 54 55 59 21     ...a.:@@ z8TTUY!
55 55 79 41 22 54 54 78 42 21 55 54 78 40 20 54     UUyA"TTxB!UTx@ T
55 79 40 0c 1e 52 72 12 39 55 55 55 59 39 54 54     Uy@..Rr.9UUUY9TT
54 59 39 55 54 54 58 00 00 45 7c 41 00 02 45 7d     TY9UTTX..E|A..E}
42 00 01 45 7c 40 7d 12 11 12 7d f0 28 25 28 f0     B..E|@}...}.(%(.
7c 54 55 45 00 20 54 54 7c 54 7c 0a 09 7f 49 32     |TUE. TT|T|...I2
49 49 49 32 3a 44 44 44 3a 32 4a 48 48 30 3a 41     III2:DDD:2JHH0:A
41 21 7a 3a 42 40 20 78 00 9d a0 a0 7d 3d 42 42     A!z:B@ x....}=BB
42 3d 3d 40 40 40 3d 3c 24 ff 24 24 48 7e 49 43     B==@@@=<$.$$H~IC
66 2b 2f fc 2f 2b ff 09 29 f6 20 c0 88 7e 09 03     f+/./+..). ..~..
20 54 54 79 41 00 00 44 7d 41 30 48 48 4a 32 38      TTyA..D}A0HHJ28
40 40 22 7a 00 7a 0a 0a 72 7d 0d 19 31 7d 26 29     @@"z.z..r}..1}&)
29 2f 28 26 29 29 29 26 30 48 4d 40 20 38 08 08     )/(&)))&0HM@ 8..
08 08 08 08 08 08 38 2f 10 c8 ac ba 2f 10 28 34     ......8/..../.(4
fa 00 00 7b 00 00 08 14 2a 14 22 22 14 2a 14 08     ...{....*."".*..
55 00 55 00 55 aa 55 aa 55 aa ff 55 ff 55 ff 00     U.U.U.U.U..U.U..
00 00 ff 00 10 10 10 ff 00 14 14 14 ff 00 10 10     ................
ff 00 ff 10 10 f0 10 f0 14 14 14 fc 00 14 14 f7     ................
00 ff 00 00 ff 00 ff 14 14 f4 04 fc 14 14 17 10     ................
1f 10 10 1f 10 1f 14 14 14 1f 00 10 10 10 f0 00     ................
00 00 00 1f 10 10 10 10 1f 10 10 10 10 f0 10 00     ................
00 00 ff 10 10 10 10 10 10 10 10 10 ff 10 00 00     ................
00 ff 14 00 00 ff 00 ff 00 00 1f 10 17 00 00 fc     ................
04 f4 14 14 17 10 17 14 14 f4 04 f4 00 00 ff 00     ................
f7 14 14 14 14 14 14 14 f7 00 f7 14 14 14 17 14     ................
10 10 1f 10 1f 14 14 14 f4 14 10 10 f0 10 f0 00     ................
00 1f 10 1f 00 00 00 1f 14 00 00 00 fc 14 00 00     ................
f0 10 f0 10 10 ff 10 ff 14 14 14 ff 14 10 10 10     ................
1f 00 00 00 00 f0 10 ff ff ff ff ff f0 f0 f0 f0     ................
f0 ff ff ff 00 00 00 00 00 ff ff 0f 0f 0f 0f 0f     ................
38 44 44 38 44 fc 4a 4a 4a 34 7e 02 02 06 06 02     8DD8D.JJJ4~.....
7e 02 7e 02 63 55 49 41 63 38 44 44 3c 04 40 7e     ~.~.cUIAc8DD<.@~
20 1e 20 06 02 7e 02 02 99 a5 e7 a5 99 1c 2a 49      . ..~........*I
2a 1c 4c 72 01 72 4c 30 4a 4d 4d 30 30 48 78 48     *.Lr.rL0JMM00HxH
30 bc 62 5a 46 3d 3e 49 49 49 00 7e 01 01 01 7e     0.bZF=>III.~...~
2a 2a 2a 2a 2a 44 44 5f 44 44 40 51 4a 44 40 40     *****DD_DD@QJD@@
44 4a 51 40 00 00 ff 01 03 e0 80 ff 00 00 08 08     DJQ@............
6b 6b 08 36 12 36 24 36 06 0f 09 0f 06 00 00 18     kk.6.6$6........
18 00 00 00 10 10 00 30 40 ff 01 01 00 1f 01 01     .......0@.......
1e 00 19 1d 17 12 00 3c 3c 3c 3c 00 00 00 00 00     .......<<<<.....

free:
	push	R
	push	R
	sbiw	R, 0x00	;	0
	breq	<free+X>
	movw	R, R
	sbiw	R, 0x02	;	2
	std	Z+3, R	;	0x03
	std	Z+2, R	;	0x02
	lds	R, <__flp>
	lds	R, <__flp+X>
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	sbiw	R, 0x00	;	0
	brne	<free+X>
	ld	R, Z
	ldd	R, Z+1	;	0x01
	add	R, R
	adc	R, R
	lds	R, <__brkval>
	lds	R, <__brkval+X>
	cp	R, R
	cpc	R, R
	breq	<free+X>
	rjmp	<free+X>
	sts	<__brkval+X>, R
	sts	<__brkval>, R
	pop	R
	pop	R
	ret
	movw	R, R
	cp	R, R
	cpc	R, R
	brcc	<free+X>
	ldd	R, Y+2	;	0x02
	ldd	R, Y+3	;	0x03
	movw	R, R
	cp	R, R
	cpc	R, R
	brne	<free+X>
	movw	R, R
	std	Y+3, R	;	0x03
	std	Y+2, R	;	0x02
	ld	R, Y+
	ld	R, Y+
	add	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	brne	<free+X>
	ld	R, Z
	ldd	R, Z+1	;	0x01
	adiw	R, 0x02	;	2
	add	R, R
	adc	R, R
	movw	R, R
	std	Y+1, R	;	0x01
	st	Y, R
	ldd	R, Z+2	;	0x02
	ldd	R, Z+3	;	0x03
	std	Y+3, R	;	0x03
	std	Y+2, R	;	0x02
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	adiw	R, 0x02	;	2
	ld	R, X+
	ld	R, X
	sbiw	R, 0x03	;	3
	sbiw	R, 0x00	;	0
	brne	<free+X>
	ld	R, X+
	ld	R, X
	sbiw	R, 0x01	;	1
	movw	R, R
	adiw	R, 0x02	;	2
	add	R, R
	adc	R, R
	lds	R, <__brkval>
	lds	R, <__brkval+X>
	cp	R, R
	cpc	R, R
	brne	<free+X>
	sbiw	R, 0x00	;	0
	brne	<free+X>
	sts	<__flp+X>, R
	sts	<__flp>, R
	sts	<__brkval+X>, R
	sts	<__brkval>, R
	rjmp	<free+X>
	std	Z+3, R	;	0x03
	std	Z+2, R	;	0x02
	ld	R, Z
	ldd	R, Z+1	;	0x01
	add	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	brne	<free+X>
	subi	R, 0xFE	;	254
	sbci	R, 0xFF	;	255
	ld	R, Y
	ldd	R, Y+1	;	0x01
	add	R, R
	adc	R, R
	std	Z+1, R	;	0x01
	st	Z, R
	ldd	R, Y+2	;	0x02
	ldd	R, Y+3	;	0x03
	std	Z+3, R	;	0x03
	std	Z+2, R	;	0x02
	cp	R, R
	cpc	R, R
	breq	<free+X>
	rjmp	<free+X>
	sts	<__flp+X>, R
	sts	<__flp>, R
	rjmp	<free+X>
	movw	R, R
	movw	R, R
	rjmp	<free+X>
	std	Z+3, R	;	0x03
	std	Z+2, R	;	0x02
	rjmp	<free+X>

global constructors keyed to 65535_0_main.cpp.o.5093:
	push	R
	push	R
	push	R
	push	R
	ldi	R, 0xF0	;	240
	ldi	R, 0x05	;	5
	std	Y+3, R	;	0x03
	std	Y+2, R	;	0x02
	ldi	R, 0xE8	;	232
	ldi	R, 0x03	;	3
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	std	Y+4, R	;	0x04
	std	Y+5, R	;	0x05
	std	Y+6, R	;	0x06
	std	Y+7, R	;	0x07
	ldi	R, 0x43	;	67
	ldi	R, 0x01	;	1
	std	Y+1, R	;	0x01
	st	Y, R
	ldi	R, 0xCD	;	205
	ldi	R, 0x00	;	0
	std	Y+13, R	;	0x0d
	std	Y+12, R	;	0x0c
	ldi	R, 0xCC	;	204
	ldi	R, 0x00	;	0
	std	Y+15, R	;	0x0f
	std	Y+14, R	;	0x0e
	ldi	R, 0xC8	;	200
	ldi	R, 0x00	;	0
	std	Y+17, R	;	0x11
	std	Y+16, R	;	0x10
	ldi	R, 0xC9	;	201
	ldi	R, 0x00	;	0
	std	Y+19, R	;	0x13
	std	Y+18, R	;	0x12
	ldi	R, 0xCA	;	202
	ldi	R, 0x00	;	0
	std	Y+21, R	;	0x15
	std	Y+20, R	;	0x14
	ldi	R, 0xCE	;	206
	ldi	R, 0x00	;	0
	std	Y+23, R	;	0x17
	std	Y+22, R	;	0x16
	std	Y+25, R	;	0x19
	std	Y+26, R	;	0x1a
	std	Y+27, R	;	0x1b
	std	Y+28, R	;	0x1c
	ldi	R, 0x4A	;	74
	ldi	R, 0x05	;	5
	std	Z+3, R	;	0x03
	std	Z+2, R	;	0x02
	std	Z+4, R	;	0x04
	std	Z+5, R	;	0x05
	std	Z+6, R	;	0x06
	std	Z+7, R	;	0x07
	ldi	R, 0x55	;	85
	ldi	R, 0x01	;	1
	std	Z+1, R	;	0x01
	st	Z, R
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	std	Z+13, R	;	0x0d
	std	Z+12, R	;	0x0c
	ldi	R, 0x9A	;	154
	ldi	R, 0x05	;	5
	ldi	R, 0x50	;	80
	st	Z, R
	ldi	R, 0x01	;	1
	std	Z+1, R	;	0x01
	ldi	R, 0x8D	;	141
	ldi	R, 0x06	;	6
	movw	R, R
	adiw	R, 0x03	;	3
	st	X, R
	st	-X, R
	sbiw	R, 0x02	;	2
	ldi	R, 0x97	;	151
	ldi	R, 0x01	;	1
	adiw	R, 0x01	;	1
	st	X, R
	st	-X, R
	adiw	R, 0x05	;	5
	st	X, R
	st	-X, R
	sbiw	R, 0x04	;	4
	movw	R, R
	std	Z+6, R	;	0x06
	std	Z+7, R	;	0x07
	std	Z+8, R	;	0x08
	ldi	R, 0x14	;	20
	ldi	R, 0x96	;	150
	ldi	R, 0x06	;	6
	movw	R, R
	mov	R, R
	st	X+, R
	dec	R
	brne	<global constructors keyed to 65535_0_main.cpp.o.5093+X>
	movw	R, R
	adiw	R, 0x1d	;	29
	st	X+, R
	st	X+, R
	st	X, R
	ldi	R, 0xAD	;	173
	ldi	R, 0x06	;	6
	movw	R, R
	st	X+, R
	dec	R
	brne	<global constructors keyed to 65535_0_main.cpp.o.5093+X>
	ldi	R, 0x0C	;	12
	ldi	R, 0x16	;	22
	ldi	R, 0x01	;	1
	ldi	R, 0x14	;	20
	ldi	R, 0x07	;	7
	ld	R, Z+
	st	X+, R
	dec	R
	brne	<global constructors keyed to 65535_0_main.cpp.o.5093+X>
	ldi	R, 0x0A	;	10
	ldi	R, 0x22	;	34
	ldi	R, 0x01	;	1
	ldi	R, 0x20	;	32
	ldi	R, 0x07	;	7
	ld	R, Z+
	st	X+, R
	dec	R
	brne	<global constructors keyed to 65535_0_main.cpp.o.5093+X>
	ldi	R, 0x08	;	8
	ldi	R, 0x2C	;	44
	ldi	R, 0x01	;	1
	ldi	R, 0x2A	;	42
	ldi	R, 0x07	;	7
	ld	R, Z+
	st	X+, R
	dec	R
	brne	<global constructors keyed to 65535_0_main.cpp.o.5093+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x94	;	148
	ldi	R, 0x35	;	53
	ldi	R, 0x77	;	119
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0xFF	;	255
	sts	<GPS+X>, R
	ldi	R, 0x51	;	81
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0xCD	;	205
	ldi	R, 0x08	;	8
	st	Z, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	st	Z, R
	ldi	R, 0xDD	;	221
	ldi	R, 0x07	;	7
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0x55	;	85
	ldi	R, 0x08	;	8
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	movw	R, R
	std	Z+59, R	;	0x3b
	std	Z+58, R	;	0x3a
	std	Z+57, R	;	0x39
	std	Z+54, R	;	0x36
	std	Z+53, R	;	0x35
	std	Z+52, R	;	0x34
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	std	Z+56, R	;	0x38
	std	Z+55, R	;	0x37
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	std	Z+60, R	;	0x3c
	std	Z+61, R	;	0x3d
	std	Z+62, R	;	0x3e
	std	Z+63, R	;	0x3f
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	adiw	R, 0x03	;	3
	st	X, R
	st	-X, R
	sbiw	R, 0x02	;	2
	ldi	R, 0x80	;	128
	ldi	R, 0x00	;	0
	adiw	R, 0x05	;	5
	st	X, R
	st	-X, R
	sbiw	R, 0x04	;	4
	ldi	R, 0xA0	;	160
	ldi	R, 0x00	;	0
	adiw	R, 0x07	;	7
	st	X, R
	st	-X, R
	sbiw	R, 0x06	;	6
	adiw	R, 0x09	;	9
	st	X, R
	st	-X, R
	sbiw	R, 0x08	;	8
	adiw	R, 0x0b	;	11
	st	X, R
	st	-X, R
	sbiw	R, 0x0a	;	10
	adiw	R, 0x16	;	22
	st	X, R
	sbiw	R, 0x16	;	22
	adiw	R, 0x0d	;	13
	st	X, R
	st	-X, R
	sbiw	R, 0x0c	;	12
	adiw	R, 0x0f	;	15
	st	X, R
	st	-X, R
	sbiw	R, 0x0e	;	14
	adiw	R, 0x15	;	21
	st	X, R
	sbiw	R, 0x15	;	21
	adiw	R, 0x14	;	20
	st	X, R
	sbiw	R, 0x14	;	20
	adiw	R, 0x13	;	19
	st	X, R
	st	-X, R
	sbiw	R, 0x12	;	18
	adiw	R, 0x11	;	17
	st	X, R
	st	-X, R
	sbiw	R, 0x10	;	16
	adiw	R, 0x17	;	23
	st	X, R
	sbiw	R, 0x17	;	23
	adiw	R, 0x18	;	24
	st	X, R
	sbiw	R, 0x18	;	24
	adiw	R, 0x1a	;	26
	st	X, R
	st	-X, R
	sbiw	R, 0x19	;	25
	adiw	R, 0x35	;	53
	st	X, R
	sbiw	R, 0x35	;	53
	ldi	R, 0x03	;	3
	adiw	R, 0x36	;	54
	st	X, R
	sbiw	R, 0x36	;	54
	ldi	R, 0x02	;	2
	adiw	R, 0x37	;	55
	st	X, R
	sbiw	R, 0x37	;	55
	ldi	R, 0x05	;	5
	adiw	R, 0x38	;	56
	st	X, R
	sbiw	R, 0x38	;	56
	adiw	R, 0x3a	;	58
	st	X, R
	st	-X, R
	sbiw	R, 0x39	;	57
	adiw	R, 0x3c	;	60
	st	X, R
	st	-X, R
	sbiw	R, 0x3b	;	59
	adiw	R, 0x3d	;	61
	st	X, R
	sbiw	R, 0x3d	;	61
	adiw	R, 0x3e	;	62
	st	X, R
	sbiw	R, 0x3e	;	62
	sts	<tft+X>, R
	sts	<tft+X>, R
	sts	<tft+X>, R
	sts	<tft+X>, R
	ldi	R, 0x9C	;	156
	ldi	R, 0x05	;	5
	adiw	R, 0x20	;	32
	st	X, R
	st	-X, R
	sbiw	R, 0x1f	;	31
	ldi	R, 0x27	;	39
	ldi	R, 0x07	;	7
	lpm	R, Z
	ldi	R, 0x00	;	0
	add	R, R
	adc	R, R
	subi	R, 0xEC	;	236
	sbci	R, 0xF8	;	248
	lpm	R, Z+
	lpm	R, Z
	adiw	R, 0x1e	;	30
	st	X, R
	st	-X, R
	sbiw	R, 0x1d	;	29
	ldi	R, 0xFA	;	250
	ldi	R, 0x06	;	6
	lpm	R, Z
	adiw	R, 0x33	;	51
	st	X, R
	sbiw	R, 0x33	;	51
	ldi	R, 0x24	;	36
	ldi	R, 0x07	;	7
	lpm	R, Z
	ldi	R, 0x00	;	0
	add	R, R
	adc	R, R
	subi	R, 0xEC	;	236
	sbci	R, 0xF8	;	248
	lpm	R, Z+
	lpm	R, Z
	adiw	R, 0x1c	;	28
	st	X, R
	st	-X, R
	sbiw	R, 0x1b	;	27
	ldi	R, 0xF7	;	247
	ldi	R, 0x06	;	6
	lpm	R, Z
	adiw	R, 0x31	;	49
	st	X, R
	sbiw	R, 0x31	;	49
	com	R
	adiw	R, 0x32	;	50
	st	X, R
	sbiw	R, 0x32	;	50
	mov	R, R
	com	R
	adiw	R, 0x34	;	52
	st	X, R
	sbiw	R, 0x34	;	52
	sts	<tft+X>, R
	sts	<tft+X>, R
	sts	<tft+X>, R
	ldi	R, 0x67	;	103
	ldi	R, 0x01	;	1
	st	X+, R
	st	X, R
	ldi	R, 0x9D	;	157
	ldi	R, 0x05	;	5
	std	Z+5, R	;	0x05
	std	Z+6, R	;	0x06
	std	Z+9, R	;	0x09
	std	Z+11, R	;	0x0b
	pop	R
	pop	R
	pop	R
	pop	R
	ret

HardwareSerial::_tx_udr_empty_irq():
	movw	R, R
	ldd	R, Z+28	;	0x1c
	add	R, R
	mov	R, R
	adc	R, R
	subi	R, 0xA3	;	163
	sbci	R, 0xFF	;	255
	ld	R, X
	ldd	R, Z+28	;	0x1c
	ldi	R, 0x00	;	0
	adiw	R, 0x01	;	1
	andi	R, 0x3F	;	63
	eor	R, R
	std	Z+28, R	;	0x1c
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	st	X, R
	ldd	R, Z+16	;	0x10
	ldd	R, Z+17	;	0x11
	ld	R, X
	andi	R, 0x42	;	66
	st	X, R
	ldd	R, Z+27	;	0x1b
	ldd	R, Z+28	;	0x1c
	cpse	R, R
	rjmp	<HardwareSerial::_tx_udr_empty_irq()+X>
	ldd	R, Z+18	;	0x12
	ldd	R, Z+19	;	0x13
	mov	R, R
	ld	R, Z
	andi	R, 0xDF	;	223
	st	Z, R
	ret

HardwareSerial::available():
	movw	R, R
	ldd	R, Z+25	;	0x19
	ldd	R, Z+26	;	0x1a
	mov	R, R
	ldi	R, 0x00	;	0
	subi	R, 0xC0	;	192
	sbci	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	andi	R, 0x3F	;	63
	eor	R, R
	ret

HardwareSerial::availableForWrite():
	movw	R, R
	ldd	R, Z+27	;	0x1b
	ldd	R, Z+28	;	0x1c
	mov	R, R
	ldi	R, 0x00	;	0
	mov	R, R
	ldi	R, 0x00	;	0
	sub	R, R
	sbc	R, R
	cp	R, R
	brcs	<HardwareSerial::availableForWrite()+X>
	adiw	R, 0x3f	;	63
	ret
	sbiw	R, 0x01	;	1
	ret

HardwareSerial::flush():
	push	R
	push	R
	movw	R, R
	ldd	R, Y+24	;	0x18
	and	R, R
	breq	<HardwareSerial::flush()+X>
	ldd	R, Y+18	;	0x12
	ldd	R, Y+19	;	0x13
	ldd	R, Y+16	;	0x10
	ldd	R, Y+17	;	0x11
	ld	R, X
	sbrc	R, 5
	rjmp	<HardwareSerial::flush()+X>
	ld	R, Z
	sbrc	R, 6
	rjmp	<HardwareSerial::flush()+X>
	in	R, 0x3f	;	63
	sbrc	R, 7
	rjmp	<HardwareSerial::flush()+X>
	ld	R, X
	sbrs	R, 5
	rjmp	<HardwareSerial::flush()+X>
	ld	R, Z
	sbrs	R, 5
	rjmp	<HardwareSerial::flush()+X>
	movw	R, R
	call	<HardwareSerial::_tx_udr_empty_irq()>
	rjmp	<HardwareSerial::flush()+X>
	pop	R
	pop	R
	ret

HardwareSerial::peek():
	movw	R, R
	ldd	R, Z+25	;	0x19
	ldd	R, Z+26	;	0x1a
	cp	R, R
	breq	<HardwareSerial::peek()+X>
	ldd	R, Z+26	;	0x1a
	add	R, R
	adc	R, R
	ldd	R, Z+29	;	0x1d
	ldi	R, 0x00	;	0
	ret
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	ret

HardwareSerial::read():
	movw	R, R
	ldd	R, Z+25	;	0x19
	ldd	R, Z+26	;	0x1a
	cp	R, R
	breq	<HardwareSerial::read()+X>
	ldd	R, Z+26	;	0x1a
	add	R, R
	mov	R, R
	adc	R, R
	adiw	R, 0x1d	;	29
	ld	R, X
	ldd	R, Z+26	;	0x1a
	subi	R, 0xFF	;	255
	andi	R, 0x3F	;	63
	std	Z+26, R	;	0x1a
	ldi	R, 0x00	;	0
	ret
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	ret

HardwareSerial::write(unsigned char):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	ldi	R, 0x01	;	1
	std	Y+24, R	;	0x18
	ldd	R, Y+27	;	0x1b
	ldd	R, Y+28	;	0x1c
	cpse	R, R
	rjmp	<HardwareSerial::write(unsigned char)+X>
	ldd	R, Y+16	;	0x10
	ldd	R, Y+17	;	0x11
	ld	R, Z
	sbrs	R, 5
	rjmp	<HardwareSerial::write(unsigned char)+X>
	in	R, 0x3f	;	63
	cli
	ldd	R, Y+22	;	0x16
	ldd	R, Y+23	;	0x17
	st	Z, R
	ldd	R, Y+16	;	0x10
	ldd	R, Y+17	;	0x11
	ld	R, Z
	andi	R, 0x42	;	66
	st	Z, R
	out	0x3f, R	;	63
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	mov	R, R
	ldd	R, Y+27	;	0x1b
	ldi	R, 0x00	;	0
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	andi	R, 0x3F	;	63
	eor	R, R
	mov	R, R
	ldd	R, Y+28	;	0x1c
	cpse	R, R
	rjmp	<HardwareSerial::write(unsigned char)+X>
	in	R, 0x3f	;	63
	sbrc	R, 7
	rjmp	<HardwareSerial::write(unsigned char)+X>
	ldd	R, Y+16	;	0x10
	ldd	R, Y+17	;	0x11
	ld	R, Z
	sbrs	R, 5
	rjmp	<HardwareSerial::write(unsigned char)+X>
	movw	R, R
	call	<HardwareSerial::_tx_udr_empty_irq()>
	rjmp	<HardwareSerial::write(unsigned char)+X>
	ldd	R, Y+27	;	0x1b
	add	R, R
	mov	R, R
	adc	R, R
	subi	R, 0xA3	;	163
	sbci	R, 0xFF	;	255
	st	Z, R
	in	R, 0x3f	;	63
	cli
	std	Y+27, R	;	0x1b
	ldd	R, Y+18	;	0x12
	ldd	R, Y+19	;	0x13
	ld	R, Z
	ori	R, 0x20	;	32
	rjmp	<HardwareSerial::write(unsigned char)+X>

isgraph:
	cpi	R, 0x20	;	32
	breq	<isprint+X>

isprint:
	cpse	R, R
	jmp	<__ctype_isfalse>
	subi	R, 0x20	;	32
	subi	R, 0x5F	;	95
	brcc	<isprint+X>
	ret

isspace:
	cpse	R, R
	jmp	<__ctype_isfalse>
	cpi	R, 0x20	;	32
	breq	<isspace+X>
	subi	R, 0x09	;	9
	subi	R, 0x05	;	5
	brcc	<isspace+X>
	ret

main:
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	sbiw	R, 0x16	;	22
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	sei
	in	R, 0x24	;	36
	ori	R, 0x02	;	2
	out	0x24, R	;	36
	in	R, 0x24	;	36
	ori	R, 0x01	;	1
	out	0x24, R	;	36
	in	R, 0x25	;	37
	ori	R, 0x02	;	2
	out	0x25, R	;	37
	in	R, 0x25	;	37
	ori	R, 0x01	;	1
	out	0x25, R	;	37
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x04	;	4
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x04	;	4
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xFE	;	254
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x80	;	128
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<_usbConfiguration>, R
	sts	<_usbCurrentStatus>, R
	sts	<_usbSuspendState>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0xA0	;	160
	sts	<__TEXT_REGION_LENGTH__+X>, R
	in	R, 0x29	;	41
	andi	R, 0xEF	;	239
	out	0x29, R	;	41
	in	R, 0x29	;	41
	ori	R, 0x02	;	2
	out	0x29, R	;	41
	in	R, 0x29	;	41
	sbrs	R, 0
	rjmp	<main+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<delay>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xCF	;	207
	ori	R, 0x10	;	16
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xF0	;	240
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xEE	;	238
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0x0D	;	13
	sts	<__TEXT_REGION_LENGTH__+X>, R
	call	<millis>
	movw	R, R
	movw	R, R
	ldi	R, 0x01	;	1
	ldi	R, 0x0D	;	13
	call	<pinMode>
	ldi	R, 0x01	;	1
	ldi	R, 0x0D	;	13
	call	<digitalWrite>
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	sts	<Serial+X>, R
	sts	<Serial+X>, R
	ldi	R, 0x80	;	128
	ldi	R, 0x25	;	37
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Adafruit_GPS::begin(unsigned long) [clone .constprop.80]>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_ST77xx::begin(unsigned long)>
	ldi	R, 0x8D	;	141
	ldi	R, 0x06	;	6
	call	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]>
	ldi	R, 0x80	;	128
	ldi	R, 0x06	;	6
	call	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]>
	ldi	R, 0x55	;	85
	ldi	R, 0x06	;	6
	call	<Adafruit_ST77xx::displayInit(unsigned char const*) [clone .constprop.65]>
	ldi	R, 0xC0	;	192
	std	Y+1, R	;	0x01
	movw	R, R
	adiw	R, 0x01	;	1
	movw	R, R
	movw	R, R
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_SPITFT::sendCommand(unsigned char, unsigned char*, unsigned char) [clone .constprop.67]>
	ldi	R, 0x02	;	2
	sts	<tft+X>, R
	ldi	R, 0x00	;	0
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_ST7735::setRotation(unsigned char)>
	ldi	R, 0x01	;	1
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_ST7735::setRotation(unsigned char)>
	ldi	R, 0x03	;	3
	sts	<tft+X>, R
	sts	<tft+X>, R
	ldi	R, 0xFF	;	255
	ldi	R, 0x07	;	7
	sts	<tft+X>, R
	sts	<tft+X>, R
	sts	<tft+X>, R
	sts	<tft+X>, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_GFX::fillScreen(unsigned int)>
	ldi	R, 0x01	;	1
	ldi	R, 0x06	;	6
	call	<pinMode>
	sts	<card+X>, R
	sts	<card+X>, R
	sts	<card+X>, R
	sts	<card+X>, R
	ldi	R, 0x06	;	6
	sts	<card+X>, R
	call	<millis>
	movw	R, R
	ldi	R, 0x01	;	1
	lds	R, <card+X>
	call	<pinMode>
	ldi	R, 0x01	;	1
	lds	R, <card+X>
	call	<digitalWrite>
	call	<SPIClass::begin()>
	ldi	R, 0x52	;	82
	sts	<settings>, R
	ldi	R, 0x01	;	1
	sts	<settings+X>, R
	lds	R, <settings>
	lds	R, <settings+X>
	call	<SPIClass::beginTransaction(SPISettings)>
	ldi	R, 0x0A	;	10
	mov	R, R
	ldi	R, 0xFF	;	255
	call	<SPIClass::transfer(unsigned char)>
	dec	R
	cpse	R, R
	rjmp	<main+X>
	ldi	R, 0x9D	;	157
	ldi	R, 0x05	;	5
	call	<Sd2Card::chipSelectLow()>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x9D	;	157
	ldi	R, 0x05	;	5
	call	<Sd2Card::cardCommand(unsigned char, unsigned long)>
	mov	R, R
	sts	<card+X>, R
	ldi	R, 0x01	;	1
	cp	R, R
	breq	<main+X>
	call	<millis>
	sub	R, R
	sbc	R, R
	cpi	R, 0xD1	;	209
	sbci	R, 0x07	;	7
	brcs	<main+X>
	ldi	R, 0x01	;	1
	sts	<card+X>, R
	ldi	R, 0x9D	;	157
	ldi	R, 0x05	;	5
	call	<Sd2Card::chipSelectHigh()>
	ldi	R, 0xD2	;	210
	ldi	R, 0x01	;	1
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Print::write(char const*) [clone .part.2]>
	rjmp	<main+X>
	ldi	R, 0xAA	;	170
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x08	;	8
	ldi	R, 0x9D	;	157
	ldi	R, 0x05	;	5
	call	<Sd2Card::cardCommand(unsigned char, unsigned long)>
	sbrs	R, 2
	rjmp	<main+X>
	sts	<card+X>, R
	lds	R, <card+X>
	mov	R, R
	mov	R, R
	mov	R, R
	ldi	R, 0x40	;	64
	mov	R, R
	cpi	R, 0x02	;	2
	breq	<main+X>
	mov	R, R
	mov	R, R
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	ldi	R, 0x37	;	55
	ldi	R, 0x9D	;	157
	ldi	R, 0x05	;	5
	call	<Sd2Card::cardCommand(unsigned char, unsigned long)>
	movw	R, R
	movw	R, R
	ldi	R, 0x29	;	41
	ldi	R, 0x9D	;	157
	ldi	R, 0x05	;	5
	call	<Sd2Card::cardCommand(unsigned char, unsigned long)>
	sts	<card+X>, R
	and	R, R
	breq	<main+X>
	call	<millis>
	sub	R, R
	sbc	R, R
	cpi	R, 0xD1	;	209
	sbci	R, 0x07	;	7
	brcs	<main+X>
	ldi	R, 0x08	;	8
	rjmp	<main+X>
	ldi	R, 0x04	;	4
	mov	R, R
	call	<spiRec()>
	sts	<card+X>, R
	dec	R
	cpse	R, R
	rjmp	<main+X>
	cpi	R, 0xAA	;	170
	breq	<main+X>
	ldi	R, 0x02	;	2
	rjmp	<main+X>
	ldi	R, 0x02	;	2
	sts	<card+X>, R
	rjmp	<main+X>
	lds	R, <card+X>
	cpi	R, 0x02	;	2
	brne	<main+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	ldi	R, 0x3A	;	58
	ldi	R, 0x9D	;	157
	ldi	R, 0x05	;	5
	call	<Sd2Card::cardCommand(unsigned char, unsigned long)>
	and	R, R
	breq	<main+X>
	ldi	R, 0x06	;	6
	rjmp	<main+X>
	call	<spiRec()>
	andi	R, 0xC0	;	192
	cpi	R, 0xC0	;	192
	brne	<main+X>
	ldi	R, 0x03	;	3
	sts	<card+X>, R
	call	<spiRec()>
	call	<spiRec()>
	call	<spiRec()>
	ldi	R, 0x9D	;	157
	ldi	R, 0x05	;	5
	call	<Sd2Card::chipSelectHigh()>
	ldi	R, 0x50	;	80
	sts	<settings>, R
	ldi	R, 0x01	;	1
	sts	<settings+X>, R
	call	<millis>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	cpi	R, 0xDC	;	220
	sbci	R, 0x05	;	5
	cpc	R, R
	cpc	R, R
	brcc	<main+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<delay>
	rjmp	<main+X>
	ldi	R, 0xEC	;	236
	ldi	R, 0x01	;	1
	call	<Print::println(char const*) [clone .constprop.77]>
	ldi	R, 0x1E	;	30
	ldi	R, 0x02	;	2
	call	<Print::println(char const*) [clone .constprop.77]>
	ldi	R, 0x2E	;	46
	ldi	R, 0x02	;	2
	call	<Print::println(char const*) [clone .constprop.77]>
	ldi	R, 0xF0	;	240
	ldi	R, 0x05	;	5
	call	<HardwareSerial::flush()>
	lds	R, <Serial1+X>
	lds	R, <Serial1+X>
	ld	R, Z
	andi	R, 0xEF	;	239
	st	Z, R
	lds	R, <Serial1+X>
	lds	R, <Serial1+X>
	ld	R, Z
	andi	R, 0xF7	;	247
	st	Z, R
	lds	R, <Serial1+X>
	lds	R, <Serial1+X>
	ld	R, Z
	andi	R, 0x7F	;	127
	st	Z, R
	lds	R, <Serial1+X>
	lds	R, <Serial1+X>
	ld	R, Z
	andi	R, 0xDF	;	223
	st	Z, R
	lds	R, <Serial1+X>
	sts	<Serial1+X>, R
	ldi	R, 0x00	;	0
	ldi	R, 0xE1	;	225
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Adafruit_GPS::begin(unsigned long) [clone .constprop.80]>
	ldi	R, 0x00	;	0
	ldi	R, 0x0D	;	13
	call	<digitalWrite>
	ldi	R, 0x64	;	100
	mov	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	ldi	R, 0x55	;	85
	mov	R, R
	ldi	R, 0x08	;	8
	mov	R, R
	lds	R, <guard variable for loop::s>
	cpse	R, R
	rjmp	<main+X>
	sts	<loop::s+X>, R
	sts	<loop::s>, R
	sts	<loop::s+X>, R
	sts	<loop::s+X>, R
	sts	<loop::s+X>, R
	sts	<loop::s+X>, R
	ldi	R, 0xEE	;	238
	ldi	R, 0x04	;	4
	call	<String::String(char const*) [clone .part.2] [clone .constprop.95]>
	ldi	R, 0x01	;	1
	sts	<guard variable for loop::s>, R
	call	<millis>
	std	Y+19, R	;	0x13
	std	Y+20, R	;	0x14
	std	Y+21, R	;	0x15
	std	Y+22, R	;	0x16
	lds	R, <GPS+X>
	cpse	R, R
	rjmp	<main+X>
	lds	R, <GPS+X>
	cpse	R, R
	rjmp	<main+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	sbiw	R, 0x00	;	0
	brne	<main+X>
	rjmp	<main+X>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+8	;	0x08
	ldd	R, Z+9	;	0x09
	mov	R, R
	icall
	or	R, R
	brne	<main+X>
	rjmp	<main+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	icall
	mov	R, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	or	R, R
	breq	<main+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	cp	R, R
	brge	<main+X>
	rjmp	<main+X>
	mov	R, R
	mov	R, R
	add	R, R
	sbc	R, R
	subi	R, 0x46	;	70
	sbci	R, 0xF8	;	248
	ld	R, Z
	subi	R, 0xFF	;	255
	sts	<GPS+X>, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	or	R, R
	breq	<main+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	call	<SPIClass::beginTransaction(SPISettings)>
	lds	R, <GPS+X>
	sbrc	R, 7
	rjmp	<main+X>
	ldi	R, 0x00	;	0
	call	<digitalWrite>
	ldi	R, 0xFF	;	255
	call	<SPIClass::transfer(unsigned char)>
	mov	R, R
	lds	R, <GPS+X>
	sbrc	R, 7
	rjmp	<main+X>
	ldi	R, 0x01	;	1
	call	<digitalWrite>
	cpi	R, 0x0A	;	10
	brne	<main+X>
	lds	R, <GPS+X>
	cpi	R, 0x0D	;	13
	brne	<main+X>
	mov	R, R
	mov	R, R
	add	R, R
	sbc	R, R
	movw	R, R
	call	<isprint>
	or	R, R
	brne	<main+X>
	movw	R, R
	call	<isspace>
	or	R, R
	breq	<main+X>
	sts	<GPS+X>, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	ldi	R, 0x01	;	1
	add	R, R
	sts	<GPS+X>, R
	add	R, R
	mov	R, R
	adc	R, R
	st	Z, R
	lds	R, <GPS+X>
	cpi	R, 0x78	;	120
	brcs	<main+X>
	ldi	R, 0x77	;	119
	sts	<GPS+X>, R
	lds	R, <Adafruit_GPS::read()::firstChar>
	lds	R, <Adafruit_GPS::read()::firstChar+X>
	lds	R, <Adafruit_GPS::read()::firstChar+X>
	lds	R, <Adafruit_GPS::read()::firstChar+X>
	cpi	R, 0x0A	;	10
	breq	<main+X>
	rjmp	<main+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	add	R, R
	mov	R, R
	adc	R, R
	st	Z, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	ldi	R, 0x07	;	7
	cpi	R, 0xDD	;	221
	cpc	R, R
	breq	<main+X>
	rjmp	<main+X>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0x01	;	1
	sts	<GPS+X>, R
	call	<millis>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<Adafruit_GPS::read()::firstChar>, R
	sts	<Adafruit_GPS::read()::firstChar+X>, R
	sts	<Adafruit_GPS::read()::firstChar+X>, R
	sts	<Adafruit_GPS::read()::firstChar+X>, R
	rjmp	<main+X>
	ldi	R, 0x00	;	0
	rjmp	<main+X>
	call	<micros>
	movw	R, R
	movw	R, R
	lds	R, <twi_state>
	cpse	R, R
	rjmp	<main+X>
	ldi	R, 0x01	;	1
	sts	<twi_state>, R
	sts	<twi_sendStop>, R
	ldi	R, 0xFF	;	255
	sts	<twi_error>, R
	sts	<twi_masterBufferIndex>, R
	ldi	R, 0x1F	;	31
	sts	<twi_masterBufferLength>, R
	sts	<twi_slarw>, R
	lds	R, <twi_slarw>
	ori	R, 0x20	;	32
	sts	<twi_slarw>, R
	lds	R, <twi_inRepStart>
	cpi	R, 0x01	;	1
	breq	<main+X>
	rjmp	<main+X>
	sts	<twi_inRepStart>, R
	call	<micros>
	movw	R, R
	movw	R, R
	lds	R, <twi_slarw>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	or	R, R
	or	R, R
	or	R, R
	breq	<main+X>
	call	<micros>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcc	<main+X>
	rjmp	<main+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrc	R, 3
	rjmp	<main+X>
	ldi	R, 0xC5	;	197
	sts	<__TEXT_REGION_LENGTH__+X>, R
	call	<micros>
	movw	R, R
	movw	R, R
	lds	R, <twi_state>
	cpi	R, 0x01	;	1
	brne	<main+X>
	rjmp	<main+X>
	lds	R, <twi_masterBufferIndex>
	cpi	R, 0x20	;	32
	brcs	<main+X>
	rjmp	<main+X>
	lds	R, <twi_masterBufferIndex>
	ldi	R, 0xFC	;	252
	ldi	R, 0x04	;	4
	ldi	R, 0x87	;	135
	ldi	R, 0x04	;	4
	ldi	R, 0x00	;	0
	cp	R, R
	breq	<main+X>
	ld	R, X+
	st	Z+, R
	subi	R, 0xFF	;	255
	rjmp	<main+X>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	or	R, R
	or	R, R
	or	R, R
	brne	<main+X>
	rjmp	<main+X>
	call	<micros>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<main+X>
	rjmp	<main+X>
	lds	R, <twi_do_reset_on_timeout>
	call	<twi_handleTimeout>
	ldi	R, 0x00	;	0
	sts	<TwoWire::rxBufferIndex>, R
	sts	<TwoWire::rxBufferLength>, R
	cpi	R, 0x20	;	32
	brne	<main+X>
	sts	<GPS+X>, R
	ldi	R, 0x20	;	32
	ldi	R, 0x00	;	0
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	mov	R, R
	icall
	cpi	R, 0x0A	;	10
	brne	<main+X>
	lds	R, <GPS+X>
	cpi	R, 0x0D	;	13
	brne	<main+X>
	sts	<GPS+X>, R
	lds	R, <GPS+X>
	mov	R, R
	mov	R, R
	add	R, R
	sbc	R, R
	subi	R, 0x46	;	70
	sbci	R, 0xF8	;	248
	st	Z, R
	subi	R, 0xFF	;	255
	sts	<GPS+X>, R
	subi	R, 0x01	;	1
	sbc	R, R
	brne	<main+X>
	lds	R, <GPS+X>
	subi	R, 0x01	;	1
	sts	<GPS+X>, R
	cpse	R, R
	rjmp	<main+X>
	lds	R, <GPS+X>
	cpi	R, 0x0A	;	10
	brne	<main+X>
	ldi	R, 0xFF	;	255
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	lds	R, <GPS+X>
	lds	R, <loop::s+X>
	lds	R, <loop::s+X>
	and	R, R
	brne	<main+X>
	rjmp	<main+X>
	ldi	R, 0x01	;	1
	or	R, R
	brne	<main+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x0D	;	13
	call	<digitalWrite>
	sts	<GPS+X>, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	movw	R, R
	ld	R, X
	cpi	R, 0x24	;	36
	breq	<main+X>
	cpi	R, 0x21	;	33
	breq	<main+X>
	rjmp	<main+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	movw	R, R
	movw	R, R
	adiw	R, 0x01	;	1
	ld	R, Z
	cpse	R, R
	rjmp	<main+X>
	ld	R, Z
	cpi	R, 0x2A	;	42
	brne	<main+X>
	rjmp	<main+X>
	cp	R, R
	cpc	R, R
	brcs	<main+X>
	rjmp	<main+X>
	sbiw	R, 0x01	;	1
	rjmp	<main+X>
	ldi	R, 0xE5	;	229
	rjmp	<main+X>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	or	R, R
	or	R, R
	or	R, R
	brne	<main+X>
	rjmp	<main+X>
	call	<micros>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<main+X>
	rjmp	<main+X>
	rjmp	<main+X>
	ldi	R, 0x20	;	32
	rjmp	<main+X>
	ldi	R, 0xDD	;	221
	ldi	R, 0x07	;	7
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	rjmp	<main+X>
	or	R, R
	or	R, R
	or	R, R
	breq	<main+X>
	rjmp	<main+X>
	ldd	R, Y+19	;	0x13
	ldd	R, Y+20	;	0x14
	ldd	R, Y+21	;	0x15
	ldd	R, Y+22	;	0x16
	sts	<Adafruit_GPS::read()::firstChar>, R
	sts	<Adafruit_GPS::read()::firstChar+X>, R
	sts	<Adafruit_GPS::read()::firstChar+X>, R
	sts	<Adafruit_GPS::read()::firstChar+X>, R
	rjmp	<main+X>
	ldi	R, 0xBF	;	191
	add	R, R
	subi	R, 0x37	;	55
	cpi	R, 0x06	;	6
	brcc	<main+X>
	rjmp	<main+X>
	ldi	R, 0x00	;	0
	rjmp	<main+X>
	ldi	R, 0xBF	;	191
	add	R, R
	subi	R, 0x37	;	55
	cpi	R, 0x06	;	6
	brcc	<main+X>
	rjmp	<main+X>
	ldi	R, 0x00	;	0
	rjmp	<main+X>
	or	R, R
	breq	<main+X>
	rjmp	<main+X>
	ldi	R, 0x03	;	3
	ldi	R, 0x00	;	0
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0x14	;	20
	ldi	R, 0x07	;	7
	movw	R, R
	call	<Adafruit_GPS::tokenOnList(char*, char const**) [clone .constprop.42]>
	movw	R, R
	sbiw	R, 0x00	;	0
	brne	<main+X>
	rjmp	<main+X>
	movw	R, R
	ldi	R, 0x93	;	147
	ldi	R, 0x06	;	6
	call	<strcpy>
	ldi	R, 0x0D	;	13
	ldi	R, 0x00	;	0
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	movw	R, R
	ld	R, Z+
	and	R, R
	brne	<main+X>
	sbiw	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	add	R, R
	adc	R, R
	ldi	R, 0x20	;	32
	ldi	R, 0x07	;	7
	movw	R, R
	call	<Adafruit_GPS::tokenOnList(char*, char const**) [clone .constprop.42]>
	sbiw	R, 0x00	;	0
	brne	<main+X>
	rjmp	<main+X>
	movw	R, R
	ldi	R, 0x96	;	150
	ldi	R, 0x06	;	6
	call	<strcpy>
	ldi	R, 0x49	;	73
	ldi	R, 0x00	;	0
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	movw	R, R
	ldi	R, 0xC2	;	194
	ldi	R, 0x01	;	1
	ldi	R, 0x96	;	150
	ldi	R, 0x06	;	6
	call	<strcmp>
	or	R, R
	breq	<main+X>
	rjmp	<main+X>
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]>
	cpse	R, R
	rjmp	<main+X>
	movw	R, R
	call	<atol>
	movw	R, R
	movw	R, R
	ldi	R, 0x10	;	16
	ldi	R, 0x27	;	39
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<__udivmodsi4>
	sts	<GPS+X>, R
	movw	R, R
	movw	R, R
	call	<__udivmodsi4>
	sts	<GPS+X>, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	call	<__udivmodsi4>
	sts	<GPS+X>, R
	ldi	R, 0x2E	;	46
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	movw	R, R
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	movw	R, R
	ldi	R, 0x2A	;	42
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	cp	R, R
	cpc	R, R
	brne	<main+X>
	rjmp	<main+X>
	movw	R, R
	cp	R, R
	cpc	R, R
	brcc	<main+X>
	movw	R, R
	cp	R, R
	cpc	R, R
	brne	<main+X>
	rjmp	<main+X>
	cp	R, R
	cpc	R, R
	brcs	<main+X>
	rjmp	<main+X>
	movw	R, R
	call	<atof>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x7A	;	122
	ldi	R, 0x44	;	68
	call	<__mulsf3>
	call	<__fixunssfsi>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	movw	R, R
	movw	R, R
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	movw	R, R
	call	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]>
	cpse	R, R
	rjmp	<main+X>
	movw	R, R
	ldd	R, Z+1	;	0x01
	cpi	R, 0x41	;	65
	breq	<main+X>
	rjmp	<main+X>
	ldi	R, 0x01	;	1
	sts	<GPS+X>, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	adiw	R, 0x01	;	1
	movw	R, R
	call	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]>
	cpse	R, R
	rjmp	<main+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x07	;	7
	ldi	R, 0xD1	;	209
	ldi	R, 0x06	;	6
	ldi	R, 0xC9	;	201
	ldi	R, 0x06	;	6
	ldi	R, 0xD9	;	217
	ldi	R, 0x06	;	6
	movw	R, R
	call	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]>
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	adiw	R, 0x01	;	1
	call	<strchr>
	adiw	R, 0x01	;	1
	movw	R, R
	call	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]>
	cpse	R, R
	rjmp	<main+X>
	ldi	R, 0x02	;	2
	ldi	R, 0x07	;	7
	ldi	R, 0xD5	;	213
	ldi	R, 0x06	;	6
	ldi	R, 0xCD	;	205
	ldi	R, 0x06	;	6
	ldi	R, 0xDD	;	221
	ldi	R, 0x06	;	6
	movw	R, R
	call	<Adafruit_GPS::parseCoord(char*, float*, float*, long*, char*) [clone .part.1] [clone .constprop.47]>
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	adiw	R, 0x01	;	1
	call	<strchr>
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]>
	cpse	R, R
	rjmp	<main+X>
	movw	R, R
	call	<atof>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]>
	cpse	R, R
	rjmp	<main+X>
	movw	R, R
	call	<atof>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<Adafruit_GPS::isEmpty(char*) [clone .constprop.51]>
	cpse	R, R
	rjmp	<main+X>
	movw	R, R
	call	<atof>
	call	<__fixunssfsi>
	movw	R, R
	movw	R, R
	ldi	R, 0x10	;	16
	ldi	R, 0x27	;	39
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<__udivmodsi4>
	sts	<GPS+X>, R
	movw	R, R
	movw	R, R
	call	<__udivmodsi4>
	sts	<GPS+X>, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	call	<__udivmodsi4>
	sts	<GPS+X>, R
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	lds	R, <GPS+X>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	ldi	R, 0x93	;	147
	ldi	R, 0x06	;	6
	ldi	R, 0xAA	;	170
	ldi	R, 0x06	;	6
	call	<strcpy>
	ldi	R, 0x96	;	150
	ldi	R, 0x06	;	6
	ldi	R, 0xAD	;	173
	ldi	R, 0x06	;	6
	call	<strcpy>
	call	<millis>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	rjmp	<main+X>
	ldi	R, 0x2A	;	42
	ldi	R, 0x07	;	7
	movw	R, R
	call	<Adafruit_GPS::tokenOnList(char*, char const**) [clone .constprop.42]>
	sbiw	R, 0x00	;	0
	brne	<main+X>
	rjmp	<main+X>
	movw	R, R
	ldi	R, 0x96	;	150
	ldi	R, 0x06	;	6
	call	<strcpy>
	ldi	R, 0x21	;	33
	ldi	R, 0x00	;	0
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	sts	<tft+X>, R
	sts	<tft+X>, R
	sts	<tft+X>, R
	sts	<tft+X>, R
	lds	R, <loop::cpt>
	ldi	R, 0x00	;	0
	movw	R, R
	subi	R, 0xC5	;	197
	sbci	R, 0xFE	;	254
	ld	R, Z
	std	Y+8, R	;	0x08
	std	Y+7, R	;	0x07
	std	Y+10, R	;	0x0a
	std	Y+9, R	;	0x09
	std	Y+12, R	;	0x0c
	std	Y+11, R	;	0x0b
	std	Y+1, R	;	0x01
	std	Y+2, R	;	0x02
	movw	R, R
	ld	R, Z+
	and	R, R
	brne	<main+X>
	sbiw	R, 0x01	;	1
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	movw	R, R
	adiw	R, 0x07	;	7
	call	<String::copy(char const*, unsigned int)>
	std	Y+2, R	;	0x02
	std	Y+1, R	;	0x01
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	movw	R, R
	subi	R, 0xF9	;	249
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<String::operator=(String const&)>
	ldi	R, 0x0A	;	10
	std	Y+13, R	;	0x0d
	std	Y+14, R	;	0x0e
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	subi	R, 0xF3	;	243
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<String::concat(char const*, unsigned int)>
	cpse	R, R
	rjmp	<main+X>
	movw	R, R
	call	<String::invalidate()>
	movw	R, R
	ldi	R, 0xEE	;	238
	ldi	R, 0x04	;	4
	call	<String::operator=(String const&)>
	movw	R, R
	call	<String::~String()>
	movw	R, R
	adiw	R, 0x07	;	7
	call	<String::~String()>
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	andi	R, 0x03	;	3
	eor	R, R
	sts	<loop::cpt>, R
	lds	R, <GPS+X>
	and	R, R
	brne	<main+X>
	rjmp	<main+X>
	std	Y+8, R	;	0x08
	std	Y+7, R	;	0x07
	std	Y+10, R	;	0x0a
	std	Y+9, R	;	0x09
	std	Y+12, R	;	0x0c
	std	Y+11, R	;	0x0b
	movw	R, R
	adiw	R, 0x07	;	7
	call	<String::String(char const*) [clone .part.2] [clone .constprop.95]>
	std	Y+2, R	;	0x02
	std	Y+1, R	;	0x01
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	movw	R, R
	subi	R, 0xF9	;	249
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<String::operator=(String const&)>
	ldi	R, 0x0A	;	10
	std	Y+13, R	;	0x0d
	std	Y+14, R	;	0x0e
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	subi	R, 0xF3	;	243
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<String::concat(char const*, unsigned int)>
	cpse	R, R
	rjmp	<main+X>
	movw	R, R
	call	<String::invalidate()>
	std	Y+14, R	;	0x0e
	std	Y+13, R	;	0x0d
	std	Y+16, R	;	0x10
	std	Y+15, R	;	0x0f
	std	Y+18, R	;	0x12
	std	Y+17, R	;	0x11
	movw	R, R
	movw	R, R
	adiw	R, 0x0d	;	13
	call	<String::operator=(String const&)>
	movw	R, R
	call	<String::~String()>
	movw	R, R
	adiw	R, 0x07	;	7
	call	<String::~String()>
	ldd	R, Y+17	;	0x11
	ldd	R, Y+18	;	0x12
	ldd	R, Y+13	;	0x0d
	ldd	R, Y+14	;	0x0e
	ldi	R, 0xEE	;	238
	ldi	R, 0x04	;	4
	call	<String::concat(char const*, unsigned int)>
	movw	R, R
	adiw	R, 0x0d	;	13
	call	<String::~String()>
	lds	R, <card+X>
	cpi	R, 0x02	;	2
	brne	<main+X>
	rjmp	<main+X>
	cpi	R, 0x03	;	3
	brne	<main+X>
	rjmp	<main+X>
	cpi	R, 0x01	;	1
	breq	<main+X>
	rjmp	<main+X>
	ldi	R, 0x40	;	64
	ldi	R, 0x02	;	2
	call	<String::concat(char const*) [clone .constprop.54]>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	or	R, R
	brne	<main+X>
	rjmp	<main+X>
	call	<Serial1_available()>
	and	R, R
	brne	<main+X>
	rjmp	<main+X>
	call	0
	rjmp	<main+X>
	ldi	R, 0x2C	;	44
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	sbiw	R, 0x00	;	0
	breq	<main+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	cpi	R, 0x14	;	20
	cpc	R, R
	brlt	<main+X>
	ldi	R, 0x13	;	19
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	ldi	R, 0x96	;	150
	ldi	R, 0x06	;	6
	call	<strncpy>
	movw	R, R
	subi	R, 0x6A	;	106
	sbci	R, 0xF9	;	249
	st	Z, R
	rjmp	<main+X>
	ldi	R, 0x2A	;	42
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strchr>
	sbiw	R, 0x00	;	0
	breq	<main+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	cpi	R, 0x14	;	20
	cpc	R, R
	brlt	<main+X>
	ldi	R, 0x13	;	19
	ldi	R, 0x00	;	0
	rjmp	<main+X>
	movw	R, R
	ld	R, X+
	and	R, R
	brne	<main+X>
	movw	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	sub	R, R
	sbc	R, R
	cpi	R, 0x13	;	19
	cpc	R, R
	brcs	<main+X>
	ldi	R, 0x13	;	19
	ldi	R, 0x00	;	0
	movw	R, R
	ldi	R, 0x96	;	150
	ldi	R, 0x06	;	6
	call	<strncpy>
	rjmp	<main+X>
	sts	<GPS+X>, R
	sts	<GPS+X>, R
	rjmp	<main+X>
	cpi	R, 0x56	;	86
	breq	<main+X>
	rjmp	<main+X>
	sts	<GPS+X>, R
	rjmp	<main+X>
	ldi	R, 0x44	;	68
	ldi	R, 0x02	;	2
	rjmp	<main+X>
	ldi	R, 0x48	;	72
	ldi	R, 0x02	;	2
	rjmp	<main+X>
	ldi	R, 0x4D	;	77
	ldi	R, 0x02	;	2
	rjmp	<main+X>
	or	R, R
	brne	<main+X>
	rjmp	<main+X>
	lds	R, <loop::s>
	lds	R, <loop::s+X>
	sbiw	R, 0x00	;	0
	brne	<main+X>
	sts	<String::operator[](unsigned int)::dummy_writable_char>, R
	ldi	R, 0x68	;	104
	ldi	R, 0x04	;	4
	ld	R, Z
	ldi	R, 0xA9	;	169
	ldi	R, 0x05	;	5
	call	<Adafruit_GFX::write(unsigned char)>
	lds	R, <loop::s+X>
	lds	R, <loop::s+X>
	eor	R, R
	inc	R
	mov	R, R
	cp	R, R
	cpc	R, R
	breq	<main+X>
	movw	R, R
	eor	R, R
	inc	R
	mov	R, R
	std	Y+2, R	;	0x02
	std	Y+1, R	;	0x01
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	movw	R, R
	call	<String::String(char const*) [clone .part.2] [clone .constprop.95]>
	lds	R, <loop::s+X>
	lds	R, <loop::s+X>
	cp	R, R
	cpc	R, R
	brcc	<main+X>
	cp	R, R
	cpc	R, R
	brcc	<main+X>
	movw	R, R
	lds	R, <loop::s>
	lds	R, <loop::s+X>
	add	R, R
	adc	R, R
	ld	R, Z
	st	Z, R
	lds	R, <loop::s>
	lds	R, <loop::s+X>
	add	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	breq	<main+X>
	movw	R, R
	ld	R, Z+
	and	R, R
	brne	<main+X>
	sbiw	R, 0x01	;	1
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	call	<String::copy(char const*, unsigned int)>
	lds	R, <loop::s>
	lds	R, <loop::s+X>
	add	R, R
	adc	R, R
	movw	R, R
	st	X, R
	lds	R, <loop::s>
	lds	R, <loop::s+X>
	sbiw	R, 0x00	;	0
	breq	<main+X>
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	cp	R, R
	cpc	R, R
	breq	<main+X>
	lds	R, <loop::s+X>
	lds	R, <loop::s+X>
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	cp	R, R
	cpc	R, R
	brcs	<main+X>
	call	<strcpy>
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	sts	<loop::s+X>, R
	sts	<loop::s+X>, R
	std	Y+6, R	;	0x06
	std	Y+5, R	;	0x05
	movw	R, R
	call	<String::~String()>
	rjmp	<main+X>
	movw	R, R
	call	<String::invalidate()>
	rjmp	<main+X>
	call	<free>
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	sts	<loop::s+X>, R
	sts	<loop::s>, R
	ldd	R, Y+3	;	0x03
	ldd	R, Y+4	;	0x04
	sts	<loop::s+X>, R
	sts	<loop::s+X>, R
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	sts	<loop::s+X>, R
	sts	<loop::s+X>, R
	std	Y+2, R	;	0x02
	std	Y+1, R	;	0x01
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	rjmp	<main+X>
	ldd	R, Z+1	;	0x01
	cpi	R, 0x30	;	48
	brge	<main+X>
	rjmp	<main+X>
	cpi	R, 0x3A	;	58
	brlt	<main+X>
	rjmp	<main+X>
	subi	R, 0x30	;	48
	ldi	R, 0x10	;	16
	mul	R, R
	movw	R, R
	eor	R, R
	ldd	R, Z+2	;	0x02
	cpi	R, 0x30	;	48
	brge	<main+X>
	rjmp	<main+X>
	cpi	R, 0x3A	;	58
	brlt	<main+X>
	rjmp	<main+X>
	subi	R, 0x30	;	48
	add	R, R
	mov	R, R
	adc	R, R
	movw	R, R
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	movw	R, R
	cp	R, R
	cpc	R, R
	brcs	<main+X>
	rjmp	<main+X>
	ld	R, X+
	mov	R, R
	add	R, R
	sbc	R, R
	eor	R, R
	eor	R, R
	rjmp	<main+X>

malloc:
	push	R
	push	R
	push	R
	push	R
	cpi	R, 0x02	;	2
	cpc	R, R
	brcc	<malloc+X>
	ldi	R, 0x02	;	2
	ldi	R, 0x00	;	0
	lds	R, <__flp>
	lds	R, <__flp+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	sbiw	R, 0x00	;	0
	brne	<malloc+X>
	cp	R, R
	cpc	R, R
	brne	<malloc+X>
	rjmp	<malloc+X>
	sub	R, R
	sbc	R, R
	cpi	R, 0x04	;	4
	cpc	R, R
	brcc	<malloc+X>
	ldd	R, Y+2	;	0x02
	ldd	R, Y+3	;	0x03
	cp	R, R
	cpc	R, R
	breq	<malloc+X>
	movw	R, R
	std	Z+3, R	;	0x03
	std	Z+2, R	;	0x02
	movw	R, R
	rjmp	<malloc+X>
	ld	R, Z
	ldd	R, Z+1	;	0x01
	ldd	R, Z+2	;	0x02
	ldd	R, Z+3	;	0x03
	cp	R, R
	cpc	R, R
	brcs	<malloc+X>
	cp	R, R
	cpc	R, R
	brne	<malloc+X>
	sbiw	R, 0x00	;	0
	breq	<malloc+X>
	adiw	R, 0x02	;	2
	st	X, R
	sbiw	R, 0x02	;	2
	adiw	R, 0x03	;	3
	st	X, R
	adiw	R, 0x02	;	2
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	sts	<__flp>, R
	sts	<__flp+X>, R
	rjmp	<malloc+X>
	cp	R, R
	cpc	R, R
	breq	<malloc+X>
	cp	R, R
	cpc	R, R
	brcs	<malloc+X>
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	rjmp	<malloc+X>
	movw	R, R
	rjmp	<malloc+X>
	sts	<__flp+X>, R
	sts	<__flp>, R
	rjmp	<malloc+X>
	movw	R, R
	add	R, R
	adc	R, R
	st	Z+, R
	st	Z+, R
	subi	R, 0x02	;	2
	sbc	R, R
	std	Y+1, R	;	0x01
	st	Y, R
	rjmp	<malloc+X>
	lds	R, <__brkval>
	lds	R, <__brkval+X>
	or	R, R
	brne	<malloc+X>
	lds	R, <__malloc_heap_start>
	lds	R, <__malloc_heap_start+X>
	sts	<__brkval+X>, R
	sts	<__brkval>, R
	lds	R, <__malloc_heap_end>
	lds	R, <__malloc_heap_end+X>
	cp	R, R
	cpc	R, R
	brne	<malloc+X>
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	lds	R, <__malloc_margin>
	lds	R, <__malloc_margin+X>
	sub	R, R
	sbc	R, R
	lds	R, <__brkval>
	lds	R, <__brkval+X>
	cp	R, R
	cpc	R, R
	brcc	<malloc+X>
	sub	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	brcs	<malloc+X>
	movw	R, R
	subi	R, 0xFE	;	254
	sbci	R, 0xFF	;	255
	cp	R, R
	cpc	R, R
	brcs	<malloc+X>
	add	R, R
	adc	R, R
	sts	<__brkval+X>, R
	sts	<__brkval>, R
	st	Z+, R
	st	Z+, R
	rjmp	<malloc+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	rjmp	<malloc+X>

memcpy:
	movw	R, R
	movw	R, R
	rjmp	<memcpy+X>
	ld	R, Z+
	st	X+, R
	subi	R, 0x01	;	1
	sbci	R, 0x00	;	0
	brcc	<memcpy+X>
	ret

micros:
	in	R, 0x3f	;	63
	cli
	lds	R, <timer0_overflow_count>
	lds	R, <timer0_overflow_count+X>
	lds	R, <timer0_overflow_count+X>
	lds	R, <timer0_overflow_count+X>
	in	R, 0x26	;	38
	sbis	0x15, 0	;	21
	rjmp	<micros+X>
	cpi	R, 0xFF	;	255
	breq	<micros+X>
	adiw	R, 0x01	;	1
	adc	R, R
	adc	R, R
	out	0x3f, R	;	63
	mov	R, R
	mov	R, R
	mov	R, R
	eor	R, R
	movw	R, R
	movw	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	ldi	R, 0x03	;	3
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	dec	R
	brne	<micros+X>
	ret

millis:
	in	R, 0x3f	;	63
	cli
	lds	R, <timer0_millis>
	lds	R, <timer0_millis+X>
	lds	R, <timer0_millis+X>
	lds	R, <timer0_millis+X>
	out	0x3f, R	;	63
	ret

pinMode:
	push	R
	push	R
	ldi	R, 0x00	;	0
	movw	R, R
	subi	R, 0x0B	;	11
	sbci	R, 0xF9	;	249
	lpm	R, Z
	subi	R, 0xDE	;	222
	sbci	R, 0xF8	;	248
	movw	R, R
	lpm	R, Z
	and	R, R
	breq	<pinMode+X>
	ldi	R, 0x00	;	0
	add	R, R
	adc	R, R
	movw	R, R
	subi	R, 0x19	;	25
	sbci	R, 0xF9	;	249
	lpm	R, Z+
	lpm	R, Z
	movw	R, R
	subi	R, 0xEC	;	236
	sbci	R, 0xF8	;	248
	lpm	R, Z+
	lpm	R, Z
	cpse	R, R
	rjmp	<pinMode+X>
	in	R, 0x3f	;	63
	cli
	ld	R, X
	mov	R, R
	com	R
	and	R, R
	st	X, R
	ld	R, Y
	and	R, R
	st	Y, R
	out	0x3f, R	;	63
	pop	R
	pop	R
	ret
	in	R, 0x3f	;	63
	cli
	ld	R, X
	or	R, R
	st	X, R
	out	0x3f, R	;	63
	rjmp	<pinMode+X>

PluggableUSB():
	lds	R, <guard variable for PluggableUSB()::obj>
	cpse	R, R
	rjmp	<PluggableUSB()+X>
	ldi	R, 0x02	;	2
	sts	<PluggableUSB()::obj>, R
	ldi	R, 0x04	;	4
	sts	<PluggableUSB()::obj+X>, R
	sts	<PluggableUSB()::obj+X>, R
	sts	<PluggableUSB()::obj+X>, R
	ldi	R, 0x01	;	1
	sts	<guard variable for PluggableUSB()::obj>, R
	ldi	R, 0x7B	;	123
	ldi	R, 0x04	;	4
	ret

port_to_mode_PGM:
00 00 00 00 24 00 27 00 2a 00 2d 00 30 00           ....$.'.*.-.0.

port_to_output_PGM:
00 00 00 00 25 00 28 00 2b 00 2e 00 31 00           ....%.(.+...1.

Print::availableForWrite():
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ret

Print::flush():
	ret

Print::println(char const*) [clone .constprop.77]:
	push	R
	push	R
	movw	R, R
	ldi	R, 0x8D	;	141
	ldi	R, 0x06	;	6
	call	<Print::write(char const*) [clone .part.2]>
	movw	R, R
	ldi	R, 0xA3	;	163
	ldi	R, 0x01	;	1
	ldi	R, 0x8D	;	141
	ldi	R, 0x06	;	6
	call	<Print::write(char const*) [clone .part.2]>
	add	R, R
	adc	R, R
	pop	R
	pop	R
	ret

Print::write(char const*) [clone .part.2]:
	movw	R, R
	ld	R, Z+
	and	R, R
	brne	<Print::write(char const*) [clone .part.2]+X>
	sbiw	R, 0x01	;	1
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+2	;	0x02
	ldd	R, Z+3	;	0x03
	mov	R, R
	ijmp

Print::write(unsigned char const*, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	movw	R, R
	sub	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	breq	<Print::write(unsigned char const*, unsigned int)+X>
	ld	R, Y+
	movw	R, R
	ld	R, X+
	ld	R, X
	ld	R, Z+
	ld	R, Z
	mov	R, R
	movw	R, R
	icall
	or	R, R
	brne	<Print::write(unsigned char const*, unsigned int)+X>
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

pstr_inf:
49 4e 46                                            INF

pstr_inity:
49 4e 49 54 59                                      INITY

pwr_m10:
cd cc cc 3d 0a d7 23 3c 17 b7 d1 38 77 cc 2b 32     ...=..#<...8w.+2
95 95 e6 24 1f b1 4f 0a                             ...$..O.

pwr_p10:
00 00 20 41 00 00 c8 42 00 40 1c 46 20 bc be 4c     .. A...B.@.F ..L
ca 1b 0e 5a ae c5 9d 74                             ...Z...t

Rcmd1:
0f 01 80 96 11 80 ff b1 03 01 2c 2d b2 03 01 2c     ..........,-...,
2d b3 06 01 2c 2d 01 2c 2d b4 01 07 c0 03 a2 02     -...,-.,-.......
84 c1 01 c5 c2 02 0a 00 c3 02 8a 2a c4 02 8a ee     ...........*....
c5 01 0e 20 00 36 01 c8 3a 01 05                    ... .6..:..

Rcmd2red:
02 2a 04 00 00 00 7f 2b 04 00 00 00 9f              .*.....+.....

Rcmd3:
04 e0 10 02 1c 07 12 37 32 29 2d 29 25 2b 39 00     .......72)-)%+9.
01 03 10 e1 10 03 1d 07 06 2e 2c 29 2d 2e 2e 37     ..........,)-..7
3f 00 00 02 10 13 80 0a 29 80 64                    ?.......).d

realloc:
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x45	;	69
	ldi	R, 0x36	;	54
	jmp	<__prologue_saves__+X>
	movw	R, R
	sbiw	R, 0x00	;	0
	brne	<realloc+X>
	movw	R, R
	call	<malloc>
	movw	R, R
	movw	R, R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	ldi	R, 0x10	;	16
	jmp	<__epilogue_restores__+X>
	movw	R, R
	add	R, R
	adc	R, R
	movw	R, R
	subi	R, 0x02	;	2
	sbc	R, R
	cp	R, R
	cpc	R, R
	brcc	<realloc+X>
	rjmp	<realloc+X>
	movw	R, R
	ld	R, X+
	ld	R, X
	sbiw	R, 0x01	;	1
	cp	R, R
	cpc	R, R
	brcs	<realloc+X>
	cpi	R, 0x05	;	5
	cpc	R, R
	brcs	<realloc+X>
	movw	R, R
	sbiw	R, 0x04	;	4
	cp	R, R
	cpc	R, R
	brcs	<realloc+X>
	sub	R, R
	sbc	R, R
	sbiw	R, 0x02	;	2
	st	Z+, R
	st	Z+, R
	st	X+, R
	st	X, R
	movw	R, R
	call	<free>
	rjmp	<realloc+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	add	R, R
	adc	R, R
	lds	R, <__flp>
	lds	R, <__flp+X>
	mov	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	sbiw	R, 0x00	;	0
	brne	<realloc+X>
	lds	R, <__brkval>
	lds	R, <__brkval+X>
	cp	R, R
	cpc	R, R
	breq	<realloc+X>
	rjmp	<realloc+X>
	cp	R, R
	cpc	R, R
	brcs	<realloc+X>
	rjmp	<realloc+X>
	lds	R, <__malloc_heap_end>
	lds	R, <__malloc_heap_end+X>
	sbiw	R, 0x00	;	0
	brne	<realloc+X>
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	lds	R, <__malloc_margin>
	lds	R, <__malloc_margin+X>
	sub	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	brcs	<realloc+X>
	rjmp	<realloc+X>
	sts	<__brkval+X>, R
	sts	<__brkval>, R
	movw	R, R
	std	Z+1, R	;	0x01
	st	Z, R
	rjmp	<realloc+X>
	ld	R, X+
	ld	R, X
	sbiw	R, 0x01	;	1
	adiw	R, 0x02	;	2
	ld	R, X
	sbiw	R, 0x02	;	2
	adiw	R, 0x03	;	3
	ld	R, X
	sbiw	R, 0x03	;	3
	cp	R, R
	cpc	R, R
	brne	<realloc+X>
	movw	R, R
	ldi	R, 0x02	;	2
	add	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	brcs	<realloc+X>
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	adiw	R, 0x02	;	2
	sbiw	R, 0x05	;	5
	brcs	<realloc+X>
	std	Z+2, R	;	0x02
	std	Z+3, R	;	0x03
	std	Z+1, R	;	0x01
	st	Z, R
	movw	R, R
	st	X+, R
	st	X, R
	cp	R, R
	cpc	R, R
	breq	<realloc+X>
	movw	R, R
	adiw	R, 0x03	;	3
	st	X, R
	st	-X, R
	sbiw	R, 0x02	;	2
	rjmp	<realloc+X>
	adiw	R, 0x02	;	2
	add	R, R
	adc	R, R
	movw	R, R
	std	Z+1, R	;	0x01
	st	Z, R
	movw	R, R
	rjmp	<realloc+X>
	sts	<__flp+X>, R
	sts	<__flp>, R
	rjmp	<realloc+X>
	cp	R, R
	cpc	R, R
	brcc	<realloc+X>
	movw	R, R
	movw	R, R
	movw	R, R
	rjmp	<realloc+X>
	movw	R, R
	call	<malloc>
	movw	R, R
	sbiw	R, 0x00	;	0
	breq	<realloc+X>
	movw	R, R
	movw	R, R
	call	<memcpy>
	movw	R, R
	call	<free>
	movw	R, R
	rjmp	<realloc+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	rjmp	<realloc+X>

Sd2Card::cardCommand(unsigned char, unsigned long):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	mov	R, R
	movw	R, R
	movw	R, R
	ldd	R, Y+6	;	0x06
	and	R, R
	breq	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	std	Y+8, R	;	0x08
	std	Y+7, R	;	0x07
	cpi	R, 0x02	;	2
	sbci	R, 0x02	;	2
	brcc	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	call	<spiRec()>
	rjmp	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	movw	R, R
	call	<Sd2Card::chipSelectHigh()>
	std	Y+6, R	;	0x06
	movw	R, R
	call	<Sd2Card::chipSelectLow()>
	ldi	R, 0x2C	;	44
	ldi	R, 0x01	;	1
	call	<Sd2Card::waitNotBusy(unsigned int) [clone .constprop.72]>
	mov	R, R
	ori	R, 0x40	;	64
	call	<SPIClass::transfer(unsigned char)>
	ldi	R, 0x18	;	24
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	mov	R, R
	rjmp	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	lsr	R
	ror	R
	ror	R
	ror	R
	dec	R
	brpl	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	call	<SPIClass::transfer(unsigned char)>
	subi	R, 0x08	;	8
	sbc	R, R
	cpi	R, 0xF8	;	248
	ldi	R, 0xFF	;	255
	cpc	R, R
	brne	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	ldi	R, 0x95	;	149
	and	R, R
	breq	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	ldi	R, 0x08	;	8
	ldi	R, 0x87	;	135
	cpse	R, R
	ldi	R, 0xFF	;	255
	call	<SPIClass::transfer(unsigned char)>
	ldi	R, 0x00	;	0
	call	<spiRec()>
	std	Y+10, R	;	0x0a
	sbrs	R, 7
	rjmp	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	cpi	R, 0xFF	;	255
	breq	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	subi	R, 0xFF	;	255
	rjmp	<Sd2Card::cardCommand(unsigned char, unsigned long)+X>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Sd2Card::chipSelectHigh():
	ldi	R, 0x01	;	1
	movw	R, R
	ldd	R, Z+4	;	0x04
	call	<digitalWrite>
	lds	R, <__data_end>
	cpse	R, R
	sts	<__data_end>, R
	ret

Sd2Card::chipSelectLow():
	push	R
	push	R
	movw	R, R
	lds	R, <__data_end>
	cpse	R, R
	rjmp	<Sd2Card::chipSelectLow()+X>
	ldi	R, 0x01	;	1
	sts	<__data_end>, R
	lds	R, <settings>
	lds	R, <settings+X>
	call	<SPIClass::beginTransaction(SPISettings)>
	ldi	R, 0x00	;	0
	ldd	R, Y+4	;	0x04
	pop	R
	pop	R
	jmp	<digitalWrite>

Sd2Card::waitNotBusy(unsigned int) [clone .constprop.72]:
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	call	<millis>
	movw	R, R
	call	<spiRec()>
	cpi	R, 0xFF	;	255
	breq	<Sd2Card::waitNotBusy(unsigned int) [clone .constprop.72]+X>
	call	<millis>
	sub	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	brcs	<Sd2Card::waitNotBusy(unsigned int) [clone .constprop.72]+X>
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ldi	R, 0x01	;	1
	rjmp	<Sd2Card::waitNotBusy(unsigned int) [clone .constprop.72]+X>

Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	ldi	R, 0x12	;	18
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	breq	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	ldd	R, Y+11	;	0x0b
	cpi	R, 0x03	;	3
	breq	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	ldi	R, 0x09	;	9
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	dec	R
	brne	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	movw	R, R
	movw	R, R
	ldi	R, 0x18	;	24
	movw	R, R
	call	<Sd2Card::cardCommand(unsigned char, unsigned long)>
	and	R, R
	breq	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	ldi	R, 0x04	;	4
	std	Y+5, R	;	0x05
	rjmp	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	ldi	R, 0xFE	;	254
	call	<SPIClass::transfer(unsigned char)>
	movw	R, R
	ldi	R, 0xFE	;	254
	sub	R, R
	movw	R, R
	ld	R, Z+
	movw	R, R
	call	<SPIClass::transfer(unsigned char)>
	cp	R, R
	cpc	R, R
	brne	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	ldi	R, 0xFF	;	255
	call	<SPIClass::transfer(unsigned char)>
	ldi	R, 0xFF	;	255
	call	<SPIClass::transfer(unsigned char)>
	call	<spiRec()>
	std	Y+10, R	;	0x0a
	andi	R, 0x1F	;	31
	cpi	R, 0x05	;	5
	brne	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	cpse	R, R
	rjmp	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	movw	R, R
	call	<Sd2Card::chipSelectHigh()>
	ldi	R, 0x01	;	1
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ldi	R, 0x11	;	17
	std	Y+5, R	;	0x05
	movw	R, R
	call	<Sd2Card::chipSelectHigh()>
	movw	R, R
	call	<Sd2Card::chipSelectHigh()>
	ldi	R, 0x00	;	0
	rjmp	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	ldi	R, 0x58	;	88
	ldi	R, 0x02	;	2
	call	<Sd2Card::waitNotBusy(unsigned int) [clone .constprop.72]>
	cpse	R, R
	rjmp	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	ldi	R, 0x15	;	21
	rjmp	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	ldi	R, 0x0D	;	13
	movw	R, R
	call	<Sd2Card::cardCommand(unsigned char, unsigned long)>
	and	R, R
	breq	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	ldi	R, 0x14	;	20
	rjmp	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	call	<spiRec()>
	cpse	R, R
	rjmp	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>
	rjmp	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)+X>

SdFile::addCluster():
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	sbiw	R, 0x0c	;	12
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	movw	R, R
	movw	R, R
	adiw	R, 0x1b	;	27
	ld	R, X+
	ld	R, X
	sbiw	R, 0x1c	;	28
	adiw	R, 0x06	;	6
	ld	R, X+
	ld	R, X+
	ld	R, X+
	ld	R, X
	sbiw	R, 0x09	;	9
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdFile::addCluster()+X>
	rjmp	<SdFile::addCluster()+X>
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	mov	R, R
	movw	R, R
	ldd	R, Z+9	;	0x09
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	ldd	R, Z+12	;	0x0c
	movw	R, R
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	std	Y+9, R	;	0x09
	std	Y+10, R	;	0x0a
	std	Y+11, R	;	0x0b
	std	Y+12, R	;	0x0c
	movw	R, R
	movw	R, R
	std	Y+5, R	;	0x05
	std	Y+6, R	;	0x06
	std	Y+7, R	;	0x07
	std	Y+8, R	;	0x08
	movw	R, R
	ldd	R, Z+9	;	0x09
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	ldd	R, Z+12	;	0x0c
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<SdFile::addCluster()+X>
	rjmp	<SdFile::addCluster()+X>
	ldd	R, Y+9	;	0x09
	ldd	R, Y+10	;	0x0a
	ldd	R, Y+11	;	0x0b
	ldd	R, Y+12	;	0x0c
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcc	<SdFile::addCluster()+X>
	ldi	R, 0x02	;	2
	mov	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	ldi	R, 0x02	;	2
	mov	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	movw	R, R
	movw	R, R
	call	<SdVolume::fatGet(unsigned long, unsigned long*) const>
	and	R, R
	breq	<SdFile::addCluster()+X>
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	ldd	R, Y+3	;	0x03
	ldd	R, Y+4	;	0x04
	or	R, R
	or	R, R
	or	R, R
	breq	<SdFile::addCluster()+X>
	movw	R, R
	movw	R, R
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	std	Y+5, R	;	0x05
	std	Y+6, R	;	0x06
	std	Y+7, R	;	0x07
	std	Y+8, R	;	0x08
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	rjmp	<SdFile::addCluster()+X>
	movw	R, R
	ld	R, Z
	ldd	R, Z+1	;	0x01
	ldd	R, Z+2	;	0x02
	ldd	R, Z+3	;	0x03
	eor	R, R
	inc	R
	rjmp	<SdFile::addCluster()+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdFile::addCluster()+X>
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	ldi	R, 0x0F	;	15
	movw	R, R
	movw	R, R
	movw	R, R
	call	<SdVolume::fatPut(unsigned long, unsigned long)>
	cpse	R, R
	rjmp	<SdFile::addCluster()+X>
	ldi	R, 0x00	;	0
	adiw	R, 0x0c	;	12
	in	R, 0x3f	;	63
	cli
	out	0x3e, R	;	62
	out	0x3f, R	;	63
	out	0x3d, R	;	61
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	movw	R, R
	adiw	R, 0x06	;	6
	ld	R, X+
	ld	R, X+
	ld	R, X+
	ld	R, X
	sbiw	R, 0x09	;	9
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	breq	<SdFile::addCluster()+X>
	movw	R, R
	movw	R, R
	movw	R, R
	call	<SdVolume::fatPut(unsigned long, unsigned long)>
	and	R, R
	breq	<SdFile::addCluster()+X>
	movw	R, R
	adiw	R, 0x06	;	6
	st	X+, R
	st	X+, R
	st	X+, R
	st	X, R
	sbiw	R, 0x09	;	9
	and	R, R
	breq	<SdFile::addCluster()+X>
	movw	R, R
	movw	R, R
	adiw	R, 0x01	;	1
	adc	R, R
	adc	R, R
	movw	R, R
	st	Z, R
	std	Z+1, R	;	0x01
	std	Z+2, R	;	0x02
	std	Z+3, R	;	0x03
	movw	R, R
	ldd	R, Z+23	;	0x17
	ldd	R, Z+24	;	0x18
	ldd	R, Z+25	;	0x19
	ldd	R, Z+26	;	0x1a
	or	R, R
	or	R, R
	or	R, R
	brne	<SdFile::addCluster()+X>
	ldd	R, Z+4	;	0x04
	std	Z+23, R	;	0x17
	std	Z+24, R	;	0x18
	std	Z+25, R	;	0x19
	std	Z+26, R	;	0x1a
	ori	R, 0x80	;	128
	std	Z+4, R	;	0x04
	movw	R, R
	ldd	R, Z+4	;	0x04
	ori	R, 0x20	;	32
	std	Z+4, R	;	0x04
	ldi	R, 0x01	;	1
	rjmp	<SdFile::addCluster()+X>

SdFile::availableForWrite():
	push	R
	push	R
	push	R
	movw	R, R
	ldd	R, Y+5	;	0x05
	cpi	R, 0x01	;	1
	breq	<SdFile::availableForWrite()+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	ret
	ldd	R, Y+4	;	0x04
	sbrs	R, 1
	rjmp	<SdFile::availableForWrite()+X>
	sbrc	R, 2
	rjmp	<SdFile::availableForWrite()+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Sd2Card::chipSelectLow()>
	call	<spiRec()>
	mov	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Sd2Card::chipSelectHigh()>
	cpi	R, 0xFF	;	255
	brne	<SdFile::availableForWrite()+X>
	ldd	R, Y+4	;	0x04
	sbrs	R, 5
	rjmp	<SdFile::availableForWrite()+X>
	ldd	R, Y+5	;	0x05
	and	R, R
	breq	<SdFile::availableForWrite()+X>
	ldi	R, 0x00	;	0
	movw	R, R
	call	<SdFile::sync(unsigned char) [clone .part.23]>
	ldd	R, Y+4	;	0x04
	andi	R, 0xDF	;	223
	std	Y+4, R	;	0x04
	rjmp	<SdFile::availableForWrite()+X>
	ldd	R, Y+19	;	0x13
	ldd	R, Y+20	;	0x14
	ldd	R, Y+21	;	0x15
	ldd	R, Y+22	;	0x16
	ldd	R, Y+10	;	0x0a
	ldd	R, Y+11	;	0x0b
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	breq	<SdFile::availableForWrite()+X>
	movw	R, R
	call	<SdFile::seekSet(unsigned long)>
	cpse	R, R
	rjmp	<SdFile::availableForWrite()+X>
	rjmp	<SdFile::availableForWrite()+X>
	lds	R, <SdVolume::cacheMirrorBlock_>
	lds	R, <SdVolume::cacheMirrorBlock_+X>
	lds	R, <SdVolume::cacheMirrorBlock_+X>
	lds	R, <SdVolume::cacheMirrorBlock_+X>
	or	R, R
	or	R, R
	or	R, R
	breq	<SdFile::availableForWrite()+X>
	ldi	R, 0x00	;	0
	call	<SdVolume::cacheMirrorBlockFlush(unsigned char)>
	rjmp	<SdFile::availableForWrite()+X>
	ori	R, 0x10	;	16
	std	Y+4, R	;	0x04
	ldd	R, Y+10	;	0x0a
	ldd	R, Y+11	;	0x0b
	andi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	ldi	R, 0x02	;	2
	sub	R, R
	sbc	R, R
	rjmp	<SdFile::availableForWrite()+X>

SdFile::seekSet(unsigned long):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	ldd	R, Y+5	;	0x05
	cpse	R, R
	rjmp	<SdFile::seekSet(unsigned long)+X>
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ldd	R, Y+19	;	0x13
	ldd	R, Y+20	;	0x14
	ldd	R, Y+21	;	0x15
	ldd	R, Y+22	;	0x16
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<SdFile::seekSet(unsigned long)+X>
	movw	R, R
	movw	R, R
	cpi	R, 0x02	;	2
	brne	<SdFile::seekSet(unsigned long)+X>
	std	Y+10, R	;	0x0a
	std	Y+11, R	;	0x0b
	std	Y+12, R	;	0x0c
	std	Y+13, R	;	0x0d
	ldi	R, 0x01	;	1
	rjmp	<SdFile::seekSet(unsigned long)+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdFile::seekSet(unsigned long)+X>
	std	Y+6, R	;	0x06
	std	Y+7, R	;	0x07
	std	Y+8, R	;	0x08
	std	Y+9, R	;	0x09
	std	Y+10, R	;	0x0a
	std	Y+11, R	;	0x0b
	std	Y+12, R	;	0x0c
	std	Y+13, R	;	0x0d
	rjmp	<SdFile::seekSet(unsigned long)+X>
	ldd	R, Y+10	;	0x0a
	ldd	R, Y+11	;	0x0b
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	ldd	R, Y+27	;	0x1b
	ldd	R, Y+28	;	0x1c
	ldd	R, Z+13	;	0x0d
	ldi	R, 0x00	;	0
	adiw	R, 0x09	;	9
	movw	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbc	R, R
	sbc	R, R
	sbc	R, R
	mov	R, R
	rjmp	<SdFile::seekSet(unsigned long)+X>
	lsr	R
	ror	R
	ror	R
	ror	R
	dec	R
	brpl	<SdFile::seekSet(unsigned long)+X>
	movw	R, R
	movw	R, R
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	rjmp	<SdFile::seekSet(unsigned long)+X>
	lsr	R
	ror	R
	ror	R
	ror	R
	dec	R
	brpl	<SdFile::seekSet(unsigned long)+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<SdFile::seekSet(unsigned long)+X>
	or	R, R
	or	R, R
	or	R, R
	brne	<SdFile::seekSet(unsigned long)+X>
	ldd	R, Y+23	;	0x17
	ldd	R, Y+24	;	0x18
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	std	Y+6, R	;	0x06
	std	Y+7, R	;	0x07
	std	Y+8, R	;	0x08
	std	Y+9, R	;	0x09
	movw	R, R
	subi	R, 0xFA	;	250
	sbci	R, 0xFF	;	255
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdFile::seekSet(unsigned long)+X>
	rjmp	<SdFile::seekSet(unsigned long)+X>
	ldd	R, Y+6	;	0x06
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	ldd	R, Y+9	;	0x09
	movw	R, R
	ldd	R, Y+27	;	0x1b
	ldd	R, Y+28	;	0x1c
	call	<SdVolume::fatGet(unsigned long, unsigned long*) const>
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	cpse	R, R
	rjmp	<SdFile::seekSet(unsigned long)+X>
	rjmp	<SdFile::seekSet(unsigned long)+X>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	rjmp	<SdFile::seekSet(unsigned long)+X>

SdFile::sync(unsigned char) [clone .part.23]:
	push	R
	push	R
	push	R
	movw	R, R
	mov	R, R
	ldd	R, Y+4	;	0x04
	sbrs	R, 7
	rjmp	<SdFile::sync(unsigned char) [clone .part.23]+X>
	ldd	R, Y+14	;	0x0e
	ldd	R, Y+15	;	0x0f
	ldd	R, Y+16	;	0x10
	ldd	R, Y+17	;	0x11
	ldi	R, 0x01	;	1
	call	<SdVolume::cacheRawBlock(unsigned long, unsigned char)>
	and	R, R
	breq	<SdFile::sync(unsigned char) [clone .part.23]+X>
	ldd	R, Y+18	;	0x12
	ldi	R, 0x20	;	32
	mul	R, R
	movw	R, R
	eor	R, R
	subi	R, 0xA4	;	164
	sbci	R, 0xFD	;	253
	sbiw	R, 0x00	;	0
	breq	<SdFile::sync(unsigned char) [clone .part.23]+X>
	ldd	R, Y+5	;	0x05
	cpi	R, 0x02	;	2
	brcc	<SdFile::sync(unsigned char) [clone .part.23]+X>
	ldd	R, Y+19	;	0x13
	ldd	R, Y+20	;	0x14
	ldd	R, Y+21	;	0x15
	ldd	R, Y+22	;	0x16
	std	Z+28, R	;	0x1c
	std	Z+29, R	;	0x1d
	std	Z+30, R	;	0x1e
	std	Z+31, R	;	0x1f
	ldd	R, Y+23	;	0x17
	ldd	R, Y+24	;	0x18
	std	Z+27, R	;	0x1b
	std	Z+26, R	;	0x1a
	ldd	R, Y+23	;	0x17
	ldd	R, Y+24	;	0x18
	ldd	R, Y+25	;	0x19
	ldd	R, Y+26	;	0x1a
	std	Z+21, R	;	0x15
	std	Z+20, R	;	0x14
	ldd	R, Y+4	;	0x04
	andi	R, 0x7F	;	127
	std	Y+4, R	;	0x04
	cpse	R, R
	rjmp	<SdFile::sync(unsigned char) [clone .part.23]+X>
	ldd	R, Y+4	;	0x04
	andi	R, 0xEF	;	239
	std	Y+4, R	;	0x04
	mov	R, R
	pop	R
	pop	R
	pop	R
	jmp	<SdVolume::cacheFlush(unsigned char)>
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	ret

SdFile::write(unsigned char):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	rcall	<SdFile::write(unsigned char)+X>
	rcall	<SdFile::write(unsigned char)+X>
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	movw	R, R
	std	Y+5, R	;	0x05
	movw	R, R
	adiw	R, 0x05	;	5
	ld	R, X
	sbiw	R, 0x05	;	5
	cpi	R, 0x01	;	1
	breq	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	adiw	R, 0x04	;	4
	ld	R, X
	sbrs	R, 1
	rjmp	<SdFile::write(unsigned char)+X>
	sbrc	R, 2
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	adiw	R, 0x1b	;	27
	ld	R, X+
	ld	R, X
	sbiw	R, 0x1c	;	28
	adiw	R, 0x0a	;	10
	ld	R, X+
	ld	R, X+
	ld	R, X+
	ld	R, X
	sbiw	R, 0x0d	;	13
	ldd	R, Z+4	;	0x04
	dec	R
	movw	R, R
	movw	R, R
	ldi	R, 0x09	;	9
	lsr	R
	ror	R
	ror	R
	ror	R
	dec	R
	brne	<SdFile::write(unsigned char)+X>
	and	R, R
	ldi	R, 0x01	;	1
	and	R, R
	and	R, R
	brne	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	adiw	R, 0x1b	;	27
	ld	R, X+
	ld	R, X
	sbiw	R, 0x1c	;	28
	adiw	R, 0x06	;	6
	ld	R, X+
	ld	R, X+
	ld	R, X+
	ld	R, X
	sbiw	R, 0x09	;	9
	ldi	R, 0x02	;	2
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	ldd	R, Z+13	;	0x0d
	rjmp	<SdFile::write(unsigned char)+X>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	dec	R
	brpl	<SdFile::write(unsigned char)+X>
	ldd	R, Z+14	;	0x0e
	ldd	R, Z+15	;	0x0f
	ldd	R, Z+16	;	0x10
	ldd	R, Z+17	;	0x11
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	breq	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	ldd	R, Z+12	;	0x0c
	ldd	R, Z+13	;	0x0d
	ldd	R, Z+19	;	0x13
	ldd	R, Z+20	;	0x14
	ldd	R, Z+21	;	0x15
	ldd	R, Z+22	;	0x16
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcc	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	ldi	R, 0x01	;	1
	call	<SdVolume::cacheFlush(unsigned char)>
	and	R, R
	brne	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	sts	<__data_start>, R
	sts	<__data_start+X>, R
	sts	<__data_start+X>, R
	sts	<__data_start+X>, R
	lds	R, <SdVolume::cacheDirty_>
	ori	R, 0x01	;	1
	sts	<SdVolume::cacheDirty_>, R
	movw	R, R
	subi	R, 0xA4	;	164
	sbci	R, 0xFD	;	253
	ldd	R, Y+5	;	0x05
	st	Z, R
	movw	R, R
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	ldd	R, Z+12	;	0x0c
	ldd	R, Z+13	;	0x0d
	adiw	R, 0x01	;	1
	adc	R, R
	adc	R, R
	std	Z+10, R	;	0x0a
	std	Z+11, R	;	0x0b
	std	Z+12, R	;	0x0c
	std	Z+13, R	;	0x0d
	ldd	R, Z+19	;	0x13
	ldd	R, Z+20	;	0x14
	ldd	R, Z+21	;	0x15
	ldd	R, Z+22	;	0x16
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcc	<SdFile::write(unsigned char)+X>
	ldd	R, Z+4	;	0x04
	std	Z+19, R	;	0x13
	std	Z+20, R	;	0x14
	std	Z+21, R	;	0x15
	std	Z+22, R	;	0x16
	ori	R, 0x80	;	128
	std	Z+4, R	;	0x04
	movw	R, R
	adiw	R, 0x04	;	4
	ld	R, X
	sbrc	R, 3
	rjmp	<SdFile::write(unsigned char)+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	movw	R, R
	ldd	R, Z+19	;	0x13
	ldd	R, Z+20	;	0x14
	ldd	R, Z+21	;	0x15
	ldd	R, Z+22	;	0x16
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	ldd	R, Z+12	;	0x0c
	ldd	R, Z+13	;	0x0d
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	call	<SdFile::seekSet(unsigned long)>
	cpse	R, R
	rjmp	<SdFile::write(unsigned char)+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	adiw	R, 0x03	;	3
	st	X, R
	st	-X, R
	sbiw	R, 0x02	;	2
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	adiw	R, 0x06	;	6
	ld	R, X+
	ld	R, X+
	ld	R, X+
	ld	R, X
	sbiw	R, 0x09	;	9
	cp	R, R
	cpc	R, R
	breq	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdFile::write(unsigned char)+X>
	adiw	R, 0x17	;	23
	ld	R, X+
	ld	R, X+
	ld	R, X+
	ld	R, X
	mov	R, R
	sbiw	R, 0x00	;	0
	cpc	R, R
	cpc	R, R
	breq	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	call	<SdFile::addCluster()>
	and	R, R
	breq	<SdFile::write(unsigned char)+X>
	movw	R, R
	adiw	R, 0x1b	;	27
	ld	R, X+
	ld	R, X
	sbiw	R, 0x1c	;	28
	adiw	R, 0x06	;	6
	ld	R, X+
	ld	R, X+
	ld	R, X+
	ld	R, X
	sbiw	R, 0x09	;	9
	ldi	R, 0x02	;	2
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	ldd	R, Z+13	;	0x0d
	rjmp	<SdFile::write(unsigned char)+X>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	dec	R
	brpl	<SdFile::write(unsigned char)+X>
	ldd	R, Z+14	;	0x0e
	ldd	R, Z+15	;	0x0f
	ldd	R, Z+16	;	0x10
	ldd	R, Z+17	;	0x11
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	call	<SdVolume::fatGet(unsigned long, unsigned long*) const>
	cpse	R, R
	rjmp	<SdFile::write(unsigned char)+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	rjmp	<SdFile::write(unsigned char)+X>
	ldd	R, Y+1	;	0x01
	ldd	R, Y+2	;	0x02
	ldd	R, Y+3	;	0x03
	ldd	R, Y+4	;	0x04
	movw	R, R
	ldd	R, Z+27	;	0x1b
	ldd	R, Z+28	;	0x1c
	movw	R, R
	ldd	R, Z+23	;	0x17
	ldi	R, 0xF8	;	248
	ldi	R, 0xFF	;	255
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	cpi	R, 0x10	;	16
	breq	<SdFile::write(unsigned char)+X>
	ldi	R, 0xF8	;	248
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	ldi	R, 0x0F	;	15
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<SdFile::write(unsigned char)+X>
	movw	R, R
	call	<SdFile::addCluster()>
	cpse	R, R
	rjmp	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	std	Z+6, R	;	0x06
	std	Z+7, R	;	0x07
	std	Z+8, R	;	0x08
	std	Z+9, R	;	0x09
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	ldd	R, Z+5	;	0x05
	and	R, R
	brne	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	ldi	R, 0x01	;	1
	movw	R, R
	call	<SdFile::sync(unsigned char) [clone .part.23]>
	cpse	R, R
	rjmp	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>
	movw	R, R
	movw	R, R
	ldi	R, 0x02	;	2
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	ldd	R, Z+13	;	0x0d
	rjmp	<SdFile::write(unsigned char)+X>
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	dec	R
	brpl	<SdFile::write(unsigned char)+X>
	ldd	R, Z+14	;	0x0e
	ldd	R, Z+15	;	0x0f
	ldd	R, Z+16	;	0x10
	ldd	R, Z+17	;	0x11
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	ldi	R, 0x01	;	1
	movw	R, R
	movw	R, R
	call	<SdVolume::cacheRawBlock(unsigned long, unsigned char)>
	cpse	R, R
	rjmp	<SdFile::write(unsigned char)+X>
	rjmp	<SdFile::write(unsigned char)+X>

SdVolume::cacheFlush(unsigned char):
	push	R
	push	R
	mov	R, R
	lds	R, <SdVolume::cacheDirty_>
	cpse	R, R
	rjmp	<SdVolume::cacheFlush(unsigned char)+X>
	ldi	R, 0x01	;	1
	mov	R, R
	pop	R
	pop	R
	ret
	lds	R, <__data_start>
	lds	R, <__data_start+X>
	lds	R, <__data_start+X>
	lds	R, <__data_start+X>
	mov	R, R
	ldi	R, 0x5C	;	92
	ldi	R, 0x02	;	2
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)>
	cpse	R, R
	rjmp	<SdVolume::cacheFlush(unsigned char)+X>
	ldi	R, 0x00	;	0
	rjmp	<SdVolume::cacheFlush(unsigned char)+X>
	and	R, R
	breq	<SdVolume::cacheFlush(unsigned char)+X>
	ldi	R, 0x01	;	1
	call	<SdVolume::cacheMirrorBlockFlush(unsigned char)>
	and	R, R
	breq	<SdVolume::cacheFlush(unsigned char)+X>
	sts	<SdVolume::cacheDirty_>, R
	rjmp	<SdVolume::cacheFlush(unsigned char)+X>

SdVolume::cacheMirrorBlockFlush(unsigned char):
	push	R
	lds	R, <SdVolume::cacheMirrorBlock_>
	lds	R, <SdVolume::cacheMirrorBlock_+X>
	lds	R, <SdVolume::cacheMirrorBlock_+X>
	lds	R, <SdVolume::cacheMirrorBlock_+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	breq	<SdVolume::cacheMirrorBlockFlush(unsigned char)+X>
	mov	R, R
	ldi	R, 0x5C	;	92
	ldi	R, 0x02	;	2
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Sd2Card::writeBlock(unsigned long, unsigned char const*, unsigned char)>
	and	R, R
	breq	<SdVolume::cacheMirrorBlockFlush(unsigned char)+X>
	sts	<SdVolume::cacheMirrorBlock_>, R
	sts	<SdVolume::cacheMirrorBlock_+X>, R
	sts	<SdVolume::cacheMirrorBlock_+X>, R
	sts	<SdVolume::cacheMirrorBlock_+X>, R
	ldi	R, 0x01	;	1
	pop	R
	ret

SdVolume::cacheRawBlock(unsigned long, unsigned char):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	mov	R, R
	lds	R, <__data_start>
	lds	R, <__data_start+X>
	lds	R, <__data_start+X>
	lds	R, <__data_start+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	rjmp	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	ldi	R, 0x01	;	1
	call	<SdVolume::cacheFlush(unsigned char)>
	and	R, R
	breq	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	and	R, R
	breq	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	or	R, R
	brne	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	rjmp	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	movw	R, R
	movw	R, R
	cpi	R, 0x03	;	3
	breq	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	ldi	R, 0x09	;	9
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	dec	R
	brne	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	ldi	R, 0x11	;	17
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Sd2Card::cardCommand(unsigned char, unsigned long)>
	and	R, R
	breq	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	ldi	R, 0x03	;	3
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Sd2Card::chipSelectHigh()>
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	call	<millis>
	movw	R, R
	call	<spiRec()>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	cpi	R, 0xFF	;	255
	brne	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	call	<millis>
	sub	R, R
	sbc	R, R
	cpi	R, 0x2D	;	45
	sbci	R, 0x01	;	1
	brcs	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	ldi	R, 0x0F	;	15
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Sd2Card::chipSelectHigh()>
	rjmp	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	cpi	R, 0xFE	;	254
	brne	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0x01	;	1
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0x5C	;	92
	ldi	R, 0x02	;	2
	ldi	R, 0x5C	;	92
	mov	R, R
	ldi	R, 0x04	;	4
	mov	R, R
	call	<spiRec()>
	st	Y+, R
	cp	R, R
	cpc	R, R
	brne	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	subi	R, 0xFE	;	254
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	and	R, R
	breq	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	cp	R, R
	sbci	R, 0x02	;	2
	brcs	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	and	R, R
	breq	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	cpi	R, 0x02	;	2
	sbci	R, 0x02	;	2
	brcc	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	call	<spiRec()>
	rjmp	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	ldi	R, 0x0D	;	13
	rjmp	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<Sd2Card::chipSelectHigh()>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__data_start>, R
	sts	<__data_start+X>, R
	sts	<__data_start+X>, R
	sts	<__data_start+X>, R
	lds	R, <SdVolume::cacheDirty_>
	or	R, R
	sts	<SdVolume::cacheDirty_>, R
	ldi	R, 0x01	;	1
	rjmp	<SdVolume::cacheRawBlock(unsigned long, unsigned char)+X>

SdVolume::fatGet(unsigned long, unsigned long*) const:
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	ldd	R, Z+9	;	0x09
	ldd	R, Z+10	;	0x0a
	ldd	R, Z+11	;	0x0b
	ldd	R, Z+12	;	0x0c
	adiw	R, 0x01	;	1
	adc	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcc	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ldd	R, Z+19	;	0x13
	ldd	R, Z+20	;	0x14
	ldd	R, Z+21	;	0x15
	ldd	R, Z+22	;	0x16
	ldd	R, Z+23	;	0x17
	cpi	R, 0x10	;	16
	brne	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>
	eor	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	lds	R, <__data_start>
	lds	R, <__data_start+X>
	lds	R, <__data_start+X>
	lds	R, <__data_start+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>
	movw	R, R
	ldd	R, Z+23	;	0x17
	cpi	R, 0x10	;	16
	brne	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>
	eor	R, R
	eor	R, R
	eor	R, R
	movw	R, R
	add	R, R
	adc	R, R
	subi	R, 0xA4	;	164
	sbci	R, 0xFD	;	253
	ld	R, Z
	ldd	R, Z+1	;	0x01
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	st	Y, R
	std	Y+1, R	;	0x01
	std	Y+2, R	;	0x02
	std	Y+3, R	;	0x03
	ldi	R, 0x01	;	1
	rjmp	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>
	movw	R, R
	movw	R, R
	ldi	R, 0x07	;	7
	lsr	R
	ror	R
	ror	R
	ror	R
	dec	R
	brne	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>
	rjmp	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>
	ldi	R, 0x00	;	0
	call	<SdVolume::cacheRawBlock(unsigned long, unsigned char)>
	cpse	R, R
	rjmp	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>
	rjmp	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>
	clt
	bld	R, 7
	eor	R, R
	eor	R, R
	eor	R, R
	movw	R, R
	add	R, R
	adc	R, R
	add	R, R
	adc	R, R
	subi	R, 0xA4	;	164
	sbci	R, 0xFD	;	253
	ld	R, Z
	ldd	R, Z+1	;	0x01
	ldd	R, Z+2	;	0x02
	ldd	R, Z+3	;	0x03
	andi	R, 0x0F	;	15
	rjmp	<SdVolume::fatGet(unsigned long, unsigned long*) const+X>

SdVolume::fatPut(unsigned long, unsigned long):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	cpi	R, 0x02	;	2
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcc	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ldd	R, Y+9	;	0x09
	ldd	R, Y+10	;	0x0a
	ldd	R, Y+11	;	0x0b
	ldd	R, Y+12	;	0x0c
	adiw	R, 0x01	;	1
	adc	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	ldd	R, Y+19	;	0x13
	ldd	R, Y+20	;	0x14
	ldd	R, Y+21	;	0x15
	ldd	R, Y+22	;	0x16
	ldd	R, Y+23	;	0x17
	cpi	R, 0x10	;	16
	breq	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	rjmp	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	eor	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	lds	R, <__data_start>
	lds	R, <__data_start+X>
	lds	R, <__data_start+X>
	lds	R, <__data_start+X>
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brne	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	ldd	R, Y+23	;	0x17
	cpi	R, 0x10	;	16
	brne	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	movw	R, R
	movw	R, R
	eor	R, R
	eor	R, R
	eor	R, R
	add	R, R
	adc	R, R
	subi	R, 0xA4	;	164
	sbci	R, 0xFD	;	253
	movw	R, R
	std	Z+1, R	;	0x01
	st	Z, R
	lds	R, <SdVolume::cacheDirty_>
	ori	R, 0x01	;	1
	sts	<SdVolume::cacheDirty_>, R
	ldd	R, Y+18	;	0x12
	cpi	R, 0x02	;	2
	brcs	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	ldd	R, Y+5	;	0x05
	ldd	R, Y+6	;	0x06
	ldd	R, Y+7	;	0x07
	ldd	R, Y+8	;	0x08
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	sts	<SdVolume::cacheMirrorBlock_>, R
	sts	<SdVolume::cacheMirrorBlock_+X>, R
	sts	<SdVolume::cacheMirrorBlock_+X>, R
	sts	<SdVolume::cacheMirrorBlock_+X>, R
	ldi	R, 0x01	;	1
	rjmp	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	movw	R, R
	movw	R, R
	ldi	R, 0x07	;	7
	lsr	R
	ror	R
	ror	R
	ror	R
	dec	R
	brne	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	rjmp	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	call	<SdVolume::cacheRawBlock(unsigned long, unsigned char)>
	cpse	R, R
	rjmp	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	rjmp	<SdVolume::fatPut(unsigned long, unsigned long)+X>
	movw	R, R
	movw	R, R
	andi	R, 0x7F	;	127
	eor	R, R
	eor	R, R
	eor	R, R
	add	R, R
	adc	R, R
	add	R, R
	adc	R, R
	subi	R, 0xA4	;	164
	sbci	R, 0xFD	;	253
	movw	R, R
	st	Z, R
	std	Z+1, R	;	0x01
	std	Z+2, R	;	0x02
	std	Z+3, R	;	0x03
	rjmp	<SdVolume::fatPut(unsigned long, unsigned long)+X>

SendControl(unsigned char):
	lds	R, <_cmark>
	lds	R, <_cmark+X>
	lds	R, <_cend>
	lds	R, <_cend+X>
	cp	R, R
	cpc	R, R
	brge	<SendControl(unsigned char)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0x05	;	5
	breq	<SendControl(unsigned char)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrc	R, 2
	rjmp	<SendControl(unsigned char)+X>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <_cmark>
	lds	R, <_cmark+X>
	adiw	R, 0x01	;	1
	andi	R, 0x3F	;	63
	eor	R, R
	or	R, R
	brne	<SendControl(unsigned char)+X>
	ldi	R, 0xFE	;	254
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <_cmark>
	lds	R, <_cmark+X>
	adiw	R, 0x01	;	1
	sts	<_cmark+X>, R
	sts	<_cmark>, R
	ldi	R, 0x01	;	1
	ret
	ldi	R, 0x00	;	0
	ret

SendInterfaces():
	push	R
	push	R
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	ldi	R, 0x02	;	2
	std	Y+1, R	;	0x01
	ldi	R, 0x42	;	66
	ldi	R, 0x00	;	0
	ldi	R, 0xE7	;	231
	ldi	R, 0x05	;	5
	ldi	R, 0x80	;	128
	call	<USB_SendControl(unsigned char, void const*, int)>
	call	<PluggableUSB()>
	movw	R, R
	adiw	R, 0x02	;	2
	ld	R, X+
	ld	R, X
	cp	R, R
	cpc	R, R
	breq	<SendInterfaces()+X>
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+2	;	0x02
	ldd	R, Z+3	;	0x03
	mov	R, R
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	icall
	sbrc	R, 7
	rjmp	<SendInterfaces()+X>
	movw	R, R
	ldd	R, Z+8	;	0x08
	ldd	R, Z+9	;	0x09
	rjmp	<SendInterfaces()+X>
	ldd	R, Y+1	;	0x01
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Serial1_available():
	ldi	R, 0xF0	;	240
	ldi	R, 0x05	;	5
	call	<HardwareSerial::available()>
	ldi	R, 0x01	;	1
	or	R, R
	brne	<Serial1_available()+X>
	ldi	R, 0x00	;	0
	mov	R, R
	ret

Serial_::available():
	movw	R, R
	ldd	R, Z+12	;	0x0c
	ldd	R, Z+13	;	0x0d
	sbrc	R, 7
	rjmp	<Serial_::available()+X>
	in	R, 0x3f	;	63
	cli
	ldi	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	out	0x3f, R	;	63
	ldi	R, 0x00	;	0
	adiw	R, 0x01	;	1
	ret
	in	R, 0x3f	;	63
	cli
	ldi	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	out	0x3f, R	;	63
	ldi	R, 0x00	;	0
	ret

Serial_::availableForWrite():
	call	<USB_SendSpace(unsigned char) [clone .constprop.11]>
	ldi	R, 0x00	;	0
	ret

Serial_::flush():
	ldi	R, 0x03	;	3
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	and	R, R
	breq	<Serial_::flush()+X>
	ldi	R, 0x3A	;	58
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ret

Serial_::peek():
	push	R
	push	R
	movw	R, R
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	sbrs	R, 7
	rjmp	<Serial_::peek()+X>
	call	<USB_Recv(unsigned char) [clone .constprop.12]>
	std	Y+13, R	;	0x0d
	std	Y+12, R	;	0x0c
	ldd	R, Y+12	;	0x0c
	ldd	R, Y+13	;	0x0d
	pop	R
	pop	R
	ret

Serial_::read():
	movw	R, R
	ldd	R, Z+12	;	0x0c
	ldd	R, Z+13	;	0x0d
	sbrc	R, 7
	rjmp	<Serial_::read()+X>
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	std	Z+13, R	;	0x0d
	std	Z+12, R	;	0x0c
	ret
	jmp	<USB_Recv(unsigned char) [clone .constprop.12]>

Serial_::write(unsigned char const*, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	lds	R, <_usbLineInfo+X>
	and	R, R
	brne	<Serial_::write(unsigned char const*, unsigned int)+X>
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	lds	R, <_usbConfiguration>
	and	R, R
	brne	<Serial_::write(unsigned char const*, unsigned int)+X>
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	lds	R, <_usbSuspendState>
	sbrs	R, 0
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ori	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	movw	R, R
	mov	R, R
	ldi	R, 0xFA	;	250
	mov	R, R
	ldi	R, 0x03	;	3
	mov	R, R
	ldi	R, 0x3A	;	58
	mov	R, R
	sbiw	R, 0x00	;	0
	brne	<Serial_::write(unsigned char const*, unsigned int)+X>
	and	R, R
	breq	<Serial_::write(unsigned char const*, unsigned int)+X>
	call	<USB_SendSpace(unsigned char) [clone .constprop.11]>
	cpse	R, R
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	dec	R
	and	R, R
	breq	<Serial_::write(unsigned char const*, unsigned int)+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	call	<delay>
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	cp	R, R
	cpc	R, R
	breq	<Serial_::write(unsigned char const*, unsigned int)+X>
	brlt	<Serial_::write(unsigned char const*, unsigned int)+X>
	mov	R, R
	in	R, 0x3f	;	63
	cli
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrc	R, 5
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	out	0x3f, R	;	63
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	mov	R, R
	ldi	R, 0x00	;	0
	sub	R, R
	sbc	R, R
	movw	R, R
	subi	R, 0x01	;	1
	brcs	<Serial_::write(unsigned char const*, unsigned int)+X>
	ld	R, Z+
	sts	<__TEXT_REGION_LENGTH__+X>, R
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	add	R, R
	adc	R, R
	and	R, R
	breq	<Serial_::write(unsigned char const*, unsigned int)+X>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	mov	R, R
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrc	R, 5
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	eor	R, R
	inc	R
	sbiw	R, 0x00	;	0
	breq	<Serial_::write(unsigned char const*, unsigned int)+X>
	rjmp	<Serial_::write(unsigned char const*, unsigned int)+X>
	ldi	R, 0x64	;	100
	sts	<TxLEDPulse>, R
	cp	R, R
	cpc	R, R
	brlt	<Serial_::write(unsigned char const*, unsigned int)+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	std	Z+3, R	;	0x03
	std	Z+2, R	;	0x02
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

Serial_::write(unsigned char):
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	std	Y+1, R	;	0x01
	movw	R, R
	ld	R, X+
	ld	R, X
	ldd	R, Z+2	;	0x02
	ldd	R, Z+3	;	0x03
	mov	R, R
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	icall
	pop	R
	pop	R
	pop	R
	ret

serialEventRun():
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	or	R, R
	breq	<serialEventRun()+X>
	call	<Serial1_available()>
	cpse	R, R
	jmp	0
	ret

SPIClass::begin():
	push	R
	in	R, 0x3f	;	63
	cli
	lds	R, <SPIClass::initialized>
	cpse	R, R
	rjmp	<SPIClass::begin()+X>
	ldi	R, 0x33	;	51
	ldi	R, 0x07	;	7
	lpm	R, Z
	ldi	R, 0x06	;	6
	ldi	R, 0x07	;	7
	lpm	R, Z
	mov	R, R
	ldi	R, 0x00	;	0
	add	R, R
	adc	R, R
	subi	R, 0x19	;	25
	sbci	R, 0xF9	;	249
	lpm	R, Z+
	lpm	R, Z
	ld	R, X
	and	R, R
	brne	<SPIClass::begin()+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x11	;	17
	call	<digitalWrite>
	ldi	R, 0x01	;	1
	ldi	R, 0x11	;	17
	call	<pinMode>
	in	R, 0x2c	;	44
	ori	R, 0x10	;	16
	out	0x2c, R	;	44
	in	R, 0x2c	;	44
	ori	R, 0x40	;	64
	out	0x2c, R	;	44
	ldi	R, 0x01	;	1
	ldi	R, 0x0F	;	15
	call	<pinMode>
	ldi	R, 0x01	;	1
	ldi	R, 0x10	;	16
	call	<pinMode>
	lds	R, <SPIClass::initialized>
	subi	R, 0xFF	;	255
	sts	<SPIClass::initialized>, R
	out	0x3f, R	;	63
	pop	R
	ret

SPIClass::beginTransaction(SPISettings):
	out	0x2c, R	;	44
	out	0x2d, R	;	45
	ret

SPIClass::endTransaction():
	ret

SPIClass::transfer(unsigned char):
	out	0x2e, R	;	46
	nop
	in	R, 0x2d	;	45
	sbrs	R, 7
	rjmp	<SPIClass::transfer(unsigned char)+X>
	in	R, 0x2e	;	46
	ret

spiRec():
	ldi	R, 0xFF	;	255
	jmp	<SPIClass::transfer(unsigned char)>

SPISettings::SPISettings(unsigned long, unsigned char, unsigned char) [clone .constprop.90]:
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	mov	R, R
	ldi	R, 0x09	;	9
	mov	R, R
	ldi	R, 0x3D	;	61
	mov	R, R
	mov	R, R
	ldi	R, 0x00	;	0
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcc	<SPISettings::SPISettings(unsigned long, unsigned char, unsigned char) [clone .constprop.90]+X>
	lsr	R
	ror	R
	ror	R
	ror	R
	subi	R, 0xFF	;	255
	cpi	R, 0x06	;	6
	brne	<SPISettings::SPISettings(unsigned long, unsigned char, unsigned char) [clone .constprop.90]+X>
	ldi	R, 0x07	;	7
	andi	R, 0x0C	;	12
	ori	R, 0x50	;	80
	mov	R, R
	lsr	R
	or	R, R
	st	Z, R
	com	R
	andi	R, 0x01	;	1
	std	Z+1, R	;	0x01
	pop	R
	pop	R
	pop	R
	pop	R
	ret

strchr:
	movw	R, R
	ld	R, Z+
	cp	R, R
	breq	<strchr+X>
	and	R, R
	brne	<strchr+X>
	eor	R, R
	ret
	sbiw	R, 0x01	;	1
	movw	R, R
	ret

strcmp:
	movw	R, R
	movw	R, R
	ld	R, X+
	ld	R, Z+
	sub	R, R
	cpse	R, R
	breq	<strcmp+X>
	sbc	R, R
	ret

strcpy:
	movw	R, R
	movw	R, R
	ld	R, Z+
	st	X+, R
	and	R, R
	brne	<strcpy+X>
	ret

String::concat(char const*) [clone .constprop.54]:
	movw	R, R
	ld	R, Z+
	and	R, R
	brne	<String::concat(char const*) [clone .constprop.54]+X>
	sbiw	R, 0x01	;	1
	movw	R, R
	sub	R, R
	sbc	R, R
	movw	R, R
	ldi	R, 0xEE	;	238
	ldi	R, 0x04	;	4
	jmp	<String::concat(char const*, unsigned int)>

String::concat(char const*, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	cp	R, R
	cpc	R, R
	brne	<String::concat(char const*, unsigned int)+X>
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	cp	R, R
	cpc	R, R
	breq	<String::concat(char const*, unsigned int)+X>
	movw	R, R
	movw	R, R
	ldd	R, Y+4	;	0x04
	ldd	R, Y+5	;	0x05
	add	R, R
	adc	R, R
	movw	R, R
	call	<String::reserve(unsigned int)>
	and	R, R
	breq	<String::concat(char const*, unsigned int)+X>
	ld	R, Y
	ldd	R, Y+1	;	0x01
	ldd	R, Y+4	;	0x04
	ldd	R, Y+5	;	0x05
	movw	R, R
	add	R, R
	adc	R, R
	call	<strcpy>
	std	Y+5, R	;	0x05
	std	Y+4, R	;	0x04
	ldi	R, 0x01	;	1
	rjmp	<String::concat(char const*, unsigned int)+X>

String::copy(char const*, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	call	<String::reserve(unsigned int)>
	cpse	R, R
	rjmp	<String::copy(char const*, unsigned int)+X>
	movw	R, R
	call	<String::invalidate()>
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	std	Y+5, R	;	0x05
	std	Y+4, R	;	0x04
	movw	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	call	<strcpy>
	rjmp	<String::copy(char const*, unsigned int)+X>

String::invalidate():
	push	R
	push	R
	movw	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	sbiw	R, 0x00	;	0
	breq	<String::invalidate()+X>
	call	<free>
	std	Y+1, R	;	0x01
	st	Y, R
	std	Y+5, R	;	0x05
	std	Y+4, R	;	0x04
	std	Y+3, R	;	0x03
	std	Y+2, R	;	0x02
	pop	R
	pop	R
	ret

String::operator=(String const&):
	push	R
	push	R
	movw	R, R
	movw	R, R
	cp	R, R
	cpc	R, R
	breq	<String::operator=(String const&)+X>
	ld	R, Z
	ldd	R, Z+1	;	0x01
	cp	R, R
	cpc	R, R
	breq	<String::operator=(String const&)+X>
	ldd	R, Z+4	;	0x04
	ldd	R, Z+5	;	0x05
	call	<String::copy(char const*, unsigned int)>
	movw	R, R
	pop	R
	pop	R
	ret
	call	<String::invalidate()>
	rjmp	<String::operator=(String const&)+X>

String::reserve(unsigned int):
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	ld	R, Y
	ldd	R, Y+1	;	0x01
	sbiw	R, 0x00	;	0
	breq	<String::reserve(unsigned int)+X>
	ldd	R, Y+2	;	0x02
	ldd	R, Y+3	;	0x03
	cp	R, R
	cpc	R, R
	brcs	<String::reserve(unsigned int)+X>
	ldi	R, 0x01	;	1
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	call	<realloc>
	sbiw	R, 0x00	;	0
	breq	<String::reserve(unsigned int)+X>
	std	Y+1, R	;	0x01
	st	Y, R
	std	Y+3, R	;	0x03
	std	Y+2, R	;	0x02
	ldd	R, Y+4	;	0x04
	ldd	R, Y+5	;	0x05
	or	R, R
	brne	<String::reserve(unsigned int)+X>
	movw	R, R
	st	Z, R
	rjmp	<String::reserve(unsigned int)+X>
	ldi	R, 0x00	;	0
	rjmp	<String::reserve(unsigned int)+X>

String::String(char const*) [clone .part.2] [clone .constprop.95]:
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0xA5	;	165
	ldi	R, 0x01	;	1
	jmp	<String::copy(char const*, unsigned int)>

String::~String():
	movw	R, R
	ld	R, Z
	ldd	R, Z+1	;	0x01
	sbiw	R, 0x00	;	0
	breq	<String::~String()+X>
	jmp	<free>
	ret

STRING_LANGUAGE:
04 03 09 04                                         ....

STRING_MANUFACTURER:
41 64 61 66 72 75 69 74 00                          Adafruit.

STRING_PRODUCT:
46 65 61 74 68 65 72 20 33 32 75 34 00              Feather 32u4.

strncasecmp_P:
	movw	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbci	R, 0x00	;	0
	brcs	<strncasecmp_P+X>
	ld	R, X+
	cpi	R, 0x41	;	65
	brlt	<strncasecmp_P+X>
	cpi	R, 0x5B	;	91
	brge	<strncasecmp_P+X>
	subi	R, 0xE0	;	224
	lpm	R, Z+
	cpi	R, 0x41	;	65
	brlt	<strncasecmp_P+X>
	cpi	R, 0x5B	;	91
	brge	<strncasecmp_P+X>
	subi	R, 0xE0	;	224
	sub	R, R
	cpse	R, R
	breq	<strncasecmp_P+X>
	sbc	R, R
	ret
	sub	R, R
	rjmp	<strncasecmp_P+X>

strncmp:
	movw	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbci	R, 0x00	;	0
	brcs	<strncmp+X>
	ld	R, X+
	ld	R, Z+
	sub	R, R
	brne	<strncmp+X>
	and	R, R
	brne	<strncmp+X>
	sub	R, R
	sbc	R, R
	ret

strncpy:
	movw	R, R
	movw	R, R
	subi	R, 0x01	;	1
	sbci	R, 0x00	;	0
	brcs	<strncpy+X>
	ld	R, Z+
	st	X+, R
	and	R, R
	brne	<strncpy+X>
	rjmp	<strncpy+X>
	st	X+, R
	subi	R, 0x01	;	1
	sbci	R, 0x00	;	0
	brcc	<strncpy+X>
	ret

strtod:
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0xAF	;	175
	ldi	R, 0x30	;	48
	jmp	<__prologue_saves__+X>
	movw	R, R
	movw	R, R
	cp	R, R
	cpc	R, R
	breq	<strtod+X>
	movw	R, R
	st	X+, R
	st	X, R
	movw	R, R
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	ld	R, Z
	mov	R, R
	ldi	R, 0x00	;	0
	call	<isspace>
	movw	R, R
	or	R, R
	brne	<strtod+X>
	cpi	R, 0x2D	;	45
	brne	<strtod+X>
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	movw	R, R
	adiw	R, 0x01	;	1
	ld	R, X
	ldi	R, 0x01	;	1
	movw	R, R
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	ldi	R, 0x03	;	3
	ldi	R, 0x00	;	0
	ldi	R, 0xB4	;	180
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strncasecmp_P>
	or	R, R
	brne	<strtod+X>
	movw	R, R
	ldi	R, 0x02	;	2
	add	R, R
	adc	R, R
	ldi	R, 0x05	;	5
	ldi	R, 0x00	;	0
	ldi	R, 0xAF	;	175
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strncasecmp_P>
	or	R, R
	brne	<strtod+X>
	movw	R, R
	ldi	R, 0x07	;	7
	add	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	breq	<strtod+X>
	movw	R, R
	st	X+, R
	st	X, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x80	;	128
	ldi	R, 0xFF	;	255
	cpse	R, R
	rjmp	<strtod+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x80	;	128
	ldi	R, 0x7F	;	127
	rjmp	<strtod+X>
	movw	R, R
	rjmp	<strtod+X>
	cpi	R, 0x2B	;	43
	brne	<strtod+X>
	movw	R, R
	subi	R, 0xFE	;	254
	sbci	R, 0xFF	;	255
	movw	R, R
	ldd	R, Z+1	;	0x01
	ldi	R, 0x00	;	0
	rjmp	<strtod+X>
	ldi	R, 0x03	;	3
	ldi	R, 0x00	;	0
	ldi	R, 0xAC	;	172
	ldi	R, 0x00	;	0
	movw	R, R
	call	<strncasecmp_P>
	or	R, R
	breq	<strtod+X>
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	ldi	R, 0xD0	;	208
	mov	R, R
	add	R, R
	ldi	R, 0x09	;	9
	cp	R, R
	brcs	<strtod+X>
	mov	R, R
	set
	bld	R, 1
	mov	R, R
	andi	R, 0x08	;	8
	sbrs	R, 2
	rjmp	<strtod+X>
	cpse	R, R
	rjmp	<strtod+X>
	subi	R, 0xFF	;	255
	sbci	R, 0xFF	;	255
	adiw	R, 0x01	;	1
	movw	R, R
	ld	R, X
	mov	R, R
	rjmp	<strtod+X>
	cp	R, R
	cpc	R, R
	breq	<strtod+X>
	subi	R, 0xFE	;	254
	sbci	R, 0xFF	;	255
	movw	R, R
	std	Z+1, R	;	0x01
	st	Z, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	ldi	R, 0xC0	;	192
	ldi	R, 0x7F	;	127
	rjmp	<strtod+X>
	and	R, R
	breq	<strtod+X>
	subi	R, 0x01	;	1
	sbc	R, R
	ldi	R, 0x05	;	5
	ldi	R, 0x00	;	0
	call	<__muluhisi3>
	movw	R, R
	movw	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	add	R, R
	adc	R, R
	adc	R, R
	adc	R, R
	cpi	R, 0x98	;	152
	ldi	R, 0x99	;	153
	cpc	R, R
	cpc	R, R
	ldi	R, 0x19	;	25
	cpc	R, R
	brcs	<strtod+X>
	ori	R, 0x06	;	6
	mov	R, R
	rjmp	<strtod+X>
	ldi	R, 0xFE	;	254
	cpse	R, R
	rjmp	<strtod+X>
	sbrc	R, 3
	rjmp	<strtod+X>
	mov	R, R
	set
	bld	R, 3
	rjmp	<strtod+X>
	andi	R, 0xDF	;	223
	cpi	R, 0x45	;	69
	brne	<strtod+X>
	ld	R, Z
	cpi	R, 0x2D	;	45
	brne	<strtod+X>
	ori	R, 0x10	;	16
	movw	R, R
	adiw	R, 0x02	;	2
	ldd	R, Z+1	;	0x01
	ldi	R, 0x02	;	2
	ldi	R, 0x00	;	0
	rjmp	<strtod+X>
	movw	R, R
	cpi	R, 0x2B	;	43
	breq	<strtod+X>
	adiw	R, 0x01	;	1
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	subi	R, 0x30	;	48
	movw	R, R
	sub	R, R
	sbc	R, R
	cpi	R, 0x0A	;	10
	brcc	<strtod+X>
	ldi	R, 0x80	;	128
	cp	R, R
	ldi	R, 0x0C	;	12
	cpc	R, R
	brge	<strtod+X>
	movw	R, R
	add	R, R
	adc	R, R
	add	R, R
	adc	R, R
	add	R, R
	adc	R, R
	add	R, R
	adc	R, R
	add	R, R
	adc	R, R
	movw	R, R
	ldi	R, 0xFF	;	255
	sub	R, R
	sbc	R, R
	ld	R, X
	subi	R, 0x30	;	48
	cpi	R, 0x0A	;	10
	brcs	<strtod+X>
	sbrs	R, 4
	rjmp	<strtod+X>
	neg	R
	neg	R
	sbc	R, R
	add	R, R
	adc	R, R
	sbrs	R, 1
	rjmp	<strtod+X>
	cp	R, R
	cpc	R, R
	breq	<strtod+X>
	ldi	R, 0x01	;	1
	sub	R, R
	sbc	R, R
	movw	R, R
	st	X+, R
	st	X, R
	movw	R, R
	movw	R, R
	call	<__floatunsisf>
	andi	R, 0x03	;	3
	cpi	R, 0x03	;	3
	brne	<strtod+X>
	subi	R, 0x80	;	128
	movw	R, R
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	call	<__cmpsf2>
	and	R, R
	brne	<strtod+X>
	rjmp	<strtod+X>
	ldi	R, 0xE3	;	227
	ldi	R, 0x00	;	0
	sbrs	R, 7
	rjmp	<strtod+X>
	neg	R
	neg	R
	sbc	R, R
	ldi	R, 0xCB	;	203
	ldi	R, 0x00	;	0
	movw	R, R
	ldi	R, 0x18	;	24
	sub	R, R
	sbc	R, R
	ldi	R, 0x20	;	32
	mov	R, R
	mov	R, R
	rjmp	<strtod+X>
	movw	R, R
	rjmp	<strtod+X>
	movw	R, R
	lpm	R, Z+
	lpm	R, Z+
	lpm	R, Z+
	lpm	R, Z
	sub	R, R
	sbc	R, R
	movw	R, R
	movw	R, R
	call	<__mulsf3>
	movw	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	cp	R, R
	cpc	R, R
	brge	<strtod+X>
	sbiw	R, 0x04	;	4
	asr	R
	ror	R
	cp	R, R
	cpc	R, R
	brne	<strtod+X>
	mov	R, R
	add	R, R
	mov	R, R
	adc	R, R
	cpi	R, 0xFF	;	255
	breq	<strtod+X>
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	movw	R, R
	movw	R, R
	movw	R, R
	call	<__cmpsf2>
	cpse	R, R
	rjmp	<strtod+X>
	ldi	R, 0x22	;	34
	ldi	R, 0x00	;	0
	sts	<errno+X>, R
	sts	<errno>, R
	movw	R, R
	movw	R, R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	ldi	R, 0x0C	;	12
	jmp	<__epilogue_restores__+X>

twi_handleTimeout:
	push	R
	push	R
	ldi	R, 0x01	;	1
	sts	<twi_timed_out_flag>, R
	and	R, R
	breq	<twi_handleTimeout+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	andi	R, 0xBA	;	186
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0x00	;	0
	ldi	R, 0x02	;	2
	call	<digitalWrite>
	ldi	R, 0x00	;	0
	ldi	R, 0x03	;	3
	call	<digitalWrite>
	call	<twi_init>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	sts	<__TEXT_REGION_LENGTH__+X>, R
	pop	R
	pop	R
	ret

twi_init:
	sts	<twi_state>, R
	ldi	R, 0x01	;	1
	sts	<twi_sendStop>, R
	sts	<twi_inRepStart>, R
	ldi	R, 0x01	;	1
	ldi	R, 0x02	;	2
	call	<digitalWrite>
	ldi	R, 0x01	;	1
	ldi	R, 0x03	;	3
	call	<digitalWrite>
	ldi	R, 0xB9	;	185
	ldi	R, 0x00	;	0
	ld	R, Z
	andi	R, 0xFE	;	254
	st	Z, R
	ld	R, Z
	andi	R, 0xFD	;	253
	st	Z, R
	ldi	R, 0x20	;	32
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ldi	R, 0x45	;	69
	sts	<__TEXT_REGION_LENGTH__+X>, R
	ret

twi_stop:
	ldi	R, 0xD5	;	213
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	adiw	R, 0x07	;	7
	adc	R, R
	adc	R, R
	ldi	R, 0x03	;	3
	lsr	R
	ror	R
	ror	R
	ror	R
	dec	R
	brne	<twi_stop+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrc	R, 4
	rjmp	<twi_stop+X>
	sts	<twi_state>, R
	ret
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	or	R, R
	or	R, R
	or	R, R
	breq	<twi_stop+X>
	sbiw	R, 0x00	;	0
	cpc	R, R
	cpc	R, R
	breq	<twi_stop+X>
	ldi	R, 0x1A	;	26
	dec	R
	brne	<twi_stop+X>
	rjmp	<twi_stop+X>
	sbiw	R, 0x01	;	1
	sbc	R, R
	sbc	R, R
	rjmp	<twi_stop+X>
	lds	R, <twi_do_reset_on_timeout>
	jmp	<twi_handleTimeout>

twi_transmit:
	lds	R, <twi_txBufferLength>
	add	R, R
	eor	R, R
	adc	R, R
	cpi	R, 0x21	;	33
	cpc	R, R
	brge	<twi_transmit+X>
	lds	R, <twi_state>
	movw	R, R
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	cpi	R, 0x04	;	4
	breq	<twi_transmit+X>
	ldi	R, 0x02	;	2
	ret
	lds	R, <twi_txBufferLength>
	ld	R, Z+
	movw	R, R
	subi	R, 0x58	;	88
	sbci	R, 0xFB	;	251
	add	R, R
	mov	R, R
	adc	R, R
	st	X, R
	adiw	R, 0x01	;	1
	cp	R, R
	brcs	<twi_transmit+X>
	lds	R, <twi_txBufferLength>
	add	R, R
	sts	<twi_txBufferLength>, R
	ldi	R, 0x00	;	0
	ret
	ldi	R, 0x01	;	1
	ret

TwoWire::available():
	lds	R, <TwoWire::rxBufferLength>
	lds	R, <TwoWire::rxBufferIndex>
	sub	R, R
	sbc	R, R
	ret

TwoWire::endTransmission(unsigned char) [clone .constprop.86]:
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	lds	R, <TwoWire::txBufferLength>
	cpi	R, 0x21	;	33
	brcs	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	mov	R, R
	lds	R, <TwoWire::txAddress>
	call	<micros>
	movw	R, R
	movw	R, R
	lds	R, <twi_state>
	cpse	R, R
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	ldi	R, 0x02	;	2
	sts	<twi_state>, R
	sts	<twi_sendStop>, R
	ldi	R, 0xFF	;	255
	sts	<twi_error>, R
	sts	<twi_masterBufferIndex>, R
	sts	<twi_masterBufferLength>, R
	ldi	R, 0x28	;	40
	ldi	R, 0x05	;	5
	ldi	R, 0xFC	;	252
	ldi	R, 0x04	;	4
	ldi	R, 0x00	;	0
	cpse	R, R
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	sts	<twi_slarw>, R
	lds	R, <twi_slarw>
	add	R, R
	or	R, R
	sts	<twi_slarw>, R
	lds	R, <twi_inRepStart>
	cpi	R, 0x01	;	1
	breq	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	sts	<twi_inRepStart>, R
	call	<micros>
	movw	R, R
	movw	R, R
	lds	R, <twi_slarw>
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	or	R, R
	or	R, R
	or	R, R
	breq	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	call	<micros>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcc	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	sbrc	R, 3
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	ldi	R, 0xC5	;	197
	sts	<__TEXT_REGION_LENGTH__+X>, R
	call	<micros>
	movw	R, R
	movw	R, R
	lds	R, <twi_state>
	cpi	R, 0x02	;	2
	brne	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	lds	R, <twi_error>
	cpi	R, 0xFF	;	255
	brne	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	lds	R, <twi_error>
	cpi	R, 0x20	;	32
	brne	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	lds	R, <twi_error>
	cpi	R, 0x30	;	48
	brne	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	ldi	R, 0x04	;	4
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	or	R, R
	or	R, R
	or	R, R
	brne	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	call	<micros>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	lds	R, <twi_do_reset_on_timeout>
	call	<twi_handleTimeout>
	ldi	R, 0x05	;	5
	sts	<TwoWire::txBufferIndex>, R
	sts	<TwoWire::txBufferLength>, R
	sts	<TwoWire::transmitting>, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ld	R, X+
	st	Z+, R
	subi	R, 0xFF	;	255
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	ldi	R, 0xE5	;	229
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	or	R, R
	or	R, R
	or	R, R
	brne	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	call	<micros>
	lds	R, <twi_timeout_us>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	lds	R, <twi_timeout_us+X>
	sub	R, R
	sbc	R, R
	sbc	R, R
	sbc	R, R
	cp	R, R
	cpc	R, R
	cpc	R, R
	cpc	R, R
	brcs	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	ldi	R, 0x01	;	1
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	ldi	R, 0x00	;	0
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	ldi	R, 0x02	;	2
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>
	ldi	R, 0x03	;	3
	rjmp	<TwoWire::endTransmission(unsigned char) [clone .constprop.86]+X>

TwoWire::onReceiveService(unsigned char*, int):
	ret

TwoWire::onRequestService():
	ret

TwoWire::peek():
	lds	R, <TwoWire::rxBufferIndex>
	lds	R, <TwoWire::rxBufferLength>
	cp	R, R
	brcc	<TwoWire::peek()+X>
	ldi	R, 0x00	;	0
	subi	R, 0x79	;	121
	sbci	R, 0xFB	;	251
	ld	R, Z
	ldi	R, 0x00	;	0
	ret
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	ret

TwoWire::read():
	lds	R, <TwoWire::rxBufferIndex>
	lds	R, <TwoWire::rxBufferLength>
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	cp	R, R
	brcc	<TwoWire::read()+X>
	mov	R, R
	ldi	R, 0x00	;	0
	subi	R, 0x79	;	121
	sbci	R, 0xFB	;	251
	ld	R, Z
	ldi	R, 0x00	;	0
	subi	R, 0xFF	;	255
	sts	<TwoWire::rxBufferIndex>, R
	movw	R, R
	ret

TwoWire::write(unsigned char const*, unsigned int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	movw	R, R
	movw	R, R
	movw	R, R
	lds	R, <TwoWire::transmitting>
	and	R, R
	breq	<TwoWire::write(unsigned char const*, unsigned int)+X>
	movw	R, R
	movw	R, R
	add	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	breq	<TwoWire::write(unsigned char const*, unsigned int)+X>
	ld	R, Y+
	movw	R, R
	ld	R, X+
	ld	R, X
	ld	R, Z+
	ld	R, Z
	mov	R, R
	movw	R, R
	icall
	rjmp	<TwoWire::write(unsigned char const*, unsigned int)+X>
	mov	R, R
	call	<twi_transmit>
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret

TwoWire::write(unsigned char):
	push	R
	push	R
	push	R
	in	R, 0x3d	;	61
	in	R, 0x3e	;	62
	std	Y+1, R	;	0x01
	lds	R, <TwoWire::transmitting>
	and	R, R
	breq	<TwoWire::write(unsigned char)+X>
	lds	R, <TwoWire::txBufferLength>
	cpi	R, 0x20	;	32
	brcs	<TwoWire::write(unsigned char)+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	movw	R, R
	std	Z+3, R	;	0x03
	std	Z+2, R	;	0x02
	ldi	R, 0x00	;	0
	ldi	R, 0x00	;	0
	pop	R
	pop	R
	pop	R
	ret
	lds	R, <TwoWire::txBufferIndex>
	mov	R, R
	ldi	R, 0x00	;	0
	subi	R, 0xD8	;	216
	sbci	R, 0xFA	;	250
	ldd	R, Y+1	;	0x01
	st	Z, R
	subi	R, 0xFF	;	255
	sts	<TwoWire::txBufferIndex>, R
	sts	<TwoWire::txBufferLength>, R
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	rjmp	<TwoWire::write(unsigned char)+X>
	ldi	R, 0x01	;	1
	movw	R, R
	adiw	R, 0x01	;	1
	call	<twi_transmit>
	rjmp	<TwoWire::write(unsigned char)+X>

USB_DeviceDescriptorIAD:
12 01 00 02 ef 02 01 40 9a 23 0c 80 00 01 01 02     .......@.#......
03 01                                               ..

USB_Recv(unsigned char) [clone .constprop.12]:
	lds	R, <_usbConfiguration>
	cpse	R, R
	rjmp	<USB_Recv(unsigned char) [clone .constprop.12]+X>
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	ret
	in	R, 0x3f	;	63
	cli
	ldi	R, 0x02	;	2
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	mov	R, R
	ldi	R, 0x00	;	0
	cp	R, R
	cpc	R, R
	brge	<USB_Recv(unsigned char) [clone .constprop.12]+X>
	ldi	R, 0x01	;	1
	ldi	R, 0x00	;	0
	or	R, R
	breq	<USB_Recv(unsigned char) [clone .constprop.12]+X>
	ldi	R, 0x64	;	100
	sts	<RxLEDPulse>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	and	R, R
	breq	<USB_Recv(unsigned char) [clone .constprop.12]+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	cpse	R, R
	rjmp	<USB_Recv(unsigned char) [clone .constprop.12]+X>
	ldi	R, 0x6B	;	107
	sts	<__TEXT_REGION_LENGTH__+X>, R
	out	0x3f, R	;	63
	and	R, R
	breq	<USB_Recv(unsigned char) [clone .constprop.12]+X>
	ldi	R, 0x00	;	0
	ret

USB_SendControl(unsigned char, void const*, int):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	mov	R, R
	movw	R, R
	movw	R, R
	movw	R, R
	add	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	breq	<USB_SendControl(unsigned char, void const*, int)+X>
	sbrs	R, 7
	rjmp	<USB_SendControl(unsigned char, void const*, int)+X>
	movw	R, R
	lpm	R, Z
	call	<SendControl(unsigned char)>
	adiw	R, 0x01	;	1
	cpse	R, R
	rjmp	<USB_SendControl(unsigned char, void const*, int)+X>
	ldi	R, 0xFF	;	255
	ldi	R, 0xFF	;	255
	movw	R, R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ld	R, Y
	rjmp	<USB_SendControl(unsigned char, void const*, int)+X>

USB_SendSpace(unsigned char) [clone .constprop.11]:
	in	R, 0x3f	;	63
	cli
	ldi	R, 0x03	;	3
	sts	<__TEXT_REGION_LENGTH__+X>, R
	lds	R, <__TEXT_REGION_LENGTH__+X>
	mov	R, R
	andi	R, 0x20	;	32
	sbrs	R, 5
	rjmp	<USB_SendSpace(unsigned char) [clone .constprop.11]+X>
	lds	R, <__TEXT_REGION_LENGTH__+X>
	ldi	R, 0x40	;	64
	sub	R, R
	out	0x3f, R	;	63
	ret

USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char):
	push	R
	push	R
	push	R
	push	R
	push	R
	push	R
	mov	R, R
	mov	R, R
	mov	R, R
	mov	R, R
	ldi	R, 0x01	;	1
	add	R, R
	add	R, R
	call	<SendControl(unsigned char)>
	ldi	R, 0x03	;	3
	call	<SendControl(unsigned char)>
	mov	R, R
	mov	R, R
	add	R, R
	mov	R, R
	adc	R, R
	cp	R, R
	cpc	R, R
	breq	<USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+X>
	sbrs	R, 7
	rjmp	<USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+X>
	movw	R, R
	lpm	R, Z
	call	<SendControl(unsigned char)>
	mov	R, R
	ldi	R, 0x00	;	0
	call	<SendControl(unsigned char)>
	and	R, R
	adiw	R, 0x01	;	1
	cpse	R, R
	rjmp	<USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+X>
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	pop	R
	ret
	ld	R, Y
	rjmp	<USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+X>
	ldi	R, 0x01	;	1
	rjmp	<USB_SendStringDescriptor(unsigned char const*, unsigned char, unsigned char)+X>

