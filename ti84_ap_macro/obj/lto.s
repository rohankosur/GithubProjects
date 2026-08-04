	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"llvm-link"
	.section	.text._init_database,"ax",@progbits
	.globl	_init_database                  ; -- Begin function init_database
	.type	_init_database,@function
_init_database:                         ; @init_database
; %bb.0:
	ld	hl, -19
	call	__frameset
	ld	iy, (ix + 6)
	xor	a, a
	ld	(ix - 9), a
	ld	bc, 11
	ld	de, 1
	ld	hl, 42
	ld	(ix - 15), hl
	ld	a, 49
	ld	(iy), b
	ld	hl, 4407629
	ld	(ix - 8), hl
	ld	hl, 5521732
	ld	(ix - 5), hl
	ld.sis	hl, 49
	ld	(ix - 2), l
	ld	(ix - 1), h
	ld	(ix - 18), bc
	.local	.LBB0_1
.LBB0_1:                                ; =>This Inner Loop Header: Depth=1
	ld	(ix - 12), de
	ex	de, hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB0_5
; %bb.2:                                ;   in Loop: Header=BB0_1 Depth=1
	ld	(ix - 1), a
	ld	hl, _.str
	push	hl
	pea	ix - 8
	ld	(ix - 19), a                    ; 1-byte Folded Spill
	call	_ti_Open
	ld	c, a
	pop	hl
	pop	hl
	ld	hl, (ix + 6)
	or	a, a
	jr	z, .LBB0_4
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	push	hl
	pop	iy
	ld	de, (ix - 12)
	add	iy, de
	ld	(iy), c
	ld	l, c
	push	hl
	ld	(ix - 9), c                     ; 1-byte Folded Spill
	call	_ti_GetDataPtr
	pop	de
	ld	iy, (ix + 6)
	ld	de, (ix - 18)
	add	iy, de
	ld	(iy), hl
	ld	l, (ix - 9)                     ; 1-byte Folded Reload
	push	hl
	call	_ti_GetSize
	pop	de
	ld	de, (ix + 6)
	push	de
	pop	iy
	ld	bc, (ix - 15)
	add	iy, bc
	ld	(iy), l
	ld	(iy + 1), h
	ex	de, hl
	inc	(hl)
	ld	a, (hl)
	ld	(ix - 9), a
	ld	a, (ix - 19)                    ; 1-byte Folded Reload
	inc	a
	ld	de, (ix - 12)
	inc	de
	ld	iy, (ix - 18)
	ld	bc, 3
	add	iy, bc
	ld	hl, (ix - 15)
	dec	bc
	add	hl, bc
	ld	(ix - 15), hl
	ld	(ix - 18), iy
	ld	bc, 11
	jp	.LBB0_1
	.local	.LBB0_4
.LBB0_4:
	ld	a, (hl)
	ld	(ix - 9), a
	.local	.LBB0_5
.LBB0_5:                                ; %.loopexit
	ld	e, (ix - 9)                     ; 1-byte Folded Reload
	ld	a, e
	or	a, a
	jr	z, .LBB0_7
; %bb.6:
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	iy, (iy + 11)
	ld	(ix - 12), iy
	ld	c, (iy)
	ld	b, 0
	ld	a, (iy + 1)
	ld	h, b
	ld	l, a
	ld	h, l
	ld	l, b
	add.sis	hl, bc
	ld	iy, (ix + 6)
	ld	(iy + 62), l
	ld	(iy + 63), h
	ld	c, l
	ld	b, h
	ld	iy, (ix - 12)
	lea	hl, iy + 2
	ld	iy, (ix + 6)
	ld	(iy + 64), hl
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, c
	ld	h, b
	ld	bc, 6
	call	__imulu
	ld	bc, 2
	add	hl, bc
	ld	a, iyl
	ld	iy, (ix + 6)
	ld	(iy + 67), hl
	ld	(iy + 70), a
	.local	.LBB0_7
.LBB0_7:
	ld	a, e
	or	a, a
	jr	nz, .LBB0_9
; %bb.8:
	ld	a, 0
	jr	.LBB0_10
	.local	.LBB0_9
.LBB0_9:
	ld	a, -1
	.local	.LBB0_10
.LBB0_10:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_init_database, .Lfunc_end0-_init_database
                                        ; -- End function
	.section	.text._close_database,"ax",@progbits
	.globl	_close_database                 ; -- Begin function close_database
	.type	_close_database,@function
_close_database:                        ; @close_database
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	iy, 1
	.local	.LBB1_1
.LBB1_1:                                ; =>This Inner Loop Header: Depth=1
	lea	de, iy + 0
	dec	de
	ld	hl, (ix + 6)
	ld	a, (hl)
	ld	bc, 0
	ld	c, a
	ex	de, hl
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB1_3
; %bb.2:                                ;   in Loop: Header=BB1_1 Depth=1
	ld	hl, (ix + 6)
	lea	de, iy + 0
	ld	(ix - 3), de
	add	hl, de
	ld	a, (hl)
	ld	l, a
	push	hl
	call	_ti_Close
	pop	hl
	ld	iy, (ix - 3)
	inc	iy
	jr	.LBB1_1
	.local	.LBB1_3
.LBB1_3:
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end1
.Lfunc_end1:
	.size	_close_database, .Lfunc_end1-_close_database
                                        ; -- End function
	.section	.text._get_virtual_ptr,"ax",@progbits
	.globl	_get_virtual_ptr                ; -- Begin function get_virtual_ptr
	.type	_get_virtual_ptr,@function
_get_virtual_ptr:                       ; @get_virtual_ptr
; %bb.0:
	ld	hl, -17
	call	__frameset
	ld	iy, (ix + 6)
	or	a, a
	sbc	hl, hl
	ld	a, (iy)
	ld	bc, 0
	ld	c, a
	lea	de, iy + 42
	ld	(ix - 4), de
	lea	de, iy + 11
	ld	(ix - 10), de
	ld	(ix - 7), hl
	ld	d, b
	.local	.LBB2_1
.LBB2_1:                                ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, bc
	jr	z, .LBB2_5
; %bb.2:                                ;   in Loop: Header=BB2_1 Depth=1
	ld	(ix - 17), bc
	ld	hl, (ix - 4)
	ld	hl, (hl)
	xor	a, a
	ld	(ix - 1), a
	ld	bc, (ix - 3)
	ld	b, h
	ld	c, l
	sbc	hl, hl
	ld	a, l
	ld	iy, (ix - 7)
	lea	hl, iy + 0
	ld	e, d
	call	__ladd
	ld	(ix - 13), hl
	ld	(ix - 14), e                    ; 1-byte Folded Spill
	ld	hl, (ix + 9)
	ld	e, (ix + 12)
	lea	bc, iy + 0
	ld	a, d
	ld	d, (ix - 14)                    ; 1-byte Folded Reload
	call	__lcmpu
	jr	c, .LBB2_4
; %bb.3:                                ;   in Loop: Header=BB2_1 Depth=1
	ld	bc, (ix - 13)
	ld	a, d
	call	__lcmpu
	jr	c, .LBB2_6
	.local	.LBB2_4
.LBB2_4:                                ;   in Loop: Header=BB2_1 Depth=1
	ld	iy, (ix - 10)
	lea	iy, iy + 3
	ld	(ix - 10), iy
	ld	iy, (ix - 4)
	lea	iy, iy + 2
	ld	(ix - 4), iy
	ld	bc, (ix - 17)
	dec	bc
	ld	hl, (ix - 13)
	ld	(ix - 7), hl
	jr	.LBB2_1
	.local	.LBB2_5
.LBB2_5:
	ld	iy, 0
	jr	.LBB2_7
	.local	.LBB2_6
.LBB2_6:
	ld	iy, (ix - 10)
	ld	iy, (iy)
	ld	de, (ix - 7)
	or	a, a
	sbc	hl, de
	ex	de, hl
	add	iy, de
	.local	.LBB2_7
.LBB2_7:                                ; %.loopexit
	lea	hl, iy + 0
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_get_virtual_ptr, .Lfunc_end2-_get_virtual_ptr
                                        ; -- End function
	.section	.text._get_node_data,"ax",@progbits
	.globl	_get_node_data                  ; -- Begin function get_node_data
	.type	_get_node_data,@function
_get_node_data:                         ; @get_node_data
; %bb.0:
	ld	hl, -51
	call	__frameset
	ld	hl, (ix + 6)
	ld	bc, 1
	push	hl
	pop	iy
	ld	hl, (iy + 67)
	ld	(ix - 10), hl
	ld	e, (iy + 70)
	ld	(ix - 11), e
	ld	iyl, b
	ld	a, iyl
	call	__ladd
	ld	(ix - 14), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 17), de
	ld	l, (ix - 11)                    ; 1-byte Folded Reload
	push	hl
	ld	hl, (ix - 10)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	l, (hl)
	ld	de, 0
	ld	a, e
	ld	(ix - 11), a
	ld	(ix - 10), e
	ld	(ix - 9), d
	ld	a, e
	.local	.LBB3_1
.LBB3_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_3 Depth 2
	cp	a, l
	jp	z, .LBB3_8
; %bb.2:                                ;   in Loop: Header=BB3_1 Depth=1
	ld	(ix - 18), a                    ; 1-byte Folded Spill
	ld	(ix - 28), l                    ; 1-byte Folded Spill
	ld	hl, (ix - 17)
	push	hl
	ld	hl, (ix - 14)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	a, (hl)
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	push	af
	ld	a, iyl
	ld	(ix - 7), a
	pop	af
	ld	bc, (ix - 9)
	ld	b, iyl
	ld	c, a
	ld	hl, (ix - 14)
	ld	de, (ix - 17)
                                        ; kill: def $e killed $e killed $ude
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 17), hl
	ld	(ix - 14), e
	ld	bc, 1
	ld	a, iyl
	call	__ladd
	ld	(ix - 21), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 24), de
	ld	hl, (ix - 17)
	ld	e, (ix - 14)                    ; 1-byte Folded Reload
	inc	bc
	call	__ladd
	ld	(ix - 14), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 17), de
	ld	hl, (ix - 24)
	push	hl
	ld	hl, (ix - 21)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	l, (hl)
	ld	a, (ix + 12)
	ld	(ix - 21), a
	.local	.LBB3_3
.LBB3_3:                                ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	a, l
	or	a, a
	jp	z, .LBB3_7
; %bb.4:                                ;   in Loop: Header=BB3_3 Depth=2
	ld	(ix - 36), l                    ; 1-byte Folded Spill
	ld	hl, (ix - 14)
	ld	de, (ix - 17)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 1
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ld	a, iyl
	call	__ladd
	ld	(ix - 27), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 24), de
	ld	hl, (ix - 17)
	push	hl
	ld	hl, (ix - 14)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	a, (hl)
	ld	(ix - 29), a
	ld	hl, (ix - 24)
	push	hl
	ld	hl, (ix - 27)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	ld	(ix - 39), hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ld	(ix - 6), l
	ld	bc, (ix - 8)
	ld	b, l
	ld	c, (ix - 29)                    ; 1-byte Folded Reload
	ld	hl, (ix - 27)
	ld	de, (ix - 24)
                                        ; kill: def $e killed $e killed $ude
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 17), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	l, (hl)
	ld	h, 0
	ld	(ix - 24), l
	ld	(ix - 23), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 1
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ld	a, iyl
	call	__ladd
                                        ; kill: def $e killed $e def $ude
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	a, (hl)
	ld	e, (ix - 24)
	ld	d, (ix - 23)
	ld	h, d
	ld	l, a
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ex	de, hl
	ld	iyh, e
	ex	de, hl
	push	iy
	ex	(sp), hl
	ld	(ix - 10), l
	ld	(ix - 9), h
	pop	hl
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	add.sis	hl, de
	ld	(ix - 24), l
	ld	(ix - 23), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 2
	ld	a, iyl
	call	__ladd
	ld	(ix - 17), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	ld	(ix - 42), hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ld	(ix - 5), l
	ld	bc, (ix - 7)
	ld	l, (ix - 24)
	ld	h, (ix - 23)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 17), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	l, (hl)
	ld	h, 0
	ld	(ix - 27), l
	ld	(ix - 26), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 1
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ld	a, iyl
	call	__ladd
                                        ; kill: def $e killed $e def $ude
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	a, (hl)
	ld	e, (ix - 27)
	ld	d, (ix - 26)
	ld	h, d
	ld	l, a
	ld	h, l
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	add.sis	hl, de
	ld	(ix - 27), l
	ld	(ix - 26), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 2
	ld	a, iyl
	call	__ladd
	ld	(ix - 17), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	ld	(ix - 45), hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ld	(ix - 4), l
	ld	bc, (ix - 6)
	ld	l, (ix - 27)
	ld	h, (ix - 26)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 17), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	l, (hl)
	ld	h, 0
	ld	(ix - 31), l
	ld	(ix - 30), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 1
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ld	a, iyl
	call	__ladd
                                        ; kill: def $e killed $e def $ude
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	a, (hl)
	ld	e, (ix - 31)
	ld	d, (ix - 30)
	ld	h, d
	ld	l, a
	ld	h, l
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	add.sis	hl, de
	ld	(ix - 31), l
	ld	(ix - 30), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 2
	ld	a, iyl
	call	__ladd
	ld	(ix - 17), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	ld	(ix - 48), hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ld	(ix - 3), l
	ld	bc, (ix - 5)
	ld	l, (ix - 31)
	ld	h, (ix - 30)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 17), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	l, (hl)
	ld	h, 0
	ld	(ix - 33), l
	ld	(ix - 32), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 1
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ld	a, iyl
	call	__ladd
                                        ; kill: def $e killed $e def $ude
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	a, (hl)
	ld	e, (ix - 33)
	ld	d, (ix - 32)
	ld	h, d
	ld	l, a
	ld	h, l
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	add.sis	hl, de
	ld	(ix - 33), l
	ld	(ix - 32), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 2
	ld	a, iyl
	call	__ladd
	ld	(ix - 17), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	ld	(ix - 51), hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ld	(ix - 2), l
	ld	bc, (ix - 4)
	ld	l, (ix - 33)
	ld	h, (ix - 32)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 17), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	l, (hl)
	ld	h, 0
	ld	(ix - 35), l
	ld	(ix - 34), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 1
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ld	a, iyl
	call	__ladd
                                        ; kill: def $e killed $e def $ude
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	a, (hl)
	ld	e, (ix - 35)
	ld	d, (ix - 34)
	ld	h, d
	ld	l, a
	ld	h, l
	push	hl
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ex	(sp), hl
	pop	iy
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	add.sis	hl, de
	ld	(ix - 35), l
	ld	(ix - 34), h
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	bc, 2
	ld	a, iyl
	call	__ladd
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 14), de
	push	de
	ld	(ix - 17), hl
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_virtual_ptr
	pop	de
	pop	de
	pop	de
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	ld	e, (ix + 9)
	cp	a, e
	jr	nz, .LBB3_6
; %bb.5:                                ;   in Loop: Header=BB3_3 Depth=2
	ld	a, (ix - 21)                    ; 1-byte Folded Reload
	or	a, a
	jp	z, .LBB3_10
	.local	.LBB3_6
.LBB3_6:                                ;   in Loop: Header=BB3_3 Depth=2
	ld	l, (ix - 10)
	ld	h, (ix - 9)
	ld	(ix - 1), l
	ld	bc, (ix - 3)
	ld	l, (ix - 35)
	ld	h, (ix - 34)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 17)
	ld	de, (ix - 14)
                                        ; kill: def $e killed $e killed $ude
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 14), hl
                                        ; kill: def $e killed $e def $ude
	ld	(ix - 17), de
	dec	(ix - 21)
	ld	l, (ix - 36)                    ; 1-byte Folded Reload
	dec	l
	jp	.LBB3_3
	.local	.LBB3_7
.LBB3_7:                                ;   in Loop: Header=BB3_1 Depth=1
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	inc	a
	ld	l, (ix - 28)                    ; 1-byte Folded Reload
	jp	.LBB3_1
	.local	.LBB3_8
.LBB3_8:
	ld	a, l
	.local	.LBB3_9
