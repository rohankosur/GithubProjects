	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"llvm-link"
	.section	.text._init_database,"ax",@progbits
	.globl	_init_database                  ; -- Begin function init_database
	.type	_init_database,@function
_init_database:                         ; @init_database
; %bb.0:
	ld	hl, -23
	call	__frameset
	ld	iy, (ix + 6)
	xor	a, a
	ld	hl, ___const.init_database.name
	ld	bc, 9
	ld	de, 42
	ld	(ix - 13), de
	ld	e, 49
	ld	(ix - 10), e
	lea	de, ix - 9
	ld	(iy), a
	ld	(ix - 19), de
	ldir
	ld	bc, 1
	ld	de, 11
	ld	(ix - 16), de
	.local	.LBB0_1
.LBB0_1:                                ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB0_5
; %bb.2:                                ;   in Loop: Header=BB0_1 Depth=1
	ld	(ix - 22), bc
	ld	a, (ix - 10)
	ld	(ix - 2), a
	ld	hl, _.str
	push	hl
	ld	hl, (ix - 19)
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	ld	hl, (ix + 6)
	or	a, a
	jr	z, .LBB0_4
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	push	hl
	pop	iy
	ld	bc, (ix - 22)
	add	iy, bc
	ld	(iy), e
	ld	l, e
	push	hl
	ld	(ix - 23), e                    ; 1-byte Folded Spill
	call	_ti_GetDataPtr
	pop	de
	ld	iy, (ix + 6)
	ld	de, (ix - 16)
	add	iy, de
	ld	(iy), hl
	ld	l, (ix - 23)                    ; 1-byte Folded Reload
	push	hl
	call	_ti_GetSize
	ld	bc, (ix - 22)
	pop	de
	ld	de, (ix + 6)
	push	de
	pop	iy
	ld	de, (ix - 13)
	add	iy, de
	ld	(iy), l
	ld	(iy + 1), h
	ld	hl, (ix + 6)
	inc	(hl)
	ld	a, (hl)
	inc	(ix - 10)
	inc	bc
	ld	iy, (ix - 16)
	ld	de, 3
	add	iy, de
	ld	hl, (ix - 13)
	dec	de
	add	hl, de
	ld	(ix - 13), hl
	ld	(ix - 16), iy
	ld	de, 11
	jp	.LBB0_1
	.local	.LBB0_4
.LBB0_4:
	ld	a, (hl)
	.local	.LBB0_5
.LBB0_5:                                ; %.loopexit
	ld	(ix - 10), a                    ; 1-byte Folded Spill
	or	a, a
	jr	z, .LBB0_7
; %bb.6:
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	iy, (iy + 11)
	ld	(ix - 13), iy
	ld	e, (iy)
	ld	d, 0
	ld	a, (iy + 1)
	ld	h, d
	ld	l, a
	ld	h, l
	ld	l, d
	add.sis	hl, de
	ld	iy, (ix + 6)
	ld	(iy + 62), l
	ld	(iy + 63), h
	ld	c, l
	ld	b, h
	ld	iy, (ix - 13)
	lea	hl, iy + 2
	ld	iy, (ix + 6)
	ld	(iy + 64), hl
	ld	de, 0
	push	de
	pop	hl
	ld	l, c
	ld	h, b
	ld	bc, 6
	call	__imulu
	ld	bc, 2
	add	hl, bc
	ld	a, e
	ld	(iy + 67), hl
	ld	(iy + 70), a
	.local	.LBB0_7
.LBB0_7:
	ld	a, (ix - 10)                    ; 1-byte Folded Reload
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
	ld	hl, _.str.2632
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	hl, 120
	push	hl
	ld	hl, _.str.2633
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	hl, 140
	push	hl
	ld	hl, _.str.2634
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
	ld	hl, _.str.2635
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
	ld	hl, _.str.2636
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
	ld	bc, 2633
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	push	de
	pop	hl
	jp	p, .LBB9_14
; %bb.13:                               ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, 2632
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
	ld	hl, _.str.2637
	ld	a, (hl)
	ld	(iy), a
	ld	a, (_.str.2637+1)
	ld	(iy + 1), a
	ld	a, (_.str.2637+2)
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
	ld	de, 88
	push	de
	push	hl
	ld	hl, _.str.2638
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
	ld	bc, 2631
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
	ld.sis	iy, 0
	ld	(ix - 42), bc
	.local	.LBB9_55
.LBB9_55:                               ;   Parent Loop BB9_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	hl
	pop	de
	ld	bc, 7896
	or	a, a
	sbc	hl, bc
	jp	z, .LBB9_72
; %bb.56:                               ;   in Loop: Header=BB9_55 Depth=2
	ld	hl, _search_terms
	push	de
	pop	bc
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
	inc.sis	iy
	ex	de, hl
	ld	bc, 3
	add	hl, bc
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
	ld	de, 2617
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
	ld	bc, 87
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
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	ld.sis	bc, 30
	call	__sdivu
	ld	de, 0
	ld	e, l
	ld	d, h
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
	ld	hl, _.str.2639
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
	ld	hl, _.str.2645
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 20
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.2646
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 35
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.2647
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 50
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.2648
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 65
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.2649
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
	ld	hl, _.str.2658
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
	ld	hl, _.str.2659
	jr	z, .LBB10_9
; %bb.8:                                ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.2660
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
	ld	hl, _.str.2661
	jr	z, .LBB10_11
; %bb.10:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.2662
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
	ld	hl, _.str.2663
	jr	z, .LBB10_13
; %bb.12:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.2664
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
	ld	hl, _.str.2665
	jr	z, .LBB10_15
; %bb.14:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.2666
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
	ld	hl, _.str.2667
	jr	z, .LBB10_17
; %bb.16:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.2668
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
	ld	hl, _.str.2669
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
	ld	hl, _.str.2650
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	bit	0, (ix - 119)                   ; 1-byte Folded Reload
	ld	hl, _.str.2651
	jr	nz, .LBB10_22
; %bb.21:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	hl, _.str.2652
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
	ld	hl, _.str.2653
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
	ld	hl, _.str.2654
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 175
	push	hl
	ld	hl, 10
	push	hl
	ld	hl, _.str.2655
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 190
	push	hl
	ld	hl, 10
	push	hl
	ld	hl, _.str.2656
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
	ld	hl, _.str.2657
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
	jp	nz, .LBB10_3
; %bb.26:                               ;   in Loop: Header=BB10_3 Depth=3
	bit	0, (ix - 123)                   ; 1-byte Folded Reload
	jr	z, .LBB10_36
; %bb.27:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	a, e
	cp	a, 15
	jp	z, .LBB10_97
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
	jp	z, .LBB10_98
; %bb.37:                               ;   in Loop: Header=BB10_3 Depth=3
	ld	iy, (ix - 49)
	ld	a, e
	cp	a, 9
	jr	nz, .LBB10_39
; %bb.38:                               ;   in Loop: Header=BB10_3 Depth=3
	lea	hl, iy + 0
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	dec	bc
	call	pe, __setflag
	jp	p, .LBB10_63
	.local	.LBB10_39
.LBB10_39:                              ;   in Loop: Header=BB10_3 Depth=3
	push	ix
	lea	ix, ix - 128
	ld	(ix - 4), iy
	pop	ix
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
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _.str.136
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
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _.str.677
	ld	bc, 10
	ldir
	jr	.LBB10_73
	.local	.LBB10_67
.LBB10_67:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, (ix - 122)
	inc	hl
	jp	.LBB10_96
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
	ld	bc, -144
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	.local	.LBB10_75
.LBB10_75:                              ;   Parent Loop BB10_1 Depth=1
                                        ;     Parent Loop BB10_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ld	a, e
	or	a, a
	jr	z, .LBB10_77
; %bb.76:                               ;   in Loop: Header=BB10_75 Depth=3
	ld	a, e
	rlc	a
	sbc	hl, hl
	ld	l, e
	push	hl
	ld	de, -132
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	call	_tolower
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 4)
	pop	ix
	pop	de
	ld	a, l
	ld	(iy - 1), a
	ld	e, (iy)
	inc	iy
	jr	.LBB10_75
	.local	.LBB10_77
.LBB10_77:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	de, -138
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_djb2_hash
                                        ; kill: def $e killed $e def $ude
	pop	bc
	ld	iy, (ix + 6)
	ld	bc, (iy + 64)
	push	ix
	lea	ix, ix - 128
	ld	(ix - 4), bc
	pop	ix
	ld	bc, (iy + 62)
	pea	ix - 118
	pea	ix - 117
	push	de
	push	hl
	push	bc
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_binary_search_keyword
	pop	hl
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
	jp	.LBB10_96
	.local	.LBB10_81
.LBB10_81:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	(ix - 46), 0
	or	a, a
	sbc	hl, hl
	ld	(ix - 49), hl
	ld	hl, _.str.2673
	jr	.LBB10_83
	.local	.LBB10_82
.LBB10_82:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, _.str.2672
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
	ld	de, -138
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_djb2_hash
                                        ; kill: def $e killed $e def $ude
	pop	bc
	ld	iy, (ix + 6)
	ld	bc, (iy + 64)
	push	ix
	lea	ix, ix - 128
	ld	(ix - 4), bc
	pop	ix
	ld	bc, (iy + 62)
	pea	ix - 118
	pea	ix - 117
	push	de
	push	hl
	push	bc
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_binary_search_keyword
	pop	hl
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
	jp	.LBB10_96
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
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _.str.522
	ld	bc, 11
	ldir
	ld	e, 99
	jp	.LBB10_74
	.local	.LBB10_91
.LBB10_91:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	hl, (ix - 79)
	or	a, a
	sbc	hl, de
	push	de
	pop	bc
	jp	c, .LBB10_95
; %bb.92:                               ;   in Loop: Header=BB10_2 Depth=2
	ld	a, 1
	ld	(ix - 123), a                   ; 1-byte Folded Spill
	ld	hl, 2
	jp	.LBB10_96
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
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _.str.1568
	ld	bc, 5
	ldir
	ld	e, 110
	jp	.LBB10_74
	.local	.LBB10_95
.LBB10_95:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	de, (ix - 82)
	ld	hl, (ix - 85)
	or	a, a
	sbc	hl, bc
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	push	bc
	pop	iy
	ld	c, a
	ex	de, hl
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
                                        ; kill: def $a killed $a
	sbc	a, a
	and	a, c
	ld	l, a
	ld	bc, 1
	call	__iand
	ld	de, 3
	add	hl, de
	ld	a, c
	ld	(ix - 123), a                   ; 1-byte Folded Spill
	.local	.LBB10_96
.LBB10_96:                              ;   in Loop: Header=BB10_2 Depth=2
	ld	(ix - 122), hl
	jp	.LBB10_62
	.local	.LBB10_97
.LBB10_97:                              ;   in Loop: Header=BB10_1 Depth=1
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
	jr	.LBB10_100
	.local	.LBB10_98
.LBB10_98:                              ;   in Loop: Header=BB10_1 Depth=1
	ld	hl, (ix - 49)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB10_101
; %bb.99:                               ;   in Loop: Header=BB10_1 Depth=1
	or	a, a
	sbc	hl, hl
	ld	(ix - 49), hl
	ld	(ix - 46), h
	.local	.LBB10_100
.LBB10_100:                             ;   in Loop: Header=BB10_1 Depth=1
	ld	d, (ix - 119)                   ; 1-byte Folded Reload
	jp	.LBB10_1
	.local	.LBB10_101
.LBB10_101:
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
	ld	hl, _.str.2670
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
	.section	.text._binary_search_keyword,"ax",@progbits
	.globl	_binary_search_keyword          ; -- Begin function binary_search_keyword
	.type	_binary_search_keyword,@function
_binary_search_keyword:                 ; @binary_search_keyword
; %bb.0:
	ld	hl, -14
	call	__frameset
	ld	hl, (ix + 9)
	ld	de, 0
	ld	bc, 0
	ld	c, l
	ld	b, h
	dec	bc
	.local	.LBB13_1
.LBB13_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB13_8
; %bb.2:                                ;   in Loop: Header=BB13_1 Depth=1
	ld	(ix - 5), bc
	push	bc
	pop	hl
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
	push	de
	pop	bc
	ex	de, hl
	add	iy, de
	lea	hl, iy + 0
	call	__ishrs_1
	ld	(ix - 8), bc
	add	hl, bc
	ld	(ix - 14), hl
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
	ld	(ix - 11), hl
	or	a, a
	sbc	hl, hl
	ld	d, l
	ld	a, (iy + 2)
	ld	(ix - 2), l
	ld	bc, (ix - 4)
	ld	b, l
	ld	c, a
	ld	a, d
	ld	l, 16
	call	__lshl
	push	bc
	pop	hl
	ld	e, a
	ld	bc, (ix - 11)
	ld	a, d
	call	__ladd
	ld	(ix - 11), hl
	ld	a, (iy + 3)
	ld	l, 0
	ld	(ix - 1), l
	ld	bc, (ix - 3)
	ld	b, l
	ld	c, a
	ld	a, d
	ld	l, 24
	call	__lshl
	ld	hl, (ix - 11)
	call	__ladd
	ld	bc, (ix + 12)
	ld	a, (ix + 15)
	call	__lcmpu
	jp	z, .LBB13_7
; %bb.3:                                ;   in Loop: Header=BB13_1 Depth=1
	call	__lcmpu
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	bit	0, a
	ld	bc, (ix - 5)
	jr	nz, .LBB13_5
; %bb.4:                                ;   in Loop: Header=BB13_1 Depth=1
	ld	bc, (ix - 14)
	dec	bc
	.local	.LBB13_5
.LBB13_5:                               ;   in Loop: Header=BB13_1 Depth=1
	bit	0, a
	ld	de, (ix - 8)
	jp	z, .LBB13_1
; %bb.6:                                ;   in Loop: Header=BB13_1 Depth=1
	ld	de, (ix - 14)
	inc	de
	jp	.LBB13_1
	.local	.LBB13_7
.LBB13_7:
	ld	a, (iy + 4)
	ld	hl, (ix + 18)
	ld	(hl), a
	ld	a, (iy + 5)
	ld	hl, (ix + 21)
	ld	(hl), a
	ld	bc, (ix - 5)
	ld	de, (ix - 8)
	.local	.LBB13_8
.LBB13_8:                               ; %.loopexit
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB13_10
; %bb.9:                                ; %.loopexit
	ld	a, 0
	jr	.LBB13_11
	.local	.LBB13_10
.LBB13_10:
	ld	a, -1
	.local	.LBB13_11
.LBB13_11:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end13
.Lfunc_end13:
	.size	_binary_search_keyword, .Lfunc_end13-_binary_search_keyword
                                        ; -- End function
	.section	.rodata.___const.init_database.name,"a",@progbits
	.balign	1
	.local	___const.init_database.name
___const.init_database.name:
	.asciz	"STATDAT1"

	.section	.rodata._.str,"a",@progbits
	.balign	1
	.local	_.str
_.str:
	.asciz	"r"

	.section	.rodata._.str.4,"a",@progbits
	.balign	1
	.local	_.str.4
_.str.4:
	.asciz	"standard deviation"

	.section	.rodata._.str.7,"a",@progbits
	.balign	1
	.local	_.str.7
_.str.7:
	.asciz	"confidence interval"

	.section	.data._g_compression_dict,"aw",@progbits
	.balign	1
	.globl	_g_compression_dict
_g_compression_dict:
	d24	_.str.2669
	d24	_.str.729
	d24	_.str.1752
	d24	_.str.1805
	d24	_.str.4
	d24	_.str.1828
	d24	_.str.1139
	d24	_.str.7
	d24	_.str.2120
	d24	_.str.1874
	d24	_.str.2017
	d24	_.str.2507
	d24	_.str.872
	d24	_.str.1583
	d24	_.str.1961
	d24	_.str.563
	d24	_.str.1917
	d24	_.str.1179
	d24	_.str.2218
	d24	_.str.1652
	d24	_.str.849
	d24	_.str.1421
	d24	_.str.1436
	d24	_.str.1553
	d24	_.str.517

	.section	.rodata._g_dict_size,"a",@progbits
	.balign	1
	.globl	_g_dict_size
_g_dict_size:
	db	24                              ; 0x18

	.section	.rodata._.str.25,"a",@progbits
	.balign	1
	.local	_.str.25
_.str.25:
	.asciz	"1654"

	.section	.rodata._.str.1.26,"a",@progbits
	.balign	1
	.local	_.str.1.26
_.str.1.26:
	.asciz	"1713"

	.section	.rodata._.str.2.27,"a",@progbits
	.balign	1
	.local	_.str.2.27
_.str.2.27:
	.asciz	"1763"

	.section	.rodata._.str.3.28,"a",@progbits
	.balign	1
	.local	_.str.3.28
_.str.3.28:
	.asciz	"1809"

	.section	.rodata._.str.4.29,"a",@progbits
	.balign	1
	.local	_.str.4.29
_.str.4.29:
	.asciz	"1900"

	.section	.rodata._.str.5.30,"a",@progbits
	.balign	1
	.local	_.str.5.30
_.str.5.30:
	.asciz	"1908"

	.section	.rodata._.str.6.31,"a",@progbits
	.balign	1
	.local	_.str.6.31
_.str.6.31:
	.asciz	"1925"

	.section	.rodata._.str.7.32,"a",@progbits
	.balign	1
	.local	_.str.7.32
_.str.7.32:
	.asciz	"1933"

	.section	.rodata._.str.8.33,"a",@progbits
	.balign	1
	.local	_.str.8.33
_.str.8.33:
	.asciz	"1936"

	.section	.rodata._.str.9.34,"a",@progbits
	.balign	1
	.local	_.str.9.34
_.str.9.34:
	.asciz	"1940s"

	.section	.rodata._.str.10.35,"a",@progbits
	.balign	1
	.local	_.str.10.35
_.str.10.35:
	.asciz	"1948"

	.section	.rodata._.str.11.36,"a",@progbits
	.balign	1
	.local	_.str.11.36
_.str.11.36:
	.asciz	"1954"

	.section	.rodata._.str.12.37,"a",@progbits
	.balign	1
	.local	_.str.12.37
_.str.12.37:
	.asciz	"1970"

	.section	.rodata._.str.13.38,"a",@progbits
	.balign	1
	.local	_.str.13.38
_.str.13.38:
	.asciz	"1972"

	.section	.rodata._.str.14.39,"a",@progbits
	.balign	1
	.local	_.str.14.39
_.str.14.39:
	.asciz	"1973"

	.section	.rodata._.str.15.40,"a",@progbits
	.balign	1
	.local	_.str.15.40
_.str.15.40:
	.asciz	"1975"

	.section	.rodata._.str.16.41,"a",@progbits
	.balign	1
	.local	_.str.16.41
_.str.16.41:
	.asciz	"1977"

	.section	.rodata._.str.17.42,"a",@progbits
	.balign	1
	.local	_.str.17.42
_.str.17.42:
	.asciz	"1978"

	.section	.rodata._.str.18.43,"a",@progbits
	.balign	1
	.local	_.str.18.43
_.str.18.43:
	.asciz	"1980"

	.section	.rodata._.str.19.44,"a",@progbits
	.balign	1
	.local	_.str.19.44
_.str.19.44:
	.asciz	"1985"

	.section	.rodata._.str.20.45,"a",@progbits
	.balign	1
	.local	_.str.20.45
_.str.20.45:
	.asciz	"1986"

	.section	.rodata._.str.21.46,"a",@progbits
	.balign	1
	.local	_.str.21.46
_.str.21.46:
	.asciz	"1987"

	.section	.rodata._.str.22.47,"a",@progbits
	.balign	1
	.local	_.str.22.47
_.str.22.47:
	.asciz	"1988"

	.section	.rodata._.str.23.48,"a",@progbits
	.balign	1
	.local	_.str.23.48
_.str.23.48:
	.asciz	"1989"

	.section	.rodata._.str.24.49,"a",@progbits
	.balign	1
	.local	_.str.24.49
_.str.24.49:
	.asciz	"1990"

	.section	.rodata._.str.25.50,"a",@progbits
	.balign	1
	.local	_.str.25.50
_.str.25.50:
	.asciz	"1992"

	.section	.rodata._.str.26,"a",@progbits
	.balign	1
	.local	_.str.26
_.str.26:
	.asciz	"1993"

	.section	.rodata._.str.27,"a",@progbits
	.balign	1
	.local	_.str.27
_.str.27:
	.asciz	"1994"

	.section	.rodata._.str.28,"a",@progbits
	.balign	1
	.local	_.str.28
_.str.28:
	.asciz	"1995"

	.section	.rodata._.str.29,"a",@progbits
	.balign	1
	.local	_.str.29
_.str.29:
	.asciz	"1997"

	.section	.rodata._.str.30,"a",@progbits
	.balign	1
	.local	_.str.30
_.str.30:
	.asciz	"1998"

	.section	.rodata._.str.31,"a",@progbits
	.balign	1
	.local	_.str.31
_.str.31:
	.asciz	"1999"

	.section	.rodata._.str.32,"a",@progbits
	.balign	1
	.local	_.str.32
_.str.32:
	.asciz	"19th"

	.section	.rodata._.str.33,"a",@progbits
	.balign	1
	.local	_.str.33
_.str.33:
	.asciz	"1e99"

	.section	.rodata._.str.34,"a",@progbits
	.balign	1
	.local	_.str.34
_.str.34:
	.asciz	"2000"

	.section	.rodata._.str.35,"a",@progbits
	.balign	1
	.local	_.str.35
_.str.35:
	.asciz	"2001"

	.section	.rodata._.str.36,"a",@progbits
	.balign	1
	.local	_.str.36
_.str.36:
	.asciz	"2002"

	.section	.rodata._.str.37,"a",@progbits
	.balign	1
	.local	_.str.37
_.str.37:
	.asciz	"2003"

	.section	.rodata._.str.38,"a",@progbits
	.balign	1
	.local	_.str.38
_.str.38:
	.asciz	"2004"

	.section	.rodata._.str.39,"a",@progbits
	.balign	1
	.local	_.str.39
_.str.39:
	.asciz	"2005"

	.section	.rodata._.str.40,"a",@progbits
	.balign	1
	.local	_.str.40
_.str.40:
	.asciz	"2006"

	.section	.rodata._.str.41,"a",@progbits
	.balign	1
	.local	_.str.41
_.str.41:
	.asciz	"2007"

	.section	.rodata._.str.42,"a",@progbits
	.balign	1
	.local	_.str.42
_.str.42:
	.asciz	"2008"

	.section	.rodata._.str.43,"a",@progbits
	.balign	1
	.local	_.str.43
_.str.43:
	.asciz	"2009"

	.section	.rodata._.str.44,"a",@progbits
	.balign	1
	.local	_.str.44
_.str.44:
	.asciz	"2010"

	.section	.rodata._.str.45,"a",@progbits
	.balign	1
	.local	_.str.45
_.str.45:
	.asciz	"2011"

	.section	.rodata._.str.46,"a",@progbits
	.balign	1
	.local	_.str.46
_.str.46:
	.asciz	"2012"

	.section	.rodata._.str.47,"a",@progbits
	.balign	1
	.local	_.str.47
_.str.47:
	.asciz	"2013"

	.section	.rodata._.str.48,"a",@progbits
	.balign	1
	.local	_.str.48
_.str.48:
	.asciz	"2014"

	.section	.rodata._.str.49,"a",@progbits
	.balign	1
	.local	_.str.49
_.str.49:
	.asciz	"2015"

	.section	.rodata._.str.50,"a",@progbits
	.balign	1
	.local	_.str.50
_.str.50:
	.asciz	"2016"

	.section	.rodata._.str.51,"a",@progbits
	.balign	1
	.local	_.str.51
_.str.51:
	.asciz	"2017"

	.section	.rodata._.str.52,"a",@progbits
	.balign	1
	.local	_.str.52
_.str.52:
	.asciz	"2018"

	.section	.rodata._.str.53,"a",@progbits
	.balign	1
	.local	_.str.53
_.str.53:
	.asciz	"2019"

	.section	.rodata._.str.54,"a",@progbits
	.balign	1
	.local	_.str.54
_.str.54:
	.asciz	"2020"

	.section	.rodata._.str.55,"a",@progbits
	.balign	1
	.local	_.str.55
_.str.55:
	.asciz	"2021"

	.section	.rodata._.str.56,"a",@progbits
	.balign	1
	.local	_.str.56
_.str.56:
	.asciz	"2022"

	.section	.rodata._.str.57,"a",@progbits
	.balign	1
	.local	_.str.57
_.str.57:
	.asciz	"2023"

	.section	.rodata._.str.58,"a",@progbits
	.balign	1
	.local	_.str.58
_.str.58:
	.asciz	"250k"

	.section	.rodata._.str.59,"a",@progbits
	.balign	1
	.local	_.str.59
_.str.59:
	.asciz	"300kb"

	.section	.rodata._.str.60,"a",@progbits
	.balign	1
	.local	_.str.60
_.str.60:
	.asciz	"320k"

	.section	.rodata._.str.61,"a",@progbits
	.balign	1
	.local	_.str.61
_.str.61:
	.asciz	"320x240"

	.section	.rodata._.str.62,"a",@progbits
	.balign	1
	.local	_.str.62
_.str.62:
	.asciz	"5000000000"

	.section	.rodata._.str.63,"a",@progbits
	.balign	1
	.local	_.str.63
_.str.63:
	.asciz	"50th"

	.section	.rodata._.str.64,"a",@progbits
	.balign	1
	.local	_.str.64
_.str.64:
	.asciz	"8413447460"

	.section	.rodata._.str.65,"a",@progbits
	.balign	1
	.local	_.str.65
_.str.65:
	.asciz	"9500000000"

	.section	.rodata._.str.66,"a",@progbits
	.balign	1
	.local	_.str.66
_.str.66:
	.asciz	"95th"

	.section	.rodata._.str.67,"a",@progbits
	.balign	1
	.local	_.str.67
_.str.67:
	.asciz	"9750000000"

	.section	.rodata._.str.68,"a",@progbits
	.balign	1
	.local	_.str.68
_.str.68:
	.asciz	"9950000000"

	.section	.rodata._.str.69,"a",@progbits
	.balign	1
	.local	_.str.69
_.str.69:
	.asciz	"ability"

	.section	.rodata._.str.70,"a",@progbits
	.balign	1
	.local	_.str.70
_.str.70:
	.asciz	"able"

	.section	.rodata._.str.71,"a",@progbits
	.balign	1
	.local	_.str.71
_.str.71:
	.asciz	"about"

	.section	.rodata._.str.72,"a",@progbits
	.balign	1
	.local	_.str.72
_.str.72:
	.asciz	"above"

	.section	.rodata._.str.73,"a",@progbits
	.balign	1
	.local	_.str.73
_.str.73:
	.asciz	"abraham"

	.section	.rodata._.str.74,"a",@progbits
	.balign	1
	.local	_.str.74
_.str.74:
	.asciz	"absolute"

	.section	.rodata._.str.75,"a",@progbits
	.balign	1
	.local	_.str.75
_.str.75:
	.asciz	"accept"

	.section	.rodata._.str.76,"a",@progbits
	.balign	1
	.local	_.str.76
_.str.76:
	.asciz	"acceptable"

	.section	.rodata._.str.77,"a",@progbits
	.balign	1
	.local	_.str.77
_.str.77:
	.asciz	"acceptance"

	.section	.rodata._.str.78,"a",@progbits
	.balign	1
	.local	_.str.78
_.str.78:
	.asciz	"accepted"

	.section	.rodata._.str.79,"a",@progbits
	.balign	1
	.local	_.str.79
_.str.79:
	.asciz	"accepting"

	.section	.rodata._.str.80,"a",@progbits
	.balign	1
	.local	_.str.80
_.str.80:
	.asciz	"accessible"

	.section	.rodata._.str.81,"a",@progbits
	.balign	1
	.local	_.str.81
_.str.81:
	.asciz	"according"

	.section	.rodata._.str.82,"a",@progbits
	.balign	1
	.local	_.str.82
_.str.82:
	.asciz	"account"

	.section	.rodata._.str.83,"a",@progbits
	.balign	1
	.local	_.str.83
_.str.83:
	.asciz	"accounted"

	.section	.rodata._.str.84,"a",@progbits
	.balign	1
	.local	_.str.84
_.str.84:
	.asciz	"accounts"

	.section	.rodata._.str.85,"a",@progbits
	.balign	1
	.local	_.str.85
_.str.85:
	.asciz	"accuracy"

	.section	.rodata._.str.86,"a",@progbits
	.balign	1
	.local	_.str.86
_.str.86:
	.asciz	"accurate"

	.section	.rodata._.str.87,"a",@progbits
	.balign	1
	.local	_.str.87
_.str.87:
	.asciz	"accurately"

	.section	.rodata._.str.88,"a",@progbits
	.balign	1
	.local	_.str.88
_.str.88:
	.asciz	"achieve"

	.section	.rodata._.str.89,"a",@progbits
	.balign	1
	.local	_.str.89
_.str.89:
	.asciz	"across"

	.section	.rodata._.str.90,"a",@progbits
	.balign	1
	.local	_.str.90
_.str.90:
	.asciz	"action"

	.section	.rodata._.str.91,"a",@progbits
	.balign	1
	.local	_.str.91
_.str.91:
	.asciz	"actions"

	.section	.rodata._.str.92,"a",@progbits
	.balign	1
	.local	_.str.92
_.str.92:
	.asciz	"activity"

	.section	.rodata._.str.93,"a",@progbits
	.balign	1
	.local	_.str.93
_.str.93:
	.asciz	"actual"

	.section	.rodata._.str.94,"a",@progbits
	.balign	1
	.local	_.str.94
_.str.94:
	.asciz	"actually"

	.section	.rodata._.str.95,"a",@progbits
	.balign	1
	.local	_.str.95
_.str.95:
	.asciz	"added"

	.section	.rodata._.str.96,"a",@progbits
	.balign	1
	.local	_.str.96
_.str.96:
	.asciz	"adding"

	.section	.rodata._.str.97,"a",@progbits
	.balign	1
	.local	_.str.97
_.str.97:
	.asciz	"addition"

	.section	.rodata._.str.98,"a",@progbits
	.balign	1
	.local	_.str.98
_.str.98:
	.asciz	"address"

	.section	.rodata._.str.99,"a",@progbits
	.balign	1
	.local	_.str.99
_.str.99:
	.asciz	"adds"

	.section	.rodata._.str.100,"a",@progbits
	.balign	1
	.local	_.str.100
_.str.100:
	.asciz	"adherence"

	.section	.rodata._.str.101,"a",@progbits
	.balign	1
	.local	_.str.101
_.str.101:
	.asciz	"adjust"

	.section	.rodata._.str.102,"a",@progbits
	.balign	1
	.local	_.str.102
_.str.102:
	.asciz	"adjusted"

	.section	.rodata._.str.103,"a",@progbits
	.balign	1
	.local	_.str.103
_.str.103:
	.asciz	"adjusting"

	.section	.rodata._.str.104,"a",@progbits
	.balign	1
	.local	_.str.104
_.str.104:
	.asciz	"adjustment"

	.section	.rodata._.str.105,"a",@progbits
	.balign	1
	.local	_.str.105
_.str.105:
	.asciz	"admissible"

	.section	.rodata._.str.106,"a",@progbits
	.balign	1
	.local	_.str.106
_.str.106:
	.asciz	"admission"

	.section	.rodata._.str.107,"a",@progbits
	.balign	1
	.local	_.str.107
_.str.107:
	.asciz	"admissions"

	.section	.rodata._.str.108,"a",@progbits
	.balign	1
	.local	_.str.108
_.str.108:
	.asciz	"admitted"

	.section	.rodata._.str.109,"a",@progbits
	.balign	1
	.local	_.str.109
_.str.109:
	.asciz	"adolphe"

	.section	.rodata._.str.110,"a",@progbits
	.balign	1
	.local	_.str.110
_.str.110:
	.asciz	"adults"

	.section	.rodata._.str.111,"a",@progbits
	.balign	1
	.local	_.str.111
_.str.111:
	.asciz	"advanced"

	.section	.rodata._.str.112,"a",@progbits
	.balign	1
	.local	_.str.112
_.str.112:
	.asciz	"advantage"

	.section	.rodata._.str.113,"a",@progbits
	.balign	1
	.local	_.str.113
_.str.113:
	.asciz	"affect"

	.section	.rodata._.str.114,"a",@progbits
	.balign	1
	.local	_.str.114
_.str.114:
	.asciz	"affected"

	.section	.rodata._.str.115,"a",@progbits
	.balign	1
	.local	_.str.115
_.str.115:
	.asciz	"affects"

	.section	.rodata._.str.116,"a",@progbits
	.balign	1
	.local	_.str.116
_.str.116:
	.asciz	"african"

	.section	.rodata._.str.117,"a",@progbits
	.balign	1
	.local	_.str.117
_.str.117:
	.asciz	"after"

	.section	.rodata._.str.118,"a",@progbits
	.balign	1
	.local	_.str.118
_.str.118:
	.asciz	"afternoon"

	.section	.rodata._.str.119,"a",@progbits
	.balign	1
	.local	_.str.119
_.str.119:
	.asciz	"against"

	.section	.rodata._.str.120,"a",@progbits
	.balign	1
	.local	_.str.120
_.str.120:
	.asciz	"aggregated"

	.section	.rodata._.str.121,"a",@progbits
	.balign	1
	.local	_.str.121
_.str.121:
	.asciz	"akaike"

	.section	.rodata._.str.122,"a",@progbits
	.balign	1
	.local	_.str.122
_.str.122:
	.asciz	"alarm"

	.section	.rodata._.str.123,"a",@progbits
	.balign	1
	.local	_.str.123
_.str.123:
	.asciz	"algorithm"

	.section	.rodata._.str.124,"a",@progbits
	.balign	1
	.local	_.str.124
_.str.124:
	.asciz	"algorithms"

	.section	.rodata._.str.125,"a",@progbits
	.balign	1
	.local	_.str.125
_.str.125:
	.asciz	"alienation"

	.section	.rodata._.str.126,"a",@progbits
	.balign	1
	.local	_.str.126
_.str.126:
	.asciz	"allowed"

	.section	.rodata._.str.127,"a",@progbits
	.balign	1
	.local	_.str.127
_.str.127:
	.asciz	"allowing"

	.section	.rodata._.str.128,"a",@progbits
	.balign	1
	.local	_.str.128
_.str.128:
	.asciz	"allows"

	.section	.rodata._.str.129,"a",@progbits
	.balign	1
	.local	_.str.129
_.str.129:
	.asciz	"almost"

	.section	.rodata._.str.130,"a",@progbits
	.balign	1
	.local	_.str.130
_.str.130:
	.asciz	"alone"

	.section	.rodata._.str.131,"a",@progbits
	.balign	1
	.local	_.str.131
_.str.131:
	.asciz	"along"

	.section	.rodata._.str.132,"a",@progbits
	.balign	1
	.local	_.str.132
_.str.132:
	.asciz	"alpha"

	.section	.rodata._.str.133,"a",@progbits
	.balign	1
	.local	_.str.133
_.str.133:
	.asciz	"alphabetical"

	.section	.rodata._.str.134,"a",@progbits
	.balign	1
	.local	_.str.134
_.str.134:
	.asciz	"already"

	.section	.rodata._.str.135,"a",@progbits
	.balign	1
	.local	_.str.135
_.str.135:
	.asciz	"also"

	.section	.rodata._.str.136,"a",@progbits
	.balign	1
	.local	_.str.136
_.str.136:
	.asciz	"alternative"

	.section	.rodata._.str.137,"a",@progbits
	.balign	1
	.local	_.str.137
_.str.137:
	.asciz	"always"

	.section	.rodata._.str.138,"a",@progbits
	.balign	1
	.local	_.str.138
_.str.138:
	.asciz	"american"

	.section	.rodata._.str.139,"a",@progbits
	.balign	1
	.local	_.str.139
_.str.139:
	.asciz	"among"

	.section	.rodata._.str.140,"a",@progbits
	.balign	1
	.local	_.str.140
_.str.140:
	.asciz	"amount"

	.section	.rodata._.str.141,"a",@progbits
	.balign	1
	.local	_.str.141
_.str.141:
	.asciz	"analysis"

	.section	.rodata._.str.142,"a",@progbits
	.balign	1
	.local	_.str.142
_.str.142:
	.asciz	"analytical"

	.section	.rodata._.str.143,"a",@progbits
	.balign	1
	.local	_.str.143
_.str.143:
	.asciz	"analytics"

	.section	.rodata._.str.144,"a",@progbits
	.balign	1
	.local	_.str.144
_.str.144:
	.asciz	"analyze"

	.section	.rodata._.str.145,"a",@progbits
	.balign	1
	.local	_.str.145
_.str.145:
	.asciz	"analyzed"

	.section	.rodata._.str.146,"a",@progbits
	.balign	1
	.local	_.str.146
_.str.146:
	.asciz	"analyzing"

	.section	.rodata._.str.147,"a",@progbits
	.balign	1
	.local	_.str.147
_.str.147:
	.asciz	"ancova"

	.section	.rodata._.str.148,"a",@progbits
	.balign	1
	.local	_.str.148
_.str.148:
	.asciz	"andrey"

	.section	.rodata._.str.149,"a",@progbits
	.balign	1
	.local	_.str.149
_.str.149:
	.asciz	"announcing"

	.section	.rodata._.str.150,"a",@progbits
	.balign	1
	.local	_.str.150
_.str.150:
	.asciz	"annuity"

	.section	.rodata._.str.151,"a",@progbits
	.balign	1
	.local	_.str.151
_.str.151:
	.asciz	"another"

	.section	.rodata._.str.152,"a",@progbits
	.balign	1
	.local	_.str.152
_.str.152:
	.asciz	"anova"

	.section	.rodata._.str.153,"a",@progbits
	.balign	1
	.local	_.str.153
_.str.153:
	.asciz	"answer"

	.section	.rodata._.str.154,"a",@progbits
	.balign	1
	.local	_.str.154
_.str.154:
	.asciz	"answers"

	.section	.rodata._.str.155,"a",@progbits
	.balign	1
	.local	_.str.155
_.str.155:
	.asciz	"anything"

	.section	.rodata._.str.156,"a",@progbits
	.balign	1
	.local	_.str.156
_.str.156:
	.asciz	"apart"

	.section	.rodata._.str.157,"a",@progbits
	.balign	1
	.local	_.str.157
_.str.157:
	.asciz	"apparent"

	.section	.rodata._.str.158,"a",@progbits
	.balign	1
	.local	_.str.158
_.str.158:
	.asciz	"appeared"

	.section	.rodata._.str.159,"a",@progbits
	.balign	1
	.local	_.str.159
_.str.159:
	.asciz	"appears"

	.section	.rodata._.str.160,"a",@progbits
	.balign	1
	.local	_.str.160
_.str.160:
	.asciz	"apples"

	.section	.rodata._.str.161,"a",@progbits
	.balign	1
	.local	_.str.161
_.str.161:
	.asciz	"application"

	.section	.rodata._.str.162,"a",@progbits
	.balign	1
	.local	_.str.162
_.str.162:
	.asciz	"applied"

	.section	.rodata._.str.163,"a",@progbits
	.balign	1
	.local	_.str.163
_.str.163:
	.asciz	"applies"

	.section	.rodata._.str.164,"a",@progbits
	.balign	1
	.local	_.str.164
_.str.164:
	.asciz	"apply"

	.section	.rodata._.str.165,"a",@progbits
	.balign	1
	.local	_.str.165
_.str.165:
	.asciz	"applying"

	.section	.rodata._.str.166,"a",@progbits
	.balign	1
	.local	_.str.166
_.str.166:
	.asciz	"approach"

	.section	.rodata._.str.167,"a",@progbits
	.balign	1
	.local	_.str.167
_.str.167:
	.asciz	"approachable"

	.section	.rodata._.str.168,"a",@progbits
	.balign	1
	.local	_.str.168
_.str.168:
	.asciz	"approaches"

	.section	.rodata._.str.169,"a",@progbits
	.balign	1
	.local	_.str.169
_.str.169:
	.asciz	"appropriate"

	.section	.rodata._.str.170,"a",@progbits
	.balign	1
	.local	_.str.170
_.str.170:
	.asciz	"approximate"

	.section	.rodata._.str.171,"a",@progbits
	.balign	1
	.local	_.str.171
_.str.171:
	.asciz	"approximated"

	.section	.rodata._.str.172,"a",@progbits
	.balign	1
	.local	_.str.172
_.str.172:
	.asciz	"approximately"

	.section	.rodata._.str.173,"a",@progbits
	.balign	1
	.local	_.str.173
_.str.173:
	.asciz	"approximation"

	.section	.rodata._.str.174,"a",@progbits
	.balign	1
	.local	_.str.174
_.str.174:
	.asciz	"apps"

	.section	.rodata._.str.175,"a",@progbits
	.balign	1
	.local	_.str.175
_.str.175:
	.asciz	"appvars"

	.section	.rodata._.str.176,"a",@progbits
	.balign	1
	.local	_.str.176
_.str.176:
	.asciz	"architecture"

	.section	.rodata._.str.177,"a",@progbits
	.balign	1
	.local	_.str.177
_.str.177:
	.asciz	"archive"

	.section	.rodata._.str.178,"a",@progbits
	.balign	1
	.local	_.str.178
_.str.178:
	.asciz	"archived"

	.section	.rodata._.str.179,"a",@progbits
	.balign	1
	.local	_.str.179
_.str.179:
	.asciz	"area"

	.section	.rodata._.str.180,"a",@progbits
	.balign	1
	.local	_.str.180
_.str.180:
	.asciz	"areas"

	.section	.rodata._.str.181,"a",@progbits
	.balign	1
	.local	_.str.181
_.str.181:
	.asciz	"aren"

	.section	.rodata._.str.182,"a",@progbits
	.balign	1
	.local	_.str.182
_.str.182:
	.asciz	"argument"

	.section	.rodata._.str.183,"a",@progbits
	.balign	1
	.local	_.str.183
_.str.183:
	.asciz	"arima"

	.section	.rodata._.str.184,"a",@progbits
	.balign	1
	.local	_.str.184
_.str.184:
	.asciz	"arises"

	.section	.rodata._.str.185,"a",@progbits
	.balign	1
	.local	_.str.185
_.str.185:
	.asciz	"armor"

	.section	.rodata._.str.186,"a",@progbits
	.balign	1
	.local	_.str.186
_.str.186:
	.asciz	"armored"

	.section	.rodata._.str.187,"a",@progbits
	.balign	1
	.local	_.str.187
_.str.187:
	.asciz	"around"

	.section	.rodata._.str.188,"a",@progbits
	.balign	1
	.local	_.str.188
_.str.188:
	.asciz	"arrate"

	.section	.rodata._.str.189,"a",@progbits
	.balign	1
	.local	_.str.189
_.str.189:
	.asciz	"arrive"

	.section	.rodata._.str.190,"a",@progbits
	.balign	1
	.local	_.str.190
_.str.190:
	.asciz	"ascending"

	.section	.rodata._.str.191,"a",@progbits
	.balign	1
	.local	_.str.191
_.str.191:
	.asciz	"asked"

	.section	.rodata._.str.192,"a",@progbits
	.balign	1
	.local	_.str.192
_.str.192:
	.asciz	"asks"

	.section	.rodata._.str.193,"a",@progbits
	.balign	1
	.local	_.str.193
_.str.193:
	.asciz	"assessing"

	.section	.rodata._.str.194,"a",@progbits
	.balign	1
	.local	_.str.194
_.str.194:
	.asciz	"assign"

	.section	.rodata._.str.195,"a",@progbits
	.balign	1
	.local	_.str.195
_.str.195:
	.asciz	"assigned"

	.section	.rodata._.str.196,"a",@progbits
	.balign	1
	.local	_.str.196
_.str.196:
	.asciz	"assigning"

	.section	.rodata._.str.197,"a",@progbits
	.balign	1
	.local	_.str.197
_.str.197:
	.asciz	"assignment"

	.section	.rodata._.str.198,"a",@progbits
	.balign	1
	.local	_.str.198
_.str.198:
	.asciz	"associated"

	.section	.rodata._.str.199,"a",@progbits
	.balign	1
	.local	_.str.199
_.str.199:
	.asciz	"association"

	.section	.rodata._.str.200,"a",@progbits
	.balign	1
	.local	_.str.200
_.str.200:
	.asciz	"assume"

	.section	.rodata._.str.201,"a",@progbits
	.balign	1
	.local	_.str.201
_.str.201:
	.asciz	"assumed"

	.section	.rodata._.str.202,"a",@progbits
	.balign	1
	.local	_.str.202
_.str.202:
	.asciz	"assumes"

	.section	.rodata._.str.203,"a",@progbits
	.balign	1
	.local	_.str.203
_.str.203:
	.asciz	"assuming"

	.section	.rodata._.str.204,"a",@progbits
	.balign	1
	.local	_.str.204
_.str.204:
	.asciz	"assumption"

	.section	.rodata._.str.205,"a",@progbits
	.balign	1
	.local	_.str.205
_.str.205:
	.asciz	"assumptions"

	.section	.rodata._.str.206,"a",@progbits
	.balign	1
	.local	_.str.206
_.str.206:
	.asciz	"astronomical"

	.section	.rodata._.str.207,"a",@progbits
	.balign	1
	.local	_.str.207
_.str.207:
	.asciz	"asymmetry"

	.section	.rodata._.str.208,"a",@progbits
	.balign	1
	.local	_.str.208
_.str.208:
	.asciz	"athletes"

	.section	.rodata._.str.209,"a",@progbits
	.balign	1
	.local	_.str.209
_.str.209:
	.asciz	"attempts"

	.section	.rodata._.str.210,"a",@progbits
	.balign	1
	.local	_.str.210
_.str.210:
	.asciz	"attribute"

	.section	.rodata._.str.211,"a",@progbits
	.balign	1
	.local	_.str.211
_.str.211:
	.asciz	"attributed"

	.section	.rodata._.str.212,"a",@progbits
	.balign	1
	.local	_.str.212
_.str.212:
	.asciz	"author"

	.section	.rodata._.str.213,"a",@progbits
	.balign	1
	.local	_.str.213
_.str.213:
	.asciz	"autocorrelation"

	.section	.rodata._.str.214,"a",@progbits
	.balign	1
	.local	_.str.214
_.str.214:
	.asciz	"automatically"

	.section	.rodata._.str.215,"a",@progbits
	.balign	1
	.local	_.str.215
_.str.215:
	.asciz	"autoregressive"

	.section	.rodata._.str.216,"a",@progbits
	.balign	1
	.local	_.str.216
_.str.216:
	.asciz	"available"

	.section	.rodata._.str.217,"a",@progbits
	.balign	1
	.local	_.str.217
_.str.217:
	.asciz	"average"

	.section	.rodata._.str.218,"a",@progbits
	.balign	1
	.local	_.str.218
_.str.218:
	.asciz	"averages"

	.section	.rodata._.str.219,"a",@progbits
	.balign	1
	.local	_.str.219
_.str.219:
	.asciz	"avoid"

	.section	.rodata._.str.220,"a",@progbits
	.balign	1
	.local	_.str.220
_.str.220:
	.asciz	"aware"

	.section	.rodata._.str.221,"a",@progbits
	.balign	1
	.local	_.str.221
_.str.221:
	.asciz	"away"

	.section	.rodata._.str.222,"a",@progbits
	.balign	1
	.local	_.str.222
_.str.222:
	.asciz	"axiomatic"

	.section	.rodata._.str.223,"a",@progbits
	.balign	1
	.local	_.str.223
_.str.223:
	.asciz	"axioms"

	.section	.rodata._.str.224,"a",@progbits
	.balign	1
	.local	_.str.224
_.str.224:
	.asciz	"axis"

	.section	.rodata._.str.225,"a",@progbits
	.balign	1
	.local	_.str.225
_.str.225:
	.asciz	"babies"

	.section	.rodata._.str.226,"a",@progbits
	.balign	1
	.local	_.str.226
_.str.226:
	.asciz	"back"

	.section	.rodata._.str.227,"a",@progbits
	.balign	1
	.local	_.str.227
_.str.227:
	.asciz	"bacon"

	.section	.rodata._.str.228,"a",@progbits
	.balign	1
	.local	_.str.228
_.str.228:
	.asciz	"bags"

	.section	.rodata._.str.229,"a",@progbits
	.balign	1
	.local	_.str.229
_.str.229:
	.asciz	"balance"

	.section	.rodata._.str.230,"a",@progbits
	.balign	1
	.local	_.str.230
_.str.230:
	.asciz	"balanced"

	.section	.rodata._.str.231,"a",@progbits
	.balign	1
	.local	_.str.231
_.str.231:
	.asciz	"balances"

	.section	.rodata._.str.232,"a",@progbits
	.balign	1
	.local	_.str.232
_.str.232:
	.asciz	"ballots"

	.section	.rodata._.str.233,"a",@progbits
	.balign	1
	.local	_.str.233
_.str.233:
	.asciz	"bank"

	.section	.rodata._.str.234,"a",@progbits
	.balign	1
	.local	_.str.234
_.str.234:
	.asciz	"bar1"

	.section	.rodata._.str.235,"a",@progbits
	.balign	1
	.local	_.str.235
_.str.235:
	.asciz	"bar2"

	.section	.rodata._.str.236,"a",@progbits
	.balign	1
	.local	_.str.236
_.str.236:
	.asciz	"barron"

	.section	.rodata._.str.237,"a",@progbits
	.balign	1
	.local	_.str.237
_.str.237:
	.asciz	"bars"

	.section	.rodata._.str.238,"a",@progbits
	.balign	1
	.local	_.str.238
_.str.238:
	.asciz	"based"

	.section	.rodata._.str.239,"a",@progbits
	.balign	1
	.local	_.str.239
_.str.239:
	.asciz	"baseline"

	.section	.rodata._.str.240,"a",@progbits
	.balign	1
	.local	_.str.240
_.str.240:
	.asciz	"basic"

	.section	.rodata._.str.241,"a",@progbits
	.balign	1
	.local	_.str.241
_.str.241:
	.asciz	"basics"

	.section	.rodata._.str.242,"a",@progbits
	.balign	1
	.local	_.str.242
_.str.242:
	.asciz	"basketball"

	.section	.rodata._.str.243,"a",@progbits
	.balign	1
	.local	_.str.243
_.str.243:
	.asciz	"batch"

	.section	.rodata._.str.244,"a",@progbits
	.balign	1
	.local	_.str.244
_.str.244:
	.asciz	"batteries"

	.section	.rodata._.str.245,"a",@progbits
	.balign	1
	.local	_.str.245
_.str.245:
	.asciz	"battery"

	.section	.rodata._.str.246,"a",@progbits
	.balign	1
	.local	_.str.246
_.str.246:
	.asciz	"battle"

	.section	.rodata._.str.247,"a",@progbits
	.balign	1
	.local	_.str.247
_.str.247:
	.asciz	"bayes"

	.section	.rodata._.str.248,"a",@progbits
	.balign	1
	.local	_.str.248
_.str.248:
	.asciz	"bayesian"

	.section	.rodata._.str.249,"a",@progbits
	.balign	1
	.local	_.str.249
_.str.249:
	.asciz	"beads"

	.section	.rodata._.str.250,"a",@progbits
	.balign	1
	.local	_.str.250
_.str.250:
	.asciz	"beat"

	.section	.rodata._.str.251,"a",@progbits
	.balign	1
	.local	_.str.251
_.str.251:
	.asciz	"became"

	.section	.rodata._.str.252,"a",@progbits
	.balign	1
	.local	_.str.252
_.str.252:
	.asciz	"because"

	.section	.rodata._.str.253,"a",@progbits
	.balign	1
	.local	_.str.253
_.str.253:
	.asciz	"becomes"

	.section	.rodata._.str.254,"a",@progbits
	.balign	1
	.local	_.str.254
_.str.254:
	.asciz	"bedrock"

	.section	.rodata._.str.255,"a",@progbits
	.balign	1
	.local	_.str.255
_.str.255:
	.asciz	"been"

	.section	.rodata._.str.256,"a",@progbits
	.balign	1
	.local	_.str.256
_.str.256:
	.asciz	"beer"

	.section	.rodata._.str.257,"a",@progbits
	.balign	1
	.local	_.str.257
_.str.257:
	.asciz	"before"

	.section	.rodata._.str.258,"a",@progbits
	.balign	1
	.local	_.str.258
_.str.258:
	.asciz	"begin"

	.section	.rodata._.str.259,"a",@progbits
	.balign	1
	.local	_.str.259
_.str.259:
	.asciz	"beginning"

	.section	.rodata._.str.260,"a",@progbits
	.balign	1
	.local	_.str.260
_.str.260:
	.asciz	"begins"

	.section	.rodata._.str.261,"a",@progbits
	.balign	1
	.local	_.str.261
_.str.261:
	.asciz	"behavior"

	.section	.rodata._.str.262,"a",@progbits
	.balign	1
	.local	_.str.262
_.str.262:
	.asciz	"behind"

	.section	.rodata._.str.263,"a",@progbits
	.balign	1
	.local	_.str.263
_.str.263:
	.asciz	"being"

	.section	.rodata._.str.264,"a",@progbits
	.balign	1
	.local	_.str.264
_.str.264:
	.asciz	"belief"

	.section	.rodata._.str.265,"a",@progbits
	.balign	1
	.local	_.str.265
_.str.265:
	.asciz	"beliefs"

	.section	.rodata._.str.266,"a",@progbits
	.balign	1
	.local	_.str.266
_.str.266:
	.asciz	"believe"

	.section	.rodata._.str.267,"a",@progbits
	.balign	1
	.local	_.str.267
_.str.267:
	.asciz	"believed"

	.section	.rodata._.str.268,"a",@progbits
	.balign	1
	.local	_.str.268
_.str.268:
	.asciz	"bell"

	.section	.rodata._.str.269,"a",@progbits
	.balign	1
	.local	_.str.269
_.str.269:
	.asciz	"below"

	.section	.rodata._.str.270,"a",@progbits
	.balign	1
	.local	_.str.270
_.str.270:
	.asciz	"berkeley"

	.section	.rodata._.str.271,"a",@progbits
	.balign	1
	.local	_.str.271
_.str.271:
	.asciz	"berkson"

	.section	.rodata._.str.272,"a",@progbits
	.balign	1
	.local	_.str.272
_.str.272:
	.asciz	"bernoulli"

	.section	.rodata._.str.273,"a",@progbits
	.balign	1
	.local	_.str.273
_.str.273:
	.asciz	"bessel"

	.section	.rodata._.str.274,"a",@progbits
	.balign	1
	.local	_.str.274
_.str.274:
	.asciz	"best"

	.section	.rodata._.str.275,"a",@progbits
	.balign	1
	.local	_.str.275
_.str.275:
	.asciz	"beta"

	.section	.rodata._.str.276,"a",@progbits
	.balign	1
	.local	_.str.276
_.str.276:
	.asciz	"betax"

	.section	.rodata._.str.277,"a",@progbits
	.balign	1
	.local	_.str.277
_.str.277:
	.asciz	"better"

	.section	.rodata._.str.278,"a",@progbits
	.balign	1
	.local	_.str.278
_.str.278:
	.asciz	"between"

	.section	.rodata._.str.279,"a",@progbits
	.balign	1
	.local	_.str.279
_.str.279:
	.asciz	"beyond"

	.section	.rodata._.str.280,"a",@progbits
	.balign	1
	.local	_.str.280
_.str.280:
	.asciz	"bias"

	.section	.rodata._.str.281,"a",@progbits
	.balign	1
	.local	_.str.281
_.str.281:
	.asciz	"biased"

	.section	.rodata._.str.282,"a",@progbits
	.balign	1
	.local	_.str.282
_.str.282:
	.asciz	"bible"

	.section	.rodata._.str.283,"a",@progbits
	.balign	1
	.local	_.str.283
_.str.283:
	.asciz	"bill"

	.section	.rodata._.str.284,"a",@progbits
	.balign	1
	.local	_.str.284
_.str.284:
	.asciz	"billion"

	.section	.rodata._.str.285,"a",@progbits
	.balign	1
	.local	_.str.285
_.str.285:
	.asciz	"bimodal"

	.section	.rodata._.str.286,"a",@progbits
	.balign	1
	.local	_.str.286
_.str.286:
	.asciz	"binary"

	.section	.rodata._.str.287,"a",@progbits
	.balign	1
	.local	_.str.287
_.str.287:
	.asciz	"binom"

	.section	.rodata._.str.288,"a",@progbits
	.balign	1
	.local	_.str.288
_.str.288:
	.asciz	"binomcdf"

	.section	.rodata._.str.289,"a",@progbits
	.balign	1
	.local	_.str.289
_.str.289:
	.asciz	"binomial"

	.section	.rodata._.str.290,"a",@progbits
	.balign	1
	.local	_.str.290
_.str.290:
	.asciz	"binompdf"

	.section	.rodata._.str.291,"a",@progbits
	.balign	1
	.local	_.str.291
_.str.291:
	.asciz	"bins"

	.section	.rodata._.str.292,"a",@progbits
	.balign	1
	.local	_.str.292
_.str.292:
	.asciz	"biographical"

	.section	.rodata._.str.293,"a",@progbits
	.balign	1
	.local	_.str.293
_.str.293:
	.asciz	"biographies"

	.section	.rodata._.str.294,"a",@progbits
	.balign	1
	.local	_.str.294
_.str.294:
	.asciz	"biological"

	.section	.rodata._.str.295,"a",@progbits
	.balign	1
	.local	_.str.295
_.str.295:
	.asciz	"biometrika"

	.section	.rodata._.str.296,"a",@progbits
	.balign	1
	.local	_.str.296
_.str.296:
	.asciz	"birth"

	.section	.rodata._.str.297,"a",@progbits
	.balign	1
	.local	_.str.297
_.str.297:
	.asciz	"birthdates"

	.section	.rodata._.str.298,"a",@progbits
	.balign	1
	.local	_.str.298
_.str.298:
	.asciz	"birthday"

	.section	.rodata._.str.299,"a",@progbits
	.balign	1
	.local	_.str.299
_.str.299:
	.asciz	"bits"

	.section	.rodata._.str.300,"a",@progbits
	.balign	1
	.local	_.str.300
_.str.300:
	.asciz	"bivariate"

	.section	.rodata._.str.301,"a",@progbits
	.balign	1
	.local	_.str.301
_.str.301:
	.asciz	"black"

	.section	.rodata._.str.302,"a",@progbits
	.balign	1
	.local	_.str.302
_.str.302:
	.asciz	"blaise"

	.section	.rodata._.str.303,"a",@progbits
	.balign	1
	.local	_.str.303
_.str.303:
	.asciz	"blank"

	.section	.rodata._.str.304,"a",@progbits
	.balign	1
	.local	_.str.304
_.str.304:
	.asciz	"blends"

	.section	.rodata._.str.305,"a",@progbits
	.balign	1
	.local	_.str.305
_.str.305:
	.asciz	"blind"

	.section	.rodata._.str.306,"a",@progbits
	.balign	1
	.local	_.str.306
_.str.306:
	.asciz	"blinding"

	.section	.rodata._.str.307,"a",@progbits
	.balign	1
	.local	_.str.307
_.str.307:
	.asciz	"block"

	.section	.rodata._.str.308,"a",@progbits
	.balign	1
	.local	_.str.308
_.str.308:
	.asciz	"blocking"

	.section	.rodata._.str.309,"a",@progbits
	.balign	1
	.local	_.str.309
_.str.309:
	.asciz	"blood"

	.section	.rodata._.str.310,"a",@progbits
	.balign	1
	.local	_.str.310
_.str.310:
	.asciz	"blue"

	.section	.rodata._.str.311,"a",@progbits
	.balign	1
	.local	_.str.311
_.str.311:
	.asciz	"blueberries"

	.section	.rodata._.str.312,"a",@progbits
	.balign	1
	.local	_.str.312
_.str.312:
	.asciz	"board"

	.section	.rodata._.str.313,"a",@progbits
	.balign	1
	.local	_.str.313
_.str.313:
	.asciz	"body"

	.section	.rodata._.str.314,"a",@progbits
	.balign	1
	.local	_.str.314
_.str.314:
	.asciz	"bombers"

	.section	.rodata._.str.315,"a",@progbits
	.balign	1
	.local	_.str.315
_.str.315:
	.asciz	"bonferroni"

	.section	.rodata._.str.316,"a",@progbits
	.balign	1
	.local	_.str.316
_.str.316:
	.asciz	"book"

	.section	.rodata._.str.317,"a",@progbits
	.balign	1
	.local	_.str.317
_.str.317:
	.asciz	"books"

	.section	.rodata._.str.318,"a",@progbits
	.balign	1
	.local	_.str.318
_.str.318:
	.asciz	"bootstrap"

	.section	.rodata._.str.319,"a",@progbits
	.balign	1
	.local	_.str.319
_.str.319:
	.asciz	"born"

	.section	.rodata._.str.320,"a",@progbits
	.balign	1
	.local	_.str.320
_.str.320:
	.asciz	"both"

	.section	.rodata._.str.321,"a",@progbits
	.balign	1
	.local	_.str.321
_.str.321:
	.asciz	"bottom"

	.section	.rodata._.str.322,"a",@progbits
	.balign	1
	.local	_.str.322
_.str.322:
	.asciz	"bound"

	.section	.rodata._.str.323,"a",@progbits
	.balign	1
	.local	_.str.323
_.str.323:
	.asciz	"boundaries"

	.section	.rodata._.str.324,"a",@progbits
	.balign	1
	.local	_.str.324
_.str.324:
	.asciz	"bounds"

	.section	.rodata._.str.325,"a",@progbits
	.balign	1
	.local	_.str.325
_.str.325:
	.asciz	"bowl"

	.section	.rodata._.str.326,"a",@progbits
	.balign	1
	.local	_.str.326
_.str.326:
	.asciz	"boxes"

	.section	.rodata._.str.327,"a",@progbits
	.balign	1
	.local	_.str.327
_.str.327:
	.asciz	"boxplot"

	.section	.rodata._.str.328,"a",@progbits
	.balign	1
	.local	_.str.328
_.str.328:
	.asciz	"boxplots"

	.section	.rodata._.str.329,"a",@progbits
	.balign	1
	.local	_.str.329
_.str.329:
	.asciz	"bradley"

	.section	.rodata._.str.330,"a",@progbits
	.balign	1
	.local	_.str.330
_.str.330:
	.asciz	"brains"

	.section	.rodata._.str.331,"a",@progbits
	.balign	1
	.local	_.str.331
_.str.331:
	.asciz	"branch"

	.section	.rodata._.str.332,"a",@progbits
	.balign	1
	.local	_.str.332
_.str.332:
	.asciz	"branches"

	.section	.rodata._.str.333,"a",@progbits
	.balign	1
	.local	_.str.333
_.str.333:
	.asciz	"brand"

	.section	.rodata._.str.334,"a",@progbits
	.balign	1
	.local	_.str.334
_.str.334:
	.asciz	"brands"

	.section	.rodata._.str.335,"a",@progbits
	.balign	1
	.local	_.str.335
_.str.335:
	.asciz	"breiman"

	.section	.rodata._.str.336,"a",@progbits
	.balign	1
	.local	_.str.336
_.str.336:
	.asciz	"brewery"

	.section	.rodata._.str.337,"a",@progbits
	.balign	1
	.local	_.str.337
_.str.337:
	.asciz	"bridge"

	.section	.rodata._.str.338,"a",@progbits
	.balign	1
	.local	_.str.338
_.str.338:
	.asciz	"bridges"

	.section	.rodata._.str.339,"a",@progbits
	.balign	1
	.local	_.str.339
_.str.339:
	.asciz	"broader"

	.section	.rodata._.str.340,"a",@progbits
	.balign	1
	.local	_.str.340
_.str.340:
	.asciz	"brought"

	.section	.rodata._.str.341,"a",@progbits
	.balign	1
	.local	_.str.341
_.str.341:
	.asciz	"bubble"

	.section	.rodata._.str.342,"a",@progbits
	.balign	1
	.local	_.str.342
_.str.342:
	.asciz	"build"

	.section	.rodata._.str.343,"a",@progbits
	.balign	1
	.local	_.str.343
_.str.343:
	.asciz	"builds"

	.section	.rodata._.str.344,"a",@progbits
	.balign	1
	.local	_.str.344
_.str.344:
	.asciz	"bullet"

	.section	.rodata._.str.345,"a",@progbits
	.balign	1
	.local	_.str.345
_.str.345:
	.asciz	"bulletproof"

	.section	.rodata._.str.346,"a",@progbits
	.balign	1
	.local	_.str.346
_.str.346:
	.asciz	"business"

	.section	.rodata._.str.347,"a",@progbits
	.balign	1
	.local	_.str.347
_.str.347:
	.asciz	"busters"

	.section	.rodata._.str.348,"a",@progbits
	.balign	1
	.local	_.str.348
_.str.348:
	.asciz	"caffeine"

	.section	.rodata._.str.349,"a",@progbits
	.balign	1
	.local	_.str.349
_.str.349:
	.asciz	"calc"

	.section	.rodata._.str.350,"a",@progbits
	.balign	1
	.local	_.str.350
_.str.350:
	.asciz	"calculate"

	.section	.rodata._.str.351,"a",@progbits
	.balign	1
	.local	_.str.351
_.str.351:
	.asciz	"calculated"

	.section	.rodata._.str.352,"a",@progbits
	.balign	1
	.local	_.str.352
_.str.352:
	.asciz	"calculates"

	.section	.rodata._.str.353,"a",@progbits
	.balign	1
	.local	_.str.353
_.str.353:
	.asciz	"calculating"

	.section	.rodata._.str.354,"a",@progbits
	.balign	1
	.local	_.str.354
_.str.354:
	.asciz	"calculation"

	.section	.rodata._.str.355,"a",@progbits
	.balign	1
	.local	_.str.355
_.str.355:
	.asciz	"calculations"

	.section	.rodata._.str.356,"a",@progbits
	.balign	1
	.local	_.str.356
_.str.356:
	.asciz	"calculator"

	.section	.rodata._.str.357,"a",@progbits
	.balign	1
	.local	_.str.357
_.str.357:
	.asciz	"calculators"

	.section	.rodata._.str.358,"a",@progbits
	.balign	1
	.local	_.str.358
_.str.358:
	.asciz	"calculus"

	.section	.rodata._.str.359,"a",@progbits
	.balign	1
	.local	_.str.359
_.str.359:
	.asciz	"california"

	.section	.rodata._.str.360,"a",@progbits
	.balign	1
	.local	_.str.360
_.str.360:
	.asciz	"called"

	.section	.rodata._.str.361,"a",@progbits
	.balign	1
	.local	_.str.361
_.str.361:
	.asciz	"candidate"

	.section	.rodata._.str.362,"a",@progbits
	.balign	1
	.local	_.str.362
_.str.362:
	.asciz	"cannot"

	.section	.rodata._.str.363,"a",@progbits
	.balign	1
	.local	_.str.363
_.str.363:
	.asciz	"capsules"

	.section	.rodata._.str.364,"a",@progbits
	.balign	1
	.local	_.str.364
_.str.364:
	.asciz	"capture"

	.section	.rodata._.str.365,"a",@progbits
	.balign	1
	.local	_.str.365
_.str.365:
	.asciz	"captures"

	.section	.rodata._.str.366,"a",@progbits
	.balign	1
	.local	_.str.366
_.str.366:
	.asciz	"card"

	.section	.rodata._.str.367,"a",@progbits
	.balign	1
	.local	_.str.367
_.str.367:
	.asciz	"career"

	.section	.rodata._.str.368,"a",@progbits
	.balign	1
	.local	_.str.368
_.str.368:
	.asciz	"careful"

	.section	.rodata._.str.369,"a",@progbits
	.balign	1
	.local	_.str.369
_.str.369:
	.asciz	"carefully"

	.section	.rodata._.str.370,"a",@progbits
	.balign	1
	.local	_.str.370
_.str.370:
	.asciz	"cares"

	.section	.rodata._.str.371,"a",@progbits
	.balign	1
	.local	_.str.371
_.str.371:
	.asciz	"carl"

	.section	.rodata._.str.372,"a",@progbits
	.balign	1
	.local	_.str.372
_.str.372:
	.asciz	"carlo"

	.section	.rodata._.str.373,"a",@progbits
	.balign	1
	.local	_.str.373
_.str.373:
	.asciz	"carries"

	.section	.rodata._.str.374,"a",@progbits
	.balign	1
	.local	_.str.374
_.str.374:
	.asciz	"cars"

	.section	.rodata._.str.375,"a",@progbits
	.balign	1
	.local	_.str.375
_.str.375:
	.asciz	"case"

	.section	.rodata._.str.376,"a",@progbits
	.balign	1
	.local	_.str.376
_.str.376:
	.asciz	"cases"

	.section	.rodata._.str.377,"a",@progbits
	.balign	1
	.local	_.str.377
_.str.377:
	.asciz	"catalog"

	.section	.rodata._.str.378,"a",@progbits
	.balign	1
	.local	_.str.378
_.str.378:
	.asciz	"categorical"

	.section	.rodata._.str.379,"a",@progbits
	.balign	1
	.local	_.str.379
_.str.379:
	.asciz	"categories"

	.section	.rodata._.str.380,"a",@progbits
	.balign	1
	.local	_.str.380
_.str.380:
	.asciz	"category"

	.section	.rodata._.str.381,"a",@progbits
	.balign	1
	.local	_.str.381
_.str.381:
	.asciz	"cathy"

	.section	.rodata._.str.382,"a",@progbits
	.balign	1
	.local	_.str.382
_.str.382:
	.asciz	"cats"

	.section	.rodata._.str.383,"a",@progbits
	.balign	1
	.local	_.str.383
_.str.383:
	.asciz	"causal"

	.section	.rodata._.str.384,"a",@progbits
	.balign	1
	.local	_.str.384
_.str.384:
	.asciz	"causation"

	.section	.rodata._.str.385,"a",@progbits
	.balign	1
	.local	_.str.385
_.str.385:
	.asciz	"cause"

	.section	.rodata._.str.386,"a",@progbits
	.balign	1
	.local	_.str.386
_.str.386:
	.asciz	"caused"

	.section	.rodata._.str.387,"a",@progbits
	.balign	1
	.local	_.str.387
_.str.387:
	.asciz	"causes"

	.section	.rodata._.str.388,"a",@progbits
	.balign	1
	.local	_.str.388
_.str.388:
	.asciz	"caution"

	.section	.rodata._.str.389,"a",@progbits
	.balign	1
	.local	_.str.389
_.str.389:
	.asciz	"cdot"

	.section	.rodata._.str.390,"a",@progbits
	.balign	1
	.local	_.str.390
_.str.390:
	.asciz	"cell"

	.section	.rodata._.str.391,"a",@progbits
	.balign	1
	.local	_.str.391
_.str.391:
	.asciz	"center"

	.section	.rodata._.str.392,"a",@progbits
	.balign	1
	.local	_.str.392
_.str.392:
	.asciz	"centers"

	.section	.rodata._.str.393,"a",@progbits
	.balign	1
	.local	_.str.393
_.str.393:
	.asciz	"central"

	.section	.rodata._.str.394,"a",@progbits
	.balign	1
	.local	_.str.394
_.str.394:
	.asciz	"century"

	.section	.rodata._.str.395,"a",@progbits
	.balign	1
	.local	_.str.395
_.str.395:
	.asciz	"certain"

	.section	.rodata._.str.396,"a",@progbits
	.balign	1
	.local	_.str.396
_.str.396:
	.asciz	"chain"

	.section	.rodata._.str.397,"a",@progbits
	.balign	1
	.local	_.str.397
_.str.397:
	.asciz	"challenge"

	.section	.rodata._.str.398,"a",@progbits
	.balign	1
	.local	_.str.398
_.str.398:
	.asciz	"challenger"

	.section	.rodata._.str.399,"a",@progbits
	.balign	1
	.local	_.str.399
_.str.399:
	.asciz	"chance"

	.section	.rodata._.str.400,"a",@progbits
	.balign	1
	.local	_.str.400
_.str.400:
	.asciz	"change"

	.section	.rodata._.str.401,"a",@progbits
	.balign	1
	.local	_.str.401
_.str.401:
	.asciz	"changed"

	.section	.rodata._.str.402,"a",@progbits
	.balign	1
	.local	_.str.402
_.str.402:
	.asciz	"changes"

	.section	.rodata._.str.403,"a",@progbits
	.balign	1
	.local	_.str.403
_.str.403:
	.asciz	"changing"

	.section	.rodata._.str.404,"a",@progbits
	.balign	1
	.local	_.str.404
_.str.404:
	.asciz	"chapter"

	.section	.rodata._.str.405,"a",@progbits
	.balign	1
	.local	_.str.405
_.str.405:
	.asciz	"chapters"

	.section	.rodata._.str.406,"a",@progbits
	.balign	1
	.local	_.str.406
_.str.406:
	.asciz	"character"

	.section	.rodata._.str.407,"a",@progbits
	.balign	1
	.local	_.str.407
_.str.407:
	.asciz	"characteristic"

	.section	.rodata._.str.408,"a",@progbits
	.balign	1
	.local	_.str.408
_.str.408:
	.asciz	"characteristics"

	.section	.rodata._.str.409,"a",@progbits
	.balign	1
	.local	_.str.409
_.str.409:
	.asciz	"charles"

	.section	.rodata._.str.410,"a",@progbits
	.balign	1
	.local	_.str.410
_.str.410:
	.asciz	"chart"

	.section	.rodata._.str.411,"a",@progbits
	.balign	1
	.local	_.str.411
_.str.411:
	.asciz	"chartjunk"

	.section	.rodata._.str.412,"a",@progbits
	.balign	1
	.local	_.str.412
_.str.412:
	.asciz	"charts"

	.section	.rodata._.str.413,"a",@progbits
	.balign	1
	.local	_.str.413
_.str.413:
	.asciz	"cheap"

	.section	.rodata._.str.414,"a",@progbits
	.balign	1
	.local	_.str.414
_.str.414:
	.asciz	"cheat"

	.section	.rodata._.str.415,"a",@progbits
	.balign	1
	.local	_.str.415
_.str.415:
	.asciz	"chebyshev"

	.section	.rodata._.str.416,"a",@progbits
	.balign	1
	.local	_.str.416
_.str.416:
	.asciz	"check"

	.section	.rodata._.str.417,"a",@progbits
	.balign	1
	.local	_.str.417
_.str.417:
	.asciz	"checked"

	.section	.rodata._.str.418,"a",@progbits
	.balign	1
	.local	_.str.418
_.str.418:
	.asciz	"checking"

	.section	.rodata._.str.419,"a",@progbits
	.balign	1
	.local	_.str.419
_.str.419:
	.asciz	"checklist"

	.section	.rodata._.str.420,"a",@progbits
	.balign	1
	.local	_.str.420
_.str.420:
	.asciz	"checkmark"

	.section	.rodata._.str.421,"a",@progbits
	.balign	1
	.local	_.str.421
_.str.421:
	.asciz	"checks"

	.section	.rodata._.str.422,"a",@progbits
	.balign	1
	.local	_.str.422
_.str.422:
	.asciz	"chemist"

	.section	.rodata._.str.423,"a",@progbits
	.balign	1
	.local	_.str.423
_.str.423:
	.asciz	"chicago"

	.section	.rodata._.str.424,"a",@progbits
	.balign	1
	.local	_.str.424
_.str.424:
	.asciz	"children"

	.section	.rodata._.str.425,"a",@progbits
	.balign	1
	.local	_.str.425
_.str.425:
	.asciz	"choice"

	.section	.rodata._.str.426,"a",@progbits
	.balign	1
	.local	_.str.426
_.str.426:
	.asciz	"cholesterol"

	.section	.rodata._.str.427,"a",@progbits
	.balign	1
	.local	_.str.427
_.str.427:
	.asciz	"choose"

	.section	.rodata._.str.428,"a",@progbits
	.balign	1
	.local	_.str.428
_.str.428:
	.asciz	"choosing"

	.section	.rodata._.str.429,"a",@progbits
	.balign	1
	.local	_.str.429
_.str.429:
	.asciz	"chosen"

	.section	.rodata._.str.430,"a",@progbits
	.balign	1
	.local	_.str.430
_.str.430:
	.asciz	"chug"

	.section	.rodata._.str.431,"a",@progbits
	.balign	1
	.local	_.str.431
_.str.431:
	.asciz	"city"

	.section	.rodata._.str.432,"a",@progbits
	.balign	1
	.local	_.str.432
_.str.432:
	.asciz	"claim"

	.section	.rodata._.str.433,"a",@progbits
	.balign	1
	.local	_.str.433
_.str.433:
	.asciz	"claimed"

	.section	.rodata._.str.434,"a",@progbits
	.balign	1
	.local	_.str.434
_.str.434:
	.asciz	"claiming"

	.section	.rodata._.str.435,"a",@progbits
	.balign	1
	.local	_.str.435
_.str.435:
	.asciz	"claims"

	.section	.rodata._.str.436,"a",@progbits
	.balign	1
	.local	_.str.436
_.str.436:
	.asciz	"clarity"

	.section	.rodata._.str.437,"a",@progbits
	.balign	1
	.local	_.str.437
_.str.437:
	.asciz	"clark"

	.section	.rodata._.str.438,"a",@progbits
	.balign	1
	.local	_.str.438
_.str.438:
	.asciz	"class"

	.section	.rodata._.str.439,"a",@progbits
	.balign	1
	.local	_.str.439
_.str.439:
	.asciz	"classes"

	.section	.rodata._.str.440,"a",@progbits
	.balign	1
	.local	_.str.440
_.str.440:
	.asciz	"classic"

	.section	.rodata._.str.441,"a",@progbits
	.balign	1
	.local	_.str.441
_.str.441:
	.asciz	"classical"

	.section	.rodata._.str.442,"a",@progbits
	.balign	1
	.local	_.str.442
_.str.442:
	.asciz	"classify"

	.section	.rodata._.str.443,"a",@progbits
	.balign	1
	.local	_.str.443
_.str.443:
	.asciz	"claude"

	.section	.rodata._.str.444,"a",@progbits
	.balign	1
	.local	_.str.444
_.str.444:
	.asciz	"cleaning"

	.section	.rodata._.str.445,"a",@progbits
	.balign	1
	.local	_.str.445
_.str.445:
	.asciz	"clear"

	.section	.rodata._.str.446,"a",@progbits
	.balign	1
	.local	_.str.446
_.str.446:
	.asciz	"clearing"

	.section	.rodata._.str.447,"a",@progbits
	.balign	1
	.local	_.str.447
_.str.447:
	.asciz	"clearly"

	.section	.rodata._.str.448,"a",@progbits
	.balign	1
	.local	_.str.448
_.str.448:
	.asciz	"cleveland"

	.section	.rodata._.str.449,"a",@progbits
	.balign	1
	.local	_.str.449
_.str.449:
	.asciz	"climate"

	.section	.rodata._.str.450,"a",@progbits
	.balign	1
	.local	_.str.450
_.str.450:
	.asciz	"close"

	.section	.rodata._.str.451,"a",@progbits
	.balign	1
	.local	_.str.451
_.str.451:
	.asciz	"closed"

	.section	.rodata._.str.452,"a",@progbits
	.balign	1
	.local	_.str.452
_.str.452:
	.asciz	"closely"

	.section	.rodata._.str.453,"a",@progbits
	.balign	1
	.local	_.str.453
_.str.453:
	.asciz	"closer"

	.section	.rodata._.str.454,"a",@progbits
	.balign	1
	.local	_.str.454
_.str.454:
	.asciz	"cluster"

	.section	.rodata._.str.455,"a",@progbits
	.balign	1
	.local	_.str.455
_.str.455:
	.asciz	"clustered"

	.section	.rodata._.str.456,"a",@progbits
	.balign	1
	.local	_.str.456
_.str.456:
	.asciz	"clusters"

	.section	.rodata._.str.457,"a",@progbits
	.balign	1
	.local	_.str.457
_.str.457:
	.asciz	"cluttered"

	.section	.rodata._.str.458,"a",@progbits
	.balign	1
	.local	_.str.458
_.str.458:
	.asciz	"code"

	.section	.rodata._.str.459,"a",@progbits
	.balign	1
	.local	_.str.459
_.str.459:
	.asciz	"codes"

	.section	.rodata._.str.460,"a",@progbits
	.balign	1
	.local	_.str.460
_.str.460:
	.asciz	"coeff"

	.section	.rodata._.str.461,"a",@progbits
	.balign	1
	.local	_.str.461
_.str.461:
	.asciz	"coefficient"

	.section	.rodata._.str.462,"a",@progbits
	.balign	1
	.local	_.str.462
_.str.462:
	.asciz	"coefficients"

	.section	.rodata._.str.463,"a",@progbits
	.balign	1
	.local	_.str.463
_.str.463:
	.asciz	"coffee"

	.section	.rodata._.str.464,"a",@progbits
	.balign	1
	.local	_.str.464
_.str.464:
	.asciz	"cognitive"

	.section	.rodata._.str.465,"a",@progbits
	.balign	1
	.local	_.str.465
_.str.465:
	.asciz	"coin"

	.section	.rodata._.str.466,"a",@progbits
	.balign	1
	.local	_.str.466
_.str.466:
	.asciz	"collect"

	.section	.rodata._.str.467,"a",@progbits
	.balign	1
	.local	_.str.467
_.str.467:
	.asciz	"collected"

	.section	.rodata._.str.468,"a",@progbits
	.balign	1
	.local	_.str.468
_.str.468:
	.asciz	"collecting"

	.section	.rodata._.str.469,"a",@progbits
	.balign	1
	.local	_.str.469
_.str.469:
	.asciz	"collection"

	.section	.rodata._.str.470,"a",@progbits
	.balign	1
	.local	_.str.470
_.str.470:
	.asciz	"college"

	.section	.rodata._.str.471,"a",@progbits
	.balign	1
	.local	_.str.471
_.str.471:
	.asciz	"collinearity"

	.section	.rodata._.str.472,"a",@progbits
	.balign	1
	.local	_.str.472
_.str.472:
	.asciz	"color"

	.section	.rodata._.str.473,"a",@progbits
	.balign	1
	.local	_.str.473
_.str.473:
	.asciz	"colors"

	.section	.rodata._.str.474,"a",@progbits
	.balign	1
	.local	_.str.474
_.str.474:
	.asciz	"cols"

	.section	.rodata._.str.475,"a",@progbits
	.balign	1
	.local	_.str.475
_.str.475:
	.asciz	"column"

	.section	.rodata._.str.476,"a",@progbits
	.balign	1
	.local	_.str.476
_.str.476:
	.asciz	"combination"

	.section	.rodata._.str.477,"a",@progbits
	.balign	1
	.local	_.str.477
_.str.477:
	.asciz	"combinations"

	.section	.rodata._.str.478,"a",@progbits
	.balign	1
	.local	_.str.478
_.str.478:
	.asciz	"combine"

	.section	.rodata._.str.479,"a",@progbits
	.balign	1
	.local	_.str.479
_.str.479:
	.asciz	"combined"

	.section	.rodata._.str.480,"a",@progbits
	.balign	1
	.local	_.str.480
_.str.480:
	.asciz	"combining"

	.section	.rodata._.str.481,"a",@progbits
	.balign	1
	.local	_.str.481
_.str.481:
	.asciz	"come"

	.section	.rodata._.str.482,"a",@progbits
	.balign	1
	.local	_.str.482
_.str.482:
	.asciz	"comes"

	.section	.rodata._.str.483,"a",@progbits
	.balign	1
	.local	_.str.483
_.str.483:
	.asciz	"coming"

	.section	.rodata._.str.484,"a",@progbits
	.balign	1
	.local	_.str.484
_.str.484:
	.asciz	"command"

	.section	.rodata._.str.485,"a",@progbits
	.balign	1
	.local	_.str.485
_.str.485:
	.asciz	"committing"

	.section	.rodata._.str.486,"a",@progbits
	.balign	1
	.local	_.str.486
_.str.486:
	.asciz	"common"

	.section	.rodata._.str.487,"a",@progbits
	.balign	1
	.local	_.str.487
_.str.487:
	.asciz	"communicating"

	.section	.rodata._.str.488,"a",@progbits
	.balign	1
	.local	_.str.488
_.str.488:
	.asciz	"communication"

	.section	.rodata._.str.489,"a",@progbits
	.balign	1
	.local	_.str.489
_.str.489:
	.asciz	"comparable"

	.section	.rodata._.str.490,"a",@progbits
	.balign	1
	.local	_.str.490
_.str.490:
	.asciz	"comparative"

	.section	.rodata._.str.491,"a",@progbits
	.balign	1
	.local	_.str.491
_.str.491:
	.asciz	"compare"

	.section	.rodata._.str.492,"a",@progbits
	.balign	1
	.local	_.str.492
_.str.492:
	.asciz	"compared"

	.section	.rodata._.str.493,"a",@progbits
	.balign	1
	.local	_.str.493
_.str.493:
	.asciz	"compares"

	.section	.rodata._.str.494,"a",@progbits
	.balign	1
	.local	_.str.494
_.str.494:
	.asciz	"comparing"

	.section	.rodata._.str.495,"a",@progbits
	.balign	1
	.local	_.str.495
_.str.495:
	.asciz	"comparison"

	.section	.rodata._.str.496,"a",@progbits
	.balign	1
	.local	_.str.496
_.str.496:
	.asciz	"comparisons"

	.section	.rodata._.str.497,"a",@progbits
	.balign	1
	.local	_.str.497
_.str.497:
	.asciz	"compensating"

	.section	.rodata._.str.498,"a",@progbits
	.balign	1
	.local	_.str.498
_.str.498:
	.asciz	"competing"

	.section	.rodata._.str.499,"a",@progbits
	.balign	1
	.local	_.str.499
_.str.499:
	.asciz	"competitive"

	.section	.rodata._.str.500,"a",@progbits
	.balign	1
	.local	_.str.500
_.str.500:
	.asciz	"complement"

	.section	.rodata._.str.501,"a",@progbits
	.balign	1
	.local	_.str.501
_.str.501:
	.asciz	"complete"

	.section	.rodata._.str.502,"a",@progbits
	.balign	1
	.local	_.str.502
_.str.502:
	.asciz	"complex"

	.section	.rodata._.str.503,"a",@progbits
	.balign	1
	.local	_.str.503
_.str.503:
	.asciz	"component"

	.section	.rodata._.str.504,"a",@progbits
	.balign	1
	.local	_.str.504
_.str.504:
	.asciz	"components"

	.section	.rodata._.str.505,"a",@progbits
	.balign	1
	.local	_.str.505
_.str.505:
	.asciz	"computed"

	.section	.rodata._.str.506,"a",@progbits
	.balign	1
	.local	_.str.506
_.str.506:
	.asciz	"computer"

	.section	.rodata._.str.507,"a",@progbits
	.balign	1
	.local	_.str.507
_.str.507:
	.asciz	"computers"

	.section	.rodata._.str.508,"a",@progbits
	.balign	1
	.local	_.str.508
_.str.508:
	.asciz	"computes"

	.section	.rodata._.str.509,"a",@progbits
	.balign	1
	.local	_.str.509
_.str.509:
	.asciz	"computing"

	.section	.rodata._.str.510,"a",@progbits
	.balign	1
	.local	_.str.510
_.str.510:
	.asciz	"concentrated"

	.section	.rodata._.str.511,"a",@progbits
	.balign	1
	.local	_.str.511
_.str.511:
	.asciz	"concept"

	.section	.rodata._.str.512,"a",@progbits
	.balign	1
	.local	_.str.512
_.str.512:
	.asciz	"concepts"

	.section	.rodata._.str.513,"a",@progbits
	.balign	1
	.local	_.str.513
_.str.513:
	.asciz	"conclude"

	.section	.rodata._.str.514,"a",@progbits
	.balign	1
	.local	_.str.514
_.str.514:
	.asciz	"concluding"

	.section	.rodata._.str.515,"a",@progbits
	.balign	1
	.local	_.str.515
_.str.515:
	.asciz	"conclusion"

	.section	.rodata._.str.516,"a",@progbits
	.balign	1
	.local	_.str.516
_.str.516:
	.asciz	"conclusions"

	.section	.rodata._.str.517,"a",@progbits
	.balign	1
	.local	_.str.517
_.str.517:
	.asciz	"condition"

	.section	.rodata._.str.518,"a",@progbits
	.balign	1
	.local	_.str.518
_.str.518:
	.asciz	"conditional"

	.section	.rodata._.str.519,"a",@progbits
	.balign	1
	.local	_.str.519
_.str.519:
	.asciz	"conditionally"

	.section	.rodata._.str.520,"a",@progbits
	.balign	1
	.local	_.str.520
_.str.520:
	.asciz	"conditions"

	.section	.rodata._.str.521,"a",@progbits
	.balign	1
	.local	_.str.521
_.str.521:
	.asciz	"conducted"

	.section	.rodata._.str.522,"a",@progbits
	.balign	1
	.local	_.str.522
_.str.522:
	.asciz	"confidence"

	.section	.rodata._.str.523,"a",@progbits
	.balign	1
	.local	_.str.523
_.str.523:
	.asciz	"confident"

	.section	.rodata._.str.524,"a",@progbits
	.balign	1
	.local	_.str.524
_.str.524:
	.asciz	"confidently"

	.section	.rodata._.str.525,"a",@progbits
	.balign	1
	.local	_.str.525
_.str.525:
	.asciz	"confirm"

	.section	.rodata._.str.526,"a",@progbits
	.balign	1
	.local	_.str.526
_.str.526:
	.asciz	"confounding"

	.section	.rodata._.str.527,"a",@progbits
	.balign	1
	.local	_.str.527
_.str.527:
	.asciz	"confused"

	.section	.rodata._.str.528,"a",@progbits
	.balign	1
	.local	_.str.528
_.str.528:
	.asciz	"confusing"

	.section	.rodata._.str.529,"a",@progbits
	.balign	1
	.local	_.str.529
_.str.529:
	.asciz	"conjectandi"

	.section	.rodata._.str.530,"a",@progbits
	.balign	1
	.local	_.str.530
_.str.530:
	.asciz	"cons"

	.section	.rodata._.str.531,"a",@progbits
	.balign	1
	.local	_.str.531
_.str.531:
	.asciz	"conservative"

	.section	.rodata._.str.532,"a",@progbits
	.balign	1
	.local	_.str.532
_.str.532:
	.asciz	"considering"

	.section	.rodata._.str.533,"a",@progbits
	.balign	1
	.local	_.str.533
_.str.533:
	.asciz	"consistency"

	.section	.rodata._.str.534,"a",@progbits
	.balign	1
	.local	_.str.534
_.str.534:
	.asciz	"consistent"

	.section	.rodata._.str.535,"a",@progbits
	.balign	1
	.local	_.str.535
_.str.535:
	.asciz	"consistently"

	.section	.rodata._.str.536,"a",@progbits
	.balign	1
	.local	_.str.536
_.str.536:
	.asciz	"consisting"

	.section	.rodata._.str.537,"a",@progbits
	.balign	1
	.local	_.str.537
_.str.537:
	.asciz	"consists"

	.section	.rodata._.str.538,"a",@progbits
	.balign	1
	.local	_.str.538
_.str.538:
	.asciz	"constant"

	.section	.rodata._.str.539,"a",@progbits
	.balign	1
	.local	_.str.539
_.str.539:
	.asciz	"construct"

	.section	.rodata._.str.540,"a",@progbits
	.balign	1
	.local	_.str.540
_.str.540:
	.asciz	"constructed"

	.section	.rodata._.str.541,"a",@progbits
	.balign	1
	.local	_.str.541
_.str.541:
	.asciz	"contain"

	.section	.rodata._.str.542,"a",@progbits
	.balign	1
	.local	_.str.542
_.str.542:
	.asciz	"container"

	.section	.rodata._.str.543,"a",@progbits
	.balign	1
	.local	_.str.543
_.str.543:
	.asciz	"contains"

	.section	.rodata._.str.544,"a",@progbits
	.balign	1
	.local	_.str.544
_.str.544:
	.asciz	"content"

	.section	.rodata._.str.545,"a",@progbits
	.balign	1
	.local	_.str.545
_.str.545:
	.asciz	"context"

	.section	.rodata._.str.546,"a",@progbits
	.balign	1
	.local	_.str.546
_.str.546:
	.asciz	"contingency"

	.section	.rodata._.str.547,"a",@progbits
	.balign	1
	.local	_.str.547
_.str.547:
	.asciz	"continuity"

	.section	.rodata._.str.548,"a",@progbits
	.balign	1
	.local	_.str.548
_.str.548:
	.asciz	"continuous"

	.section	.rodata._.str.549,"a",@progbits
	.balign	1
	.local	_.str.549
_.str.549:
	.asciz	"contradicts"

	.section	.rodata._.str.550,"a",@progbits
	.balign	1
	.local	_.str.550
_.str.550:
	.asciz	"contribution"

	.section	.rodata._.str.551,"a",@progbits
	.balign	1
	.local	_.str.551
_.str.551:
	.asciz	"control"

	.section	.rodata._.str.552,"a",@progbits
	.balign	1
	.local	_.str.552
_.str.552:
	.asciz	"controlled"

	.section	.rodata._.str.553,"a",@progbits
	.balign	1
	.local	_.str.553
_.str.553:
	.asciz	"controlling"

	.section	.rodata._.str.554,"a",@progbits
	.balign	1
	.local	_.str.554
_.str.554:
	.asciz	"convenience"

	.section	.rodata._.str.555,"a",@progbits
	.balign	1
	.local	_.str.555
_.str.555:
	.asciz	"convex"

	.section	.rodata._.str.556,"a",@progbits
	.balign	1
	.local	_.str.556
_.str.556:
	.asciz	"convincing"

	.section	.rodata._.str.557,"a",@progbits
	.balign	1
	.local	_.str.557
_.str.557:
	.asciz	"corn"

	.section	.rodata._.str.558,"a",@progbits
	.balign	1
	.local	_.str.558
_.str.558:
	.asciz	"correct"

	.section	.rodata._.str.559,"a",@progbits
	.balign	1
	.local	_.str.559
_.str.559:
	.asciz	"correction"

	.section	.rodata._.str.560,"a",@progbits
	.balign	1
	.local	_.str.560
_.str.560:
	.asciz	"correctly"

	.section	.rodata._.str.561,"a",@progbits
	.balign	1
	.local	_.str.561
_.str.561:
	.asciz	"correctness"

	.section	.rodata._.str.562,"a",@progbits
	.balign	1
	.local	_.str.562
_.str.562:
	.asciz	"correlated"

	.section	.rodata._.str.563,"a",@progbits
	.balign	1
	.local	_.str.563
_.str.563:
	.asciz	"correlation"

	.section	.rodata._.str.564,"a",@progbits
	.balign	1
	.local	_.str.564
_.str.564:
	.asciz	"corresponding"

	.section	.rodata._.str.565,"a",@progbits
	.balign	1
	.local	_.str.565
_.str.565:
	.asciz	"could"

	.section	.rodata._.str.566,"a",@progbits
	.balign	1
	.local	_.str.566
_.str.566:
	.asciz	"count"

	.section	.rodata._.str.567,"a",@progbits
	.balign	1
	.local	_.str.567
_.str.567:
	.asciz	"countable"

	.section	.rodata._.str.568,"a",@progbits
	.balign	1
	.local	_.str.568
_.str.568:
	.asciz	"counter"

	.section	.rodata._.str.569,"a",@progbits
	.balign	1
	.local	_.str.569
_.str.569:
	.asciz	"counts"

	.section	.rodata._.str.570,"a",@progbits
	.balign	1
	.local	_.str.570
_.str.570:
	.asciz	"court"

	.section	.rodata._.str.571,"a",@progbits
	.balign	1
	.local	_.str.571
_.str.571:
	.asciz	"cousin"

	.section	.rodata._.str.572,"a",@progbits
	.balign	1
	.local	_.str.572
_.str.572:
	.asciz	"covariance"

	.section	.rodata._.str.573,"a",@progbits
	.balign	1
	.local	_.str.573
_.str.573:
	.asciz	"cover"

	.section	.rodata._.str.574,"a",@progbits
	.balign	1
	.local	_.str.574
_.str.574:
	.asciz	"covers"

	.section	.rodata._.str.575,"a",@progbits
	.balign	1
	.local	_.str.575
_.str.575:
	.asciz	"coxcomb"

	.section	.rodata._.str.576,"a",@progbits
	.balign	1
	.local	_.str.576
_.str.576:
	.asciz	"cracking"

	.section	.rodata._.str.577,"a",@progbits
	.balign	1
	.local	_.str.577
_.str.577:
	.asciz	"cramer"

	.section	.rodata._.str.578,"a",@progbits
	.balign	1
	.local	_.str.578
_.str.578:
	.asciz	"crashed"

	.section	.rodata._.str.579,"a",@progbits
	.balign	1
	.local	_.str.579
_.str.579:
	.asciz	"create"

	.section	.rodata._.str.580,"a",@progbits
	.balign	1
	.local	_.str.580
_.str.580:
	.asciz	"created"

	.section	.rodata._.str.581,"a",@progbits
	.balign	1
	.local	_.str.581
_.str.581:
	.asciz	"creates"

	.section	.rodata._.str.582,"a",@progbits
	.balign	1
	.local	_.str.582
_.str.582:
	.asciz	"creator"

	.section	.rodata._.str.583,"a",@progbits
	.balign	1
	.local	_.str.583
_.str.583:
	.asciz	"credit"

	.section	.rodata._.str.584,"a",@progbits
	.balign	1
	.local	_.str.584
_.str.584:
	.asciz	"crit"

	.section	.rodata._.str.585,"a",@progbits
	.balign	1
	.local	_.str.585
_.str.585:
	.asciz	"criterion"

	.section	.rodata._.str.586,"a",@progbits
	.balign	1
	.local	_.str.586
_.str.586:
	.asciz	"critical"

	.section	.rodata._.str.587,"a",@progbits
	.balign	1
	.local	_.str.587
_.str.587:
	.asciz	"crucial"

	.section	.rodata._.str.588,"a",@progbits
	.balign	1
	.local	_.str.588
_.str.588:
	.asciz	"cumulative"

	.section	.rodata._.str.589,"a",@progbits
	.balign	1
	.local	_.str.589
_.str.589:
	.asciz	"cunliffe"

	.section	.rodata._.str.590,"a",@progbits
	.balign	1
	.local	_.str.590
_.str.590:
	.asciz	"current"

	.section	.rodata._.str.591,"a",@progbits
	.balign	1
	.local	_.str.591
_.str.591:
	.asciz	"curriculum"

	.section	.rodata._.str.592,"a",@progbits
	.balign	1
	.local	_.str.592
_.str.592:
	.asciz	"curse"

	.section	.rodata._.str.593,"a",@progbits
	.balign	1
	.local	_.str.593
_.str.593:
	.asciz	"curve"

	.section	.rodata._.str.594,"a",@progbits
	.balign	1
	.local	_.str.594
_.str.594:
	.asciz	"curved"

	.section	.rodata._.str.595,"a",@progbits
	.balign	1
	.local	_.str.595
_.str.595:
	.asciz	"curves"

	.section	.rodata._.str.596,"a",@progbits
	.balign	1
	.local	_.str.596
_.str.596:
	.asciz	"cutoff"

	.section	.rodata._.str.597,"a",@progbits
	.balign	1
	.local	_.str.597
_.str.597:
	.asciz	"daily"

	.section	.rodata._.str.598,"a",@progbits
	.balign	1
	.local	_.str.598
_.str.598:
	.asciz	"damage"

	.section	.rodata._.str.599,"a",@progbits
	.balign	1
	.local	_.str.599
_.str.599:
	.asciz	"danger"

	.section	.rodata._.str.600,"a",@progbits
	.balign	1
	.local	_.str.600
_.str.600:
	.asciz	"dangers"

	.section	.rodata._.str.601,"a",@progbits
	.balign	1
	.local	_.str.601
_.str.601:
	.asciz	"darwin"

	.section	.rodata._.str.602,"a",@progbits
	.balign	1
	.local	_.str.602
_.str.602:
	.asciz	"data"

	.section	.rodata._.str.603,"a",@progbits
	.balign	1
	.local	_.str.603
_.str.603:
	.asciz	"database"

	.section	.rodata._.str.604,"a",@progbits
	.balign	1
	.local	_.str.604
_.str.604:
	.asciz	"dataset"

	.section	.rodata._.str.605,"a",@progbits
	.balign	1
	.local	_.str.605
_.str.605:
	.asciz	"datasets"

	.section	.rodata._.str.606,"a",@progbits
	.balign	1
	.local	_.str.606
_.str.606:
	.asciz	"david"

	.section	.rodata._.str.607,"a",@progbits
	.balign	1
	.local	_.str.607
_.str.607:
	.asciz	"days"

	.section	.rodata._.str.608,"a",@progbits
	.balign	1
	.local	_.str.608
_.str.608:
	.asciz	"death"

	.section	.rodata._.str.609,"a",@progbits
	.balign	1
	.local	_.str.609
_.str.609:
	.asciz	"december"

	.section	.rodata._.str.610,"a",@progbits
	.balign	1
	.local	_.str.610
_.str.610:
	.asciz	"decide"

	.section	.rodata._.str.611,"a",@progbits
	.balign	1
	.local	_.str.611
_.str.611:
	.asciz	"decile"

	.section	.rodata._.str.612,"a",@progbits
	.balign	1
	.local	_.str.612
_.str.612:
	.asciz	"decimal"

	.section	.rodata._.str.613,"a",@progbits
	.balign	1
	.local	_.str.613
_.str.613:
	.asciz	"decision"

	.section	.rodata._.str.614,"a",@progbits
	.balign	1
	.local	_.str.614
_.str.614:
	.asciz	"decisions"

	.section	.rodata._.str.615,"a",@progbits
	.balign	1
	.local	_.str.615
_.str.615:
	.asciz	"deck"

	.section	.rodata._.str.616,"a",@progbits
	.balign	1
	.local	_.str.616
_.str.616:
	.asciz	"decrease"

	.section	.rodata._.str.617,"a",@progbits
	.balign	1
	.local	_.str.617
_.str.617:
	.asciz	"decreases"

	.section	.rodata._.str.618,"a",@progbits
	.balign	1
	.local	_.str.618
_.str.618:
	.asciz	"deep"

	.section	.rodata._.str.619,"a",@progbits
	.balign	1
	.local	_.str.619
_.str.619:
	.asciz	"default"

	.section	.rodata._.str.620,"a",@progbits
	.balign	1
	.local	_.str.620
_.str.620:
	.asciz	"defeat"

	.section	.rodata._.str.621,"a",@progbits
	.balign	1
	.local	_.str.621
_.str.621:
	.asciz	"defeats"

	.section	.rodata._.str.622,"a",@progbits
	.balign	1
	.local	_.str.622
_.str.622:
	.asciz	"defend"

	.section	.rodata._.str.623,"a",@progbits
	.balign	1
	.local	_.str.623
_.str.623:
	.asciz	"defendant"

	.section	.rodata._.str.624,"a",@progbits
	.balign	1
	.local	_.str.624
_.str.624:
	.asciz	"define"

	.section	.rodata._.str.625,"a",@progbits
	.balign	1
	.local	_.str.625
_.str.625:
	.asciz	"defined"

	.section	.rodata._.str.626,"a",@progbits
	.balign	1
	.local	_.str.626
_.str.626:
	.asciz	"defines"

	.section	.rodata._.str.627,"a",@progbits
	.balign	1
	.local	_.str.627
_.str.627:
	.asciz	"defining"

	.section	.rodata._.str.628,"a",@progbits
	.balign	1
	.local	_.str.628
_.str.628:
	.asciz	"definition"

	.section	.rodata._.str.629,"a",@progbits
	.balign	1
	.local	_.str.629
_.str.629:
	.asciz	"definitions"

	.section	.rodata._.str.630,"a",@progbits
	.balign	1
	.local	_.str.630
_.str.630:
	.asciz	"definitively"

	.section	.rodata._.str.631,"a",@progbits
	.balign	1
	.local	_.str.631
_.str.631:
	.asciz	"degree"

	.section	.rodata._.str.632,"a",@progbits
	.balign	1
	.local	_.str.632
_.str.632:
	.asciz	"degrees"

	.section	.rodata._.str.633,"a",@progbits
	.balign	1
	.local	_.str.633
_.str.633:
	.asciz	"deming"

	.section	.rodata._.str.634,"a",@progbits
	.balign	1
	.local	_.str.634
_.str.634:
	.asciz	"demonstrate"

	.section	.rodata._.str.635,"a",@progbits
	.balign	1
	.local	_.str.635
_.str.635:
	.asciz	"denominator"

	.section	.rodata._.str.636,"a",@progbits
	.balign	1
	.local	_.str.636
_.str.636:
	.asciz	"density"

	.section	.rodata._.str.637,"a",@progbits
	.balign	1
	.local	_.str.637
_.str.637:
	.asciz	"dentify"

	.section	.rodata._.str.638,"a",@progbits
	.balign	1
	.local	_.str.638
_.str.638:
	.asciz	"department"

	.section	.rodata._.str.639,"a",@progbits
	.balign	1
	.local	_.str.639
_.str.639:
	.asciz	"departments"

	.section	.rodata._.str.640,"a",@progbits
	.balign	1
	.local	_.str.640
_.str.640:
	.asciz	"dependence"

	.section	.rodata._.str.641,"a",@progbits
	.balign	1
	.local	_.str.641
_.str.641:
	.asciz	"dependent"

	.section	.rodata._.str.642,"a",@progbits
	.balign	1
	.local	_.str.642
_.str.642:
	.asciz	"depending"

	.section	.rodata._.str.643,"a",@progbits
	.balign	1
	.local	_.str.643
_.str.643:
	.asciz	"depends"

	.section	.rodata._.str.644,"a",@progbits
	.balign	1
	.local	_.str.644
_.str.644:
	.asciz	"depression"

	.section	.rodata._.str.645,"a",@progbits
	.balign	1
	.local	_.str.645
_.str.645:
	.asciz	"depth"

	.section	.rodata._.str.646,"a",@progbits
	.balign	1
	.local	_.str.646
_.str.646:
	.asciz	"derivation"

	.section	.rodata._.str.647,"a",@progbits
	.balign	1
	.local	_.str.647
_.str.647:
	.asciz	"derivations"

	.section	.rodata._.str.648,"a",@progbits
	.balign	1
	.local	_.str.648
_.str.648:
	.asciz	"derivatives"

	.section	.rodata._.str.649,"a",@progbits
	.balign	1
	.local	_.str.649
_.str.649:
	.asciz	"derive"

	.section	.rodata._.str.650,"a",@progbits
	.balign	1
	.local	_.str.650
_.str.650:
	.asciz	"derived"

	.section	.rodata._.str.651,"a",@progbits
	.balign	1
	.local	_.str.651
_.str.651:
	.asciz	"derives"

	.section	.rodata._.str.652,"a",@progbits
	.balign	1
	.local	_.str.652
_.str.652:
	.asciz	"describe"

	.section	.rodata._.str.653,"a",@progbits
	.balign	1
	.local	_.str.653
_.str.653:
	.asciz	"described"

	.section	.rodata._.str.654,"a",@progbits
	.balign	1
	.local	_.str.654
_.str.654:
	.asciz	"describes"

	.section	.rodata._.str.655,"a",@progbits
	.balign	1
	.local	_.str.655
_.str.655:
	.asciz	"describing"

	.section	.rodata._.str.656,"a",@progbits
	.balign	1
	.local	_.str.656
_.str.656:
	.asciz	"description"

	.section	.rodata._.str.657,"a",@progbits
	.balign	1
	.local	_.str.657
_.str.657:
	.asciz	"descriptive"

	.section	.rodata._.str.658,"a",@progbits
	.balign	1
	.local	_.str.658
_.str.658:
	.asciz	"design"

	.section	.rodata._.str.659,"a",@progbits
	.balign	1
	.local	_.str.659
_.str.659:
	.asciz	"designed"

	.section	.rodata._.str.660,"a",@progbits
	.balign	1
	.local	_.str.660
_.str.660:
	.asciz	"desirability"

	.section	.rodata._.str.661,"a",@progbits
	.balign	1
	.local	_.str.661
_.str.661:
	.asciz	"despite"

	.section	.rodata._.str.662,"a",@progbits
	.balign	1
	.local	_.str.662
_.str.662:
	.asciz	"destruction"

	.section	.rodata._.str.663,"a",@progbits
	.balign	1
	.local	_.str.663
_.str.663:
	.asciz	"detailed"

	.section	.rodata._.str.664,"a",@progbits
	.balign	1
	.local	_.str.664
_.str.664:
	.asciz	"detect"

	.section	.rodata._.str.665,"a",@progbits
	.balign	1
	.local	_.str.665
_.str.665:
	.asciz	"determination"

	.section	.rodata._.str.666,"a",@progbits
	.balign	1
	.local	_.str.666
_.str.666:
	.asciz	"determine"

	.section	.rodata._.str.667,"a",@progbits
	.balign	1
	.local	_.str.667
_.str.667:
	.asciz	"determined"

	.section	.rodata._.str.668,"a",@progbits
	.balign	1
	.local	_.str.668
_.str.668:
	.asciz	"determines"

	.section	.rodata._.str.669,"a",@progbits
	.balign	1
	.local	_.str.669
_.str.669:
	.asciz	"determining"

	.section	.rodata._.str.670,"a",@progbits
	.balign	1
	.local	_.str.670
_.str.670:
	.asciz	"deterministic"

	.section	.rodata._.str.671,"a",@progbits
	.balign	1
	.local	_.str.671
_.str.671:
	.asciz	"develop"

	.section	.rodata._.str.672,"a",@progbits
	.balign	1
	.local	_.str.672
_.str.672:
	.asciz	"developed"

	.section	.rodata._.str.673,"a",@progbits
	.balign	1
	.local	_.str.673
_.str.673:
	.asciz	"development"

	.section	.rodata._.str.674,"a",@progbits
	.balign	1
	.local	_.str.674
_.str.674:
	.asciz	"develops"

	.section	.rodata._.str.675,"a",@progbits
	.balign	1
	.local	_.str.675
_.str.675:
	.asciz	"deviate"

	.section	.rodata._.str.676,"a",@progbits
	.balign	1
	.local	_.str.676
_.str.676:
	.asciz	"deviated"

	.section	.rodata._.str.677,"a",@progbits
	.balign	1
	.local	_.str.677
_.str.677:
	.asciz	"deviation"

	.section	.rodata._.str.678,"a",@progbits
	.balign	1
	.local	_.str.678
_.str.678:
	.asciz	"deviations"

	.section	.rodata._.str.679,"a",@progbits
	.balign	1
	.local	_.str.679
_.str.679:
	.asciz	"device"

	.section	.rodata._.str.680,"a",@progbits
	.balign	1
	.local	_.str.680
_.str.680:
	.asciz	"dewey"

	.section	.rodata._.str.681,"a",@progbits
	.balign	1
	.local	_.str.681
_.str.681:
	.asciz	"df"

	.section	.rodata._.str.682,"a",@progbits
	.balign	1
	.local	_.str.682
_.str.682:
	.asciz	"diagnosticon"

	.section	.rodata._.str.683,"a",@progbits
	.balign	1
	.local	_.str.683
_.str.683:
	.asciz	"diagnostics"

	.section	.rodata._.str.684,"a",@progbits
	.balign	1
	.local	_.str.684
_.str.684:
	.asciz	"diagram"

	.section	.rodata._.str.685,"a",@progbits
	.balign	1
	.local	_.str.685
_.str.685:
	.asciz	"diagrams"

	.section	.rodata._.str.686,"a",@progbits
	.balign	1
	.local	_.str.686
_.str.686:
	.asciz	"dice"

	.section	.rodata._.str.687,"a",@progbits
	.balign	1
	.local	_.str.687
_.str.687:
	.asciz	"dictionary"

	.section	.rodata._.str.688,"a",@progbits
	.balign	1
	.local	_.str.688
_.str.688:
	.asciz	"didn"

	.section	.rodata._.str.689,"a",@progbits
	.balign	1
	.local	_.str.689
_.str.689:
	.asciz	"died"

	.section	.rodata._.str.690,"a",@progbits
	.balign	1
	.local	_.str.690
_.str.690:
	.asciz	"diff"

	.section	.rodata._.str.691,"a",@progbits
	.balign	1
	.local	_.str.691
_.str.691:
	.asciz	"difference"

	.section	.rodata._.str.692,"a",@progbits
	.balign	1
	.local	_.str.692
_.str.692:
	.asciz	"differences"

	.section	.rodata._.str.693,"a",@progbits
	.balign	1
	.local	_.str.693
_.str.693:
	.asciz	"different"

	.section	.rodata._.str.694,"a",@progbits
	.balign	1
	.local	_.str.694
_.str.694:
	.asciz	"differential"

	.section	.rodata._.str.695,"a",@progbits
	.balign	1
	.local	_.str.695
_.str.695:
	.asciz	"difficult"

	.section	.rodata._.str.696,"a",@progbits
	.balign	1
	.local	_.str.696
_.str.696:
	.asciz	"difficulty"

	.section	.rodata._.str.697,"a",@progbits
	.balign	1
	.local	_.str.697
_.str.697:
	.asciz	"digest"

	.section	.rodata._.str.698,"a",@progbits
	.balign	1
	.local	_.str.698
_.str.698:
	.asciz	"digits"

	.section	.rodata._.str.699,"a",@progbits
	.balign	1
	.local	_.str.699
_.str.699:
	.asciz	"dimension"

	.section	.rodata._.str.700,"a",@progbits
	.balign	1
	.local	_.str.700
_.str.700:
	.asciz	"dimensionality"

	.section	.rodata._.str.701,"a",@progbits
	.balign	1
	.local	_.str.701
_.str.701:
	.asciz	"direct"

	.section	.rodata._.str.702,"a",@progbits
	.balign	1
	.local	_.str.702
_.str.702:
	.asciz	"direction"

	.section	.rodata._.str.703,"a",@progbits
	.balign	1
	.local	_.str.703
_.str.703:
	.asciz	"directions"

	.section	.rodata._.str.704,"a",@progbits
	.balign	1
	.local	_.str.704
_.str.704:
	.asciz	"directly"

	.section	.rodata._.str.705,"a",@progbits
	.balign	1
	.local	_.str.705
_.str.705:
	.asciz	"dirichlet"

	.section	.rodata._.str.706,"a",@progbits
	.balign	1
	.local	_.str.706
_.str.706:
	.asciz	"disappears"

	.section	.rodata._.str.707,"a",@progbits
	.balign	1
	.local	_.str.707
_.str.707:
	.asciz	"disaster"

	.section	.rodata._.str.708,"a",@progbits
	.balign	1
	.local	_.str.708
_.str.708:
	.asciz	"discovered"

	.section	.rodata._.str.709,"a",@progbits
	.balign	1
	.local	_.str.709
_.str.709:
	.asciz	"discrepancy"

	.section	.rodata._.str.710,"a",@progbits
	.balign	1
	.local	_.str.710
_.str.710:
	.asciz	"discrete"

	.section	.rodata._.str.711,"a",@progbits
	.balign	1
	.local	_.str.711
_.str.711:
	.asciz	"discreteness"

	.section	.rodata._.str.712,"a",@progbits
	.balign	1
	.local	_.str.712
_.str.712:
	.asciz	"discriminant"

	.section	.rodata._.str.713,"a",@progbits
	.balign	1
	.local	_.str.713
_.str.713:
	.asciz	"disease"

	.section	.rodata._.str.714,"a",@progbits
	.balign	1
	.local	_.str.714
_.str.714:
	.asciz	"diseases"

	.section	.rodata._.str.715,"a",@progbits
	.balign	1
	.local	_.str.715
_.str.715:
	.asciz	"disjoint"

	.section	.rodata._.str.716,"a",@progbits
	.balign	1
	.local	_.str.716
_.str.716:
	.asciz	"dispersion"

	.section	.rodata._.str.717,"a",@progbits
	.balign	1
	.local	_.str.717
_.str.717:
	.asciz	"display"

	.section	.rodata._.str.718,"a",@progbits
	.balign	1
	.local	_.str.718
_.str.718:
	.asciz	"displayed"

	.section	.rodata._.str.719,"a",@progbits
	.balign	1
	.local	_.str.719
_.str.719:
	.asciz	"displaying"

	.section	.rodata._.str.720,"a",@progbits
	.balign	1
	.local	_.str.720
_.str.720:
	.asciz	"displays"

	.section	.rodata._.str.721,"a",@progbits
	.balign	1
	.local	_.str.721
_.str.721:
	.asciz	"distance"

	.section	.rodata._.str.722,"a",@progbits
	.balign	1
	.local	_.str.722
_.str.722:
	.asciz	"distances"

	.section	.rodata._.str.723,"a",@progbits
	.balign	1
	.local	_.str.723
_.str.723:
	.asciz	"distinct"

	.section	.rodata._.str.724,"a",@progbits
	.balign	1
	.local	_.str.724
_.str.724:
	.asciz	"distinction"

	.section	.rodata._.str.725,"a",@progbits
	.balign	1
	.local	_.str.725
_.str.725:
	.asciz	"distinguish"

	.section	.rodata._.str.726,"a",@progbits
	.balign	1
	.local	_.str.726
_.str.726:
	.asciz	"distractor"

	.section	.rodata._.str.727,"a",@progbits
	.balign	1
	.local	_.str.727
_.str.727:
	.asciz	"distractors"

	.section	.rodata._.str.728,"a",@progbits
	.balign	1
	.local	_.str.728
_.str.728:
	.asciz	"distributed"

	.section	.rodata._.str.729,"a",@progbits
	.balign	1
	.local	_.str.729
_.str.729:
	.asciz	"distribution"

	.section	.rodata._.str.730,"a",@progbits
	.balign	1
	.local	_.str.730
_.str.730:
	.asciz	"distributions"

	.section	.rodata._.str.731,"a",@progbits
	.balign	1
	.local	_.str.731
_.str.731:
	.asciz	"dive"

	.section	.rodata._.str.732,"a",@progbits
	.balign	1
	.local	_.str.732
_.str.732:
	.asciz	"diverse"

	.section	.rodata._.str.733,"a",@progbits
	.balign	1
	.local	_.str.733
_.str.733:
	.asciz	"divide"

	.section	.rodata._.str.734,"a",@progbits
	.balign	1
	.local	_.str.734
_.str.734:
	.asciz	"divided"

	.section	.rodata._.str.735,"a",@progbits
	.balign	1
	.local	_.str.735
_.str.735:
	.asciz	"divides"

	.section	.rodata._.str.736,"a",@progbits
	.balign	1
	.local	_.str.736
_.str.736:
	.asciz	"dividing"

	.section	.rodata._.str.737,"a",@progbits
	.balign	1
	.local	_.str.737
_.str.737:
	.asciz	"division"

	.section	.rodata._.str.738,"a",@progbits
	.balign	1
	.local	_.str.738
_.str.738:
	.asciz	"doctor"

	.section	.rodata._.str.739,"a",@progbits
	.balign	1
	.local	_.str.739
_.str.739:
	.asciz	"does"

	.section	.rodata._.str.740,"a",@progbits
	.balign	1
	.local	_.str.740
_.str.740:
	.asciz	"doesn"

	.section	.rodata._.str.741,"a",@progbits
	.balign	1
	.local	_.str.741
_.str.741:
	.asciz	"doing"

	.section	.rodata._.str.742,"a",@progbits
	.balign	1
	.local	_.str.742
_.str.742:
	.asciz	"dollars"

	.section	.rodata._.str.743,"a",@progbits
	.balign	1
	.local	_.str.743
_.str.743:
	.asciz	"door"

	.section	.rodata._.str.744,"a",@progbits
	.balign	1
	.local	_.str.744
_.str.744:
	.asciz	"doors"

	.section	.rodata._.str.745,"a",@progbits
	.balign	1
	.local	_.str.745
_.str.745:
	.asciz	"dosage"

	.section	.rodata._.str.746,"a",@progbits
	.balign	1
	.local	_.str.746
_.str.746:
	.asciz	"dotplot"

	.section	.rodata._.str.747,"a",@progbits
	.balign	1
	.local	_.str.747
_.str.747:
	.asciz	"dotplots"

	.section	.rodata._.str.748,"a",@progbits
	.balign	1
	.local	_.str.748
_.str.748:
	.asciz	"double"

	.section	.rodata._.str.749,"a",@progbits
	.balign	1
	.local	_.str.749
_.str.749:
	.asciz	"doubles"

	.section	.rodata._.str.750,"a",@progbits
	.balign	1
	.local	_.str.750
_.str.750:
	.asciz	"down"

	.section	.rodata._.str.751,"a",@progbits
	.balign	1
	.local	_.str.751
_.str.751:
	.asciz	"draft"

	.section	.rodata._.str.752,"a",@progbits
	.balign	1
	.local	_.str.752
_.str.752:
	.asciz	"drafted"

	.section	.rodata._.str.753,"a",@progbits
	.balign	1
	.local	_.str.753
_.str.753:
	.asciz	"dragged"

	.section	.rodata._.str.754,"a",@progbits
	.balign	1
	.local	_.str.754
_.str.754:
	.asciz	"drastically"

	.section	.rodata._.str.755,"a",@progbits
	.balign	1
	.local	_.str.755
_.str.755:
	.asciz	"draw"

	.section	.rodata._.str.756,"a",@progbits
	.balign	1
	.local	_.str.756
_.str.756:
	.asciz	"drawing"

	.section	.rodata._.str.757,"a",@progbits
	.balign	1
	.local	_.str.757
_.str.757:
	.asciz	"drawings"

	.section	.rodata._.str.758,"a",@progbits
	.balign	1
	.local	_.str.758
_.str.758:
	.asciz	"drawn"

	.section	.rodata._.str.759,"a",@progbits
	.balign	1
	.local	_.str.759
_.str.759:
	.asciz	"draws"

	.section	.rodata._.str.760,"a",@progbits
	.balign	1
	.local	_.str.760
_.str.760:
	.asciz	"dropped"

	.section	.rodata._.str.761,"a",@progbits
	.balign	1
	.local	_.str.761
_.str.761:
	.asciz	"drug"

	.section	.rodata._.str.762,"a",@progbits
	.balign	1
	.local	_.str.762
_.str.762:
	.asciz	"duplicate"

	.section	.rodata._.str.763,"a",@progbits
	.balign	1
	.local	_.str.763
_.str.763:
	.asciz	"duplicates"

	.section	.rodata._.str.764,"a",@progbits
	.balign	1
	.local	_.str.764
_.str.764:
	.asciz	"duration"

	.section	.rodata._.str.765,"a",@progbits
	.balign	1
	.local	_.str.765
_.str.765:
	.asciz	"during"

	.section	.rodata._.str.766,"a",@progbits
	.balign	1
	.local	_.str.766
_.str.766:
	.asciz	"dying"

	.section	.rodata._.str.767,"a",@progbits
	.balign	1
	.local	_.str.767
_.str.767:
	.asciz	"dynamic"

	.section	.rodata._.str.768,"a",@progbits
	.balign	1
	.local	_.str.768
_.str.768:
	.asciz	"each"

	.section	.rodata._.str.769,"a",@progbits
	.balign	1
	.local	_.str.769
_.str.769:
	.asciz	"early"

	.section	.rodata._.str.770,"a",@progbits
	.balign	1
	.local	_.str.770
_.str.770:
	.asciz	"earn"

	.section	.rodata._.str.771,"a",@progbits
	.balign	1
	.local	_.str.771
_.str.771:
	.asciz	"earns"

	.section	.rodata._.str.772,"a",@progbits
	.balign	1
	.local	_.str.772
_.str.772:
	.asciz	"easier"

	.section	.rodata._.str.773,"a",@progbits
	.balign	1
	.local	_.str.773
_.str.773:
	.asciz	"easiest"

	.section	.rodata._.str.774,"a",@progbits
	.balign	1
	.local	_.str.774
_.str.774:
	.asciz	"easily"

	.section	.rodata._.str.775,"a",@progbits
	.balign	1
	.local	_.str.775
_.str.775:
	.asciz	"easy"

	.section	.rodata._.str.776,"a",@progbits
	.balign	1
	.local	_.str.776
_.str.776:
	.asciz	"eating"

	.section	.rodata._.str.777,"a",@progbits
	.balign	1
	.local	_.str.777
_.str.777:
	.asciz	"econometrics"

	.section	.rodata._.str.778,"a",@progbits
	.balign	1
	.local	_.str.778
_.str.778:
	.asciz	"edit"

	.section	.rodata._.str.779,"a",@progbits
	.balign	1
	.local	_.str.779
_.str.779:
	.asciz	"edward"

	.section	.rodata._.str.780,"a",@progbits
	.balign	1
	.local	_.str.780
_.str.780:
	.asciz	"edwards"

	.section	.rodata._.str.781,"a",@progbits
	.balign	1
	.local	_.str.781
_.str.781:
	.asciz	"effect"

	.section	.rodata._.str.782,"a",@progbits
	.balign	1
	.local	_.str.782
_.str.782:
	.asciz	"effective"

	.section	.rodata._.str.783,"a",@progbits
	.balign	1
	.local	_.str.783
_.str.783:
	.asciz	"effectively"

	.section	.rodata._.str.784,"a",@progbits
	.balign	1
	.local	_.str.784
_.str.784:
	.asciz	"effects"

	.section	.rodata._.str.785,"a",@progbits
	.balign	1
	.local	_.str.785
_.str.785:
	.asciz	"efficiency"

	.section	.rodata._.str.786,"a",@progbits
	.balign	1
	.local	_.str.786
_.str.786:
	.asciz	"effl"

	.section	.rodata._.str.787,"a",@progbits
	.balign	1
	.local	_.str.787
_.str.787:
	.asciz	"efron"

	.section	.rodata._.str.788,"a",@progbits
	.balign	1
	.local	_.str.788
_.str.788:
	.asciz	"egon"

	.section	.rodata._.str.789,"a",@progbits
	.balign	1
	.local	_.str.789
_.str.789:
	.asciz	"eigenvalue"

	.section	.rodata._.str.790,"a",@progbits
	.balign	1
	.local	_.str.790
_.str.790:
	.asciz	"eigenvalues"

	.section	.rodata._.str.791,"a",@progbits
	.balign	1
	.local	_.str.791
_.str.791:
	.asciz	"eigenvectors"

	.section	.rodata._.str.792,"a",@progbits
	.balign	1
	.local	_.str.792
_.str.792:
	.asciz	"either"

	.section	.rodata._.str.793,"a",@progbits
	.balign	1
	.local	_.str.793
_.str.793:
	.asciz	"election"

	.section	.rodata._.str.794,"a",@progbits
	.balign	1
	.local	_.str.794
_.str.794:
	.asciz	"electoral"

	.section	.rodata._.str.795,"a",@progbits
	.balign	1
	.local	_.str.795
_.str.795:
	.asciz	"element"

	.section	.rodata._.str.796,"a",@progbits
	.balign	1
	.local	_.str.796
_.str.796:
	.asciz	"elements"

	.section	.rodata._.str.797,"a",@progbits
	.balign	1
	.local	_.str.797
_.str.797:
	.asciz	"eliminate"

	.section	.rodata._.str.798,"a",@progbits
	.balign	1
	.local	_.str.798
_.str.798:
	.asciz	"eliminating"

	.section	.rodata._.str.799,"a",@progbits
	.balign	1
	.local	_.str.799
_.str.799:
	.asciz	"elimination"

	.section	.rodata._.str.800,"a",@progbits
	.balign	1
	.local	_.str.800
_.str.800:
	.asciz	"else"

	.section	.rodata._.str.801,"a",@progbits
	.balign	1
	.local	_.str.801
_.str.801:
	.asciz	"empirical"

	.section	.rodata._.str.802,"a",@progbits
	.balign	1
	.local	_.str.802
_.str.802:
	.asciz	"empty"

	.section	.rodata._.str.803,"a",@progbits
	.balign	1
	.local	_.str.803
_.str.803:
	.asciz	"enable"

	.section	.rodata._.str.804,"a",@progbits
	.balign	1
	.local	_.str.804
_.str.804:
	.asciz	"encyclopedia"

	.section	.rodata._.str.805,"a",@progbits
	.balign	1
	.local	_.str.805
_.str.805:
	.asciz	"ended"

	.section	.rodata._.str.806,"a",@progbits
	.balign	1
	.local	_.str.806
_.str.806:
	.asciz	"engineers"

	.section	.rodata._.str.807,"a",@progbits
	.balign	1
	.local	_.str.807
_.str.807:
	.asciz	"english"

	.section	.rodata._.str.808,"a",@progbits
	.balign	1
	.local	_.str.808
_.str.808:
	.asciz	"enough"

	.section	.rodata._.str.809,"a",@progbits
	.balign	1
	.local	_.str.809
_.str.809:
	.asciz	"ensemble"

	.section	.rodata._.str.810,"a",@progbits
	.balign	1
	.local	_.str.810
_.str.810:
	.asciz	"ensure"

	.section	.rodata._.str.811,"a",@progbits
	.balign	1
	.local	_.str.811
_.str.811:
	.asciz	"ensures"

	.section	.rodata._.str.812,"a",@progbits
	.balign	1
	.local	_.str.812
_.str.812:
	.asciz	"ensuring"

	.section	.rodata._.str.813,"a",@progbits
	.balign	1
	.local	_.str.813
_.str.813:
	.asciz	"enter"

	.section	.rodata._.str.814,"a",@progbits
	.balign	1
	.local	_.str.814
_.str.814:
	.asciz	"entire"

	.section	.rodata._.str.815,"a",@progbits
	.balign	1
	.local	_.str.815
_.str.815:
	.asciz	"entry"

	.section	.rodata._.str.816,"a",@progbits
	.balign	1
	.local	_.str.816
_.str.816:
	.asciz	"epistemological"

	.section	.rodata._.str.817,"a",@progbits
	.balign	1
	.local	_.str.817
_.str.817:
	.asciz	"epsilon"

	.section	.rodata._.str.818,"a",@progbits
	.balign	1
	.local	_.str.818
_.str.818:
	.asciz	"equal"

	.section	.rodata._.str.819,"a",@progbits
	.balign	1
	.local	_.str.819
_.str.819:
	.asciz	"equally"

	.section	.rodata._.str.820,"a",@progbits
	.balign	1
	.local	_.str.820
_.str.820:
	.asciz	"equals"

	.section	.rodata._.str.821,"a",@progbits
	.balign	1
	.local	_.str.821
_.str.821:
	.asciz	"equation"

	.section	.rodata._.str.822,"a",@progbits
	.balign	1
	.local	_.str.822
_.str.822:
	.asciz	"equations"

	.section	.rodata._.str.823,"a",@progbits
	.balign	1
	.local	_.str.823
_.str.823:
	.asciz	"equivalent"

	.section	.rodata._.str.824,"a",@progbits
	.balign	1
	.local	_.str.824
_.str.824:
	.asciz	"ergodicity"

	.section	.rodata._.str.825,"a",@progbits
	.balign	1
	.local	_.str.825
_.str.825:
	.asciz	"erlang"

	.section	.rodata._.str.826,"a",@progbits
	.balign	1
	.local	_.str.826
_.str.826:
	.asciz	"error"

	.section	.rodata._.str.827,"a",@progbits
	.balign	1
	.local	_.str.827
_.str.827:
	.asciz	"errors"

	.section	.rodata._.str.828,"a",@progbits
	.balign	1
	.local	_.str.828
_.str.828:
	.asciz	"essential"

	.section	.rodata._.str.829,"a",@progbits
	.balign	1
	.local	_.str.829
_.str.829:
	.asciz	"essentially"

	.section	.rodata._.str.830,"a",@progbits
	.balign	1
	.local	_.str.830
_.str.830:
	.asciz	"establishing"

	.section	.rodata._.str.831,"a",@progbits
	.balign	1
	.local	_.str.831
_.str.831:
	.asciz	"estimate"

	.section	.rodata._.str.832,"a",@progbits
	.balign	1
	.local	_.str.832
_.str.832:
	.asciz	"estimated"

	.section	.rodata._.str.833,"a",@progbits
	.balign	1
	.local	_.str.833
_.str.833:
	.asciz	"estimates"

	.section	.rodata._.str.834,"a",@progbits
	.balign	1
	.local	_.str.834
_.str.834:
	.asciz	"estimating"

	.section	.rodata._.str.835,"a",@progbits
	.balign	1
	.local	_.str.835
_.str.835:
	.asciz	"estimation"

	.section	.rodata._.str.836,"a",@progbits
	.balign	1
	.local	_.str.836
_.str.836:
	.asciz	"estimator"

	.section	.rodata._.str.837,"a",@progbits
	.balign	1
	.local	_.str.837
_.str.837:
	.asciz	"estimators"

	.section	.rodata._.str.838,"a",@progbits
	.balign	1
	.local	_.str.838
_.str.838:
	.asciz	"ethical"

	.section	.rodata._.str.839,"a",@progbits
	.balign	1
	.local	_.str.839
_.str.839:
	.asciz	"ethics"

	.section	.rodata._.str.840,"a",@progbits
	.balign	1
	.local	_.str.840
_.str.840:
	.asciz	"evaluate"

	.section	.rodata._.str.841,"a",@progbits
	.balign	1
	.local	_.str.841
_.str.841:
	.asciz	"evaluating"

	.section	.rodata._.str.842,"a",@progbits
	.balign	1
	.local	_.str.842
_.str.842:
	.asciz	"evaluation"

	.section	.rodata._.str.843,"a",@progbits
	.balign	1
	.local	_.str.843
_.str.843:
	.asciz	"even"

	.section	.rodata._.str.844,"a",@progbits
	.balign	1
	.local	_.str.844
_.str.844:
	.asciz	"event"

	.section	.rodata._.str.845,"a",@progbits
	.balign	1
	.local	_.str.845
_.str.845:
	.asciz	"events"

	.section	.rodata._.str.846,"a",@progbits
	.balign	1
	.local	_.str.846
_.str.846:
	.asciz	"ever"

	.section	.rodata._.str.847,"a",@progbits
	.balign	1
	.local	_.str.847
_.str.847:
	.asciz	"every"

	.section	.rodata._.str.848,"a",@progbits
	.balign	1
	.local	_.str.848
_.str.848:
	.asciz	"everything"

	.section	.rodata._.str.849,"a",@progbits
	.balign	1
	.local	_.str.849
_.str.849:
	.asciz	"evidence"

	.section	.rodata._.str.850,"a",@progbits
	.balign	1
	.local	_.str.850
_.str.850:
	.asciz	"evolution"

	.section	.rodata._.str.851,"a",@progbits
	.balign	1
	.local	_.str.851
_.str.851:
	.asciz	"exact"

	.section	.rodata._.str.852,"a",@progbits
	.balign	1
	.local	_.str.852
_.str.852:
	.asciz	"exactly"

	.section	.rodata._.str.853,"a",@progbits
	.balign	1
	.local	_.str.853
_.str.853:
	.asciz	"exaggerate"

	.section	.rodata._.str.854,"a",@progbits
	.balign	1
	.local	_.str.854
_.str.854:
	.asciz	"exam"

	.section	.rodata._.str.855,"a",@progbits
	.balign	1
	.local	_.str.855
_.str.855:
	.asciz	"example"

	.section	.rodata._.str.856,"a",@progbits
	.balign	1
	.local	_.str.856
_.str.856:
	.asciz	"exams"

	.section	.rodata._.str.857,"a",@progbits
	.balign	1
	.local	_.str.857
_.str.857:
	.asciz	"excess"

	.section	.rodata._.str.858,"a",@progbits
	.balign	1
	.local	_.str.858
_.str.858:
	.asciz	"exchange"

	.section	.rodata._.str.859,"a",@progbits
	.balign	1
	.local	_.str.859
_.str.859:
	.asciz	"exchanging"

	.section	.rodata._.str.860,"a",@progbits
	.balign	1
	.local	_.str.860
_.str.860:
	.asciz	"exclusive"

	.section	.rodata._.str.861,"a",@progbits
	.balign	1
	.local	_.str.861
_.str.861:
	.asciz	"execute"

	.section	.rodata._.str.862,"a",@progbits
	.balign	1
	.local	_.str.862
_.str.862:
	.asciz	"execution"

	.section	.rodata._.str.863,"a",@progbits
	.balign	1
	.local	_.str.863
_.str.863:
	.asciz	"exhaustive"

	.section	.rodata._.str.864,"a",@progbits
	.balign	1
	.local	_.str.864
_.str.864:
	.asciz	"exist"

	.section	.rodata._.str.865,"a",@progbits
	.balign	1
	.local	_.str.865
_.str.865:
	.asciz	"existence"

	.section	.rodata._.str.866,"a",@progbits
	.balign	1
	.local	_.str.866
_.str.866:
	.asciz	"existing"

	.section	.rodata._.str.867,"a",@progbits
	.balign	1
	.local	_.str.867
_.str.867:
	.asciz	"exists"

	.section	.rodata._.str.868,"a",@progbits
	.balign	1
	.local	_.str.868
_.str.868:
	.asciz	"expanded"

	.section	.rodata._.str.869,"a",@progbits
	.balign	1
	.local	_.str.869
_.str.869:
	.asciz	"expect"

	.section	.rodata._.str.870,"a",@progbits
	.balign	1
	.local	_.str.870
_.str.870:
	.asciz	"expectation"

	.section	.rodata._.str.871,"a",@progbits
	.balign	1
	.local	_.str.871
_.str.871:
	.asciz	"expectations"

	.section	.rodata._.str.872,"a",@progbits
	.balign	1
	.local	_.str.872
_.str.872:
	.asciz	"expected"

	.section	.rodata._.str.873,"a",@progbits
	.balign	1
	.local	_.str.873
_.str.873:
	.asciz	"experiment"

	.section	.rodata._.str.874,"a",@progbits
	.balign	1
	.local	_.str.874
_.str.874:
	.asciz	"experimental"

	.section	.rodata._.str.875,"a",@progbits
	.balign	1
	.local	_.str.875
_.str.875:
	.asciz	"experiments"

	.section	.rodata._.str.876,"a",@progbits
	.balign	1
	.local	_.str.876
_.str.876:
	.asciz	"explain"

	.section	.rodata._.str.877,"a",@progbits
	.balign	1
	.local	_.str.877
_.str.877:
	.asciz	"explained"

	.section	.rodata._.str.878,"a",@progbits
	.balign	1
	.local	_.str.878
_.str.878:
	.asciz	"explaining"

	.section	.rodata._.str.879,"a",@progbits
	.balign	1
	.local	_.str.879
_.str.879:
	.asciz	"explanation"

	.section	.rodata._.str.880,"a",@progbits
	.balign	1
	.local	_.str.880
_.str.880:
	.asciz	"explanatory"

	.section	.rodata._.str.881,"a",@progbits
	.balign	1
	.local	_.str.881
_.str.881:
	.asciz	"explicit"

	.section	.rodata._.str.882,"a",@progbits
	.balign	1
	.local	_.str.882
_.str.882:
	.asciz	"explicitly"

	.section	.rodata._.str.883,"a",@progbits
	.balign	1
	.local	_.str.883
_.str.883:
	.asciz	"exploded"

	.section	.rodata._.str.884,"a",@progbits
	.balign	1
	.local	_.str.884
_.str.884:
	.asciz	"exploratory"

	.section	.rodata._.str.885,"a",@progbits
	.balign	1
	.local	_.str.885
_.str.885:
	.asciz	"explores"

	.section	.rodata._.str.886,"a",@progbits
	.balign	1
	.local	_.str.886
_.str.886:
	.asciz	"exploring"

	.section	.rodata._.str.887,"a",@progbits
	.balign	1
	.local	_.str.887
_.str.887:
	.asciz	"exponential"

	.section	.rodata._.str.888,"a",@progbits
	.balign	1
	.local	_.str.888
_.str.888:
	.asciz	"exponentially"

	.section	.rodata._.str.889,"a",@progbits
	.balign	1
	.local	_.str.889
_.str.889:
	.asciz	"exposure"

	.section	.rodata._.str.890,"a",@progbits
	.balign	1
	.local	_.str.890
_.str.890:
	.asciz	"expresses"

	.section	.rodata._.str.891,"a",@progbits
	.balign	1
	.local	_.str.891
_.str.891:
	.asciz	"expressing"

	.section	.rodata._.str.892,"a",@progbits
	.balign	1
	.local	_.str.892
_.str.892:
	.asciz	"expression"

	.section	.rodata._.str.893,"a",@progbits
	.balign	1
	.local	_.str.893
_.str.893:
	.asciz	"extend"

	.section	.rodata._.str.894,"a",@progbits
	.balign	1
	.local	_.str.894
_.str.894:
	.asciz	"extended"

	.section	.rodata._.str.895,"a",@progbits
	.balign	1
	.local	_.str.895
_.str.895:
	.asciz	"extensive"

	.section	.rodata._.str.896,"a",@progbits
	.balign	1
	.local	_.str.896
_.str.896:
	.asciz	"extra"

	.section	.rodata._.str.897,"a",@progbits
	.balign	1
	.local	_.str.897
_.str.897:
	.asciz	"extract"

	.section	.rodata._.str.898,"a",@progbits
	.balign	1
	.local	_.str.898
_.str.898:
	.asciz	"extrapolating"

	.section	.rodata._.str.899,"a",@progbits
	.balign	1
	.local	_.str.899
_.str.899:
	.asciz	"extrapolation"

	.section	.rodata._.str.900,"a",@progbits
	.balign	1
	.local	_.str.900
_.str.900:
	.asciz	"extreme"

	.section	.rodata._.str.901,"a",@progbits
	.balign	1
	.local	_.str.901
_.str.901:
	.asciz	"extremely"

	.section	.rodata._.str.902,"a",@progbits
	.balign	1
	.local	_.str.902
_.str.902:
	.asciz	"ez80"

	.section	.rodata._.str.903,"a",@progbits
	.balign	1
	.local	_.str.903
_.str.903:
	.asciz	"face"

	.section	.rodata._.str.904,"a",@progbits
	.balign	1
	.local	_.str.904
_.str.904:
	.asciz	"fact"

	.section	.rodata._.str.905,"a",@progbits
	.balign	1
	.local	_.str.905
_.str.905:
	.asciz	"factor"

	.section	.rodata._.str.906,"a",@progbits
	.balign	1
	.local	_.str.906
_.str.906:
	.asciz	"factorial"

	.section	.rodata._.str.907,"a",@progbits
	.balign	1
	.local	_.str.907
_.str.907:
	.asciz	"factorials"

	.section	.rodata._.str.908,"a",@progbits
	.balign	1
	.local	_.str.908
_.str.908:
	.asciz	"factors"

	.section	.rodata._.str.909,"a",@progbits
	.balign	1
	.local	_.str.909
_.str.909:
	.asciz	"factory"

	.section	.rodata._.str.910,"a",@progbits
	.balign	1
	.local	_.str.910
_.str.910:
	.asciz	"fail"

	.section	.rodata._.str.911,"a",@progbits
	.balign	1
	.local	_.str.911
_.str.911:
	.asciz	"failing"

	.section	.rodata._.str.912,"a",@progbits
	.balign	1
	.local	_.str.912
_.str.912:
	.asciz	"failure"

	.section	.rodata._.str.913,"a",@progbits
	.balign	1
	.local	_.str.913
_.str.913:
	.asciz	"failures"

	.section	.rodata._.str.914,"a",@progbits
	.balign	1
	.local	_.str.914
_.str.914:
	.asciz	"fair"

	.section	.rodata._.str.915,"a",@progbits
	.balign	1
	.local	_.str.915
_.str.915:
	.asciz	"fake"

	.section	.rodata._.str.916,"a",@progbits
	.balign	1
	.local	_.str.916
_.str.916:
	.asciz	"fall"

	.section	.rodata._.str.917,"a",@progbits
	.balign	1
	.local	_.str.917
_.str.917:
	.asciz	"fallacy"

	.section	.rodata._.str.918,"a",@progbits
	.balign	1
	.local	_.str.918
_.str.918:
	.asciz	"falls"

	.section	.rodata._.str.919,"a",@progbits
	.balign	1
	.local	_.str.919
_.str.919:
	.asciz	"false"

	.section	.rodata._.str.920,"a",@progbits
	.balign	1
	.local	_.str.920
_.str.920:
	.asciz	"fame"

	.section	.rodata._.str.921,"a",@progbits
	.balign	1
	.local	_.str.921
_.str.921:
	.asciz	"family"

	.section	.rodata._.str.922,"a",@progbits
	.balign	1
	.local	_.str.922
_.str.922:
	.asciz	"famous"

	.section	.rodata._.str.923,"a",@progbits
	.balign	1
	.local	_.str.923
_.str.923:
	.asciz	"famously"

	.section	.rodata._.str.924,"a",@progbits
	.balign	1
	.local	_.str.924
_.str.924:
	.asciz	"fanning"

	.section	.rodata._.str.925,"a",@progbits
	.balign	1
	.local	_.str.925
_.str.925:
	.asciz	"fans"

	.section	.rodata._.str.926,"a",@progbits
	.balign	1
	.local	_.str.926
_.str.926:
	.asciz	"faster"

	.section	.rodata._.str.927,"a",@progbits
	.balign	1
	.local	_.str.927
_.str.927:
	.asciz	"fastest"

	.section	.rodata._.str.928,"a",@progbits
	.balign	1
	.local	_.str.928
_.str.928:
	.asciz	"fatal"

	.section	.rodata._.str.929,"a",@progbits
	.balign	1
	.local	_.str.929
_.str.929:
	.asciz	"father"

	.section	.rodata._.str.930,"a",@progbits
	.balign	1
	.local	_.str.930
_.str.930:
	.asciz	"fatter"

	.section	.rodata._.str.931,"a",@progbits
	.balign	1
	.local	_.str.931
_.str.931:
	.asciz	"favor"

	.section	.rodata._.str.932,"a",@progbits
	.balign	1
	.local	_.str.932
_.str.932:
	.asciz	"favorite"

	.section	.rodata._.str.933,"a",@progbits
	.balign	1
	.local	_.str.933
_.str.933:
	.asciz	"favors"

	.section	.rodata._.str.934,"a",@progbits
	.balign	1
	.local	_.str.934
_.str.934:
	.asciz	"features"

	.section	.rodata._.str.935,"a",@progbits
	.balign	1
	.local	_.str.935
_.str.935:
	.asciz	"february"

	.section	.rodata._.str.936,"a",@progbits
	.balign	1
	.local	_.str.936
_.str.936:
	.asciz	"female"

	.section	.rodata._.str.937,"a",@progbits
	.balign	1
	.local	_.str.937
_.str.937:
	.asciz	"fermat"

	.section	.rodata._.str.938,"a",@progbits
	.balign	1
	.local	_.str.938
_.str.938:
	.asciz	"fertilizer"

	.section	.rodata._.str.939,"a",@progbits
	.balign	1
	.local	_.str.939
_.str.939:
	.asciz	"field"

	.section	.rodata._.str.940,"a",@progbits
	.balign	1
	.local	_.str.940
_.str.940:
	.asciz	"files"

	.section	.rodata._.str.941,"a",@progbits
	.balign	1
	.local	_.str.941
_.str.941:
	.asciz	"fill"

	.section	.rodata._.str.942,"a",@progbits
	.balign	1
	.local	_.str.942
_.str.942:
	.asciz	"filter"

	.section	.rodata._.str.943,"a",@progbits
	.balign	1
	.local	_.str.943
_.str.943:
	.asciz	"final"

	.section	.rodata._.str.944,"a",@progbits
	.balign	1
	.local	_.str.944
_.str.944:
	.asciz	"finance"

	.section	.rodata._.str.945,"a",@progbits
	.balign	1
	.local	_.str.945
_.str.945:
	.asciz	"find"

	.section	.rodata._.str.946,"a",@progbits
	.balign	1
	.local	_.str.946
_.str.946:
	.asciz	"finding"

	.section	.rodata._.str.947,"a",@progbits
	.balign	1
	.local	_.str.947
_.str.947:
	.asciz	"finds"

	.section	.rodata._.str.948,"a",@progbits
	.balign	1
	.local	_.str.948
_.str.948:
	.asciz	"finite"

	.section	.rodata._.str.949,"a",@progbits
	.balign	1
	.local	_.str.949
_.str.949:
	.asciz	"first"

	.section	.rodata._.str.950,"a",@progbits
	.balign	1
	.local	_.str.950
_.str.950:
	.asciz	"fisher"

	.section	.rodata._.str.951,"a",@progbits
	.balign	1
	.local	_.str.951
_.str.951:
	.asciz	"fits"

	.section	.rodata._.str.952,"a",@progbits
	.balign	1
	.local	_.str.952
_.str.952:
	.asciz	"five"

	.section	.rodata._.str.953,"a",@progbits
	.balign	1
	.local	_.str.953
_.str.953:
	.asciz	"fivethirtyeight"

	.section	.rodata._.str.954,"a",@progbits
	.balign	1
	.local	_.str.954
_.str.954:
	.asciz	"fixed"

	.section	.rodata._.str.955,"a",@progbits
	.balign	1
	.local	_.str.955
_.str.955:
	.asciz	"flash"

	.section	.rodata._.str.956,"a",@progbits
	.balign	1
	.local	_.str.956
_.str.956:
	.asciz	"flaw"

	.section	.rodata._.str.957,"a",@progbits
	.balign	1
	.local	_.str.957
_.str.957:
	.asciz	"flexible"

	.section	.rodata._.str.958,"a",@progbits
	.balign	1
	.local	_.str.958
_.str.958:
	.asciz	"flights"

	.section	.rodata._.str.959,"a",@progbits
	.balign	1
	.local	_.str.959
_.str.959:
	.asciz	"flip"

	.section	.rodata._.str.960,"a",@progbits
	.balign	1
	.local	_.str.960
_.str.960:
	.asciz	"florence"

	.section	.rodata._.str.961,"a",@progbits
	.balign	1
	.local	_.str.961
_.str.961:
	.asciz	"fluctuations"

	.section	.rodata._.str.962,"a",@progbits
	.balign	1
	.local	_.str.962
_.str.962:
	.asciz	"fluke"

	.section	.rodata._.str.963,"a",@progbits
	.balign	1
	.local	_.str.963
_.str.963:
	.asciz	"flush"

	.section	.rodata._.str.964,"a",@progbits
	.balign	1
	.local	_.str.964
_.str.964:
	.asciz	"focus"

	.section	.rodata._.str.965,"a",@progbits
	.balign	1
	.local	_.str.965
_.str.965:
	.asciz	"focuses"

	.section	.rodata._.str.966,"a",@progbits
	.balign	1
	.local	_.str.966
_.str.966:
	.asciz	"follow"

	.section	.rodata._.str.967,"a",@progbits
	.balign	1
	.local	_.str.967
_.str.967:
	.asciz	"following"

	.section	.rodata._.str.968,"a",@progbits
	.balign	1
	.local	_.str.968
_.str.968:
	.asciz	"follows"

	.section	.rodata._.str.969,"a",@progbits
	.balign	1
	.local	_.str.969
_.str.969:
	.asciz	"forecasting"

	.section	.rodata._.str.970,"a",@progbits
	.balign	1
	.local	_.str.970
_.str.970:
	.asciz	"forest"

	.section	.rodata._.str.971,"a",@progbits
	.balign	1
	.local	_.str.971
_.str.971:
	.asciz	"forget"

	.section	.rodata._.str.972,"a",@progbits
	.balign	1
	.local	_.str.972
_.str.972:
	.asciz	"forgetting"

	.section	.rodata._.str.973,"a",@progbits
	.balign	1
	.local	_.str.973
_.str.973:
	.asciz	"form"

	.section	.rodata._.str.974,"a",@progbits
	.balign	1
	.local	_.str.974
_.str.974:
	.asciz	"formal"

	.section	.rodata._.str.975,"a",@progbits
	.balign	1
	.local	_.str.975
_.str.975:
	.asciz	"formula"

	.section	.rodata._.str.976,"a",@progbits
	.balign	1
	.local	_.str.976
_.str.976:
	.asciz	"formulas"

	.section	.rodata._.str.977,"a",@progbits
	.balign	1
	.local	_.str.977
_.str.977:
	.asciz	"found"

	.section	.rodata._.str.978,"a",@progbits
	.balign	1
	.local	_.str.978
_.str.978:
	.asciz	"foundation"

	.section	.rodata._.str.979,"a",@progbits
	.balign	1
	.local	_.str.979
_.str.979:
	.asciz	"foundational"

	.section	.rodata._.str.980,"a",@progbits
	.balign	1
	.local	_.str.980
_.str.980:
	.asciz	"founded"

	.section	.rodata._.str.981,"a",@progbits
	.balign	1
	.local	_.str.981
_.str.981:
	.asciz	"founder"

	.section	.rodata._.str.982,"a",@progbits
	.balign	1
	.local	_.str.982
_.str.982:
	.asciz	"frac"

	.section	.rodata._.str.983,"a",@progbits
	.balign	1
	.local	_.str.983
_.str.983:
	.asciz	"fraction"

	.section	.rodata._.str.984,"a",@progbits
	.balign	1
	.local	_.str.984
_.str.984:
	.asciz	"fractional"

	.section	.rodata._.str.985,"a",@progbits
	.balign	1
	.local	_.str.985
_.str.985:
	.asciz	"frame"

	.section	.rodata._.str.986,"a",@progbits
	.balign	1
	.local	_.str.986
_.str.986:
	.asciz	"framework"

	.section	.rodata._.str.987,"a",@progbits
	.balign	1
	.local	_.str.987
_.str.987:
	.asciz	"francis"

	.section	.rodata._.str.988,"a",@progbits
	.balign	1
	.local	_.str.988
_.str.988:
	.asciz	"free"

	.section	.rodata._.str.989,"a",@progbits
	.balign	1
	.local	_.str.989
_.str.989:
	.asciz	"freedom"

	.section	.rodata._.str.990,"a",@progbits
	.balign	1
	.local	_.str.990
_.str.990:
	.asciz	"freqlist"

	.section	.rodata._.str.991,"a",@progbits
	.balign	1
	.local	_.str.991
_.str.991:
	.asciz	"frequencies"

	.section	.rodata._.str.992,"a",@progbits
	.balign	1
	.local	_.str.992
_.str.992:
	.asciz	"frequency"

	.section	.rodata._.str.993,"a",@progbits
	.balign	1
	.local	_.str.993
_.str.993:
	.asciz	"frequently"

	.section	.rodata._.str.994,"a",@progbits
	.balign	1
	.local	_.str.994
_.str.994:
	.asciz	"friedrich"

	.section	.rodata._.str.995,"a",@progbits
	.balign	1
	.local	_.str.995
_.str.995:
	.asciz	"from"

	.section	.rodata._.str.996,"a",@progbits
	.balign	1
	.local	_.str.996
_.str.996:
	.asciz	"front"

	.section	.rodata._.str.997,"a",@progbits
	.balign	1
	.local	_.str.997
_.str.997:
	.asciz	"frqs"

	.section	.rodata._.str.998,"a",@progbits
	.balign	1
	.local	_.str.998
_.str.998:
	.asciz	"full"

	.section	.rodata._.str.999,"a",@progbits
	.balign	1
	.local	_.str.999
_.str.999:
	.asciz	"function"

	.section	.rodata._.str.1000,"a",@progbits
	.balign	1
	.local	_.str.1000
_.str.1000:
	.asciz	"functions"

	.section	.rodata._.str.1001,"a",@progbits
	.balign	1
	.local	_.str.1001
_.str.1001:
	.asciz	"fundamental"

	.section	.rodata._.str.1002,"a",@progbits
	.balign	1
	.local	_.str.1002
_.str.1002:
	.asciz	"fundamentally"

	.section	.rodata._.str.1003,"a",@progbits
	.balign	1
	.local	_.str.1003
_.str.1003:
	.asciz	"further"

	.section	.rodata._.str.1004,"a",@progbits
	.balign	1
	.local	_.str.1004
_.str.1004:
	.asciz	"future"

	.section	.rodata._.str.1005,"a",@progbits
	.balign	1
	.local	_.str.1005
_.str.1005:
	.asciz	"galton"

	.section	.rodata._.str.1006,"a",@progbits
	.balign	1
	.local	_.str.1006
_.str.1006:
	.asciz	"gambler"

	.section	.rodata._.str.1007,"a",@progbits
	.balign	1
	.local	_.str.1007
_.str.1007:
	.asciz	"game"

	.section	.rodata._.str.1008,"a",@progbits
	.balign	1
	.local	_.str.1008
_.str.1008:
	.asciz	"gamma"

	.section	.rodata._.str.1009,"a",@progbits
	.balign	1
	.local	_.str.1009
_.str.1009:
	.asciz	"gapminder"

	.section	.rodata._.str.1010,"a",@progbits
	.balign	1
	.local	_.str.1010
_.str.1010:
	.asciz	"gates"

	.section	.rodata._.str.1011,"a",@progbits
	.balign	1
	.local	_.str.1011
_.str.1011:
	.asciz	"gauss"

	.section	.rodata._.str.1012,"a",@progbits
	.balign	1
	.local	_.str.1012
_.str.1012:
	.asciz	"gaussian"

	.section	.rodata._.str.1013,"a",@progbits
	.balign	1
	.local	_.str.1013
_.str.1013:
	.asciz	"gausssian"

	.section	.rodata._.str.1014,"a",@progbits
	.balign	1
	.local	_.str.1014
_.str.1014:
	.asciz	"gave"

	.section	.rodata._.str.1015,"a",@progbits
	.balign	1
	.local	_.str.1015
_.str.1015:
	.asciz	"gender"

	.section	.rodata._.str.1016,"a",@progbits
	.balign	1
	.local	_.str.1016
_.str.1016:
	.asciz	"general"

	.section	.rodata._.str.1017,"a",@progbits
	.balign	1
	.local	_.str.1017
_.str.1017:
	.asciz	"generalization"

	.section	.rodata._.str.1018,"a",@progbits
	.balign	1
	.local	_.str.1018
_.str.1018:
	.asciz	"generalize"

	.section	.rodata._.str.1019,"a",@progbits
	.balign	1
	.local	_.str.1019
_.str.1019:
	.asciz	"generalized"

	.section	.rodata._.str.1020,"a",@progbits
	.balign	1
	.local	_.str.1020
_.str.1020:
	.asciz	"generalizing"

	.section	.rodata._.str.1021,"a",@progbits
	.balign	1
	.local	_.str.1021
_.str.1021:
	.asciz	"generates"

	.section	.rodata._.str.1022,"a",@progbits
	.balign	1
	.local	_.str.1022
_.str.1022:
	.asciz	"generating"

	.section	.rodata._.str.1023,"a",@progbits
	.balign	1
	.local	_.str.1023
_.str.1023:
	.asciz	"generation"

	.section	.rodata._.str.1024,"a",@progbits
	.balign	1
	.local	_.str.1024
_.str.1024:
	.asciz	"generator"

	.section	.rodata._.str.1025,"a",@progbits
	.balign	1
	.local	_.str.1025
_.str.1025:
	.asciz	"genomic"

	.section	.rodata._.str.1026,"a",@progbits
	.balign	1
	.local	_.str.1026
_.str.1026:
	.asciz	"geometpdf"

	.section	.rodata._.str.1027,"a",@progbits
	.balign	1
	.local	_.str.1027
_.str.1027:
	.asciz	"geometric"

	.section	.rodata._.str.1028,"a",@progbits
	.balign	1
	.local	_.str.1028
_.str.1028:
	.asciz	"gertrude"

	.section	.rodata._.str.1029,"a",@progbits
	.balign	1
	.local	_.str.1029
_.str.1029:
	.asciz	"gets"

	.section	.rodata._.str.1030,"a",@progbits
	.balign	1
	.local	_.str.1030
_.str.1030:
	.asciz	"getting"

	.section	.rodata._.str.1031,"a",@progbits
	.balign	1
	.local	_.str.1031
_.str.1031:
	.asciz	"ghost"

	.section	.rodata._.str.1032,"a",@progbits
	.balign	1
	.local	_.str.1032
_.str.1032:
	.asciz	"gibbs"

	.section	.rodata._.str.1033,"a",@progbits
	.balign	1
	.local	_.str.1033
_.str.1033:
	.asciz	"gilovich"

	.section	.rodata._.str.1034,"a",@progbits
	.balign	1
	.local	_.str.1034
_.str.1034:
	.asciz	"gini"

	.section	.rodata._.str.1035,"a",@progbits
	.balign	1
	.local	_.str.1035
_.str.1035:
	.asciz	"give"

	.section	.rodata._.str.1036,"a",@progbits
	.balign	1
	.local	_.str.1036
_.str.1036:
	.asciz	"given"

	.section	.rodata._.str.1037,"a",@progbits
	.balign	1
	.local	_.str.1037
_.str.1037:
	.asciz	"gives"

	.section	.rodata._.str.1038,"a",@progbits
	.balign	1
	.local	_.str.1038
_.str.1038:
	.asciz	"giving"

	.section	.rodata._.str.1039,"a",@progbits
	.balign	1
	.local	_.str.1039
_.str.1039:
	.asciz	"glossary"

	.section	.rodata._.str.1040,"a",@progbits
	.balign	1
	.local	_.str.1040
_.str.1040:
	.asciz	"goal"

	.section	.rodata._.str.1041,"a",@progbits
	.balign	1
	.local	_.str.1041
_.str.1041:
	.asciz	"goat"

	.section	.rodata._.str.1042,"a",@progbits
	.balign	1
	.local	_.str.1042
_.str.1042:
	.asciz	"goats"

	.section	.rodata._.str.1043,"a",@progbits
	.balign	1
	.local	_.str.1043
_.str.1043:
	.asciz	"gold"

	.section	.rodata._.str.1044,"a",@progbits
	.balign	1
	.local	_.str.1044
_.str.1044:
	.asciz	"golden"

	.section	.rodata._.str.1045,"a",@progbits
	.balign	1
	.local	_.str.1045
_.str.1045:
	.asciz	"good"

	.section	.rodata._.str.1046,"a",@progbits
	.balign	1
	.local	_.str.1046
_.str.1046:
	.asciz	"goodness"

	.section	.rodata._.str.1047,"a",@progbits
	.balign	1
	.local	_.str.1047
_.str.1047:
	.asciz	"gosset"

	.section	.rodata._.str.1048,"a",@progbits
	.balign	1
	.local	_.str.1048
_.str.1048:
	.asciz	"governor"

	.section	.rodata._.str.1049,"a",@progbits
	.balign	1
	.local	_.str.1049
_.str.1049:
	.asciz	"graders"

	.section	.rodata._.str.1050,"a",@progbits
	.balign	1
	.local	_.str.1050
_.str.1050:
	.asciz	"grading"

	.section	.rodata._.str.1051,"a",@progbits
	.balign	1
	.local	_.str.1051
_.str.1051:
	.asciz	"graduate"

	.section	.rodata._.str.1052,"a",@progbits
	.balign	1
	.local	_.str.1052
_.str.1052:
	.asciz	"graduation"

	.section	.rodata._.str.1053,"a",@progbits
	.balign	1
	.local	_.str.1053
_.str.1053:
	.asciz	"grammar"

	.section	.rodata._.str.1054,"a",@progbits
	.balign	1
	.local	_.str.1054
_.str.1054:
	.asciz	"grand"

	.section	.rodata._.str.1055,"a",@progbits
	.balign	1
	.local	_.str.1055
_.str.1055:
	.asciz	"graph"

	.section	.rodata._.str.1056,"a",@progbits
	.balign	1
	.local	_.str.1056
_.str.1056:
	.asciz	"graphics"

	.section	.rodata._.str.1057,"a",@progbits
	.balign	1
	.local	_.str.1057
_.str.1057:
	.asciz	"graphing"

	.section	.rodata._.str.1058,"a",@progbits
	.balign	1
	.local	_.str.1058
_.str.1058:
	.asciz	"great"

	.section	.rodata._.str.1059,"a",@progbits
	.balign	1
	.local	_.str.1059
_.str.1059:
	.asciz	"greater"

	.section	.rodata._.str.1060,"a",@progbits
	.balign	1
	.local	_.str.1060
_.str.1060:
	.asciz	"grounded"

	.section	.rodata._.str.1061,"a",@progbits
	.balign	1
	.local	_.str.1061
_.str.1061:
	.asciz	"group"

	.section	.rodata._.str.1062,"a",@progbits
	.balign	1
	.local	_.str.1062
_.str.1062:
	.asciz	"grouped"

	.section	.rodata._.str.1063,"a",@progbits
	.balign	1
	.local	_.str.1063
_.str.1063:
	.asciz	"grouping"

	.section	.rodata._.str.1064,"a",@progbits
	.balign	1
	.local	_.str.1064
_.str.1064:
	.asciz	"groups"

	.section	.rodata._.str.1065,"a",@progbits
	.balign	1
	.local	_.str.1065
_.str.1065:
	.asciz	"growth"

	.section	.rodata._.str.1066,"a",@progbits
	.balign	1
	.local	_.str.1066
_.str.1066:
	.asciz	"guide"

	.section	.rodata._.str.1067,"a",@progbits
	.balign	1
	.local	_.str.1067
_.str.1067:
	.asciz	"guilt"

	.section	.rodata._.str.1068,"a",@progbits
	.balign	1
	.local	_.str.1068
_.str.1068:
	.asciz	"guilty"

	.section	.rodata._.str.1069,"a",@progbits
	.balign	1
	.local	_.str.1069
_.str.1069:
	.asciz	"guinness"

	.section	.rodata._.str.1070,"a",@progbits
	.balign	1
	.local	_.str.1070
_.str.1070:
	.asciz	"ha"

	.section	.rodata._.str.1071,"a",@progbits
	.balign	1
	.local	_.str.1071
_.str.1071:
	.asciz	"habits"

	.section	.rodata._.str.1072,"a",@progbits
	.balign	1
	.local	_.str.1072
_.str.1072:
	.asciz	"hack"

	.section	.rodata._.str.1073,"a",@progbits
	.balign	1
	.local	_.str.1073
_.str.1073:
	.asciz	"hacking"

	.section	.rodata._.str.1074,"a",@progbits
	.balign	1
	.local	_.str.1074
_.str.1074:
	.asciz	"hadley"

	.section	.rodata._.str.1075,"a",@progbits
	.balign	1
	.local	_.str.1075
_.str.1075:
	.asciz	"half"

	.section	.rodata._.str.1076,"a",@progbits
	.balign	1
	.local	_.str.1076
_.str.1076:
	.asciz	"hall"

	.section	.rodata._.str.1077,"a",@progbits
	.balign	1
	.local	_.str.1077
_.str.1077:
	.asciz	"hand"

	.section	.rodata._.str.1078,"a",@progbits
	.balign	1
	.local	_.str.1078
_.str.1078:
	.asciz	"handle"

	.section	.rodata._.str.1079,"a",@progbits
	.balign	1
	.local	_.str.1079
_.str.1079:
	.asciz	"handled"

	.section	.rodata._.str.1080,"a",@progbits
	.balign	1
	.local	_.str.1080
_.str.1080:
	.asciz	"handles"

	.section	.rodata._.str.1081,"a",@progbits
	.balign	1
	.local	_.str.1081
_.str.1081:
	.asciz	"hans"

	.section	.rodata._.str.1082,"a",@progbits
	.balign	1
	.local	_.str.1082
_.str.1082:
	.asciz	"happen"

	.section	.rodata._.str.1083,"a",@progbits
	.balign	1
	.local	_.str.1083
_.str.1083:
	.asciz	"happened"

	.section	.rodata._.str.1084,"a",@progbits
	.balign	1
	.local	_.str.1084
_.str.1084:
	.asciz	"happening"

	.section	.rodata._.str.1085,"a",@progbits
	.balign	1
	.local	_.str.1085
_.str.1085:
	.asciz	"happens"

	.section	.rodata._.str.1086,"a",@progbits
	.balign	1
	.local	_.str.1086
_.str.1086:
	.asciz	"hard"

	.section	.rodata._.str.1087,"a",@progbits
	.balign	1
	.local	_.str.1087
_.str.1087:
	.asciz	"harder"

	.section	.rodata._.str.1088,"a",@progbits
	.balign	1
	.local	_.str.1088
_.str.1088:
	.asciz	"hardware"

	.section	.rodata._.str.1089,"a",@progbits
	.balign	1
	.local	_.str.1089
_.str.1089:
	.asciz	"harry"

	.section	.rodata._.str.1090,"a",@progbits
	.balign	1
	.local	_.str.1090
_.str.1090:
	.asciz	"hat1"

	.section	.rodata._.str.1091,"a",@progbits
	.balign	1
	.local	_.str.1091
_.str.1091:
	.asciz	"hat2"

	.section	.rodata._.str.1092,"a",@progbits
	.balign	1
	.local	_.str.1092
_.str.1092:
	.asciz	"hats"

	.section	.rodata._.str.1093,"a",@progbits
	.balign	1
	.local	_.str.1093
_.str.1093:
	.asciz	"have"

	.section	.rodata._.str.1094,"a",@progbits
	.balign	1
	.local	_.str.1094
_.str.1094:
	.asciz	"haven"

	.section	.rodata._.str.1095,"a",@progbits
	.balign	1
	.local	_.str.1095
_.str.1095:
	.asciz	"hazards"

	.section	.rodata._.str.1096,"a",@progbits
	.balign	1
	.local	_.str.1096
_.str.1096:
	.asciz	"head"

	.section	.rodata._.str.1097,"a",@progbits
	.balign	1
	.local	_.str.1097
_.str.1097:
	.asciz	"headline"

	.section	.rodata._.str.1098,"a",@progbits
	.balign	1
	.local	_.str.1098
_.str.1098:
	.asciz	"heads"

	.section	.rodata._.str.1099,"a",@progbits
	.balign	1
	.local	_.str.1099
_.str.1099:
	.asciz	"health"

	.section	.rodata._.str.1100,"a",@progbits
	.balign	1
	.local	_.str.1100
_.str.1100:
	.asciz	"heart"

	.section	.rodata._.str.1101,"a",@progbits
	.balign	1
	.local	_.str.1101
_.str.1101:
	.asciz	"heck"

	.section	.rodata._.str.1102,"a",@progbits
	.balign	1
	.local	_.str.1102
_.str.1102:
	.asciz	"height"

	.section	.rodata._.str.1103,"a",@progbits
	.balign	1
	.local	_.str.1103
_.str.1103:
	.asciz	"heights"

	.section	.rodata._.str.1104,"a",@progbits
	.balign	1
	.local	_.str.1104
_.str.1104:
	.asciz	"help"

	.section	.rodata._.str.1105,"a",@progbits
	.balign	1
	.local	_.str.1105
_.str.1105:
	.asciz	"helps"

	.section	.rodata._.str.1106,"a",@progbits
	.balign	1
	.local	_.str.1106
_.str.1106:
	.asciz	"here"

	.section	.rodata._.str.1107,"a",@progbits
	.balign	1
	.local	_.str.1107
_.str.1107:
	.asciz	"hessian"

	.section	.rodata._.str.1108,"a",@progbits
	.balign	1
	.local	_.str.1108
_.str.1108:
	.asciz	"heterogeneity"

	.section	.rodata._.str.1109,"a",@progbits
	.balign	1
	.local	_.str.1109
_.str.1109:
	.asciz	"heterogeneous"

	.section	.rodata._.str.1110,"a",@progbits
	.balign	1
	.local	_.str.1110
_.str.1110:
	.asciz	"heteroscedasticity"

	.section	.rodata._.str.1111,"a",@progbits
	.balign	1
	.local	_.str.1111
_.str.1111:
	.asciz	"hide"

	.section	.rodata._.str.1112,"a",@progbits
	.balign	1
	.local	_.str.1112
_.str.1112:
	.asciz	"high"

	.section	.rodata._.str.1113,"a",@progbits
	.balign	1
	.local	_.str.1113
_.str.1113:
	.asciz	"higher"

	.section	.rodata._.str.1114,"a",@progbits
	.balign	1
	.local	_.str.1114
_.str.1114:
	.asciz	"highest"

	.section	.rodata._.str.1115,"a",@progbits
	.balign	1
	.local	_.str.1115
_.str.1115:
	.asciz	"highlighted"

	.section	.rodata._.str.1116,"a",@progbits
	.balign	1
	.local	_.str.1116
_.str.1116:
	.asciz	"highlights"

	.section	.rodata._.str.1117,"a",@progbits
	.balign	1
	.local	_.str.1117
_.str.1117:
	.asciz	"highly"

	.section	.rodata._.str.1118,"a",@progbits
	.balign	1
	.local	_.str.1118
_.str.1118:
	.asciz	"histogram"

	.section	.rodata._.str.1119,"a",@progbits
	.balign	1
	.local	_.str.1119
_.str.1119:
	.asciz	"histograms"

	.section	.rodata._.str.1120,"a",@progbits
	.balign	1
	.local	_.str.1120
_.str.1120:
	.asciz	"historic"

	.section	.rodata._.str.1121,"a",@progbits
	.balign	1
	.local	_.str.1121
_.str.1121:
	.asciz	"historical"

	.section	.rodata._.str.1122,"a",@progbits
	.balign	1
	.local	_.str.1122
_.str.1122:
	.asciz	"history"

	.section	.rodata._.str.1123,"a",@progbits
	.balign	1
	.local	_.str.1123
_.str.1123:
	.asciz	"hitting"

	.section	.rodata._.str.1124,"a",@progbits
	.balign	1
	.local	_.str.1124
_.str.1124:
	.asciz	"holes"

	.section	.rodata._.str.1125,"a",@progbits
	.balign	1
	.local	_.str.1125
_.str.1125:
	.asciz	"holistic"

	.section	.rodata._.str.1126,"a",@progbits
	.balign	1
	.local	_.str.1126
_.str.1126:
	.asciz	"holistically"

	.section	.rodata._.str.1127,"a",@progbits
	.balign	1
	.local	_.str.1127
_.str.1127:
	.asciz	"homme"

	.section	.rodata._.str.1128,"a",@progbits
	.balign	1
	.local	_.str.1128
_.str.1128:
	.asciz	"homogeneity"

	.section	.rodata._.str.1129,"a",@progbits
	.balign	1
	.local	_.str.1129
_.str.1129:
	.asciz	"homoscedasticity"

	.section	.rodata._.str.1130,"a",@progbits
	.balign	1
	.local	_.str.1130
_.str.1130:
	.asciz	"hospitals"

	.section	.rodata._.str.1131,"a",@progbits
	.balign	1
	.local	_.str.1131
_.str.1131:
	.asciz	"host"

	.section	.rodata._.str.1132,"a",@progbits
	.balign	1
	.local	_.str.1132
_.str.1132:
	.asciz	"hours"

	.section	.rodata._.str.1133,"a",@progbits
	.balign	1
	.local	_.str.1133
_.str.1133:
	.asciz	"house"

	.section	.rodata._.str.1134,"a",@progbits
	.balign	1
	.local	_.str.1134
_.str.1134:
	.asciz	"housing"

	.section	.rodata._.str.1135,"a",@progbits
	.balign	1
	.local	_.str.1135
_.str.1135:
	.asciz	"however"

	.section	.rodata._.str.1136,"a",@progbits
	.balign	1
	.local	_.str.1136
_.str.1136:
	.asciz	"humans"

	.section	.rodata._.str.1137,"a",@progbits
	.balign	1
	.local	_.str.1137
_.str.1137:
	.asciz	"hypergeometric"

	.section	.rodata._.str.1138,"a",@progbits
	.balign	1
	.local	_.str.1138
_.str.1138:
	.asciz	"hypotheses"

	.section	.rodata._.str.1139,"a",@progbits
	.balign	1
	.local	_.str.1139
_.str.1139:
	.asciz	"hypothesis"

	.section	.rodata._.str.1140,"a",@progbits
	.balign	1
	.local	_.str.1140
_.str.1140:
	.asciz	"hypothesized"

	.section	.rodata._.str.1141,"a",@progbits
	.balign	1
	.local	_.str.1141
_.str.1141:
	.asciz	"idea"

	.section	.rodata._.str.1142,"a",@progbits
	.balign	1
	.local	_.str.1142
_.str.1142:
	.asciz	"ideas"

	.section	.rodata._.str.1143,"a",@progbits
	.balign	1
	.local	_.str.1143
_.str.1143:
	.asciz	"identical"

	.section	.rodata._.str.1144,"a",@progbits
	.balign	1
	.local	_.str.1144
_.str.1144:
	.asciz	"identically"

	.section	.rodata._.str.1145,"a",@progbits
	.balign	1
	.local	_.str.1145
_.str.1145:
	.asciz	"identify"

	.section	.rodata._.str.1146,"a",@progbits
	.balign	1
	.local	_.str.1146
_.str.1146:
	.asciz	"identifying"

	.section	.rodata._.str.1147,"a",@progbits
	.balign	1
	.local	_.str.1147
_.str.1147:
	.asciz	"ignoring"

	.section	.rodata._.str.1148,"a",@progbits
	.balign	1
	.local	_.str.1148
_.str.1148:
	.asciz	"illness"

	.section	.rodata._.str.1149,"a",@progbits
	.balign	1
	.local	_.str.1149
_.str.1149:
	.asciz	"illustrated"

	.section	.rodata._.str.1150,"a",@progbits
	.balign	1
	.local	_.str.1150
_.str.1150:
	.asciz	"illustration"

	.section	.rodata._.str.1151,"a",@progbits
	.balign	1
	.local	_.str.1151
_.str.1151:
	.asciz	"implication"

	.section	.rodata._.str.1152,"a",@progbits
	.balign	1
	.local	_.str.1152
_.str.1152:
	.asciz	"implies"

	.section	.rodata._.str.1153,"a",@progbits
	.balign	1
	.local	_.str.1153
_.str.1153:
	.asciz	"imply"

	.section	.rodata._.str.1154,"a",@progbits
	.balign	1
	.local	_.str.1154
_.str.1154:
	.asciz	"importance"

	.section	.rodata._.str.1155,"a",@progbits
	.balign	1
	.local	_.str.1155
_.str.1155:
	.asciz	"important"

	.section	.rodata._.str.1156,"a",@progbits
	.balign	1
	.local	_.str.1156
_.str.1156:
	.asciz	"impose"

	.section	.rodata._.str.1157,"a",@progbits
	.balign	1
	.local	_.str.1157
_.str.1157:
	.asciz	"imposed"

	.section	.rodata._.str.1158,"a",@progbits
	.balign	1
	.local	_.str.1158
_.str.1158:
	.asciz	"impossible"

	.section	.rodata._.str.1159,"a",@progbits
	.balign	1
	.local	_.str.1159
_.str.1159:
	.asciz	"improve"

	.section	.rodata._.str.1160,"a",@progbits
	.balign	1
	.local	_.str.1160
_.str.1160:
	.asciz	"improved"

	.section	.rodata._.str.1161,"a",@progbits
	.balign	1
	.local	_.str.1161
_.str.1161:
	.asciz	"improvement"

	.section	.rodata._.str.1162,"a",@progbits
	.balign	1
	.local	_.str.1162
_.str.1162:
	.asciz	"improves"

	.section	.rodata._.str.1163,"a",@progbits
	.balign	1
	.local	_.str.1163
_.str.1163:
	.asciz	"inappropriate"

	.section	.rodata._.str.1164,"a",@progbits
	.balign	1
	.local	_.str.1164
_.str.1164:
	.asciz	"inches"

	.section	.rodata._.str.1165,"a",@progbits
	.balign	1
	.local	_.str.1165
_.str.1165:
	.asciz	"include"

	.section	.rodata._.str.1166,"a",@progbits
	.balign	1
	.local	_.str.1166
_.str.1166:
	.asciz	"included"

	.section	.rodata._.str.1167,"a",@progbits
	.balign	1
	.local	_.str.1167
_.str.1167:
	.asciz	"includes"

	.section	.rodata._.str.1168,"a",@progbits
	.balign	1
	.local	_.str.1168
_.str.1168:
	.asciz	"including"

	.section	.rodata._.str.1169,"a",@progbits
	.balign	1
	.local	_.str.1169
_.str.1169:
	.asciz	"inclusive"

	.section	.rodata._.str.1170,"a",@progbits
	.balign	1
	.local	_.str.1170
_.str.1170:
	.asciz	"income"

	.section	.rodata._.str.1171,"a",@progbits
	.balign	1
	.local	_.str.1171
_.str.1171:
	.asciz	"incorrect"

	.section	.rodata._.str.1172,"a",@progbits
	.balign	1
	.local	_.str.1172
_.str.1172:
	.asciz	"incorrectly"

	.section	.rodata._.str.1173,"a",@progbits
	.balign	1
	.local	_.str.1173
_.str.1173:
	.asciz	"increase"

	.section	.rodata._.str.1174,"a",@progbits
	.balign	1
	.local	_.str.1174
_.str.1174:
	.asciz	"increased"

	.section	.rodata._.str.1175,"a",@progbits
	.balign	1
	.local	_.str.1175
_.str.1175:
	.asciz	"increases"

	.section	.rodata._.str.1176,"a",@progbits
	.balign	1
	.local	_.str.1176
_.str.1176:
	.asciz	"increasing"

	.section	.rodata._.str.1177,"a",@progbits
	.balign	1
	.local	_.str.1177
_.str.1177:
	.asciz	"incredibly"

	.section	.rodata._.str.1178,"a",@progbits
	.balign	1
	.local	_.str.1178
_.str.1178:
	.asciz	"independence"

	.section	.rodata._.str.1179,"a",@progbits
	.balign	1
	.local	_.str.1179
_.str.1179:
	.asciz	"independent"

	.section	.rodata._.str.1180,"a",@progbits
	.balign	1
	.local	_.str.1180
_.str.1180:
	.asciz	"index"

	.section	.rodata._.str.1181,"a",@progbits
	.balign	1
	.local	_.str.1181
_.str.1181:
	.asciz	"indicate"

	.section	.rodata._.str.1182,"a",@progbits
	.balign	1
	.local	_.str.1182
_.str.1182:
	.asciz	"indicates"

	.section	.rodata._.str.1183,"a",@progbits
	.balign	1
	.local	_.str.1183
_.str.1183:
	.asciz	"indices"

	.section	.rodata._.str.1184,"a",@progbits
	.balign	1
	.local	_.str.1184
_.str.1184:
	.asciz	"individual"

	.section	.rodata._.str.1185,"a",@progbits
	.balign	1
	.local	_.str.1185
_.str.1185:
	.asciz	"individually"

	.section	.rodata._.str.1186,"a",@progbits
	.balign	1
	.local	_.str.1186
_.str.1186:
	.asciz	"individuals"

	.section	.rodata._.str.1187,"a",@progbits
	.balign	1
	.local	_.str.1187
_.str.1187:
	.asciz	"induction"

	.section	.rodata._.str.1188,"a",@progbits
	.balign	1
	.local	_.str.1188
_.str.1188:
	.asciz	"industrial"

	.section	.rodata._.str.1189,"a",@progbits
	.balign	1
	.local	_.str.1189
_.str.1189:
	.asciz	"industry"

	.section	.rodata._.str.1190,"a",@progbits
	.balign	1
	.local	_.str.1190
_.str.1190:
	.asciz	"inequality"

	.section	.rodata._.str.1191,"a",@progbits
	.balign	1
	.local	_.str.1191
_.str.1191:
	.asciz	"inference"

	.section	.rodata._.str.1192,"a",@progbits
	.balign	1
	.local	_.str.1192
_.str.1192:
	.asciz	"inferior"

	.section	.rodata._.str.1193,"a",@progbits
	.balign	1
	.local	_.str.1193
_.str.1193:
	.asciz	"inferred"

	.section	.rodata._.str.1194,"a",@progbits
	.balign	1
	.local	_.str.1194
_.str.1194:
	.asciz	"infinite"

	.section	.rodata._.str.1195,"a",@progbits
	.balign	1
	.local	_.str.1195
_.str.1195:
	.asciz	"infinity"

	.section	.rodata._.str.1196,"a",@progbits
	.balign	1
	.local	_.str.1196
_.str.1196:
	.asciz	"inflation"

	.section	.rodata._.str.1197,"a",@progbits
	.balign	1
	.local	_.str.1197
_.str.1197:
	.asciz	"influence"

	.section	.rodata._.str.1198,"a",@progbits
	.balign	1
	.local	_.str.1198
_.str.1198:
	.asciz	"influenced"

	.section	.rodata._.str.1199,"a",@progbits
	.balign	1
	.local	_.str.1199
_.str.1199:
	.asciz	"influences"

	.section	.rodata._.str.1200,"a",@progbits
	.balign	1
	.local	_.str.1200
_.str.1200:
	.asciz	"influential"

	.section	.rodata._.str.1201,"a",@progbits
	.balign	1
	.local	_.str.1201
_.str.1201:
	.asciz	"information"

	.section	.rodata._.str.1202,"a",@progbits
	.balign	1
	.local	_.str.1202
_.str.1202:
	.asciz	"informative"

	.section	.rodata._.str.1203,"a",@progbits
	.balign	1
	.local	_.str.1203
_.str.1203:
	.asciz	"inherent"

	.section	.rodata._.str.1204,"a",@progbits
	.balign	1
	.local	_.str.1204
_.str.1204:
	.asciz	"initial"

	.section	.rodata._.str.1205,"a",@progbits
	.balign	1
	.local	_.str.1205
_.str.1205:
	.asciz	"initially"

	.section	.rodata._.str.1206,"a",@progbits
	.balign	1
	.local	_.str.1206
_.str.1206:
	.asciz	"innocent"

	.section	.rodata._.str.1207,"a",@progbits
	.balign	1
	.local	_.str.1207
_.str.1207:
	.asciz	"inside"

	.section	.rodata._.str.1208,"a",@progbits
	.balign	1
	.local	_.str.1208
_.str.1208:
	.asciz	"instead"

	.section	.rodata._.str.1209,"a",@progbits
	.balign	1
	.local	_.str.1209
_.str.1209:
	.asciz	"instructed"

	.section	.rodata._.str.1210,"a",@progbits
	.balign	1
	.local	_.str.1210
_.str.1210:
	.asciz	"instructions"

	.section	.rodata._.str.1211,"a",@progbits
	.balign	1
	.local	_.str.1211
_.str.1211:
	.asciz	"insufficient"

	.section	.rodata._.str.1212,"a",@progbits
	.balign	1
	.local	_.str.1212
_.str.1212:
	.asciz	"insurance"

	.section	.rodata._.str.1213,"a",@progbits
	.balign	1
	.local	_.str.1213
_.str.1213:
	.asciz	"integer"

	.section	.rodata._.str.1214,"a",@progbits
	.balign	1
	.local	_.str.1214
_.str.1214:
	.asciz	"integers"

	.section	.rodata._.str.1215,"a",@progbits
	.balign	1
	.local	_.str.1215
_.str.1215:
	.asciz	"integral"

	.section	.rodata._.str.1216,"a",@progbits
	.balign	1
	.local	_.str.1216
_.str.1216:
	.asciz	"integrated"

	.section	.rodata._.str.1217,"a",@progbits
	.balign	1
	.local	_.str.1217
_.str.1217:
	.asciz	"integration"

	.section	.rodata._.str.1218,"a",@progbits
	.balign	1
	.local	_.str.1218
_.str.1218:
	.asciz	"integrity"

	.section	.rodata._.str.1219,"a",@progbits
	.balign	1
	.local	_.str.1219
_.str.1219:
	.asciz	"intended"

	.section	.rodata._.str.1220,"a",@progbits
	.balign	1
	.local	_.str.1220
_.str.1220:
	.asciz	"intentionally"

	.section	.rodata._.str.1221,"a",@progbits
	.balign	1
	.local	_.str.1221
_.str.1221:
	.asciz	"intercept"

	.section	.rodata._.str.1222,"a",@progbits
	.balign	1
	.local	_.str.1222
_.str.1222:
	.asciz	"interchangeably"

	.section	.rodata._.str.1223,"a",@progbits
	.balign	1
	.local	_.str.1223
_.str.1223:
	.asciz	"interest"

	.section	.rodata._.str.1224,"a",@progbits
	.balign	1
	.local	_.str.1224
_.str.1224:
	.asciz	"interested"

	.section	.rodata._.str.1225,"a",@progbits
	.balign	1
	.local	_.str.1225
_.str.1225:
	.asciz	"intermediate"

	.section	.rodata._.str.1226,"a",@progbits
	.balign	1
	.local	_.str.1226
_.str.1226:
	.asciz	"internal"

	.section	.rodata._.str.1227,"a",@progbits
	.balign	1
	.local	_.str.1227
_.str.1227:
	.asciz	"interpret"

	.section	.rodata._.str.1228,"a",@progbits
	.balign	1
	.local	_.str.1228
_.str.1228:
	.asciz	"interpretation"

	.section	.rodata._.str.1229,"a",@progbits
	.balign	1
	.local	_.str.1229
_.str.1229:
	.asciz	"interpreting"

	.section	.rodata._.str.1230,"a",@progbits
	.balign	1
	.local	_.str.1230
_.str.1230:
	.asciz	"interquartile"

	.section	.rodata._.str.1231,"a",@progbits
	.balign	1
	.local	_.str.1231
_.str.1231:
	.asciz	"intersection"

	.section	.rodata._.str.1232,"a",@progbits
	.balign	1
	.local	_.str.1232
_.str.1232:
	.asciz	"interval"

	.section	.rodata._.str.1233,"a",@progbits
	.balign	1
	.local	_.str.1233
_.str.1233:
	.asciz	"intervals"

	.section	.rodata._.str.1234,"a",@progbits
	.balign	1
	.local	_.str.1234
_.str.1234:
	.asciz	"interviewer"

	.section	.rodata._.str.1235,"a",@progbits
	.balign	1
	.local	_.str.1235
_.str.1235:
	.asciz	"interviewers"

	.section	.rodata._.str.1236,"a",@progbits
	.balign	1
	.local	_.str.1236
_.str.1236:
	.asciz	"into"

	.section	.rodata._.str.1237,"a",@progbits
	.balign	1
	.local	_.str.1237
_.str.1237:
	.asciz	"introduces"

	.section	.rodata._.str.1238,"a",@progbits
	.balign	1
	.local	_.str.1238
_.str.1238:
	.asciz	"introducing"

	.section	.rodata._.str.1239,"a",@progbits
	.balign	1
	.local	_.str.1239
_.str.1239:
	.asciz	"intuition"

	.section	.rodata._.str.1240,"a",@progbits
	.balign	1
	.local	_.str.1240
_.str.1240:
	.asciz	"intuitive"

	.section	.rodata._.str.1241,"a",@progbits
	.balign	1
	.local	_.str.1241
_.str.1241:
	.asciz	"invalid"

	.section	.rodata._.str.1242,"a",@progbits
	.balign	1
	.local	_.str.1242
_.str.1242:
	.asciz	"invariance"

	.section	.rodata._.str.1243,"a",@progbits
	.balign	1
	.local	_.str.1243
_.str.1243:
	.asciz	"invariant"

	.section	.rodata._.str.1244,"a",@progbits
	.balign	1
	.local	_.str.1244
_.str.1244:
	.asciz	"invent"

	.section	.rodata._.str.1245,"a",@progbits
	.balign	1
	.local	_.str.1245
_.str.1245:
	.asciz	"invented"

	.section	.rodata._.str.1246,"a",@progbits
	.balign	1
	.local	_.str.1246
_.str.1246:
	.asciz	"inventor"

	.section	.rodata._.str.1247,"a",@progbits
	.balign	1
	.local	_.str.1247
_.str.1247:
	.asciz	"inverse"

	.section	.rodata._.str.1248,"a",@progbits
	.balign	1
	.local	_.str.1248
_.str.1248:
	.asciz	"investigative"

	.section	.rodata._.str.1249,"a",@progbits
	.balign	1
	.local	_.str.1249
_.str.1249:
	.asciz	"invnorm"

	.section	.rodata._.str.1250,"a",@progbits
	.balign	1
	.local	_.str.1250
_.str.1250:
	.asciz	"involve"

	.section	.rodata._.str.1251,"a",@progbits
	.balign	1
	.local	_.str.1251
_.str.1251:
	.asciz	"involved"

	.section	.rodata._.str.1252,"a",@progbits
	.balign	1
	.local	_.str.1252
_.str.1252:
	.asciz	"involves"

	.section	.rodata._.str.1253,"a",@progbits
	.balign	1
	.local	_.str.1253
_.str.1253:
	.asciz	"involving"

	.section	.rodata._.str.1254,"a",@progbits
	.balign	1
	.local	_.str.1254
_.str.1254:
	.asciz	"invt"

	.section	.rodata._.str.1255,"a",@progbits
	.balign	1
	.local	_.str.1255
_.str.1255:
	.asciz	"iqrs"

	.section	.rodata._.str.1256,"a",@progbits
	.balign	1
	.local	_.str.1256
_.str.1256:
	.asciz	"irrespective"

	.section	.rodata._.str.1257,"a",@progbits
	.balign	1
	.local	_.str.1257
_.str.1257:
	.asciz	"isolation"

	.section	.rodata._.str.1258,"a",@progbits
	.balign	1
	.local	_.str.1258
_.str.1258:
	.asciz	"isotropic"

	.section	.rodata._.str.1259,"a",@progbits
	.balign	1
	.local	_.str.1259
_.str.1259:
	.asciz	"iterated"

	.section	.rodata._.str.1260,"a",@progbits
	.balign	1
	.local	_.str.1260
_.str.1260:
	.asciz	"iteratively"

	.section	.rodata._.str.1261,"a",@progbits
	.balign	1
	.local	_.str.1261
_.str.1261:
	.asciz	"itself"

	.section	.rodata._.str.1262,"a",@progbits
	.balign	1
	.local	_.str.1262
_.str.1262:
	.asciz	"jail"

	.section	.rodata._.str.1263,"a",@progbits
	.balign	1
	.local	_.str.1263
_.str.1263:
	.asciz	"jakob"

	.section	.rodata._.str.1264,"a",@progbits
	.balign	1
	.local	_.str.1264
_.str.1264:
	.asciz	"january"

	.section	.rodata._.str.1265,"a",@progbits
	.balign	1
	.local	_.str.1265
_.str.1265:
	.asciz	"japan"

	.section	.rodata._.str.1266,"a",@progbits
	.balign	1
	.local	_.str.1266
_.str.1266:
	.asciz	"japanese"

	.section	.rodata._.str.1267,"a",@progbits
	.balign	1
	.local	_.str.1267
_.str.1267:
	.asciz	"jensen"

	.section	.rodata._.str.1268,"a",@progbits
	.balign	1
	.local	_.str.1268
_.str.1268:
	.asciz	"jerzy"

	.section	.rodata._.str.1269,"a",@progbits
	.balign	1
	.local	_.str.1269
_.str.1269:
	.asciz	"jinxes"

	.section	.rodata._.str.1270,"a",@progbits
	.balign	1
	.local	_.str.1270
_.str.1270:
	.asciz	"john"

	.section	.rodata._.str.1271,"a",@progbits
	.balign	1
	.local	_.str.1271
_.str.1271:
	.asciz	"join"

	.section	.rodata._.str.1272,"a",@progbits
	.balign	1
	.local	_.str.1272
_.str.1272:
	.asciz	"joint"

	.section	.rodata._.str.1273,"a",@progbits
	.balign	1
	.local	_.str.1273
_.str.1273:
	.asciz	"journal"

	.section	.rodata._.str.1274,"a",@progbits
	.balign	1
	.local	_.str.1274
_.str.1274:
	.asciz	"jump"

	.section	.rodata._.str.1275,"a",@progbits
	.balign	1
	.local	_.str.1275
_.str.1275:
	.asciz	"just"

	.section	.rodata._.str.1276,"a",@progbits
	.balign	1
	.local	_.str.1276
_.str.1276:
	.asciz	"justice"

	.section	.rodata._.str.1277,"a",@progbits
	.balign	1
	.local	_.str.1277
_.str.1277:
	.asciz	"justification"

	.section	.rodata._.str.1278,"a",@progbits
	.balign	1
	.local	_.str.1278
_.str.1278:
	.asciz	"justify"

	.section	.rodata._.str.1279,"a",@progbits
	.balign	1
	.local	_.str.1279
_.str.1279:
	.asciz	"karl"

	.section	.rodata._.str.1280,"a",@progbits
	.balign	1
	.local	_.str.1280
_.str.1280:
	.asciz	"keep"

	.section	.rodata._.str.1281,"a",@progbits
	.balign	1
	.local	_.str.1281
_.str.1281:
	.asciz	"kernel"

	.section	.rodata._.str.1282,"a",@progbits
	.balign	1
	.local	_.str.1282
_.str.1282:
	.asciz	"kidney"

	.section	.rodata._.str.1283,"a",@progbits
	.balign	1
	.local	_.str.1283
_.str.1283:
	.asciz	"know"

	.section	.rodata._.str.1284,"a",@progbits
	.balign	1
	.local	_.str.1284
_.str.1284:
	.asciz	"knowing"

	.section	.rodata._.str.1285,"a",@progbits
	.balign	1
	.local	_.str.1285
_.str.1285:
	.asciz	"knowledge"

	.section	.rodata._.str.1286,"a",@progbits
	.balign	1
	.local	_.str.1286
_.str.1286:
	.asciz	"known"

	.section	.rodata._.str.1287,"a",@progbits
	.balign	1
	.local	_.str.1287
_.str.1287:
	.asciz	"kolmogorov"

	.section	.rodata._.str.1288,"a",@progbits
	.balign	1
	.local	_.str.1288
_.str.1288:
	.asciz	"kurtosis"

	.section	.rodata._.str.1289,"a",@progbits
	.balign	1
	.local	_.str.1289
_.str.1289:
	.asciz	"label"

	.section	.rodata._.str.1290,"a",@progbits
	.balign	1
	.local	_.str.1290
_.str.1290:
	.asciz	"labels"

	.section	.rodata._.str.1291,"a",@progbits
	.balign	1
	.local	_.str.1291
_.str.1291:
	.asciz	"lack"

	.section	.rodata._.str.1292,"a",@progbits
	.balign	1
	.local	_.str.1292
_.str.1292:
	.asciz	"lady"

	.section	.rodata._.str.1293,"a",@progbits
	.balign	1
	.local	_.str.1293
_.str.1293:
	.asciz	"lagged"

	.section	.rodata._.str.1294,"a",@progbits
	.balign	1
	.local	_.str.1294
_.str.1294:
	.asciz	"lags"

	.section	.rodata._.str.1295,"a",@progbits
	.balign	1
	.local	_.str.1295
_.str.1295:
	.asciz	"land"

	.section	.rodata._.str.1296,"a",@progbits
	.balign	1
	.local	_.str.1296
_.str.1296:
	.asciz	"landon"

	.section	.rodata._.str.1297,"a",@progbits
	.balign	1
	.local	_.str.1297
_.str.1297:
	.asciz	"landslide"

	.section	.rodata._.str.1298,"a",@progbits
	.balign	1
	.local	_.str.1298
_.str.1298:
	.asciz	"language"

	.section	.rodata._.str.1299,"a",@progbits
	.balign	1
	.local	_.str.1299
_.str.1299:
	.asciz	"large"

	.section	.rodata._.str.1300,"a",@progbits
	.balign	1
	.local	_.str.1300
_.str.1300:
	.asciz	"largely"

	.section	.rodata._.str.1301,"a",@progbits
	.balign	1
	.local	_.str.1301
_.str.1301:
	.asciz	"larger"

	.section	.rodata._.str.1302,"a",@progbits
	.balign	1
	.local	_.str.1302
_.str.1302:
	.asciz	"largest"

	.section	.rodata._.str.1303,"a",@progbits
	.balign	1
	.local	_.str.1303
_.str.1303:
	.asciz	"last"

	.section	.rodata._.str.1304,"a",@progbits
	.balign	1
	.local	_.str.1304
_.str.1304:
	.asciz	"late"

	.section	.rodata._.str.1305,"a",@progbits
	.balign	1
	.local	_.str.1305
_.str.1305:
	.asciz	"latent"

	.section	.rodata._.str.1306,"a",@progbits
	.balign	1
	.local	_.str.1306
_.str.1306:
	.asciz	"later"

	.section	.rodata._.str.1307,"a",@progbits
	.balign	1
	.local	_.str.1307
_.str.1307:
	.asciz	"layperson"

	.section	.rodata._.str.1308,"a",@progbits
	.balign	1
	.local	_.str.1308
_.str.1308:
	.asciz	"lead"

	.section	.rodata._.str.1309,"a",@progbits
	.balign	1
	.local	_.str.1309
_.str.1309:
	.asciz	"leader"

	.section	.rodata._.str.1310,"a",@progbits
	.balign	1
	.local	_.str.1310
_.str.1310:
	.asciz	"leading"

	.section	.rodata._.str.1311,"a",@progbits
	.balign	1
	.local	_.str.1311
_.str.1311:
	.asciz	"leads"

	.section	.rodata._.str.1312,"a",@progbits
	.balign	1
	.local	_.str.1312
_.str.1312:
	.asciz	"learn"

	.section	.rodata._.str.1313,"a",@progbits
	.balign	1
	.local	_.str.1313
_.str.1313:
	.asciz	"learning"

	.section	.rodata._.str.1314,"a",@progbits
	.balign	1
	.local	_.str.1314
_.str.1314:
	.asciz	"least"

	.section	.rodata._.str.1315,"a",@progbits
	.balign	1
	.local	_.str.1315
_.str.1315:
	.asciz	"leave"

	.section	.rodata._.str.1316,"a",@progbits
	.balign	1
	.local	_.str.1316
_.str.1316:
	.asciz	"leaving"

	.section	.rodata._.str.1317,"a",@progbits
	.balign	1
	.local	_.str.1317
_.str.1317:
	.asciz	"left"

	.section	.rodata._.str.1318,"a",@progbits
	.balign	1
	.local	_.str.1318
_.str.1318:
	.asciz	"legal"

	.section	.rodata._.str.1319,"a",@progbits
	.balign	1
	.local	_.str.1319
_.str.1319:
	.asciz	"legend"

	.section	.rodata._.str.1320,"a",@progbits
	.balign	1
	.local	_.str.1320
_.str.1320:
	.asciz	"lemma"

	.section	.rodata._.str.1321,"a",@progbits
	.balign	1
	.local	_.str.1321
_.str.1321:
	.asciz	"length"

	.section	.rodata._.str.1322,"a",@progbits
	.balign	1
	.local	_.str.1322
_.str.1322:
	.asciz	"leonardo"

	.section	.rodata._.str.1323,"a",@progbits
	.balign	1
	.local	_.str.1323
_.str.1323:
	.asciz	"less"

	.section	.rodata._.str.1324,"a",@progbits
	.balign	1
	.local	_.str.1324
_.str.1324:
	.asciz	"lesson"

	.section	.rodata._.str.1325,"a",@progbits
	.balign	1
	.local	_.str.1325
_.str.1325:
	.asciz	"letter"

	.section	.rodata._.str.1326,"a",@progbits
	.balign	1
	.local	_.str.1326
_.str.1326:
	.asciz	"letters"

	.section	.rodata._.str.1327,"a",@progbits
	.balign	1
	.local	_.str.1327
_.str.1327:
	.asciz	"level"

	.section	.rodata._.str.1328,"a",@progbits
	.balign	1
	.local	_.str.1328
_.str.1328:
	.asciz	"levels"

	.section	.rodata._.str.1329,"a",@progbits
	.balign	1
	.local	_.str.1329
_.str.1329:
	.asciz	"levene"

	.section	.rodata._.str.1330,"a",@progbits
	.balign	1
	.local	_.str.1330
_.str.1330:
	.asciz	"leverage"

	.section	.rodata._.str.1331,"a",@progbits
	.balign	1
	.local	_.str.1331
_.str.1331:
	.asciz	"life"

	.section	.rodata._.str.1332,"a",@progbits
	.balign	1
	.local	_.str.1332
_.str.1332:
	.asciz	"like"

	.section	.rodata._.str.1333,"a",@progbits
	.balign	1
	.local	_.str.1333
_.str.1333:
	.asciz	"likelihood"

	.section	.rodata._.str.1334,"a",@progbits
	.balign	1
	.local	_.str.1334
_.str.1334:
	.asciz	"likelihoods"

	.section	.rodata._.str.1335,"a",@progbits
	.balign	1
	.local	_.str.1335
_.str.1335:
	.asciz	"likely"

	.section	.rodata._.str.1336,"a",@progbits
	.balign	1
	.local	_.str.1336
_.str.1336:
	.asciz	"limit"

	.section	.rodata._.str.1337,"a",@progbits
	.balign	1
	.local	_.str.1337
_.str.1337:
	.asciz	"limited"

	.section	.rodata._.str.1338,"a",@progbits
	.balign	1
	.local	_.str.1338
_.str.1338:
	.asciz	"line"

	.section	.rodata._.str.1339,"a",@progbits
	.balign	1
	.local	_.str.1339
_.str.1339:
	.asciz	"linear"

	.section	.rodata._.str.1340,"a",@progbits
	.balign	1
	.local	_.str.1340
_.str.1340:
	.asciz	"linearity"

	.section	.rodata._.str.1341,"a",@progbits
	.balign	1
	.local	_.str.1341
_.str.1341:
	.asciz	"liner"

	.section	.rodata._.str.1342,"a",@progbits
	.balign	1
	.local	_.str.1342
_.str.1342:
	.asciz	"link"

	.section	.rodata._.str.1343,"a",@progbits
	.balign	1
	.local	_.str.1343
_.str.1343:
	.asciz	"links"

	.section	.rodata._.str.1344,"a",@progbits
	.balign	1
	.local	_.str.1344
_.str.1344:
	.asciz	"linreg"

	.section	.rodata._.str.1345,"a",@progbits
	.balign	1
	.local	_.str.1345
_.str.1345:
	.asciz	"linregttest"

	.section	.rodata._.str.1346,"a",@progbits
	.balign	1
	.local	_.str.1346
_.str.1346:
	.asciz	"list"

	.section	.rodata._.str.1347,"a",@progbits
	.balign	1
	.local	_.str.1347
_.str.1347:
	.asciz	"listening"

	.section	.rodata._.str.1348,"a",@progbits
	.balign	1
	.local	_.str.1348
_.str.1348:
	.asciz	"lists"

	.section	.rodata._.str.1349,"a",@progbits
	.balign	1
	.local	_.str.1349
_.str.1349:
	.asciz	"literally"

	.section	.rodata._.str.1350,"a",@progbits
	.balign	1
	.local	_.str.1350
_.str.1350:
	.asciz	"literary"

	.section	.rodata._.str.1351,"a",@progbits
	.balign	1
	.local	_.str.1351
_.str.1351:
	.asciz	"lives"

	.section	.rodata._.str.1352,"a",@progbits
	.balign	1
	.local	_.str.1352
_.str.1352:
	.asciz	"loan"

	.section	.rodata._.str.1353,"a",@progbits
	.balign	1
	.local	_.str.1353
_.str.1353:
	.asciz	"located"

	.section	.rodata._.str.1354,"a",@progbits
	.balign	1
	.local	_.str.1354
_.str.1354:
	.asciz	"location"

	.section	.rodata._.str.1355,"a",@progbits
	.balign	1
	.local	_.str.1355
_.str.1355:
	.asciz	"logarithm"

	.section	.rodata._.str.1356,"a",@progbits
	.balign	1
	.local	_.str.1356
_.str.1356:
	.asciz	"logic"

	.section	.rodata._.str.1357,"a",@progbits
	.balign	1
	.local	_.str.1357
_.str.1357:
	.asciz	"logistic"

	.section	.rodata._.str.1358,"a",@progbits
	.balign	1
	.local	_.str.1358
_.str.1358:
	.asciz	"long"

	.section	.rodata._.str.1359,"a",@progbits
	.balign	1
	.local	_.str.1359
_.str.1359:
	.asciz	"longer"

	.section	.rodata._.str.1360,"a",@progbits
	.balign	1
	.local	_.str.1360
_.str.1360:
	.asciz	"look"

	.section	.rodata._.str.1361,"a",@progbits
	.balign	1
	.local	_.str.1361
_.str.1361:
	.asciz	"looked"

	.section	.rodata._.str.1362,"a",@progbits
	.balign	1
	.local	_.str.1362
_.str.1362:
	.asciz	"looking"

	.section	.rodata._.str.1363,"a",@progbits
	.balign	1
	.local	_.str.1363
_.str.1363:
	.asciz	"looks"

	.section	.rodata._.str.1364,"a",@progbits
	.balign	1
	.local	_.str.1364
_.str.1364:
	.asciz	"lose"

	.section	.rodata._.str.1365,"a",@progbits
	.balign	1
	.local	_.str.1365
_.str.1365:
	.asciz	"lost"

	.section	.rodata._.str.1366,"a",@progbits
	.balign	1
	.local	_.str.1366
_.str.1366:
	.asciz	"lottery"

	.section	.rodata._.str.1367,"a",@progbits
	.balign	1
	.local	_.str.1367
_.str.1367:
	.asciz	"loud"

	.section	.rodata._.str.1368,"a",@progbits
	.balign	1
	.local	_.str.1368
_.str.1368:
	.asciz	"love"

	.section	.rodata._.str.1369,"a",@progbits
	.balign	1
	.local	_.str.1369
_.str.1369:
	.asciz	"lower"

	.section	.rodata._.str.1370,"a",@progbits
	.balign	1
	.local	_.str.1370
_.str.1370:
	.asciz	"lowers"

	.section	.rodata._.str.1371,"a",@progbits
	.balign	1
	.local	_.str.1371
_.str.1371:
	.asciz	"lowest"

	.section	.rodata._.str.1372,"a",@progbits
	.balign	1
	.local	_.str.1372
_.str.1372:
	.asciz	"lsrl"

	.section	.rodata._.str.1373,"a",@progbits
	.balign	1
	.local	_.str.1373
_.str.1373:
	.asciz	"lurking"

	.section	.rodata._.str.1374,"a",@progbits
	.balign	1
	.local	_.str.1374
_.str.1374:
	.asciz	"luxury"

	.section	.rodata._.str.1375,"a",@progbits
	.balign	1
	.local	_.str.1375
_.str.1375:
	.asciz	"lying"

	.section	.rodata._.str.1376,"a",@progbits
	.balign	1
	.local	_.str.1376
_.str.1376:
	.asciz	"machine"

	.section	.rodata._.str.1377,"a",@progbits
	.balign	1
	.local	_.str.1377
_.str.1377:
	.asciz	"made"

	.section	.rodata._.str.1378,"a",@progbits
	.balign	1
	.local	_.str.1378
_.str.1378:
	.asciz	"magazine"

	.section	.rodata._.str.1379,"a",@progbits
	.balign	1
	.local	_.str.1379
_.str.1379:
	.asciz	"magic"

	.section	.rodata._.str.1380,"a",@progbits
	.balign	1
	.local	_.str.1380
_.str.1380:
	.asciz	"magnitude"

	.section	.rodata._.str.1381,"a",@progbits
	.balign	1
	.local	_.str.1381
_.str.1381:
	.asciz	"mail"

	.section	.rodata._.str.1382,"a",@progbits
	.balign	1
	.local	_.str.1382
_.str.1382:
	.asciz	"mainstream"

	.section	.rodata._.str.1383,"a",@progbits
	.balign	1
	.local	_.str.1383
_.str.1383:
	.asciz	"maintain"

	.section	.rodata._.str.1384,"a",@progbits
	.balign	1
	.local	_.str.1384
_.str.1384:
	.asciz	"major"

	.section	.rodata._.str.1385,"a",@progbits
	.balign	1
	.local	_.str.1385
_.str.1385:
	.asciz	"make"

	.section	.rodata._.str.1386,"a",@progbits
	.balign	1
	.local	_.str.1386
_.str.1386:
	.asciz	"makes"

	.section	.rodata._.str.1387,"a",@progbits
	.balign	1
	.local	_.str.1387
_.str.1387:
	.asciz	"making"

	.section	.rodata._.str.1388,"a",@progbits
	.balign	1
	.local	_.str.1388
_.str.1388:
	.asciz	"mandatory"

	.section	.rodata._.str.1389,"a",@progbits
	.balign	1
	.local	_.str.1389
_.str.1389:
	.asciz	"manhattan"

	.section	.rodata._.str.1390,"a",@progbits
	.balign	1
	.local	_.str.1390
_.str.1390:
	.asciz	"manipulating"

	.section	.rodata._.str.1391,"a",@progbits
	.balign	1
	.local	_.str.1391
_.str.1391:
	.asciz	"mansions"

	.section	.rodata._.str.1392,"a",@progbits
	.balign	1
	.local	_.str.1392
_.str.1392:
	.asciz	"manual"

	.section	.rodata._.str.1393,"a",@progbits
	.balign	1
	.local	_.str.1393
_.str.1393:
	.asciz	"manually"

	.section	.rodata._.str.1394,"a",@progbits
	.balign	1
	.local	_.str.1394
_.str.1394:
	.asciz	"manufacturer"

	.section	.rodata._.str.1395,"a",@progbits
	.balign	1
	.local	_.str.1395
_.str.1395:
	.asciz	"many"

	.section	.rodata._.str.1396,"a",@progbits
	.balign	1
	.local	_.str.1396
_.str.1396:
	.asciz	"margin"

	.section	.rodata._.str.1397,"a",@progbits
	.balign	1
	.local	_.str.1397
_.str.1397:
	.asciz	"marginal"

	.section	.rodata._.str.1398,"a",@progbits
	.balign	1
	.local	_.str.1398
_.str.1398:
	.asciz	"market"

	.section	.rodata._.str.1399,"a",@progbits
	.balign	1
	.local	_.str.1399
_.str.1399:
	.asciz	"markov"

	.section	.rodata._.str.1400,"a",@progbits
	.balign	1
	.local	_.str.1400
_.str.1400:
	.asciz	"marks"

	.section	.rodata._.str.1401,"a",@progbits
	.balign	1
	.local	_.str.1401
_.str.1401:
	.asciz	"mars"

	.section	.rodata._.str.1402,"a",@progbits
	.balign	1
	.local	_.str.1402
_.str.1402:
	.asciz	"mass"

	.section	.rodata._.str.1403,"a",@progbits
	.balign	1
	.local	_.str.1403
_.str.1403:
	.asciz	"massive"

	.section	.rodata._.str.1404,"a",@progbits
	.balign	1
	.local	_.str.1404
_.str.1404:
	.asciz	"master"

	.section	.rodata._.str.1405,"a",@progbits
	.balign	1
	.local	_.str.1405
_.str.1405:
	.asciz	"masterclass"

	.section	.rodata._.str.1406,"a",@progbits
	.balign	1
	.local	_.str.1406
_.str.1406:
	.asciz	"mastering"

	.section	.rodata._.str.1407,"a",@progbits
	.balign	1
	.local	_.str.1407
_.str.1407:
	.asciz	"masters"

	.section	.rodata._.str.1408,"a",@progbits
	.balign	1
	.local	_.str.1408
_.str.1408:
	.asciz	"match"

	.section	.rodata._.str.1409,"a",@progbits
	.balign	1
	.local	_.str.1409
_.str.1409:
	.asciz	"matched"

	.section	.rodata._.str.1410,"a",@progbits
	.balign	1
	.local	_.str.1410
_.str.1410:
	.asciz	"matches"

	.section	.rodata._.str.1411,"a",@progbits
	.balign	1
	.local	_.str.1411
_.str.1411:
	.asciz	"math"

	.section	.rodata._.str.1412,"a",@progbits
	.balign	1
	.local	_.str.1412
_.str.1412:
	.asciz	"mathematical"

	.section	.rodata._.str.1413,"a",@progbits
	.balign	1
	.local	_.str.1413
_.str.1413:
	.asciz	"mathematically"

	.section	.rodata._.str.1414,"a",@progbits
	.balign	1
	.local	_.str.1414
_.str.1414:
	.asciz	"mathematician"

	.section	.rodata._.str.1415,"a",@progbits
	.balign	1
	.local	_.str.1415
_.str.1415:
	.asciz	"matrix"

	.section	.rodata._.str.1416,"a",@progbits
	.balign	1
	.local	_.str.1416
_.str.1416:
	.asciz	"matter"

	.section	.rodata._.str.1417,"a",@progbits
	.balign	1
	.local	_.str.1417
_.str.1417:
	.asciz	"maximize"

	.section	.rodata._.str.1418,"a",@progbits
	.balign	1
	.local	_.str.1418
_.str.1418:
	.asciz	"maximizing"

	.section	.rodata._.str.1419,"a",@progbits
	.balign	1
	.local	_.str.1419
_.str.1419:
	.asciz	"maximum"

	.section	.rodata._.str.1420,"a",@progbits
	.balign	1
	.local	_.str.1420
_.str.1420:
	.asciz	"mcmc"

	.section	.rodata._.str.1421,"a",@progbits
	.balign	1
	.local	_.str.1421
_.str.1421:
	.asciz	"mean"

	.section	.rodata._.str.1422,"a",@progbits
	.balign	1
	.local	_.str.1422
_.str.1422:
	.asciz	"meaning"

	.section	.rodata._.str.1423,"a",@progbits
	.balign	1
	.local	_.str.1423
_.str.1423:
	.asciz	"meaningful"

	.section	.rodata._.str.1424,"a",@progbits
	.balign	1
	.local	_.str.1424
_.str.1424:
	.asciz	"means"

	.section	.rodata._.str.1425,"a",@progbits
	.balign	1
	.local	_.str.1425
_.str.1425:
	.asciz	"meant"

	.section	.rodata._.str.1426,"a",@progbits
	.balign	1
	.local	_.str.1426
_.str.1426:
	.asciz	"measurable"

	.section	.rodata._.str.1427,"a",@progbits
	.balign	1
	.local	_.str.1427
_.str.1427:
	.asciz	"measure"

	.section	.rodata._.str.1428,"a",@progbits
	.balign	1
	.local	_.str.1428
_.str.1428:
	.asciz	"measured"

	.section	.rodata._.str.1429,"a",@progbits
	.balign	1
	.local	_.str.1429
_.str.1429:
	.asciz	"measurement"

	.section	.rodata._.str.1430,"a",@progbits
	.balign	1
	.local	_.str.1430
_.str.1430:
	.asciz	"measurements"

	.section	.rodata._.str.1431,"a",@progbits
	.balign	1
	.local	_.str.1431
_.str.1431:
	.asciz	"measures"

	.section	.rodata._.str.1432,"a",@progbits
	.balign	1
	.local	_.str.1432
_.str.1432:
	.asciz	"measuring"

	.section	.rodata._.str.1433,"a",@progbits
	.balign	1
	.local	_.str.1433
_.str.1433:
	.asciz	"mechanical"

	.section	.rodata._.str.1434,"a",@progbits
	.balign	1
	.local	_.str.1434
_.str.1434:
	.asciz	"mechanics"

	.section	.rodata._.str.1435,"a",@progbits
	.balign	1
	.local	_.str.1435
_.str.1435:
	.asciz	"mechanism"

	.section	.rodata._.str.1436,"a",@progbits
	.balign	1
	.local	_.str.1436
_.str.1436:
	.asciz	"median"

	.section	.rodata._.str.1437,"a",@progbits
	.balign	1
	.local	_.str.1437
_.str.1437:
	.asciz	"medians"

	.section	.rodata._.str.1438,"a",@progbits
	.balign	1
	.local	_.str.1438
_.str.1438:
	.asciz	"medical"

	.section	.rodata._.str.1439,"a",@progbits
	.balign	1
	.local	_.str.1439
_.str.1439:
	.asciz	"meets"

	.section	.rodata._.str.1440,"a",@progbits
	.balign	1
	.local	_.str.1440
_.str.1440:
	.asciz	"member"

	.section	.rodata._.str.1441,"a",@progbits
	.balign	1
	.local	_.str.1441
_.str.1441:
	.asciz	"members"

	.section	.rodata._.str.1442,"a",@progbits
	.balign	1
	.local	_.str.1442
_.str.1442:
	.asciz	"memorize"

	.section	.rodata._.str.1443,"a",@progbits
	.balign	1
	.local	_.str.1443
_.str.1443:
	.asciz	"memory"

	.section	.rodata._.str.1444,"a",@progbits
	.balign	1
	.local	_.str.1444
_.str.1444:
	.asciz	"mention"

	.section	.rodata._.str.1445,"a",@progbits
	.balign	1
	.local	_.str.1445
_.str.1445:
	.asciz	"menu"

	.section	.rodata._.str.1446,"a",@progbits
	.balign	1
	.local	_.str.1446
_.str.1446:
	.asciz	"menus"

	.section	.rodata._.str.1447,"a",@progbits
	.balign	1
	.local	_.str.1447
_.str.1447:
	.asciz	"method"

	.section	.rodata._.str.1448,"a",@progbits
	.balign	1
	.local	_.str.1448
_.str.1448:
	.asciz	"methods"

	.section	.rodata._.str.1449,"a",@progbits
	.balign	1
	.local	_.str.1449
_.str.1449:
	.asciz	"metric"

	.section	.rodata._.str.1450,"a",@progbits
	.balign	1
	.local	_.str.1450
_.str.1450:
	.asciz	"middle"

	.section	.rodata._.str.1451,"a",@progbits
	.balign	1
	.local	_.str.1451
_.str.1451:
	.asciz	"might"

	.section	.rodata._.str.1452,"a",@progbits
	.balign	1
	.local	_.str.1452
_.str.1452:
	.asciz	"million"

	.section	.rodata._.str.1453,"a",@progbits
	.balign	1
	.local	_.str.1453
_.str.1453:
	.asciz	"millions"

	.section	.rodata._.str.1454,"a",@progbits
	.balign	1
	.local	_.str.1454
_.str.1454:
	.asciz	"mimic"

	.section	.rodata._.str.1455,"a",@progbits
	.balign	1
	.local	_.str.1455
_.str.1455:
	.asciz	"mimics"

	.section	.rodata._.str.1456,"a",@progbits
	.balign	1
	.local	_.str.1456
_.str.1456:
	.asciz	"minimize"

	.section	.rodata._.str.1457,"a",@progbits
	.balign	1
	.local	_.str.1457
_.str.1457:
	.asciz	"minimizes"

	.section	.rodata._.str.1458,"a",@progbits
	.balign	1
	.local	_.str.1458
_.str.1458:
	.asciz	"minimizing"

	.section	.rodata._.str.1459,"a",@progbits
	.balign	1
	.local	_.str.1459
_.str.1459:
	.asciz	"minimum"

	.section	.rodata._.str.1460,"a",@progbits
	.balign	1
	.local	_.str.1460
_.str.1460:
	.asciz	"mining"

	.section	.rodata._.str.1461,"a",@progbits
	.balign	1
	.local	_.str.1461
_.str.1461:
	.asciz	"minister"

	.section	.rodata._.str.1462,"a",@progbits
	.balign	1
	.local	_.str.1462
_.str.1462:
	.asciz	"minitab"

	.section	.rodata._.str.1463,"a",@progbits
	.balign	1
	.local	_.str.1463
_.str.1463:
	.asciz	"minus"

	.section	.rodata._.str.1464,"a",@progbits
	.balign	1
	.local	_.str.1464
_.str.1464:
	.asciz	"minutes"

	.section	.rodata._.str.1465,"a",@progbits
	.balign	1
	.local	_.str.1465
_.str.1465:
	.asciz	"miscarriage"

	.section	.rodata._.str.1466,"a",@progbits
	.balign	1
	.local	_.str.1466
_.str.1466:
	.asciz	"misconception"

	.section	.rodata._.str.1467,"a",@progbits
	.balign	1
	.local	_.str.1467
_.str.1467:
	.asciz	"misinterpreting"

	.section	.rodata._.str.1468,"a",@progbits
	.balign	1
	.local	_.str.1468
_.str.1468:
	.asciz	"misleading"

	.section	.rodata._.str.1469,"a",@progbits
	.balign	1
	.local	_.str.1469
_.str.1469:
	.asciz	"mismatch"

	.section	.rodata._.str.1470,"a",@progbits
	.balign	1
	.local	_.str.1470
_.str.1470:
	.asciz	"miss"

	.section	.rodata._.str.1471,"a",@progbits
	.balign	1
	.local	_.str.1471
_.str.1471:
	.asciz	"missed"

	.section	.rodata._.str.1472,"a",@progbits
	.balign	1
	.local	_.str.1472
_.str.1472:
	.asciz	"missing"

	.section	.rodata._.str.1473,"a",@progbits
	.balign	1
	.local	_.str.1473
_.str.1473:
	.asciz	"mistake"

	.section	.rodata._.str.1474,"a",@progbits
	.balign	1
	.local	_.str.1474
_.str.1474:
	.asciz	"mistaken"

	.section	.rodata._.str.1475,"a",@progbits
	.balign	1
	.local	_.str.1475
_.str.1475:
	.asciz	"mistakes"

	.section	.rodata._.str.1476,"a",@progbits
	.balign	1
	.local	_.str.1476
_.str.1476:
	.asciz	"misunderstanding"

	.section	.rodata._.str.1477,"a",@progbits
	.balign	1
	.local	_.str.1477
_.str.1477:
	.asciz	"misuse"

	.section	.rodata._.str.1478,"a",@progbits
	.balign	1
	.local	_.str.1478
_.str.1478:
	.asciz	"mixed"

	.section	.rodata._.str.1479,"a",@progbits
	.balign	1
	.local	_.str.1479
_.str.1479:
	.asciz	"mixing"

	.section	.rodata._.str.1480,"a",@progbits
	.balign	1
	.local	_.str.1480
_.str.1480:
	.asciz	"mnemonic"

	.section	.rodata._.str.1481,"a",@progbits
	.balign	1
	.local	_.str.1481
_.str.1481:
	.asciz	"model"

	.section	.rodata._.str.1482,"a",@progbits
	.balign	1
	.local	_.str.1482
_.str.1482:
	.asciz	"modeling"

	.section	.rodata._.str.1483,"a",@progbits
	.balign	1
	.local	_.str.1483
_.str.1483:
	.asciz	"models"

	.section	.rodata._.str.1484,"a",@progbits
	.balign	1
	.local	_.str.1484
_.str.1484:
	.asciz	"moderate"

	.section	.rodata._.str.1485,"a",@progbits
	.balign	1
	.local	_.str.1485
_.str.1485:
	.asciz	"modern"

	.section	.rodata._.str.1486,"a",@progbits
	.balign	1
	.local	_.str.1486
_.str.1486:
	.asciz	"modes"

	.section	.rodata._.str.1487,"a",@progbits
	.balign	1
	.local	_.str.1487
_.str.1487:
	.asciz	"modified"

	.section	.rodata._.str.1488,"a",@progbits
	.balign	1
	.local	_.str.1488
_.str.1488:
	.asciz	"modify"

	.section	.rodata._.str.1489,"a",@progbits
	.balign	1
	.local	_.str.1489
_.str.1489:
	.asciz	"moment"

	.section	.rodata._.str.1490,"a",@progbits
	.balign	1
	.local	_.str.1490
_.str.1490:
	.asciz	"moments"

	.section	.rodata._.str.1491,"a",@progbits
	.balign	1
	.local	_.str.1491
_.str.1491:
	.asciz	"monte"

	.section	.rodata._.str.1492,"a",@progbits
	.balign	1
	.local	_.str.1492
_.str.1492:
	.asciz	"month"

	.section	.rodata._.str.1493,"a",@progbits
	.balign	1
	.local	_.str.1493
_.str.1493:
	.asciz	"months"

	.section	.rodata._.str.1494,"a",@progbits
	.balign	1
	.local	_.str.1494
_.str.1494:
	.asciz	"monty"

	.section	.rodata._.str.1495,"a",@progbits
	.balign	1
	.local	_.str.1495
_.str.1495:
	.asciz	"more"

	.section	.rodata._.str.1496,"a",@progbits
	.balign	1
	.local	_.str.1496
_.str.1496:
	.asciz	"morning"

	.section	.rodata._.str.1497,"a",@progbits
	.balign	1
	.local	_.str.1497
_.str.1497:
	.asciz	"mortgage"

	.section	.rodata._.str.1498,"a",@progbits
	.balign	1
	.local	_.str.1498
_.str.1498:
	.asciz	"most"

	.section	.rodata._.str.1499,"a",@progbits
	.balign	1
	.local	_.str.1499
_.str.1499:
	.asciz	"mostly"

	.section	.rodata._.str.1500,"a",@progbits
	.balign	1
	.local	_.str.1500
_.str.1500:
	.asciz	"move"

	.section	.rodata._.str.1501,"a",@progbits
	.balign	1
	.local	_.str.1501
_.str.1501:
	.asciz	"moving"

	.section	.rodata._.str.1502,"a",@progbits
	.balign	1
	.local	_.str.1502
_.str.1502:
	.asciz	"moyen"

	.section	.rodata._.str.1503,"a",@progbits
	.balign	1
	.local	_.str.1503
_.str.1503:
	.asciz	"mu_0"

	.section	.rodata._.str.1504,"a",@progbits
	.balign	1
	.local	_.str.1504
_.str.1504:
	.asciz	"mu_1"

	.section	.rodata._.str.1505,"a",@progbits
	.balign	1
	.local	_.str.1505
_.str.1505:
	.asciz	"mu_2"

	.section	.rodata._.str.1506,"a",@progbits
	.balign	1
	.local	_.str.1506
_.str.1506:
	.asciz	"mu_phat"

	.section	.rodata._.str.1507,"a",@progbits
	.balign	1
	.local	_.str.1507
_.str.1507:
	.asciz	"mu_x"

	.section	.rodata._.str.1508,"a",@progbits
	.balign	1
	.local	_.str.1508
_.str.1508:
	.asciz	"mu_xbar"

	.section	.rodata._.str.1509,"a",@progbits
	.balign	1
	.local	_.str.1509
_.str.1509:
	.asciz	"mu_y"

	.section	.rodata._.str.1510,"a",@progbits
	.balign	1
	.local	_.str.1510
_.str.1510:
	.asciz	"much"

	.section	.rodata._.str.1511,"a",@progbits
	.balign	1
	.local	_.str.1511
_.str.1511:
	.asciz	"multi"

	.section	.rodata._.str.1512,"a",@progbits
	.balign	1
	.local	_.str.1512
_.str.1512:
	.asciz	"multicollinearity"

	.section	.rodata._.str.1513,"a",@progbits
	.balign	1
	.local	_.str.1513
_.str.1513:
	.asciz	"multiple"

	.section	.rodata._.str.1514,"a",@progbits
	.balign	1
	.local	_.str.1514
_.str.1514:
	.asciz	"multiplication"

	.section	.rodata._.str.1515,"a",@progbits
	.balign	1
	.local	_.str.1515
_.str.1515:
	.asciz	"multiplied"

	.section	.rodata._.str.1516,"a",@progbits
	.balign	1
	.local	_.str.1516
_.str.1516:
	.asciz	"multiply"

	.section	.rodata._.str.1517,"a",@progbits
	.balign	1
	.local	_.str.1517
_.str.1517:
	.asciz	"multiplying"

	.section	.rodata._.str.1518,"a",@progbits
	.balign	1
	.local	_.str.1518
_.str.1518:
	.asciz	"multistage"

	.section	.rodata._.str.1519,"a",@progbits
	.balign	1
	.local	_.str.1519
_.str.1519:
	.asciz	"multivariate"

	.section	.rodata._.str.1520,"a",@progbits
	.balign	1
	.local	_.str.1520
_.str.1520:
	.asciz	"music"

	.section	.rodata._.str.1521,"a",@progbits
	.balign	1
	.local	_.str.1521
_.str.1521:
	.asciz	"must"

	.section	.rodata._.str.1522,"a",@progbits
	.balign	1
	.local	_.str.1522
_.str.1522:
	.asciz	"mutually"

	.section	.rodata._.str.1523,"a",@progbits
	.balign	1
	.local	_.str.1523
_.str.1523:
	.asciz	"myth"

	.section	.rodata._.str.1524,"a",@progbits
	.balign	1
	.local	_.str.1524
_.str.1524:
	.asciz	"nalyze"

	.section	.rodata._.str.1525,"a",@progbits
	.balign	1
	.local	_.str.1525
_.str.1525:
	.asciz	"name"

	.section	.rodata._.str.1526,"a",@progbits
	.balign	1
	.local	_.str.1526
_.str.1526:
	.asciz	"named"

	.section	.rodata._.str.1527,"a",@progbits
	.balign	1
	.local	_.str.1527
_.str.1527:
	.asciz	"names"

	.section	.rodata._.str.1528,"a",@progbits
	.balign	1
	.local	_.str.1528
_.str.1528:
	.asciz	"naming"

	.section	.rodata._.str.1529,"a",@progbits
	.balign	1
	.local	_.str.1529
_.str.1529:
	.asciz	"narrate"

	.section	.rodata._.str.1530,"a",@progbits
	.balign	1
	.local	_.str.1530
_.str.1530:
	.asciz	"narrower"

	.section	.rodata._.str.1531,"a",@progbits
	.balign	1
	.local	_.str.1531
_.str.1531:
	.asciz	"nate"

	.section	.rodata._.str.1532,"a",@progbits
	.balign	1
	.local	_.str.1532
_.str.1532:
	.asciz	"nation"

	.section	.rodata._.str.1533,"a",@progbits
	.balign	1
	.local	_.str.1533
_.str.1533:
	.asciz	"near"

	.section	.rodata._.str.1534,"a",@progbits
	.balign	1
	.local	_.str.1534
_.str.1534:
	.asciz	"nearest"

	.section	.rodata._.str.1535,"a",@progbits
	.balign	1
	.local	_.str.1535
_.str.1535:
	.asciz	"necessarily"

	.section	.rodata._.str.1536,"a",@progbits
	.balign	1
	.local	_.str.1536
_.str.1536:
	.asciz	"necessary"

	.section	.rodata._.str.1537,"a",@progbits
	.balign	1
	.local	_.str.1537
_.str.1537:
	.asciz	"necessity"

	.section	.rodata._.str.1538,"a",@progbits
	.balign	1
	.local	_.str.1538
_.str.1538:
	.asciz	"need"

	.section	.rodata._.str.1539,"a",@progbits
	.balign	1
	.local	_.str.1539
_.str.1539:
	.asciz	"needed"

	.section	.rodata._.str.1540,"a",@progbits
	.balign	1
	.local	_.str.1540
_.str.1540:
	.asciz	"negative"

	.section	.rodata._.str.1541,"a",@progbits
	.balign	1
	.local	_.str.1541
_.str.1541:
	.asciz	"negligible"

	.section	.rodata._.str.1542,"a",@progbits
	.balign	1
	.local	_.str.1542
_.str.1542:
	.asciz	"neil"

	.section	.rodata._.str.1543,"a",@progbits
	.balign	1
	.local	_.str.1543
_.str.1543:
	.asciz	"neither"

	.section	.rodata._.str.1544,"a",@progbits
	.balign	1
	.local	_.str.1544
_.str.1544:
	.asciz	"nested"

	.section	.rodata._.str.1545,"a",@progbits
	.balign	1
	.local	_.str.1545
_.str.1545:
	.asciz	"never"

	.section	.rodata._.str.1546,"a",@progbits
	.balign	1
	.local	_.str.1546
_.str.1546:
	.asciz	"next"

	.section	.rodata._.str.1547,"a",@progbits
	.balign	1
	.local	_.str.1547
_.str.1547:
	.asciz	"neyman"

	.section	.rodata._.str.1548,"a",@progbits
	.balign	1
	.local	_.str.1548
_.str.1548:
	.asciz	"nightingale"

	.section	.rodata._.str.1549,"a",@progbits
	.balign	1
	.local	_.str.1549
_.str.1549:
	.asciz	"noise"

	.section	.rodata._.str.1550,"a",@progbits
	.balign	1
	.local	_.str.1550
_.str.1550:
	.asciz	"nominal"

	.section	.rodata._.str.1551,"a",@progbits
	.balign	1
	.local	_.str.1551
_.str.1551:
	.asciz	"none"

	.section	.rodata._.str.1552,"a",@progbits
	.balign	1
	.local	_.str.1552
_.str.1552:
	.asciz	"nonresponse"

	.section	.rodata._.str.1553,"a",@progbits
	.balign	1
	.local	_.str.1553
_.str.1553:
	.asciz	"normal"

	.section	.rodata._.str.1554,"a",@progbits
	.balign	1
	.local	_.str.1554
_.str.1554:
	.asciz	"normalcdf"

	.section	.rodata._.str.1555,"a",@progbits
	.balign	1
	.local	_.str.1555
_.str.1555:
	.asciz	"normality"

	.section	.rodata._.str.1556,"a",@progbits
	.balign	1
	.local	_.str.1556
_.str.1556:
	.asciz	"normalized"

	.section	.rodata._.str.1557,"a",@progbits
	.balign	1
	.local	_.str.1557
_.str.1557:
	.asciz	"normalizing"

	.section	.rodata._.str.1558,"a",@progbits
	.balign	1
	.local	_.str.1558
_.str.1558:
	.asciz	"normalpdf"

	.section	.rodata._.str.1559,"a",@progbits
	.balign	1
	.local	_.str.1559
_.str.1559:
	.asciz	"notably"

	.section	.rodata._.str.1560,"a",@progbits
	.balign	1
	.local	_.str.1560
_.str.1560:
	.asciz	"notation"

	.section	.rodata._.str.1561,"a",@progbits
	.balign	1
	.local	_.str.1561
_.str.1561:
	.asciz	"note"

	.section	.rodata._.str.1562,"a",@progbits
	.balign	1
	.local	_.str.1562
_.str.1562:
	.asciz	"nothing"

	.section	.rodata._.str.1563,"a",@progbits
	.balign	1
	.local	_.str.1563
_.str.1563:
	.asciz	"noticeably"

	.section	.rodata._.str.1564,"a",@progbits
	.balign	1
	.local	_.str.1564
_.str.1564:
	.asciz	"novel"

	.section	.rodata._.str.1565,"a",@progbits
	.balign	1
	.local	_.str.1565
_.str.1565:
	.asciz	"november"

	.section	.rodata._.str.1566,"a",@progbits
	.balign	1
	.local	_.str.1566
_.str.1566:
	.asciz	"nuance"

	.section	.rodata._.str.1567,"a",@progbits
	.balign	1
	.local	_.str.1567
_.str.1567:
	.asciz	"nuisance"

	.section	.rodata._.str.1568,"a",@progbits
	.balign	1
	.local	_.str.1568
_.str.1568:
	.asciz	"null"

	.section	.rodata._.str.1569,"a",@progbits
	.balign	1
	.local	_.str.1569
_.str.1569:
	.asciz	"nullity"

	.section	.rodata._.str.1570,"a",@progbits
	.balign	1
	.local	_.str.1570
_.str.1570:
	.asciz	"number"

	.section	.rodata._.str.1571,"a",@progbits
	.balign	1
	.local	_.str.1571
_.str.1571:
	.asciz	"numbers"

	.section	.rodata._.str.1572,"a",@progbits
	.balign	1
	.local	_.str.1572
_.str.1572:
	.asciz	"numerical"

	.section	.rodata._.str.1573,"a",@progbits
	.balign	1
	.local	_.str.1573
_.str.1573:
	.asciz	"nurse"

	.section	.rodata._.str.1574,"a",@progbits
	.balign	1
	.local	_.str.1574
_.str.1574:
	.asciz	"nursing"

	.section	.rodata._.str.1575,"a",@progbits
	.balign	1
	.local	_.str.1575
_.str.1575:
	.asciz	"object"

	.section	.rodata._.str.1576,"a",@progbits
	.balign	1
	.local	_.str.1576
_.str.1576:
	.asciz	"objective"

	.section	.rodata._.str.1577,"a",@progbits
	.balign	1
	.local	_.str.1577
_.str.1577:
	.asciz	"objects"

	.section	.rodata._.str.1578,"a",@progbits
	.balign	1
	.local	_.str.1578
_.str.1578:
	.asciz	"obscure"

	.section	.rodata._.str.1579,"a",@progbits
	.balign	1
	.local	_.str.1579
_.str.1579:
	.asciz	"observable"

	.section	.rodata._.str.1580,"a",@progbits
	.balign	1
	.local	_.str.1580
_.str.1580:
	.asciz	"observation"

	.section	.rodata._.str.1581,"a",@progbits
	.balign	1
	.local	_.str.1581
_.str.1581:
	.asciz	"observational"

	.section	.rodata._.str.1582,"a",@progbits
	.balign	1
	.local	_.str.1582
_.str.1582:
	.asciz	"observations"

	.section	.rodata._.str.1583,"a",@progbits
	.balign	1
	.local	_.str.1583
_.str.1583:
	.asciz	"observed"

	.section	.rodata._.str.1584,"a",@progbits
	.balign	1
	.local	_.str.1584
_.str.1584:
	.asciz	"observing"

	.section	.rodata._.str.1585,"a",@progbits
	.balign	1
	.local	_.str.1585
_.str.1585:
	.asciz	"obtain"

	.section	.rodata._.str.1586,"a",@progbits
	.balign	1
	.local	_.str.1586
_.str.1586:
	.asciz	"obtained"

	.section	.rodata._.str.1587,"a",@progbits
	.balign	1
	.local	_.str.1587
_.str.1587:
	.asciz	"obtaining"

	.section	.rodata._.str.1588,"a",@progbits
	.balign	1
	.local	_.str.1588
_.str.1588:
	.asciz	"occur"

	.section	.rodata._.str.1589,"a",@progbits
	.balign	1
	.local	_.str.1589
_.str.1589:
	.asciz	"occurred"

	.section	.rodata._.str.1590,"a",@progbits
	.balign	1
	.local	_.str.1590
_.str.1590:
	.asciz	"occurrence"

	.section	.rodata._.str.1591,"a",@progbits
	.balign	1
	.local	_.str.1591
_.str.1591:
	.asciz	"occurrences"

	.section	.rodata._.str.1592,"a",@progbits
	.balign	1
	.local	_.str.1592
_.str.1592:
	.asciz	"occurring"

	.section	.rodata._.str.1593,"a",@progbits
	.balign	1
	.local	_.str.1593
_.str.1593:
	.asciz	"occurs"

	.section	.rodata._.str.1594,"a",@progbits
	.balign	1
	.local	_.str.1594
_.str.1594:
	.asciz	"odds"

	.section	.rodata._.str.1595,"a",@progbits
	.balign	1
	.local	_.str.1595
_.str.1595:
	.asciz	"official"

	.section	.rodata._.str.1596,"a",@progbits
	.balign	1
	.local	_.str.1596
_.str.1596:
	.asciz	"often"

	.section	.rodata._.str.1597,"a",@progbits
	.balign	1
	.local	_.str.1597
_.str.1597:
	.asciz	"ogive"

	.section	.rodata._.str.1598,"a",@progbits
	.balign	1
	.local	_.str.1598
_.str.1598:
	.asciz	"older"

	.section	.rodata._.str.1599,"a",@progbits
	.balign	1
	.local	_.str.1599
_.str.1599:
	.asciz	"only"

	.section	.rodata._.str.1600,"a",@progbits
	.balign	1
	.local	_.str.1600
_.str.1600:
	.asciz	"opens"

	.section	.rodata._.str.1601,"a",@progbits
	.balign	1
	.local	_.str.1601
_.str.1601:
	.asciz	"opinion"

	.section	.rodata._.str.1602,"a",@progbits
	.balign	1
	.local	_.str.1602
_.str.1602:
	.asciz	"opinions"

	.section	.rodata._.str.1603,"a",@progbits
	.balign	1
	.local	_.str.1603
_.str.1603:
	.asciz	"opposed"

	.section	.rodata._.str.1604,"a",@progbits
	.balign	1
	.local	_.str.1604
_.str.1604:
	.asciz	"optimized"

	.section	.rodata._.str.1605,"a",@progbits
	.balign	1
	.local	_.str.1605
_.str.1605:
	.asciz	"option"

	.section	.rodata._.str.1606,"a",@progbits
	.balign	1
	.local	_.str.1606
_.str.1606:
	.asciz	"oranges"

	.section	.rodata._.str.1607,"a",@progbits
	.balign	1
	.local	_.str.1607
_.str.1607:
	.asciz	"orbiter"

	.section	.rodata._.str.1608,"a",@progbits
	.balign	1
	.local	_.str.1608
_.str.1608:
	.asciz	"orchards"

	.section	.rodata._.str.1609,"a",@progbits
	.balign	1
	.local	_.str.1609
_.str.1609:
	.asciz	"order"

	.section	.rodata._.str.1610,"a",@progbits
	.balign	1
	.local	_.str.1610
_.str.1610:
	.asciz	"ordinary"

	.section	.rodata._.str.1611,"a",@progbits
	.balign	1
	.local	_.str.1611
_.str.1611:
	.asciz	"organisms"

	.section	.rodata._.str.1612,"a",@progbits
	.balign	1
	.local	_.str.1612
_.str.1612:
	.asciz	"organize"

	.section	.rodata._.str.1613,"a",@progbits
	.balign	1
	.local	_.str.1613
_.str.1613:
	.asciz	"organized"

	.section	.rodata._.str.1614,"a",@progbits
	.balign	1
	.local	_.str.1614
_.str.1614:
	.asciz	"origin"

	.section	.rodata._.str.1615,"a",@progbits
	.balign	1
	.local	_.str.1615
_.str.1615:
	.asciz	"original"

	.section	.rodata._.str.1616,"a",@progbits
	.balign	1
	.local	_.str.1616
_.str.1616:
	.asciz	"orthogonal"

	.section	.rodata._.str.1617,"a",@progbits
	.balign	1
	.local	_.str.1617
_.str.1617:
	.asciz	"orthogonalization"

	.section	.rodata._.str.1618,"a",@progbits
	.balign	1
	.local	_.str.1618
_.str.1618:
	.asciz	"other"

	.section	.rodata._.str.1619,"a",@progbits
	.balign	1
	.local	_.str.1619
_.str.1619:
	.asciz	"others"

	.section	.rodata._.str.1620,"a",@progbits
	.balign	1
	.local	_.str.1620
_.str.1620:
	.asciz	"otherwise"

	.section	.rodata._.str.1621,"a",@progbits
	.balign	1
	.local	_.str.1621
_.str.1621:
	.asciz	"ours"

	.section	.rodata._.str.1622,"a",@progbits
	.balign	1
	.local	_.str.1622
_.str.1622:
	.asciz	"outcome"

	.section	.rodata._.str.1623,"a",@progbits
	.balign	1
	.local	_.str.1623
_.str.1623:
	.asciz	"outcomes"

	.section	.rodata._.str.1624,"a",@progbits
	.balign	1
	.local	_.str.1624
_.str.1624:
	.asciz	"outlier"

	.section	.rodata._.str.1625,"a",@progbits
	.balign	1
	.local	_.str.1625
_.str.1625:
	.asciz	"outliers"

	.section	.rodata._.str.1626,"a",@progbits
	.balign	1
	.local	_.str.1626
_.str.1626:
	.asciz	"output"

	.section	.rodata._.str.1627,"a",@progbits
	.balign	1
	.local	_.str.1627
_.str.1627:
	.asciz	"outside"

	.section	.rodata._.str.1628,"a",@progbits
	.balign	1
	.local	_.str.1628
_.str.1628:
	.asciz	"outward"

	.section	.rodata._.str.1629,"a",@progbits
	.balign	1
	.local	_.str.1629
_.str.1629:
	.asciz	"outweighs"

	.section	.rodata._.str.1630,"a",@progbits
	.balign	1
	.local	_.str.1630
_.str.1630:
	.asciz	"over"

	.section	.rodata._.str.1631,"a",@progbits
	.balign	1
	.local	_.str.1631
_.str.1631:
	.asciz	"overall"

	.section	.rodata._.str.1632,"a",@progbits
	.balign	1
	.local	_.str.1632
_.str.1632:
	.asciz	"overfitting"

	.section	.rodata._.str.1633,"a",@progbits
	.balign	1
	.local	_.str.1633
_.str.1633:
	.asciz	"overlapping"

	.section	.rodata._.str.1634,"a",@progbits
	.balign	1
	.local	_.str.1634
_.str.1634:
	.asciz	"overlooked"

	.section	.rodata._.str.1635,"a",@progbits
	.balign	1
	.local	_.str.1635
_.str.1635:
	.asciz	"overprediction"

	.section	.rodata._.str.1636,"a",@progbits
	.balign	1
	.local	_.str.1636
_.str.1636:
	.asciz	"overview"

	.section	.rodata._.str.1637,"a",@progbits
	.balign	1
	.local	_.str.1637
_.str.1637:
	.asciz	"overviews"

	.section	.rodata._.str.1638,"a",@progbits
	.balign	1
	.local	_.str.1638
_.str.1638:
	.asciz	"overwhelming"

	.section	.rodata._.str.1639,"a",@progbits
	.balign	1
	.local	_.str.1639
_.str.1639:
	.asciz	"owners"

	.section	.rodata._.str.1640,"a",@progbits
	.balign	1
	.local	_.str.1640
_.str.1640:
	.asciz	"p"

	.section	.rodata._.str.1641,"a",@progbits
	.balign	1
	.local	_.str.1641
_.str.1641:
	.asciz	"page"

	.section	.rodata._.str.1642,"a",@progbits
	.balign	1
	.local	_.str.1642
_.str.1642:
	.asciz	"pair"

	.section	.rodata._.str.1643,"a",@progbits
	.balign	1
	.local	_.str.1643
_.str.1643:
	.asciz	"paired"

	.section	.rodata._.str.1644,"a",@progbits
	.balign	1
	.local	_.str.1644
_.str.1644:
	.asciz	"pairing"

	.section	.rodata._.str.1645,"a",@progbits
	.balign	1
	.local	_.str.1645
_.str.1645:
	.asciz	"pairs"

	.section	.rodata._.str.1646,"a",@progbits
	.balign	1
	.local	_.str.1646
_.str.1646:
	.asciz	"panic"

	.section	.rodata._.str.1647,"a",@progbits
	.balign	1
	.local	_.str.1647
_.str.1647:
	.asciz	"paper"

	.section	.rodata._.str.1648,"a",@progbits
	.balign	1
	.local	_.str.1648
_.str.1648:
	.asciz	"paradox"

	.section	.rodata._.str.1649,"a",@progbits
	.balign	1
	.local	_.str.1649
_.str.1649:
	.asciz	"paradoxes"

	.section	.rodata._.str.1650,"a",@progbits
	.balign	1
	.local	_.str.1650
_.str.1650:
	.asciz	"paradoxical"

	.section	.rodata._.str.1651,"a",@progbits
	.balign	1
	.local	_.str.1651
_.str.1651:
	.asciz	"paragraph"

	.section	.rodata._.str.1652,"a",@progbits
	.balign	1
	.local	_.str.1652
_.str.1652:
	.asciz	"parameter"

	.section	.rodata._.str.1653,"a",@progbits
	.balign	1
	.local	_.str.1653
_.str.1653:
	.asciz	"parameters"

	.section	.rodata._.str.1654,"a",@progbits
	.balign	1
	.local	_.str.1654
_.str.1654:
	.asciz	"parametric"

	.section	.rodata._.str.1655,"a",@progbits
	.balign	1
	.local	_.str.1655
_.str.1655:
	.asciz	"parents"

	.section	.rodata._.str.1656,"a",@progbits
	.balign	1
	.local	_.str.1656
_.str.1656:
	.asciz	"pareto"

	.section	.rodata._.str.1657,"a",@progbits
	.balign	1
	.local	_.str.1657
_.str.1657:
	.asciz	"part"

	.section	.rodata._.str.1658,"a",@progbits
	.balign	1
	.local	_.str.1658
_.str.1658:
	.asciz	"partial"

	.section	.rodata._.str.1659,"a",@progbits
	.balign	1
	.local	_.str.1659
_.str.1659:
	.asciz	"participate"

	.section	.rodata._.str.1660,"a",@progbits
	.balign	1
	.local	_.str.1660
_.str.1660:
	.asciz	"parts"

	.section	.rodata._.str.1661,"a",@progbits
	.balign	1
	.local	_.str.1661
_.str.1661:
	.asciz	"pascal"

	.section	.rodata._.str.1662,"a",@progbits
	.balign	1
	.local	_.str.1662
_.str.1662:
	.asciz	"pass"

	.section	.rodata._.str.1663,"a",@progbits
	.balign	1
	.local	_.str.1663
_.str.1663:
	.asciz	"passes"

	.section	.rodata._.str.1664,"a",@progbits
	.balign	1
	.local	_.str.1664
_.str.1664:
	.asciz	"path"

	.section	.rodata._.str.1665,"a",@progbits
	.balign	1
	.local	_.str.1665
_.str.1665:
	.asciz	"paths"

	.section	.rodata._.str.1666,"a",@progbits
	.balign	1
	.local	_.str.1666
_.str.1666:
	.asciz	"patient"

	.section	.rodata._.str.1667,"a",@progbits
	.balign	1
	.local	_.str.1667
_.str.1667:
	.asciz	"patients"

	.section	.rodata._.str.1668,"a",@progbits
	.balign	1
	.local	_.str.1668
_.str.1668:
	.asciz	"pattern"

	.section	.rodata._.str.1669,"a",@progbits
	.balign	1
	.local	_.str.1669
_.str.1669:
	.asciz	"patterns"

	.section	.rodata._.str.1670,"a",@progbits
	.balign	1
	.local	_.str.1670
_.str.1670:
	.asciz	"payment"

	.section	.rodata._.str.1671,"a",@progbits
	.balign	1
	.local	_.str.1671
_.str.1671:
	.asciz	"payments"

	.section	.rodata._.str.1672,"a",@progbits
	.balign	1
	.local	_.str.1672
_.str.1672:
	.asciz	"payout"

	.section	.rodata._.str.1673,"a",@progbits
	.balign	1
	.local	_.str.1673
_.str.1673:
	.asciz	"peak"

	.section	.rodata._.str.1674,"a",@progbits
	.balign	1
	.local	_.str.1674
_.str.1674:
	.asciz	"peaks"

	.section	.rodata._.str.1675,"a",@progbits
	.balign	1
	.local	_.str.1675
_.str.1675:
	.asciz	"pearson"

	.section	.rodata._.str.1676,"a",@progbits
	.balign	1
	.local	_.str.1676
_.str.1676:
	.asciz	"penalize"

	.section	.rodata._.str.1677,"a",@progbits
	.balign	1
	.local	_.str.1677
_.str.1677:
	.asciz	"penalizes"

	.section	.rodata._.str.1678,"a",@progbits
	.balign	1
	.local	_.str.1678
_.str.1678:
	.asciz	"people"

	.section	.rodata._.str.1679,"a",@progbits
	.balign	1
	.local	_.str.1679
_.str.1679:
	.asciz	"perceive"

	.section	.rodata._.str.1680,"a",@progbits
	.balign	1
	.local	_.str.1680
_.str.1680:
	.asciz	"percent"

	.section	.rodata._.str.1681,"a",@progbits
	.balign	1
	.local	_.str.1681
_.str.1681:
	.asciz	"percentage"

	.section	.rodata._.str.1682,"a",@progbits
	.balign	1
	.local	_.str.1682
_.str.1682:
	.asciz	"percentile"

	.section	.rodata._.str.1683,"a",@progbits
	.balign	1
	.local	_.str.1683
_.str.1683:
	.asciz	"percentiles"

	.section	.rodata._.str.1684,"a",@progbits
	.balign	1
	.local	_.str.1684
_.str.1684:
	.asciz	"percents"

	.section	.rodata._.str.1685,"a",@progbits
	.balign	1
	.local	_.str.1685
_.str.1685:
	.asciz	"perfect"

	.section	.rodata._.str.1686,"a",@progbits
	.balign	1
	.local	_.str.1686
_.str.1686:
	.asciz	"perfectly"

	.section	.rodata._.str.1687,"a",@progbits
	.balign	1
	.local	_.str.1687
_.str.1687:
	.asciz	"perform"

	.section	.rodata._.str.1688,"a",@progbits
	.balign	1
	.local	_.str.1688
_.str.1688:
	.asciz	"performance"

	.section	.rodata._.str.1689,"a",@progbits
	.balign	1
	.local	_.str.1689
_.str.1689:
	.asciz	"performing"

	.section	.rodata._.str.1690,"a",@progbits
	.balign	1
	.local	_.str.1690
_.str.1690:
	.asciz	"period"

	.section	.rodata._.str.1691,"a",@progbits
	.balign	1
	.local	_.str.1691
_.str.1691:
	.asciz	"periodicity"

	.section	.rodata._.str.1692,"a",@progbits
	.balign	1
	.local	_.str.1692
_.str.1692:
	.asciz	"periods"

	.section	.rodata._.str.1693,"a",@progbits
	.balign	1
	.local	_.str.1693
_.str.1693:
	.asciz	"permutation"

	.section	.rodata._.str.1694,"a",@progbits
	.balign	1
	.local	_.str.1694
_.str.1694:
	.asciz	"permutations"

	.section	.rodata._.str.1695,"a",@progbits
	.balign	1
	.local	_.str.1695
_.str.1695:
	.asciz	"perpendicular"

	.section	.rodata._.str.1696,"a",@progbits
	.balign	1
	.local	_.str.1696
_.str.1696:
	.asciz	"person"

	.section	.rodata._.str.1697,"a",@progbits
	.balign	1
	.local	_.str.1697
_.str.1697:
	.asciz	"phantoms"

	.section	.rodata._.str.1698,"a",@progbits
	.balign	1
	.local	_.str.1698
_.str.1698:
	.asciz	"phase"

	.section	.rodata._.str.1699,"a",@progbits
	.balign	1
	.local	_.str.1699
_.str.1699:
	.asciz	"phat"

	.section	.rodata._.str.1700,"a",@progbits
	.balign	1
	.local	_.str.1700
_.str.1700:
	.asciz	"phenomena"

	.section	.rodata._.str.1701,"a",@progbits
	.balign	1
	.local	_.str.1701
_.str.1701:
	.asciz	"phenomenon"

	.section	.rodata._.str.1702,"a",@progbits
	.balign	1
	.local	_.str.1702
_.str.1702:
	.asciz	"philosophical"

	.section	.rodata._.str.1703,"a",@progbits
	.balign	1
	.local	_.str.1703
_.str.1703:
	.asciz	"philosophy"

	.section	.rodata._.str.1704,"a",@progbits
	.balign	1
	.local	_.str.1704
_.str.1704:
	.asciz	"phone"

	.section	.rodata._.str.1705,"a",@progbits
	.balign	1
	.local	_.str.1705
_.str.1705:
	.asciz	"phones"

	.section	.rodata._.str.1706,"a",@progbits
	.balign	1
	.local	_.str.1706
_.str.1706:
	.asciz	"physical"

	.section	.rodata._.str.1707,"a",@progbits
	.balign	1
	.local	_.str.1707
_.str.1707:
	.asciz	"pick"

	.section	.rodata._.str.1708,"a",@progbits
	.balign	1
	.local	_.str.1708
_.str.1708:
	.asciz	"picked"

	.section	.rodata._.str.1709,"a",@progbits
	.balign	1
	.local	_.str.1709
_.str.1709:
	.asciz	"picking"

	.section	.rodata._.str.1710,"a",@progbits
	.balign	1
	.local	_.str.1710
_.str.1710:
	.asciz	"picture"

	.section	.rodata._.str.1711,"a",@progbits
	.balign	1
	.local	_.str.1711
_.str.1711:
	.asciz	"pierre"

	.section	.rodata._.str.1712,"a",@progbits
	.balign	1
	.local	_.str.1712
_.str.1712:
	.asciz	"pillar"

	.section	.rodata._.str.1713,"a",@progbits
	.balign	1
	.local	_.str.1713
_.str.1713:
	.asciz	"pillars"

	.section	.rodata._.str.1714,"a",@progbits
	.balign	1
	.local	_.str.1714
_.str.1714:
	.asciz	"pioneer"

	.section	.rodata._.str.1715,"a",@progbits
	.balign	1
	.local	_.str.1715
_.str.1715:
	.asciz	"pixel"

	.section	.rodata._.str.1716,"a",@progbits
	.balign	1
	.local	_.str.1716
_.str.1716:
	.asciz	"place"

	.section	.rodata._.str.1717,"a",@progbits
	.balign	1
	.local	_.str.1717
_.str.1717:
	.asciz	"placebo"

	.section	.rodata._.str.1718,"a",@progbits
	.balign	1
	.local	_.str.1718
_.str.1718:
	.asciz	"plan"

	.section	.rodata._.str.1719,"a",@progbits
	.balign	1
	.local	_.str.1719
_.str.1719:
	.asciz	"plane"

	.section	.rodata._.str.1720,"a",@progbits
	.balign	1
	.local	_.str.1720
_.str.1720:
	.asciz	"planes"

	.section	.rodata._.str.1721,"a",@progbits
	.balign	1
	.local	_.str.1721
_.str.1721:
	.asciz	"plant"

	.section	.rodata._.str.1722,"a",@progbits
	.balign	1
	.local	_.str.1722
_.str.1722:
	.asciz	"plausible"

	.section	.rodata._.str.1723,"a",@progbits
	.balign	1
	.local	_.str.1723
_.str.1723:
	.asciz	"player"

	.section	.rodata._.str.1724,"a",@progbits
	.balign	1
	.local	_.str.1724
_.str.1724:
	.asciz	"players"

	.section	.rodata._.str.1725,"a",@progbits
	.balign	1
	.local	_.str.1725
_.str.1725:
	.asciz	"please"

	.section	.rodata._.str.1726,"a",@progbits
	.balign	1
	.local	_.str.1726
_.str.1726:
	.asciz	"plot"

	.section	.rodata._.str.1727,"a",@progbits
	.balign	1
	.local	_.str.1727
_.str.1727:
	.asciz	"plot1"

	.section	.rodata._.str.1728,"a",@progbits
	.balign	1
	.local	_.str.1728
_.str.1728:
	.asciz	"plots"

	.section	.rodata._.str.1729,"a",@progbits
	.balign	1
	.local	_.str.1729
_.str.1729:
	.asciz	"plotted"

	.section	.rodata._.str.1730,"a",@progbits
	.balign	1
	.local	_.str.1730
_.str.1730:
	.asciz	"plug"

	.section	.rodata._.str.1731,"a",@progbits
	.balign	1
	.local	_.str.1731
_.str.1731:
	.asciz	"plugged"

	.section	.rodata._.str.1732,"a",@progbits
	.balign	1
	.local	_.str.1732
_.str.1732:
	.asciz	"plus"

	.section	.rodata._.str.1733,"a",@progbits
	.balign	1
	.local	_.str.1733
_.str.1733:
	.asciz	"pmt_end"

	.section	.rodata._.str.1734,"a",@progbits
	.balign	1
	.local	_.str.1734
_.str.1734:
	.asciz	"point"

	.section	.rodata._.str.1735,"a",@progbits
	.balign	1
	.local	_.str.1735
_.str.1735:
	.asciz	"points"

	.section	.rodata._.str.1736,"a",@progbits
	.balign	1
	.local	_.str.1736
_.str.1736:
	.asciz	"poisson"

	.section	.rodata._.str.1737,"a",@progbits
	.balign	1
	.local	_.str.1737
_.str.1737:
	.asciz	"polar"

	.section	.rodata._.str.1738,"a",@progbits
	.balign	1
	.local	_.str.1738
_.str.1738:
	.asciz	"policy"

	.section	.rodata._.str.1739,"a",@progbits
	.balign	1
	.local	_.str.1739
_.str.1739:
	.asciz	"polio"

	.section	.rodata._.str.1740,"a",@progbits
	.balign	1
	.local	_.str.1740
_.str.1740:
	.asciz	"poll"

	.section	.rodata._.str.1741,"a",@progbits
	.balign	1
	.local	_.str.1741
_.str.1741:
	.asciz	"polled"

	.section	.rodata._.str.1742,"a",@progbits
	.balign	1
	.local	_.str.1742
_.str.1742:
	.asciz	"polling"

	.section	.rodata._.str.1743,"a",@progbits
	.balign	1
	.local	_.str.1743
_.str.1743:
	.asciz	"polls"

	.section	.rodata._.str.1744,"a",@progbits
	.balign	1
	.local	_.str.1744
_.str.1744:
	.asciz	"pollsters"

	.section	.rodata._.str.1745,"a",@progbits
	.balign	1
	.local	_.str.1745
_.str.1745:
	.asciz	"pool"

	.section	.rodata._.str.1746,"a",@progbits
	.balign	1
	.local	_.str.1746
_.str.1746:
	.asciz	"pooled"

	.section	.rodata._.str.1747,"a",@progbits
	.balign	1
	.local	_.str.1747
_.str.1747:
	.asciz	"pooling"

	.section	.rodata._.str.1748,"a",@progbits
	.balign	1
	.local	_.str.1748
_.str.1748:
	.asciz	"poor"

	.section	.rodata._.str.1749,"a",@progbits
	.balign	1
	.local	_.str.1749
_.str.1749:
	.asciz	"poorly"

	.section	.rodata._.str.1750,"a",@progbits
	.balign	1
	.local	_.str.1750
_.str.1750:
	.asciz	"popular"

	.section	.rodata._.str.1751,"a",@progbits
	.balign	1
	.local	_.str.1751
_.str.1751:
	.asciz	"populate"

	.section	.rodata._.str.1752,"a",@progbits
	.balign	1
	.local	_.str.1752
_.str.1752:
	.asciz	"population"

	.section	.rodata._.str.1753,"a",@progbits
	.balign	1
	.local	_.str.1753
_.str.1753:
	.asciz	"populations"

	.section	.rodata._.str.1754,"a",@progbits
	.balign	1
	.local	_.str.1754
_.str.1754:
	.asciz	"position"

	.section	.rodata._.str.1755,"a",@progbits
	.balign	1
	.local	_.str.1755
_.str.1755:
	.asciz	"positive"

	.section	.rodata._.str.1756,"a",@progbits
	.balign	1
	.local	_.str.1756
_.str.1756:
	.asciz	"positives"

	.section	.rodata._.str.1757,"a",@progbits
	.balign	1
	.local	_.str.1757
_.str.1757:
	.asciz	"possible"

	.section	.rodata._.str.1758,"a",@progbits
	.balign	1
	.local	_.str.1758
_.str.1758:
	.asciz	"post"

	.section	.rodata._.str.1759,"a",@progbits
	.balign	1
	.local	_.str.1759
_.str.1759:
	.asciz	"posthumously"

	.section	.rodata._.str.1760,"a",@progbits
	.balign	1
	.local	_.str.1760
_.str.1760:
	.asciz	"postman"

	.section	.rodata._.str.1761,"a",@progbits
	.balign	1
	.local	_.str.1761
_.str.1761:
	.asciz	"potential"

	.section	.rodata._.str.1762,"a",@progbits
	.balign	1
	.local	_.str.1762
_.str.1762:
	.asciz	"power"

	.section	.rodata._.str.1763,"a",@progbits
	.balign	1
	.local	_.str.1763
_.str.1763:
	.asciz	"powerful"

	.section	.rodata._.str.1764,"a",@progbits
	.balign	1
	.local	_.str.1764
_.str.1764:
	.asciz	"powers"

	.section	.rodata._.str.1765,"a",@progbits
	.balign	1
	.local	_.str.1765
_.str.1765:
	.asciz	"practical"

	.section	.rodata._.str.1766,"a",@progbits
	.balign	1
	.local	_.str.1766
_.str.1766:
	.asciz	"practice"

	.section	.rodata._.str.1767,"a",@progbits
	.balign	1
	.local	_.str.1767
_.str.1767:
	.asciz	"praised"

	.section	.rodata._.str.1768,"a",@progbits
	.balign	1
	.local	_.str.1768
_.str.1768:
	.asciz	"precise"

	.section	.rodata._.str.1769,"a",@progbits
	.balign	1
	.local	_.str.1769
_.str.1769:
	.asciz	"precision"

	.section	.rodata._.str.1770,"a",@progbits
	.balign	1
	.local	_.str.1770
_.str.1770:
	.asciz	"predefined"

	.section	.rodata._.str.1771,"a",@progbits
	.balign	1
	.local	_.str.1771
_.str.1771:
	.asciz	"predetermined"

	.section	.rodata._.str.1772,"a",@progbits
	.balign	1
	.local	_.str.1772
_.str.1772:
	.asciz	"predict"

	.section	.rodata._.str.1773,"a",@progbits
	.balign	1
	.local	_.str.1773
_.str.1773:
	.asciz	"predictable"

	.section	.rodata._.str.1774,"a",@progbits
	.balign	1
	.local	_.str.1774
_.str.1774:
	.asciz	"predicted"

	.section	.rodata._.str.1775,"a",@progbits
	.balign	1
	.local	_.str.1775
_.str.1775:
	.asciz	"predicting"

	.section	.rodata._.str.1776,"a",@progbits
	.balign	1
	.local	_.str.1776
_.str.1776:
	.asciz	"prediction"

	.section	.rodata._.str.1777,"a",@progbits
	.balign	1
	.local	_.str.1777
_.str.1777:
	.asciz	"predictions"

	.section	.rodata._.str.1778,"a",@progbits
	.balign	1
	.local	_.str.1778
_.str.1778:
	.asciz	"predictive"

	.section	.rodata._.str.1779,"a",@progbits
	.balign	1
	.local	_.str.1779
_.str.1779:
	.asciz	"predictor"

	.section	.rodata._.str.1780,"a",@progbits
	.balign	1
	.local	_.str.1780
_.str.1780:
	.asciz	"predictors"

	.section	.rodata._.str.1781,"a",@progbits
	.balign	1
	.local	_.str.1781
_.str.1781:
	.asciz	"preferred"

	.section	.rodata._.str.1782,"a",@progbits
	.balign	1
	.local	_.str.1782
_.str.1782:
	.asciz	"presbyterian"

	.section	.rodata._.str.1783,"a",@progbits
	.balign	1
	.local	_.str.1783
_.str.1783:
	.asciz	"present"

	.section	.rodata._.str.1784,"a",@progbits
	.balign	1
	.local	_.str.1784
_.str.1784:
	.asciz	"preserves"

	.section	.rodata._.str.1785,"a",@progbits
	.balign	1
	.local	_.str.1785
_.str.1785:
	.asciz	"president"

	.section	.rodata._.str.1786,"a",@progbits
	.balign	1
	.local	_.str.1786
_.str.1786:
	.asciz	"presidential"

	.section	.rodata._.str.1787,"a",@progbits
	.balign	1
	.local	_.str.1787
_.str.1787:
	.asciz	"press"

	.section	.rodata._.str.1788,"a",@progbits
	.balign	1
	.local	_.str.1788
_.str.1788:
	.asciz	"pressure"

	.section	.rodata._.str.1789,"a",@progbits
	.balign	1
	.local	_.str.1789
_.str.1789:
	.asciz	"prevent"

	.section	.rodata._.str.1790,"a",@progbits
	.balign	1
	.local	_.str.1790
_.str.1790:
	.asciz	"preventable"

	.section	.rodata._.str.1791,"a",@progbits
	.balign	1
	.local	_.str.1791
_.str.1791:
	.asciz	"previous"

	.section	.rodata._.str.1792,"a",@progbits
	.balign	1
	.local	_.str.1792
_.str.1792:
	.asciz	"prices"

	.section	.rodata._.str.1793,"a",@progbits
	.balign	1
	.local	_.str.1793
_.str.1793:
	.asciz	"primary"

	.section	.rodata._.str.1794,"a",@progbits
	.balign	1
	.local	_.str.1794
_.str.1794:
	.asciz	"princeton"

	.section	.rodata._.str.1795,"a",@progbits
	.balign	1
	.local	_.str.1795
_.str.1795:
	.asciz	"principal"

	.section	.rodata._.str.1796,"a",@progbits
	.balign	1
	.local	_.str.1796
_.str.1796:
	.asciz	"principle"

	.section	.rodata._.str.1797,"a",@progbits
	.balign	1
	.local	_.str.1797
_.str.1797:
	.asciz	"principles"

	.section	.rodata._.str.1798,"a",@progbits
	.balign	1
	.local	_.str.1798
_.str.1798:
	.asciz	"printed"

	.section	.rodata._.str.1799,"a",@progbits
	.balign	1
	.local	_.str.1799
_.str.1799:
	.asciz	"prior"

	.section	.rodata._.str.1800,"a",@progbits
	.balign	1
	.local	_.str.1800
_.str.1800:
	.asciz	"prob_1"

	.section	.rodata._.str.1801,"a",@progbits
	.balign	1
	.local	_.str.1801
_.str.1801:
	.asciz	"prob_2"

	.section	.rodata._.str.1802,"a",@progbits
	.balign	1
	.local	_.str.1802
_.str.1802:
	.asciz	"prob_n"

	.section	.rodata._.str.1803,"a",@progbits
	.balign	1
	.local	_.str.1803
_.str.1803:
	.asciz	"probabilistic"

	.section	.rodata._.str.1804,"a",@progbits
	.balign	1
	.local	_.str.1804
_.str.1804:
	.asciz	"probabilities"

	.section	.rodata._.str.1805,"a",@progbits
	.balign	1
	.local	_.str.1805
_.str.1805:
	.asciz	"probability"

	.section	.rodata._.str.1806,"a",@progbits
	.balign	1
	.local	_.str.1806
_.str.1806:
	.asciz	"probe"

	.section	.rodata._.str.1807,"a",@progbits
	.balign	1
	.local	_.str.1807
_.str.1807:
	.asciz	"problem"

	.section	.rodata._.str.1808,"a",@progbits
	.balign	1
	.local	_.str.1808
_.str.1808:
	.asciz	"problems"

	.section	.rodata._.str.1809,"a",@progbits
	.balign	1
	.local	_.str.1809
_.str.1809:
	.asciz	"procedure"

	.section	.rodata._.str.1810,"a",@progbits
	.balign	1
	.local	_.str.1810
_.str.1810:
	.asciz	"procedures"

	.section	.rodata._.str.1811,"a",@progbits
	.balign	1
	.local	_.str.1811
_.str.1811:
	.asciz	"process"

	.section	.rodata._.str.1812,"a",@progbits
	.balign	1
	.local	_.str.1812
_.str.1812:
	.asciz	"processor"

	.section	.rodata._.str.1813,"a",@progbits
	.balign	1
	.local	_.str.1813
_.str.1813:
	.asciz	"processors"

	.section	.rodata._.str.1814,"a",@progbits
	.balign	1
	.local	_.str.1814
_.str.1814:
	.asciz	"produce"

	.section	.rodata._.str.1815,"a",@progbits
	.balign	1
	.local	_.str.1815
_.str.1815:
	.asciz	"product"

	.section	.rodata._.str.1816,"a",@progbits
	.balign	1
	.local	_.str.1816
_.str.1816:
	.asciz	"production"

	.section	.rodata._.str.1817,"a",@progbits
	.balign	1
	.local	_.str.1817
_.str.1817:
	.asciz	"products"

	.section	.rodata._.str.1818,"a",@progbits
	.balign	1
	.local	_.str.1818
_.str.1818:
	.asciz	"professor"

	.section	.rodata._.str.1819,"a",@progbits
	.balign	1
	.local	_.str.1819
_.str.1819:
	.asciz	"profit"

	.section	.rodata._.str.1820,"a",@progbits
	.balign	1
	.local	_.str.1820
_.str.1820:
	.asciz	"program"

	.section	.rodata._.str.1821,"a",@progbits
	.balign	1
	.local	_.str.1821
_.str.1821:
	.asciz	"programs"

	.section	.rodata._.str.1822,"a",@progbits
	.balign	1
	.local	_.str.1822
_.str.1822:
	.asciz	"project"

	.section	.rodata._.str.1823,"a",@progbits
	.balign	1
	.local	_.str.1823
_.str.1823:
	.asciz	"promoting"

	.section	.rodata._.str.1824,"a",@progbits
	.balign	1
	.local	_.str.1824
_.str.1824:
	.asciz	"prompt"

	.section	.rodata._.str.1825,"a",@progbits
	.balign	1
	.local	_.str.1825
_.str.1825:
	.asciz	"proof"

	.section	.rodata._.str.1826,"a",@progbits
	.balign	1
	.local	_.str.1826
_.str.1826:
	.asciz	"properly"

	.section	.rodata._.str.1827,"a",@progbits
	.balign	1
	.local	_.str.1827
_.str.1827:
	.asciz	"property"

	.section	.rodata._.str.1828,"a",@progbits
	.balign	1
	.local	_.str.1828
_.str.1828:
	.asciz	"proportion"

	.section	.rodata._.str.1829,"a",@progbits
	.balign	1
	.local	_.str.1829
_.str.1829:
	.asciz	"proportional"

	.section	.rodata._.str.1830,"a",@progbits
	.balign	1
	.local	_.str.1830
_.str.1830:
	.asciz	"proportions"

	.section	.rodata._.str.1831,"a",@progbits
	.balign	1
	.local	_.str.1831
_.str.1831:
	.asciz	"propztest"

	.section	.rodata._.str.1832,"a",@progbits
	.balign	1
	.local	_.str.1832
_.str.1832:
	.asciz	"pros"

	.section	.rodata._.str.1833,"a",@progbits
	.balign	1
	.local	_.str.1833
_.str.1833:
	.asciz	"prosecutor"

	.section	.rodata._.str.1834,"a",@progbits
	.balign	1
	.local	_.str.1834
_.str.1834:
	.asciz	"protocol"

	.section	.rodata._.str.1835,"a",@progbits
	.balign	1
	.local	_.str.1835
_.str.1835:
	.asciz	"prove"

	.section	.rodata._.str.1836,"a",@progbits
	.balign	1
	.local	_.str.1836
_.str.1836:
	.asciz	"proven"

	.section	.rodata._.str.1837,"a",@progbits
	.balign	1
	.local	_.str.1837
_.str.1837:
	.asciz	"proves"

	.section	.rodata._.str.1838,"a",@progbits
	.balign	1
	.local	_.str.1838
_.str.1838:
	.asciz	"provide"

	.section	.rodata._.str.1839,"a",@progbits
	.balign	1
	.local	_.str.1839
_.str.1839:
	.asciz	"provided"

	.section	.rodata._.str.1840,"a",@progbits
	.balign	1
	.local	_.str.1840
_.str.1840:
	.asciz	"provides"

	.section	.rodata._.str.1841,"a",@progbits
	.balign	1
	.local	_.str.1841
_.str.1841:
	.asciz	"proving"

	.section	.rodata._.str.1842,"a",@progbits
	.balign	1
	.local	_.str.1842
_.str.1842:
	.asciz	"psychology"

	.section	.rodata._.str.1843,"a",@progbits
	.balign	1
	.local	_.str.1843
_.str.1843:
	.asciz	"psychometrics"

	.section	.rodata._.str.1844,"a",@progbits
	.balign	1
	.local	_.str.1844
_.str.1844:
	.asciz	"public"

	.section	.rodata._.str.1845,"a",@progbits
	.balign	1
	.local	_.str.1845
_.str.1845:
	.asciz	"published"

	.section	.rodata._.str.1846,"a",@progbits
	.balign	1
	.local	_.str.1846
_.str.1846:
	.asciz	"publishes"

	.section	.rodata._.str.1847,"a",@progbits
	.balign	1
	.local	_.str.1847
_.str.1847:
	.asciz	"pulled"

	.section	.rodata._.str.1848,"a",@progbits
	.balign	1
	.local	_.str.1848
_.str.1848:
	.asciz	"purpose"

	.section	.rodata._.str.1849,"a",@progbits
	.balign	1
	.local	_.str.1849
_.str.1849:
	.asciz	"puzzle"

	.section	.rodata._.str.1850,"a",@progbits
	.balign	1
	.local	_.str.1850
_.str.1850:
	.asciz	"quadratic"

	.section	.rodata._.str.1851,"a",@progbits
	.balign	1
	.local	_.str.1851
_.str.1851:
	.asciz	"qualitative"

	.section	.rodata._.str.1852,"a",@progbits
	.balign	1
	.local	_.str.1852
_.str.1852:
	.asciz	"qualities"

	.section	.rodata._.str.1853,"a",@progbits
	.balign	1
	.local	_.str.1853
_.str.1853:
	.asciz	"quality"

	.section	.rodata._.str.1854,"a",@progbits
	.balign	1
	.local	_.str.1854
_.str.1854:
	.asciz	"quantification"

	.section	.rodata._.str.1855,"a",@progbits
	.balign	1
	.local	_.str.1855
_.str.1855:
	.asciz	"quantifies"

	.section	.rodata._.str.1856,"a",@progbits
	.balign	1
	.local	_.str.1856
_.str.1856:
	.asciz	"quantile"

	.section	.rodata._.str.1857,"a",@progbits
	.balign	1
	.local	_.str.1857
_.str.1857:
	.asciz	"quantiles"

	.section	.rodata._.str.1858,"a",@progbits
	.balign	1
	.local	_.str.1858
_.str.1858:
	.asciz	"quantitative"

	.section	.rodata._.str.1859,"a",@progbits
	.balign	1
	.local	_.str.1859
_.str.1859:
	.asciz	"quantities"

	.section	.rodata._.str.1860,"a",@progbits
	.balign	1
	.local	_.str.1860
_.str.1860:
	.asciz	"quantity"

	.section	.rodata._.str.1861,"a",@progbits
	.balign	1
	.local	_.str.1861
_.str.1861:
	.asciz	"quartile"

	.section	.rodata._.str.1862,"a",@progbits
	.balign	1
	.local	_.str.1862
_.str.1862:
	.asciz	"quartiles"

	.section	.rodata._.str.1863,"a",@progbits
	.balign	1
	.local	_.str.1863
_.str.1863:
	.asciz	"question"

	.section	.rodata._.str.1864,"a",@progbits
	.balign	1
	.local	_.str.1864
_.str.1864:
	.asciz	"questions"

	.section	.rodata._.str.1865,"a",@progbits
	.balign	1
	.local	_.str.1865
_.str.1865:
	.asciz	"quetelet"

	.section	.rodata._.str.1866,"a",@progbits
	.balign	1
	.local	_.str.1866
_.str.1866:
	.asciz	"quickly"

	.section	.rodata._.str.1867,"a",@progbits
	.balign	1
	.local	_.str.1867
_.str.1867:
	.asciz	"quincunx"

	.section	.rodata._.str.1868,"a",@progbits
	.balign	1
	.local	_.str.1868
_.str.1868:
	.asciz	"quintile"

	.section	.rodata._.str.1869,"a",@progbits
	.balign	1
	.local	_.str.1869
_.str.1869:
	.asciz	"quota"

	.section	.rodata._.str.1870,"a",@progbits
	.balign	1
	.local	_.str.1870
_.str.1870:
	.asciz	"quotas"

	.section	.rodata._.str.1871,"a",@progbits
	.balign	1
	.local	_.str.1871
_.str.1871:
	.asciz	"radius"

	.section	.rodata._.str.1872,"a",@progbits
	.balign	1
	.local	_.str.1872
_.str.1872:
	.asciz	"randint"

	.section	.rodata._.str.1873,"a",@progbits
	.balign	1
	.local	_.str.1873
_.str.1873:
	.asciz	"randintnorep"

	.section	.rodata._.str.1874,"a",@progbits
	.balign	1
	.local	_.str.1874
_.str.1874:
	.asciz	"random"

	.section	.rodata._.str.1875,"a",@progbits
	.balign	1
	.local	_.str.1875
_.str.1875:
	.asciz	"randomization"

	.section	.rodata._.str.1876,"a",@progbits
	.balign	1
	.local	_.str.1876
_.str.1876:
	.asciz	"randomize"

	.section	.rodata._.str.1877,"a",@progbits
	.balign	1
	.local	_.str.1877
_.str.1877:
	.asciz	"randomized"

	.section	.rodata._.str.1878,"a",@progbits
	.balign	1
	.local	_.str.1878
_.str.1878:
	.asciz	"randomly"

	.section	.rodata._.str.1879,"a",@progbits
	.balign	1
	.local	_.str.1879
_.str.1879:
	.asciz	"randomness"

	.section	.rodata._.str.1880,"a",@progbits
	.balign	1
	.local	_.str.1880
_.str.1880:
	.asciz	"range"

	.section	.rodata._.str.1881,"a",@progbits
	.balign	1
	.local	_.str.1881
_.str.1881:
	.asciz	"rank"

	.section	.rodata._.str.1882,"a",@progbits
	.balign	1
	.local	_.str.1882
_.str.1882:
	.asciz	"rankings"

	.section	.rodata._.str.1883,"a",@progbits
	.balign	1
	.local	_.str.1883
_.str.1883:
	.asciz	"rare"

	.section	.rodata._.str.1884,"a",@progbits
	.balign	1
	.local	_.str.1884
_.str.1884:
	.asciz	"rarely"

	.section	.rodata._.str.1885,"a",@progbits
	.balign	1
	.local	_.str.1885
_.str.1885:
	.asciz	"rate"

	.section	.rodata._.str.1886,"a",@progbits
	.balign	1
	.local	_.str.1886
_.str.1886:
	.asciz	"rates"

	.section	.rodata._.str.1887,"a",@progbits
	.balign	1
	.local	_.str.1887
_.str.1887:
	.asciz	"rather"

	.section	.rodata._.str.1888,"a",@progbits
	.balign	1
	.local	_.str.1888
_.str.1888:
	.asciz	"ratio"

	.section	.rodata._.str.1889,"a",@progbits
	.balign	1
	.local	_.str.1889
_.str.1889:
	.asciz	"reach"

	.section	.rodata._.str.1890,"a",@progbits
	.balign	1
	.local	_.str.1890
_.str.1890:
	.asciz	"reached"

	.section	.rodata._.str.1891,"a",@progbits
	.balign	1
	.local	_.str.1891
_.str.1891:
	.asciz	"reaction"

	.section	.rodata._.str.1892,"a",@progbits
	.balign	1
	.local	_.str.1892
_.str.1892:
	.asciz	"read"

	.section	.rodata._.str.1893,"a",@progbits
	.balign	1
	.local	_.str.1893
_.str.1893:
	.asciz	"readers"

	.section	.rodata._.str.1894,"a",@progbits
	.balign	1
	.local	_.str.1894
_.str.1894:
	.asciz	"reading"

	.section	.rodata._.str.1895,"a",@progbits
	.balign	1
	.local	_.str.1895
_.str.1895:
	.asciz	"real"

	.section	.rodata._.str.1896,"a",@progbits
	.balign	1
	.local	_.str.1896
_.str.1896:
	.asciz	"reality"

	.section	.rodata._.str.1897,"a",@progbits
	.balign	1
	.local	_.str.1897
_.str.1897:
	.asciz	"realized"

	.section	.rodata._.str.1898,"a",@progbits
	.balign	1
	.local	_.str.1898
_.str.1898:
	.asciz	"really"

	.section	.rodata._.str.1899,"a",@progbits
	.balign	1
	.local	_.str.1899
_.str.1899:
	.asciz	"reason"

	.section	.rodata._.str.1900,"a",@progbits
	.balign	1
	.local	_.str.1900
_.str.1900:
	.asciz	"reasonable"

	.section	.rodata._.str.1901,"a",@progbits
	.balign	1
	.local	_.str.1901
_.str.1901:
	.asciz	"reasoning"

	.section	.rodata._.str.1902,"a",@progbits
	.balign	1
	.local	_.str.1902
_.str.1902:
	.asciz	"receive"

	.section	.rodata._.str.1903,"a",@progbits
	.balign	1
	.local	_.str.1903
_.str.1903:
	.asciz	"received"

	.section	.rodata._.str.1904,"a",@progbits
	.balign	1
	.local	_.str.1904
_.str.1904:
	.asciz	"receives"

	.section	.rodata._.str.1905,"a",@progbits
	.balign	1
	.local	_.str.1905
_.str.1905:
	.asciz	"recommend"

	.section	.rodata._.str.1906,"a",@progbits
	.balign	1
	.local	_.str.1906
_.str.1906:
	.asciz	"recorded"

	.section	.rodata._.str.1907,"a",@progbits
	.balign	1
	.local	_.str.1907
_.str.1907:
	.asciz	"reduce"

	.section	.rodata._.str.1908,"a",@progbits
	.balign	1
	.local	_.str.1908
_.str.1908:
	.asciz	"reduced"

	.section	.rodata._.str.1909,"a",@progbits
	.balign	1
	.local	_.str.1909
_.str.1909:
	.asciz	"reduces"

	.section	.rodata._.str.1910,"a",@progbits
	.balign	1
	.local	_.str.1910
_.str.1910:
	.asciz	"reducing"

	.section	.rodata._.str.1911,"a",@progbits
	.balign	1
	.local	_.str.1911
_.str.1911:
	.asciz	"reference"

	.section	.rodata._.str.1912,"a",@progbits
	.balign	1
	.local	_.str.1912
_.str.1912:
	.asciz	"reflects"

	.section	.rodata._.str.1913,"a",@progbits
	.balign	1
	.local	_.str.1913
_.str.1913:
	.asciz	"refuse"

	.section	.rodata._.str.1914,"a",@progbits
	.balign	1
	.local	_.str.1914
_.str.1914:
	.asciz	"regarding"

	.section	.rodata._.str.1915,"a",@progbits
	.balign	1
	.local	_.str.1915
_.str.1915:
	.asciz	"regardless"

	.section	.rodata._.str.1916,"a",@progbits
	.balign	1
	.local	_.str.1916
_.str.1916:
	.asciz	"registrations"

	.section	.rodata._.str.1917,"a",@progbits
	.balign	1
	.local	_.str.1917
_.str.1917:
	.asciz	"regression"

	.section	.rodata._.str.1918,"a",@progbits
	.balign	1
	.local	_.str.1918
_.str.1918:
	.asciz	"reject"

	.section	.rodata._.str.1919,"a",@progbits
	.balign	1
	.local	_.str.1919
_.str.1919:
	.asciz	"rejected"

	.section	.rodata._.str.1920,"a",@progbits
	.balign	1
	.local	_.str.1920
_.str.1920:
	.asciz	"rejecting"

	.section	.rodata._.str.1921,"a",@progbits
	.balign	1
	.local	_.str.1921
_.str.1921:
	.asciz	"rejects"

	.section	.rodata._.str.1922,"a",@progbits
	.balign	1
	.local	_.str.1922
_.str.1922:
	.asciz	"relate"

	.section	.rodata._.str.1923,"a",@progbits
	.balign	1
	.local	_.str.1923
_.str.1923:
	.asciz	"related"

	.section	.rodata._.str.1924,"a",@progbits
	.balign	1
	.local	_.str.1924
_.str.1924:
	.asciz	"relating"

	.section	.rodata._.str.1925,"a",@progbits
	.balign	1
	.local	_.str.1925
_.str.1925:
	.asciz	"relation"

	.section	.rodata._.str.1926,"a",@progbits
	.balign	1
	.local	_.str.1926
_.str.1926:
	.asciz	"relationship"

	.section	.rodata._.str.1927,"a",@progbits
	.balign	1
	.local	_.str.1927
_.str.1927:
	.asciz	"relationships"

	.section	.rodata._.str.1928,"a",@progbits
	.balign	1
	.local	_.str.1928
_.str.1928:
	.asciz	"relative"

	.section	.rodata._.str.1929,"a",@progbits
	.balign	1
	.local	_.str.1929
_.str.1929:
	.asciz	"relevant"

	.section	.rodata._.str.1930,"a",@progbits
	.balign	1
	.local	_.str.1930
_.str.1930:
	.asciz	"reliability"

	.section	.rodata._.str.1931,"a",@progbits
	.balign	1
	.local	_.str.1931
_.str.1931:
	.asciz	"reliable"

	.section	.rodata._.str.1932,"a",@progbits
	.balign	1
	.local	_.str.1932
_.str.1932:
	.asciz	"rely"

	.section	.rodata._.str.1933,"a",@progbits
	.balign	1
	.local	_.str.1933
_.str.1933:
	.asciz	"remaining"

	.section	.rodata._.str.1934,"a",@progbits
	.balign	1
	.local	_.str.1934
_.str.1934:
	.asciz	"remains"

	.section	.rodata._.str.1935,"a",@progbits
	.balign	1
	.local	_.str.1935
_.str.1935:
	.asciz	"remember"

	.section	.rodata._.str.1936,"a",@progbits
	.balign	1
	.local	_.str.1936
_.str.1936:
	.asciz	"reminder"

	.section	.rodata._.str.1937,"a",@progbits
	.balign	1
	.local	_.str.1937
_.str.1937:
	.asciz	"removed"

	.section	.rodata._.str.1938,"a",@progbits
	.balign	1
	.local	_.str.1938
_.str.1938:
	.asciz	"removing"

	.section	.rodata._.str.1939,"a",@progbits
	.balign	1
	.local	_.str.1939
_.str.1939:
	.asciz	"render"

	.section	.rodata._.str.1940,"a",@progbits
	.balign	1
	.local	_.str.1940
_.str.1940:
	.asciz	"repeat"

	.section	.rodata._.str.1941,"a",@progbits
	.balign	1
	.local	_.str.1941
_.str.1941:
	.asciz	"repeated"

	.section	.rodata._.str.1942,"a",@progbits
	.balign	1
	.local	_.str.1942
_.str.1942:
	.asciz	"repeatedly"

	.section	.rodata._.str.1943,"a",@progbits
	.balign	1
	.local	_.str.1943
_.str.1943:
	.asciz	"repeats"

	.section	.rodata._.str.1944,"a",@progbits
	.balign	1
	.local	_.str.1944
_.str.1944:
	.asciz	"replacement"

	.section	.rodata._.str.1945,"a",@progbits
	.balign	1
	.local	_.str.1945
_.str.1945:
	.asciz	"replication"

	.section	.rodata._.str.1946,"a",@progbits
	.balign	1
	.local	_.str.1946
_.str.1946:
	.asciz	"represent"

	.section	.rodata._.str.1947,"a",@progbits
	.balign	1
	.local	_.str.1947
_.str.1947:
	.asciz	"representative"

	.section	.rodata._.str.1948,"a",@progbits
	.balign	1
	.local	_.str.1948
_.str.1948:
	.asciz	"represented"

	.section	.rodata._.str.1949,"a",@progbits
	.balign	1
	.local	_.str.1949
_.str.1949:
	.asciz	"representing"

	.section	.rodata._.str.1950,"a",@progbits
	.balign	1
	.local	_.str.1950
_.str.1950:
	.asciz	"represents"

	.section	.rodata._.str.1951,"a",@progbits
	.balign	1
	.local	_.str.1951
_.str.1951:
	.asciz	"republican"

	.section	.rodata._.str.1952,"a",@progbits
	.balign	1
	.local	_.str.1952
_.str.1952:
	.asciz	"required"

	.section	.rodata._.str.1953,"a",@progbits
	.balign	1
	.local	_.str.1953
_.str.1953:
	.asciz	"requirement"

	.section	.rodata._.str.1954,"a",@progbits
	.balign	1
	.local	_.str.1954
_.str.1954:
	.asciz	"requires"

	.section	.rodata._.str.1955,"a",@progbits
	.balign	1
	.local	_.str.1955
_.str.1955:
	.asciz	"resampling"

	.section	.rodata._.str.1956,"a",@progbits
	.balign	1
	.local	_.str.1956
_.str.1956:
	.asciz	"research"

	.section	.rodata._.str.1957,"a",@progbits
	.balign	1
	.local	_.str.1957
_.str.1957:
	.asciz	"researched"

	.section	.rodata._.str.1958,"a",@progbits
	.balign	1
	.local	_.str.1958
_.str.1958:
	.asciz	"researcher"

	.section	.rodata._.str.1959,"a",@progbits
	.balign	1
	.local	_.str.1959
_.str.1959:
	.asciz	"researchers"

	.section	.rodata._.str.1960,"a",@progbits
	.balign	1
	.local	_.str.1960
_.str.1960:
	.asciz	"resid"

	.section	.rodata._.str.1961,"a",@progbits
	.balign	1
	.local	_.str.1961
_.str.1961:
	.asciz	"residual"

	.section	.rodata._.str.1962,"a",@progbits
	.balign	1
	.local	_.str.1962
_.str.1962:
	.asciz	"residuals"

	.section	.rodata._.str.1963,"a",@progbits
	.balign	1
	.local	_.str.1963
_.str.1963:
	.asciz	"resistance"

	.section	.rodata._.str.1964,"a",@progbits
	.balign	1
	.local	_.str.1964
_.str.1964:
	.asciz	"resistant"

	.section	.rodata._.str.1965,"a",@progbits
	.balign	1
	.local	_.str.1965
_.str.1965:
	.asciz	"resolution"

	.section	.rodata._.str.1966,"a",@progbits
	.balign	1
	.local	_.str.1966
_.str.1966:
	.asciz	"respect"

	.section	.rodata._.str.1967,"a",@progbits
	.balign	1
	.local	_.str.1967
_.str.1967:
	.asciz	"respective"

	.section	.rodata._.str.1968,"a",@progbits
	.balign	1
	.local	_.str.1968
_.str.1968:
	.asciz	"respond"

	.section	.rodata._.str.1969,"a",@progbits
	.balign	1
	.local	_.str.1969
_.str.1969:
	.asciz	"response"

	.section	.rodata._.str.1970,"a",@progbits
	.balign	1
	.local	_.str.1970
_.str.1970:
	.asciz	"responsible"

	.section	.rodata._.str.1971,"a",@progbits
	.balign	1
	.local	_.str.1971
_.str.1971:
	.asciz	"result"

	.section	.rodata._.str.1972,"a",@progbits
	.balign	1
	.local	_.str.1972
_.str.1972:
	.asciz	"resulting"

	.section	.rodata._.str.1973,"a",@progbits
	.balign	1
	.local	_.str.1973
_.str.1973:
	.asciz	"results"

	.section	.rodata._.str.1974,"a",@progbits
	.balign	1
	.local	_.str.1974
_.str.1974:
	.asciz	"returning"

	.section	.rodata._.str.1975,"a",@progbits
	.balign	1
	.local	_.str.1975
_.str.1975:
	.asciz	"reveal"

	.section	.rodata._.str.1976,"a",@progbits
	.balign	1
	.local	_.str.1976
_.str.1976:
	.asciz	"reverse"

	.section	.rodata._.str.1977,"a",@progbits
	.balign	1
	.local	_.str.1977
_.str.1977:
	.asciz	"reverses"

	.section	.rodata._.str.1978,"a",@progbits
	.balign	1
	.local	_.str.1978
_.str.1978:
	.asciz	"reversing"

	.section	.rodata._.str.1979,"a",@progbits
	.balign	1
	.local	_.str.1979
_.str.1979:
	.asciz	"review"

	.section	.rodata._.str.1980,"a",@progbits
	.balign	1
	.local	_.str.1980
_.str.1980:
	.asciz	"revisited"

	.section	.rodata._.str.1981,"a",@progbits
	.balign	1
	.local	_.str.1981
_.str.1981:
	.asciz	"revolutionized"

	.section	.rodata._.str.1982,"a",@progbits
	.balign	1
	.local	_.str.1982
_.str.1982:
	.asciz	"reweighted"

	.section	.rodata._.str.1983,"a",@progbits
	.balign	1
	.local	_.str.1983
_.str.1983:
	.asciz	"rich"

	.section	.rodata._.str.1984,"a",@progbits
	.balign	1
	.local	_.str.1984
_.str.1984:
	.asciz	"right"

	.section	.rodata._.str.1985,"a",@progbits
	.balign	1
	.local	_.str.1985
_.str.1985:
	.asciz	"rigorous"

	.section	.rodata._.str.1986,"a",@progbits
	.balign	1
	.local	_.str.1986
_.str.1986:
	.asciz	"ring"

	.section	.rodata._.str.1987,"a",@progbits
	.balign	1
	.local	_.str.1987
_.str.1987:
	.asciz	"rings"

	.section	.rodata._.str.1988,"a",@progbits
	.balign	1
	.local	_.str.1988
_.str.1988:
	.asciz	"risk"

	.section	.rodata._.str.1989,"a",@progbits
	.balign	1
	.local	_.str.1989
_.str.1989:
	.asciz	"risks"

	.section	.rodata._.str.1990,"a",@progbits
	.balign	1
	.local	_.str.1990
_.str.1990:
	.asciz	"robot"

	.section	.rodata._.str.1991,"a",@progbits
	.balign	1
	.local	_.str.1991
_.str.1991:
	.asciz	"robust"

	.section	.rodata._.str.1992,"a",@progbits
	.balign	1
	.local	_.str.1992
_.str.1992:
	.asciz	"robustness"

	.section	.rodata._.str.1993,"a",@progbits
	.balign	1
	.local	_.str.1993
_.str.1993:
	.asciz	"roll"

	.section	.rodata._.str.1994,"a",@progbits
	.balign	1
	.local	_.str.1994
_.str.1994:
	.asciz	"rolls"

	.section	.rodata._.str.1995,"a",@progbits
	.balign	1
	.local	_.str.1995
_.str.1995:
	.asciz	"ronald"

	.section	.rodata._.str.1996,"a",@progbits
	.balign	1
	.local	_.str.1996
_.str.1996:
	.asciz	"room"

	.section	.rodata._.str.1997,"a",@progbits
	.balign	1
	.local	_.str.1997
_.str.1997:
	.asciz	"roosevelt"

	.section	.rodata._.str.1998,"a",@progbits
	.balign	1
	.local	_.str.1998
_.str.1998:
	.asciz	"root"

	.section	.rodata._.str.1999,"a",@progbits
	.balign	1
	.local	_.str.1999
_.str.1999:
	.asciz	"rosling"

	.section	.rodata._.str.2000,"a",@progbits
	.balign	1
	.local	_.str.2000
_.str.2000:
	.asciz	"rotations"

	.section	.rodata._.str.2001,"a",@progbits
	.balign	1
	.local	_.str.2001
_.str.2001:
	.asciz	"roughly"

	.section	.rodata._.str.2002,"a",@progbits
	.balign	1
	.local	_.str.2002
_.str.2002:
	.asciz	"rounding"

	.section	.rodata._.str.2003,"a",@progbits
	.balign	1
	.local	_.str.2003
_.str.2003:
	.asciz	"rows"

	.section	.rodata._.str.2004,"a",@progbits
	.balign	1
	.local	_.str.2004
_.str.2004:
	.asciz	"royal"

	.section	.rodata._.str.2005,"a",@progbits
	.balign	1
	.local	_.str.2005
_.str.2005:
	.asciz	"rubric"

	.section	.rodata._.str.2006,"a",@progbits
	.balign	1
	.local	_.str.2006
_.str.2006:
	.asciz	"rubrics"

	.section	.rodata._.str.2007,"a",@progbits
	.balign	1
	.local	_.str.2007
_.str.2007:
	.asciz	"rule"

	.section	.rodata._.str.2008,"a",@progbits
	.balign	1
	.local	_.str.2008
_.str.2008:
	.asciz	"rules"

	.section	.rodata._.str.2009,"a",@progbits
	.balign	1
	.local	_.str.2009
_.str.2009:
	.asciz	"runs"

	.section	.rodata._.str.2010,"a",@progbits
	.balign	1
	.local	_.str.2010
_.str.2010:
	.asciz	"russian"

	.section	.rodata._.str.2011,"a",@progbits
	.balign	1
	.local	_.str.2011
_.str.2011:
	.asciz	"saga"

	.section	.rodata._.str.2012,"a",@progbits
	.balign	1
	.local	_.str.2012
_.str.2012:
	.asciz	"said"

	.section	.rodata._.str.2013,"a",@progbits
	.balign	1
	.local	_.str.2013
_.str.2013:
	.asciz	"salaries"

	.section	.rodata._.str.2014,"a",@progbits
	.balign	1
	.local	_.str.2014
_.str.2014:
	.asciz	"salk"

	.section	.rodata._.str.2015,"a",@progbits
	.balign	1
	.local	_.str.2015
_.str.2015:
	.asciz	"sally"

	.section	.rodata._.str.2016,"a",@progbits
	.balign	1
	.local	_.str.2016
_.str.2016:
	.asciz	"same"

	.section	.rodata._.str.2017,"a",@progbits
	.balign	1
	.local	_.str.2017
_.str.2017:
	.asciz	"sample"

	.section	.rodata._.str.2018,"a",@progbits
	.balign	1
	.local	_.str.2018
_.str.2018:
	.asciz	"sampled"

	.section	.rodata._.str.2019,"a",@progbits
	.balign	1
	.local	_.str.2019
_.str.2019:
	.asciz	"samples"

	.section	.rodata._.str.2020,"a",@progbits
	.balign	1
	.local	_.str.2020
_.str.2020:
	.asciz	"sampling"

	.section	.rodata._.str.2021,"a",@progbits
	.balign	1
	.local	_.str.2021
_.str.2021:
	.asciz	"satisfies"

	.section	.rodata._.str.2022,"a",@progbits
	.balign	1
	.local	_.str.2022
_.str.2022:
	.asciz	"save"

	.section	.rodata._.str.2023,"a",@progbits
	.balign	1
	.local	_.str.2023
_.str.2023:
	.asciz	"saved"

	.section	.rodata._.str.2024,"a",@progbits
	.balign	1
	.local	_.str.2024
_.str.2024:
	.asciz	"saying"

	.section	.rodata._.str.2025,"a",@progbits
	.balign	1
	.local	_.str.2025
_.str.2025:
	.asciz	"says"

	.section	.rodata._.str.2026,"a",@progbits
	.balign	1
	.local	_.str.2026
_.str.2026:
	.asciz	"scaffolded"

	.section	.rodata._.str.2027,"a",@progbits
	.balign	1
	.local	_.str.2027
_.str.2027:
	.asciz	"scalar"

	.section	.rodata._.str.2028,"a",@progbits
	.balign	1
	.local	_.str.2028
_.str.2028:
	.asciz	"scale"

	.section	.rodata._.str.2029,"a",@progbits
	.balign	1
	.local	_.str.2029
_.str.2029:
	.asciz	"scales"

	.section	.rodata._.str.2030,"a",@progbits
	.balign	1
	.local	_.str.2030
_.str.2030:
	.asciz	"scatter"

	.section	.rodata._.str.2031,"a",@progbits
	.balign	1
	.local	_.str.2031
_.str.2031:
	.asciz	"scatterplot"

	.section	.rodata._.str.2032,"a",@progbits
	.balign	1
	.local	_.str.2032
_.str.2032:
	.asciz	"scatterplots"

	.section	.rodata._.str.2033,"a",@progbits
	.balign	1
	.local	_.str.2033
_.str.2033:
	.asciz	"scenario"

	.section	.rodata._.str.2034,"a",@progbits
	.balign	1
	.local	_.str.2034
_.str.2034:
	.asciz	"scenarios"

	.section	.rodata._.str.2035,"a",@progbits
	.balign	1
	.local	_.str.2035
_.str.2035:
	.asciz	"schools"

	.section	.rodata._.str.2036,"a",@progbits
	.balign	1
	.local	_.str.2036
_.str.2036:
	.asciz	"science"

	.section	.rodata._.str.2037,"a",@progbits
	.balign	1
	.local	_.str.2037
_.str.2037:
	.asciz	"sciences"

	.section	.rodata._.str.2038,"a",@progbits
	.balign	1
	.local	_.str.2038
_.str.2038:
	.asciz	"scientific"

	.section	.rodata._.str.2039,"a",@progbits
	.balign	1
	.local	_.str.2039
_.str.2039:
	.asciz	"scope"

	.section	.rodata._.str.2040,"a",@progbits
	.balign	1
	.local	_.str.2040
_.str.2040:
	.asciz	"score"

	.section	.rodata._.str.2041,"a",@progbits
	.balign	1
	.local	_.str.2041
_.str.2041:
	.asciz	"scored"

	.section	.rodata._.str.2042,"a",@progbits
	.balign	1
	.local	_.str.2042
_.str.2042:
	.asciz	"scores"

	.section	.rodata._.str.2043,"a",@progbits
	.balign	1
	.local	_.str.2043
_.str.2043:
	.asciz	"scoring"

	.section	.rodata._.str.2044,"a",@progbits
	.balign	1
	.local	_.str.2044
_.str.2044:
	.asciz	"screen"

	.section	.rodata._.str.2045,"a",@progbits
	.balign	1
	.local	_.str.2045
_.str.2045:
	.asciz	"sd"

	.section	.rodata._.str.2046,"a",@progbits
	.balign	1
	.local	_.str.2046
_.str.2046:
	.asciz	"se_b"

	.section	.rodata._.str.2047,"a",@progbits
	.balign	1
	.local	_.str.2047
_.str.2047:
	.asciz	"sealy"

	.section	.rodata._.str.2048,"a",@progbits
	.balign	1
	.local	_.str.2048
_.str.2048:
	.asciz	"seasonal"

	.section	.rodata._.str.2049,"a",@progbits
	.balign	1
	.local	_.str.2049
_.str.2049:
	.asciz	"second"

	.section	.rodata._.str.2050,"a",@progbits
	.balign	1
	.local	_.str.2050
_.str.2050:
	.asciz	"seconds"

	.section	.rodata._.str.2051,"a",@progbits
	.balign	1
	.local	_.str.2051
_.str.2051:
	.asciz	"secret"

	.section	.rodata._.str.2052,"a",@progbits
	.balign	1
	.local	_.str.2052
_.str.2052:
	.asciz	"secrets"

	.section	.rodata._.str.2053,"a",@progbits
	.balign	1
	.local	_.str.2053
_.str.2053:
	.asciz	"section"

	.section	.rodata._.str.2054,"a",@progbits
	.balign	1
	.local	_.str.2054
_.str.2054:
	.asciz	"sections"

	.section	.rodata._.str.2055,"a",@progbits
	.balign	1
	.local	_.str.2055
_.str.2055:
	.asciz	"secure"

	.section	.rodata._.str.2056,"a",@progbits
	.balign	1
	.local	_.str.2056
_.str.2056:
	.asciz	"seed"

	.section	.rodata._.str.2057,"a",@progbits
	.balign	1
	.local	_.str.2057
_.str.2057:
	.asciz	"seeing"

	.section	.rodata._.str.2058,"a",@progbits
	.balign	1
	.local	_.str.2058
_.str.2058:
	.asciz	"seen"

	.section	.rodata._.str.2059,"a",@progbits
	.balign	1
	.local	_.str.2059
_.str.2059:
	.asciz	"select"

	.section	.rodata._.str.2060,"a",@progbits
	.balign	1
	.local	_.str.2060
_.str.2060:
	.asciz	"selected"

	.section	.rodata._.str.2061,"a",@progbits
	.balign	1
	.local	_.str.2061
_.str.2061:
	.asciz	"selecting"

	.section	.rodata._.str.2062,"a",@progbits
	.balign	1
	.local	_.str.2062
_.str.2062:
	.asciz	"selection"

	.section	.rodata._.str.2063,"a",@progbits
	.balign	1
	.local	_.str.2063
_.str.2063:
	.asciz	"semi"

	.section	.rodata._.str.2064,"a",@progbits
	.balign	1
	.local	_.str.2064
_.str.2064:
	.asciz	"sense"

	.section	.rodata._.str.2065,"a",@progbits
	.balign	1
	.local	_.str.2065
_.str.2065:
	.asciz	"sensitive"

	.section	.rodata._.str.2066,"a",@progbits
	.balign	1
	.local	_.str.2066
_.str.2066:
	.asciz	"sensitivity"

	.section	.rodata._.str.2067,"a",@progbits
	.balign	1
	.local	_.str.2067
_.str.2067:
	.asciz	"sent"

	.section	.rodata._.str.2068,"a",@progbits
	.balign	1
	.local	_.str.2068
_.str.2068:
	.asciz	"sentence"

	.section	.rodata._.str.2069,"a",@progbits
	.balign	1
	.local	_.str.2069
_.str.2069:
	.asciz	"sentences"

	.section	.rodata._.str.2070,"a",@progbits
	.balign	1
	.local	_.str.2070
_.str.2070:
	.asciz	"sentiment"

	.section	.rodata._.str.2071,"a",@progbits
	.balign	1
	.local	_.str.2071
_.str.2071:
	.asciz	"separate"

	.section	.rodata._.str.2072,"a",@progbits
	.balign	1
	.local	_.str.2072
_.str.2072:
	.asciz	"separated"

	.section	.rodata._.str.2073,"a",@progbits
	.balign	1
	.local	_.str.2073
_.str.2073:
	.asciz	"sequence"

	.section	.rodata._.str.2074,"a",@progbits
	.balign	1
	.local	_.str.2074
_.str.2074:
	.asciz	"sequences"

	.section	.rodata._.str.2075,"a",@progbits
	.balign	1
	.local	_.str.2075
_.str.2075:
	.asciz	"series"

	.section	.rodata._.str.2076,"a",@progbits
	.balign	1
	.local	_.str.2076
_.str.2076:
	.asciz	"serves"

	.section	.rodata._.str.2077,"a",@progbits
	.balign	1
	.local	_.str.2077
_.str.2077:
	.asciz	"sets"

	.section	.rodata._.str.2078,"a",@progbits
	.balign	1
	.local	_.str.2078
_.str.2078:
	.asciz	"setting"

	.section	.rodata._.str.2079,"a",@progbits
	.balign	1
	.local	_.str.2079
_.str.2079:
	.asciz	"setup"

	.section	.rodata._.str.2080,"a",@progbits
	.balign	1
	.local	_.str.2080
_.str.2080:
	.asciz	"several"

	.section	.rodata._.str.2081,"a",@progbits
	.balign	1
	.local	_.str.2081
_.str.2081:
	.asciz	"severity"

	.section	.rodata._.str.2082,"a",@progbits
	.balign	1
	.local	_.str.2082
_.str.2082:
	.asciz	"shade"

	.section	.rodata._.str.2083,"a",@progbits
	.balign	1
	.local	_.str.2083
_.str.2083:
	.asciz	"shading"

	.section	.rodata._.str.2084,"a",@progbits
	.balign	1
	.local	_.str.2084
_.str.2084:
	.asciz	"shannon"

	.section	.rodata._.str.2085,"a",@progbits
	.balign	1
	.local	_.str.2085
_.str.2085:
	.asciz	"shape"

	.section	.rodata._.str.2086,"a",@progbits
	.balign	1
	.local	_.str.2086
_.str.2086:
	.asciz	"shaped"

	.section	.rodata._.str.2087,"a",@progbits
	.balign	1
	.local	_.str.2087
_.str.2087:
	.asciz	"share"

	.section	.rodata._.str.2088,"a",@progbits
	.balign	1
	.local	_.str.2088
_.str.2088:
	.asciz	"shared"

	.section	.rodata._.str.2089,"a",@progbits
	.balign	1
	.local	_.str.2089
_.str.2089:
	.asciz	"sheet"

	.section	.rodata._.str.2090,"a",@progbits
	.balign	1
	.local	_.str.2090
_.str.2090:
	.asciz	"shift"

	.section	.rodata._.str.2091,"a",@progbits
	.balign	1
	.local	_.str.2091
_.str.2091:
	.asciz	"shifted"

	.section	.rodata._.str.2092,"a",@progbits
	.balign	1
	.local	_.str.2092
_.str.2092:
	.asciz	"shifting"

	.section	.rodata._.str.2093,"a",@progbits
	.balign	1
	.local	_.str.2093
_.str.2093:
	.asciz	"shoes"

	.section	.rodata._.str.2094,"a",@progbits
	.balign	1
	.local	_.str.2094
_.str.2094:
	.asciz	"shooting"

	.section	.rodata._.str.2095,"a",@progbits
	.balign	1
	.local	_.str.2095
_.str.2095:
	.asciz	"short"

	.section	.rodata._.str.2096,"a",@progbits
	.balign	1
	.local	_.str.2096
_.str.2096:
	.asciz	"shot"

	.section	.rodata._.str.2097,"a",@progbits
	.balign	1
	.local	_.str.2097
_.str.2097:
	.asciz	"shots"

	.section	.rodata._.str.2098,"a",@progbits
	.balign	1
	.local	_.str.2098
_.str.2098:
	.asciz	"should"

	.section	.rodata._.str.2099,"a",@progbits
	.balign	1
	.local	_.str.2099
_.str.2099:
	.asciz	"show"

	.section	.rodata._.str.2100,"a",@progbits
	.balign	1
	.local	_.str.2100
_.str.2100:
	.asciz	"showed"

	.section	.rodata._.str.2101,"a",@progbits
	.balign	1
	.local	_.str.2101
_.str.2101:
	.asciz	"showing"

	.section	.rodata._.str.2102,"a",@progbits
	.balign	1
	.local	_.str.2102
_.str.2102:
	.asciz	"shown"

	.section	.rodata._.str.2103,"a",@progbits
	.balign	1
	.local	_.str.2103
_.str.2103:
	.asciz	"shows"

	.section	.rodata._.str.2104,"a",@progbits
	.balign	1
	.local	_.str.2104
_.str.2104:
	.asciz	"shuffle"

	.section	.rodata._.str.2105,"a",@progbits
	.balign	1
	.local	_.str.2105
_.str.2105:
	.asciz	"shuffling"

	.section	.rodata._.str.2106,"a",@progbits
	.balign	1
	.local	_.str.2106
_.str.2106:
	.asciz	"shuttle"

	.section	.rodata._.str.2107,"a",@progbits
	.balign	1
	.local	_.str.2107
_.str.2107:
	.asciz	"side"

	.section	.rodata._.str.2108,"a",@progbits
	.balign	1
	.local	_.str.2108
_.str.2108:
	.asciz	"sided"

	.section	.rodata._.str.2109,"a",@progbits
	.balign	1
	.local	_.str.2109
_.str.2109:
	.asciz	"sids"

	.section	.rodata._.str.2110,"a",@progbits
	.balign	1
	.local	_.str.2110
_.str.2110:
	.asciz	"sigma"

	.section	.rodata._.str.2111,"a",@progbits
	.balign	1
	.local	_.str.2111
_.str.2111:
	.asciz	"sigma1"

	.section	.rodata._.str.2112,"a",@progbits
	.balign	1
	.local	_.str.2112
_.str.2112:
	.asciz	"sigma2"

	.section	.rodata._.str.2113,"a",@progbits
	.balign	1
	.local	_.str.2113
_.str.2113:
	.asciz	"sigma_phat"

	.section	.rodata._.str.2114,"a",@progbits
	.balign	1
	.local	_.str.2114
_.str.2114:
	.asciz	"sigma_x"

	.section	.rodata._.str.2115,"a",@progbits
	.balign	1
	.local	_.str.2115
_.str.2115:
	.asciz	"sigma_xbar"

	.section	.rodata._.str.2116,"a",@progbits
	.balign	1
	.local	_.str.2116
_.str.2116:
	.asciz	"sigma_y"

	.section	.rodata._.str.2117,"a",@progbits
	.balign	1
	.local	_.str.2117
_.str.2117:
	.asciz	"sign"

	.section	.rodata._.str.2118,"a",@progbits
	.balign	1
	.local	_.str.2118
_.str.2118:
	.asciz	"signal"

	.section	.rodata._.str.2119,"a",@progbits
	.balign	1
	.local	_.str.2119
_.str.2119:
	.asciz	"significance"

	.section	.rodata._.str.2120,"a",@progbits
	.balign	1
	.local	_.str.2120
_.str.2120:
	.asciz	"significant"

	.section	.rodata._.str.2121,"a",@progbits
	.balign	1
	.local	_.str.2121
_.str.2121:
	.asciz	"significantly"

	.section	.rodata._.str.2122,"a",@progbits
	.balign	1
	.local	_.str.2122
_.str.2122:
	.asciz	"silver"

	.section	.rodata._.str.2123,"a",@progbits
	.balign	1
	.local	_.str.2123
_.str.2123:
	.asciz	"similar"

	.section	.rodata._.str.2124,"a",@progbits
	.balign	1
	.local	_.str.2124
_.str.2124:
	.asciz	"similarities"

	.section	.rodata._.str.2125,"a",@progbits
	.balign	1
	.local	_.str.2125
_.str.2125:
	.asciz	"simple"

	.section	.rodata._.str.2126,"a",@progbits
	.balign	1
	.local	_.str.2126
_.str.2126:
	.asciz	"simplest"

	.section	.rodata._.str.2127,"a",@progbits
	.balign	1
	.local	_.str.2127
_.str.2127:
	.asciz	"simply"

	.section	.rodata._.str.2128,"a",@progbits
	.balign	1
	.local	_.str.2128
_.str.2128:
	.asciz	"simpson"

	.section	.rodata._.str.2129,"a",@progbits
	.balign	1
	.local	_.str.2129
_.str.2129:
	.asciz	"simulate"

	.section	.rodata._.str.2130,"a",@progbits
	.balign	1
	.local	_.str.2130
_.str.2130:
	.asciz	"simulation"

	.section	.rodata._.str.2131,"a",@progbits
	.balign	1
	.local	_.str.2131
_.str.2131:
	.asciz	"simulations"

	.section	.rodata._.str.2132,"a",@progbits
	.balign	1
	.local	_.str.2132
_.str.2132:
	.asciz	"simultaneous"

	.section	.rodata._.str.2133,"a",@progbits
	.balign	1
	.local	_.str.2133
_.str.2133:
	.asciz	"simultaneously"

	.section	.rodata._.str.2134,"a",@progbits
	.balign	1
	.local	_.str.2134
_.str.2134:
	.asciz	"since"

	.section	.rodata._.str.2135,"a",@progbits
	.balign	1
	.local	_.str.2135
_.str.2135:
	.asciz	"single"

	.section	.rodata._.str.2136,"a",@progbits
	.balign	1
	.local	_.str.2136
_.str.2136:
	.asciz	"situation"

	.section	.rodata._.str.2137,"a",@progbits
	.balign	1
	.local	_.str.2137
_.str.2137:
	.asciz	"situations"

	.section	.rodata._.str.2138,"a",@progbits
	.balign	1
	.local	_.str.2138
_.str.2138:
	.asciz	"size"

	.section	.rodata._.str.2139,"a",@progbits
	.balign	1
	.local	_.str.2139
_.str.2139:
	.asciz	"sized"

	.section	.rodata._.str.2140,"a",@progbits
	.balign	1
	.local	_.str.2140
_.str.2140:
	.asciz	"sizes"

	.section	.rodata._.str.2141,"a",@progbits
	.balign	1
	.local	_.str.2141
_.str.2141:
	.asciz	"sketch"

	.section	.rodata._.str.2142,"a",@progbits
	.balign	1
	.local	_.str.2142
_.str.2142:
	.asciz	"skew"

	.section	.rodata._.str.2143,"a",@progbits
	.balign	1
	.local	_.str.2143
_.str.2143:
	.asciz	"skewed"

	.section	.rodata._.str.2144,"a",@progbits
	.balign	1
	.local	_.str.2144
_.str.2144:
	.asciz	"skewness"

	.section	.rodata._.str.2145,"a",@progbits
	.balign	1
	.local	_.str.2145
_.str.2145:
	.asciz	"skip"

	.section	.rodata._.str.2146,"a",@progbits
	.balign	1
	.local	_.str.2146
_.str.2146:
	.asciz	"skipping"

	.section	.rodata._.str.2147,"a",@progbits
	.balign	1
	.local	_.str.2147
_.str.2147:
	.asciz	"skittles"

	.section	.rodata._.str.2148,"a",@progbits
	.balign	1
	.local	_.str.2148
_.str.2148:
	.asciz	"sleep"

	.section	.rodata._.str.2149,"a",@progbits
	.balign	1
	.local	_.str.2149
_.str.2149:
	.asciz	"slightly"

	.section	.rodata._.str.2150,"a",@progbits
	.balign	1
	.local	_.str.2150
_.str.2150:
	.asciz	"slips"

	.section	.rodata._.str.2151,"a",@progbits
	.balign	1
	.local	_.str.2151
_.str.2151:
	.asciz	"slope"

	.section	.rodata._.str.2152,"a",@progbits
	.balign	1
	.local	_.str.2152
_.str.2152:
	.asciz	"small"

	.section	.rodata._.str.2153,"a",@progbits
	.balign	1
	.local	_.str.2153
_.str.2153:
	.asciz	"smaller"

	.section	.rodata._.str.2154,"a",@progbits
	.balign	1
	.local	_.str.2154
_.str.2154:
	.asciz	"smallest"

	.section	.rodata._.str.2155,"a",@progbits
	.balign	1
	.local	_.str.2155
_.str.2155:
	.asciz	"smirnov"

	.section	.rodata._.str.2156,"a",@progbits
	.balign	1
	.local	_.str.2156
_.str.2156:
	.asciz	"smoking"

	.section	.rodata._.str.2157,"a",@progbits
	.balign	1
	.local	_.str.2157
_.str.2157:
	.asciz	"social"

	.section	.rodata._.str.2158,"a",@progbits
	.balign	1
	.local	_.str.2158
_.str.2158:
	.asciz	"society"

	.section	.rodata._.str.2159,"a",@progbits
	.balign	1
	.local	_.str.2159
_.str.2159:
	.asciz	"socs"

	.section	.rodata._.str.2160,"a",@progbits
	.balign	1
	.local	_.str.2160
_.str.2160:
	.asciz	"software"

	.section	.rodata._.str.2161,"a",@progbits
	.balign	1
	.local	_.str.2161
_.str.2161:
	.asciz	"soldiers"

	.section	.rodata._.str.2162,"a",@progbits
	.balign	1
	.local	_.str.2162
_.str.2162:
	.asciz	"solve"

	.section	.rodata._.str.2163,"a",@progbits
	.balign	1
	.local	_.str.2163
_.str.2163:
	.asciz	"solver"

	.section	.rodata._.str.2164,"a",@progbits
	.balign	1
	.local	_.str.2164
_.str.2164:
	.asciz	"solves"

	.section	.rodata._.str.2165,"a",@progbits
	.balign	1
	.local	_.str.2165
_.str.2165:
	.asciz	"solving"

	.section	.rodata._.str.2166,"a",@progbits
	.balign	1
	.local	_.str.2166
_.str.2166:
	.asciz	"some"

	.section	.rodata._.str.2167,"a",@progbits
	.balign	1
	.local	_.str.2167
_.str.2167:
	.asciz	"somehow"

	.section	.rodata._.str.2168,"a",@progbits
	.balign	1
	.local	_.str.2168
_.str.2168:
	.asciz	"someone"

	.section	.rodata._.str.2169,"a",@progbits
	.balign	1
	.local	_.str.2169
_.str.2169:
	.asciz	"something"

	.section	.rodata._.str.2170,"a",@progbits
	.balign	1
	.local	_.str.2170
_.str.2170:
	.asciz	"sometimes"

	.section	.rodata._.str.2171,"a",@progbits
	.balign	1
	.local	_.str.2171
_.str.2171:
	.asciz	"sort"

	.section	.rodata._.str.2172,"a",@progbits
	.balign	1
	.local	_.str.2172
_.str.2172:
	.asciz	"sound"

	.section	.rodata._.str.2173,"a",@progbits
	.balign	1
	.local	_.str.2173
_.str.2173:
	.asciz	"sources"

	.section	.rodata._.str.2174,"a",@progbits
	.balign	1
	.local	_.str.2174
_.str.2174:
	.asciz	"space"

	.section	.rodata._.str.2175,"a",@progbits
	.balign	1
	.local	_.str.2175
_.str.2175:
	.asciz	"spam"

	.section	.rodata._.str.2176,"a",@progbits
	.balign	1
	.local	_.str.2176
_.str.2176:
	.asciz	"span"

	.section	.rodata._.str.2177,"a",@progbits
	.balign	1
	.local	_.str.2177
_.str.2177:
	.asciz	"spearman"

	.section	.rodata._.str.2178,"a",@progbits
	.balign	1
	.local	_.str.2178
_.str.2178:
	.asciz	"specialist"

	.section	.rodata._.str.2179,"a",@progbits
	.balign	1
	.local	_.str.2179
_.str.2179:
	.asciz	"specific"

	.section	.rodata._.str.2180,"a",@progbits
	.balign	1
	.local	_.str.2180
_.str.2180:
	.asciz	"specifically"

	.section	.rodata._.str.2181,"a",@progbits
	.balign	1
	.local	_.str.2181
_.str.2181:
	.asciz	"specificity"

	.section	.rodata._.str.2182,"a",@progbits
	.balign	1
	.local	_.str.2182
_.str.2182:
	.asciz	"specified"

	.section	.rodata._.str.2183,"a",@progbits
	.balign	1
	.local	_.str.2183
_.str.2183:
	.asciz	"specify"

	.section	.rodata._.str.2184,"a",@progbits
	.balign	1
	.local	_.str.2184
_.str.2184:
	.asciz	"speed"

	.section	.rodata._.str.2185,"a",@progbits
	.balign	1
	.local	_.str.2185
_.str.2185:
	.asciz	"spend"

	.section	.rodata._.str.2186,"a",@progbits
	.balign	1
	.local	_.str.2186
_.str.2186:
	.asciz	"spent"

	.section	.rodata._.str.2187,"a",@progbits
	.balign	1
	.local	_.str.2187
_.str.2187:
	.asciz	"spiegelhalter"

	.section	.rodata._.str.2188,"a",@progbits
	.balign	1
	.local	_.str.2188
_.str.2188:
	.asciz	"split"

	.section	.rodata._.str.2189,"a",@progbits
	.balign	1
	.local	_.str.2189
_.str.2189:
	.asciz	"splitting"

	.section	.rodata._.str.2190,"a",@progbits
	.balign	1
	.local	_.str.2190
_.str.2190:
	.asciz	"sports"

	.section	.rodata._.str.2191,"a",@progbits
	.balign	1
	.local	_.str.2191
_.str.2191:
	.asciz	"spread"

	.section	.rodata._.str.2192,"a",@progbits
	.balign	1
	.local	_.str.2192
_.str.2192:
	.asciz	"spreads"

	.section	.rodata._.str.2193,"a",@progbits
	.balign	1
	.local	_.str.2193
_.str.2193:
	.asciz	"spss"

	.section	.rodata._.str.2194,"a",@progbits
	.balign	1
	.local	_.str.2194
_.str.2194:
	.asciz	"sqrt"

	.section	.rodata._.str.2195,"a",@progbits
	.balign	1
	.local	_.str.2195
_.str.2195:
	.asciz	"square"

	.section	.rodata._.str.2196,"a",@progbits
	.balign	1
	.local	_.str.2196
_.str.2196:
	.asciz	"squared"

	.section	.rodata._.str.2197,"a",@progbits
	.balign	1
	.local	_.str.2197
_.str.2197:
	.asciz	"squares"

	.section	.rodata._.str.2198,"a",@progbits
	.balign	1
	.local	_.str.2198
_.str.2198:
	.asciz	"stage"

	.section	.rodata._.str.2199,"a",@progbits
	.balign	1
	.local	_.str.2199
_.str.2199:
	.asciz	"stakes"

	.section	.rodata._.str.2200,"a",@progbits
	.balign	1
	.local	_.str.2200
_.str.2200:
	.asciz	"stand"

	.section	.rodata._.str.2201,"a",@progbits
	.balign	1
	.local	_.str.2201
_.str.2201:
	.asciz	"standard"

	.section	.rodata._.str.2202,"a",@progbits
	.balign	1
	.local	_.str.2202
_.str.2202:
	.asciz	"standardize"

	.section	.rodata._.str.2203,"a",@progbits
	.balign	1
	.local	_.str.2203
_.str.2203:
	.asciz	"standardized"

	.section	.rodata._.str.2204,"a",@progbits
	.balign	1
	.local	_.str.2204
_.str.2204:
	.asciz	"standardizes"

	.section	.rodata._.str.2205,"a",@progbits
	.balign	1
	.local	_.str.2205
_.str.2205:
	.asciz	"standardizing"

	.section	.rodata._.str.2206,"a",@progbits
	.balign	1
	.local	_.str.2206
_.str.2206:
	.asciz	"star"

	.section	.rodata._.str.2207,"a",@progbits
	.balign	1
	.local	_.str.2207
_.str.2207:
	.asciz	"stark"

	.section	.rodata._.str.2208,"a",@progbits
	.balign	1
	.local	_.str.2208
_.str.2208:
	.asciz	"start"

	.section	.rodata._.str.2209,"a",@progbits
	.balign	1
	.local	_.str.2209
_.str.2209:
	.asciz	"started"

	.section	.rodata._.str.2210,"a",@progbits
	.balign	1
	.local	_.str.2210
_.str.2210:
	.asciz	"starting"

	.section	.rodata._.str.2211,"a",@progbits
	.balign	1
	.local	_.str.2211
_.str.2211:
	.asciz	"starts"

	.section	.rodata._.str.2212,"a",@progbits
	.balign	1
	.local	_.str.2212
_.str.2212:
	.asciz	"stat"

	.section	.rodata._.str.2213,"a",@progbits
	.balign	1
	.local	_.str.2213
_.str.2213:
	.asciz	"state"

	.section	.rodata._.str.2214,"a",@progbits
	.balign	1
	.local	_.str.2214
_.str.2214:
	.asciz	"stated"

	.section	.rodata._.str.2215,"a",@progbits
	.balign	1
	.local	_.str.2215
_.str.2215:
	.asciz	"statement"

	.section	.rodata._.str.2216,"a",@progbits
	.balign	1
	.local	_.str.2216
_.str.2216:
	.asciz	"states"

	.section	.rodata._.str.2217,"a",@progbits
	.balign	1
	.local	_.str.2217
_.str.2217:
	.asciz	"stating"

	.section	.rodata._.str.2218,"a",@progbits
	.balign	1
	.local	_.str.2218
_.str.2218:
	.asciz	"statistic"

	.section	.rodata._.str.2219,"a",@progbits
	.balign	1
	.local	_.str.2219
_.str.2219:
	.asciz	"statistical"

	.section	.rodata._.str.2220,"a",@progbits
	.balign	1
	.local	_.str.2220
_.str.2220:
	.asciz	"statistically"

	.section	.rodata._.str.2221,"a",@progbits
	.balign	1
	.local	_.str.2221
_.str.2221:
	.asciz	"statisticians"

	.section	.rodata._.str.2222,"a",@progbits
	.balign	1
	.local	_.str.2222
_.str.2222:
	.asciz	"statistics"

	.section	.rodata._.str.2223,"a",@progbits
	.balign	1
	.local	_.str.2223
_.str.2223:
	.asciz	"stats"

	.section	.rodata._.str.2224,"a",@progbits
	.balign	1
	.local	_.str.2224
_.str.2224:
	.asciz	"statsmedic"

	.section	.rodata._.str.2225,"a",@progbits
	.balign	1
	.local	_.str.2225
_.str.2225:
	.asciz	"status"

	.section	.rodata._.str.2226,"a",@progbits
	.balign	1
	.local	_.str.2226
_.str.2226:
	.asciz	"stay"

	.section	.rodata._.str.2227,"a",@progbits
	.balign	1
	.local	_.str.2227
_.str.2227:
	.asciz	"stayed"

	.section	.rodata._.str.2228,"a",@progbits
	.balign	1
	.local	_.str.2228
_.str.2228:
	.asciz	"staying"

	.section	.rodata._.str.2229,"a",@progbits
	.balign	1
	.local	_.str.2229
_.str.2229:
	.asciz	"stays"

	.section	.rodata._.str.2230,"a",@progbits
	.balign	1
	.local	_.str.2230
_.str.2230:
	.asciz	"stella"

	.section	.rodata._.str.2231,"a",@progbits
	.balign	1
	.local	_.str.2231
_.str.2231:
	.asciz	"stem"

	.section	.rodata._.str.2232,"a",@progbits
	.balign	1
	.local	_.str.2232
_.str.2232:
	.asciz	"stemplot"

	.section	.rodata._.str.2233,"a",@progbits
	.balign	1
	.local	_.str.2233
_.str.2233:
	.asciz	"stemplots"

	.section	.rodata._.str.2234,"a",@progbits
	.balign	1
	.local	_.str.2234
_.str.2234:
	.asciz	"step"

	.section	.rodata._.str.2235,"a",@progbits
	.balign	1
	.local	_.str.2235
_.str.2235:
	.asciz	"steps"

	.section	.rodata._.str.2236,"a",@progbits
	.balign	1
	.local	_.str.2236
_.str.2236:
	.asciz	"still"

	.section	.rodata._.str.2237,"a",@progbits
	.balign	1
	.local	_.str.2237
_.str.2237:
	.asciz	"stochastic"

	.section	.rodata._.str.2238,"a",@progbits
	.balign	1
	.local	_.str.2238
_.str.2238:
	.asciz	"stock"

	.section	.rodata._.str.2239,"a",@progbits
	.balign	1
	.local	_.str.2239
_.str.2239:
	.asciz	"stone"

	.section	.rodata._.str.2240,"a",@progbits
	.balign	1
	.local	_.str.2240
_.str.2240:
	.asciz	"stones"

	.section	.rodata._.str.2241,"a",@progbits
	.balign	1
	.local	_.str.2241
_.str.2241:
	.asciz	"stopped"

	.section	.rodata._.str.2242,"a",@progbits
	.balign	1
	.local	_.str.2242
_.str.2242:
	.asciz	"stopping"

	.section	.rodata._.str.2243,"a",@progbits
	.balign	1
	.local	_.str.2243
_.str.2243:
	.asciz	"storage"

	.section	.rodata._.str.2244,"a",@progbits
	.balign	1
	.local	_.str.2244
_.str.2244:
	.asciz	"store"

	.section	.rodata._.str.2245,"a",@progbits
	.balign	1
	.local	_.str.2245
_.str.2245:
	.asciz	"stored"

	.section	.rodata._.str.2246,"a",@progbits
	.balign	1
	.local	_.str.2246
_.str.2246:
	.asciz	"stores"

	.section	.rodata._.str.2247,"a",@progbits
	.balign	1
	.local	_.str.2247
_.str.2247:
	.asciz	"story"

	.section	.rodata._.str.2248,"a",@progbits
	.balign	1
	.local	_.str.2248
_.str.2248:
	.asciz	"storyteller"

	.section	.rodata._.str.2249,"a",@progbits
	.balign	1
	.local	_.str.2249
_.str.2249:
	.asciz	"storytelling"

	.section	.rodata._.str.2250,"a",@progbits
	.balign	1
	.local	_.str.2250
_.str.2250:
	.asciz	"straight"

	.section	.rodata._.str.2251,"a",@progbits
	.balign	1
	.local	_.str.2251
_.str.2251:
	.asciz	"strata"

	.section	.rodata._.str.2252,"a",@progbits
	.balign	1
	.local	_.str.2252
_.str.2252:
	.asciz	"strategies"

	.section	.rodata._.str.2253,"a",@progbits
	.balign	1
	.local	_.str.2253
_.str.2253:
	.asciz	"strategy"

	.section	.rodata._.str.2254,"a",@progbits
	.balign	1
	.local	_.str.2254
_.str.2254:
	.asciz	"stratified"

	.section	.rodata._.str.2255,"a",@progbits
	.balign	1
	.local	_.str.2255
_.str.2255:
	.asciz	"stratifying"

	.section	.rodata._.str.2256,"a",@progbits
	.balign	1
	.local	_.str.2256
_.str.2256:
	.asciz	"streak"

	.section	.rodata._.str.2257,"a",@progbits
	.balign	1
	.local	_.str.2257
_.str.2257:
	.asciz	"strength"

	.section	.rodata._.str.2258,"a",@progbits
	.balign	1
	.local	_.str.2258
_.str.2258:
	.asciz	"string"

	.section	.rodata._.str.2259,"a",@progbits
	.balign	1
	.local	_.str.2259
_.str.2259:
	.asciz	"strong"

	.section	.rodata._.str.2260,"a",@progbits
	.balign	1
	.local	_.str.2260
_.str.2260:
	.asciz	"strongly"

	.section	.rodata._.str.2261,"a",@progbits
	.balign	1
	.local	_.str.2261
_.str.2261:
	.asciz	"student"

	.section	.rodata._.str.2262,"a",@progbits
	.balign	1
	.local	_.str.2262
_.str.2262:
	.asciz	"students"

	.section	.rodata._.str.2263,"a",@progbits
	.balign	1
	.local	_.str.2263
_.str.2263:
	.asciz	"studied"

	.section	.rodata._.str.2264,"a",@progbits
	.balign	1
	.local	_.str.2264
_.str.2264:
	.asciz	"studies"

	.section	.rodata._.str.2265,"a",@progbits
	.balign	1
	.local	_.str.2265
_.str.2265:
	.asciz	"study"

	.section	.rodata._.str.2266,"a",@progbits
	.balign	1
	.local	_.str.2266
_.str.2266:
	.asciz	"studying"

	.section	.rodata._.str.2267,"a",@progbits
	.balign	1
	.local	_.str.2267
_.str.2267:
	.asciz	"subgroup"

	.section	.rodata._.str.2268,"a",@progbits
	.balign	1
	.local	_.str.2268
_.str.2268:
	.asciz	"subject"

	.section	.rodata._.str.2269,"a",@progbits
	.balign	1
	.local	_.str.2269
_.str.2269:
	.asciz	"subjects"

	.section	.rodata._.str.2270,"a",@progbits
	.balign	1
	.local	_.str.2270
_.str.2270:
	.asciz	"subscribers"

	.section	.rodata._.str.2271,"a",@progbits
	.balign	1
	.local	_.str.2271
_.str.2271:
	.asciz	"subset"

	.section	.rodata._.str.2272,"a",@progbits
	.balign	1
	.local	_.str.2272
_.str.2272:
	.asciz	"subsets"

	.section	.rodata._.str.2273,"a",@progbits
	.balign	1
	.local	_.str.2273
_.str.2273:
	.asciz	"substantially"

	.section	.rodata._.str.2274,"a",@progbits
	.balign	1
	.local	_.str.2274
_.str.2274:
	.asciz	"substitute"

	.section	.rodata._.str.2275,"a",@progbits
	.balign	1
	.local	_.str.2275
_.str.2275:
	.asciz	"substitution"

	.section	.rodata._.str.2276,"a",@progbits
	.balign	1
	.local	_.str.2276
_.str.2276:
	.asciz	"subtle"

	.section	.rodata._.str.2277,"a",@progbits
	.balign	1
	.local	_.str.2277
_.str.2277:
	.asciz	"subtract"

	.section	.rodata._.str.2278,"a",@progbits
	.balign	1
	.local	_.str.2278
_.str.2278:
	.asciz	"subtracted"

	.section	.rodata._.str.2279,"a",@progbits
	.balign	1
	.local	_.str.2279
_.str.2279:
	.asciz	"subtracting"

	.section	.rodata._.str.2280,"a",@progbits
	.balign	1
	.local	_.str.2280
_.str.2280:
	.asciz	"success"

	.section	.rodata._.str.2281,"a",@progbits
	.balign	1
	.local	_.str.2281
_.str.2281:
	.asciz	"successes"

	.section	.rodata._.str.2282,"a",@progbits
	.balign	1
	.local	_.str.2282
_.str.2282:
	.asciz	"succession"

	.section	.rodata._.str.2283,"a",@progbits
	.balign	1
	.local	_.str.2283
_.str.2283:
	.asciz	"successive"

	.section	.rodata._.str.2284,"a",@progbits
	.balign	1
	.local	_.str.2284
_.str.2284:
	.asciz	"such"

	.section	.rodata._.str.2285,"a",@progbits
	.balign	1
	.local	_.str.2285
_.str.2285:
	.asciz	"sued"

	.section	.rodata._.str.2286,"a",@progbits
	.balign	1
	.local	_.str.2286
_.str.2286:
	.asciz	"sufficiently"

	.section	.rodata._.str.2287,"a",@progbits
	.balign	1
	.local	_.str.2287
_.str.2287:
	.asciz	"suggests"

	.section	.rodata._.str.2288,"a",@progbits
	.balign	1
	.local	_.str.2288
_.str.2288:
	.asciz	"summaries"

	.section	.rodata._.str.2289,"a",@progbits
	.balign	1
	.local	_.str.2289
_.str.2289:
	.asciz	"summarized"

	.section	.rodata._.str.2290,"a",@progbits
	.balign	1
	.local	_.str.2290
_.str.2290:
	.asciz	"summary"

	.section	.rodata._.str.2291,"a",@progbits
	.balign	1
	.local	_.str.2291
_.str.2291:
	.asciz	"summation"

	.section	.rodata._.str.2292,"a",@progbits
	.balign	1
	.local	_.str.2292
_.str.2292:
	.asciz	"superior"

	.section	.rodata._.str.2293,"a",@progbits
	.balign	1
	.local	_.str.2293
_.str.2293:
	.asciz	"superpower"

	.section	.rodata._.str.2294,"a",@progbits
	.balign	1
	.local	_.str.2294
_.str.2294:
	.asciz	"supervised"

	.section	.rodata._.str.2295,"a",@progbits
	.balign	1
	.local	_.str.2295
_.str.2295:
	.asciz	"support"

	.section	.rodata._.str.2296,"a",@progbits
	.balign	1
	.local	_.str.2296
_.str.2296:
	.asciz	"supposed"

	.section	.rodata._.str.2297,"a",@progbits
	.balign	1
	.local	_.str.2297
_.str.2297:
	.asciz	"sure"

	.section	.rodata._.str.2298,"a",@progbits
	.balign	1
	.local	_.str.2298
_.str.2298:
	.asciz	"surge"

	.section	.rodata._.str.2299,"a",@progbits
	.balign	1
	.local	_.str.2299
_.str.2299:
	.asciz	"surgery"

	.section	.rodata._.str.2300,"a",@progbits
	.balign	1
	.local	_.str.2300
_.str.2300:
	.asciz	"surprising"

	.section	.rodata._.str.2301,"a",@progbits
	.balign	1
	.local	_.str.2301
_.str.2301:
	.asciz	"survey"

	.section	.rodata._.str.2302,"a",@progbits
	.balign	1
	.local	_.str.2302
_.str.2302:
	.asciz	"surveys"

	.section	.rodata._.str.2303,"a",@progbits
	.balign	1
	.local	_.str.2303
_.str.2303:
	.asciz	"survival"

	.section	.rodata._.str.2304,"a",@progbits
	.balign	1
	.local	_.str.2304
_.str.2304:
	.asciz	"survive"

	.section	.rodata._.str.2305,"a",@progbits
	.balign	1
	.local	_.str.2305
_.str.2305:
	.asciz	"survivorship"

	.section	.rodata._.str.2306,"a",@progbits
	.balign	1
	.local	_.str.2306
_.str.2306:
	.asciz	"suspect"

	.section	.rodata._.str.2307,"a",@progbits
	.balign	1
	.local	_.str.2307
_.str.2307:
	.asciz	"switch"

	.section	.rodata._.str.2308,"a",@progbits
	.balign	1
	.local	_.str.2308
_.str.2308:
	.asciz	"switching"

	.section	.rodata._.str.2309,"a",@progbits
	.balign	1
	.local	_.str.2309
_.str.2309:
	.asciz	"symbols"

	.section	.rodata._.str.2310,"a",@progbits
	.balign	1
	.local	_.str.2310
_.str.2310:
	.asciz	"symmetric"

	.section	.rodata._.str.2311,"a",@progbits
	.balign	1
	.local	_.str.2311
_.str.2311:
	.asciz	"symmetry"

	.section	.rodata._.str.2312,"a",@progbits
	.balign	1
	.local	_.str.2312
_.str.2312:
	.asciz	"syntax"

	.section	.rodata._.str.2313,"a",@progbits
	.balign	1
	.local	_.str.2313
_.str.2313:
	.asciz	"synthesis"

	.section	.rodata._.str.2314,"a",@progbits
	.balign	1
	.local	_.str.2314
_.str.2314:
	.asciz	"synthesizing"

	.section	.rodata._.str.2315,"a",@progbits
	.balign	1
	.local	_.str.2315
_.str.2315:
	.asciz	"system"

	.section	.rodata._.str.2316,"a",@progbits
	.balign	1
	.local	_.str.2316
_.str.2316:
	.asciz	"systematic"

	.section	.rodata._.str.2317,"a",@progbits
	.balign	1
	.local	_.str.2317
_.str.2317:
	.asciz	"systems"

	.section	.rodata._.str.2318,"a",@progbits
	.balign	1
	.local	_.str.2318
_.str.2318:
	.asciz	"t"

	.section	.rodata._.str.2319,"a",@progbits
	.balign	1
	.local	_.str.2319
_.str.2319:
	.asciz	"table"

	.section	.rodata._.str.2320,"a",@progbits
	.balign	1
	.local	_.str.2320
_.str.2320:
	.asciz	"tables"

	.section	.rodata._.str.2321,"a",@progbits
	.balign	1
	.local	_.str.2321
_.str.2321:
	.asciz	"tail"

	.section	.rodata._.str.2322,"a",@progbits
	.balign	1
	.local	_.str.2322
_.str.2322:
	.asciz	"tailed"

	.section	.rodata._.str.2323,"a",@progbits
	.balign	1
	.local	_.str.2323
_.str.2323:
	.asciz	"tailedness"

	.section	.rodata._.str.2324,"a",@progbits
	.balign	1
	.local	_.str.2324
_.str.2324:
	.asciz	"tails"

	.section	.rodata._.str.2325,"a",@progbits
	.balign	1
	.local	_.str.2325
_.str.2325:
	.asciz	"take"

	.section	.rodata._.str.2326,"a",@progbits
	.balign	1
	.local	_.str.2326
_.str.2326:
	.asciz	"takes"

	.section	.rodata._.str.2327,"a",@progbits
	.balign	1
	.local	_.str.2327
_.str.2327:
	.asciz	"taking"

	.section	.rodata._.str.2328,"a",@progbits
	.balign	1
	.local	_.str.2328
_.str.2328:
	.asciz	"talk"

	.section	.rodata._.str.2329,"a",@progbits
	.balign	1
	.local	_.str.2329
_.str.2329:
	.asciz	"talking"

	.section	.rodata._.str.2330,"a",@progbits
	.balign	1
	.local	_.str.2330
_.str.2330:
	.asciz	"tall"

	.section	.rodata._.str.2331,"a",@progbits
	.balign	1
	.local	_.str.2331
_.str.2331:
	.asciz	"tank"

	.section	.rodata._.str.2332,"a",@progbits
	.balign	1
	.local	_.str.2332
_.str.2332:
	.asciz	"task"

	.section	.rodata._.str.2333,"a",@progbits
	.balign	1
	.local	_.str.2333
_.str.2333:
	.asciz	"taught"

	.section	.rodata._.str.2334,"a",@progbits
	.balign	1
	.local	_.str.2334
_.str.2334:
	.asciz	"tcdf"

	.section	.rodata._.str.2335,"a",@progbits
	.balign	1
	.local	_.str.2335
_.str.2335:
	.asciz	"teach"

	.section	.rodata._.str.2336,"a",@progbits
	.balign	1
	.local	_.str.2336
_.str.2336:
	.asciz	"team"

	.section	.rodata._.str.2337,"a",@progbits
	.balign	1
	.local	_.str.2337
_.str.2337:
	.asciz	"technical"

	.section	.rodata._.str.2338,"a",@progbits
	.balign	1
	.local	_.str.2338
_.str.2338:
	.asciz	"technique"

	.section	.rodata._.str.2339,"a",@progbits
	.balign	1
	.local	_.str.2339
_.str.2339:
	.asciz	"techniques"

	.section	.rodata._.str.2340,"a",@progbits
	.balign	1
	.local	_.str.2340
_.str.2340:
	.asciz	"telephone"

	.section	.rodata._.str.2341,"a",@progbits
	.balign	1
	.local	_.str.2341
_.str.2341:
	.asciz	"telephones"

	.section	.rodata._.str.2342,"a",@progbits
	.balign	1
	.local	_.str.2342
_.str.2342:
	.asciz	"tell"

	.section	.rodata._.str.2343,"a",@progbits
	.balign	1
	.local	_.str.2343
_.str.2343:
	.asciz	"telling"

	.section	.rodata._.str.2344,"a",@progbits
	.balign	1
	.local	_.str.2344
_.str.2344:
	.asciz	"tells"

	.section	.rodata._.str.2345,"a",@progbits
	.balign	1
	.local	_.str.2345
_.str.2345:
	.asciz	"temperature"

	.section	.rodata._.str.2346,"a",@progbits
	.balign	1
	.local	_.str.2346
_.str.2346:
	.asciz	"temperatures"

	.section	.rodata._.str.2347,"a",@progbits
	.balign	1
	.local	_.str.2347
_.str.2347:
	.asciz	"template"

	.section	.rodata._.str.2348,"a",@progbits
	.balign	1
	.local	_.str.2348
_.str.2348:
	.asciz	"tend"

	.section	.rodata._.str.2349,"a",@progbits
	.balign	1
	.local	_.str.2349
_.str.2349:
	.asciz	"tendency"

	.section	.rodata._.str.2350,"a",@progbits
	.balign	1
	.local	_.str.2350
_.str.2350:
	.asciz	"term"

	.section	.rodata._.str.2351,"a",@progbits
	.balign	1
	.local	_.str.2351
_.str.2351:
	.asciz	"terms"

	.section	.rodata._.str.2352,"a",@progbits
	.balign	1
	.local	_.str.2352
_.str.2352:
	.asciz	"test"

	.section	.rodata._.str.2353,"a",@progbits
	.balign	1
	.local	_.str.2353
_.str.2353:
	.asciz	"tested"

	.section	.rodata._.str.2354,"a",@progbits
	.balign	1
	.local	_.str.2354
_.str.2354:
	.asciz	"testified"

	.section	.rodata._.str.2355,"a",@progbits
	.balign	1
	.local	_.str.2355
_.str.2355:
	.asciz	"testing"

	.section	.rodata._.str.2356,"a",@progbits
	.balign	1
	.local	_.str.2356
_.str.2356:
	.asciz	"tests"

	.section	.rodata._.str.2357,"a",@progbits
	.balign	1
	.local	_.str.2357
_.str.2357:
	.asciz	"text"

	.section	.rodata._.str.2358,"a",@progbits
	.balign	1
	.local	_.str.2358
_.str.2358:
	.asciz	"than"

	.section	.rodata._.str.2359,"a",@progbits
	.balign	1
	.local	_.str.2359
_.str.2359:
	.asciz	"that"

	.section	.rodata._.str.2360,"a",@progbits
	.balign	1
	.local	_.str.2360
_.str.2360:
	.asciz	"their"

	.section	.rodata._.str.2361,"a",@progbits
	.balign	1
	.local	_.str.2361
_.str.2361:
	.asciz	"them"

	.section	.rodata._.str.2362,"a",@progbits
	.balign	1
	.local	_.str.2362
_.str.2362:
	.asciz	"themselves"

	.section	.rodata._.str.2363,"a",@progbits
	.balign	1
	.local	_.str.2363
_.str.2363:
	.asciz	"then"

	.section	.rodata._.str.2364,"a",@progbits
	.balign	1
	.local	_.str.2364
_.str.2364:
	.asciz	"theorem"

	.section	.rodata._.str.2365,"a",@progbits
	.balign	1
	.local	_.str.2365
_.str.2365:
	.asciz	"theoretical"

	.section	.rodata._.str.2366,"a",@progbits
	.balign	1
	.local	_.str.2366
_.str.2366:
	.asciz	"theory"

	.section	.rodata._.str.2367,"a",@progbits
	.balign	1
	.local	_.str.2367
_.str.2367:
	.asciz	"there"

	.section	.rodata._.str.2368,"a",@progbits
	.balign	1
	.local	_.str.2368
_.str.2368:
	.asciz	"these"

	.section	.rodata._.str.2369,"a",@progbits
	.balign	1
	.local	_.str.2369
_.str.2369:
	.asciz	"they"

	.section	.rodata._.str.2370,"a",@progbits
	.balign	1
	.local	_.str.2370
_.str.2370:
	.asciz	"thickness"

	.section	.rodata._.str.2371,"a",@progbits
	.balign	1
	.local	_.str.2371
_.str.2371:
	.asciz	"thing"

	.section	.rodata._.str.2372,"a",@progbits
	.balign	1
	.local	_.str.2372
_.str.2372:
	.asciz	"things"

	.section	.rodata._.str.2373,"a",@progbits
	.balign	1
	.local	_.str.2373
_.str.2373:
	.asciz	"think"

	.section	.rodata._.str.2374,"a",@progbits
	.balign	1
	.local	_.str.2374
_.str.2374:
	.asciz	"thinking"

	.section	.rodata._.str.2375,"a",@progbits
	.balign	1
	.local	_.str.2375
_.str.2375:
	.asciz	"third"

	.section	.rodata._.str.2376,"a",@progbits
	.balign	1
	.local	_.str.2376
_.str.2376:
	.asciz	"this"

	.section	.rodata._.str.2377,"a",@progbits
	.balign	1
	.local	_.str.2377
_.str.2377:
	.asciz	"thomas"

	.section	.rodata._.str.2378,"a",@progbits
	.balign	1
	.local	_.str.2378
_.str.2378:
	.asciz	"thoroughly"

	.section	.rodata._.str.2379,"a",@progbits
	.balign	1
	.local	_.str.2379
_.str.2379:
	.asciz	"those"

	.section	.rodata._.str.2380,"a",@progbits
	.balign	1
	.local	_.str.2380
_.str.2380:
	.asciz	"though"

	.section	.rodata._.str.2381,"a",@progbits
	.balign	1
	.local	_.str.2381
_.str.2381:
	.asciz	"thousands"

	.section	.rodata._.str.2382,"a",@progbits
	.balign	1
	.local	_.str.2382
_.str.2382:
	.asciz	"three"

	.section	.rodata._.str.2383,"a",@progbits
	.balign	1
	.local	_.str.2383
_.str.2383:
	.asciz	"threshold"

	.section	.rodata._.str.2384,"a",@progbits
	.balign	1
	.local	_.str.2384
_.str.2384:
	.asciz	"through"

	.section	.rodata._.str.2385,"a",@progbits
	.balign	1
	.local	_.str.2385
_.str.2385:
	.asciz	"throws"

	.section	.rodata._.str.2386,"a",@progbits
	.balign	1
	.local	_.str.2386
_.str.2386:
	.asciz	"thus"

	.section	.rodata._.str.2387,"a",@progbits
	.balign	1
	.local	_.str.2387
_.str.2387:
	.asciz	"tidy"

	.section	.rodata._.str.2388,"a",@progbits
	.balign	1
	.local	_.str.2388
_.str.2388:
	.asciz	"tidyverse"

	.section	.rodata._.str.2389,"a",@progbits
	.balign	1
	.local	_.str.2389
_.str.2389:
	.asciz	"tied"

	.section	.rodata._.str.2390,"a",@progbits
	.balign	1
	.local	_.str.2390
_.str.2390:
	.asciz	"tight"

	.section	.rodata._.str.2391,"a",@progbits
	.balign	1
	.local	_.str.2391
_.str.2391:
	.asciz	"tightly"

	.section	.rodata._.str.2392,"a",@progbits
	.balign	1
	.local	_.str.2392
_.str.2392:
	.asciz	"time"

	.section	.rodata._.str.2393,"a",@progbits
	.balign	1
	.local	_.str.2393
_.str.2393:
	.asciz	"timeline"

	.section	.rodata._.str.2394,"a",@progbits
	.balign	1
	.local	_.str.2394
_.str.2394:
	.asciz	"times"

	.section	.rodata._.str.2395,"a",@progbits
	.balign	1
	.local	_.str.2395
_.str.2395:
	.asciz	"tinterval"

	.section	.rodata._.str.2396,"a",@progbits
	.balign	1
	.local	_.str.2396
_.str.2396:
	.asciz	"tips"

	.section	.rodata._.str.2397,"a",@progbits
	.balign	1
	.local	_.str.2397
_.str.2397:
	.asciz	"today"

	.section	.rodata._.str.2398,"a",@progbits
	.balign	1
	.local	_.str.2398
_.str.2398:
	.asciz	"together"

	.section	.rodata._.str.2399,"a",@progbits
	.balign	1
	.local	_.str.2399
_.str.2399:
	.asciz	"told"

	.section	.rodata._.str.2400,"a",@progbits
	.balign	1
	.local	_.str.2400
_.str.2400:
	.asciz	"took"

	.section	.rodata._.str.2401,"a",@progbits
	.balign	1
	.local	_.str.2401
_.str.2401:
	.asciz	"tool"

	.section	.rodata._.str.2402,"a",@progbits
	.balign	1
	.local	_.str.2402
_.str.2402:
	.asciz	"tools"

	.section	.rodata._.str.2403,"a",@progbits
	.balign	1
	.local	_.str.2403
_.str.2403:
	.asciz	"topic"

	.section	.rodata._.str.2404,"a",@progbits
	.balign	1
	.local	_.str.2404
_.str.2404:
	.asciz	"toss"

	.section	.rodata._.str.2405,"a",@progbits
	.balign	1
	.local	_.str.2405
_.str.2405:
	.asciz	"total"

	.section	.rodata._.str.2406,"a",@progbits
	.balign	1
	.local	_.str.2406
_.str.2406:
	.asciz	"totals"

	.section	.rodata._.str.2407,"a",@progbits
	.balign	1
	.local	_.str.2407
_.str.2407:
	.asciz	"touch"

	.section	.rodata._.str.2408,"a",@progbits
	.balign	1
	.local	_.str.2408
_.str.2408:
	.asciz	"tournament"

	.section	.rodata._.str.2409,"a",@progbits
	.balign	1
	.local	_.str.2409
_.str.2409:
	.asciz	"toward"

	.section	.rodata._.str.2410,"a",@progbits
	.balign	1
	.local	_.str.2410
_.str.2410:
	.asciz	"towards"

	.section	.rodata._.str.2411,"a",@progbits
	.balign	1
	.local	_.str.2411
_.str.2411:
	.asciz	"tradeoff"

	.section	.rodata._.str.2412,"a",@progbits
	.balign	1
	.local	_.str.2412
_.str.2412:
	.asciz	"tragic"

	.section	.rodata._.str.2413,"a",@progbits
	.balign	1
	.local	_.str.2413
_.str.2413:
	.asciz	"training"

	.section	.rodata._.str.2414,"a",@progbits
	.balign	1
	.local	_.str.2414
_.str.2414:
	.asciz	"trait"

	.section	.rodata._.str.2415,"a",@progbits
	.balign	1
	.local	_.str.2415
_.str.2415:
	.asciz	"traits"

	.section	.rodata._.str.2416,"a",@progbits
	.balign	1
	.local	_.str.2416
_.str.2416:
	.asciz	"transcript"

	.section	.rodata._.str.2417,"a",@progbits
	.balign	1
	.local	_.str.2417
_.str.2417:
	.asciz	"transcripts"

	.section	.rodata._.str.2418,"a",@progbits
	.balign	1
	.local	_.str.2418
_.str.2418:
	.asciz	"transform"

	.section	.rodata._.str.2419,"a",@progbits
	.balign	1
	.local	_.str.2419
_.str.2419:
	.asciz	"transformation"

	.section	.rodata._.str.2420,"a",@progbits
	.balign	1
	.local	_.str.2420
_.str.2420:
	.asciz	"transformations"

	.section	.rodata._.str.2421,"a",@progbits
	.balign	1
	.local	_.str.2421
_.str.2421:
	.asciz	"transformed"

	.section	.rodata._.str.2422,"a",@progbits
	.balign	1
	.local	_.str.2422
_.str.2422:
	.asciz	"transforming"

	.section	.rodata._.str.2423,"a",@progbits
	.balign	1
	.local	_.str.2423
_.str.2423:
	.asciz	"trap"

	.section	.rodata._.str.2424,"a",@progbits
	.balign	1
	.local	_.str.2424
_.str.2424:
	.asciz	"treated"

	.section	.rodata._.str.2425,"a",@progbits
	.balign	1
	.local	_.str.2425
_.str.2425:
	.asciz	"treatment"

	.section	.rodata._.str.2426,"a",@progbits
	.balign	1
	.local	_.str.2426
_.str.2426:
	.asciz	"treatments"

	.section	.rodata._.str.2427,"a",@progbits
	.balign	1
	.local	_.str.2427
_.str.2427:
	.asciz	"tree"

	.section	.rodata._.str.2428,"a",@progbits
	.balign	1
	.local	_.str.2428
_.str.2428:
	.asciz	"trees"

	.section	.rodata._.str.2429,"a",@progbits
	.balign	1
	.local	_.str.2429
_.str.2429:
	.asciz	"trellis"

	.section	.rodata._.str.2430,"a",@progbits
	.balign	1
	.local	_.str.2430
_.str.2430:
	.asciz	"trend"

	.section	.rodata._.str.2431,"a",@progbits
	.balign	1
	.local	_.str.2431
_.str.2431:
	.asciz	"trial"

	.section	.rodata._.str.2432,"a",@progbits
	.balign	1
	.local	_.str.2432
_.str.2432:
	.asciz	"trials"

	.section	.rodata._.str.2433,"a",@progbits
	.balign	1
	.local	_.str.2433
_.str.2433:
	.asciz	"tribune"

	.section	.rodata._.str.2434,"a",@progbits
	.balign	1
	.local	_.str.2434
_.str.2434:
	.asciz	"trick"

	.section	.rodata._.str.2435,"a",@progbits
	.balign	1
	.local	_.str.2435
_.str.2435:
	.asciz	"tricks"

	.section	.rodata._.str.2436,"a",@progbits
	.balign	1
	.local	_.str.2436
_.str.2436:
	.asciz	"troubleshooting"

	.section	.rodata._.str.2437,"a",@progbits
	.balign	1
	.local	_.str.2437
_.str.2437:
	.asciz	"true"

	.section	.rodata._.str.2438,"a",@progbits
	.balign	1
	.local	_.str.2438
_.str.2438:
	.asciz	"truman"

	.section	.rodata._.str.2439,"a",@progbits
	.balign	1
	.local	_.str.2439
_.str.2439:
	.asciz	"trust"

	.section	.rodata._.str.2440,"a",@progbits
	.balign	1
	.local	_.str.2440
_.str.2440:
	.asciz	"trying"

	.section	.rodata._.str.2441,"a",@progbits
	.balign	1
	.local	_.str.2441
_.str.2441:
	.asciz	"tufte"

	.section	.rodata._.str.2442,"a",@progbits
	.balign	1
	.local	_.str.2442
_.str.2442:
	.asciz	"tukey"

	.section	.rodata._.str.2443,"a",@progbits
	.balign	1
	.local	_.str.2443
_.str.2443:
	.asciz	"turn"

	.section	.rodata._.str.2444,"a",@progbits
	.balign	1
	.local	_.str.2444
_.str.2444:
	.asciz	"turned"

	.section	.rodata._.str.2445,"a",@progbits
	.balign	1
	.local	_.str.2445
_.str.2445:
	.asciz	"tutorials"

	.section	.rodata._.str.2446,"a",@progbits
	.balign	1
	.local	_.str.2446
_.str.2446:
	.asciz	"tversky"

	.section	.rodata._.str.2447,"a",@progbits
	.balign	1
	.local	_.str.2447
_.str.2447:
	.asciz	"twice"

	.section	.rodata._.str.2448,"a",@progbits
	.balign	1
	.local	_.str.2448
_.str.2448:
	.asciz	"twins"

	.section	.rodata._.str.2449,"a",@progbits
	.balign	1
	.local	_.str.2449
_.str.2449:
	.asciz	"type"

	.section	.rodata._.str.2450,"a",@progbits
	.balign	1
	.local	_.str.2450
_.str.2450:
	.asciz	"types"

	.section	.rodata._.str.2451,"a",@progbits
	.balign	1
	.local	_.str.2451
_.str.2451:
	.asciz	"typical"

	.section	.rodata._.str.2452,"a",@progbits
	.balign	1
	.local	_.str.2452
_.str.2452:
	.asciz	"typically"

	.section	.rodata._.str.2453,"a",@progbits
	.balign	1
	.local	_.str.2453
_.str.2453:
	.asciz	"ultimate"

	.section	.rodata._.str.2454,"a",@progbits
	.balign	1
	.local	_.str.2454
_.str.2454:
	.asciz	"unbiased"

	.section	.rodata._.str.2455,"a",@progbits
	.balign	1
	.local	_.str.2455
_.str.2455:
	.asciz	"uncertain"

	.section	.rodata._.str.2456,"a",@progbits
	.balign	1
	.local	_.str.2456
_.str.2456:
	.asciz	"uncertainty"

	.section	.rodata._.str.2457,"a",@progbits
	.balign	1
	.local	_.str.2457
_.str.2457:
	.asciz	"unchanged"

	.section	.rodata._.str.2458,"a",@progbits
	.balign	1
	.local	_.str.2458
_.str.2458:
	.asciz	"undeniable"

	.section	.rodata._.str.2459,"a",@progbits
	.balign	1
	.local	_.str.2459
_.str.2459:
	.asciz	"under"

	.section	.rodata._.str.2460,"a",@progbits
	.balign	1
	.local	_.str.2460
_.str.2460:
	.asciz	"undercoverage"

	.section	.rodata._.str.2461,"a",@progbits
	.balign	1
	.local	_.str.2461
_.str.2461:
	.asciz	"underestimate"

	.section	.rodata._.str.2462,"a",@progbits
	.balign	1
	.local	_.str.2462
_.str.2462:
	.asciz	"underlying"

	.section	.rodata._.str.2463,"a",@progbits
	.balign	1
	.local	_.str.2463
_.str.2463:
	.asciz	"underprediction"

	.section	.rodata._.str.2464,"a",@progbits
	.balign	1
	.local	_.str.2464
_.str.2464:
	.asciz	"underscores"

	.section	.rodata._.str.2465,"a",@progbits
	.balign	1
	.local	_.str.2465
_.str.2465:
	.asciz	"understand"

	.section	.rodata._.str.2466,"a",@progbits
	.balign	1
	.local	_.str.2466
_.str.2466:
	.asciz	"understanding"

	.section	.rodata._.str.2467,"a",@progbits
	.balign	1
	.local	_.str.2467
_.str.2467:
	.asciz	"unfair"

	.section	.rodata._.str.2468,"a",@progbits
	.balign	1
	.local	_.str.2468
_.str.2468:
	.asciz	"unfamiliar"

	.section	.rodata._.str.2469,"a",@progbits
	.balign	1
	.local	_.str.2469
_.str.2469:
	.asciz	"uniform"

	.section	.rodata._.str.2470,"a",@progbits
	.balign	1
	.local	_.str.2470
_.str.2470:
	.asciz	"unimodal"

	.section	.rodata._.str.2471,"a",@progbits
	.balign	1
	.local	_.str.2471
_.str.2471:
	.asciz	"union"

	.section	.rodata._.str.2472,"a",@progbits
	.balign	1
	.local	_.str.2472
_.str.2472:
	.asciz	"unit"

	.section	.rodata._.str.2473,"a",@progbits
	.balign	1
	.local	_.str.2473
_.str.2473:
	.asciz	"units"

	.section	.rodata._.str.2474,"a",@progbits
	.balign	1
	.local	_.str.2474
_.str.2474:
	.asciz	"univariate"

	.section	.rodata._.str.2475,"a",@progbits
	.balign	1
	.local	_.str.2475
_.str.2475:
	.asciz	"unknown"

	.section	.rodata._.str.2476,"a",@progbits
	.balign	1
	.local	_.str.2476
_.str.2476:
	.asciz	"unless"

	.section	.rodata._.str.2477,"a",@progbits
	.balign	1
	.local	_.str.2477
_.str.2477:
	.asciz	"unlikely"

	.section	.rodata._.str.2478,"a",@progbits
	.balign	1
	.local	_.str.2478
_.str.2478:
	.asciz	"unmeasured"

	.section	.rodata._.str.2479,"a",@progbits
	.balign	1
	.local	_.str.2479
_.str.2479:
	.asciz	"unobserved"

	.section	.rodata._.str.2480,"a",@progbits
	.balign	1
	.local	_.str.2480
_.str.2480:
	.asciz	"unpooled"

	.section	.rodata._.str.2481,"a",@progbits
	.balign	1
	.local	_.str.2481
_.str.2481:
	.asciz	"unreliable"

	.section	.rodata._.str.2482,"a",@progbits
	.balign	1
	.local	_.str.2482
_.str.2482:
	.asciz	"unsure"

	.section	.rodata._.str.2483,"a",@progbits
	.balign	1
	.local	_.str.2483
_.str.2483:
	.asciz	"until"

	.section	.rodata._.str.2484,"a",@progbits
	.balign	1
	.local	_.str.2484
_.str.2484:
	.asciz	"unusually"

	.section	.rodata._.str.2485,"a",@progbits
	.balign	1
	.local	_.str.2485
_.str.2485:
	.asciz	"update"

	.section	.rodata._.str.2486,"a",@progbits
	.balign	1
	.local	_.str.2486
_.str.2486:
	.asciz	"updates"

	.section	.rodata._.str.2487,"a",@progbits
	.balign	1
	.local	_.str.2487
_.str.2487:
	.asciz	"upgrade"

	.section	.rodata._.str.2488,"a",@progbits
	.balign	1
	.local	_.str.2488
_.str.2488:
	.asciz	"upon"

	.section	.rodata._.str.2489,"a",@progbits
	.balign	1
	.local	_.str.2489
_.str.2489:
	.asciz	"upper"

	.section	.rodata._.str.2490,"a",@progbits
	.balign	1
	.local	_.str.2490
_.str.2490:
	.asciz	"used"

	.section	.rodata._.str.2491,"a",@progbits
	.balign	1
	.local	_.str.2491
_.str.2491:
	.asciz	"user"

	.section	.rodata._.str.2492,"a",@progbits
	.balign	1
	.local	_.str.2492
_.str.2492:
	.asciz	"uses"

	.section	.rodata._.str.2493,"a",@progbits
	.balign	1
	.local	_.str.2493
_.str.2493:
	.asciz	"using"

	.section	.rodata._.str.2494,"a",@progbits
	.balign	1
	.local	_.str.2494
_.str.2494:
	.asciz	"usually"

	.section	.rodata._.str.2495,"a",@progbits
	.balign	1
	.local	_.str.2495
_.str.2495:
	.asciz	"vaccine"

	.section	.rodata._.str.2496,"a",@progbits
	.balign	1
	.local	_.str.2496
_.str.2496:
	.asciz	"valid"

	.section	.rodata._.str.2497,"a",@progbits
	.balign	1
	.local	_.str.2497
_.str.2497:
	.asciz	"validity"

	.section	.rodata._.str.2498,"a",@progbits
	.balign	1
	.local	_.str.2498
_.str.2498:
	.asciz	"vallone"

	.section	.rodata._.str.2499,"a",@progbits
	.balign	1
	.local	_.str.2499
_.str.2499:
	.asciz	"valuable"

	.section	.rodata._.str.2500,"a",@progbits
	.balign	1
	.local	_.str.2500
_.str.2500:
	.asciz	"value"

	.section	.rodata._.str.2501,"a",@progbits
	.balign	1
	.local	_.str.2501
_.str.2501:
	.asciz	"value_1"

	.section	.rodata._.str.2502,"a",@progbits
	.balign	1
	.local	_.str.2502
_.str.2502:
	.asciz	"value_2"

	.section	.rodata._.str.2503,"a",@progbits
	.balign	1
	.local	_.str.2503
_.str.2503:
	.asciz	"value_n"

	.section	.rodata._.str.2504,"a",@progbits
	.balign	1
	.local	_.str.2504
_.str.2504:
	.asciz	"valued"

	.section	.rodata._.str.2505,"a",@progbits
	.balign	1
	.local	_.str.2505
_.str.2505:
	.asciz	"values"

	.section	.rodata._.str.2506,"a",@progbits
	.balign	1
	.local	_.str.2506
_.str.2506:
	.asciz	"variability"

	.section	.rodata._.str.2507,"a",@progbits
	.balign	1
	.local	_.str.2507
_.str.2507:
	.asciz	"variable"

	.section	.rodata._.str.2508,"a",@progbits
	.balign	1
	.local	_.str.2508
_.str.2508:
	.asciz	"variables"

	.section	.rodata._.str.2509,"a",@progbits
	.balign	1
	.local	_.str.2509
_.str.2509:
	.asciz	"variance"

	.section	.rodata._.str.2510,"a",@progbits
	.balign	1
	.local	_.str.2510
_.str.2510:
	.asciz	"variances"

	.section	.rodata._.str.2511,"a",@progbits
	.balign	1
	.local	_.str.2511
_.str.2511:
	.asciz	"variation"

	.section	.rodata._.str.2512,"a",@progbits
	.balign	1
	.local	_.str.2512
_.str.2512:
	.asciz	"variations"

	.section	.rodata._.str.2513,"a",@progbits
	.balign	1
	.local	_.str.2513
_.str.2513:
	.asciz	"varies"

	.section	.rodata._.str.2514,"a",@progbits
	.balign	1
	.local	_.str.2514
_.str.2514:
	.asciz	"variety"

	.section	.rodata._.str.2515,"a",@progbits
	.balign	1
	.local	_.str.2515
_.str.2515:
	.asciz	"various"

	.section	.rodata._.str.2516,"a",@progbits
	.balign	1
	.local	_.str.2516
_.str.2516:
	.asciz	"vars"

	.section	.rodata._.str.2517,"a",@progbits
	.balign	1
	.local	_.str.2517
_.str.2517:
	.asciz	"vary"

	.section	.rodata._.str.2518,"a",@progbits
	.balign	1
	.local	_.str.2518
_.str.2518:
	.asciz	"varying"

	.section	.rodata._.str.2519,"a",@progbits
	.balign	1
	.local	_.str.2519
_.str.2519:
	.asciz	"vault"

	.section	.rodata._.str.2520,"a",@progbits
	.balign	1
	.local	_.str.2520
_.str.2520:
	.asciz	"vectors"

	.section	.rodata._.str.2521,"a",@progbits
	.balign	1
	.local	_.str.2521
_.str.2521:
	.asciz	"venn"

	.section	.rodata._.str.2522,"a",@progbits
	.balign	1
	.local	_.str.2522
_.str.2522:
	.asciz	"verb"

	.section	.rodata._.str.2523,"a",@progbits
	.balign	1
	.local	_.str.2523
_.str.2523:
	.asciz	"verbs"

	.section	.rodata._.str.2524,"a",@progbits
	.balign	1
	.local	_.str.2524
_.str.2524:
	.asciz	"verify"

	.section	.rodata._.str.2525,"a",@progbits
	.balign	1
	.local	_.str.2525
_.str.2525:
	.asciz	"versa"

	.section	.rodata._.str.2526,"a",@progbits
	.balign	1
	.local	_.str.2526
_.str.2526:
	.asciz	"version"

	.section	.rodata._.str.2527,"a",@progbits
	.balign	1
	.local	_.str.2527
_.str.2527:
	.asciz	"vertical"

	.section	.rodata._.str.2528,"a",@progbits
	.balign	1
	.local	_.str.2528
_.str.2528:
	.asciz	"very"

	.section	.rodata._.str.2529,"a",@progbits
	.balign	1
	.local	_.str.2529
_.str.2529:
	.asciz	"vice"

	.section	.rodata._.str.2530,"a",@progbits
	.balign	1
	.local	_.str.2530
_.str.2530:
	.asciz	"victory"

	.section	.rodata._.str.2531,"a",@progbits
	.balign	1
	.local	_.str.2531
_.str.2531:
	.asciz	"vietnam"

	.section	.rodata._.str.2532,"a",@progbits
	.balign	1
	.local	_.str.2532
_.str.2532:
	.asciz	"view"

	.section	.rodata._.str.2533,"a",@progbits
	.balign	1
	.local	_.str.2533
_.str.2533:
	.asciz	"viii"

	.section	.rodata._.str.2534,"a",@progbits
	.balign	1
	.local	_.str.2534
_.str.2534:
	.asciz	"vinci"

	.section	.rodata._.str.2535,"a",@progbits
	.balign	1
	.local	_.str.2535
_.str.2535:
	.asciz	"violated"

	.section	.rodata._.str.2536,"a",@progbits
	.balign	1
	.local	_.str.2536
_.str.2536:
	.asciz	"violates"

	.section	.rodata._.str.2537,"a",@progbits
	.balign	1
	.local	_.str.2537
_.str.2537:
	.asciz	"visual"

	.section	.rodata._.str.2538,"a",@progbits
	.balign	1
	.local	_.str.2538
_.str.2538:
	.asciz	"visualization"

	.section	.rodata._.str.2539,"a",@progbits
	.balign	1
	.local	_.str.2539
_.str.2539:
	.asciz	"visualize"

	.section	.rodata._.str.2540,"a",@progbits
	.balign	1
	.local	_.str.2540
_.str.2540:
	.asciz	"vital"

	.section	.rodata._.str.2541,"a",@progbits
	.balign	1
	.local	_.str.2541
_.str.2541:
	.asciz	"voices"

	.section	.rodata._.str.2542,"a",@progbits
	.balign	1
	.local	_.str.2542
_.str.2542:
	.asciz	"voluntary"

	.section	.rodata._.str.2543,"a",@progbits
	.balign	1
	.local	_.str.2543
_.str.2543:
	.asciz	"volunteers"

	.section	.rodata._.str.2544,"a",@progbits
	.balign	1
	.local	_.str.2544
_.str.2544:
	.asciz	"vote"

	.section	.rodata._.str.2545,"a",@progbits
	.balign	1
	.local	_.str.2545
_.str.2545:
	.asciz	"voter"

	.section	.rodata._.str.2546,"a",@progbits
	.balign	1
	.local	_.str.2546
_.str.2546:
	.asciz	"voters"

	.section	.rodata._.str.2547,"a",@progbits
	.balign	1
	.local	_.str.2547
_.str.2547:
	.asciz	"votes"

	.section	.rodata._.str.2548,"a",@progbits
	.balign	1
	.local	_.str.2548
_.str.2548:
	.asciz	"wait"

	.section	.rodata._.str.2549,"a",@progbits
	.balign	1
	.local	_.str.2549
_.str.2549:
	.asciz	"waiting"

	.section	.rodata._.str.2550,"a",@progbits
	.balign	1
	.local	_.str.2550
_.str.2550:
	.asciz	"wald"

	.section	.rodata._.str.2551,"a",@progbits
	.balign	1
	.local	_.str.2551
_.str.2551:
	.asciz	"walk"

	.section	.rodata._.str.2552,"a",@progbits
	.balign	1
	.local	_.str.2552
_.str.2552:
	.asciz	"want"

	.section	.rodata._.str.2553,"a",@progbits
	.balign	1
	.local	_.str.2553
_.str.2553:
	.asciz	"wanted"

	.section	.rodata._.str.2554,"a",@progbits
	.balign	1
	.local	_.str.2554
_.str.2554:
	.asciz	"warned"

	.section	.rodata._.str.2555,"a",@progbits
	.balign	1
	.local	_.str.2555
_.str.2555:
	.asciz	"waste"

	.section	.rodata._.str.2556,"a",@progbits
	.balign	1
	.local	_.str.2556
_.str.2556:
	.asciz	"water"

	.section	.rodata._.str.2557,"a",@progbits
	.balign	1
	.local	_.str.2557
_.str.2557:
	.asciz	"ways"

	.section	.rodata._.str.2558,"a",@progbits
	.balign	1
	.local	_.str.2558
_.str.2558:
	.asciz	"weak"

	.section	.rodata._.str.2559,"a",@progbits
	.balign	1
	.local	_.str.2559
_.str.2559:
	.asciz	"wealth"

	.section	.rodata._.str.2560,"a",@progbits
	.balign	1
	.local	_.str.2560
_.str.2560:
	.asciz	"wealthy"

	.section	.rodata._.str.2561,"a",@progbits
	.balign	1
	.local	_.str.2561
_.str.2561:
	.asciz	"weapons"

	.section	.rodata._.str.2562,"a",@progbits
	.balign	1
	.local	_.str.2562
_.str.2562:
	.asciz	"weeks"

	.section	.rodata._.str.2563,"a",@progbits
	.balign	1
	.local	_.str.2563
_.str.2563:
	.asciz	"weight"

	.section	.rodata._.str.2564,"a",@progbits
	.balign	1
	.local	_.str.2564
_.str.2564:
	.asciz	"weighted"

	.section	.rodata._.str.2565,"a",@progbits
	.balign	1
	.local	_.str.2565
_.str.2565:
	.asciz	"weird"

	.section	.rodata._.str.2566,"a",@progbits
	.balign	1
	.local	_.str.2566
_.str.2566:
	.asciz	"well"

	.section	.rodata._.str.2567,"a",@progbits
	.balign	1
	.local	_.str.2567
_.str.2567:
	.asciz	"went"

	.section	.rodata._.str.2568,"a",@progbits
	.balign	1
	.local	_.str.2568
_.str.2568:
	.asciz	"were"

	.section	.rodata._.str.2569,"a",@progbits
	.balign	1
	.local	_.str.2569
_.str.2569:
	.asciz	"weren"

	.section	.rodata._.str.2570,"a",@progbits
	.balign	1
	.local	_.str.2570
_.str.2570:
	.asciz	"what"

	.section	.rodata._.str.2571,"a",@progbits
	.balign	1
	.local	_.str.2571
_.str.2571:
	.asciz	"when"

	.section	.rodata._.str.2572,"a",@progbits
	.balign	1
	.local	_.str.2572
_.str.2572:
	.asciz	"where"

	.section	.rodata._.str.2573,"a",@progbits
	.balign	1
	.local	_.str.2573
_.str.2573:
	.asciz	"whereas"

	.section	.rodata._.str.2574,"a",@progbits
	.balign	1
	.local	_.str.2574
_.str.2574:
	.asciz	"whether"

	.section	.rodata._.str.2575,"a",@progbits
	.balign	1
	.local	_.str.2575
_.str.2575:
	.asciz	"which"

	.section	.rodata._.str.2576,"a",@progbits
	.balign	1
	.local	_.str.2576
_.str.2576:
	.asciz	"while"

	.section	.rodata._.str.2577,"a",@progbits
	.balign	1
	.local	_.str.2577
_.str.2577:
	.asciz	"whiskers"

	.section	.rodata._.str.2578,"a",@progbits
	.balign	1
	.local	_.str.2578
_.str.2578:
	.asciz	"white"

	.section	.rodata._.str.2579,"a",@progbits
	.balign	1
	.local	_.str.2579
_.str.2579:
	.asciz	"whole"

	.section	.rodata._.str.2580,"a",@progbits
	.balign	1
	.local	_.str.2580
_.str.2580:
	.asciz	"whose"

	.section	.rodata._.str.2581,"a",@progbits
	.balign	1
	.local	_.str.2581
_.str.2581:
	.asciz	"wickham"

	.section	.rodata._.str.2582,"a",@progbits
	.balign	1
	.local	_.str.2582
_.str.2582:
	.asciz	"wide"

	.section	.rodata._.str.2583,"a",@progbits
	.balign	1
	.local	_.str.2583
_.str.2583:
	.asciz	"wider"

	.section	.rodata._.str.2584,"a",@progbits
	.balign	1
	.local	_.str.2584
_.str.2584:
	.asciz	"width"

	.section	.rodata._.str.2585,"a",@progbits
	.balign	1
	.local	_.str.2585
_.str.2585:
	.asciz	"wilks"

	.section	.rodata._.str.2586,"a",@progbits
	.balign	1
	.local	_.str.2586
_.str.2586:
	.asciz	"will"

	.section	.rodata._.str.2587,"a",@progbits
	.balign	1
	.local	_.str.2587
_.str.2587:
	.asciz	"william"

	.section	.rodata._.str.2588,"a",@progbits
	.balign	1
	.local	_.str.2588
_.str.2588:
	.asciz	"window"

	.section	.rodata._.str.2589,"a",@progbits
	.balign	1
	.local	_.str.2589
_.str.2589:
	.asciz	"winning"

	.section	.rodata._.str.2590,"a",@progbits
	.balign	1
	.local	_.str.2590
_.str.2590:
	.asciz	"wins"

	.section	.rodata._.str.2591,"a",@progbits
	.balign	1
	.local	_.str.2591
_.str.2591:
	.asciz	"wired"

	.section	.rodata._.str.2592,"a",@progbits
	.balign	1
	.local	_.str.2592
_.str.2592:
	.asciz	"wisely"

	.section	.rodata._.str.2593,"a",@progbits
	.balign	1
	.local	_.str.2593
_.str.2593:
	.asciz	"with"

	.section	.rodata._.str.2594,"a",@progbits
	.balign	1
	.local	_.str.2594
_.str.2594:
	.asciz	"within"

	.section	.rodata._.str.2595,"a",@progbits
	.balign	1
	.local	_.str.2595
_.str.2595:
	.asciz	"without"

	.section	.rodata._.str.2596,"a",@progbits
	.balign	1
	.local	_.str.2596
_.str.2596:
	.asciz	"women"

	.section	.rodata._.str.2597,"a",@progbits
	.balign	1
	.local	_.str.2597
_.str.2597:
	.asciz	"word"

	.section	.rodata._.str.2598,"a",@progbits
	.balign	1
	.local	_.str.2598
_.str.2598:
	.asciz	"wording"

	.section	.rodata._.str.2599,"a",@progbits
	.balign	1
	.local	_.str.2599
_.str.2599:
	.asciz	"words"

	.section	.rodata._.str.2600,"a",@progbits
	.balign	1
	.local	_.str.2600
_.str.2600:
	.asciz	"work"

	.section	.rodata._.str.2601,"a",@progbits
	.balign	1
	.local	_.str.2601
_.str.2601:
	.asciz	"worked"

	.section	.rodata._.str.2602,"a",@progbits
	.balign	1
	.local	_.str.2602
_.str.2602:
	.asciz	"workers"

	.section	.rodata._.str.2603,"a",@progbits
	.balign	1
	.local	_.str.2603
_.str.2603:
	.asciz	"working"

	.section	.rodata._.str.2604,"a",@progbits
	.balign	1
	.local	_.str.2604
_.str.2604:
	.asciz	"works"

	.section	.rodata._.str.2605,"a",@progbits
	.balign	1
	.local	_.str.2605
_.str.2605:
	.asciz	"world"

	.section	.rodata._.str.2606,"a",@progbits
	.balign	1
	.local	_.str.2606
_.str.2606:
	.asciz	"would"

	.section	.rodata._.str.2607,"a",@progbits
	.balign	1
	.local	_.str.2607
_.str.2607:
	.asciz	"wounds"

	.section	.rodata._.str.2608,"a",@progbits
	.balign	1
	.local	_.str.2608
_.str.2608:
	.asciz	"write"

	.section	.rodata._.str.2609,"a",@progbits
	.balign	1
	.local	_.str.2609
_.str.2609:
	.asciz	"writing"

	.section	.rodata._.str.2610,"a",@progbits
	.balign	1
	.local	_.str.2610
_.str.2610:
	.asciz	"wrong"

	.section	.rodata._.str.2611,"a",@progbits
	.balign	1
	.local	_.str.2611
_.str.2611:
	.asciz	"wrote"

	.section	.rodata._.str.2612,"a",@progbits
	.balign	1
	.local	_.str.2612
_.str.2612:
	.asciz	"wwii"

	.section	.rodata._.str.2613,"a",@progbits
	.balign	1
	.local	_.str.2613
_.str.2613:
	.asciz	"xbar"

	.section	.rodata._.str.2614,"a",@progbits
	.balign	1
	.local	_.str.2614
_.str.2614:
	.asciz	"xiii"

	.section	.rodata._.str.2615,"a",@progbits
	.balign	1
	.local	_.str.2615
_.str.2615:
	.asciz	"xlist"

	.section	.rodata._.str.2616,"a",@progbits
	.balign	1
	.local	_.str.2616
_.str.2616:
	.asciz	"xmax"

	.section	.rodata._.str.2617,"a",@progbits
	.balign	1
	.local	_.str.2617
_.str.2617:
	.asciz	"xmin"

	.section	.rodata._.str.2618,"a",@progbits
	.balign	1
	.local	_.str.2618
_.str.2618:
	.asciz	"xvii"

	.section	.rodata._.str.2619,"a",@progbits
	.balign	1
	.local	_.str.2619
_.str.2619:
	.asciz	"ybar"

	.section	.rodata._.str.2620,"a",@progbits
	.balign	1
	.local	_.str.2620
_.str.2620:
	.asciz	"year"

	.section	.rodata._.str.2621,"a",@progbits
	.balign	1
	.local	_.str.2621
_.str.2621:
	.asciz	"years"

	.section	.rodata._.str.2622,"a",@progbits
	.balign	1
	.local	_.str.2622
_.str.2622:
	.asciz	"yelled"

	.section	.rodata._.str.2623,"a",@progbits
	.balign	1
	.local	_.str.2623
_.str.2623:
	.asciz	"yelling"

	.section	.rodata._.str.2624,"a",@progbits
	.balign	1
	.local	_.str.2624
_.str.2624:
	.asciz	"yellow"

	.section	.rodata._.str.2625,"a",@progbits
	.balign	1
	.local	_.str.2625
_.str.2625:
	.asciz	"yield"

	.section	.rodata._.str.2626,"a",@progbits
	.balign	1
	.local	_.str.2626
_.str.2626:
	.asciz	"your"

	.section	.rodata._.str.2627,"a",@progbits
	.balign	1
	.local	_.str.2627
_.str.2627:
	.asciz	"z"

	.section	.rodata._.str.2628,"a",@progbits
	.balign	1
	.local	_.str.2628
_.str.2628:
	.asciz	"zero"

	.section	.rodata._.str.2629,"a",@progbits
	.balign	1
	.local	_.str.2629
_.str.2629:
	.asciz	"zilog"

	.section	.rodata._.str.2630,"a",@progbits
	.balign	1
	.local	_.str.2630
_.str.2630:
	.asciz	"zoom"

	.section	.rodata._.str.2631,"a",@progbits
	.balign	1
	.local	_.str.2631
_.str.2631:
	.asciz	"zoomstat"

	.section	.data._search_terms,"aw",@progbits
	.balign	1
	.globl	_search_terms
_search_terms:
	d24	_.str.25
	d24	_.str.1.26
	d24	_.str.2.27
	d24	_.str.3.28
	d24	_.str.4.29
	d24	_.str.5.30
	d24	_.str.6.31
	d24	_.str.7.32
	d24	_.str.8.33
	d24	_.str.9.34
	d24	_.str.10.35
	d24	_.str.11.36
	d24	_.str.12.37
	d24	_.str.13.38
	d24	_.str.14.39
	d24	_.str.15.40
	d24	_.str.16.41
	d24	_.str.17.42
	d24	_.str.18.43
	d24	_.str.19.44
	d24	_.str.20.45
	d24	_.str.21.46
	d24	_.str.22.47
	d24	_.str.23.48
	d24	_.str.24.49
	d24	_.str.25.50
	d24	_.str.26
	d24	_.str.27
	d24	_.str.28
	d24	_.str.29
	d24	_.str.30
	d24	_.str.31
	d24	_.str.32
	d24	_.str.33
	d24	_.str.34
	d24	_.str.35
	d24	_.str.36
	d24	_.str.37
	d24	_.str.38
	d24	_.str.39
	d24	_.str.40
	d24	_.str.41
	d24	_.str.42
	d24	_.str.43
	d24	_.str.44
	d24	_.str.45
	d24	_.str.46
	d24	_.str.47
	d24	_.str.48
	d24	_.str.49
	d24	_.str.50
	d24	_.str.51
	d24	_.str.52
	d24	_.str.53
	d24	_.str.54
	d24	_.str.55
	d24	_.str.56
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
	d24	_.str.222
	d24	_.str.223
	d24	_.str.224
	d24	_.str.225
	d24	_.str.226
	d24	_.str.227
	d24	_.str.228
	d24	_.str.229
	d24	_.str.230
	d24	_.str.231
	d24	_.str.232
	d24	_.str.233
	d24	_.str.234
	d24	_.str.235
	d24	_.str.236
	d24	_.str.237
	d24	_.str.238
	d24	_.str.239
	d24	_.str.240
	d24	_.str.241
	d24	_.str.242
	d24	_.str.243
	d24	_.str.244
	d24	_.str.245
	d24	_.str.246
	d24	_.str.247
	d24	_.str.248
	d24	_.str.249
	d24	_.str.250
	d24	_.str.251
	d24	_.str.252
	d24	_.str.253
	d24	_.str.254
	d24	_.str.255
	d24	_.str.256
	d24	_.str.257
	d24	_.str.258
	d24	_.str.259
	d24	_.str.260
	d24	_.str.261
	d24	_.str.262
	d24	_.str.263
	d24	_.str.264
	d24	_.str.265
	d24	_.str.266
	d24	_.str.267
	d24	_.str.268
	d24	_.str.269
	d24	_.str.270
	d24	_.str.271
	d24	_.str.272
	d24	_.str.273
	d24	_.str.274
	d24	_.str.275
	d24	_.str.276
	d24	_.str.277
	d24	_.str.278
	d24	_.str.279
	d24	_.str.280
	d24	_.str.281
	d24	_.str.282
	d24	_.str.283
	d24	_.str.284
	d24	_.str.285
	d24	_.str.286
	d24	_.str.287
	d24	_.str.288
	d24	_.str.289
	d24	_.str.290
	d24	_.str.291
	d24	_.str.292
	d24	_.str.293
	d24	_.str.294
	d24	_.str.295
	d24	_.str.296
	d24	_.str.297
	d24	_.str.298
	d24	_.str.299
	d24	_.str.300
	d24	_.str.301
	d24	_.str.302
	d24	_.str.303
	d24	_.str.304
	d24	_.str.305
	d24	_.str.306
	d24	_.str.307
	d24	_.str.308
	d24	_.str.309
	d24	_.str.310
	d24	_.str.311
	d24	_.str.312
	d24	_.str.313
	d24	_.str.314
	d24	_.str.315
	d24	_.str.316
	d24	_.str.317
	d24	_.str.318
	d24	_.str.319
	d24	_.str.320
	d24	_.str.321
	d24	_.str.322
	d24	_.str.323
	d24	_.str.324
	d24	_.str.325
	d24	_.str.326
	d24	_.str.327
	d24	_.str.328
	d24	_.str.329
	d24	_.str.330
	d24	_.str.331
	d24	_.str.332
	d24	_.str.333
	d24	_.str.334
	d24	_.str.335
	d24	_.str.336
	d24	_.str.337
	d24	_.str.338
	d24	_.str.339
	d24	_.str.340
	d24	_.str.341
	d24	_.str.342
	d24	_.str.343
	d24	_.str.344
	d24	_.str.345
	d24	_.str.346
	d24	_.str.347
	d24	_.str.348
	d24	_.str.349
	d24	_.str.350
	d24	_.str.351
	d24	_.str.352
	d24	_.str.353
	d24	_.str.354
	d24	_.str.355
	d24	_.str.356
	d24	_.str.357
	d24	_.str.358
	d24	_.str.359
	d24	_.str.360
	d24	_.str.361
	d24	_.str.362
	d24	_.str.363
	d24	_.str.364
	d24	_.str.365
	d24	_.str.366
	d24	_.str.367
	d24	_.str.368
	d24	_.str.369
	d24	_.str.370
	d24	_.str.371
	d24	_.str.372
	d24	_.str.373
	d24	_.str.374
	d24	_.str.375
	d24	_.str.376
	d24	_.str.377
	d24	_.str.378
	d24	_.str.379
	d24	_.str.380
	d24	_.str.381
	d24	_.str.382
	d24	_.str.383
	d24	_.str.384
	d24	_.str.385
	d24	_.str.386
	d24	_.str.387
	d24	_.str.388
	d24	_.str.389
	d24	_.str.390
	d24	_.str.391
	d24	_.str.392
	d24	_.str.393
	d24	_.str.394
	d24	_.str.395
	d24	_.str.396
	d24	_.str.397
	d24	_.str.398
	d24	_.str.399
	d24	_.str.400
	d24	_.str.401
	d24	_.str.402
	d24	_.str.403
	d24	_.str.404
	d24	_.str.405
	d24	_.str.406
	d24	_.str.407
	d24	_.str.408
	d24	_.str.409
	d24	_.str.410
	d24	_.str.411
	d24	_.str.412
	d24	_.str.413
	d24	_.str.414
	d24	_.str.415
	d24	_.str.416
	d24	_.str.417
	d24	_.str.418
	d24	_.str.419
	d24	_.str.420
	d24	_.str.421
	d24	_.str.422
	d24	_.str.423
	d24	_.str.424
	d24	_.str.425
	d24	_.str.426
	d24	_.str.427
	d24	_.str.428
	d24	_.str.429
	d24	_.str.430
	d24	_.str.431
	d24	_.str.432
	d24	_.str.433
	d24	_.str.434
	d24	_.str.435
	d24	_.str.436
	d24	_.str.437
	d24	_.str.438
	d24	_.str.439
	d24	_.str.440
	d24	_.str.441
	d24	_.str.442
	d24	_.str.443
	d24	_.str.444
	d24	_.str.445
	d24	_.str.446
	d24	_.str.447
	d24	_.str.448
	d24	_.str.449
	d24	_.str.450
	d24	_.str.451
	d24	_.str.452
	d24	_.str.453
	d24	_.str.454
	d24	_.str.455
	d24	_.str.456
	d24	_.str.457
	d24	_.str.458
	d24	_.str.459
	d24	_.str.460
	d24	_.str.461
	d24	_.str.462
	d24	_.str.463
	d24	_.str.464
	d24	_.str.465
	d24	_.str.466
	d24	_.str.467
	d24	_.str.468
	d24	_.str.469
	d24	_.str.470
	d24	_.str.471
	d24	_.str.472
	d24	_.str.473
	d24	_.str.474
	d24	_.str.475
	d24	_.str.476
	d24	_.str.477
	d24	_.str.478
	d24	_.str.479
	d24	_.str.480
	d24	_.str.481
	d24	_.str.482
	d24	_.str.483
	d24	_.str.484
	d24	_.str.485
	d24	_.str.486
	d24	_.str.487
	d24	_.str.488
	d24	_.str.489
	d24	_.str.490
	d24	_.str.491
	d24	_.str.492
	d24	_.str.493
	d24	_.str.494
	d24	_.str.495
	d24	_.str.496
	d24	_.str.497
	d24	_.str.498
	d24	_.str.499
	d24	_.str.500
	d24	_.str.501
	d24	_.str.502
	d24	_.str.503
	d24	_.str.504
	d24	_.str.505
	d24	_.str.506
	d24	_.str.507
	d24	_.str.508
	d24	_.str.509
	d24	_.str.510
	d24	_.str.511
	d24	_.str.512
	d24	_.str.513
	d24	_.str.514
	d24	_.str.515
	d24	_.str.516
	d24	_.str.517
	d24	_.str.518
	d24	_.str.519
	d24	_.str.520
	d24	_.str.521
	d24	_.str.522
	d24	_.str.523
	d24	_.str.524
	d24	_.str.525
	d24	_.str.526
	d24	_.str.527
	d24	_.str.528
	d24	_.str.529
	d24	_.str.530
	d24	_.str.531
	d24	_.str.532
	d24	_.str.533
	d24	_.str.534
	d24	_.str.535
	d24	_.str.536
	d24	_.str.537
	d24	_.str.538
	d24	_.str.539
	d24	_.str.540
	d24	_.str.541
	d24	_.str.542
	d24	_.str.543
	d24	_.str.544
	d24	_.str.545
	d24	_.str.546
	d24	_.str.547
	d24	_.str.548
	d24	_.str.549
	d24	_.str.550
	d24	_.str.551
	d24	_.str.552
	d24	_.str.553
	d24	_.str.554
	d24	_.str.555
	d24	_.str.556
	d24	_.str.557
	d24	_.str.558
	d24	_.str.559
	d24	_.str.560
	d24	_.str.561
	d24	_.str.562
	d24	_.str.563
	d24	_.str.564
	d24	_.str.565
	d24	_.str.566
	d24	_.str.567
	d24	_.str.568
	d24	_.str.569
	d24	_.str.570
	d24	_.str.571
	d24	_.str.572
	d24	_.str.573
	d24	_.str.574
	d24	_.str.575
	d24	_.str.576
	d24	_.str.577
	d24	_.str.578
	d24	_.str.579
	d24	_.str.580
	d24	_.str.581
	d24	_.str.582
	d24	_.str.583
	d24	_.str.584
	d24	_.str.585
	d24	_.str.586
	d24	_.str.587
	d24	_.str.588
	d24	_.str.589
	d24	_.str.590
	d24	_.str.591
	d24	_.str.592
	d24	_.str.593
	d24	_.str.594
	d24	_.str.595
	d24	_.str.596
	d24	_.str.597
	d24	_.str.598
	d24	_.str.599
	d24	_.str.600
	d24	_.str.601
	d24	_.str.602
	d24	_.str.603
	d24	_.str.604
	d24	_.str.605
	d24	_.str.606
	d24	_.str.607
	d24	_.str.608
	d24	_.str.609
	d24	_.str.610
	d24	_.str.611
	d24	_.str.612
	d24	_.str.613
	d24	_.str.614
	d24	_.str.615
	d24	_.str.616
	d24	_.str.617
	d24	_.str.618
	d24	_.str.619
	d24	_.str.620
	d24	_.str.621
	d24	_.str.622
	d24	_.str.623
	d24	_.str.624
	d24	_.str.625
	d24	_.str.626
	d24	_.str.627
	d24	_.str.628
	d24	_.str.629
	d24	_.str.630
	d24	_.str.631
	d24	_.str.632
	d24	_.str.633
	d24	_.str.634
	d24	_.str.635
	d24	_.str.636
	d24	_.str.637
	d24	_.str.638
	d24	_.str.639
	d24	_.str.640
	d24	_.str.641
	d24	_.str.642
	d24	_.str.643
	d24	_.str.644
	d24	_.str.645
	d24	_.str.646
	d24	_.str.647
	d24	_.str.648
	d24	_.str.649
	d24	_.str.650
	d24	_.str.651
	d24	_.str.652
	d24	_.str.653
	d24	_.str.654
	d24	_.str.655
	d24	_.str.656
	d24	_.str.657
	d24	_.str.658
	d24	_.str.659
	d24	_.str.660
	d24	_.str.661
	d24	_.str.662
	d24	_.str.663
	d24	_.str.664
	d24	_.str.665
	d24	_.str.666
	d24	_.str.667
	d24	_.str.668
	d24	_.str.669
	d24	_.str.670
	d24	_.str.671
	d24	_.str.672
	d24	_.str.673
	d24	_.str.674
	d24	_.str.675
	d24	_.str.676
	d24	_.str.677
	d24	_.str.678
	d24	_.str.679
	d24	_.str.680
	d24	_.str.681
	d24	_.str.682
	d24	_.str.683
	d24	_.str.684
	d24	_.str.685
	d24	_.str.686
	d24	_.str.687
	d24	_.str.688
	d24	_.str.689
	d24	_.str.690
	d24	_.str.691
	d24	_.str.692
	d24	_.str.693
	d24	_.str.694
	d24	_.str.695
	d24	_.str.696
	d24	_.str.697
	d24	_.str.698
	d24	_.str.699
	d24	_.str.700
	d24	_.str.701
	d24	_.str.702
	d24	_.str.703
	d24	_.str.704
	d24	_.str.705
	d24	_.str.706
	d24	_.str.707
	d24	_.str.708
	d24	_.str.709
	d24	_.str.710
	d24	_.str.711
	d24	_.str.712
	d24	_.str.713
	d24	_.str.714
	d24	_.str.715
	d24	_.str.716
	d24	_.str.717
	d24	_.str.718
	d24	_.str.719
	d24	_.str.720
	d24	_.str.721
	d24	_.str.722
	d24	_.str.723
	d24	_.str.724
	d24	_.str.725
	d24	_.str.726
	d24	_.str.727
	d24	_.str.728
	d24	_.str.729
	d24	_.str.730
	d24	_.str.731
	d24	_.str.732
	d24	_.str.733
	d24	_.str.734
	d24	_.str.735
	d24	_.str.736
	d24	_.str.737
	d24	_.str.738
	d24	_.str.739
	d24	_.str.740
	d24	_.str.741
	d24	_.str.742
	d24	_.str.743
	d24	_.str.744
	d24	_.str.745
	d24	_.str.746
	d24	_.str.747
	d24	_.str.748
	d24	_.str.749
	d24	_.str.750
	d24	_.str.751
	d24	_.str.752
	d24	_.str.753
	d24	_.str.754
	d24	_.str.755
	d24	_.str.756
	d24	_.str.757
	d24	_.str.758
	d24	_.str.759
	d24	_.str.760
	d24	_.str.761
	d24	_.str.762
	d24	_.str.763
	d24	_.str.764
	d24	_.str.765
	d24	_.str.766
	d24	_.str.767
	d24	_.str.768
	d24	_.str.769
	d24	_.str.770
	d24	_.str.771
	d24	_.str.772
	d24	_.str.773
	d24	_.str.774
	d24	_.str.775
	d24	_.str.776
	d24	_.str.777
	d24	_.str.778
	d24	_.str.779
	d24	_.str.780
	d24	_.str.781
	d24	_.str.782
	d24	_.str.783
	d24	_.str.784
	d24	_.str.785
	d24	_.str.786
	d24	_.str.787
	d24	_.str.788
	d24	_.str.789
	d24	_.str.790
	d24	_.str.791
	d24	_.str.792
	d24	_.str.793
	d24	_.str.794
	d24	_.str.795
	d24	_.str.796
	d24	_.str.797
	d24	_.str.798
	d24	_.str.799
	d24	_.str.800
	d24	_.str.801
	d24	_.str.802
	d24	_.str.803
	d24	_.str.804
	d24	_.str.805
	d24	_.str.806
	d24	_.str.807
	d24	_.str.808
	d24	_.str.809
	d24	_.str.810
	d24	_.str.811
	d24	_.str.812
	d24	_.str.813
	d24	_.str.814
	d24	_.str.815
	d24	_.str.816
	d24	_.str.817
	d24	_.str.818
	d24	_.str.819
	d24	_.str.820
	d24	_.str.821
	d24	_.str.822
	d24	_.str.823
	d24	_.str.824
	d24	_.str.825
	d24	_.str.826
	d24	_.str.827
	d24	_.str.828
	d24	_.str.829
	d24	_.str.830
	d24	_.str.831
	d24	_.str.832
	d24	_.str.833
	d24	_.str.834
	d24	_.str.835
	d24	_.str.836
	d24	_.str.837
	d24	_.str.838
	d24	_.str.839
	d24	_.str.840
	d24	_.str.841
	d24	_.str.842
	d24	_.str.843
	d24	_.str.844
	d24	_.str.845
	d24	_.str.846
	d24	_.str.847
	d24	_.str.848
	d24	_.str.849
	d24	_.str.850
	d24	_.str.851
	d24	_.str.852
	d24	_.str.853
	d24	_.str.854
	d24	_.str.855
	d24	_.str.856
	d24	_.str.857
	d24	_.str.858
	d24	_.str.859
	d24	_.str.860
	d24	_.str.861
	d24	_.str.862
	d24	_.str.863
	d24	_.str.864
	d24	_.str.865
	d24	_.str.866
	d24	_.str.867
	d24	_.str.868
	d24	_.str.869
	d24	_.str.870
	d24	_.str.871
	d24	_.str.872
	d24	_.str.873
	d24	_.str.874
	d24	_.str.875
	d24	_.str.876
	d24	_.str.877
	d24	_.str.878
	d24	_.str.879
	d24	_.str.880
	d24	_.str.881
	d24	_.str.882
	d24	_.str.883
	d24	_.str.884
	d24	_.str.885
	d24	_.str.886
	d24	_.str.887
	d24	_.str.888
	d24	_.str.889
	d24	_.str.890
	d24	_.str.891
	d24	_.str.892
	d24	_.str.893
	d24	_.str.894
	d24	_.str.895
	d24	_.str.896
	d24	_.str.897
	d24	_.str.898
	d24	_.str.899
	d24	_.str.900
	d24	_.str.901
	d24	_.str.902
	d24	_.str.903
	d24	_.str.904
	d24	_.str.905
	d24	_.str.906
	d24	_.str.907
	d24	_.str.908
	d24	_.str.909
	d24	_.str.910
	d24	_.str.911
	d24	_.str.912
	d24	_.str.913
	d24	_.str.914
	d24	_.str.915
	d24	_.str.916
	d24	_.str.917
	d24	_.str.918
	d24	_.str.919
	d24	_.str.920
	d24	_.str.921
	d24	_.str.922
	d24	_.str.923
	d24	_.str.924
	d24	_.str.925
	d24	_.str.926
	d24	_.str.927
	d24	_.str.928
	d24	_.str.929
	d24	_.str.930
	d24	_.str.931
	d24	_.str.932
	d24	_.str.933
	d24	_.str.934
	d24	_.str.935
	d24	_.str.936
	d24	_.str.937
	d24	_.str.938
	d24	_.str.939
	d24	_.str.940
	d24	_.str.941
	d24	_.str.942
	d24	_.str.943
	d24	_.str.944
	d24	_.str.945
	d24	_.str.946
	d24	_.str.947
	d24	_.str.948
	d24	_.str.949
	d24	_.str.950
	d24	_.str.951
	d24	_.str.952
	d24	_.str.953
	d24	_.str.954
	d24	_.str.955
	d24	_.str.956
	d24	_.str.957
	d24	_.str.958
	d24	_.str.959
	d24	_.str.960
	d24	_.str.961
	d24	_.str.962
	d24	_.str.963
	d24	_.str.964
	d24	_.str.965
	d24	_.str.966
	d24	_.str.967
	d24	_.str.968
	d24	_.str.969
	d24	_.str.970
	d24	_.str.971
	d24	_.str.972
	d24	_.str.973
	d24	_.str.974
	d24	_.str.975
	d24	_.str.976
	d24	_.str.977
	d24	_.str.978
	d24	_.str.979
	d24	_.str.980
	d24	_.str.981
	d24	_.str.982
	d24	_.str.983
	d24	_.str.984
	d24	_.str.985
	d24	_.str.986
	d24	_.str.987
	d24	_.str.988
	d24	_.str.989
	d24	_.str.990
	d24	_.str.991
	d24	_.str.992
	d24	_.str.993
	d24	_.str.994
	d24	_.str.995
	d24	_.str.996
	d24	_.str.997
	d24	_.str.998
	d24	_.str.999
	d24	_.str.1000
	d24	_.str.1001
	d24	_.str.1002
	d24	_.str.1003
	d24	_.str.1004
	d24	_.str.1005
	d24	_.str.1006
	d24	_.str.1007
	d24	_.str.1008
	d24	_.str.1009
	d24	_.str.1010
	d24	_.str.1011
	d24	_.str.1012
	d24	_.str.1013
	d24	_.str.1014
	d24	_.str.1015
	d24	_.str.1016
	d24	_.str.1017
	d24	_.str.1018
	d24	_.str.1019
	d24	_.str.1020
	d24	_.str.1021
	d24	_.str.1022
	d24	_.str.1023
	d24	_.str.1024
	d24	_.str.1025
	d24	_.str.1026
	d24	_.str.1027
	d24	_.str.1028
	d24	_.str.1029
	d24	_.str.1030
	d24	_.str.1031
	d24	_.str.1032
	d24	_.str.1033
	d24	_.str.1034
	d24	_.str.1035
	d24	_.str.1036
	d24	_.str.1037
	d24	_.str.1038
	d24	_.str.1039
	d24	_.str.1040
	d24	_.str.1041
	d24	_.str.1042
	d24	_.str.1043
	d24	_.str.1044
	d24	_.str.1045
	d24	_.str.1046
	d24	_.str.1047
	d24	_.str.1048
	d24	_.str.1049
	d24	_.str.1050
	d24	_.str.1051
	d24	_.str.1052
	d24	_.str.1053
	d24	_.str.1054
	d24	_.str.1055
	d24	_.str.1056
	d24	_.str.1057
	d24	_.str.1058
	d24	_.str.1059
	d24	_.str.1060
	d24	_.str.1061
	d24	_.str.1062
	d24	_.str.1063
	d24	_.str.1064
	d24	_.str.1065
	d24	_.str.1066
	d24	_.str.1067
	d24	_.str.1068
	d24	_.str.1069
	d24	_.str.1070
	d24	_.str.1071
	d24	_.str.1072
	d24	_.str.1073
	d24	_.str.1074
	d24	_.str.1075
	d24	_.str.1076
	d24	_.str.1077
	d24	_.str.1078
	d24	_.str.1079
	d24	_.str.1080
	d24	_.str.1081
	d24	_.str.1082
	d24	_.str.1083
	d24	_.str.1084
	d24	_.str.1085
	d24	_.str.1086
	d24	_.str.1087
	d24	_.str.1088
	d24	_.str.1089
	d24	_.str.1090
	d24	_.str.1091
	d24	_.str.1092
	d24	_.str.1093
	d24	_.str.1094
	d24	_.str.1095
	d24	_.str.1096
	d24	_.str.1097
	d24	_.str.1098
	d24	_.str.1099
	d24	_.str.1100
	d24	_.str.1101
	d24	_.str.1102
	d24	_.str.1103
	d24	_.str.1104
	d24	_.str.1105
	d24	_.str.1106
	d24	_.str.1107
	d24	_.str.1108
	d24	_.str.1109
	d24	_.str.1110
	d24	_.str.1111
	d24	_.str.1112
	d24	_.str.1113
	d24	_.str.1114
	d24	_.str.1115
	d24	_.str.1116
	d24	_.str.1117
	d24	_.str.1118
	d24	_.str.1119
	d24	_.str.1120
	d24	_.str.1121
	d24	_.str.1122
	d24	_.str.1123
	d24	_.str.1124
	d24	_.str.1125
	d24	_.str.1126
	d24	_.str.1127
	d24	_.str.1128
	d24	_.str.1129
	d24	_.str.1130
	d24	_.str.1131
	d24	_.str.1132
	d24	_.str.1133
	d24	_.str.1134
	d24	_.str.1135
	d24	_.str.1136
	d24	_.str.1137
	d24	_.str.1138
	d24	_.str.1139
	d24	_.str.1140
	d24	_.str.1141
	d24	_.str.1142
	d24	_.str.1143
	d24	_.str.1144
	d24	_.str.1145
	d24	_.str.1146
	d24	_.str.1147
	d24	_.str.1148
	d24	_.str.1149
	d24	_.str.1150
	d24	_.str.1151
	d24	_.str.1152
	d24	_.str.1153
	d24	_.str.1154
	d24	_.str.1155
	d24	_.str.1156
	d24	_.str.1157
	d24	_.str.1158
	d24	_.str.1159
	d24	_.str.1160
	d24	_.str.1161
	d24	_.str.1162
	d24	_.str.1163
	d24	_.str.1164
	d24	_.str.1165
	d24	_.str.1166
	d24	_.str.1167
	d24	_.str.1168
	d24	_.str.1169
	d24	_.str.1170
	d24	_.str.1171
	d24	_.str.1172
	d24	_.str.1173
	d24	_.str.1174
	d24	_.str.1175
	d24	_.str.1176
	d24	_.str.1177
	d24	_.str.1178
	d24	_.str.1179
	d24	_.str.1180
	d24	_.str.1181
	d24	_.str.1182
	d24	_.str.1183
	d24	_.str.1184
	d24	_.str.1185
	d24	_.str.1186
	d24	_.str.1187
	d24	_.str.1188
	d24	_.str.1189
	d24	_.str.1190
	d24	_.str.1191
	d24	_.str.1192
	d24	_.str.1193
	d24	_.str.1194
	d24	_.str.1195
	d24	_.str.1196
	d24	_.str.1197
	d24	_.str.1198
	d24	_.str.1199
	d24	_.str.1200
	d24	_.str.1201
	d24	_.str.1202
	d24	_.str.1203
	d24	_.str.1204
	d24	_.str.1205
	d24	_.str.1206
	d24	_.str.1207
	d24	_.str.1208
	d24	_.str.1209
	d24	_.str.1210
	d24	_.str.1211
	d24	_.str.1212
	d24	_.str.1213
	d24	_.str.1214
	d24	_.str.1215
	d24	_.str.1216
	d24	_.str.1217
	d24	_.str.1218
	d24	_.str.1219
	d24	_.str.1220
	d24	_.str.1221
	d24	_.str.1222
	d24	_.str.1223
	d24	_.str.1224
	d24	_.str.1225
	d24	_.str.1226
	d24	_.str.1227
	d24	_.str.1228
	d24	_.str.1229
	d24	_.str.1230
	d24	_.str.1231
	d24	_.str.1232
	d24	_.str.1233
	d24	_.str.1234
	d24	_.str.1235
	d24	_.str.1236
	d24	_.str.1237
	d24	_.str.1238
	d24	_.str.1239
	d24	_.str.1240
	d24	_.str.1241
	d24	_.str.1242
	d24	_.str.1243
	d24	_.str.1244
	d24	_.str.1245
	d24	_.str.1246
	d24	_.str.1247
	d24	_.str.1248
	d24	_.str.1249
	d24	_.str.1250
	d24	_.str.1251
	d24	_.str.1252
	d24	_.str.1253
	d24	_.str.1254
	d24	_.str.1255
	d24	_.str.1256
	d24	_.str.1257
	d24	_.str.1258
	d24	_.str.1259
	d24	_.str.1260
	d24	_.str.1261
	d24	_.str.1262
	d24	_.str.1263
	d24	_.str.1264
	d24	_.str.1265
	d24	_.str.1266
	d24	_.str.1267
	d24	_.str.1268
	d24	_.str.1269
	d24	_.str.1270
	d24	_.str.1271
	d24	_.str.1272
	d24	_.str.1273
	d24	_.str.1274
	d24	_.str.1275
	d24	_.str.1276
	d24	_.str.1277
	d24	_.str.1278
	d24	_.str.1279
	d24	_.str.1280
	d24	_.str.1281
	d24	_.str.1282
	d24	_.str.1283
	d24	_.str.1284
	d24	_.str.1285
	d24	_.str.1286
	d24	_.str.1287
	d24	_.str.1288
	d24	_.str.1289
	d24	_.str.1290
	d24	_.str.1291
	d24	_.str.1292
	d24	_.str.1293
	d24	_.str.1294
	d24	_.str.1295
	d24	_.str.1296
	d24	_.str.1297
	d24	_.str.1298
	d24	_.str.1299
	d24	_.str.1300
	d24	_.str.1301
	d24	_.str.1302
	d24	_.str.1303
	d24	_.str.1304
	d24	_.str.1305
	d24	_.str.1306
	d24	_.str.1307
	d24	_.str.1308
	d24	_.str.1309
	d24	_.str.1310
	d24	_.str.1311
	d24	_.str.1312
	d24	_.str.1313
	d24	_.str.1314
	d24	_.str.1315
	d24	_.str.1316
	d24	_.str.1317
	d24	_.str.1318
	d24	_.str.1319
	d24	_.str.1320
	d24	_.str.1321
	d24	_.str.1322
	d24	_.str.1323
	d24	_.str.1324
	d24	_.str.1325
	d24	_.str.1326
	d24	_.str.1327
	d24	_.str.1328
	d24	_.str.1329
	d24	_.str.1330
	d24	_.str.1331
	d24	_.str.1332
	d24	_.str.1333
	d24	_.str.1334
	d24	_.str.1335
	d24	_.str.1336
	d24	_.str.1337
	d24	_.str.1338
	d24	_.str.1339
	d24	_.str.1340
	d24	_.str.1341
	d24	_.str.1342
	d24	_.str.1343
	d24	_.str.1344
	d24	_.str.1345
	d24	_.str.1346
	d24	_.str.1347
	d24	_.str.1348
	d24	_.str.1349
	d24	_.str.1350
	d24	_.str.1351
	d24	_.str.1352
	d24	_.str.1353
	d24	_.str.1354
	d24	_.str.1355
	d24	_.str.1356
	d24	_.str.1357
	d24	_.str.1358
	d24	_.str.1359
	d24	_.str.1360
	d24	_.str.1361
	d24	_.str.1362
	d24	_.str.1363
	d24	_.str.1364
	d24	_.str.1365
	d24	_.str.1366
	d24	_.str.1367
	d24	_.str.1368
	d24	_.str.1369
	d24	_.str.1370
	d24	_.str.1371
	d24	_.str.1372
	d24	_.str.1373
	d24	_.str.1374
	d24	_.str.1375
	d24	_.str.1376
	d24	_.str.1377
	d24	_.str.1378
	d24	_.str.1379
	d24	_.str.1380
	d24	_.str.1381
	d24	_.str.1382
	d24	_.str.1383
	d24	_.str.1384
	d24	_.str.1385
	d24	_.str.1386
	d24	_.str.1387
	d24	_.str.1388
	d24	_.str.1389
	d24	_.str.1390
	d24	_.str.1391
	d24	_.str.1392
	d24	_.str.1393
	d24	_.str.1394
	d24	_.str.1395
	d24	_.str.1396
	d24	_.str.1397
	d24	_.str.1398
	d24	_.str.1399
	d24	_.str.1400
	d24	_.str.1401
	d24	_.str.1402
	d24	_.str.1403
	d24	_.str.1404
	d24	_.str.1405
	d24	_.str.1406
	d24	_.str.1407
	d24	_.str.1408
	d24	_.str.1409
	d24	_.str.1410
	d24	_.str.1411
	d24	_.str.1412
	d24	_.str.1413
	d24	_.str.1414
	d24	_.str.1415
	d24	_.str.1416
	d24	_.str.1417
	d24	_.str.1418
	d24	_.str.1419
	d24	_.str.1420
	d24	_.str.1421
	d24	_.str.1422
	d24	_.str.1423
	d24	_.str.1424
	d24	_.str.1425
	d24	_.str.1426
	d24	_.str.1427
	d24	_.str.1428
	d24	_.str.1429
	d24	_.str.1430
	d24	_.str.1431
	d24	_.str.1432
	d24	_.str.1433
	d24	_.str.1434
	d24	_.str.1435
	d24	_.str.1436
	d24	_.str.1437
	d24	_.str.1438
	d24	_.str.1439
	d24	_.str.1440
	d24	_.str.1441
	d24	_.str.1442
	d24	_.str.1443
	d24	_.str.1444
	d24	_.str.1445
	d24	_.str.1446
	d24	_.str.1447
	d24	_.str.1448
	d24	_.str.1449
	d24	_.str.1450
	d24	_.str.1451
	d24	_.str.1452
	d24	_.str.1453
	d24	_.str.1454
	d24	_.str.1455
	d24	_.str.1456
	d24	_.str.1457
	d24	_.str.1458
	d24	_.str.1459
	d24	_.str.1460
	d24	_.str.1461
	d24	_.str.1462
	d24	_.str.1463
	d24	_.str.1464
	d24	_.str.1465
	d24	_.str.1466
	d24	_.str.1467
	d24	_.str.1468
	d24	_.str.1469
	d24	_.str.1470
	d24	_.str.1471
	d24	_.str.1472
	d24	_.str.1473
	d24	_.str.1474
	d24	_.str.1475
	d24	_.str.1476
	d24	_.str.1477
	d24	_.str.1478
	d24	_.str.1479
	d24	_.str.1480
	d24	_.str.1481
	d24	_.str.1482
	d24	_.str.1483
	d24	_.str.1484
	d24	_.str.1485
	d24	_.str.1486
	d24	_.str.1487
	d24	_.str.1488
	d24	_.str.1489
	d24	_.str.1490
	d24	_.str.1491
	d24	_.str.1492
	d24	_.str.1493
	d24	_.str.1494
	d24	_.str.1495
	d24	_.str.1496
	d24	_.str.1497
	d24	_.str.1498
	d24	_.str.1499
	d24	_.str.1500
	d24	_.str.1501
	d24	_.str.1502
	d24	_.str.1503
	d24	_.str.1504
	d24	_.str.1505
	d24	_.str.1506
	d24	_.str.1507
	d24	_.str.1508
	d24	_.str.1509
	d24	_.str.1510
	d24	_.str.1511
	d24	_.str.1512
	d24	_.str.1513
	d24	_.str.1514
	d24	_.str.1515
	d24	_.str.1516
	d24	_.str.1517
	d24	_.str.1518
	d24	_.str.1519
	d24	_.str.1520
	d24	_.str.1521
	d24	_.str.1522
	d24	_.str.1523
	d24	_.str.1524
	d24	_.str.1525
	d24	_.str.1526
	d24	_.str.1527
	d24	_.str.1528
	d24	_.str.1529
	d24	_.str.1530
	d24	_.str.1531
	d24	_.str.1532
	d24	_.str.1533
	d24	_.str.1534
	d24	_.str.1535
	d24	_.str.1536
	d24	_.str.1537
	d24	_.str.1538
	d24	_.str.1539
	d24	_.str.1540
	d24	_.str.1541
	d24	_.str.1542
	d24	_.str.1543
	d24	_.str.1544
	d24	_.str.1545
	d24	_.str.1546
	d24	_.str.1547
	d24	_.str.1548
	d24	_.str.1549
	d24	_.str.1550
	d24	_.str.1551
	d24	_.str.1552
	d24	_.str.1553
	d24	_.str.1554
	d24	_.str.1555
	d24	_.str.1556
	d24	_.str.1557
	d24	_.str.1558
	d24	_.str.1559
	d24	_.str.1560
	d24	_.str.1561
	d24	_.str.1562
	d24	_.str.1563
	d24	_.str.1564
	d24	_.str.1565
	d24	_.str.1566
	d24	_.str.1567
	d24	_.str.1568
	d24	_.str.1569
	d24	_.str.1570
	d24	_.str.1571
	d24	_.str.1572
	d24	_.str.1573
	d24	_.str.1574
	d24	_.str.1575
	d24	_.str.1576
	d24	_.str.1577
	d24	_.str.1578
	d24	_.str.1579
	d24	_.str.1580
	d24	_.str.1581
	d24	_.str.1582
	d24	_.str.1583
	d24	_.str.1584
	d24	_.str.1585
	d24	_.str.1586
	d24	_.str.1587
	d24	_.str.1588
	d24	_.str.1589
	d24	_.str.1590
	d24	_.str.1591
	d24	_.str.1592
	d24	_.str.1593
	d24	_.str.1594
	d24	_.str.1595
	d24	_.str.1596
	d24	_.str.1597
	d24	_.str.1598
	d24	_.str.1599
	d24	_.str.1600
	d24	_.str.1601
	d24	_.str.1602
	d24	_.str.1603
	d24	_.str.1604
	d24	_.str.1605
	d24	_.str.1606
	d24	_.str.1607
	d24	_.str.1608
	d24	_.str.1609
	d24	_.str.1610
	d24	_.str.1611
	d24	_.str.1612
	d24	_.str.1613
	d24	_.str.1614
	d24	_.str.1615
	d24	_.str.1616
	d24	_.str.1617
	d24	_.str.1618
	d24	_.str.1619
	d24	_.str.1620
	d24	_.str.1621
	d24	_.str.1622
	d24	_.str.1623
	d24	_.str.1624
	d24	_.str.1625
	d24	_.str.1626
	d24	_.str.1627
	d24	_.str.1628
	d24	_.str.1629
	d24	_.str.1630
	d24	_.str.1631
	d24	_.str.1632
	d24	_.str.1633
	d24	_.str.1634
	d24	_.str.1635
	d24	_.str.1636
	d24	_.str.1637
	d24	_.str.1638
	d24	_.str.1639
	d24	_.str.1640
	d24	_.str.1641
	d24	_.str.1642
	d24	_.str.1643
	d24	_.str.1644
	d24	_.str.1645
	d24	_.str.1646
	d24	_.str.1647
	d24	_.str.1648
	d24	_.str.1649
	d24	_.str.1650
	d24	_.str.1651
	d24	_.str.1652
	d24	_.str.1653
	d24	_.str.1654
	d24	_.str.1655
	d24	_.str.1656
	d24	_.str.1657
	d24	_.str.1658
	d24	_.str.1659
	d24	_.str.1660
	d24	_.str.1661
	d24	_.str.1662
	d24	_.str.1663
	d24	_.str.1664
	d24	_.str.1665
	d24	_.str.1666
	d24	_.str.1667
	d24	_.str.1668
	d24	_.str.1669
	d24	_.str.1670
	d24	_.str.1671
	d24	_.str.1672
	d24	_.str.1673
	d24	_.str.1674
	d24	_.str.1675
	d24	_.str.1676
	d24	_.str.1677
	d24	_.str.1678
	d24	_.str.1679
	d24	_.str.1680
	d24	_.str.1681
	d24	_.str.1682
	d24	_.str.1683
	d24	_.str.1684
	d24	_.str.1685
	d24	_.str.1686
	d24	_.str.1687
	d24	_.str.1688
	d24	_.str.1689
	d24	_.str.1690
	d24	_.str.1691
	d24	_.str.1692
	d24	_.str.1693
	d24	_.str.1694
	d24	_.str.1695
	d24	_.str.1696
	d24	_.str.1697
	d24	_.str.1698
	d24	_.str.1699
	d24	_.str.1700
	d24	_.str.1701
	d24	_.str.1702
	d24	_.str.1703
	d24	_.str.1704
	d24	_.str.1705
	d24	_.str.1706
	d24	_.str.1707
	d24	_.str.1708
	d24	_.str.1709
	d24	_.str.1710
	d24	_.str.1711
	d24	_.str.1712
	d24	_.str.1713
	d24	_.str.1714
	d24	_.str.1715
	d24	_.str.1716
	d24	_.str.1717
	d24	_.str.1718
	d24	_.str.1719
	d24	_.str.1720
	d24	_.str.1721
	d24	_.str.1722
	d24	_.str.1723
	d24	_.str.1724
	d24	_.str.1725
	d24	_.str.1726
	d24	_.str.1727
	d24	_.str.1728
	d24	_.str.1729
	d24	_.str.1730
	d24	_.str.1731
	d24	_.str.1732
	d24	_.str.1733
	d24	_.str.1734
	d24	_.str.1735
	d24	_.str.1736
	d24	_.str.1737
	d24	_.str.1738
	d24	_.str.1739
	d24	_.str.1740
	d24	_.str.1741
	d24	_.str.1742
	d24	_.str.1743
	d24	_.str.1744
	d24	_.str.1745
	d24	_.str.1746
	d24	_.str.1747
	d24	_.str.1748
	d24	_.str.1749
	d24	_.str.1750
	d24	_.str.1751
	d24	_.str.1752
	d24	_.str.1753
	d24	_.str.1754
	d24	_.str.1755
	d24	_.str.1756
	d24	_.str.1757
	d24	_.str.1758
	d24	_.str.1759
	d24	_.str.1760
	d24	_.str.1761
	d24	_.str.1762
	d24	_.str.1763
	d24	_.str.1764
	d24	_.str.1765
	d24	_.str.1766
	d24	_.str.1767
	d24	_.str.1768
	d24	_.str.1769
	d24	_.str.1770
	d24	_.str.1771
	d24	_.str.1772
	d24	_.str.1773
	d24	_.str.1774
	d24	_.str.1775
	d24	_.str.1776
	d24	_.str.1777
	d24	_.str.1778
	d24	_.str.1779
	d24	_.str.1780
	d24	_.str.1781
	d24	_.str.1782
	d24	_.str.1783
	d24	_.str.1784
	d24	_.str.1785
	d24	_.str.1786
	d24	_.str.1787
	d24	_.str.1788
	d24	_.str.1789
	d24	_.str.1790
	d24	_.str.1791
	d24	_.str.1792
	d24	_.str.1793
	d24	_.str.1794
	d24	_.str.1795
	d24	_.str.1796
	d24	_.str.1797
	d24	_.str.1798
	d24	_.str.1799
	d24	_.str.1800
	d24	_.str.1801
	d24	_.str.1802
	d24	_.str.1803
	d24	_.str.1804
	d24	_.str.1805
	d24	_.str.1806
	d24	_.str.1807
	d24	_.str.1808
	d24	_.str.1809
	d24	_.str.1810
	d24	_.str.1811
	d24	_.str.1812
	d24	_.str.1813
	d24	_.str.1814
	d24	_.str.1815
	d24	_.str.1816
	d24	_.str.1817
	d24	_.str.1818
	d24	_.str.1819
	d24	_.str.1820
	d24	_.str.1821
	d24	_.str.1822
	d24	_.str.1823
	d24	_.str.1824
	d24	_.str.1825
	d24	_.str.1826
	d24	_.str.1827
	d24	_.str.1828
	d24	_.str.1829
	d24	_.str.1830
	d24	_.str.1831
	d24	_.str.1832
	d24	_.str.1833
	d24	_.str.1834
	d24	_.str.1835
	d24	_.str.1836
	d24	_.str.1837
	d24	_.str.1838
	d24	_.str.1839
	d24	_.str.1840
	d24	_.str.1841
	d24	_.str.1842
	d24	_.str.1843
	d24	_.str.1844
	d24	_.str.1845
	d24	_.str.1846
	d24	_.str.1847
	d24	_.str.1848
	d24	_.str.1849
	d24	_.str.1850
	d24	_.str.1851
	d24	_.str.1852
	d24	_.str.1853
	d24	_.str.1854
	d24	_.str.1855
	d24	_.str.1856
	d24	_.str.1857
	d24	_.str.1858
	d24	_.str.1859
	d24	_.str.1860
	d24	_.str.1861
	d24	_.str.1862
	d24	_.str.1863
	d24	_.str.1864
	d24	_.str.1865
	d24	_.str.1866
	d24	_.str.1867
	d24	_.str.1868
	d24	_.str.1869
	d24	_.str.1870
	d24	_.str.1871
	d24	_.str.1872
	d24	_.str.1873
	d24	_.str.1874
	d24	_.str.1875
	d24	_.str.1876
	d24	_.str.1877
	d24	_.str.1878
	d24	_.str.1879
	d24	_.str.1880
	d24	_.str.1881
	d24	_.str.1882
	d24	_.str.1883
	d24	_.str.1884
	d24	_.str.1885
	d24	_.str.1886
	d24	_.str.1887
	d24	_.str.1888
	d24	_.str.1889
	d24	_.str.1890
	d24	_.str.1891
	d24	_.str.1892
	d24	_.str.1893
	d24	_.str.1894
	d24	_.str.1895
	d24	_.str.1896
	d24	_.str.1897
	d24	_.str.1898
	d24	_.str.1899
	d24	_.str.1900
	d24	_.str.1901
	d24	_.str.1902
	d24	_.str.1903
	d24	_.str.1904
	d24	_.str.1905
	d24	_.str.1906
	d24	_.str.1907
	d24	_.str.1908
	d24	_.str.1909
	d24	_.str.1910
	d24	_.str.1911
	d24	_.str.1912
	d24	_.str.1913
	d24	_.str.1914
	d24	_.str.1915
	d24	_.str.1916
	d24	_.str.1917
	d24	_.str.1918
	d24	_.str.1919
	d24	_.str.1920
	d24	_.str.1921
	d24	_.str.1922
	d24	_.str.1923
	d24	_.str.1924
	d24	_.str.1925
	d24	_.str.1926
	d24	_.str.1927
	d24	_.str.1928
	d24	_.str.1929
	d24	_.str.1930
	d24	_.str.1931
	d24	_.str.1932
	d24	_.str.1933
	d24	_.str.1934
	d24	_.str.1935
	d24	_.str.1936
	d24	_.str.1937
	d24	_.str.1938
	d24	_.str.1939
	d24	_.str.1940
	d24	_.str.1941
	d24	_.str.1942
	d24	_.str.1943
	d24	_.str.1944
	d24	_.str.1945
	d24	_.str.1946
	d24	_.str.1947
	d24	_.str.1948
	d24	_.str.1949
	d24	_.str.1950
	d24	_.str.1951
	d24	_.str.1952
	d24	_.str.1953
	d24	_.str.1954
	d24	_.str.1955
	d24	_.str.1956
	d24	_.str.1957
	d24	_.str.1958
	d24	_.str.1959
	d24	_.str.1960
	d24	_.str.1961
	d24	_.str.1962
	d24	_.str.1963
	d24	_.str.1964
	d24	_.str.1965
	d24	_.str.1966
	d24	_.str.1967
	d24	_.str.1968
	d24	_.str.1969
	d24	_.str.1970
	d24	_.str.1971
	d24	_.str.1972
	d24	_.str.1973
	d24	_.str.1974
	d24	_.str.1975
	d24	_.str.1976
	d24	_.str.1977
	d24	_.str.1978
	d24	_.str.1979
	d24	_.str.1980
	d24	_.str.1981
	d24	_.str.1982
	d24	_.str.1983
	d24	_.str.1984
	d24	_.str.1985
	d24	_.str.1986
	d24	_.str.1987
	d24	_.str.1988
	d24	_.str.1989
	d24	_.str.1990
	d24	_.str.1991
	d24	_.str.1992
	d24	_.str.1993
	d24	_.str.1994
	d24	_.str.1995
	d24	_.str.1996
	d24	_.str.1997
	d24	_.str.1998
	d24	_.str.1999
	d24	_.str.2000
	d24	_.str.2001
	d24	_.str.2002
	d24	_.str.2003
	d24	_.str.2004
	d24	_.str.2005
	d24	_.str.2006
	d24	_.str.2007
	d24	_.str.2008
	d24	_.str.2009
	d24	_.str.2010
	d24	_.str.2011
	d24	_.str.2012
	d24	_.str.2013
	d24	_.str.2014
	d24	_.str.2015
	d24	_.str.2016
	d24	_.str.2017
	d24	_.str.2018
	d24	_.str.2019
	d24	_.str.2020
	d24	_.str.2021
	d24	_.str.2022
	d24	_.str.2023
	d24	_.str.2024
	d24	_.str.2025
	d24	_.str.2026
	d24	_.str.2027
	d24	_.str.2028
	d24	_.str.2029
	d24	_.str.2030
	d24	_.str.2031
	d24	_.str.2032
	d24	_.str.2033
	d24	_.str.2034
	d24	_.str.2035
	d24	_.str.2036
	d24	_.str.2037
	d24	_.str.2038
	d24	_.str.2039
	d24	_.str.2040
	d24	_.str.2041
	d24	_.str.2042
	d24	_.str.2043
	d24	_.str.2044
	d24	_.str.2045
	d24	_.str.2046
	d24	_.str.2047
	d24	_.str.2048
	d24	_.str.2049
	d24	_.str.2050
	d24	_.str.2051
	d24	_.str.2052
	d24	_.str.2053
	d24	_.str.2054
	d24	_.str.2055
	d24	_.str.2056
	d24	_.str.2057
	d24	_.str.2058
	d24	_.str.2059
	d24	_.str.2060
	d24	_.str.2061
	d24	_.str.2062
	d24	_.str.2063
	d24	_.str.2064
	d24	_.str.2065
	d24	_.str.2066
	d24	_.str.2067
	d24	_.str.2068
	d24	_.str.2069
	d24	_.str.2070
	d24	_.str.2071
	d24	_.str.2072
	d24	_.str.2073
	d24	_.str.2074
	d24	_.str.2075
	d24	_.str.2076
	d24	_.str.2077
	d24	_.str.2078
	d24	_.str.2079
	d24	_.str.2080
	d24	_.str.2081
	d24	_.str.2082
	d24	_.str.2083
	d24	_.str.2084
	d24	_.str.2085
	d24	_.str.2086
	d24	_.str.2087
	d24	_.str.2088
	d24	_.str.2089
	d24	_.str.2090
	d24	_.str.2091
	d24	_.str.2092
	d24	_.str.2093
	d24	_.str.2094
	d24	_.str.2095
	d24	_.str.2096
	d24	_.str.2097
	d24	_.str.2098
	d24	_.str.2099
	d24	_.str.2100
	d24	_.str.2101
	d24	_.str.2102
	d24	_.str.2103
	d24	_.str.2104
	d24	_.str.2105
	d24	_.str.2106
	d24	_.str.2107
	d24	_.str.2108
	d24	_.str.2109
	d24	_.str.2110
	d24	_.str.2111
	d24	_.str.2112
	d24	_.str.2113
	d24	_.str.2114
	d24	_.str.2115
	d24	_.str.2116
	d24	_.str.2117
	d24	_.str.2118
	d24	_.str.2119
	d24	_.str.2120
	d24	_.str.2121
	d24	_.str.2122
	d24	_.str.2123
	d24	_.str.2124
	d24	_.str.2125
	d24	_.str.2126
	d24	_.str.2127
	d24	_.str.2128
	d24	_.str.2129
	d24	_.str.2130
	d24	_.str.2131
	d24	_.str.2132
	d24	_.str.2133
	d24	_.str.2134
	d24	_.str.2135
	d24	_.str.2136
	d24	_.str.2137
	d24	_.str.2138
	d24	_.str.2139
	d24	_.str.2140
	d24	_.str.2141
	d24	_.str.2142
	d24	_.str.2143
	d24	_.str.2144
	d24	_.str.2145
	d24	_.str.2146
	d24	_.str.2147
	d24	_.str.2148
	d24	_.str.2149
	d24	_.str.2150
	d24	_.str.2151
	d24	_.str.2152
	d24	_.str.2153
	d24	_.str.2154
	d24	_.str.2155
	d24	_.str.2156
	d24	_.str.2157
	d24	_.str.2158
	d24	_.str.2159
	d24	_.str.2160
	d24	_.str.2161
	d24	_.str.2162
	d24	_.str.2163
	d24	_.str.2164
	d24	_.str.2165
	d24	_.str.2166
	d24	_.str.2167
	d24	_.str.2168
	d24	_.str.2169
	d24	_.str.2170
	d24	_.str.2171
	d24	_.str.2172
	d24	_.str.2173
	d24	_.str.2174
	d24	_.str.2175
	d24	_.str.2176
	d24	_.str.2177
	d24	_.str.2178
	d24	_.str.2179
	d24	_.str.2180
	d24	_.str.2181
	d24	_.str.2182
	d24	_.str.2183
	d24	_.str.2184
	d24	_.str.2185
	d24	_.str.2186
	d24	_.str.2187
	d24	_.str.2188
	d24	_.str.2189
	d24	_.str.2190
	d24	_.str.2191
	d24	_.str.2192
	d24	_.str.2193
	d24	_.str.2194
	d24	_.str.2195
	d24	_.str.2196
	d24	_.str.2197
	d24	_.str.2198
	d24	_.str.2199
	d24	_.str.2200
	d24	_.str.2201
	d24	_.str.2202
	d24	_.str.2203
	d24	_.str.2204
	d24	_.str.2205
	d24	_.str.2206
	d24	_.str.2207
	d24	_.str.2208
	d24	_.str.2209
	d24	_.str.2210
	d24	_.str.2211
	d24	_.str.2212
	d24	_.str.2213
	d24	_.str.2214
	d24	_.str.2215
	d24	_.str.2216
	d24	_.str.2217
	d24	_.str.2218
	d24	_.str.2219
	d24	_.str.2220
	d24	_.str.2221
	d24	_.str.2222
	d24	_.str.2223
	d24	_.str.2224
	d24	_.str.2225
	d24	_.str.2226
	d24	_.str.2227
	d24	_.str.2228
	d24	_.str.2229
	d24	_.str.2230
	d24	_.str.2231
	d24	_.str.2232
	d24	_.str.2233
	d24	_.str.2234
	d24	_.str.2235
	d24	_.str.2236
	d24	_.str.2237
	d24	_.str.2238
	d24	_.str.2239
	d24	_.str.2240
	d24	_.str.2241
	d24	_.str.2242
	d24	_.str.2243
	d24	_.str.2244
	d24	_.str.2245
	d24	_.str.2246
	d24	_.str.2247
	d24	_.str.2248
	d24	_.str.2249
	d24	_.str.2250
	d24	_.str.2251
	d24	_.str.2252
	d24	_.str.2253
	d24	_.str.2254
	d24	_.str.2255
	d24	_.str.2256
	d24	_.str.2257
	d24	_.str.2258
	d24	_.str.2259
	d24	_.str.2260
	d24	_.str.2261
	d24	_.str.2262
	d24	_.str.2263
	d24	_.str.2264
	d24	_.str.2265
	d24	_.str.2266
	d24	_.str.2267
	d24	_.str.2268
	d24	_.str.2269
	d24	_.str.2270
	d24	_.str.2271
	d24	_.str.2272
	d24	_.str.2273
	d24	_.str.2274
	d24	_.str.2275
	d24	_.str.2276
	d24	_.str.2277
	d24	_.str.2278
	d24	_.str.2279
	d24	_.str.2280
	d24	_.str.2281
	d24	_.str.2282
	d24	_.str.2283
	d24	_.str.2284
	d24	_.str.2285
	d24	_.str.2286
	d24	_.str.2287
	d24	_.str.2288
	d24	_.str.2289
	d24	_.str.2290
	d24	_.str.2291
	d24	_.str.2292
	d24	_.str.2293
	d24	_.str.2294
	d24	_.str.2295
	d24	_.str.2296
	d24	_.str.2297
	d24	_.str.2298
	d24	_.str.2299
	d24	_.str.2300
	d24	_.str.2301
	d24	_.str.2302
	d24	_.str.2303
	d24	_.str.2304
	d24	_.str.2305
	d24	_.str.2306
	d24	_.str.2307
	d24	_.str.2308
	d24	_.str.2309
	d24	_.str.2310
	d24	_.str.2311
	d24	_.str.2312
	d24	_.str.2313
	d24	_.str.2314
	d24	_.str.2315
	d24	_.str.2316
	d24	_.str.2317
	d24	_.str.2318
	d24	_.str.2319
	d24	_.str.2320
	d24	_.str.2321
	d24	_.str.2322
	d24	_.str.2323
	d24	_.str.2324
	d24	_.str.2325
	d24	_.str.2326
	d24	_.str.2327
	d24	_.str.2328
	d24	_.str.2329
	d24	_.str.2330
	d24	_.str.2331
	d24	_.str.2332
	d24	_.str.2333
	d24	_.str.2334
	d24	_.str.2335
	d24	_.str.2336
	d24	_.str.2337
	d24	_.str.2338
	d24	_.str.2339
	d24	_.str.2340
	d24	_.str.2341
	d24	_.str.2342
	d24	_.str.2343
	d24	_.str.2344
	d24	_.str.2345
	d24	_.str.2346
	d24	_.str.2347
	d24	_.str.2348
	d24	_.str.2349
	d24	_.str.2350
	d24	_.str.2351
	d24	_.str.2352
	d24	_.str.2353
	d24	_.str.2354
	d24	_.str.2355
	d24	_.str.2356
	d24	_.str.2357
	d24	_.str.2358
	d24	_.str.2359
	d24	_.str.2360
	d24	_.str.2361
	d24	_.str.2362
	d24	_.str.2363
	d24	_.str.2364
	d24	_.str.2365
	d24	_.str.2366
	d24	_.str.2367
	d24	_.str.2368
	d24	_.str.2369
	d24	_.str.2370
	d24	_.str.2371
	d24	_.str.2372
	d24	_.str.2373
	d24	_.str.2374
	d24	_.str.2375
	d24	_.str.2376
	d24	_.str.2377
	d24	_.str.2378
	d24	_.str.2379
	d24	_.str.2380
	d24	_.str.2381
	d24	_.str.2382
	d24	_.str.2383
	d24	_.str.2384
	d24	_.str.2385
	d24	_.str.2386
	d24	_.str.2387
	d24	_.str.2388
	d24	_.str.2389
	d24	_.str.2390
	d24	_.str.2391
	d24	_.str.2392
	d24	_.str.2393
	d24	_.str.2394
	d24	_.str.2395
	d24	_.str.2396
	d24	_.str.2397
	d24	_.str.2398
	d24	_.str.2399
	d24	_.str.2400
	d24	_.str.2401
	d24	_.str.2402
	d24	_.str.2403
	d24	_.str.2404
	d24	_.str.2405
	d24	_.str.2406
	d24	_.str.2407
	d24	_.str.2408
	d24	_.str.2409
	d24	_.str.2410
	d24	_.str.2411
	d24	_.str.2412
	d24	_.str.2413
	d24	_.str.2414
	d24	_.str.2415
	d24	_.str.2416
	d24	_.str.2417
	d24	_.str.2418
	d24	_.str.2419
	d24	_.str.2420
	d24	_.str.2421
	d24	_.str.2422
	d24	_.str.2423
	d24	_.str.2424
	d24	_.str.2425
	d24	_.str.2426
	d24	_.str.2427
	d24	_.str.2428
	d24	_.str.2429
	d24	_.str.2430
	d24	_.str.2431
	d24	_.str.2432
	d24	_.str.2433
	d24	_.str.2434
	d24	_.str.2435
	d24	_.str.2436
	d24	_.str.2437
	d24	_.str.2438
	d24	_.str.2439
	d24	_.str.2440
	d24	_.str.2441
	d24	_.str.2442
	d24	_.str.2443
	d24	_.str.2444
	d24	_.str.2445
	d24	_.str.2446
	d24	_.str.2447
	d24	_.str.2448
	d24	_.str.2449
	d24	_.str.2450
	d24	_.str.2451
	d24	_.str.2452
	d24	_.str.2453
	d24	_.str.2454
	d24	_.str.2455
	d24	_.str.2456
	d24	_.str.2457
	d24	_.str.2458
	d24	_.str.2459
	d24	_.str.2460
	d24	_.str.2461
	d24	_.str.2462
	d24	_.str.2463
	d24	_.str.2464
	d24	_.str.2465
	d24	_.str.2466
	d24	_.str.2467
	d24	_.str.2468
	d24	_.str.2469
	d24	_.str.2470
	d24	_.str.2471
	d24	_.str.2472
	d24	_.str.2473
	d24	_.str.2474
	d24	_.str.2475
	d24	_.str.2476
	d24	_.str.2477
	d24	_.str.2478
	d24	_.str.2479
	d24	_.str.2480
	d24	_.str.2481
	d24	_.str.2482
	d24	_.str.2483
	d24	_.str.2484
	d24	_.str.2485
	d24	_.str.2486
	d24	_.str.2487
	d24	_.str.2488
	d24	_.str.2489
	d24	_.str.2490
	d24	_.str.2491
	d24	_.str.2492
	d24	_.str.2493
	d24	_.str.2494
	d24	_.str.2495
	d24	_.str.2496
	d24	_.str.2497
	d24	_.str.2498
	d24	_.str.2499
	d24	_.str.2500
	d24	_.str.2501
	d24	_.str.2502
	d24	_.str.2503
	d24	_.str.2504
	d24	_.str.2505
	d24	_.str.2506
	d24	_.str.2507
	d24	_.str.2508
	d24	_.str.2509
	d24	_.str.2510
	d24	_.str.2511
	d24	_.str.2512
	d24	_.str.2513
	d24	_.str.2514
	d24	_.str.2515
	d24	_.str.2516
	d24	_.str.2517
	d24	_.str.2518
	d24	_.str.2519
	d24	_.str.2520
	d24	_.str.2521
	d24	_.str.2522
	d24	_.str.2523
	d24	_.str.2524
	d24	_.str.2525
	d24	_.str.2526
	d24	_.str.2527
	d24	_.str.2528
	d24	_.str.2529
	d24	_.str.2530
	d24	_.str.2531
	d24	_.str.2532
	d24	_.str.2533
	d24	_.str.2534
	d24	_.str.2535
	d24	_.str.2536
	d24	_.str.2537
	d24	_.str.2538
	d24	_.str.2539
	d24	_.str.2540
	d24	_.str.2541
	d24	_.str.2542
	d24	_.str.2543
	d24	_.str.2544
	d24	_.str.2545
	d24	_.str.2546
	d24	_.str.2547
	d24	_.str.2548
	d24	_.str.2549
	d24	_.str.2550
	d24	_.str.2551
	d24	_.str.2552
	d24	_.str.2553
	d24	_.str.2554
	d24	_.str.2555
	d24	_.str.2556
	d24	_.str.2557
	d24	_.str.2558
	d24	_.str.2559
	d24	_.str.2560
	d24	_.str.2561
	d24	_.str.2562
	d24	_.str.2563
	d24	_.str.2564
	d24	_.str.2565
	d24	_.str.2566
	d24	_.str.2567
	d24	_.str.2568
	d24	_.str.2569
	d24	_.str.2570
	d24	_.str.2571
	d24	_.str.2572
	d24	_.str.2573
	d24	_.str.2574
	d24	_.str.2575
	d24	_.str.2576
	d24	_.str.2577
	d24	_.str.2578
	d24	_.str.2579
	d24	_.str.2580
	d24	_.str.2581
	d24	_.str.2582
	d24	_.str.2583
	d24	_.str.2584
	d24	_.str.2585
	d24	_.str.2586
	d24	_.str.2587
	d24	_.str.2588
	d24	_.str.2589
	d24	_.str.2590
	d24	_.str.2591
	d24	_.str.2592
	d24	_.str.2593
	d24	_.str.2594
	d24	_.str.2595
	d24	_.str.2596
	d24	_.str.2597
	d24	_.str.2598
	d24	_.str.2599
	d24	_.str.2600
	d24	_.str.2601
	d24	_.str.2602
	d24	_.str.2603
	d24	_.str.2604
	d24	_.str.2605
	d24	_.str.2606
	d24	_.str.2607
	d24	_.str.2608
	d24	_.str.2609
	d24	_.str.2610
	d24	_.str.2611
	d24	_.str.2612
	d24	_.str.2613
	d24	_.str.2614
	d24	_.str.2615
	d24	_.str.2616
	d24	_.str.2617
	d24	_.str.2618
	d24	_.str.2619
	d24	_.str.2620
	d24	_.str.2621
	d24	_.str.2622
	d24	_.str.2623
	d24	_.str.2624
	d24	_.str.2625
	d24	_.str.2626
	d24	_.str.2627
	d24	_.str.2628
	d24	_.str.2629
	d24	_.str.2630
	d24	_.str.2631

	.section	.rodata._num_search_terms,"a",@progbits
	.balign	1
	.globl	_num_search_terms
_num_search_terms:
	d24	2632                            ; 0xa48

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

	.section	.rodata._.str.2632,"a",@progbits
	.balign	1
	.local	_.str.2632
_.str.2632:
	.asciz	"ANTIGRAVITY"

	.section	.rodata._.str.2633,"a",@progbits
	.balign	1
	.local	_.str.2633
_.str.2633:
	.asciz	"AP STATISTICS ENGINE"

	.section	.rodata._.str.2634,"a",@progbits
	.balign	1
	.local	_.str.2634
_.str.2634:
	.asciz	"v2.0"

	.section	.rodata._.str.2635,"a",@progbits
	.balign	1
	.local	_.str.2635
_.str.2635:
	.asciz	"Build: May  7 2026 15:53:01"

	.section	.rodata._.str.2636,"a",@progbits
	.balign	1
	.local	_.str.2636
_.str.2636:
	.asciz	"Glossary - [ALPHA] to Jump"

	.section	.rodata._.str.2637,"a",@progbits
	.balign	1
	.local	_.str.2637
_.str.2637:
	.asciz	".."

	.section	.rodata._.str.2638,"a",@progbits
	.balign	1
	.local	_.str.2638
_.str.2638:
	.asciz	"Page %d of %d"

	.section	.rodata._.str.2639,"a",@progbits
	.balign	1
	.local	_.str.2639
_.str.2639:
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

	.section	.rodata._.str.2640,"a",@progbits
	.balign	1
	.local	_.str.2640
_.str.2640:
	.asciz	"Trivia: Proportions use z-tests, means use t-tests."

	.section	.rodata._.str.2641,"a",@progbits
	.balign	1
	.local	_.str.2641
_.str.2641:
	.asciz	"Trivia: Never accept the null hypothesis!"

	.section	.rodata._.str.2642,"a",@progbits
	.balign	1
	.local	_.str.2642
_.str.2642:
	.asciz	"Trivia: Context is required for full credit."

	.section	.rodata._.str.2643,"a",@progbits
	.balign	1
	.local	_.str.2643
_.str.2643:
	.asciz	"Trivia: Extrapolation is dangerous!"

	.section	.rodata._.str.2644,"a",@progbits
	.balign	1
	.local	_.str.2644
_.str.2644:
	.asciz	"Trivia: 'S' is the SD of the residuals."

	.section	.rodata.___const.gui_search_loop.trivia,"a",@progbits
	.balign	1
	.local	___const.gui_search_loop.trivia
___const.gui_search_loop.trivia:
	d24	_.str.2640
	d24	_.str.2641
	d24	_.str.2642
	d24	_.str.2643
	d24	_.str.2644

	.section	.rodata._.str.2645,"a",@progbits
	.balign	1
	.local	_.str.2645
_.str.2645:
	.asciz	"2+2"

	.section	.rodata._.str.2646,"a",@progbits
	.balign	1
	.local	_.str.2646
_.str.2646:
	.asciz	"             4"

	.section	.rodata._.str.2647,"a",@progbits
	.balign	1
	.local	_.str.2647
_.str.2647:
	.asciz	"Ans*10"

	.section	.rodata._.str.2648,"a",@progbits
	.balign	1
	.local	_.str.2648
_.str.2648:
	.asciz	"            40"

	.section	.rodata._.str.2649,"a",@progbits
	.balign	1
	.local	_.str.2649
_.str.2649:
	.asciz	"_"

	.section	.rodata._.str.2650,"a",@progbits
	.balign	1
	.local	_.str.2650
_.str.2650:
	.asciz	"AP Statistics Lexical Search Engine"

	.section	.rodata._.str.2651,"a",@progbits
	.balign	1
	.local	_.str.2651
_.str.2651:
	.asciz	"[A]"

	.section	.rodata._.str.2652,"a",@progbits
	.balign	1
	.local	_.str.2652
_.str.2652:
	.asciz	"[1]"

	.section	.rodata._.str.2653,"a",@progbits
	.balign	1
	.local	_.str.2653
_.str.2653:
	.asciz	"Query: "

	.section	.rodata._.str.2654,"a",@progbits
	.balign	1
	.local	_.str.2654
_.str.2654:
	.asciz	"Press [MODE] to open Glossary"

	.section	.rodata._.str.2655,"a",@progbits
	.balign	1
	.local	_.str.2655
_.str.2655:
	.asciz	"Press [GRAPH] to toggle Dark Mode"

	.section	.rodata._.str.2656,"a",@progbits
	.balign	1
	.local	_.str.2656
_.str.2656:
	.asciz	"Press [STAT] for Stealth Mode"

	.section	.rodata._.str.2657,"a",@progbits
	.balign	1
	.local	_.str.2657
_.str.2657:
	.asciz	"Searches: %d"

	.section	.rodata._.str.2658,"a",@progbits
	.balign	1
	.local	_.str.2658
_.str.2658:
	.asciz	"Title: "

	.section	.rodata._.str.2659,"a",@progbits
	.balign	1
	.local	_.str.2659
_.str.2659:
	.asciz	"[F1]COND"

	.section	.rodata._.str.2660,"a",@progbits
	.balign	1
	.local	_.str.2660
_.str.2660:
	.asciz	" F1Cond "

	.section	.rodata._.str.2661,"a",@progbits
	.balign	1
	.local	_.str.2661
_.str.2661:
	.asciz	"[F2]FORM"

	.section	.rodata._.str.2662,"a",@progbits
	.balign	1
	.local	_.str.2662
_.str.2662:
	.asciz	" F2Form "

	.section	.rodata._.str.2663,"a",@progbits
	.balign	1
	.local	_.str.2663
_.str.2663:
	.asciz	"[F3]CALC"

	.section	.rodata._.str.2664,"a",@progbits
	.balign	1
	.local	_.str.2664
_.str.2664:
	.asciz	" F3Calc "

	.section	.rodata._.str.2665,"a",@progbits
	.balign	1
	.local	_.str.2665
_.str.2665:
	.asciz	"[F4]INFO"

	.section	.rodata._.str.2666,"a",@progbits
	.balign	1
	.local	_.str.2666
_.str.2666:
	.asciz	" F4Info "

	.section	.rodata._.str.2667,"a",@progbits
	.balign	1
	.local	_.str.2667
_.str.2667:
	.asciz	"[F5]STEP"

	.section	.rodata._.str.2668,"a",@progbits
	.balign	1
	.local	_.str.2668
_.str.2668:
	.asciz	" F5Step "

	.section	.rodata._.str.2669,"a",@progbits
	.balign	1
	.local	_.str.2669
_.str.2669:
	.zero	1

	.section	.rodata._.str.2672,"a",@progbits
	.balign	1
	.local	_.str.2672
_.str.2672:
	.asciz	"Error loading node data."

	.section	.rodata._.str.2673,"a",@progbits
	.balign	1
	.local	_.str.2673
_.str.2673:
	.asciz	"Keyword not found. Try again."

	.section	.bss._g_db,"aw",@nobits
	.balign	2
	.globl	_g_db
_g_db:
	.zero	72

	.section	.rodata._.str.2670,"a",@progbits
	.balign	1
	.local	_.str.2670
_.str.2670:
	.asciz	"Error: Failed to load STATDAT1"

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	_rand
	.extern	_os_GetCSC
	.extern	__ladd
	.extern	__irems
	.extern	_llvm.eh.sjlj.lsda
	.extern	__iremu
	.extern	__lshl
	.extern	__lcmpu
	.extern	_llvm.eh.sjlj.callsite
	.extern	_gfx_FillRectangle
	.extern	_llvm.lifetime.end.p0
	.extern	_kb_Scan
	.extern	_gfx_GetStringWidth
	.extern	__setflag
	.extern	_llvm.lifetime.start.p0
	.extern	_gfx_SetTextTransparentColor
	.extern	_llvm.memcpy.p0.p0.i24
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_gfx_SetTextFGColor
	.extern	_strncpy
	.extern	__imulu
	.extern	_ti_GetDataPtr
	.extern	_delay
	.extern	_gfx_SetDraw
	.extern	__ishl
	.extern	__Unwind_SjLj_Unregister
	.extern	__ineg
	.extern	_ti_Open
	.extern	_gfx_GetCharWidth
	.extern	__iand
	.extern	_ti_Close
	.extern	__sdivu
	.extern	_llvm.memset.p0.i24
	.extern	_gfx_End
	.extern	_llvm.frameaddress.p0
	.extern	_gfx_HorizLine
	.extern	_sprintf
	.extern	_gfx_SetTextBGColor
	.extern	_strlen
	.extern	__frameset
	.extern	__ishrs_1
	.extern	__lmulu
	.extern	__ishrs
	.extern	_strcpy
	.extern	_llvm.stacksave.p0
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_ti_GetSize
	.extern	_gfx_FillScreen
	.extern	_gfx_PrintStringXY
	.extern	_gfx_SetColor
	.extern	_llvm.stackrestore.p0
	.extern	_gfx_Begin
	.extern	_llvm.smax.i24
	.extern	_gfx_SwapDraw
	.extern	_tolower
	.extern	__frameset0
	.extern	__Unwind_SjLj_Register