.LBB3_9:                                ; %.loopexit
	cp	a, l
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB3_10
.LBB3_10:
	ld	iy, (ix + 15)
	ld	bc, (ix - 39)
	ld	(iy), bc
	ld	bc, 0
	ld	c, (ix - 29)                    ; 1-byte Folded Reload
	ld	iy, (ix + 18)
	ld	(iy), bc
	ld	iy, (ix + 21)
	ld	a, e
	ld	de, (ix - 42)
	ld	(iy), de
	ld	e, (ix - 24)
	ld	d, (ix - 23)
	ld	c, e
	ld	b, d
	ld	iy, (ix + 24)
	ld	(iy), bc
	ld	iy, (ix + 27)
	ld	de, (ix - 45)
	ld	(iy), de
	ld	e, (ix - 27)
	ld	d, (ix - 26)
	ld	c, e
	ld	b, d
	ld	iy, (ix + 30)
	ld	(iy), bc
	ld	iy, (ix + 33)
	ld	de, (ix - 48)
	ld	(iy), de
	ld	e, (ix - 31)
	ld	d, (ix - 30)
	ld	c, e
	ld	b, d
	ld	iy, (ix + 36)
	ld	(iy), bc
	ld	iy, (ix + 39)
	ld	de, (ix - 51)
	ld	(iy), de
	ld	e, (ix - 33)
	ld	d, (ix - 32)
	ld	c, e
	ld	b, d
	ld	iy, (ix + 42)
	ld	(iy), bc
	ld	iy, (ix + 45)
	ld	(iy), hl
	or	a, a
	sbc	hl, hl
	ld	e, (ix - 35)
	ld	d, (ix - 34)
	ld	l, e
	ld	h, d
	ld	iy, (ix + 48)
	ld	(iy), hl
	ld	l, (ix - 28)                    ; 1-byte Folded Reload
	jp	.LBB3_9
	.local	.Lfunc_end3
.Lfunc_end3:
	.size	_get_node_data, .Lfunc_end3-_get_node_data
                                        ; -- End function
	.section	.text._print_compressed_string,"ax",@progbits
	.globl	_print_compressed_string        ; -- Begin function print_compressed_string
	.type	_print_compressed_string,@function
_print_compressed_string:               ; @print_compressed_string
; %bb.0:
	ld	hl, -1052
	call	__frameset
	ld	iy, (ix + 12)
	ld	hl, (ix + 15)
	push	ix
	ld	de, -1039
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	de, (ix + 21)
	ld	bc, 0
	push	de
	ld	de, -1030
	lea	hl, ix + 0
	add	hl, de
	pop	de
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 9
	ld	(ix + 0), hl
	pop	ix
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 12
	ld	(ix + 0), bc
	pop	ix
	.local	.LBB4_1
.LBB4_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_4 Depth 2
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB4_13
; %bb.2:                                ;   in Loop: Header=BB4_1 Depth=1
	ld	hl, (ix + 18)
	push	ix
	ld	de, -1042
	add	ix, de
	ld	(ix + 0), bc
	pop	ix
	add	hl, bc
	ld	e, (hl)
	ld	a, e
	dec	a
	cp	a, 24
	jp	nc, .LBB4_7
; %bb.3:                                ;   in Loop: Header=BB4_1 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _g_compression_dict
	add	hl, de
	ld	iy, (hl)
	push	ix
	ld	de, -1036
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	.local	.LBB4_4
.LBB4_4:                                ;   Parent Loop BB4_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	e, (iy)
	ld	a, e
	or	a, a
	jp	z, .LBB4_9
; %bb.5:                                ;   in Loop: Header=BB4_4 Depth=2
	push	ix
	ld	bc, -1036
	add	ix, bc
	ld	(ix + 0), iy
	pop	ix
	push	hl
	pop	iy
	ld	bc, 1023
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB4_10
; %bb.6:                                ;   in Loop: Header=BB4_4 Depth=2
	push	ix
	ld	bc, -1036
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	inc	hl
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 9
	ld	bc, (ix + 0)
	pop	ix
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 12
	ld	(ix + 0), bc
	pop	ix
	lea	bc, iy + 0
	push	hl
	pop	iy
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 12
	ld	hl, (ix + 0)
	pop	ix
	add	hl, bc
	inc	bc
	ld	(hl), e
	push	bc
	pop	hl
	jp	.LBB4_4
	.local	.LBB4_7
.LBB4_7:                                ;   in Loop: Header=BB4_1 Depth=1
	push	ix
	ld	bc, -1036
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	ld	bc, 1023
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB4_12
; %bb.8:                                ;   in Loop: Header=BB4_1 Depth=1
	push	ix
	ld	bc, -1033
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 12
	ld	bc, (ix + 0)
	pop	ix
	add	hl, bc
	inc	bc
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 12
	ld	(ix + 0), bc
	pop	ix
	ld	(hl), e
	jr	.LBB4_12
	.local	.LBB4_9
.LBB4_9:                                ;   in Loop: Header=BB4_1 Depth=1
	ld	de, -1036
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	jr	.LBB4_11
	.local	.LBB4_10
.LBB4_10:                               ;   in Loop: Header=BB4_1 Depth=1
	ld	de, -1036
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	.local	.LBB4_11
.LBB4_11:                               ; %.loopexit
                                        ;   in Loop: Header=BB4_1 Depth=1
	ld	iy, (ix + 12)
	.local	.LBB4_12
.LBB4_12:                               ; %.loopexit
                                        ;   in Loop: Header=BB4_1 Depth=1
	ld	de, -1042
	lea	hl, ix + 0
	add	hl, de
	ld	bc, (hl)
	inc	bc
	ld	de, (ix + 21)
	jp	.LBB4_1
	.local	.LBB4_13
.LBB4_13:
	ld	de, -1033
	lea	hl, ix + 0
	add	hl, de
	ld	bc, (hl)
	push	bc
	pop	hl
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 12
	ld	de, (ix + 0)
	pop	ix
	add	hl, de
	ld	(hl), 0
	push	ix
	ld	de, -1039
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	ld	de, -10
	add	hl, de
	push	ix
	ld	de, -1039
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	de, (ix + 6)
	add	iy, de
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 18
	ld	(ix + 0), iy
	pop	ix
	push	bc
	pop	iy
	ld	bc, -1036
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	de, (ix + 9)
	.local	.LBB4_14
.LBB4_14:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_15 Depth 2
                                        ;       Child Loop BB4_19 Depth 3
	ld	a, (iy)
	.local	.LBB4_15
.LBB4_15:                               ;   Parent Loop BB4_14 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB4_19 Depth 3
	ld	c, a
	or	a, a
	jp	z, .LBB4_41
; %bb.16:                               ;   in Loop: Header=BB4_15 Depth=2
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 9
	ld	(ix + 0), iy
	pop	ix
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 15
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, de
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 9
	ld	iy, (ix + 0)
	pop	ix
	call	pe, __setflag
	jp	m, .LBB4_41
; %bb.17:                               ;   in Loop: Header=BB4_15 Depth=2
	ld	a, c
	cp	a, 10
	jp	z, .LBB4_32
; %bb.18:                               ;   in Loop: Header=BB4_15 Depth=2
	ld	a, c
	cp	a, 32
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 21
	ld	(ix + 0), iy
	pop	ix
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 18
	ld	hl, (ix + 0)
	pop	ix
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 24
	ld	(ix + 0), de
	pop	ix
	jp	z, .LBB4_33
	.local	.LBB4_19
.LBB4_19:                               ; %.preheader
                                        ;   Parent Loop BB4_14 Depth=1
                                        ;     Parent Loop BB4_15 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ld	a, c
	or	a, a
	jr	z, .LBB4_23
; %bb.20:                               ; %.preheader
                                        ;   in Loop: Header=BB4_19 Depth=3
	ld	a, c
	cp	a, 10
	jr	z, .LBB4_23
; %bb.21:                               ; %.preheader
                                        ;   in Loop: Header=BB4_19 Depth=3
	ld	a, c
	cp	a, 32
	jr	z, .LBB4_23
; %bb.22:                               ;   in Loop: Header=BB4_19 Depth=3
	ld	de, -1045
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	pop	iy
	ld	c, (iy + 1)
	push	ix
	ld	de, -1033
	add	ix, de
	ld	iy, (ix + 0)
	pop	ix
	inc	hl
	push	ix
	ld	de, -1045
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	jr	.LBB4_19
	.local	.LBB4_23
.LBB4_23:                               ;   in Loop: Header=BB4_15 Depth=2
	ld	de, -1049
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), c                         ; 1-byte Folded Spill
	push	ix
	ld	de, -1045
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	ld	(hl), 0
	push	iy
	call	_gfx_GetStringWidth
	push	hl
	pop	iy
	pop	hl
	ld	de, -1052
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	bc, -1036
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	add	iy, de
	ld	hl, (ix + 6)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	a, -1
	jp	m, .LBB4_25
; %bb.24:                               ;   in Loop: Header=BB4_15 Depth=2
	ld	a, 0
	.local	.LBB4_25
.LBB4_25:                               ;   in Loop: Header=BB4_15 Depth=2
	lea	de, iy + 0
	ld	bc, -1042
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	l, -1
	ld	de, -1048
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	bc, (iy + 0)
	jp	m, .LBB4_27
; %bb.26:                               ;   in Loop: Header=BB4_15 Depth=2
	ld	l, 0
	.local	.LBB4_27
.LBB4_27:                               ;   in Loop: Header=BB4_15 Depth=2
	and	a, l
	ld	e, a
	push	bc
	pop	hl
	push	bc
	pop	iy
	ld	bc, 10
	add	hl, bc
	bit	0, e
	push	hl
	pop	bc
	jr	nz, .LBB4_29
; %bb.28:                               ;   in Loop: Header=BB4_15 Depth=2
	lea	bc, iy + 0
	.local	.LBB4_29
.LBB4_29:                               ;   in Loop: Header=BB4_15 Depth=2
	bit	0, e
	ld	hl, (ix + 6)
	ex	de, hl
	jr	nz, .LBB4_31
; %bb.30:                               ;   in Loop: Header=BB4_15 Depth=2
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 12
	ld	de, (iy + 0)
	.local	.LBB4_31
.LBB4_31:                               ;   in Loop: Header=BB4_15 Depth=2
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 15
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	push	bc
	push	de
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 9
	ld	hl, (iy + 0)
	push	hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 12
	ld	(iy + 0), bc
	ld	bc, -1033
	lea	iy, ix + 0
	push	af
	add	iy, bc
	pop	af
	ld	(iy + 0), de
	call	p, _gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	bc, -1052
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	bc, -1033
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	add	hl, de
	ld	de, -1049
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	push	ix
	ld	de, -1045
	add	ix, de
	ld	iy, (ix + 0)
	pop	ix
	ld	(iy), a
	push	ix
	ld	bc, -1036
	add	ix, bc
	ld	de, (ix + 0)
	pop	ix
	push	ix
	add	ix, bc
	ld	(ix + 0), hl
	pop	ix
	jp	.LBB4_15
	.local	.LBB4_32
.LBB4_32:                               ;   in Loop: Header=BB4_14 Depth=1
	ex	de, hl
	ld	de, 10
	add	hl, de
	ld	de, (ix + 6)
	jr	.LBB4_39
	.local	.LBB4_33
.LBB4_33:                               ;   in Loop: Header=BB4_14 Depth=1
	ld	hl, 32
	push	hl
	call	_gfx_GetCharWidth
	push	ix
	ld	de, -1042
	add	ix, de
	ld	iy, (ix + 0)
	pop	ix
	pop	de
	push	ix
	ld	bc, -1036
	add	ix, bc
	ld	de, (ix + 0)
	pop	ix
	add	hl, de
	ex	de, hl
	lea	hl, iy + 0
	ld	bc, -1045
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	a, -1
	jp	m, .LBB4_35
; %bb.34:                               ;   in Loop: Header=BB4_14 Depth=1
	ld	a, 0
	.local	.LBB4_35
.LBB4_35:                               ;   in Loop: Header=BB4_14 Depth=1
	ld	bc, -1048
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	pop	hl
	ld	bc, 10
	add	hl, bc
	bit	0, a
	jr	nz, .LBB4_37
; %bb.36:                               ;   in Loop: Header=BB4_14 Depth=1
	ex	de, hl
	.local	.LBB4_37
.LBB4_37:                               ;   in Loop: Header=BB4_14 Depth=1
	bit	0, a
	ld	bc, (ix + 6)
	ld	de, -1036
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	(iy + 0), bc
	jr	nz, .LBB4_40
; %bb.38:                               ;   in Loop: Header=BB4_14 Depth=1
	ld	bc, -1045
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	.local	.LBB4_39
.LBB4_39:                               ;   in Loop: Header=BB4_14 Depth=1
	ld	bc, -1036
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	.local	.LBB4_40
.LBB4_40:                               ;   in Loop: Header=BB4_14 Depth=1
	push	ix
	ld	de, -1033
	add	ix, de
	ld	iy, (ix + 0)
	pop	ix
	inc	iy
	ex	de, hl
	jp	.LBB4_14
	.local	.LBB4_41
.LBB4_41:
	ex	de, hl
	ld	de, 10
	add	hl, de
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end4
.Lfunc_end4:
	.size	_print_compressed_string, .Lfunc_end4-_print_compressed_string
                                        ; -- End function
	.section	.text._gui_init,"ax",@progbits
	.globl	_gui_init                       ; -- Begin function gui_init
	.type	_gui_init,@function
_gui_init:                              ; @gui_init
; %bb.0:
	call	_gfx_Begin
	ld	hl, 1
	push	hl
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 255
	push	hl
	call	_gfx_SetTextBGColor
	pop	hl
	ld	hl, 255
	push	hl
	call	_gfx_SetTextTransparentColor
	pop	hl
	ret
	.local	.Lfunc_end5
.Lfunc_end5:
	.size	_gui_init, .Lfunc_end5-_gui_init
                                        ; -- End function
	.section	.text._gui_cleanup,"ax",@progbits
	.globl	_gui_cleanup                    ; -- Begin function gui_cleanup
	.type	_gui_cleanup,@function
_gui_cleanup:                           ; @gui_cleanup
; %bb.0:
	jp	_gfx_End
	.local	.Lfunc_end6
.Lfunc_end6:
	.size	_gui_cleanup, .Lfunc_end6-_gui_cleanup
                                        ; -- End function
	.section	.text._print_centered,"ax",@progbits
	.globl	_print_centered                 ; -- Begin function print_centered
	.type	_print_centered,@function
_print_centered:                        ; @print_centered
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, 320
	or	a, a
	sbc	hl, de
	push	hl
	pop	iy
	add	hl, hl
	sbc	hl, hl
	add	hl, hl
	ccf
	sbc	hl, hl
	inc	hl
	ex	de, hl
	add	iy, de
	lea	hl, iy + 0
	call	__ishrs_1
	push	hl
	pop	de
	call	__ineg
	xor	a, a
	bit	0, a
	jr	nz, .LBB7_2
; %bb.1:
	ex	de, hl
	.local	.LBB7_2
.LBB7_2:
	ld	de, (ix + 9)
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_PrintStringXY
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end7
.Lfunc_end7:
	.size	_print_centered, .Lfunc_end7-_print_centered
                                        ; -- End function
	.section	.text._gui_splash,"ax",@progbits
	.globl	_gui_splash                     ; -- Begin function gui_splash
	.type	_gui_splash,@function
_gui_splash:                            ; @gui_splash
; %bb.0:
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 255
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 100
	push	hl
	ld	hl, _.str.25
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	hl, 120
	push	hl
	ld	hl, _.str.1.26
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	hl, 140
	push	hl
	ld	hl, _.str.2.27
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	hl, 100
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 160
	push	hl
	ld	hl, _.str.3.28
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	ld	hl, 1500
	push	hl
	call	_delay
	pop	hl
	ret
	.local	.Lfunc_end8
.Lfunc_end8:
	.size	_gui_splash, .Lfunc_end8-_gui_splash
                                        ; -- End function
	.section	.text._gui_terms_loop,"ax",@progbits
	.globl	_gui_terms_loop                 ; -- Begin function gui_terms_loop
	.type	_gui_terms_loop,@function
_gui_terms_loop:                        ; @gui_terms_loop
; %bb.0:
	ld	hl, -69
	call	__frameset
	ld	c, 0
	or	a, a
	sbc	hl, hl
	ld	b, 1
	lea	de, ix - 32
	ld	(ix - 45), de
	ld	(ix - 54), hl
	ld	(ix - 39), hl
	.local	.LBB9_1
.LBB9_1:                                ; %.loopexit
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_3 Depth 2
                                        ;     Child Loop BB9_15 Depth 2
                                        ;     Child Loop BB9_55 Depth 2
	ld	(ix - 36), hl
	ld	(ix - 33), c                    ; 1-byte Folded Spill
	bit	0, b
	jp	z, .LBB9_32
; %bb.2:                                ;   in Loop: Header=BB9_1 Depth=1
	ld	a, (_dark_mode)
	ld	l, a
	dec	l
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	dec	l
	push	hl
	call	_gfx_SetTextBGColor
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	dec	l
	push	hl
	call	_gfx_SetTextTransparentColor
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	xor	a, a
	sub	a, l
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 20
	push	hl
	ld	hl, 320
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	dec	l
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 6
	push	hl
	dec	hl
	push	hl
	ld	hl, _.str.4.29
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	bc, (ix - 54)
	ld	a, 65
	ld	iy, 5
	.local	.LBB9_3
.LBB9_3:                                ;   Parent Loop BB9_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lea	hl, iy + 0
	ld	de, 317
	or	a, a
	sbc	hl, de
	jp	z, .LBB9_12
; %bb.4:                                ;   in Loop: Header=BB9_3 Depth=2
	ld	(ix - 51), a                    ; 1-byte Folded Spill
	ld	(ix - 32), a
	ld	(ix - 31), 0
	ld	a, (_dark_mode)
	bit	0, (ix - 33)                    ; 1-byte Folded Reload
	ld	(ix - 42), iy
	ld	(ix - 48), bc
	jr	z, .LBB9_9
; %bb.5:                                ;   in Loop: Header=BB9_3 Depth=2
	sbc	hl, hl
	adc	hl, bc
	jr	nz, .LBB9_9
; %bb.6:                                ;   in Loop: Header=BB9_3 Depth=2
	bit	0, a
	ld	a, -106
	ld	l, a
	jr	nz, .LBB9_8
; %bb.7:                                ;   in Loop: Header=BB9_3 Depth=2
	ld	a, -76
	ld	l, a
	.local	.LBB9_8
.LBB9_8:                                ;   in Loop: Header=BB9_3 Depth=2
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 42)
	ld	de, -2
	add	hl, de
	ld	de, 11
	push	de
	dec	de
	push	de
	ld	de, 20
	push	de
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	xor	a, a
	sub	a, l
	ld	l, a
	jr	.LBB9_11
	.local	.LBB9_9
.LBB9_9:                                ;   in Loop: Header=BB9_3 Depth=2
	bit	0, a
	ld	a, -76
	ld	l, a
	jr	nz, .LBB9_11
; %bb.10:                               ;   in Loop: Header=BB9_3 Depth=2
	ld	a, 100
	ld	l, a
	.local	.LBB9_11
.LBB9_11:                               ;   in Loop: Header=BB9_3 Depth=2
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 22
	push	hl
	ld	hl, (ix - 42)
	push	hl
	pea	ix - 32
	call	_gfx_PrintStringXY
	ld	iy, (ix - 42)
	pop	hl
	pop	hl
	pop	hl
	ld	de, 12
	add	iy, de
	ld	a, (ix - 51)                    ; 1-byte Folded Reload
	inc	a
	ld	bc, (ix - 48)
	dec	bc
	jp	.LBB9_3
	.local	.LBB9_12
.LBB9_12:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 39)
	ld	bc, 30
	call	__imulu
	push	hl
	pop	de
	ld	bc, 174
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	push	de
	pop	hl
	jp	p, .LBB9_14
; %bb.13:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, 173
	.local	.LBB9_14
.LBB9_14:                               ;   in Loop: Header=BB9_1 Depth=1
	or	a, a
	sbc	hl, de
	ld	(ix - 51), hl
	ld	hl, (ix - 39)
	ld	bc, 90
	call	__imulu
	ex	de, hl
	ld	hl, _search_terms
	push	hl
	pop	iy
	add	iy, de
	ld	de, 0
	push	de
	pop	hl
	.local	.LBB9_15
.LBB9_15:                               ;   Parent Loop BB9_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 48), hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB9_31
; %bb.16:                               ;   in Loop: Header=BB9_15 Depth=2
	push	de
	pop	hl
	ld	(ix - 42), de
	ld	de, (ix - 51)
	or	a, a
	sbc	hl, de
	ld	de, (ix - 42)
	jp	z, .LBB9_31
; %bb.17:                               ;   in Loop: Header=BB9_15 Depth=2
	ld	(ix - 57), iy
	push	de
	pop	hl
	ld	bc, 15
	or	a, a
	sbc	hl, bc
	push	de
	pop	iy
	jr	c, .LBB9_19
; %bb.18:                               ;   in Loop: Header=BB9_15 Depth=2
	push	de
	pop	iy
	ld	de, -15
	add	iy, de
	ld	de, (ix - 42)
	.local	.LBB9_19
.LBB9_19:                               ;   in Loop: Header=BB9_15 Depth=2
	ex	de, hl
	or	a, a
	sbc	hl, bc
	ld	hl, 155
	jr	nc, .LBB9_21
; %bb.20:                               ;   in Loop: Header=BB9_15 Depth=2
	or	a, a
	sbc	hl, hl
	.local	.LBB9_21
.LBB9_21:                               ;   in Loop: Header=BB9_15 Depth=2
	ld	(ix - 66), hl
	add	hl, bc
	ld	(ix - 60), hl
	lea	hl, iy + 0
	ld	bc, 12
	call	__imulu
	push	hl
	pop	bc
	ld	de, 40
	add	hl, de
	ld	(ix - 63), hl
	ld	a, (_dark_mode)
	bit	0, (ix - 33)                    ; 1-byte Folded Reload
	jr	nz, .LBB9_23
; %bb.22:                               ;   in Loop: Header=BB9_15 Depth=2
	ld	hl, (ix - 42)
	ld	de, (ix - 36)
	or	a, a
	sbc	hl, de
	jr	z, .LBB9_25
	.local	.LBB9_23
.LBB9_23:                               ;   in Loop: Header=BB9_15 Depth=2
	bit	0, a
	ld	a, -56
	ld	l, a
	jr	nz, .LBB9_28
; %bb.24:                               ;   in Loop: Header=BB9_15 Depth=2
	ld	a, 80
	ld	l, a
	jr	.LBB9_28
	.local	.LBB9_25
.LBB9_25:                               ;   in Loop: Header=BB9_15 Depth=2
	ld	(ix - 69), bc
	bit	0, a
	ld	a, 100
	ld	l, a
	jr	nz, .LBB9_27
; %bb.26:                               ;   in Loop: Header=BB9_15 Depth=2
	ld	a, -56
	ld	l, a
	.local	.LBB9_27
.LBB9_27:                               ;   in Loop: Header=BB9_15 Depth=2
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	de, 10
	ld	hl, (ix - 66)
	add	hl, de
	push	hl
	pop	bc
	ld	de, 38
	ld	iy, (ix - 69)
	add	iy, de
	ld	hl, 12
	push	hl
	ld	hl, 145
	push	hl
	push	iy
	push	bc
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	xor	a, a
	sub	a, l
	ld	l, a
	.local	.LBB9_28
.LBB9_28:                               ;   in Loop: Header=BB9_15 Depth=2
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, (ix - 57)
	ld	de, (ix - 48)
	add	hl, de
	ld	de, (hl)
	ld	(ix - 66), de
	ld	hl, 20
	push	hl
	push	de
	ld	hl, (ix - 45)
	push	hl
	call	_strncpy
	pop	hl
	pop	hl
	pop	hl
	ld	(ix - 12), 0
	ld	hl, (ix - 66)
	push	hl
	call	_strlen
	pop	de
	ld	de, 21
	or	a, a
	sbc	hl, de
	jr	c, .LBB9_30
; %bb.29:                               ;   in Loop: Header=BB9_15 Depth=2
	ld	hl, (ix - 45)
	push	hl
	call	_strlen
	ex	de, hl
	pop	hl
	ld	iy, (ix - 45)
	add	iy, de
	ld	hl, _.str.5.30
	ld	a, (hl)
	ld	(iy), a
	ld	a, (_.str.5.30+1)
	ld	(iy + 1), a
	ld	a, (_.str.5.30+2)
	ld	(iy + 2), a
	.local	.LBB9_30
.LBB9_30:                               ;   in Loop: Header=BB9_15 Depth=2
	ld	hl, (ix - 63)
	push	hl
	ld	hl, (ix - 60)
	push	hl
	ld	hl, (ix - 45)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	bc, (ix - 42)
	inc	bc
	ld	hl, (ix - 48)
	ld	de, 3
	add	hl, de
	push	bc
	pop	de
	ld	bc, 90
	ld	iy, (ix - 57)
	jp	.LBB9_15
	.local	.LBB9_31
.LBB9_31:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	a, (_dark_mode)
	ld	l, a
	xor	a, a
	sub	a, l
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 320
	push	hl
	ld	hl, 222
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_HorizLine
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 39)
	inc	hl
	ld	de, 6
	push	de
	push	hl
	ld	hl, _.str.6.31
	push	hl
	ld	hl, (ix - 45)
	push	hl
	call	_sprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	xor	a, a
	sub	a, l
	ld	l, a
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 226
	push	hl
	ld	hl, 220
	push	hl
	ld	hl, (ix - 45)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB9_32
.LBB9_32:                               ;   in Loop: Header=BB9_1 Depth=1
	call	_kb_Scan
	call	_os_GetCSC
	dec	a
	cp	a, 15
	ld	c, (ix - 33)                    ; 1-byte Folded Reload
	ld	b, 0
	ld	hl, (ix - 36)
	push	hl
	pop	de
	jp	nc, .LBB9_1
; %bb.33:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	bc, 0
	ld	c, a
	ld	hl, JTI9_0
	add	hl, bc
	add	hl, bc
	add	hl, bc
	ld	iy, (hl)
	ld	c, (ix - 33)                    ; 1-byte Folded Reload
	push	de
	pop	hl
	jp	(iy)
	.local	.LBB9_34
.LBB9_34:                               ;   in Loop: Header=BB9_1 Depth=1
	bit	0, (ix - 33)                    ; 1-byte Folded Reload
	ld	c, 0
	ld	b, 1
	ld	hl, 0
	jp	nz, .LBB9_1
; %bb.35:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	iy, 0
	push	de
	pop	hl
	ld	bc, 29
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB9_67
; %bb.36:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 39)
	ld	bc, 30
	call	__imulu
	push	de
	pop	bc
	add	hl, bc
	ld	bc, 172
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB9_67
; %bb.37:                               ;   in Loop: Header=BB9_1 Depth=1
	inc	de
	ld	c, (ix - 33)                    ; 1-byte Folded Reload
	ld	b, 1
	ex	de, hl
	jp	.LBB9_1
	.local	.LBB9_38
.LBB9_38:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	c, (ix - 33)                    ; 1-byte Folded Reload
	bit	0, c
	jp	z, .LBB9_58
; %bb.39:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 54)
	ld	de, 25
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	de, 1
	jp	m, .LBB9_41
; %bb.40:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	de, 0
	.local	.LBB9_41
.LBB9_41:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 54)
	add	hl, de
	ld	(ix - 54), hl
	jp	.LBB9_73
	.local	.LBB9_42
.LBB9_42:                               ;   in Loop: Header=BB9_1 Depth=1
	bit	0, (ix - 33)                    ; 1-byte Folded Reload
	jr	nz, .LBB9_44
; %bb.43:                               ;   in Loop: Header=BB9_1 Depth=1
	push	de
	pop	iy
	lea	hl, iy + 0
	ld	de, 2
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	c, 1
	ld	b, c
	lea	hl, iy + 0
	jp	m, .LBB9_1
	.local	.LBB9_44
.LBB9_44:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	c, (ix - 33)                    ; 1-byte Folded Reload
	bit	0, c
	jp	z, .LBB9_66
; %bb.45:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 39)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	a, -1
	ld	bc, (ix - 36)
	jp	p, .LBB9_47
; %bb.46:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	a, 0
	.local	.LBB9_47
.LBB9_47:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	l, a
	rrc	l
	sbc	hl, hl
	ex	de, hl
	ld	hl, (ix - 39)
	add	hl, de
	ld	(ix - 39), hl
	bit	0, a
	ld	hl, 29
	jp	nz, .LBB9_71
; %bb.48:                               ;   in Loop: Header=BB9_1 Depth=1
	push	bc
	pop	hl
	jp	.LBB9_71
	.local	.LBB9_49
.LBB9_49:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	a, (ix - 33)                    ; 1-byte Folded Reload
	bit	0, a
	jp	z, .LBB9_62
; %bb.50:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 54)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	de, -1
	jp	p, .LBB9_52
; %bb.51:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	de, 0
	.local	.LBB9_52
.LBB9_52:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 54)
	add	hl, de
	ld	(ix - 54), hl
	ld	c, a
	jp	.LBB9_73
	.local	.LBB9_53
.LBB9_53:                               ;   in Loop: Header=BB9_1 Depth=1
	bit	0, (ix - 33)                    ; 1-byte Folded Reload
	jp	z, .LBB9_75
; %bb.54:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 54)
	ld	a, 16
	ld	c, a
	call	__ishl
	ld	bc, 6356992
	add	hl, bc
	ld	c, a
	call	__ishrs
	ld	(ix - 48), hl
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	e, h
	ld	(ix - 42), bc
	.local	.LBB9_55
.LBB9_55:                               ;   Parent Loop BB9_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	hl
	pop	iy
	ld	bc, 519
	or	a, a
	sbc	hl, bc
	jp	z, .LBB9_72
; %bb.56:                               ;   in Loop: Header=BB9_55 Depth=2
	ld	hl, _search_terms
	lea	bc, iy + 0
	add	hl, bc
	ld	hl, (hl)
	ld	a, (hl)
	ld	l, a
	rlc	l
	sbc	hl, hl
	ld	l, a
	ld	bc, (ix - 48)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB9_74
; %bb.57:                               ;   in Loop: Header=BB9_55 Depth=2
	ld	hl, (ix - 42)
	inc	hl
	ld	(ix - 42), hl
	inc	e
	ld	bc, 3
	add	iy, bc
	lea	hl, iy + 0
	jr	.LBB9_55
	.local	.LBB9_58
.LBB9_58:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	iy, (ix - 36)
	lea	hl, iy + 0
	ld	de, 15
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	b, 1
	lea	de, iy + 0
	lea	hl, iy + 0
	jp	p, .LBB9_1
; %bb.59:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 39)
	ld	bc, 30
	call	__imulu
	push	de
	pop	bc
	add	hl, bc
	push	bc
	pop	iy
	ld	de, 15
	add	iy, de
	ld	de, 158
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	push	bc
	pop	hl
	jp	m, .LBB9_61
; %bb.60:                               ;   in Loop: Header=BB9_1 Depth=1
	push	hl
	pop	iy
	.local	.LBB9_61
.LBB9_61:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	c, (ix - 33)                    ; 1-byte Folded Reload
	jr	.LBB9_65
	.local	.LBB9_62
.LBB9_62:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	bc, (ix - 36)
	push	bc
	pop	iy
	ld	de, -15
	add	iy, de
	push	bc
	pop	hl
	ld	de, 15
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB9_64
; %bb.63:                               ;   in Loop: Header=BB9_1 Depth=1
	push	bc
	pop	iy
	.local	.LBB9_64
.LBB9_64:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	c, a
	.local	.LBB9_65
.LBB9_65:                               ; %.loopexit
                                        ;   in Loop: Header=BB9_1 Depth=1
	ld	b, 1
	lea	hl, iy + 0
	jp	.LBB9_1
	.local	.LBB9_66
.LBB9_66:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 36)
	dec	hl
	ld	b, 1
	jp	.LBB9_1
	.local	.LBB9_67
.LBB9_67:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 39)
	ld	bc, 5
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	jp	m, .LBB9_69
; %bb.68:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	c, 0
	.local	.LBB9_69
.LBB9_69:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	a, c
	and	a, 1
	lea	de, iy + 0
	ld	e, a
	ld	hl, (ix - 39)
	add	hl, de
	ld	(ix - 39), hl
	bit	0, c
	ld	hl, 0
	jr	nz, .LBB9_71
; %bb.70:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, (ix - 36)
	.local	.LBB9_71
.LBB9_71:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	c, (ix - 33)                    ; 1-byte Folded Reload
	ld	b, 1
	jp	.LBB9_1
	.local	.LBB9_72
.LBB9_72:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	c, (ix - 33)                    ; 1-byte Folded Reload
	.local	.LBB9_73
.LBB9_73:                               ; %.loopexit
                                        ;   in Loop: Header=BB9_1 Depth=1
	ld	b, 1
	ld	hl, (ix - 36)
	jp	.LBB9_1
	.local	.LBB9_74
.LBB9_74:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	b, e
	ld	c, 30
	call	__bdivu
	ld	de, 0
	ld	e, a
	ld	hl, (ix - 42)
	ld	bc, 30
	call	__iremu
	ld	c, b
	inc	b
	ld	(ix - 39), de
	jp	.LBB9_1
	.local	.LBB9_75
.LBB9_75:
	ld	hl, (ix - 39)
	ld	bc, 30
	call	__imulu
	ld	de, (ix - 36)
	add	hl, de
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _search_terms
	add	hl, de
	ld	hl, (hl)
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_strcpy
	pop	hl
	pop	hl
	ld	hl, (ix + 9)
	push	hl
	call	_strlen
	pop	de
	ld	iy, (ix + 12)
	ld	(iy), hl
	.local	.LBB9_76
.LBB9_76:                               ; %.loopexit4
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end9
.Lfunc_end9:
	.size	_gui_terms_loop, .Lfunc_end9-_gui_terms_loop
	.section	.rodata._gui_terms_loop,"a",@progbits
JTI9_0:
	d24	.LBB9_34
	d24	.LBB9_49
	d24	.LBB9_38
	d24	.LBB9_42
	d24	.LBB9_1
	d24	.LBB9_1
	d24	.LBB9_1
	d24	.LBB9_1
	d24	.LBB9_53
	d24	.LBB9_1
	d24	.LBB9_1
	d24	.LBB9_1
	d24	.LBB9_1
	d24	.LBB9_1
	d24	.LBB9_76
                                        ; -- End function
	.section	.text._gui_search_loop,"ax",@progbits
	.globl	_gui_search_loop                ; -- Begin function gui_search_loop
	.type	_gui_search_loop,@function
_gui_search_loop:                       ; @gui_search_loop
; %bb.0:
	ld	hl, -180
	call	__frameset
	ld	iy, 0
	lea	hl, ix - 46
	lea	de, ix - 52
	push	ix
	lea	ix, ix - 128
	ld	(ix - 19), de
	pop	ix
	lea	de, ix - 55
	push	ix
	lea	ix, ix - 128
	ld	(ix - 22), de
	pop	ix
	lea	de, ix - 58
	push	ix
	lea	ix, ix - 128
	ld	(ix - 25), de
	pop	ix
	lea	de, ix - 61
	push	ix
	lea	ix, ix - 128
	ld	(ix - 28), de
	pop	ix
	lea	de, ix - 64
	push	ix
	lea	ix, ix - 128
	ld	(ix - 31), de
	pop	ix
	lea	de, ix - 67
	push	ix
	lea	ix, ix - 128
	ld	(ix - 34), de
	pop	ix
	lea	de, ix - 70
	push	ix
	lea	ix, ix - 128
	ld	(ix - 37), de
	pop	ix
	lea	de, ix - 73
	push	ix
	lea	ix, ix - 128
	ld	(ix - 40), de
	pop	ix
	lea	de, ix - 76
	push	ix
	lea	ix, ix - 128
	ld	(ix - 43), de
	pop	ix
	lea	de, ix - 79
	push	ix
	lea	ix, ix - 128
	ld	(ix - 46), de
	pop	ix
	lea	de, ix - 82
	push	ix
	lea	ix, ix - 128
	ld	(ix - 49), de
	pop	ix
	lea	de, ix - 85
	push	ix
	lea	ix, ix - 128
	ld	(ix - 52), de
	pop	ix
	lea	de, ix - 117
	ld	(ix - 126), de
	ld	(ix - 46), 0
	push	hl
	pop	de
	inc	de
	ld	bc, 39
	push	ix
	lea	ix, ix - 128
	ld	(ix - 16), de
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 10), hl
	pop	ix
	ldir
	ld	(ix - 49), iy
	call	_rand
	ld	bc, 5
	call	__irems
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	xor	a, a
	ld	(ix - 123), a                   ; 1-byte Folded Spill
	sbc	hl, hl
	ld	(ix - 122), hl
	ld	d, 1
	ld	bc, -141
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	.local	.LBB10_1
.LBB10_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_2 Depth 2
                                        ;       Child Loop BB10_3 Depth 3
                                        ;       Child Loop BB10_75 Depth 3
	ld	hl, _.str.7.32
	ld	bc, -129
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	.local	.LBB10_2
.LBB10_2:                               ;   Parent Loop BB10_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB10_3 Depth 3
                                        ;       Child Loop BB10_75 Depth 3
	ld	a, 1
	.local	.LBB10_3
.LBB10_3:                               ;   Parent Loop BB10_1 Depth=1
                                        ;     Parent Loop BB10_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ld	(ix - 119), d                   ; 1-byte Folded Spill
	bit	0, a
	jp	z, .LBB10_24
; %bb.4:                                ;   in Loop: Header=BB10_3 Depth=3
	ld	a, (_stealth_mode)
	bit	0, a
	jr	z, .LBB10_6
; %bb.5:                                ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, 255
	push	hl
	call	_gfx_FillScreen
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 5
	push	hl
	push	hl
	ld	hl, _.str.13.33
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 20
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.14.34
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 35
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.15.35
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 50
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.16.36
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 65
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.17.37
	push	hl
	call	_gfx_PrintStringXY
	jp	.LBB10_19
	.local	.LBB10_6
.LBB10_6:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	a, (_dark_mode)
	ld	l, a
	dec	l
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	xor	a, a
	sub	a, l
	ld	l, a
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	dec	l
	push	hl
	call	_gfx_SetTextBGColor
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	dec	l
	push	hl
	call	_gfx_SetTextTransparentColor
	pop	hl
	bit	0, (ix - 123)                   ; 1-byte Folded Reload
	jp	z, .LBB10_20
; %bb.7:                                ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, 10
	push	hl
	push	hl
	ld	hl, _.str.26
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 52)
	ld	de, (ix - 70)
	push	de
	push	hl
	ld	hl, 210
	push	hl
	ld	hl, 300
	push	hl
	ld	hl, 20
	push	hl
	ld	hl, 10
	push	hl
	call	_print_compressed_string
	pop	de
	pop	de
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, 5
	add	hl, de
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	a, (_dark_mode)
	ld	l, a
	xor	a, a
	sub	a, l
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 20
	push	hl
	ld	hl, 320
	push	hl
	ld	hl, 220
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	dec	l
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, (ix - 122)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, _.str.27
	jr	z, .LBB10_9
; %bb.8:                                ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.28
	.local	.LBB10_9
.LBB10_9:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	de, 225
	push	de
	ld	de, 5
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 122)
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	hl, _.str.29
	jr	z, .LBB10_11
; %bb.10:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.30
	.local	.LBB10_11
.LBB10_11:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	de, 225
	push	de
	ld	de, 65
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 122)
	ld	de, 2
	or	a, a
	sbc	hl, de
	ld	hl, _.str.31
	jr	z, .LBB10_13
; %bb.12:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.32
	.local	.LBB10_13
.LBB10_13:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	de, 225
	push	de
	ld	de, 125
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 122)
	ld	de, 3
	or	a, a
	sbc	hl, de
	ld	hl, _.str.33
	jr	z, .LBB10_15
; %bb.14:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.34
	.local	.LBB10_15
.LBB10_15:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	de, 225
	push	de
	ld	de, 185
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 122)
	ld	de, 4
	or	a, a
	sbc	hl, de
	ld	hl, _.str.35
	jr	z, .LBB10_17
; %bb.16:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.36
	.local	.LBB10_17
.LBB10_17:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	de, 225
	push	de
	ld	de, 245
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	xor	a, a
	sub	a, l
	ld	l, a
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	dec	l
	push	hl
	call	_gfx_SetTextBGColor
	pop	hl
	ld	hl, (ix - 122)
	ld	de, 5
	or	a, a
	sbc	hl, de
	ld	hl, _.str.37
	ld	de, 0
	jp	c, .LBB10_47
	.local	.LBB10_18
.LBB10_18:                              ;   in Loop: Header=BB10_3 Depth=3
	push	de
	push	hl
	ld	hl, 210
	push	hl
	ld	hl, 300
	push	hl
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, 10
	push	hl
	call	_print_compressed_string
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB10_19
.LBB10_19:                              ;   in Loop: Header=BB10_3 Depth=3
	pop	hl
	jp	.LBB10_23
	.local	.LBB10_20
.LBB10_20:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, 10
	push	hl
	push	hl
	ld	hl, _.str.18.38
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	bit	0, (ix - 119)                   ; 1-byte Folded Reload
	ld	hl, _.str.19.39
	jr	nz, .LBB10_22
; %bb.21:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.20.40
	.local	.LBB10_22
.LBB10_22:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	de, 10
	push	de
	ld	de, 300
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 30
	push	hl
	ld	hl, 10
	push	hl
	ld	de, -129
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 50
	push	hl
	ld	hl, 10
	push	hl
	ld	hl, _.str.21.41
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 50
	push	hl
	ld	hl, 60
	push	hl
	ld	de, -138
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 160
	push	hl
	ld	hl, 10
	push	hl
	ld	hl, _.str.22.42
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 175
	push	hl
	ld	hl, 10
	push	hl
	ld	hl, _.str.23.43
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 190
	push	hl
	ld	hl, 10
	push	hl
	ld	hl, _.str.24.44
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	de, -141
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.25.45
	push	hl
	ld	hl, (ix - 126)
	push	hl
	call	_sprintf
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 215
	push	hl
	ld	hl, (ix - 126)
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, ___const.gui_search_loop.trivia
	add	hl, de
	ld	hl, (hl)
	ld	de, 230
	push	de
	push	hl
	call	_print_centered
	.local	.LBB10_23
.LBB10_23:                              ;   in Loop: Header=BB10_3 Depth=3
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB10_24
.LBB10_24:                              ;   in Loop: Header=BB10_3 Depth=3
	call	_kb_Scan
	call	_os_GetCSC
	ld	e, a
	ld	bc, 0
	ld	a, (_stealth_mode)
	ld	l, a
	ld	a, e
	cp	a, 32
	jp	z, .LBB10_61
; %bb.25:                               ;   in Loop: Header=BB10_3 Depth=3
	bit	0, l
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	ld	a, 0
	ld	iy, (ix + 6)
	jp	nz, .LBB10_3
; %bb.26:                               ;   in Loop: Header=BB10_3 Depth=3
	bit	0, (ix - 123)                   ; 1-byte Folded Reload
	jr	z, .LBB10_36
; %bb.27:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	a, e
	cp	a, 15
	jp	z, .LBB10_101
; %bb.28:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	l, -49
	ld	a, e
	add	a, l
	ld	l, a
	cp	a, 5
	jp	c, .LBB10_49
; %bb.29:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	a, e
	cp	a, 3
	jr	nz, .LBB10_31
; %bb.30:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, (ix - 122)
	ld	bc, 4
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB10_67
	.local	.LBB10_31
.LBB10_31:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, (ix - 122)
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	l, -1
	jp	p, .LBB10_33
; %bb.32:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	l, 0
	.local	.LBB10_33
.LBB10_33:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	a, e
	cp	a, 2
	ld	a, -1
	jr	z, .LBB10_35
; %bb.34:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	a, 0
	.local	.LBB10_35
.LBB10_35:                              ;   in Loop: Header=BB10_3 Depth=3
	and	a, l
	ld	iyl, a
	lea	hl, iy + 0
	ld	c, 23
	call	__ishl
	add	hl, hl
	sbc	hl, hl
	ex	de, hl
	ld	hl, (ix - 122)
	add	hl, de
	ld	(ix - 122), hl
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	jp	.LBB10_3
	.local	.LBB10_36
.LBB10_36:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	a, e
	cp	a, 15
	jp	z, .LBB10_102
; %bb.37:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, (ix - 49)
	ld	a, e
	cp	a, 9
	push	ix
	lea	ix, ix - 128
	ld	(ix - 4), hl
	pop	ix
	jr	nz, .LBB10_39
; %bb.38:                               ;   in Loop: Header=BB10_3 Depth=3
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 4)
	pop	ix
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 4)
	pop	ix
	dec	bc
	call	pe, __setflag
	jp	p, .LBB10_63
	.local	.LBB10_39
.LBB10_39:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	l, -48
	ld	a, e
	add	a, l
	ld	l, a
	cp	a, 8
	jp	c, .LBB10_51
	.local	.LBB10_40
.LBB10_40:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	a, e
	cp	a, 56
	jr	nz, .LBB10_42
; %bb.41:                               ;   in Loop: Header=BB10_3 Depth=3
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 4
	ld	hl, (iy + 0)
	push	bc
	pop	iy
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	lea	bc, iy + 0
	call	pe, __setflag
	jp	p, .LBB10_68
	.local	.LBB10_42
.LBB10_42:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	a, e
	dec	a
	cp	a, 59
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	ld	a, 0
	jp	nc, .LBB10_3
; %bb.43:                               ;   in Loop: Header=BB10_3 Depth=3
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 4
	ld	hl, (iy + 0)
	push	bc
	pop	iy
	ld	bc, 19
	or	a, a
	sbc	hl, bc
	lea	bc, iy + 0
	call	pe, __setflag
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	jp	p, .LBB10_3
; %bb.44:                               ;   in Loop: Header=BB10_3 Depth=3
	bit	0, (ix - 119)                   ; 1-byte Folded Reload
	ld	hl, ___const.gui_search_loop.chars_alpha
	jr	nz, .LBB10_46
; %bb.45:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, ___const.gui_search_loop.chars_normal
	.local	.LBB10_46
.LBB10_46:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	c, e
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	ld	a, 0
	jp	z, .LBB10_3
	jp	.LBB10_84
	.local	.LBB10_47
.LBB10_47:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, JTI10_0
	ld	de, (ix - 122)
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB10_48
.LBB10_48:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, (ix - 55)
	ld	de, (ix - 73)
	jp	.LBB10_18
	.local	.LBB10_49
.LBB10_49:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	c, l
	ld	hl, JTI10_2
	add	hl, bc
	add	hl, bc
	add	hl, bc
	ld	hl, (hl)
	ld	de, 0
	ld	(ix - 122), de
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	ld	a, 1
	jp	(hl)
	.local	.LBB10_50
.LBB10_50:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, 4
	jp	.LBB10_60
	.local	.LBB10_51
.LBB10_51:                              ;   in Loop: Header=BB10_3 Depth=3
	push	bc
	pop	iy
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	hl, JTI10_1
	lea	bc, iy + 0
	add	hl, bc
	add	hl, bc
	add	hl, bc
	ld	bc, 0
	ld	hl, (hl)
	ld	d, b
	ld	a, 1
	jp	(hl)
	.local	.LBB10_52
.LBB10_52:                              ;   in Loop: Header=BB10_3 Depth=3
	push	hl
	push	hl
	pea	ix - 49
	ld	de, -138
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	push	hl
	call	_gui_terms_loop
	ld	iy, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 49)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	ld	a, e
	jp	m, .LBB10_3
	jp	.LBB10_85
	.local	.LBB10_53
.LBB10_53:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, (ix - 67)
	ld	de, (ix - 85)
	jp	.LBB10_18
	.local	.LBB10_54
.LBB10_54:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, (ix - 61)
	ld	de, (ix - 79)
	jp	.LBB10_18
	.local	.LBB10_55
.LBB10_55:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, (ix - 64)
	ld	de, (ix - 82)
	jp	.LBB10_18
	.local	.LBB10_56
.LBB10_56:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, (ix - 58)
	ld	de, (ix - 76)
	jp	.LBB10_18
	.local	.LBB10_57
.LBB10_57:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, 2
	jr	.LBB10_60
	.local	.LBB10_58
.LBB10_58:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, 1
	jr	.LBB10_60
	.local	.LBB10_59
.LBB10_59:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, 3
	.local	.LBB10_60
.LBB10_60:                              ;   in Loop: Header=BB10_3 Depth=3
	ld	(ix - 122), hl
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	jp	.LBB10_3
	.local	.LBB10_61
.LBB10_61:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	(_stealth_mode), a
	.local	.LBB10_62
.LBB10_62:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	jp	.LBB10_2
	.local	.LBB10_63
.LBB10_63:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	de, (ix - 46)
	push	de
	pop	hl
	ld	bc, 24936
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB10_65
; %bb.64:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	bc, -138
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	ld	hl, _.str.47
	ld	bc, 12
	ldir
	ld	e, 97
	jp	.LBB10_74
	.local	.LBB10_65
.LBB10_65:                              ;   in Loop: Header=BB10_2 Depth=2
	push	de
	pop	hl
	ld	bc, 25715
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB10_71
; %bb.66:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	bc, -138
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	ld	hl, _.str.39
	ld	bc, 10
	ldir
	jr	.LBB10_73
	.local	.LBB10_67
.LBB10_67:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, (ix - 122)
	inc	hl
	jp	.LBB10_97
	.local	.LBB10_68
.LBB10_68:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	de, -138
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	bc, -132
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	add	iy, de
	dec	de
	ld	(ix - 49), de
	ld	(iy - 1), 0
	jr	.LBB10_62
	.local	.LBB10_69
.LBB10_69:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	l, 1
	ld	a, (ix - 119)
	xor	a, l
	ld	d, a
	jp	.LBB10_2
	.local	.LBB10_70
.LBB10_70:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	a, (_dark_mode)
	ld	l, 1
	xor	a, l
	ld	l, a
	ld	(_dark_mode), a
	jp	.LBB10_62
	.local	.LBB10_71
.LBB10_71:                              ;   in Loop: Header=BB10_2 Depth=2
	push	de
	pop	hl
	ld	bc, 26212
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB10_89
; %bb.72:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, 6776164
	ld	(ix - 46), hl
	ld	hl, 6645106
	ld	(ix - 43), hl
	ld.sis	hl, 115
	ld	(ix - 40), l
	ld	(ix - 39), h
	.local	.LBB10_73
.LBB10_73:                              ; %.preheader
                                        ;   in Loop: Header=BB10_2 Depth=2
	ld	e, 100
	.local	.LBB10_74
.LBB10_74:                              ; %.preheader
                                        ;   in Loop: Header=BB10_2 Depth=2
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 16)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 4), hl
	.local	.LBB10_75
.LBB10_75:                              ;   Parent Loop BB10_1 Depth=1
                                        ;     Parent Loop BB10_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	pop	ix
	ld	a, e
	or	a, a
	jr	z, .LBB10_77
; %bb.76:                               ;   in Loop: Header=BB10_75 Depth=3
	ld	a, e
	rlc	a
	sbc	hl, hl
	ld	l, e
	push	hl
	call	_tolower
	pop	de
	ld	a, l
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	push	bc
	pop	iy
	ld	(iy - 1), a
	ld	iy, (ix + 6)
	push	bc
	pop	hl
	ld	e, (hl)
	inc	bc
	push	ix
	lea	ix, ix - 128
	ld	(ix - 4), bc
	jr	.LBB10_75
	.local	.LBB10_77
.LBB10_77:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, (iy + 64)
	ld	de, (iy + 62)
	pea	ix - 118
	pea	ix - 117
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 10
	ld	bc, (iy + 0)
	push	bc
	push	de
	push	hl
	call	_find_best_node
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB10_81
; %bb.78:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	a, (ix - 117)
	ld	l, (ix - 118)
	ld	bc, -180
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -162
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -177
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -159
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -174
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -156
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -171
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -153
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -168
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -150
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -165
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -147
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_node_data
	ld	hl, 45
	add	hl, sp
	ld	sp, hl
	bit	0, a
	jr	z, .LBB10_82
	.local	.LBB10_79
.LBB10_79:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	de, -141
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	inc	hl
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	hl, (ix - 73)
	ld	de, 4
	or	a, a
	sbc	hl, de
	jp	c, .LBB10_87
; %bb.80:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	a, 1
	ld	(ix - 123), a                   ; 1-byte Folded Spill
	or	a, a
	sbc	hl, hl
	jp	.LBB10_97
	.local	.LBB10_81
.LBB10_81:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	(ix - 46), 0
	or	a, a
	sbc	hl, hl
	ld	(ix - 49), hl
	ld	hl, _.str.49
	jr	.LBB10_83
	.local	.LBB10_82
.LBB10_82:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, _.str.48
	.local	.LBB10_83
.LBB10_83:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	de, -129
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	jp	.LBB10_62
	.local	.LBB10_84
.LBB10_84:                              ;   in Loop: Header=BB10_2 Depth=2
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 10)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 4)
	pop	ix
	add	iy, de
	inc	de
	ld	(ix - 49), de
	ld	(iy), l
	ld	(iy + 1), 0
	jp	.LBB10_62
	.local	.LBB10_85
.LBB10_85:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, (iy + 64)
	ld	de, (iy + 62)
	pea	ix - 118
	pea	ix - 117
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 10
	ld	bc, (iy + 0)
	push	bc
	push	de
	push	hl
	call	_find_best_node
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB10_62
; %bb.86:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	a, (ix - 117)
	ld	l, (ix - 118)
	ld	bc, -180
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -162
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -177
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -159
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -174
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -156
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -171
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -153
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -168
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -150
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -165
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -147
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_get_node_data
	ld	hl, 45
	add	hl, sp
	ld	sp, hl
	bit	0, a
	jp	z, .LBB10_62
	jp	.LBB10_79
	.local	.LBB10_87
.LBB10_87:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, (ix - 76)
	or	a, a
	sbc	hl, de
	jr	c, .LBB10_91
; %bb.88:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	a, 1
	ld	(ix - 123), a                   ; 1-byte Folded Spill
	ld	hl, 1
	jp	.LBB10_97
	.local	.LBB10_89
.LBB10_89:                              ;   in Loop: Header=BB10_2 Depth=2
	push	de
	pop	hl
	ld	bc, 26979
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB10_93
; %bb.90:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	bc, -138
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	ld	hl, _.str.41
	ld	bc, 11
	ldir
	ld	e, 99
	jp	.LBB10_74
	.local	.LBB10_91
.LBB10_91:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, (ix - 79)
	or	a, a
	sbc	hl, de
	jp	c, .LBB10_95
; %bb.92:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	a, 1
	ld	(ix - 123), a                   ; 1-byte Folded Spill
	ld	hl, 2
	jp	.LBB10_97
	.local	.LBB10_93
.LBB10_93:                              ;   in Loop: Header=BB10_2 Depth=2
	push	de
	pop	hl
	ld	bc, 28520
	or	a, a
	sbc	hl, bc
                                        ; kill: def $e killed $e killed $ude
	jp	nz, .LBB10_74
; %bb.94:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	bc, -138
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	ld	hl, _.str.45
	ld	bc, 5
	ldir
	ld	e, 110
	jp	.LBB10_74
	.local	.LBB10_95
.LBB10_95:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, (ix - 82)
	or	a, a
	sbc	hl, de
	jr	c, .LBB10_98
; %bb.96:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	a, 1
	ld	(ix - 123), a                   ; 1-byte Folded Spill
	ld	hl, 3
	.local	.LBB10_97
.LBB10_97:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	(ix - 122), hl
	jp	.LBB10_62
	.local	.LBB10_98
.LBB10_98:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, (ix - 85)
	or	a, a
	sbc	hl, de
	ld	hl, 0
	ld	(ix - 122), hl
	jr	c, .LBB10_100
; %bb.99:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	(ix - 122), de
	.local	.LBB10_100
.LBB10_100:                             ;   in Loop: Header=BB10_2 Depth=2
	ld	a, 1
	ld	(ix - 123), a                   ; 1-byte Folded Spill
	jp	.LBB10_62
	.local	.LBB10_101
.LBB10_101:                             ;   in Loop: Header=BB10_1 Depth=1
	ld	(ix - 46), 0
	or	a, a
	sbc	hl, hl
	ld	(ix - 49), hl
	call	_rand
	ld	bc, 5
	call	__irems
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	xor	a, a
	ld	(ix - 123), a                   ; 1-byte Folded Spill
	jr	.LBB10_104
	.local	.LBB10_102
.LBB10_102:                             ;   in Loop: Header=BB10_1 Depth=1
	ld	hl, (ix - 49)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB10_105
; %bb.103:                              ;   in Loop: Header=BB10_1 Depth=1
	or	a, a
	sbc	hl, hl
	ld	(ix - 49), hl
	ld	(ix - 46), h
	.local	.LBB10_104
.LBB10_104:                             ;   in Loop: Header=BB10_1 Depth=1
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	jp	.LBB10_1
	.local	.LBB10_105
.LBB10_105:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end10
.Lfunc_end10:
	.size	_gui_search_loop, .Lfunc_end10-_gui_search_loop
	.section	.rodata._gui_search_loop,"a",@progbits
JTI10_0:
	d24	.LBB10_48
	d24	.LBB10_56
	d24	.LBB10_54
	d24	.LBB10_55
	d24	.LBB10_53
JTI10_1:
	d24	.LBB10_69
	d24	.LBB10_70
	d24	.LBB10_40
	d24	.LBB10_40
	d24	.LBB10_40
	d24	.LBB10_40
	d24	.LBB10_3
	d24	.LBB10_52
JTI10_2:
	d24	.LBB10_50
	d24	.LBB10_59
	d24	.LBB10_57
	d24	.LBB10_58
	d24	.LBB10_3
                                        ; -- End function
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
; %bb.0:
	call	_gui_init
	call	_gui_splash
	ld	hl, _g_db
	push	hl
	call	_init_database
	pop	hl
	bit	0, a
	jr	z, .LBB11_2
; %bb.1:
	ld	hl, _g_db
	push	hl
	call	_gui_search_loop
	pop	hl
	jr	.LBB11_4
	.local	.LBB11_2
.LBB11_2:
	ld	hl, 255
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 10
	push	hl
	push	hl
	ld	hl, _.str.222
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB11_3
.LBB11_3:                               ; =>This Inner Loop Header: Depth=1
	call	_os_GetCSC
	cp	a, 15
	jr	nz, .LBB11_3
	.local	.LBB11_4
.LBB11_4:                               ; %.loopexit
	ld	hl, _g_db
	push	hl
	call	_close_database
	pop	hl
	call	_gfx_End
	or	a, a
	sbc	hl, hl
	ret
	.local	.Lfunc_end11
.Lfunc_end11:
	.size	_main, .Lfunc_end11-_main
                                        ; -- End function
	.section	.text._djb2_hash,"ax",@progbits
	.globl	_djb2_hash                      ; -- Begin function djb2_hash
	.type	_djb2_hash,@function
_djb2_hash:                             ; @djb2_hash
; %bb.0:
	ld	hl, -2
	call	__frameset
	ld	iy, (ix + 6)
	xor	a, a
	ld	hl, 5381
	ld	de, 0
	ld	(ix - 2), e
	ld	e, a
	.local	.LBB12_1
.LBB12_1:                               ; =>This Inner Loop Header: Depth=1
	ld	d, (iy)
	ld	a, d
	or	a, a
	jr	z, .LBB12_3
; %bb.2:                                ;   in Loop: Header=BB12_1 Depth=1
	ld	bc, 33
	xor	a, a
	call	__lmulu
	ld	(ix - 1), a
	ld	bc, (ix - 3)
	ld	b, a
	ld	c, d
	ld	a, (ix - 2)                     ; 1-byte Folded Reload
	call	__ladd
	inc	iy
	jr	.LBB12_1
	.local	.LBB12_3
.LBB12_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end12
.Lfunc_end12:
	.size	_djb2_hash, .Lfunc_end12-_djb2_hash
                                        ; -- End function
	.section	.text._find_best_node,"ax",@progbits
	.globl	_find_best_node                 ; -- Begin function find_best_node
	.type	_find_best_node,@function
_find_best_node:                        ; @find_best_node
; %bb.0:
	ld	hl, -72
	call	__frameset
	ld	hl, (ix + 12)
	ld	de, 39
	lea	bc, ix - 40
	ld	(ix - 47), bc
	push	de
	push	hl
	push	bc
	call	_strncpy
	pop	hl
	pop	hl
	pop	hl
	ld	(ix - 1), 0
	ld	hl, _.str.225
	push	hl
	ld	hl, (ix - 47)
	push	hl
	call	_strtok
	ex	de, hl
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	bc, (ix + 9)
	ld	l, c
	ld	h, b
	ld	(ix - 50), hl
	ld	bc, 0
	xor	a, a
	ld	(ix - 57), a                    ; 1-byte Folded Spill
	ld	(ix - 58), a                    ; 1-byte Folded Spill
	.local	.LBB13_1
.LBB13_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB13_4 Depth 2
                                        ;       Child Loop BB13_5 Depth 3
                                        ;     Child Loop BB13_15 Depth 2
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB13_21
; %bb.2:                                ;   in Loop: Header=BB13_1 Depth=1
	ld	(ix - 47), bc
	push	de
	ld	(ix - 53), de
	call	_strlen
	pop	de
	ld	de, 2
	or	a, a
	sbc	hl, de
	jp	c, .LBB13_20
; %bb.3:                                ;   in Loop: Header=BB13_1 Depth=1
	ld	hl, (ix - 53)
	push	hl
	call	_djb2_hash
	push	hl
	pop	iy
	ld	a, e
	pop	hl
	scf
	sbc	hl, hl
	push	hl
	pop	bc
	ld	de, (ix - 50)
	inc	hl
	ld	(ix - 53), hl
	ld	(ix - 56), iy
	ld	(ix - 63), a
	.local	.LBB13_4
.LBB13_4:                               ; %.loopexit
                                        ;   Parent Loop BB13_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB13_5 Depth 3
	ld	(ix - 62), bc
	.local	.LBB13_5
.LBB13_5:                               ;   Parent Loop BB13_1 Depth=1
                                        ;     Parent Loop BB13_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ld	bc, (ix - 53)
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	hl, 0
	ld	a, l
	jp	p, .LBB13_11
; %bb.6:                                ;   in Loop: Header=BB13_5 Depth=3
	push	bc
	pop	hl
	call	__inot
	ld	(ix - 72), de
	push	de
	pop	iy
	ex	de, hl
	add	iy, de
	lea	hl, iy + 0
	add	hl, hl
	sbc	hl, hl
	add	hl, hl
	ccf
	sbc	hl, hl
	inc	hl
	ex	de, hl
	add	iy, de
	lea	hl, iy + 0
	call	__ishrs_1
	add	hl, bc
	ld	(ix - 66), hl
	ld	(ix - 59), a                    ; 1-byte Folded Spill
	ld	bc, 6
	call	__imulu
	ex	de, hl
	ld	iy, (ix + 6)
	add	iy, de
	ld	a, (iy)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, a
	ld	a, (iy + 1)
	ld	l, a
	ld	c, 8
	call	__ishl
	add	hl, de
	ld	(ix - 69), hl
	ld	a, (iy + 2)
	ld	d, b
	ld	(ix - 42), d
	ld	bc, (ix - 44)
	ld	b, d
	ld	c, a
	ld	d, (ix - 59)                    ; 1-byte Folded Reload
	ld	a, d
	ld	l, 16
	call	__lshl
	push	bc
	pop	hl
	ld	e, a
	ld	bc, (ix - 69)
	ld	a, d
	call	__ladd
	ld	(ix - 69), hl
	ld	a, (iy + 3)
	ld	iy, (ix - 56)
	ld	l, 0
	ld	(ix - 41), l
	ld	bc, (ix - 43)
	ld	b, l
	ld	c, a
	ld	a, d
	ld	l, 24
	call	__lshl
	ld	hl, (ix - 69)
	call	__ladd
	lea	bc, iy + 0
	ld	a, (ix - 63)                    ; 1-byte Folded Reload
	call	__lcmpu
	jr	z, .LBB13_10
; %bb.7:                                ;   in Loop: Header=BB13_5 Depth=3
	lea	bc, iy + 0
	ld	iy, (ix - 66)
	call	__lcmpu
	jr	nc, .LBB13_9
; %bb.8:                                ;   in Loop: Header=BB13_5 Depth=3
	inc	iy
	ld	(ix - 53), iy
	ld	de, (ix - 72)
	ld	iy, (ix - 56)
	jp	.LBB13_5
	.local	.LBB13_9
.LBB13_9:                               ;   in Loop: Header=BB13_5 Depth=3
	lea	de, iy + 0
	ld	bc, (ix - 62)
	ld	iy, (ix - 56)
	jp	.LBB13_5
	.local	.LBB13_10
.LBB13_10:                              ;   in Loop: Header=BB13_4 Depth=2
	ld	de, (ix - 66)
	push	de
	pop	bc
	jp	.LBB13_4
	.local	.LBB13_11
.LBB13_11:                              ;   in Loop: Header=BB13_1 Depth=1
	ld	bc, (ix - 62)
	push	bc
	pop	hl
	ld	de, -1
	or	a, a
	sbc	hl, de
	jp	z, .LBB13_20
; %bb.12:                               ;   in Loop: Header=BB13_1 Depth=1
	ld	(ix - 59), a                    ; 1-byte Folded Spill
	ld	hl, (ix - 50)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	push	bc
	pop	hl
	jp	m, .LBB13_14
; %bb.13:                               ;   in Loop: Header=BB13_1 Depth=1
	ld	hl, (ix - 50)
	.local	.LBB13_14
.LBB13_14:                              ;   in Loop: Header=BB13_1 Depth=1
	inc	hl
	or	a, a
	sbc	hl, bc
	ex	de, hl
	push	bc
	pop	hl
	ld	bc, 6
	call	__imulu
	push	hl
	pop	bc
	ld	iy, (ix + 6)
	add	iy, bc
	lea	hl, iy + 2
	ld	(ix - 53), hl
	.local	.LBB13_15
.LBB13_15:                              ;   Parent Loop BB13_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	dec	de
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB13_20
; %bb.16:                               ;   in Loop: Header=BB13_15 Depth=2
	ld	(ix - 62), de
	ld	iy, (ix - 53)
	ld	a, (iy - 2)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, a
	ld	a, (iy - 1)
	ld	l, a
	ld	c, 8
	call	__ishl
	push	hl
	pop	iy
	add	iy, de
	ld	hl, (ix - 53)
	ld	a, (hl)
	ld	d, 0
	ld	(ix - 44), d
	ld	bc, (ix - 46)
	ld	b, d
	ld	c, a
	ld	d, (ix - 59)                    ; 1-byte Folded Reload
	ld	a, d
	ld	l, 16
	call	__lshl
	push	bc
	pop	hl
	ld	e, a
	lea	bc, iy + 0
	ld	a, d
	call	__ladd
	ld	(ix - 66), hl
	ld	iy, (ix - 53)
	ld	a, (iy + 1)
	ld	l, 0
	ld	(ix - 43), l
	ld	bc, (ix - 45)
	ld	b, l
	ld	c, a
	ld	a, d
	ld	l, 24
	call	__lshl
	ld	hl, (ix - 66)
	call	__ladd
	ld	(ix - 66), hl
	ld	bc, (ix - 56)
	ld	d, (ix - 63)                    ; 1-byte Folded Reload
	ld	a, d
	call	__lcmpu
	jr	nz, .LBB13_19
; %bb.17:                               ;   in Loop: Header=BB13_15 Depth=2
	ld	hl, (ix - 47)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB13_19
; %bb.18:                               ;   in Loop: Header=BB13_15 Depth=2
	ld	iy, (ix - 53)
	ld	a, (iy + 3)
	ld	(ix - 57), a
	ld	a, (iy + 2)
	ld	(ix - 58), a
	ld	hl, 1
	ld	(ix - 47), hl
	.local	.LBB13_19
.LBB13_19:                              ;   in Loop: Header=BB13_15 Depth=2
	ld	iy, (ix - 53)
	lea	iy, iy + 6
	ld	(ix - 53), iy
	ld	hl, (ix - 66)
	ld	bc, (ix - 56)
	ld	a, d
	call	__lcmpu
	ld	de, (ix - 62)
	jp	z, .LBB13_15
	.local	.LBB13_20
.LBB13_20:                              ;   in Loop: Header=BB13_1 Depth=1
	ld	hl, _.str.225
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_strtok
	ex	de, hl
	pop	hl
	pop	hl
	ld	bc, (ix - 47)
	jp	.LBB13_1
	.local	.LBB13_21
.LBB13_21:
	ld	de, 1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB13_23
; %bb.22:
	ld	hl, (ix + 15)
	ld	a, (ix - 58)
	ld	(hl), a
	ld	hl, (ix + 18)
	ld	a, (ix - 57)
	ld	(hl), a
	.local	.LBB13_23
.LBB13_23:
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB13_25
; %bb.24:
	ld	a, 0
	jr	.LBB13_26
	.local	.LBB13_25
.LBB13_25:
	ld	a, -1
	.local	.LBB13_26
.LBB13_26:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end13
.Lfunc_end13:
	.size	_find_best_node, .Lfunc_end13-_find_best_node
                                        ; -- End function
	.section	.rodata._.str,"a",@progbits
	.balign	1
	.local	_.str
_.str:
	.asciz	"r"

	.section	.rodata._.str.1.2,"a",@progbits
	.balign	1
	.local	_.str.1.2
_.str.1.2:
	.asciz	"distribution"

	.section	.rodata._.str.2,"a",@progbits
	.balign	1
	.local	_.str.2
_.str.2:
	.asciz	"population"

	.section	.rodata._.str.3,"a",@progbits
	.balign	1
	.local	_.str.3
_.str.3:
	.asciz	"probability"

	.section	.rodata._.str.4,"a",@progbits
	.balign	1
	.local	_.str.4
_.str.4:
	.asciz	"standard deviation"

	.section	.rodata._.str.5,"a",@progbits
	.balign	1
	.local	_.str.5
_.str.5:
	.asciz	"proportion"

	.section	.rodata._.str.6,"a",@progbits
	.balign	1
	.local	_.str.6
_.str.6:
	.asciz	"hypothesis"

	.section	.rodata._.str.7,"a",@progbits
	.balign	1
	.local	_.str.7
_.str.7:
	.asciz	"confidence interval"

	.section	.rodata._.str.8,"a",@progbits
	.balign	1
	.local	_.str.8
_.str.8:
	.asciz	"significant"

	.section	.rodata._.str.9,"a",@progbits
	.balign	1
	.local	_.str.9
_.str.9:
	.asciz	"random"

	.section	.rodata._.str.10,"a",@progbits
	.balign	1
	.local	_.str.10
_.str.10:
	.asciz	"sample"

	.section	.rodata._.str.11,"a",@progbits
	.balign	1
	.local	_.str.11
_.str.11:
	.asciz	"variable"

	.section	.rodata._.str.12,"a",@progbits
	.balign	1
	.local	_.str.12
_.str.12:
	.asciz	"expected"

	.section	.rodata._.str.13,"a",@progbits
	.balign	1
	.local	_.str.13
_.str.13:
	.asciz	"observed"

	.section	.rodata._.str.14,"a",@progbits
	.balign	1
	.local	_.str.14
_.str.14:
	.asciz	"residual"

	.section	.rodata._.str.15,"a",@progbits
	.balign	1
	.local	_.str.15
_.str.15:
	.asciz	"correlation"

	.section	.rodata._.str.16,"a",@progbits
	.balign	1
	.local	_.str.16
_.str.16:
	.asciz	"regression"

	.section	.rodata._.str.17,"a",@progbits
	.balign	1
	.local	_.str.17
_.str.17:
	.asciz	"independent"

	.section	.rodata._.str.18,"a",@progbits
	.balign	1
	.local	_.str.18
_.str.18:
	.asciz	"statistic"

	.section	.rodata._.str.19,"a",@progbits
	.balign	1
	.local	_.str.19
_.str.19:
	.asciz	"parameter"

	.section	.rodata._.str.20,"a",@progbits
	.balign	1
	.local	_.str.20
_.str.20:
	.asciz	"evidence"

	.section	.rodata._.str.21,"a",@progbits
	.balign	1
	.local	_.str.21
_.str.21:
	.asciz	"mean"

	.section	.rodata._.str.22,"a",@progbits
	.balign	1
	.local	_.str.22
_.str.22:
	.asciz	"median"

	.section	.rodata._.str.23,"a",@progbits
	.balign	1
	.local	_.str.23
_.str.23:
	.asciz	"normal"

	.section	.rodata._.str.24,"a",@progbits
	.balign	1
	.local	_.str.24
_.str.24:
	.asciz	"condition"

	.section	.data._g_compression_dict,"aw",@progbits
	.balign	1
	.globl	_g_compression_dict
_g_compression_dict:
	d24	_.str.37
	d24	_.str.1.2
	d24	_.str.2
	d24	_.str.3
	d24	_.str.4
	d24	_.str.5
	d24	_.str.6
	d24	_.str.7
	d24	_.str.8
	d24	_.str.9
	d24	_.str.10
	d24	_.str.11
	d24	_.str.12
	d24	_.str.13
	d24	_.str.14
	d24	_.str.15
	d24	_.str.16
	d24	_.str.17
	d24	_.str.18
	d24	_.str.19
	d24	_.str.20
	d24	_.str.21
	d24	_.str.22
	d24	_.str.23
	d24	_.str.24

	.section	.rodata._g_dict_size,"a",@progbits
	.balign	1
	.globl	_g_dict_size
_g_dict_size:
	db	24                              ; 0x18

	.section	.bss._dark_mode,"aw",@nobits
	.balign	1
	.globl	_dark_mode
_dark_mode:
	.zero	1

	.section	.bss._stealth_mode,"aw",@nobits
	.balign	1
	.globl	_stealth_mode
_stealth_mode:
	.zero	1

	.section	.rodata._.str.25,"a",@progbits
	.balign	1
	.local	_.str.25
_.str.25:
	.asciz	"ANTIGRAVITY"

	.section	.rodata._.str.1.26,"a",@progbits
	.balign	1
	.local	_.str.1.26
_.str.1.26:
	.asciz	"AP MACROECONOMICS ENGINE"

	.section	.rodata._.str.2.27,"a",@progbits
	.balign	1
	.local	_.str.2.27
_.str.2.27:
	.asciz	"v2.0"

	.section	.rodata._.str.3.28,"a",@progbits
	.balign	1
	.local	_.str.3.28
_.str.3.28:
	.asciz	"Build: May  7 2026 17:00:32"

	.section	.rodata._.str.4.29,"a",@progbits
	.balign	1
	.local	_.str.4.29
_.str.4.29:
	.asciz	"Glossary - [ALPHA] to Jump"

	.section	.rodata._search_terms,"a",@progbits
	.balign	1
	.local	_search_terms
_search_terms:
	d24	_.str.50
	d24	_.str.51
	d24	_.str.52
	d24	_.str.53
	d24	_.str.54
	d24	_.str.55
	d24	_.str.56
	d24	_.str.47
	d24	_.str.57
	d24	_.str.58
	d24	_.str.59
	d24	_.str.60
	d24	_.str.61
	d24	_.str.62
	d24	_.str.63
	d24	_.str.64
	d24	_.str.65
	d24	_.str.66
	d24	_.str.67
	d24	_.str.68
	d24	_.str.69
	d24	_.str.70
	d24	_.str.71
	d24	_.str.72
	d24	_.str.73
	d24	_.str.74
	d24	_.str.75
	d24	_.str.76
	d24	_.str.77
	d24	_.str.78
	d24	_.str.79
	d24	_.str.80
	d24	_.str.81
	d24	_.str.82
	d24	_.str.83
	d24	_.str.84
	d24	_.str.85
	d24	_.str.86
	d24	_.str.87
	d24	_.str.88
	d24	_.str.89
	d24	_.str.90
	d24	_.str.91
	d24	_.str.92
	d24	_.str.93
	d24	_.str.94
	d24	_.str.95
	d24	_.str.96
	d24	_.str.97
	d24	_.str.98
	d24	_.str.99
	d24	_.str.100
	d24	_.str.101
	d24	_.str.102
	d24	_.str.103
	d24	_.str.104
	d24	_.str.105
	d24	_.str.106
	d24	_.str.107
	d24	_.str.108
	d24	_.str.109
	d24	_.str.110
	d24	_.str.111
	d24	_.str.112
	d24	_.str.113
	d24	_.str.114
	d24	_.str.115
	d24	_.str.116
	d24	_.str.117
	d24	_.str.118
	d24	_.str.119
	d24	_.str.120
	d24	_.str.121
	d24	_.str.122
	d24	_.str.123
	d24	_.str.124
	d24	_.str.125
	d24	_.str.126
	d24	_.str.127
	d24	_.str.128
	d24	_.str.129
	d24	_.str.130
	d24	_.str.131
	d24	_.str.132
	d24	_.str.133
	d24	_.str.134
	d24	_.str.135
	d24	_.str.136
	d24	_.str.137
	d24	_.str.138
	d24	_.str.139
	d24	_.str.140
	d24	_.str.141
	d24	_.str.142
	d24	_.str.143
	d24	_.str.144
	d24	_.str.145
	d24	_.str.146
	d24	_.str.147
	d24	_.str.148
	d24	_.str.149
	d24	_.str.150
	d24	_.str.151
	d24	_.str.152
	d24	_.str.153
	d24	_.str.154
	d24	_.str.155
	d24	_.str.156
	d24	_.str.157
	d24	_.str.158
	d24	_.str.159
	d24	_.str.160
	d24	_.str.161
	d24	_.str.162
	d24	_.str.163
	d24	_.str.164
	d24	_.str.165
	d24	_.str.166
	d24	_.str.167
	d24	_.str.168
	d24	_.str.169
	d24	_.str.170
	d24	_.str.171
	d24	_.str.172
	d24	_.str.173
	d24	_.str.174
	d24	_.str.175
	d24	_.str.176
	d24	_.str.177
	d24	_.str.178
	d24	_.str.179
	d24	_.str.180
	d24	_.str.181
	d24	_.str.182
	d24	_.str.183
	d24	_.str.184
	d24	_.str.185
	d24	_.str.186
	d24	_.str.187
	d24	_.str.188
	d24	_.str.189
	d24	_.str.190
	d24	_.str.191
	d24	_.str.192
	d24	_.str.193
	d24	_.str.194
	d24	_.str.195
	d24	_.str.196
	d24	_.str.197
	d24	_.str.198
	d24	_.str.199
	d24	_.str.200
	d24	_.str.201
	d24	_.str.202
	d24	_.str.203
	d24	_.str.204
	d24	_.str.205
	d24	_.str.206
	d24	_.str.207
	d24	_.str.208
	d24	_.str.209
	d24	_.str.210
	d24	_.str.211
	d24	_.str.212
	d24	_.str.213
	d24	_.str.214
	d24	_.str.215
	d24	_.str.216
	d24	_.str.217
	d24	_.str.218
	d24	_.str.219
	d24	_.str.220
	d24	_.str.221

	.section	.rodata._.str.5.30,"a",@progbits
	.balign	1
	.local	_.str.5.30
_.str.5.30:
	.asciz	".."

	.section	.rodata._.str.6.31,"a",@progbits
	.balign	1
	.local	_.str.6.31
_.str.6.31:
	.asciz	"Page %d of %d"

	.section	.rodata._.str.7.32,"a",@progbits
	.balign	1
	.local	_.str.7.32
_.str.7.32:
	.asciz	"Type keyword and press ENTER."

	.section	.rodata.___const.gui_search_loop.chars_normal,"a",@progbits
	.balign	1
	.local	___const.gui_search_loop.chars_normal
___const.gui_search_loop.chars_normal:
	.ascii	"\000\000\000\000\000\000\000\000\000\000+-*/\000\000\000\000369)\000\000\000.258(\000\000\0000147,"
	.zero	22

	.section	.rodata.___const.gui_search_loop.chars_alpha,"a",@progbits
	.balign	1
	.local	___const.gui_search_loop.chars_alpha
___const.gui_search_loop.chars_alpha:
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000wrmh\000\000\000\000vqlg\000\000\000zupkfc\000 ytojeb\000\000xsnida"
	.zero	12

	.section	.rodata._.str.8.46,"a",@progbits
	.balign	1
	.local	_.str.8.46
_.str.8.46:
	.asciz	"Trivia: GDP = C + I + G + (X - M)"

	.section	.rodata._.str.9.47,"a",@progbits
	.balign	1
	.local	_.str.9.47
_.str.9.47:
	.asciz	"Trivia: The Fed controls the money supply."

	.section	.rodata._.str.10.48,"a",@progbits
	.balign	1
	.local	_.str.10.48
_.str.10.48:
	.asciz	"Trivia: Inflation hurts lenders, helps borrowers."

	.section	.rodata._.str.11.49,"a",@progbits
	.balign	1
	.local	_.str.11.49
_.str.11.49:
	.asciz	"Trivia: SRAS is upward sloping."

	.section	.rodata._.str.12.50,"a",@progbits
	.balign	1
	.local	_.str.12.50
_.str.12.50:
	.asciz	"Trivia: M1 includes currency and checkable deposits."

	.section	.rodata.___const.gui_search_loop.trivia,"a",@progbits
	.balign	1
	.local	___const.gui_search_loop.trivia
___const.gui_search_loop.trivia:
	d24	_.str.8.46
	d24	_.str.9.47
	d24	_.str.10.48
	d24	_.str.11.49
	d24	_.str.12.50

	.section	.rodata._.str.13.33,"a",@progbits
	.balign	1
	.local	_.str.13.33
_.str.13.33:
	.asciz	"2+2"

	.section	.rodata._.str.14.34,"a",@progbits
	.balign	1
	.local	_.str.14.34
_.str.14.34:
	.asciz	"             4"

	.section	.rodata._.str.15.35,"a",@progbits
	.balign	1
	.local	_.str.15.35
_.str.15.35:
	.asciz	"Ans*10"

	.section	.rodata._.str.16.36,"a",@progbits
	.balign	1
	.local	_.str.16.36
_.str.16.36:
	.asciz	"            40"

	.section	.rodata._.str.17.37,"a",@progbits
	.balign	1
	.local	_.str.17.37
_.str.17.37:
	.asciz	"_"

	.section	.rodata._.str.18.38,"a",@progbits
	.balign	1
	.local	_.str.18.38
_.str.18.38:
	.asciz	"AP Macroeconomics Lexical Search Engine"

	.section	.rodata._.str.19.39,"a",@progbits
	.balign	1
	.local	_.str.19.39
_.str.19.39:
	.asciz	"[A]"

	.section	.rodata._.str.20.40,"a",@progbits
	.balign	1
	.local	_.str.20.40
_.str.20.40:
	.asciz	"[1]"

	.section	.rodata._.str.21.41,"a",@progbits
	.balign	1
	.local	_.str.21.41
_.str.21.41:
	.asciz	"Query: "

	.section	.rodata._.str.22.42,"a",@progbits
	.balign	1
	.local	_.str.22.42
_.str.22.42:
	.asciz	"Press [MODE] to open Glossary"

	.section	.rodata._.str.23.43,"a",@progbits
	.balign	1
	.local	_.str.23.43
_.str.23.43:
	.asciz	"Press [GRAPH] to toggle Dark Mode"

	.section	.rodata._.str.24.44,"a",@progbits
	.balign	1
	.local	_.str.24.44
_.str.24.44:
	.asciz	"Press [STAT] for Stealth Mode"

	.section	.rodata._.str.25.45,"a",@progbits
	.balign	1
	.local	_.str.25.45
_.str.25.45:
	.asciz	"Searches: %d"

	.section	.rodata._.str.26,"a",@progbits
	.balign	1
	.local	_.str.26
_.str.26:
	.asciz	"Title: "

	.section	.rodata._.str.27,"a",@progbits
	.balign	1
	.local	_.str.27
_.str.27:
	.asciz	"[F1]RULE"

	.section	.rodata._.str.28,"a",@progbits
	.balign	1
	.local	_.str.28
_.str.28:
	.asciz	" F1Rule "

	.section	.rodata._.str.29,"a",@progbits
	.balign	1
	.local	_.str.29
_.str.29:
	.asciz	"[F2]FORM"

	.section	.rodata._.str.30,"a",@progbits
	.balign	1
	.local	_.str.30
_.str.30:
	.asciz	" F2Form "

	.section	.rodata._.str.31,"a",@progbits
	.balign	1
	.local	_.str.31
_.str.31:
	.asciz	"[F3]PROB"

	.section	.rodata._.str.32,"a",@progbits
	.balign	1
	.local	_.str.32
_.str.32:
	.asciz	" F3Prob "

	.section	.rodata._.str.33,"a",@progbits
	.balign	1
	.local	_.str.33
_.str.33:
	.asciz	"[F4]WORD"

	.section	.rodata._.str.34,"a",@progbits
	.balign	1
	.local	_.str.34
_.str.34:
	.asciz	" F4Word "

	.section	.rodata._.str.35,"a",@progbits
	.balign	1
	.local	_.str.35
_.str.35:
	.asciz	"[F5]CALC"

	.section	.rodata._.str.36,"a",@progbits
	.balign	1
	.local	_.str.36
_.str.36:
	.asciz	" F5Calc "

	.section	.rodata._.str.37,"a",@progbits
	.balign	1
	.local	_.str.37
_.str.37:
	.zero	1

	.section	.rodata._.str.39,"a",@progbits
	.balign	1
	.local	_.str.39
_.str.39:
	.asciz	"deviation"

	.section	.rodata._.str.41,"a",@progbits
	.balign	1
	.local	_.str.41
_.str.41:
	.asciz	"confidence"

	.section	.rodata._.str.45,"a",@progbits
	.balign	1
	.local	_.str.45
_.str.45:
	.asciz	"null"

	.section	.rodata._.str.47,"a",@progbits
	.balign	1
	.local	_.str.47
_.str.47:
	.asciz	"alternative"

	.section	.rodata._.str.48,"a",@progbits
	.balign	1
	.local	_.str.48
_.str.48:
	.asciz	"Error loading node data."

	.section	.rodata._.str.49,"a",@progbits
	.balign	1
	.local	_.str.49
_.str.49:
	.asciz	"Keyword not found. Try again."

	.section	.rodata._.str.50,"a",@progbits
	.balign	1
	.local	_.str.50
_.str.50:
	.asciz	"ability"

	.section	.rodata._.str.51,"a",@progbits
	.balign	1
	.local	_.str.51
_.str.51:
	.asciz	"absolute"

	.section	.rodata._.str.52,"a",@progbits
	.balign	1
	.local	_.str.52
_.str.52:
	.asciz	"account"

	.section	.rodata._.str.53,"a",@progbits
	.balign	1
	.local	_.str.53
_.str.53:
	.asciz	"actual"

	.section	.rodata._.str.54,"a",@progbits
	.balign	1
	.local	_.str.54
_.str.54:
	.asciz	"ad"

	.section	.rodata._.str.55,"a",@progbits
	.balign	1
	.local	_.str.55
_.str.55:
	.asciz	"advantage"

	.section	.rodata._.str.56,"a",@progbits
	.balign	1
	.local	_.str.56
_.str.56:
	.asciz	"aggregate"

	.section	.rodata._.str.57,"a",@progbits
	.balign	1
	.local	_.str.57
_.str.57:
	.asciz	"amount"

	.section	.rodata._.str.58,"a",@progbits
	.balign	1
	.local	_.str.58
_.str.58:
	.asciz	"annual"

	.section	.rodata._.str.59,"a",@progbits
	.balign	1
	.local	_.str.59
_.str.59:
	.asciz	"arises"

	.section	.rodata._.str.60,"a",@progbits
	.balign	1
	.local	_.str.60
_.str.60:
	.asciz	"as"

	.section	.rodata._.str.61,"a",@progbits
	.balign	1
	.local	_.str.61
_.str.61:
	.asciz	"balance"

	.section	.rodata._.str.62,"a",@progbits
	.balign	1
	.local	_.str.62
_.str.62:
	.asciz	"bank"

	.section	.rodata._.str.63,"a",@progbits
	.balign	1
	.local	_.str.63
_.str.63:
	.asciz	"banks"

	.section	.rodata._.str.64,"a",@progbits
	.balign	1
	.local	_.str.64
_.str.64:
	.asciz	"because"

	.section	.rodata._.str.65,"a",@progbits
	.balign	1
	.local	_.str.65
_.str.65:
	.asciz	"best"

	.section	.rodata._.str.66,"a",@progbits
	.balign	1
	.local	_.str.66
_.str.66:
	.asciz	"between"

	.section	.rodata._.str.67,"a",@progbits
	.balign	1
	.local	_.str.67
_.str.67:
	.asciz	"borrowers"

	.section	.rodata._.str.68,"a",@progbits
	.balign	1
	.local	_.str.68
_.str.68:
	.asciz	"borrowing"

	.section	.rodata._.str.69,"a",@progbits
	.balign	1
	.local	_.str.69
_.str.69:
	.asciz	"budget"

	.section	.rodata._.str.70,"a",@progbits
	.balign	1
	.local	_.str.70
_.str.70:
	.asciz	"cars"

	.section	.rodata._.str.71,"a",@progbits
	.balign	1
	.local	_.str.71
_.str.71:
	.asciz	"caused"

	.section	.rodata._.str.72,"a",@progbits
	.balign	1
	.local	_.str.72
_.str.72:
	.asciz	"change"

	.section	.rodata._.str.73,"a",@progbits
	.balign	1
	.local	_.str.73
_.str.73:
	.asciz	"changes"

	.section	.rodata._.str.74,"a",@progbits
	.balign	1
	.local	_.str.74
_.str.74:
	.asciz	"charges"

	.section	.rodata._.str.75,"a",@progbits
	.balign	1
	.local	_.str.75
_.str.75:
	.asciz	"choosing"

	.section	.rodata._.str.76,"a",@progbits
	.balign	1
	.local	_.str.76
_.str.76:
	.asciz	"combination"

	.section	.rodata._.str.77,"a",@progbits
	.balign	1
	.local	_.str.77
_.str.77:
	.asciz	"comes"

	.section	.rodata._.str.78,"a",@progbits
	.balign	1
	.local	_.str.78
_.str.78:
	.asciz	"cost"

	.section	.rodata._.str.79,"a",@progbits
	.balign	1
	.local	_.str.79
_.str.79:
	.asciz	"countries"

	.section	.rodata._.str.80,"a",@progbits
	.balign	1
	.local	_.str.80
_.str.80:
	.asciz	"country"

	.section	.rodata._.str.81,"a",@progbits
	.balign	1
	.local	_.str.81
_.str.81:
	.asciz	"crowding"

	.section	.rodata._.str.82,"a",@progbits
	.balign	1
	.local	_.str.82
_.str.82:
	.asciz	"crowds"

	.section	.rodata._.str.83,"a",@progbits
	.balign	1
	.local	_.str.83
_.str.83:
	.asciz	"currency"

	.section	.rodata._.str.84,"a",@progbits
	.balign	1
	.local	_.str.84
_.str.84:
	.asciz	"current"

	.section	.rodata._.str.85,"a",@progbits
	.balign	1
	.local	_.str.85
_.str.85:
	.asciz	"curve"

	.section	.rodata._.str.86,"a",@progbits
	.balign	1
	.local	_.str.86
_.str.86:
	.asciz	"decrease"

	.section	.rodata._.str.87,"a",@progbits
	.balign	1
	.local	_.str.87
_.str.87:
	.asciz	"decreasing"

	.section	.rodata._.str.88,"a",@progbits
	.balign	1
	.local	_.str.88
_.str.88:
	.asciz	"deficit"

	.section	.rodata._.str.89,"a",@progbits
	.balign	1
	.local	_.str.89
_.str.89:
	.asciz	"deflator"

	.section	.rodata._.str.90,"a",@progbits
	.balign	1
	.local	_.str.90
_.str.90:
	.asciz	"demand"

	.section	.rodata._.str.91,"a",@progbits
	.balign	1
	.local	_.str.91
_.str.91:
	.asciz	"demanded"

	.section	.rodata._.str.92,"a",@progbits
	.balign	1
	.local	_.str.92
_.str.92:
	.asciz	"deposits"

	.section	.rodata._.str.93,"a",@progbits
	.balign	1
	.local	_.str.93
_.str.93:
	.asciz	"discount"

	.section	.rodata._.str.94,"a",@progbits
	.balign	1
	.local	_.str.94
_.str.94:
	.asciz	"domestic"

	.section	.rodata._.str.95,"a",@progbits
	.balign	1
	.local	_.str.95
_.str.95:
	.asciz	"drawing"

	.section	.rodata._.str.96,"a",@progbits
	.balign	1
	.local	_.str.96
_.str.96:
	.asciz	"drives"

	.section	.rodata._.str.97,"a",@progbits
	.balign	1
	.local	_.str.97
_.str.97:
	.asciz	"during"

	.section	.rodata._.str.98,"a",@progbits
	.balign	1
	.local	_.str.98
_.str.98:
	.asciz	"economy"

	.section	.rodata._.str.99,"a",@progbits
	.balign	1
	.local	_.str.99
_.str.99:
	.asciz	"effect"

	.section	.rodata._.str.100,"a",@progbits
	.balign	1
	.local	_.str.100
_.str.100:
	.asciz	"employment"

	.section	.rodata._.str.101,"a",@progbits
	.balign	1
	.local	_.str.101
_.str.101:
	.asciz	"encourages"

	.section	.rodata._.str.102,"a",@progbits
	.balign	1
	.local	_.str.102
_.str.102:
	.asciz	"equal"

	.section	.rodata._.str.103,"a",@progbits
	.balign	1
	.local	_.str.103
_.str.103:
	.asciz	"equals"

	.section	.rodata._.str.104,"a",@progbits
	.balign	1
	.local	_.str.104
_.str.104:
	.asciz	"excess"

	.section	.rodata._.str.105,"a",@progbits
	.balign	1
	.local	_.str.105
_.str.105:
	.asciz	"factor"

	.section	.rodata._.str.106,"a",@progbits
	.balign	1
	.local	_.str.106
_.str.106:
	.asciz	"falling"

	.section	.rodata._.str.107,"a",@progbits
	.balign	1
	.local	_.str.107
_.str.107:
	.asciz	"federal"

	.section	.rodata._.str.108,"a",@progbits
	.balign	1
	.local	_.str.108
_.str.108:
	.asciz	"final"

	.section	.rodata._.str.109,"a",@progbits
	.balign	1
	.local	_.str.109
_.str.109:
	.asciz	"financial"

	.section	.rodata._.str.110,"a",@progbits
	.balign	1
	.local	_.str.110
_.str.110:
	.asciz	"fiscal"

	.section	.rodata._.str.111,"a",@progbits
	.balign	1
	.local	_.str.111
_.str.111:
	.asciz	"form"

	.section	.rodata._.str.112,"a",@progbits
	.balign	1
	.local	_.str.112
_.str.112:
	.asciz	"frictional"

	.section	.rodata._.str.113,"a",@progbits
	.balign	1
	.local	_.str.113
_.str.113:
	.asciz	"from"

	.section	.rodata._.str.114,"a",@progbits
	.balign	1
	.local	_.str.114
_.str.114:
	.asciz	"full"

	.section	.rodata._.str.115,"a",@progbits
	.balign	1
	.local	_.str.115
_.str.115:
	.asciz	"funds"

	.section	.rodata._.str.116,"a",@progbits
	.balign	1
	.local	_.str.116
_.str.116:
	.asciz	"gdp"

	.section	.rodata._.str.117,"a",@progbits
	.balign	1
	.local	_.str.117
_.str.117:
	.asciz	"give"

	.section	.rodata._.str.118,"a",@progbits
	.balign	1
	.local	_.str.118
_.str.118:
	.asciz	"given"

	.section	.rodata._.str.119,"a",@progbits
	.balign	1
	.local	_.str.119
_.str.119:
	.asciz	"good"

	.section	.rodata._.str.120,"a",@progbits
	.balign	1
	.local	_.str.120
_.str.120:
	.asciz	"goods"

	.section	.rodata._.str.121,"a",@progbits
	.balign	1
	.local	_.str.121
_.str.121:
	.asciz	"government"

	.section	.rodata._.str.122,"a",@progbits
	.balign	1
	.local	_.str.122
_.str.122:
	.asciz	"gross"

	.section	.rodata._.str.123,"a",@progbits
	.balign	1
	.local	_.str.123
_.str.123:
	.asciz	"held"

	.section	.rodata._.str.124,"a",@progbits
	.balign	1
	.local	_.str.124
_.str.124:
	.asciz	"hypothetical"

	.section	.rodata._.str.125,"a",@progbits
	.balign	1
	.local	_.str.125
_.str.125:
	.asciz	"increase"

	.section	.rodata._.str.126,"a",@progbits
	.balign	1
	.local	_.str.126
_.str.126:
	.asciz	"increased"

	.section	.rodata._.str.127,"a",@progbits
	.balign	1
	.local	_.str.127
_.str.127:
	.asciz	"increases"

	.section	.rodata._.str.128,"a",@progbits
	.balign	1
	.local	_.str.128
_.str.128:
	.asciz	"increasing"

	.section	.rodata._.str.129,"a",@progbits
	.balign	1
	.local	_.str.129
_.str.129:
	.asciz	"index"

	.section	.rodata._.str.130,"a",@progbits
	.balign	1
	.local	_.str.130
_.str.130:
	.asciz	"inflation"

	.section	.rodata._.str.131,"a",@progbits
	.balign	1
	.local	_.str.131
_.str.131:
	.asciz	"interest"

	.section	.rodata._.str.132,"a",@progbits
	.balign	1
	.local	_.str.132
_.str.132:
	.asciz	"investment"

	.section	.rodata._.str.133,"a",@progbits
	.balign	1
	.local	_.str.133
_.str.133:
	.asciz	"item"

	.section	.rodata._.str.134,"a",@progbits
	.balign	1
	.local	_.str.134
_.str.134:
	.asciz	"japan"

	.section	.rodata._.str.135,"a",@progbits
	.balign	1
	.local	_.str.135
_.str.135:
	.asciz	"labor"

	.section	.rodata._.str.136,"a",@progbits
	.balign	1
	.local	_.str.136
_.str.136:
	.asciz	"leftward"

	.section	.rodata._.str.137,"a",@progbits
	.balign	1
	.local	_.str.137
_.str.137:
	.asciz	"lenders"

	.section	.rodata._.str.138,"a",@progbits
	.balign	1
	.local	_.str.138
_.str.138:
	.asciz	"level"

	.section	.rodata._.str.139,"a",@progbits
	.balign	1
	.local	_.str.139
_.str.139:
	.asciz	"loanable"

	.section	.rodata._.str.140,"a",@progbits
	.balign	1
	.local	_.str.140
_.str.140:
	.asciz	"loans"

	.section	.rodata._.str.141,"a",@progbits
	.balign	1
	.local	_.str.141
_.str.141:
	.asciz	"lowering"

	.section	.rodata._.str.142,"a",@progbits
	.balign	1
	.local	_.str.142
_.str.142:
	.asciz	"market"

	.section	.rodata._.str.143,"a",@progbits
	.balign	1
	.local	_.str.143
_.str.143:
	.asciz	"measure"

	.section	.rodata._.str.144,"a",@progbits
	.balign	1
	.local	_.str.144
_.str.144:
	.asciz	"monetary"

	.section	.rodata._.str.145,"a",@progbits
	.balign	1
	.local	_.str.145
_.str.145:
	.asciz	"money"

	.section	.rodata._.str.146,"a",@progbits
	.balign	1
	.local	_.str.146
_.str.146:
	.asciz	"more"

	.section	.rodata._.str.147,"a",@progbits
	.balign	1
	.local	_.str.147
_.str.147:
	.asciz	"mpc"

	.section	.rodata._.str.148,"a",@progbits
	.balign	1
	.local	_.str.148
_.str.148:
	.asciz	"mps"

	.section	.rodata._.str.149,"a",@progbits
	.balign	1
	.local	_.str.149
_.str.149:
	.asciz	"multiplier"

	.section	.rodata._.str.150,"a",@progbits
	.balign	1
	.local	_.str.150
_.str.150:
	.asciz	"must"

	.section	.rodata._.str.151,"a",@progbits
	.balign	1
	.local	_.str.151
_.str.151:
	.asciz	"natural"

	.section	.rodata._.str.152,"a",@progbits
	.balign	1
	.local	_.str.152
_.str.152:
	.asciz	"negative"

	.section	.rodata._.str.153,"a",@progbits
	.balign	1
	.local	_.str.153
_.str.153:
	.asciz	"next"

	.section	.rodata._.str.154,"a",@progbits
	.balign	1
	.local	_.str.154
_.str.154:
	.asciz	"nominal"

	.section	.rodata._.str.155,"a",@progbits
	.balign	1
	.local	_.str.155
_.str.155:
	.asciz	"occurs"

	.section	.rodata._.str.156,"a",@progbits
	.balign	1
	.local	_.str.156
_.str.156:
	.asciz	"opportunity"

	.section	.rodata._.str.157,"a",@progbits
	.balign	1
	.local	_.str.157
_.str.157:
	.asciz	"other"

	.section	.rodata._.str.158,"a",@progbits
	.balign	1
	.local	_.str.158
_.str.158:
	.asciz	"others"

	.section	.rodata._.str.159,"a",@progbits
	.balign	1
	.local	_.str.159
_.str.159:
	.asciz	"output"

	.section	.rodata._.str.160,"a",@progbits
	.balign	1
	.local	_.str.160
_.str.160:
	.asciz	"payments"

	.section	.rodata._.str.161,"a",@progbits
	.balign	1
	.local	_.str.161
_.str.161:
	.asciz	"percent"

	.section	.rodata._.str.162,"a",@progbits
	.balign	1
	.local	_.str.162
_.str.162:
	.asciz	"period"

	.section	.rodata._.str.163,"a",@progbits
	.balign	1
	.local	_.str.163
_.str.163:
	.asciz	"plus"

	.section	.rodata._.str.164,"a",@progbits
	.balign	1
	.local	_.str.164
_.str.164:
	.asciz	"policy"

	.section	.rodata._.str.165,"a",@progbits
	.balign	1
	.local	_.str.165
_.str.165:
	.asciz	"power"

	.section	.rodata._.str.166,"a",@progbits
	.balign	1
	.local	_.str.166
_.str.166:
	.asciz	"price"

	.section	.rodata._.str.167,"a",@progbits
	.balign	1
	.local	_.str.167
_.str.167:
	.asciz	"prices"

	.section	.rodata._.str.168,"a",@progbits
	.balign	1
	.local	_.str.168
_.str.168:
	.asciz	"private"

	.section	.rodata._.str.169,"a",@progbits
	.balign	1
	.local	_.str.169
_.str.169:
	.asciz	"prob"

	.section	.rodata._.str.170,"a",@progbits
	.balign	1
	.local	_.str.170
_.str.170:
	.asciz	"produce"

	.section	.rodata._.str.171,"a",@progbits
	.balign	1
	.local	_.str.171
_.str.171:
	.asciz	"produced"

	.section	.rodata._.str.172,"a",@progbits
	.balign	1
	.local	_.str.172
_.str.172:
	.asciz	"produces"

	.section	.rodata._.str.173,"a",@progbits
	.balign	1
	.local	_.str.173
_.str.173:
	.asciz	"product"

	.section	.rodata._.str.174,"a",@progbits
	.balign	1
	.local	_.str.174
_.str.174:
	.asciz	"purchasing"

	.section	.rodata._.str.175,"a",@progbits
	.balign	1
	.local	_.str.175
_.str.175:
	.asciz	"quantity"

	.section	.rodata._.str.176,"a",@progbits
	.balign	1
	.local	_.str.176
_.str.176:
	.asciz	"raises"

	.section	.rodata._.str.177,"a",@progbits
	.balign	1
	.local	_.str.177
_.str.177:
	.asciz	"raising"

	.section	.rodata._.str.178,"a",@progbits
	.balign	1
	.local	_.str.178
_.str.178:
	.asciz	"rate"

	.section	.rodata._.str.179,"a",@progbits
	.balign	1
	.local	_.str.179
_.str.179:
	.asciz	"rates"

	.section	.rodata._.str.180,"a",@progbits
	.balign	1
	.local	_.str.180
_.str.180:
	.asciz	"ratio"

	.section	.rodata._.str.181,"a",@progbits
	.balign	1
	.local	_.str.181
_.str.181:
	.asciz	"real"

	.section	.rodata._.str.182,"a",@progbits
	.balign	1
	.local	_.str.182
_.str.182:
	.asciz	"reduces"

	.section	.rodata._.str.183,"a",@progbits
	.balign	1
	.local	_.str.183
_.str.183:
	.asciz	"relationship"

	.section	.rodata._.str.184,"a",@progbits
	.balign	1
	.local	_.str.184
_.str.184:
	.asciz	"required"

	.section	.rodata._.str.185,"a",@progbits
	.balign	1
	.local	_.str.185
_.str.185:
	.asciz	"reserve"

	.section	.rodata._.str.186,"a",@progbits
	.balign	1
	.local	_.str.186
_.str.186:
	.asciz	"reserves"

	.section	.rodata._.str.187,"a",@progbits
	.balign	1
	.local	_.str.187
_.str.187:
	.asciz	"resources"

	.section	.rodata._.str.188,"a",@progbits
	.balign	1
	.local	_.str.188
_.str.188:
	.asciz	"rule"

	.section	.rodata._.str.189,"a",@progbits
	.balign	1
	.local	_.str.189
_.str.189:
	.asciz	"same"

	.section	.rodata._.str.190,"a",@progbits
	.balign	1
	.local	_.str.190
_.str.190:
	.asciz	"service"

	.section	.rodata._.str.191,"a",@progbits
	.balign	1
	.local	_.str.191
_.str.191:
	.asciz	"services"

	.section	.rodata._.str.192,"a",@progbits
	.balign	1
	.local	_.str.192
_.str.192:
	.asciz	"shift"

	.section	.rodata._.str.193,"a",@progbits
	.balign	1
	.local	_.str.193
_.str.193:
	.asciz	"shifts"

	.section	.rodata._.str.194,"a",@progbits
	.balign	1
	.local	_.str.194
_.str.194:
	.asciz	"shock"

	.section	.rodata._.str.195,"a",@progbits
	.balign	1
	.local	_.str.195
_.str.195:
	.asciz	"shows"

	.section	.rodata._.str.196,"a",@progbits
	.balign	1
	.local	_.str.196
_.str.196:
	.asciz	"spending"

	.section	.rodata._.str.197,"a",@progbits
	.balign	1
	.local	_.str.197
_.str.197:
	.asciz	"sras"

	.section	.rodata._.str.198,"a",@progbits
	.balign	1
	.local	_.str.198
_.str.198:
	.asciz	"stagflation"

	.section	.rodata._.str.199,"a",@progbits
	.balign	1
	.local	_.str.199
_.str.199:
	.asciz	"structural"

	.section	.rodata._.str.200,"a",@progbits
	.balign	1
	.local	_.str.200
_.str.200:
	.asciz	"summary"

	.section	.rodata._.str.201,"a",@progbits
	.balign	1
	.local	_.str.201
_.str.201:
	.asciz	"supply"

	.section	.rodata._.str.202,"a",@progbits
	.balign	1
	.local	_.str.202
_.str.202:
	.asciz	"taxes"

	.section	.rodata._.str.203,"a",@progbits
	.balign	1
	.local	_.str.203
_.str.203:
	.asciz	"than"

	.section	.rodata._.str.204,"a",@progbits
	.balign	1
	.local	_.str.204
_.str.204:
	.asciz	"that"

	.section	.rodata._.str.205,"a",@progbits
	.balign	1
	.local	_.str.205
_.str.205:
	.asciz	"times"

	.section	.rodata._.str.206,"a",@progbits
	.balign	1
	.local	_.str.206
_.str.206:
	.asciz	"total"

	.section	.rodata._.str.207,"a",@progbits
	.balign	1
	.local	_.str.207
_.str.207:
	.asciz	"transactions"

	.section	.rodata._.str.208,"a",@progbits
	.balign	1
	.local	_.str.208
_.str.208:
	.asciz	"unemployment"

	.section	.rodata._.str.209,"a",@progbits
	.balign	1
	.local	_.str.209
_.str.209:
	.asciz	"units"

	.section	.rodata._.str.210,"a",@progbits
	.balign	1
	.local	_.str.210
_.str.210:
	.asciz	"using"

	.section	.rodata._.str.211,"a",@progbits
	.balign	1
	.local	_.str.211
_.str.211:
	.asciz	"value"

	.section	.rodata._.str.212,"a",@progbits
	.balign	1
	.local	_.str.212
_.str.212:
	.asciz	"vaults"

	.section	.rodata._.str.213,"a",@progbits
	.balign	1
	.local	_.str.213
_.str.213:
	.asciz	"vs"

	.section	.rodata._.str.214,"a",@progbits
	.balign	1
	.local	_.str.214
_.str.214:
	.asciz	"wealth"

	.section	.rodata._.str.215,"a",@progbits
	.balign	1
	.local	_.str.215
_.str.215:
	.asciz	"what"

	.section	.rodata._.str.216,"a",@progbits
	.balign	1
	.local	_.str.216
_.str.216:
	.asciz	"when"

	.section	.rodata._.str.217,"a",@progbits
	.balign	1
	.local	_.str.217
_.str.217:
	.asciz	"where"

	.section	.rodata._.str.218,"a",@progbits
	.balign	1
	.local	_.str.218
_.str.218:
	.asciz	"which"

	.section	.rodata._.str.219,"a",@progbits
	.balign	1
	.local	_.str.219
_.str.219:
	.asciz	"with"

	.section	.rodata._.str.220,"a",@progbits
	.balign	1
	.local	_.str.220
_.str.220:
	.asciz	"word"

	.section	.rodata._.str.221,"a",@progbits
	.balign	1
	.local	_.str.221
_.str.221:
	.asciz	"year"

	.section	.bss._g_db,"aw",@nobits
	.balign	2
	.globl	_g_db
_g_db:
	.zero	72

	.section	.rodata._.str.222,"a",@progbits
	.balign	1
	.local	_.str.222
_.str.222:
	.asciz	"Error: Failed to load STATDAT1"

	.section	.rodata._.str.225,"a",@progbits
	.balign	1
	.local	_.str.225
_.str.225:
	.asciz	" "

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	_gfx_FillRectangle
	.extern	_llvm.lifetime.end.p0
	.extern	__Unwind_SjLj_Unregister
	.extern	_kb_Scan
	.extern	__ineg
	.extern	_rand
	.extern	_os_GetCSC
	.extern	__inot
	.extern	_ti_Open
	.extern	_gfx_GetStringWidth
	.extern	__ladd
	.extern	_gfx_GetCharWidth
	.extern	__irems
	.extern	_llvm.eh.sjlj.lsda
	.extern	_strcpy
	.extern	__setflag
	.extern	_llvm.stacksave.p0
	.extern	_ti_Close
	.extern	_llvm.lifetime.start.p0
	.extern	_gfx_SetTextTransparentColor
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_ti_GetSize
	.extern	__iremu
	.extern	_gfx_FillScreen
	.extern	_gfx_PrintStringXY
	.extern	_llvm.memset.p0.i24
	.extern	_gfx_SetColor
	.extern	_llvm.memcpy.p0.p0.i24
	.extern	_gfx_End
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.frameaddress.p0
	.extern	__lshl
	.extern	_llvm.stackrestore.p0
	.extern	_gfx_HorizLine
	.extern	_sprintf
	.extern	__lcmpu
	.extern	_gfx_SetTextFGColor
	.extern	_gfx_Begin
	.extern	_strncpy
	.extern	_llvm.smax.i24
	.extern	__bdivu
	.extern	_gfx_SetTextBGColor
	.extern	_gfx_SwapDraw
	.extern	_strlen
	.extern	__frameset
	.extern	__ishrs_1
	.extern	__imulu
	.extern	_strtok
	.extern	_tolower
	.extern	_llvm.eh.sjlj.callsite
	.extern	_ti_GetDataPtr
	.extern	__lmulu
	.extern	__frameset0
	.extern	__Unwind_SjLj_Register
	.extern	__ishrs
	.extern	_delay
	.extern	_gfx_SetDraw
	.extern	__ishl
