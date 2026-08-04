	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"llvm-link"
	.section	.text._init_database,"ax",@progbits
	.globl	_init_database                  ; -- Begin function init_database
	.type	_init_database,@function
_init_database:                         ; @init_database
; %bb.0:
	ld	hl, -4
	call	__frameset
	ld	hl, (ix + 6)
	ld	bc, _.str
	ld	de, _.str.1
	xor	a, a
	ld	(ix - 1), a
	ld	(hl), a
	push	de
	push	bc
	call	_ti_Open
	ld	l, a
	pop	de
	pop	de
	or	a, a
	jp	z, .LBB0_3
; %bb.1:
	ld	de, (ix + 6)
	push	de
	pop	iy
	ld	(iy + 1), l
	ld	(iy), 1
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_ti_GetDataPtr
	push	hl
	pop	iy
	pop	hl
	lea	hl, iy + 0
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB0_3
; %bb.2:
	ld	bc, 6
	ld	a, 1
	ld	(ix - 1), a
	ld	e, (iy)
	ld	d, b
	ld	a, (iy + 1)
	ld	h, d
	ld	l, a
	ld	(ix - 4), iy
	ld	h, l
	ld	l, d
	add.sis	hl, de
	ex.sis	de, hl
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	(iy + 12), e
	ld	(iy + 13), d
	ld	iy, (ix - 4)
	lea	hl, iy + 2
	ld	iy, (ix + 6)
	ld	(iy + 14), hl
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	h, d
	call	__imulu
	ex	de, hl
	ld	iy, (ix - 4)
	add	iy, de
	lea	hl, iy + 2
	ld	iy, (ix + 6)
	ld	(iy + 17), hl
	.local	.LBB0_3
.LBB0_3:
	ld	a, (ix - 1)                     ; 1-byte Folded Reload
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
	.section	.text._get_node_data,"ax",@progbits
	.globl	_get_node_data                  ; -- Begin function get_node_data
	.type	_get_node_data,@function
_get_node_data:                         ; @get_node_data
; %bb.0:
	ld	hl, -34
	call	__frameset
	ld	iy, (ix + 6)
	ld	h, (ix + 12)
	xor	a, a
	ld	iy, (iy + 17)
	ld	l, (iy)
	inc	iy
	.local	.LBB2_1
.LBB2_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_3 Depth 2
	cp	a, l
	jp	z, .LBB2_8
; %bb.2:                                ;   in Loop: Header=BB2_1 Depth=1
	ld	(ix - 1), a                     ; 1-byte Folded Spill
	ld	a, (iy)
	ld	de, 0
	ld	e, a
	add	iy, de
	lea	bc, iy + 2
	ld	e, (iy + 1)
	ld	d, h
	.local	.LBB2_3
.LBB2_3:                                ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	a, e
	or	a, a
	jp	z, .LBB2_7
; %bb.4:                                ;   in Loop: Header=BB2_3 Depth=2
	ld	(ix - 2), d                     ; 1-byte Folded Spill
	ld	(ix - 4), e                     ; 1-byte Folded Spill
	ld	(ix - 3), l                     ; 1-byte Folded Spill
	push	bc
	pop	iy
	ld	a, (iy)
	inc	iy
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, a
	ld	(ix - 7), iy
	ld	(ix - 10), de
	add	iy, de
	ld	a, (iy)
	push	hl
	pop	de
	ld	e, a
	ld	a, (iy + 1)
	ld	l, a
	ld	c, 8
	call	__ishl
	add	hl, de
	ex	de, hl
	lea	iy, iy + 2
	ld	(ix - 16), iy
	ld	(ix - 13), de
	add	iy, de
	ld	a, (iy)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, a
	ld	a, (iy + 1)
	ld	l, a
	call	__ishl
	add	hl, de
	ex	de, hl
	lea	iy, iy + 2
	ld	(ix - 22), iy
	ld	(ix - 19), de
	add	iy, de
	ld	a, (iy)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, a
	ld	a, (iy + 1)
	ld	l, a
	call	__ishl
	add	hl, de
	ex	de, hl
	lea	iy, iy + 2
	ld	(ix - 28), iy
	ld	(ix - 25), de
	add	iy, de
	ld	a, (iy)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, a
	ld	a, (iy + 1)
	ld	l, a
	call	__ishl
	add	hl, de
	ex	de, hl
	lea	iy, iy + 2
	ld	(ix - 34), iy
	ld	(ix - 31), de
	add	iy, de
	ld	a, (iy)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, a
	ld	a, (iy + 1)
	ld	l, a
	call	__ishl
	add	hl, de
	ex	de, hl
	lea	iy, iy + 2
	ld	a, (ix - 1)                     ; 1-byte Folded Reload
	ld	b, (ix + 9)
	cp	a, b
	jr	nz, .LBB2_6
; %bb.5:                                ;   in Loop: Header=BB2_3 Depth=2
	ld	a, (ix - 2)                     ; 1-byte Folded Reload
	or	a, a
	jp	z, .LBB2_10
	.local	.LBB2_6
.LBB2_6:                                ;   in Loop: Header=BB2_3 Depth=2
	add	iy, de
	ld	d, (ix - 2)                     ; 1-byte Folded Reload
	dec	d
	ld	e, (ix - 4)                     ; 1-byte Folded Reload
	dec	e
	lea	bc, iy + 0
	ld	l, (ix - 3)                     ; 1-byte Folded Reload
	ld	h, (ix + 12)
	jp	.LBB2_3
	.local	.LBB2_7
.LBB2_7:                                ;   in Loop: Header=BB2_1 Depth=1
	ld	a, (ix - 1)                     ; 1-byte Folded Reload
	inc	a
	push	bc
	pop	iy
	jp	.LBB2_1
	.local	.LBB2_8
.LBB2_8:
	ld	a, l
	.local	.LBB2_9
.LBB2_9:                                ; %.loopexit
	cp	a, l
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB2_10
.LBB2_10:
	ld	hl, (ix + 15)
	ld	bc, (ix - 7)
	ld	(hl), bc
	ld	hl, (ix + 18)
	ld	bc, (ix - 10)
	ld	(hl), bc
	ld	hl, (ix + 21)
	ld	bc, (ix - 16)
	ld	(hl), bc
	ld	hl, (ix + 24)
	ld	bc, (ix - 13)
	ld	(hl), bc
	ld	hl, (ix + 27)
	ld	bc, (ix - 22)
	ld	(hl), bc
	ld	hl, (ix + 30)
	ld	bc, (ix - 19)
	ld	(hl), bc
	ld	hl, (ix + 33)
	ld	bc, (ix - 28)
	ld	(hl), bc
	ld	hl, (ix + 36)
	ld	bc, (ix - 25)
	ld	(hl), bc
	ld	hl, (ix + 39)
	ld	bc, (ix - 34)
	ld	(hl), bc
	ld	hl, (ix + 42)
	ld	bc, (ix - 31)
	ld	(hl), bc
	ld	hl, (ix + 45)
	ld	(hl), iy
	ld	hl, (ix + 48)
	ld	(hl), de
	ld	a, (ix + 9)
	ld	l, (ix - 3)                     ; 1-byte Folded Reload
	jp	.LBB2_9
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_get_node_data, .Lfunc_end2-_get_node_data
                                        ; -- End function
	.section	.text._print_compressed_string,"ax",@progbits
	.globl	_print_compressed_string        ; -- Begin function print_compressed_string
	.type	_print_compressed_string,@function
_print_compressed_string:               ; @print_compressed_string
; %bb.0:
	ld	hl, -1049
	call	__frameset
	ld	hl, (ix + 9)
	ld	de, -1036
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	iy, (ix + 12)
	ld	de, (ix + 18)
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
	lea	ix, ix - 15
	ld	(ix + 0), bc
	pop	ix
	.local	.LBB3_1
.LBB3_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_4 Depth 2
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB3_13
; %bb.2:                                ;   in Loop: Header=BB3_1 Depth=1
	ld	hl, (ix + 15)
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
	jp	nc, .LBB3_7
; %bb.3:                                ;   in Loop: Header=BB3_1 Depth=1
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
	ld	de, -1039
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	.local	.LBB3_4
.LBB3_4:                                ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	e, (iy)
	ld	a, e
	or	a, a
	jp	z, .LBB3_9
; %bb.5:                                ;   in Loop: Header=BB3_4 Depth=2
	push	ix
	ld	bc, -1039
	add	ix, bc
	ld	(ix + 0), iy
	pop	ix
	push	hl
	pop	iy
	ld	bc, 1023
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB3_10
; %bb.6:                                ;   in Loop: Header=BB3_4 Depth=2
	push	ix
	ld	bc, -1039
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
	lea	ix, ix - 15
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
	lea	ix, ix - 15
	ld	hl, (ix + 0)
	pop	ix
	add	hl, bc
	inc	bc
	ld	(hl), e
	push	bc
	pop	hl
	jp	.LBB3_4
	.local	.LBB3_7
.LBB3_7:                                ;   in Loop: Header=BB3_1 Depth=1
	push	ix
	ld	bc, -1039
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	ld	bc, 1023
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB3_12
; %bb.8:                                ;   in Loop: Header=BB3_1 Depth=1
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
	lea	ix, ix - 15
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
	lea	ix, ix - 15
	ld	(ix + 0), bc
	pop	ix
	ld	(hl), e
	jr	.LBB3_12
	.local	.LBB3_9
.LBB3_9:                                ;   in Loop: Header=BB3_1 Depth=1
	ld	de, -1039
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	jr	.LBB3_11
	.local	.LBB3_10
.LBB3_10:                               ;   in Loop: Header=BB3_1 Depth=1
	ld	de, -1039
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	.local	.LBB3_11
.LBB3_11:                               ; %.loopexit
                                        ;   in Loop: Header=BB3_1 Depth=1
	ld	iy, (ix + 12)
	.local	.LBB3_12
.LBB3_12:                               ; %.loopexit
                                        ;   in Loop: Header=BB3_1 Depth=1
	ld	de, -1042
	lea	hl, ix + 0
	add	hl, de
	ld	bc, (hl)
	inc	bc
	ld	de, (ix + 18)
	jp	.LBB3_1
	.local	.LBB3_13
.LBB3_13:
	ld	bc, -1033
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	push	de
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
	lea	ix, ix - 15
	ld	bc, (ix + 0)
	pop	ix
	add	hl, bc
	ld	(hl), 0
	lea	hl, iy + 0
	push	de
	pop	iy
	ld	de, (ix + 6)
	add	hl, de
	push	ix
	ld	bc, -1039
	add	ix, bc
	ld	(ix + 0), hl
	pop	ix
	ld	hl, 32
	.local	.LBB3_14
.LBB3_14:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_15 Depth 2
                                        ;       Child Loop BB3_18 Depth 3
	ld	a, (iy)
	.local	.LBB3_15
.LBB3_15:                               ;   Parent Loop BB3_14 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_18 Depth 3
	ld	c, a
	or	a, a
	jp	z, .LBB3_40
; %bb.16:                               ;   in Loop: Header=BB3_15 Depth=2
	ld	a, c
	cp	a, 10
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
	jp	z, .LBB3_31
; %bb.17:                               ;   in Loop: Header=BB3_15 Depth=2
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
	ld	(ix + 0), de
	pop	ix
	jp	z, .LBB3_32
	.local	.LBB3_18
.LBB3_18:                               ; %.preheader
                                        ;   Parent Loop BB3_14 Depth=1
                                        ;     Parent Loop BB3_15 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ld	a, c
	or	a, a
	jr	z, .LBB3_22
; %bb.19:                               ; %.preheader
                                        ;   in Loop: Header=BB3_18 Depth=3
	ld	a, c
	cp	a, 10
	jr	z, .LBB3_22
; %bb.20:                               ; %.preheader
                                        ;   in Loop: Header=BB3_18 Depth=3
	ld	a, c
	cp	a, 32
	jr	z, .LBB3_22
; %bb.21:                               ;   in Loop: Header=BB3_18 Depth=3
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
	jr	.LBB3_18
	.local	.LBB3_22
.LBB3_22:                               ;   in Loop: Header=BB3_15 Depth=2
	ld	de, -1046
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), c                         ; 1-byte Folded Spill
	push	ix
	inc	de
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	ld	(hl), 0
	push	iy
	call	_gfx_GetStringWidth
	push	hl
	pop	iy
	pop	hl
	ld	de, -1049
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	bc, -1042
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	add	iy, de
	ld	hl, (ix + 6)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	a, -1
	jp	m, .LBB3_24
; %bb.23:                               ;   in Loop: Header=BB3_15 Depth=2
	ld	a, 0
	.local	.LBB3_24
.LBB3_24:                               ;   in Loop: Header=BB3_15 Depth=2
	lea	de, iy + 0
	ld	bc, -1039
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	l, -1
	jp	m, .LBB3_26
; %bb.25:                               ;   in Loop: Header=BB3_15 Depth=2
	ld	l, 0
	.local	.LBB3_26
.LBB3_26:                               ;   in Loop: Header=BB3_15 Depth=2
	and	a, l
	ld	l, a
	ld	de, -1036
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	push	bc
	pop	iy
	ld	de, 10
	add	iy, de
	bit	0, l
	jr	nz, .LBB3_28
; %bb.27:                               ;   in Loop: Header=BB3_15 Depth=2
	push	bc
	pop	iy
	.local	.LBB3_28
.LBB3_28:                               ;   in Loop: Header=BB3_15 Depth=2
	bit	0, l
	ld	hl, (ix + 6)
	ex	de, hl
	push	ix
	ld	bc, -1042
	push	af
	add	ix, bc
	pop	af
	ld	hl, (ix + 0)
	pop	ix
	jr	nz, .LBB3_30
; %bb.29:                               ;   in Loop: Header=BB3_15 Depth=2
	ex	de, hl
	.local	.LBB3_30
.LBB3_30:                               ;   in Loop: Header=BB3_15 Depth=2
	push	iy
	ld	bc, -1036
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	push	de
	push	ix
	ld	de, -1033
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	push	hl
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	bc, -1049
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	bc, -1036
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	add	hl, de
	ex	de, hl
	ld	bc, -1046
	lea	iy, ix + 0
	add	iy, bc
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	inc	bc
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	(hl), a
	push	hl
	pop	iy
	push	ix
	ld	bc, -1033
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	push	ix
	ld	bc, -1036
	add	ix, bc
	ld	(ix + 0), hl
	pop	ix
	ld	bc, 32
	push	bc
	pop	hl
	jp	.LBB3_15
	.local	.LBB3_31
.LBB3_31:                               ;   in Loop: Header=BB3_14 Depth=1
	ld	de, 10
	push	hl
	pop	bc
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
	ld	hl, (iy + 0)
	add	hl, de
	ld	de, -1036
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	hl, (ix + 6)
	ex	de, hl
	jr	.LBB3_39
	.local	.LBB3_32
.LBB3_32:                               ;   in Loop: Header=BB3_14 Depth=1
	push	hl
	call	_gfx_GetCharWidth
	push	ix
	ld	de, -1039
	add	ix, de
	ld	iy, (ix + 0)
	pop	ix
	pop	de
	push	ix
	ld	bc, -1042
	add	ix, bc
	ld	de, (ix + 0)
	pop	ix
	add	hl, de
	ex	de, hl
	lea	hl, iy + 0
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	a, -1
	jp	m, .LBB3_34
; %bb.33:                               ;   in Loop: Header=BB3_14 Depth=1
	ld	a, 0
	.local	.LBB3_34
.LBB3_34:                               ;   in Loop: Header=BB3_14 Depth=1
	ld	bc, -1036
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	pop	hl
	ld	bc, 10
	add	hl, bc
	bit	0, a
	jr	nz, .LBB3_36
; %bb.35:                               ;   in Loop: Header=BB3_14 Depth=1
	ex	de, hl
	.local	.LBB3_36
.LBB3_36:                               ;   in Loop: Header=BB3_14 Depth=1
	bit	0, a
	ld	bc, (ix + 6)
	push	bc
	pop	de
	jr	nz, .LBB3_38
; %bb.37:                               ;   in Loop: Header=BB3_14 Depth=1
	ld	bc, -1042
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	.local	.LBB3_38
.LBB3_38:                               ;   in Loop: Header=BB3_14 Depth=1
	ld	bc, -1036
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	bc, 32
	.local	.LBB3_39
.LBB3_39:                               ;   in Loop: Header=BB3_14 Depth=1
	push	bc
	pop	hl
	push	ix
	ld	bc, -1033
	add	ix, bc
	ld	iy, (ix + 0)
	pop	ix
	inc	iy
	jp	.LBB3_14
	.local	.LBB3_40
.LBB3_40:
	ld	de, 10
	ld	bc, -1036
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	add	hl, de
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end3
.Lfunc_end3:
	.size	_print_compressed_string, .Lfunc_end3-_print_compressed_string
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
	.local	.Lfunc_end4
.Lfunc_end4:
	.size	_gui_init, .Lfunc_end4-_gui_init
                                        ; -- End function
	.section	.text._gui_cleanup,"ax",@progbits
	.globl	_gui_cleanup                    ; -- Begin function gui_cleanup
	.type	_gui_cleanup,@function
_gui_cleanup:                           ; @gui_cleanup
; %bb.0:
	jp	_gfx_End
	.local	.Lfunc_end5
.Lfunc_end5:
	.size	_gui_cleanup, .Lfunc_end5-_gui_cleanup
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
	jr	nz, .LBB6_2
; %bb.1:
	ex	de, hl
	.local	.LBB6_2
.LBB6_2:
	ld	de, (ix + 9)
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_PrintStringXY
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end6
.Lfunc_end6:
	.size	_print_centered, .Lfunc_end6-_print_centered
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
	ld	hl, _.str.814
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	hl, 120
	push	hl
	ld	hl, _.str.815
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	hl, 140
	push	hl
	ld	hl, _.str.816
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
	ld	hl, _.str.817
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
	.local	.Lfunc_end7
.Lfunc_end7:
	.size	_gui_splash, .Lfunc_end7-_gui_splash
                                        ; -- End function
	.section	.text._gui_terms_loop,"ax",@progbits
	.globl	_gui_terms_loop                 ; -- Begin function gui_terms_loop
	.type	_gui_terms_loop,@function
_gui_terms_loop:                        ; @gui_terms_loop
; %bb.0:
	ld	hl, -50
	call	__frameset
	or	a, a
	sbc	hl, hl
	ld	a, 1
	lea	de, ix - 32
	ld	(ix - 41), de
	.local	.LBB8_1
.LBB8_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_7 Depth 2
	ld	(ix - 35), hl
	bit	0, a
	jp	z, .LBB8_16
; %bb.2:                                ;   in Loop: Header=BB8_1 Depth=1
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
	call	_gfx_SetTextFGColor
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
	ld	hl, _.str.818
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
	ld	hl, (ix - 35)
	ld	bc, 54
	call	__imulu
	push	hl
	pop	de
	ld	bc, 815
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	push	de
	pop	hl
	jp	p, .LBB8_4
; %bb.3:                                ;   in Loop: Header=BB8_1 Depth=1
	ld	hl, 814
	.local	.LBB8_4
.LBB8_4:                                ;   in Loop: Header=BB8_1 Depth=1
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	de, 54
	or	a, a
	sbc	hl, de
	jr	c, .LBB8_6
; %bb.5:                                ;   in Loop: Header=BB8_1 Depth=1
	ld	bc, 54
	.local	.LBB8_6
.LBB8_6:                                ;   in Loop: Header=BB8_1 Depth=1
	ld	hl, (ix - 35)
	push	bc
	pop	de
	ld	bc, 162
	call	__imulu
	push	de
	pop	bc
	ex	de, hl
	ld	hl, _search_terms
	push	hl
	pop	iy
	add	iy, de
	ld	hl, 10
	ex	de, hl
	ld	hl, 30
	ld	(ix - 38), hl
	.local	.LBB8_7
.LBB8_7:                                ;   Parent Loop BB8_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sbc	hl, hl
	adc	hl, bc
	jr	z, .LBB8_15
; %bb.8:                                ;   in Loop: Header=BB8_7 Depth=2
	ld	(ix - 44), bc
	ld	(ix - 47), iy
	ld	hl, (iy)
	ld	bc, (ix - 38)
	push	bc
	ld	(ix - 50), de
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 38)
	push	hl
	pop	iy
	ld	de, 11
	add	iy, de
	ld	de, 210
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	a, -1
	jp	p, .LBB8_10
; %bb.9:                                ;   in Loop: Header=BB8_7 Depth=2
	ld	a, 0
	.local	.LBB8_10
.LBB8_10:                               ;   in Loop: Header=BB8_7 Depth=2
	ld	bc, (ix - 50)
	push	bc
	pop	hl
	ld	de, 100
	add	hl, de
	bit	0, a
	jr	nz, .LBB8_12
; %bb.11:                               ;   in Loop: Header=BB8_7 Depth=2
	push	bc
	pop	hl
	.local	.LBB8_12
.LBB8_12:                               ;   in Loop: Header=BB8_7 Depth=2
	bit	0, a
	ld	de, 30
	ld	bc, (ix - 44)
	jr	nz, .LBB8_14
; %bb.13:                               ;   in Loop: Header=BB8_7 Depth=2
	lea	de, iy + 0
	.local	.LBB8_14
.LBB8_14:                               ;   in Loop: Header=BB8_7 Depth=2
	ld	(ix - 38), de
	dec	bc
	ld	iy, (ix - 47)
	lea	iy, iy + 3
	ex	de, hl
	jr	.LBB8_7
	.local	.LBB8_15
.LBB8_15:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	de, (ix - 35)
	inc	de
	ld	hl, 16
	push	hl
	push	de
	ld	hl, _.str.819
	push	hl
	ld	hl, (ix - 41)
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
	ld	hl, 225
	push	hl
	ld	hl, 220
	push	hl
	ld	hl, (ix - 41)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB8_16
.LBB8_16:                               ;   in Loop: Header=BB8_1 Depth=1
	call	_kb_Scan
	call	_os_GetCSC
	cp	a, 1
	jr	nz, .LBB8_20
; %bb.17:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	hl, (ix - 35)
	ld	de, 15
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	a, -1
	ld	e, a
	jp	m, .LBB8_19
; %bb.18:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	a, 0
	ld	e, a
	.local	.LBB8_19
.LBB8_19:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	a, e
	and	a, 1
	or	a, a
	sbc	hl, hl
	ld	l, a
	jr	.LBB8_26
	.local	.LBB8_20
.LBB8_20:                               ;   in Loop: Header=BB8_1 Depth=1
	cp	a, 15
	jr	z, .LBB8_27
; %bb.21:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	hl, (ix - 35)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	l, -1
	jp	p, .LBB8_23
; %bb.22:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	l, 0
	.local	.LBB8_23
.LBB8_23:                               ;   in Loop: Header=BB8_1 Depth=1
	cp	a, 4
	ld	a, -1
	jr	z, .LBB8_25
; %bb.24:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	a, 0
	.local	.LBB8_25
.LBB8_25:                               ;   in Loop: Header=BB8_1 Depth=1
	and	a, l
	ld	e, a
	push	de
	pop	hl
	ld	c, 23
	call	__ishl
	add	hl, hl
	sbc	hl, hl
	.local	.LBB8_26
.LBB8_26:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	bc, (ix - 35)
	add	hl, bc
	ld	a, e
	jp	.LBB8_1
	.local	.LBB8_27
.LBB8_27:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end8
.Lfunc_end8:
	.size	_gui_terms_loop, .Lfunc_end8-_gui_terms_loop
                                        ; -- End function
	.section	.text._gui_search_loop,"ax",@progbits
	.globl	_gui_search_loop                ; -- Begin function gui_search_loop
	.type	_gui_search_loop,@function
_gui_search_loop:                       ; @gui_search_loop
; %bb.0:
	ld	hl, -144
	call	__frameset
	lea	iy, ix - 46
	ld	(ix - 118), iy
	lea	hl, ix - 114
	push	ix
	lea	ix, ix - 128
	ld	(ix - 3), hl
	pop	ix
	ld	(ix - 46), 0
	lea	hl, iy + 0
	inc	hl
	ld	bc, 39
	ex	de, hl
	lea	hl, iy + 0
	ldir
	call	_rand
	ld	iy, (ix - 118)
	ld	bc, 5
	call	__irems
	ld	de, -138
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	a, 1
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	or	a, a
	sbc	hl, hl
	ld	de, -141
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	(ix - 121), hl
	dec	a
	ld	(ix - 128), a                   ; 1-byte Folded Spill
	ld	de, _.str.820
	ld	bc, -134
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	inc	a
	.local	.LBB9_1
.LBB9_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_2 Depth 2
	ld	de, -144
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	.local	.LBB9_2
.LBB9_2:                                ;   Parent Loop BB9_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	bit	0, a
	jp	z, .LBB9_31
; %bb.3:                                ;   in Loop: Header=BB9_2 Depth=2
	ld	a, (_stealth_mode)
	bit	0, a
	jr	z, .LBB9_5
; %bb.4:                                ;   in Loop: Header=BB9_2 Depth=2
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
	ld	hl, _.str.826
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 20
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.827
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 35
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.828
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 50
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.829
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 65
	push	hl
	ld	hl, 5
	push	hl
	ld	hl, _.str.830
	jp	.LBB9_24
	.local	.LBB9_5
.LBB9_5:                                ;   in Loop: Header=BB9_2 Depth=2
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
	bit	0, (ix - 128)                   ; 1-byte Folded Reload
	jp	z, .LBB9_25
; %bb.6:                                ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, 10
	push	hl
	push	hl
	ld	hl, _.str.839
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 49)
	ld	de, (ix - 67)
	push	de
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
	ld	(ix - 127), hl
	ld	de, 10
	add	hl, de
	ld	(ix - 124), hl
	ld	hl, (ix - 121)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, _.str.840
	jr	z, .LBB9_8
; %bb.7:                                ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, _.str.841
	.local	.LBB9_8
.LBB9_8:                                ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 124)
	push	de
	ld	de, 0
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 121)
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	hl, _.str.842
	jr	z, .LBB9_10
; %bb.9:                                ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, _.str.843
	.local	.LBB9_10
.LBB9_10:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 124)
	push	de
	ld	de, 64
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 121)
	ld	de, 2
	or	a, a
	sbc	hl, de
	ld	hl, _.str.844
	jr	z, .LBB9_12
; %bb.11:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, _.str.845
	.local	.LBB9_12
.LBB9_12:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 124)
	push	de
	ld	de, 128
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 121)
	ld	de, 3
	or	a, a
	sbc	hl, de
	ld	hl, _.str.846
	jr	z, .LBB9_14
; %bb.13:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, _.str.847
	.local	.LBB9_14
.LBB9_14:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 124)
	push	de
	ld	de, 192
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 121)
	ld	de, 4
	or	a, a
	sbc	hl, de
	ld	hl, _.str.848
	jr	z, .LBB9_16
; %bb.15:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, _.str.849
	.local	.LBB9_16
.LBB9_16:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 124)
	push	de
	ld	de, 256
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
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 121)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	iy, (ix - 127)
	ld	de, 20
	add	iy, de
	ld	de, 2
	push	de
	ld	de, 64
	push	de
	push	iy
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, 25
	ld	hl, (ix - 127)
	add	hl, de
	ld	(ix - 127), hl
	ld	de, (ix - 121)
	push	de
	pop	iy
	sbc	hl, hl
	adc	hl, de
	jp	nz, .LBB9_43
; %bb.17:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 70)
	push	de
	pop	hl
	ld	bc, 4
	or	a, a
	sbc	hl, bc
                                        ; kill: def $a killed $a
	sbc	a, a
	bit	0, a
	ld	hl, _.str.850
	jr	nz, .LBB9_19
; %bb.18:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, (ix - 52)
	.local	.LBB9_19
.LBB9_19:                               ;   in Loop: Header=BB9_2 Depth=2
	bit	0, a
	ld	bc, 53
	jr	nz, .LBB9_21
	.local	.LBB9_20
.LBB9_20:                               ;   in Loop: Header=BB9_2 Depth=2
	push	de
	pop	bc
	.local	.LBB9_21
.LBB9_21:                               ;   in Loop: Header=BB9_2 Depth=2
	push	bc
	push	hl
	ld	hl, 300
	push	hl
	ld	hl, (ix - 127)
	push	hl
	ld	hl, 10
	push	hl
	.local	.LBB9_22
.LBB9_22:                               ;   in Loop: Header=BB9_2 Depth=2
	call	_print_compressed_string
	ld	bc, 10
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB9_23
.LBB9_23:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, 220
	push	hl
	push	bc
	ld	hl, _.str.854
	.local	.LBB9_24
.LBB9_24:                               ;   in Loop: Header=BB9_2 Depth=2
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	jp	.LBB9_30
	.local	.LBB9_25
.LBB9_25:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, 10
	push	hl
	push	hl
	ld	hl, _.str.831
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	0, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.832
	jr	nz, .LBB9_27
; %bb.26:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, _.str.833
	.local	.LBB9_27
.LBB9_27:                               ;   in Loop: Header=BB9_2 Depth=2
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
	ld	de, -134
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
	ld	hl, _.str.834
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 50
	push	hl
	ld	hl, 60
	push	hl
	ld	hl, (ix - 118)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 160
	push	hl
	ld	hl, 10
	push	hl
	ld	hl, _.str.835
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 175
	push	hl
	ld	hl, 10
	push	hl
	ld	hl, _.str.836
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 190
	push	hl
	ld	hl, 10
	push	hl
	ld	hl, _.str.837
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
	ld	hl, _.str.838
	push	hl
	ld	de, -131
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_sprintf
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 215
	push	hl
	ld	de, -131
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	a, (_dark_mode)
	bit	0, a
	ld	a, -56
	ld	l, a
	jr	nz, .LBB9_29
; %bb.28:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, 100
	ld	l, a
	.local	.LBB9_29
.LBB9_29:                               ;   in Loop: Header=BB9_2 Depth=2
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	de, -138
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
	pop	hl
	pop	hl
	ld	a, (_dark_mode)
	ld	l, a
	xor	a, a
	sub	a, l
	ld	l, a
	push	hl
	call	_gfx_SetTextFGColor
	.local	.LBB9_30
.LBB9_30:                               ;   in Loop: Header=BB9_2 Depth=2
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB9_31
.LBB9_31:                               ;   in Loop: Header=BB9_2 Depth=2
	call	_kb_Scan
	call	_os_GetCSC
	ld	e, a
	ld	bc, 0
	ld	a, (_stealth_mode)
	ld	l, a
	ld	a, e
	cp	a, 32
	jr	nz, .LBB9_33
; %bb.32:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	(_stealth_mode), a
	ld	a, e
	ld	iy, (ix - 118)
	jp	.LBB9_2
	.local	.LBB9_33
.LBB9_33:                               ;   in Loop: Header=BB9_2 Depth=2
	bit	0, l
	ld	a, 0
	ld	iy, (ix - 118)
	jp	nz, .LBB9_2
; %bb.34:                               ;   in Loop: Header=BB9_2 Depth=2
	bit	0, (ix - 128)                   ; 1-byte Folded Reload
	jr	z, .LBB9_40
; %bb.35:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	cp	a, 3
	ld	hl, (ix - 121)
	jp	nz, .LBB9_47
; %bb.36:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, 4
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	a, -1
	jp	m, .LBB9_38
; %bb.37:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, 0
	.local	.LBB9_38
.LBB9_38:                               ;   in Loop: Header=BB9_2 Depth=2
	bit	0, a
	jp	nz, .LBB9_57
	.local	.LBB9_39
.LBB9_39:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, 4
	jp	.LBB9_58
	.local	.LBB9_40
.LBB9_40:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	cp	a, 9
	jp	nz, .LBB9_54
; %bb.41:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, 12
	push	hl
	ld	hl, _.str.855
	push	hl
	push	iy
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB9_59
; %bb.42:                               ;   in Loop: Header=BB9_2 Depth=2
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 6
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 100
	push	hl
	ld	hl, _.str.856
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	ld	hl, 120
	push	hl
	ld	hl, _.str.857
	push	hl
	call	_print_centered
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	ld	hl, 3000
	push	hl
	call	_delay
	pop	hl
	ld	(ix - 46), 0
	ld	a, 1
	or	a, a
	sbc	hl, hl
	ld	de, -144
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	iy, (ix - 118)
	jp	.LBB9_2
	.local	.LBB9_43
.LBB9_43:                               ;   in Loop: Header=BB9_2 Depth=2
	lea	hl, iy + 0
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	bc, 10
	jp	nz, .LBB9_61
; %bb.44:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 73)
	push	de
	pop	hl
	ld	bc, 4
	or	a, a
	sbc	hl, bc
                                        ; kill: def $a killed $a
	sbc	a, a
	bit	0, a
	ld	hl, _.str.851
	jr	nz, .LBB9_46
; %bb.45:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, (ix - 55)
	.local	.LBB9_46
.LBB9_46:                               ;   in Loop: Header=BB9_2 Depth=2
	bit	0, a
	ld	bc, 50
	jp	z, .LBB9_20
	jp	.LBB9_21
	.local	.LBB9_47
.LBB9_47:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	cp	a, 15
	jp	z, .LBB9_105
; %bb.48:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	l, -49
	ld	a, e
	add	a, l
	ld	l, a
	cp	a, 5
	jp	c, .LBB9_65
; %bb.49:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, (ix - 121)
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	l, -1
	jp	p, .LBB9_51
; %bb.50:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	l, 0
	.local	.LBB9_51
.LBB9_51:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	cp	a, 2
	ld	a, -1
	jr	z, .LBB9_53
; %bb.52:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, 0
	.local	.LBB9_53
.LBB9_53:                               ;   in Loop: Header=BB9_2 Depth=2
	and	a, l
	ld	e, a
	push	de
	pop	hl
	ld	c, 23
	call	__ishl
	add	hl, hl
	sbc	hl, hl
	push	hl
	pop	bc
	ld	hl, (ix - 121)
	add	hl, bc
	ld	(ix - 121), hl
	jp	.LBB9_2
	.local	.LBB9_54
.LBB9_54:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	cp	a, 15
	jp	z, .LBB9_106
; %bb.55:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	cp	a, 48
	jp	nz, .LBB9_67
; %bb.56:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	l, 1
	ld	bc, -135
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)
	ld	a, e
	xor	a, l
	ld	e, a
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), e
	jp	.LBB9_85
	.local	.LBB9_57
.LBB9_57:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, (ix - 121)
	inc	hl
	.local	.LBB9_58
.LBB9_58:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	(ix - 121), hl
	jp	.LBB9_2
	.local	.LBB9_59
.LBB9_59:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 46)
	push	de
	pop	hl
	ld	bc, 24936
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB9_69
; %bb.60:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	iy, (ix - 118)
	lea	de, iy + 0
	ld	hl, _.str.19.44
	ld	bc, 12
	jp	.LBB9_71
	.local	.LBB9_61
.LBB9_61:                               ;   in Loop: Header=BB9_2 Depth=2
	lea	hl, iy + 0
	ld	de, 2
	or	a, a
	sbc	hl, de
	jp	nz, .LBB9_75
; %bb.62:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 76)
	push	de
	pop	hl
	ld	bc, 4
	or	a, a
	sbc	hl, bc
                                        ; kill: def $a killed $a
	sbc	a, a
	bit	0, a
	ld	hl, _.str.852
	jr	nz, .LBB9_64
; %bb.63:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, (ix - 58)
	.local	.LBB9_64
.LBB9_64:                               ;   in Loop: Header=BB9_2 Depth=2
	bit	0, a
	ld	bc, 45
	jp	z, .LBB9_20
	jp	.LBB9_21
	.local	.LBB9_65
.LBB9_65:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	c, l
	ld	hl, JTI9_0
	add	hl, bc
	add	hl, bc
	add	hl, bc
	ld	hl, (hl)
	ld	de, 0
	ld	(ix - 121), de
	ld	a, 1
	jp	(hl)
	.local	.LBB9_66
.LBB9_66:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, 3
	jp	.LBB9_58
	.local	.LBB9_67
.LBB9_67:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	cp	a, 49
	jp	nz, .LBB9_78
; %bb.68:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, (_dark_mode)
	ld	l, 1
	xor	a, l
	ld	l, a
	ld	(_dark_mode), a
	jp	.LBB9_85
	.local	.LBB9_69
.LBB9_69:                               ;   in Loop: Header=BB9_2 Depth=2
	push	de
	pop	hl
	ld	bc, 25715
	or	a, a
	sbc	hl, bc
	ld	iy, (ix - 118)
	jp	nz, .LBB9_80
; %bb.70:                               ;   in Loop: Header=BB9_2 Depth=2
	lea	de, iy + 0
	ld	hl, _.str.195
	ld	bc, 10
	.local	.LBB9_71
.LBB9_71:                               ;   in Loop: Header=BB9_2 Depth=2
	ldir
	.local	.LBB9_72
.LBB9_72:                               ;   in Loop: Header=BB9_2 Depth=2
	push	iy
	call	_djb2_hash
                                        ; kill: def $e killed $e def $ude
	pop	bc
	ld	iy, (ix + 6)
	ld	bc, (iy + 14)
	ld	(ix - 124), bc
	ld	bc, (iy + 12)
	pea	ix - 115
	pea	ix - 114
	push	de
	push	hl
	push	bc
	ld	hl, (ix - 124)
	push	hl
	call	_binary_search_keyword
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB9_77
; %bb.73:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, (ix - 114)
	ld	l, (ix - 115)
	pea	ix - 82
	pea	ix - 64
	pea	ix - 79
	pea	ix - 61
	pea	ix - 76
	pea	ix - 58
	pea	ix - 73
	pea	ix - 55
	pea	ix - 70
	pea	ix - 52
	pea	ix - 67
	pea	ix - 49
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
	jp	z, .LBB9_82
; %bb.74:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, -141
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	inc	hl
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	a, 1
	ld	(ix - 128), a                   ; 1-byte Folded Spill
	jp	.LBB9_84
	.local	.LBB9_75
.LBB9_75:                               ;   in Loop: Header=BB9_2 Depth=2
	lea	hl, iy + 0
	ld	de, 3
	or	a, a
	sbc	hl, de
	jp	nz, .LBB9_86
; %bb.76:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, (ix - 61)
	ld	de, (ix - 79)
	push	de
	push	hl
	ld	hl, 300
	push	hl
	ld	hl, (ix - 127)
	push	hl
	push	bc
	jp	.LBB9_22
	.local	.LBB9_77
.LBB9_77:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	(ix - 46), 0
	ld	hl, _.str.861
	ld	de, -134
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	or	a, a
	sbc	hl, hl
	ld	de, -144
	jr	.LBB9_83
	.local	.LBB9_78
.LBB9_78:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	cp	a, 55
	jp	nz, .LBB9_90
; %bb.79:                               ;   in Loop: Header=BB9_2 Depth=2
	call	_gui_terms_loop
	jr	.LBB9_84
	.local	.LBB9_80
.LBB9_80:                               ;   in Loop: Header=BB9_2 Depth=2
	push	de
	pop	hl
	ld	bc, 26212
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB9_93
; %bb.81:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, 6776164
	ld	(ix - 46), hl
	ld	hl, 6645106
	ld	(ix - 43), hl
	ld.sis	hl, 115
	ld	(ix - 40), l
	ld	(ix - 39), h
	jp	.LBB9_72
	.local	.LBB9_82
.LBB9_82:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, _.str.860
	ld	de, -134
	.local	.LBB9_83
.LBB9_83:                               ;   in Loop: Header=BB9_2 Depth=2
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	.local	.LBB9_84
.LBB9_84:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	iy, (ix - 118)
	.local	.LBB9_85
.LBB9_85:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, 1
	jp	.LBB9_2
	.local	.LBB9_86
.LBB9_86:                               ;   in Loop: Header=BB9_2 Depth=2
	lea	hl, iy + 0
	ld	de, 4
	or	a, a
	sbc	hl, de
	jp	nz, .LBB9_23
; %bb.87:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	de, (ix - 82)
	push	de
	pop	hl
	ld	bc, 4
	or	a, a
	sbc	hl, bc
                                        ; kill: def $a killed $a
	sbc	a, a
	bit	0, a
	ld	hl, _.str.853
	jr	nz, .LBB9_89
; %bb.88:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, (ix - 64)
	.local	.LBB9_89
.LBB9_89:                               ;   in Loop: Header=BB9_2 Depth=2
	bit	0, a
	ld	bc, 52
	jp	z, .LBB9_20
	jp	.LBB9_21
	.local	.LBB9_90
.LBB9_90:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	cp	a, 56
	jr	nz, .LBB9_97
; %bb.91:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	bc, -144
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB9_97
; %bb.92:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	iy, (ix - 118)
	ld	bc, -144
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	add	iy, de
	dec	de
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	(iy - 1), 0
	jp	.LBB9_84
	.local	.LBB9_93
.LBB9_93:                               ;   in Loop: Header=BB9_2 Depth=2
	push	de
	pop	hl
	ld	bc, 26979
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB9_103
; %bb.94:                               ;   in Loop: Header=BB9_2 Depth=2
	lea	de, iy + 0
	ld	hl, _.str.145
	ld	bc, 11
	jp	.LBB9_71
	.local	.LBB9_95
.LBB9_95:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, 2
	jp	.LBB9_58
	.local	.LBB9_96
.LBB9_96:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, 1
	jp	.LBB9_58
	.local	.LBB9_97
.LBB9_97:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	a, e
	dec	a
	cp	a, 59
	ld	a, 0
	jp	nc, .LBB9_2
; %bb.98:                               ;   in Loop: Header=BB9_2 Depth=2
	ld	bc, -144
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	bc, 19
	or	a, a
	sbc	hl, bc
	ld	bc, 0
	call	pe, __setflag
	jp	p, .LBB9_2
; %bb.99:                               ;   in Loop: Header=BB9_2 Depth=2
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 7
	bit	0, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, ___const.gui_search_loop.chars_alpha
	jr	nz, .LBB9_101
; %bb.100:                              ;   in Loop: Header=BB9_2 Depth=2
	ld	hl, ___const.gui_search_loop.chars_normal
	.local	.LBB9_101
.LBB9_101:                              ;   in Loop: Header=BB9_2 Depth=2
	ld	c, e
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	a, 0
	jp	z, .LBB9_2
; %bb.102:                              ;   in Loop: Header=BB9_2 Depth=2
	ld	iy, (ix - 118)
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 16)
	pop	ix
	add	iy, de
	inc	de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 16), de
	pop	ix
	ld	(iy), l
	ld	(iy + 1), 0
	jp	.LBB9_84
	.local	.LBB9_103
.LBB9_103:                              ;   in Loop: Header=BB9_2 Depth=2
	ex	de, hl
	ld	de, 28520
	or	a, a
	sbc	hl, de
	jp	nz, .LBB9_72
; %bb.104:                              ;   in Loop: Header=BB9_2 Depth=2
	lea	de, iy + 0
	ld	hl, _.str.460
	ld	bc, 5
	jp	.LBB9_71
	.local	.LBB9_105
.LBB9_105:                              ;   in Loop: Header=BB9_1 Depth=1
	ld	(ix - 46), 0
	call	_rand
	ld	iy, (ix - 118)
	ld	bc, 5
	call	__irems
	ld	de, -138
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	xor	a, a
	ld	(ix - 128), a                   ; 1-byte Folded Spill
	jr	.LBB9_108
	.local	.LBB9_106
.LBB9_106:                              ;   in Loop: Header=BB9_1 Depth=1
	ld	de, -144
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB9_109
; %bb.107:                              ;   in Loop: Header=BB9_1 Depth=1
	ld	(ix - 46), 0
	.local	.LBB9_108
.LBB9_108:                              ;   in Loop: Header=BB9_1 Depth=1
	ld	hl, _.str.820
	ld	de, -134
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	a, 1
	or	a, a
	sbc	hl, hl
	jp	.LBB9_1
	.local	.LBB9_109
.LBB9_109:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end9
.Lfunc_end9:
	.size	_gui_search_loop, .Lfunc_end9-_gui_search_loop
	.section	.rodata._gui_search_loop,"a",@progbits
JTI9_0:
	d24	.LBB9_39
	d24	.LBB9_66
	d24	.LBB9_95
	d24	.LBB9_96
	d24	.LBB9_2
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
	jr	z, .LBB10_2
; %bb.1:
	ld	hl, _g_db
	push	hl
	call	_gui_search_loop
	pop	hl
	jr	.LBB10_4
	.local	.LBB10_2
.LBB10_2:
	ld	hl, 255
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 10
	push	hl
	push	hl
	ld	hl, _.str.858
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB10_3
.LBB10_3:                               ; =>This Inner Loop Header: Depth=1
	call	_os_GetCSC
	cp	a, 15
	jr	nz, .LBB10_3
	.local	.LBB10_4
.LBB10_4:                               ; %.loopexit
	ld	hl, _g_db
	push	hl
	call	_close_database
	pop	hl
	call	_gfx_End
	or	a, a
	sbc	hl, hl
	ret
	.local	.Lfunc_end10
.Lfunc_end10:
	.size	_main, .Lfunc_end10-_main
                                        ; -- End function
	.section	.text._djb2_hash,"ax",@progbits
	.globl	_djb2_hash                      ; -- Begin function djb2_hash
	.type	_djb2_hash,@function
_djb2_hash:                             ; @djb2_hash
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	iy, (ix + 6)
	ld	e, 0
	ld	hl, 5381
	.local	.LBB11_1
.LBB11_1:                               ; =>This Inner Loop Header: Depth=1
	ld	d, (iy)
	ld	a, d
	or	a, a
	jr	z, .LBB11_3
; %bb.2:                                ;   in Loop: Header=BB11_1 Depth=1
	ld	bc, 33
	xor	a, a
	call	__lmulu
	ld	(ix - 3), hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, d
	rlc	d
	sbc	a, a
	ld	hl, (ix - 3)
	call	__ladd
	inc	iy
	jr	.LBB11_1
	.local	.LBB11_3
.LBB11_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end11
.Lfunc_end11:
	.size	_djb2_hash, .Lfunc_end11-_djb2_hash
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
	.local	.LBB12_1
.LBB12_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB12_8
; %bb.2:                                ;   in Loop: Header=BB12_1 Depth=1
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
	jp	z, .LBB12_7
; %bb.3:                                ;   in Loop: Header=BB12_1 Depth=1
	call	__lcmpu
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	bit	0, a
	ld	bc, (ix - 5)
	jr	nz, .LBB12_5
; %bb.4:                                ;   in Loop: Header=BB12_1 Depth=1
	ld	bc, (ix - 14)
	dec	bc
	.local	.LBB12_5
.LBB12_5:                               ;   in Loop: Header=BB12_1 Depth=1
	bit	0, a
	ld	de, (ix - 8)
	jp	z, .LBB12_1
; %bb.6:                                ;   in Loop: Header=BB12_1 Depth=1
	ld	de, (ix - 14)
	inc	de
	jp	.LBB12_1
	.local	.LBB12_7
.LBB12_7:
	ld	a, (iy + 4)
	ld	hl, (ix + 18)
	ld	(hl), a
	ld	a, (iy + 5)
	ld	hl, (ix + 21)
	ld	(hl), a
	ld	bc, (ix - 5)
	ld	de, (ix - 8)
	.local	.LBB12_8
.LBB12_8:                               ; %.loopexit
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB12_10
; %bb.9:                                ; %.loopexit
	ld	a, 0
	jr	.LBB12_11
	.local	.LBB12_10
.LBB12_10:
	ld	a, -1
	.local	.LBB12_11
.LBB12_11:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end12
.Lfunc_end12:
	.size	_binary_search_keyword, .Lfunc_end12-_binary_search_keyword
                                        ; -- End function
	.section	.rodata._.str,"a",@progbits
	.balign	1
	.local	_.str
_.str:
	.asciz	"STATDAT1"

	.section	.rodata._.str.1,"a",@progbits
	.balign	1
	.local	_.str.1
_.str.1:
	.asciz	"r"

	.section	.rodata._.str.2,"a",@progbits
	.balign	1
	.local	_.str.2
_.str.2:
	.zero	1

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
	d24	_.str.2
	d24	_.str.208
	d24	_.str.511
	d24	_.str.530
	d24	_.str.4
	d24	_.str.536
	d24	_.str.332
	d24	_.str.7
	d24	_.str.629
	d24	_.str.544
	d24	_.str.589
	d24	_.str.777
	d24	_.str.253
	d24	_.str.464
	d24	_.str.576
	d24	_.str.160
	d24	_.str.560
	d24	_.str.345
	d24	_.str.673
	d24	_.str.487
	d24	_.str.243
	d24	_.str.418
	d24	_.str.426
	d24	_.str.454
	d24	_.str.142

	.section	.rodata._g_dict_size,"a",@progbits
	.balign	1
	.globl	_g_dict_size
_g_dict_size:
	db	24                              ; 0x18

	.section	.rodata._.str.25,"a",@progbits
	.balign	1
	.local	_.str.25
_.str.25:
	.asciz	"about"

	.section	.rodata._.str.1.26,"a",@progbits
	.balign	1
	.local	_.str.1.26
_.str.1.26:
	.asciz	"above"

	.section	.rodata._.str.2.27,"a",@progbits
	.balign	1
	.local	_.str.2.27
_.str.2.27:
	.asciz	"accepting"

	.section	.rodata._.str.3.28,"a",@progbits
	.balign	1
	.local	_.str.3.28
_.str.3.28:
	.asciz	"accounted"

	.section	.rodata._.str.4.29,"a",@progbits
	.balign	1
	.local	_.str.4.29
_.str.4.29:
	.asciz	"accuracy"

	.section	.rodata._.str.5.30,"a",@progbits
	.balign	1
	.local	_.str.5.30
_.str.5.30:
	.asciz	"across"

	.section	.rodata._.str.6.31,"a",@progbits
	.balign	1
	.local	_.str.6.31
_.str.6.31:
	.asciz	"action"

	.section	.rodata._.str.7.32,"a",@progbits
	.balign	1
	.local	_.str.7.32
_.str.7.32:
	.asciz	"actions"

	.section	.rodata._.str.8.33,"a",@progbits
	.balign	1
	.local	_.str.8.33
_.str.8.33:
	.asciz	"actual"

	.section	.rodata._.str.9.34,"a",@progbits
	.balign	1
	.local	_.str.9.34
_.str.9.34:
	.asciz	"actually"

	.section	.rodata._.str.10.35,"a",@progbits
	.balign	1
	.local	_.str.10.35
_.str.10.35:
	.asciz	"adds"

	.section	.rodata._.str.11.36,"a",@progbits
	.balign	1
	.local	_.str.11.36
_.str.11.36:
	.asciz	"affect"

	.section	.rodata._.str.12.37,"a",@progbits
	.balign	1
	.local	_.str.12.37
_.str.12.37:
	.asciz	"affected"

	.section	.rodata._.str.13.38,"a",@progbits
	.balign	1
	.local	_.str.13.38
_.str.13.38:
	.asciz	"affects"

	.section	.rodata._.str.14.39,"a",@progbits
	.balign	1
	.local	_.str.14.39
_.str.14.39:
	.asciz	"after"

	.section	.rodata._.str.15.40,"a",@progbits
	.balign	1
	.local	_.str.15.40
_.str.15.40:
	.asciz	"allows"

	.section	.rodata._.str.16.41,"a",@progbits
	.balign	1
	.local	_.str.16.41
_.str.16.41:
	.asciz	"alpha"

	.section	.rodata._.str.17.42,"a",@progbits
	.balign	1
	.local	_.str.17.42
_.str.17.42:
	.asciz	"already"

	.section	.rodata._.str.18.43,"a",@progbits
	.balign	1
	.local	_.str.18.43
_.str.18.43:
	.asciz	"also"

	.section	.rodata._.str.19.44,"a",@progbits
	.balign	1
	.local	_.str.19.44
_.str.19.44:
	.asciz	"alternative"

	.section	.rodata._.str.20.45,"a",@progbits
	.balign	1
	.local	_.str.20.45
_.str.20.45:
	.asciz	"always"

	.section	.rodata._.str.21.46,"a",@progbits
	.balign	1
	.local	_.str.21.46
_.str.21.46:
	.asciz	"analyze"

	.section	.rodata._.str.22.47,"a",@progbits
	.balign	1
	.local	_.str.22.47
_.str.22.47:
	.asciz	"another"

	.section	.rodata._.str.23.48,"a",@progbits
	.balign	1
	.local	_.str.23.48
_.str.23.48:
	.asciz	"answer"

	.section	.rodata._.str.24.49,"a",@progbits
	.balign	1
	.local	_.str.24.49
_.str.24.49:
	.asciz	"answers"

	.section	.rodata._.str.25.50,"a",@progbits
	.balign	1
	.local	_.str.25.50
_.str.25.50:
	.asciz	"apparent"

	.section	.rodata._.str.26,"a",@progbits
	.balign	1
	.local	_.str.26
_.str.26:
	.asciz	"application"

	.section	.rodata._.str.27,"a",@progbits
	.balign	1
	.local	_.str.27
_.str.27:
	.asciz	"applied"

	.section	.rodata._.str.28,"a",@progbits
	.balign	1
	.local	_.str.28
_.str.28:
	.asciz	"apply"

	.section	.rodata._.str.29,"a",@progbits
	.balign	1
	.local	_.str.29
_.str.29:
	.asciz	"approaches"

	.section	.rodata._.str.30,"a",@progbits
	.balign	1
	.local	_.str.30
_.str.30:
	.asciz	"approximately"

	.section	.rodata._.str.31,"a",@progbits
	.balign	1
	.local	_.str.31
_.str.31:
	.asciz	"archive"

	.section	.rodata._.str.32,"a",@progbits
	.balign	1
	.local	_.str.32
_.str.32:
	.asciz	"area"

	.section	.rodata._.str.33,"a",@progbits
	.balign	1
	.local	_.str.33
_.str.33:
	.asciz	"arrate"

	.section	.rodata._.str.34,"a",@progbits
	.balign	1
	.local	_.str.34
_.str.34:
	.asciz	"arrive"

	.section	.rodata._.str.35,"a",@progbits
	.balign	1
	.local	_.str.35
_.str.35:
	.asciz	"ascending"

	.section	.rodata._.str.36,"a",@progbits
	.balign	1
	.local	_.str.36
_.str.36:
	.asciz	"asks"

	.section	.rodata._.str.37,"a",@progbits
	.balign	1
	.local	_.str.37
_.str.37:
	.asciz	"assigned"

	.section	.rodata._.str.38,"a",@progbits
	.balign	1
	.local	_.str.38
_.str.38:
	.asciz	"assignment"

	.section	.rodata._.str.39,"a",@progbits
	.balign	1
	.local	_.str.39
_.str.39:
	.asciz	"associated"

	.section	.rodata._.str.40,"a",@progbits
	.balign	1
	.local	_.str.40
_.str.40:
	.asciz	"association"

	.section	.rodata._.str.41,"a",@progbits
	.balign	1
	.local	_.str.41
_.str.41:
	.asciz	"assume"

	.section	.rodata._.str.42,"a",@progbits
	.balign	1
	.local	_.str.42
_.str.42:
	.asciz	"assumes"

	.section	.rodata._.str.43,"a",@progbits
	.balign	1
	.local	_.str.43
_.str.43:
	.asciz	"assuming"

	.section	.rodata._.str.44,"a",@progbits
	.balign	1
	.local	_.str.44
_.str.44:
	.asciz	"assumptions"

	.section	.rodata._.str.45,"a",@progbits
	.balign	1
	.local	_.str.45
_.str.45:
	.asciz	"automatically"

	.section	.rodata._.str.46,"a",@progbits
	.balign	1
	.local	_.str.46
_.str.46:
	.asciz	"average"

	.section	.rodata._.str.47,"a",@progbits
	.balign	1
	.local	_.str.47
_.str.47:
	.asciz	"axis"

	.section	.rodata._.str.48,"a",@progbits
	.balign	1
	.local	_.str.48
_.str.48:
	.asciz	"back"

	.section	.rodata._.str.49,"a",@progbits
	.balign	1
	.local	_.str.49
_.str.49:
	.asciz	"balance"

	.section	.rodata._.str.50,"a",@progbits
	.balign	1
	.local	_.str.50
_.str.50:
	.asciz	"bar1"

	.section	.rodata._.str.51,"a",@progbits
	.balign	1
	.local	_.str.51
_.str.51:
	.asciz	"bar2"

	.section	.rodata._.str.52,"a",@progbits
	.balign	1
	.local	_.str.52
_.str.52:
	.asciz	"bars"

	.section	.rodata._.str.53,"a",@progbits
	.balign	1
	.local	_.str.53
_.str.53:
	.asciz	"based"

	.section	.rodata._.str.54,"a",@progbits
	.balign	1
	.local	_.str.54
_.str.54:
	.asciz	"baseline"

	.section	.rodata._.str.55,"a",@progbits
	.balign	1
	.local	_.str.55
_.str.55:
	.asciz	"because"

	.section	.rodata._.str.56,"a",@progbits
	.balign	1
	.local	_.str.56
_.str.56:
	.asciz	"becomes"

	.section	.rodata._.str.57,"a",@progbits
	.balign	1
	.local	_.str.57
_.str.57:
	.asciz	"before"

	.section	.rodata._.str.58,"a",@progbits
	.balign	1
	.local	_.str.58
_.str.58:
	.asciz	"behavior"

	.section	.rodata._.str.59,"a",@progbits
	.balign	1
	.local	_.str.59
_.str.59:
	.asciz	"being"

	.section	.rodata._.str.60,"a",@progbits
	.balign	1
	.local	_.str.60
_.str.60:
	.asciz	"believe"

	.section	.rodata._.str.61,"a",@progbits
	.balign	1
	.local	_.str.61
_.str.61:
	.asciz	"below"

	.section	.rodata._.str.62,"a",@progbits
	.balign	1
	.local	_.str.62
_.str.62:
	.asciz	"best"

	.section	.rodata._.str.63,"a",@progbits
	.balign	1
	.local	_.str.63
_.str.63:
	.asciz	"beta"

	.section	.rodata._.str.64,"a",@progbits
	.balign	1
	.local	_.str.64
_.str.64:
	.asciz	"betax"

	.section	.rodata._.str.65,"a",@progbits
	.balign	1
	.local	_.str.65
_.str.65:
	.asciz	"between"

	.section	.rodata._.str.66,"a",@progbits
	.balign	1
	.local	_.str.66
_.str.66:
	.asciz	"bias"

	.section	.rodata._.str.67,"a",@progbits
	.balign	1
	.local	_.str.67
_.str.67:
	.asciz	"biased"

	.section	.rodata._.str.68,"a",@progbits
	.balign	1
	.local	_.str.68
_.str.68:
	.asciz	"binary"

	.section	.rodata._.str.69,"a",@progbits
	.balign	1
	.local	_.str.69
_.str.69:
	.asciz	"binom"

	.section	.rodata._.str.70,"a",@progbits
	.balign	1
	.local	_.str.70
_.str.70:
	.asciz	"binomcdf"

	.section	.rodata._.str.71,"a",@progbits
	.balign	1
	.local	_.str.71
_.str.71:
	.asciz	"binomial"

	.section	.rodata._.str.72,"a",@progbits
	.balign	1
	.local	_.str.72
_.str.72:
	.asciz	"binompdf"

	.section	.rodata._.str.73,"a",@progbits
	.balign	1
	.local	_.str.73
_.str.73:
	.asciz	"bins"

	.section	.rodata._.str.74,"a",@progbits
	.balign	1
	.local	_.str.74
_.str.74:
	.asciz	"bits"

	.section	.rodata._.str.75,"a",@progbits
	.balign	1
	.local	_.str.75
_.str.75:
	.asciz	"blocking"

	.section	.rodata._.str.76,"a",@progbits
	.balign	1
	.local	_.str.76
_.str.76:
	.asciz	"both"

	.section	.rodata._.str.77,"a",@progbits
	.balign	1
	.local	_.str.77
_.str.77:
	.asciz	"bound"

	.section	.rodata._.str.78,"a",@progbits
	.balign	1
	.local	_.str.78
_.str.78:
	.asciz	"boxplot"

	.section	.rodata._.str.79,"a",@progbits
	.balign	1
	.local	_.str.79
_.str.79:
	.asciz	"boxplots"

	.section	.rodata._.str.80,"a",@progbits
	.balign	1
	.local	_.str.80
_.str.80:
	.asciz	"bridge"

	.section	.rodata._.str.81,"a",@progbits
	.balign	1
	.local	_.str.81
_.str.81:
	.asciz	"build"

	.section	.rodata._.str.82,"a",@progbits
	.balign	1
	.local	_.str.82
_.str.82:
	.asciz	"bulletproof"

	.section	.rodata._.str.83,"a",@progbits
	.balign	1
	.local	_.str.83
_.str.83:
	.asciz	"calculate"

	.section	.rodata._.str.84,"a",@progbits
	.balign	1
	.local	_.str.84
_.str.84:
	.asciz	"calculated"

	.section	.rodata._.str.85,"a",@progbits
	.balign	1
	.local	_.str.85
_.str.85:
	.asciz	"calculation"

	.section	.rodata._.str.86,"a",@progbits
	.balign	1
	.local	_.str.86
_.str.86:
	.asciz	"calculations"

	.section	.rodata._.str.87,"a",@progbits
	.balign	1
	.local	_.str.87
_.str.87:
	.asciz	"calculator"

	.section	.rodata._.str.88,"a",@progbits
	.balign	1
	.local	_.str.88
_.str.88:
	.asciz	"cannot"

	.section	.rodata._.str.89,"a",@progbits
	.balign	1
	.local	_.str.89
_.str.89:
	.asciz	"capture"

	.section	.rodata._.str.90,"a",@progbits
	.balign	1
	.local	_.str.90
_.str.90:
	.asciz	"captures"

	.section	.rodata._.str.91,"a",@progbits
	.balign	1
	.local	_.str.91
_.str.91:
	.asciz	"categorical"

	.section	.rodata._.str.92,"a",@progbits
	.balign	1
	.local	_.str.92
_.str.92:
	.asciz	"categories"

	.section	.rodata._.str.93,"a",@progbits
	.balign	1
	.local	_.str.93
_.str.93:
	.asciz	"category"

	.section	.rodata._.str.94,"a",@progbits
	.balign	1
	.local	_.str.94
_.str.94:
	.asciz	"cause"

	.section	.rodata._.str.95,"a",@progbits
	.balign	1
	.local	_.str.95
_.str.95:
	.asciz	"cdot"

	.section	.rodata._.str.96,"a",@progbits
	.balign	1
	.local	_.str.96
_.str.96:
	.asciz	"cell"

	.section	.rodata._.str.97,"a",@progbits
	.balign	1
	.local	_.str.97
_.str.97:
	.asciz	"center"

	.section	.rodata._.str.98,"a",@progbits
	.balign	1
	.local	_.str.98
_.str.98:
	.asciz	"central"

	.section	.rodata._.str.99,"a",@progbits
	.balign	1
	.local	_.str.99
_.str.99:
	.asciz	"certain"

	.section	.rodata._.str.100,"a",@progbits
	.balign	1
	.local	_.str.100
_.str.100:
	.asciz	"chance"

	.section	.rodata._.str.101,"a",@progbits
	.balign	1
	.local	_.str.101
_.str.101:
	.asciz	"change"

	.section	.rodata._.str.102,"a",@progbits
	.balign	1
	.local	_.str.102
_.str.102:
	.asciz	"changes"

	.section	.rodata._.str.103,"a",@progbits
	.balign	1
	.local	_.str.103
_.str.103:
	.asciz	"chapter"

	.section	.rodata._.str.104,"a",@progbits
	.balign	1
	.local	_.str.104
_.str.104:
	.asciz	"chapters"

	.section	.rodata._.str.105,"a",@progbits
	.balign	1
	.local	_.str.105
_.str.105:
	.asciz	"characteristics"

	.section	.rodata._.str.106,"a",@progbits
	.balign	1
	.local	_.str.106
_.str.106:
	.asciz	"chart"

	.section	.rodata._.str.107,"a",@progbits
	.balign	1
	.local	_.str.107
_.str.107:
	.asciz	"charts"

	.section	.rodata._.str.108,"a",@progbits
	.balign	1
	.local	_.str.108
_.str.108:
	.asciz	"check"

	.section	.rodata._.str.109,"a",@progbits
	.balign	1
	.local	_.str.109
_.str.109:
	.asciz	"checking"

	.section	.rodata._.str.110,"a",@progbits
	.balign	1
	.local	_.str.110
_.str.110:
	.asciz	"choosing"

	.section	.rodata._.str.111,"a",@progbits
	.balign	1
	.local	_.str.111
_.str.111:
	.asciz	"chosen"

	.section	.rodata._.str.112,"a",@progbits
	.balign	1
	.local	_.str.112
_.str.112:
	.asciz	"claim"

	.section	.rodata._.str.113,"a",@progbits
	.balign	1
	.local	_.str.113
_.str.113:
	.asciz	"claimed"

	.section	.rodata._.str.114,"a",@progbits
	.balign	1
	.local	_.str.114
_.str.114:
	.asciz	"clear"

	.section	.rodata._.str.115,"a",@progbits
	.balign	1
	.local	_.str.115
_.str.115:
	.asciz	"clearing"

	.section	.rodata._.str.116,"a",@progbits
	.balign	1
	.local	_.str.116
_.str.116:
	.asciz	"clearly"

	.section	.rodata._.str.117,"a",@progbits
	.balign	1
	.local	_.str.117
_.str.117:
	.asciz	"closer"

	.section	.rodata._.str.118,"a",@progbits
	.balign	1
	.local	_.str.118
_.str.118:
	.asciz	"cluster"

	.section	.rodata._.str.119,"a",@progbits
	.balign	1
	.local	_.str.119
_.str.119:
	.asciz	"clusters"

	.section	.rodata._.str.120,"a",@progbits
	.balign	1
	.local	_.str.120
_.str.120:
	.asciz	"coefficient"

	.section	.rodata._.str.121,"a",@progbits
	.balign	1
	.local	_.str.121
_.str.121:
	.asciz	"collection"

	.section	.rodata._.str.122,"a",@progbits
	.balign	1
	.local	_.str.122
_.str.122:
	.asciz	"cols"

	.section	.rodata._.str.123,"a",@progbits
	.balign	1
	.local	_.str.123
_.str.123:
	.asciz	"column"

	.section	.rodata._.str.124,"a",@progbits
	.balign	1
	.local	_.str.124
_.str.124:
	.asciz	"combinations"

	.section	.rodata._.str.125,"a",@progbits
	.balign	1
	.local	_.str.125
_.str.125:
	.asciz	"combine"

	.section	.rodata._.str.126,"a",@progbits
	.balign	1
	.local	_.str.126
_.str.126:
	.asciz	"combined"

	.section	.rodata._.str.127,"a",@progbits
	.balign	1
	.local	_.str.127
_.str.127:
	.asciz	"combining"

	.section	.rodata._.str.128,"a",@progbits
	.balign	1
	.local	_.str.128
_.str.128:
	.asciz	"comes"

	.section	.rodata._.str.129,"a",@progbits
	.balign	1
	.local	_.str.129
_.str.129:
	.asciz	"command"

	.section	.rodata._.str.130,"a",@progbits
	.balign	1
	.local	_.str.130
_.str.130:
	.asciz	"common"

	.section	.rodata._.str.131,"a",@progbits
	.balign	1
	.local	_.str.131
_.str.131:
	.asciz	"compare"

	.section	.rodata._.str.132,"a",@progbits
	.balign	1
	.local	_.str.132
_.str.132:
	.asciz	"compared"

	.section	.rodata._.str.133,"a",@progbits
	.balign	1
	.local	_.str.133
_.str.133:
	.asciz	"comparing"

	.section	.rodata._.str.134,"a",@progbits
	.balign	1
	.local	_.str.134
_.str.134:
	.asciz	"comparison"

	.section	.rodata._.str.135,"a",@progbits
	.balign	1
	.local	_.str.135
_.str.135:
	.asciz	"complement"

	.section	.rodata._.str.136,"a",@progbits
	.balign	1
	.local	_.str.136
_.str.136:
	.asciz	"components"

	.section	.rodata._.str.137,"a",@progbits
	.balign	1
	.local	_.str.137
_.str.137:
	.asciz	"computer"

	.section	.rodata._.str.138,"a",@progbits
	.balign	1
	.local	_.str.138
_.str.138:
	.asciz	"concept"

	.section	.rodata._.str.139,"a",@progbits
	.balign	1
	.local	_.str.139
_.str.139:
	.asciz	"concluding"

	.section	.rodata._.str.140,"a",@progbits
	.balign	1
	.local	_.str.140
_.str.140:
	.asciz	"conclusion"

	.section	.rodata._.str.141,"a",@progbits
	.balign	1
	.local	_.str.141
_.str.141:
	.asciz	"conclusions"

	.section	.rodata._.str.142,"a",@progbits
	.balign	1
	.local	_.str.142
_.str.142:
	.asciz	"condition"

	.section	.rodata._.str.143,"a",@progbits
	.balign	1
	.local	_.str.143
_.str.143:
	.asciz	"conditional"

	.section	.rodata._.str.144,"a",@progbits
	.balign	1
	.local	_.str.144
_.str.144:
	.asciz	"conditions"

	.section	.rodata._.str.145,"a",@progbits
	.balign	1
	.local	_.str.145
_.str.145:
	.asciz	"confidence"

	.section	.rodata._.str.146,"a",@progbits
	.balign	1
	.local	_.str.146
_.str.146:
	.asciz	"confident"

	.section	.rodata._.str.147,"a",@progbits
	.balign	1
	.local	_.str.147
_.str.147:
	.asciz	"confirm"

	.section	.rodata._.str.148,"a",@progbits
	.balign	1
	.local	_.str.148
_.str.148:
	.asciz	"confounding"

	.section	.rodata._.str.149,"a",@progbits
	.balign	1
	.local	_.str.149
_.str.149:
	.asciz	"consistent"

	.section	.rodata._.str.150,"a",@progbits
	.balign	1
	.local	_.str.150
_.str.150:
	.asciz	"constant"

	.section	.rodata._.str.151,"a",@progbits
	.balign	1
	.local	_.str.151
_.str.151:
	.asciz	"construct"

	.section	.rodata._.str.152,"a",@progbits
	.balign	1
	.local	_.str.152
_.str.152:
	.asciz	"contains"

	.section	.rodata._.str.153,"a",@progbits
	.balign	1
	.local	_.str.153
_.str.153:
	.asciz	"context"

	.section	.rodata._.str.154,"a",@progbits
	.balign	1
	.local	_.str.154
_.str.154:
	.asciz	"continuous"

	.section	.rodata._.str.155,"a",@progbits
	.balign	1
	.local	_.str.155
_.str.155:
	.asciz	"contribution"

	.section	.rodata._.str.156,"a",@progbits
	.balign	1
	.local	_.str.156
_.str.156:
	.asciz	"control"

	.section	.rodata._.str.157,"a",@progbits
	.balign	1
	.local	_.str.157
_.str.157:
	.asciz	"convincing"

	.section	.rodata._.str.158,"a",@progbits
	.balign	1
	.local	_.str.158
_.str.158:
	.asciz	"correct"

	.section	.rodata._.str.159,"a",@progbits
	.balign	1
	.local	_.str.159
_.str.159:
	.asciz	"correctly"

	.section	.rodata._.str.160,"a",@progbits
	.balign	1
	.local	_.str.160
_.str.160:
	.asciz	"correlation"

	.section	.rodata._.str.161,"a",@progbits
	.balign	1
	.local	_.str.161
_.str.161:
	.asciz	"could"

	.section	.rodata._.str.162,"a",@progbits
	.balign	1
	.local	_.str.162
_.str.162:
	.asciz	"counts"

	.section	.rodata._.str.163,"a",@progbits
	.balign	1
	.local	_.str.163
_.str.163:
	.asciz	"create"

	.section	.rodata._.str.164,"a",@progbits
	.balign	1
	.local	_.str.164
_.str.164:
	.asciz	"credit"

	.section	.rodata._.str.165,"a",@progbits
	.balign	1
	.local	_.str.165
_.str.165:
	.asciz	"crit"

	.section	.rodata._.str.166,"a",@progbits
	.balign	1
	.local	_.str.166
_.str.166:
	.asciz	"critical"

	.section	.rodata._.str.167,"a",@progbits
	.balign	1
	.local	_.str.167
_.str.167:
	.asciz	"cumulative"

	.section	.rodata._.str.168,"a",@progbits
	.balign	1
	.local	_.str.168
_.str.168:
	.asciz	"curve"

	.section	.rodata._.str.169,"a",@progbits
	.balign	1
	.local	_.str.169
_.str.169:
	.asciz	"cutoff"

	.section	.rodata._.str.170,"a",@progbits
	.balign	1
	.local	_.str.170
_.str.170:
	.asciz	"danger"

	.section	.rodata._.str.171,"a",@progbits
	.balign	1
	.local	_.str.171
_.str.171:
	.asciz	"data"

	.section	.rodata._.str.172,"a",@progbits
	.balign	1
	.local	_.str.172
_.str.172:
	.asciz	"datasets"

	.section	.rodata._.str.173,"a",@progbits
	.balign	1
	.local	_.str.173
_.str.173:
	.asciz	"decision"

	.section	.rodata._.str.174,"a",@progbits
	.balign	1
	.local	_.str.174
_.str.174:
	.asciz	"decrease"

	.section	.rodata._.str.175,"a",@progbits
	.balign	1
	.local	_.str.175
_.str.175:
	.asciz	"decreases"

	.section	.rodata._.str.176,"a",@progbits
	.balign	1
	.local	_.str.176
_.str.176:
	.asciz	"defend"

	.section	.rodata._.str.177,"a",@progbits
	.balign	1
	.local	_.str.177
_.str.177:
	.asciz	"define"

	.section	.rodata._.str.178,"a",@progbits
	.balign	1
	.local	_.str.178
_.str.178:
	.asciz	"definition"

	.section	.rodata._.str.179,"a",@progbits
	.balign	1
	.local	_.str.179
_.str.179:
	.asciz	"definitions"

	.section	.rodata._.str.180,"a",@progbits
	.balign	1
	.local	_.str.180
_.str.180:
	.asciz	"degrees"

	.section	.rodata._.str.181,"a",@progbits
	.balign	1
	.local	_.str.181
_.str.181:
	.asciz	"denominator"

	.section	.rodata._.str.182,"a",@progbits
	.balign	1
	.local	_.str.182
_.str.182:
	.asciz	"density"

	.section	.rodata._.str.183,"a",@progbits
	.balign	1
	.local	_.str.183
_.str.183:
	.asciz	"dentify"

	.section	.rodata._.str.184,"a",@progbits
	.balign	1
	.local	_.str.184
_.str.184:
	.asciz	"describe"

	.section	.rodata._.str.185,"a",@progbits
	.balign	1
	.local	_.str.185
_.str.185:
	.asciz	"described"

	.section	.rodata._.str.186,"a",@progbits
	.balign	1
	.local	_.str.186
_.str.186:
	.asciz	"describes"

	.section	.rodata._.str.187,"a",@progbits
	.balign	1
	.local	_.str.187
_.str.187:
	.asciz	"describing"

	.section	.rodata._.str.188,"a",@progbits
	.balign	1
	.local	_.str.188
_.str.188:
	.asciz	"descriptive"

	.section	.rodata._.str.189,"a",@progbits
	.balign	1
	.local	_.str.189
_.str.189:
	.asciz	"design"

	.section	.rodata._.str.190,"a",@progbits
	.balign	1
	.local	_.str.190
_.str.190:
	.asciz	"determination"

	.section	.rodata._.str.191,"a",@progbits
	.balign	1
	.local	_.str.191
_.str.191:
	.asciz	"determine"

	.section	.rodata._.str.192,"a",@progbits
	.balign	1
	.local	_.str.192
_.str.192:
	.asciz	"determining"

	.section	.rodata._.str.193,"a",@progbits
	.balign	1
	.local	_.str.193
_.str.193:
	.asciz	"deterministic"

	.section	.rodata._.str.194,"a",@progbits
	.balign	1
	.local	_.str.194
_.str.194:
	.asciz	"deviated"

	.section	.rodata._.str.195,"a",@progbits
	.balign	1
	.local	_.str.195
_.str.195:
	.asciz	"deviation"

	.section	.rodata._.str.196,"a",@progbits
	.balign	1
	.local	_.str.196
_.str.196:
	.asciz	"deviations"

	.section	.rodata._.str.197,"a",@progbits
	.balign	1
	.local	_.str.197
_.str.197:
	.asciz	"df"

	.section	.rodata._.str.198,"a",@progbits
	.balign	1
	.local	_.str.198
_.str.198:
	.asciz	"diagnosticon"

	.section	.rodata._.str.199,"a",@progbits
	.balign	1
	.local	_.str.199
_.str.199:
	.asciz	"diff"

	.section	.rodata._.str.200,"a",@progbits
	.balign	1
	.local	_.str.200
_.str.200:
	.asciz	"difference"

	.section	.rodata._.str.201,"a",@progbits
	.balign	1
	.local	_.str.201
_.str.201:
	.asciz	"differences"

	.section	.rodata._.str.202,"a",@progbits
	.balign	1
	.local	_.str.202
_.str.202:
	.asciz	"different"

	.section	.rodata._.str.203,"a",@progbits
	.balign	1
	.local	_.str.203
_.str.203:
	.asciz	"directions"

	.section	.rodata._.str.204,"a",@progbits
	.balign	1
	.local	_.str.204
_.str.204:
	.asciz	"directly"

	.section	.rodata._.str.205,"a",@progbits
	.balign	1
	.local	_.str.205
_.str.205:
	.asciz	"discrete"

	.section	.rodata._.str.206,"a",@progbits
	.balign	1
	.local	_.str.206
_.str.206:
	.asciz	"disjoint"

	.section	.rodata._.str.207,"a",@progbits
	.balign	1
	.local	_.str.207
_.str.207:
	.asciz	"distance"

	.section	.rodata._.str.208,"a",@progbits
	.balign	1
	.local	_.str.208
_.str.208:
	.asciz	"distribution"

	.section	.rodata._.str.209,"a",@progbits
	.balign	1
	.local	_.str.209
_.str.209:
	.asciz	"distributions"

	.section	.rodata._.str.210,"a",@progbits
	.balign	1
	.local	_.str.210
_.str.210:
	.asciz	"divided"

	.section	.rodata._.str.211,"a",@progbits
	.balign	1
	.local	_.str.211
_.str.211:
	.asciz	"dividing"

	.section	.rodata._.str.212,"a",@progbits
	.balign	1
	.local	_.str.212
_.str.212:
	.asciz	"does"

	.section	.rodata._.str.213,"a",@progbits
	.balign	1
	.local	_.str.213
_.str.213:
	.asciz	"dosage"

	.section	.rodata._.str.214,"a",@progbits
	.balign	1
	.local	_.str.214
_.str.214:
	.asciz	"draw"

	.section	.rodata._.str.215,"a",@progbits
	.balign	1
	.local	_.str.215
_.str.215:
	.asciz	"drawings"

	.section	.rodata._.str.216,"a",@progbits
	.balign	1
	.local	_.str.216
_.str.216:
	.asciz	"drawn"

	.section	.rodata._.str.217,"a",@progbits
	.balign	1
	.local	_.str.217
_.str.217:
	.asciz	"each"

	.section	.rodata._.str.218,"a",@progbits
	.balign	1
	.local	_.str.218
_.str.218:
	.asciz	"early"

	.section	.rodata._.str.219,"a",@progbits
	.balign	1
	.local	_.str.219
_.str.219:
	.asciz	"effect"

	.section	.rodata._.str.220,"a",@progbits
	.balign	1
	.local	_.str.220
_.str.220:
	.asciz	"effects"

	.section	.rodata._.str.221,"a",@progbits
	.balign	1
	.local	_.str.221
_.str.221:
	.asciz	"either"

	.section	.rodata._.str.222,"a",@progbits
	.balign	1
	.local	_.str.222
_.str.222:
	.asciz	"element"

	.section	.rodata._.str.223,"a",@progbits
	.balign	1
	.local	_.str.223
_.str.223:
	.asciz	"empirical"

	.section	.rodata._.str.224,"a",@progbits
	.balign	1
	.local	_.str.224
_.str.224:
	.asciz	"enable"

	.section	.rodata._.str.225,"a",@progbits
	.balign	1
	.local	_.str.225
_.str.225:
	.asciz	"enough"

	.section	.rodata._.str.226,"a",@progbits
	.balign	1
	.local	_.str.226
_.str.226:
	.asciz	"ensure"

	.section	.rodata._.str.227,"a",@progbits
	.balign	1
	.local	_.str.227
_.str.227:
	.asciz	"ensures"

	.section	.rodata._.str.228,"a",@progbits
	.balign	1
	.local	_.str.228
_.str.228:
	.asciz	"entire"

	.section	.rodata._.str.229,"a",@progbits
	.balign	1
	.local	_.str.229
_.str.229:
	.asciz	"epsilon"

	.section	.rodata._.str.230,"a",@progbits
	.balign	1
	.local	_.str.230
_.str.230:
	.asciz	"equal"

	.section	.rodata._.str.231,"a",@progbits
	.balign	1
	.local	_.str.231
_.str.231:
	.asciz	"equation"

	.section	.rodata._.str.232,"a",@progbits
	.balign	1
	.local	_.str.232
_.str.232:
	.asciz	"equivalent"

	.section	.rodata._.str.233,"a",@progbits
	.balign	1
	.local	_.str.233
_.str.233:
	.asciz	"error"

	.section	.rodata._.str.234,"a",@progbits
	.balign	1
	.local	_.str.234
_.str.234:
	.asciz	"errors"

	.section	.rodata._.str.235,"a",@progbits
	.balign	1
	.local	_.str.235
_.str.235:
	.asciz	"estimate"

	.section	.rodata._.str.236,"a",@progbits
	.balign	1
	.local	_.str.236
_.str.236:
	.asciz	"estimated"

	.section	.rodata._.str.237,"a",@progbits
	.balign	1
	.local	_.str.237
_.str.237:
	.asciz	"estimates"

	.section	.rodata._.str.238,"a",@progbits
	.balign	1
	.local	_.str.238
_.str.238:
	.asciz	"estimator"

	.section	.rodata._.str.239,"a",@progbits
	.balign	1
	.local	_.str.239
_.str.239:
	.asciz	"even"

	.section	.rodata._.str.240,"a",@progbits
	.balign	1
	.local	_.str.240
_.str.240:
	.asciz	"event"

	.section	.rodata._.str.241,"a",@progbits
	.balign	1
	.local	_.str.241
_.str.241:
	.asciz	"events"

	.section	.rodata._.str.242,"a",@progbits
	.balign	1
	.local	_.str.242
_.str.242:
	.asciz	"every"

	.section	.rodata._.str.243,"a",@progbits
	.balign	1
	.local	_.str.243
_.str.243:
	.asciz	"evidence"

	.section	.rodata._.str.244,"a",@progbits
	.balign	1
	.local	_.str.244
_.str.244:
	.asciz	"exact"

	.section	.rodata._.str.245,"a",@progbits
	.balign	1
	.local	_.str.245
_.str.245:
	.asciz	"exactly"

	.section	.rodata._.str.246,"a",@progbits
	.balign	1
	.local	_.str.246
_.str.246:
	.asciz	"exam"

	.section	.rodata._.str.247,"a",@progbits
	.balign	1
	.local	_.str.247
_.str.247:
	.asciz	"exclusive"

	.section	.rodata._.str.248,"a",@progbits
	.balign	1
	.local	_.str.248
_.str.248:
	.asciz	"execute"

	.section	.rodata._.str.249,"a",@progbits
	.balign	1
	.local	_.str.249
_.str.249:
	.asciz	"execution"

	.section	.rodata._.str.250,"a",@progbits
	.balign	1
	.local	_.str.250
_.str.250:
	.asciz	"exist"

	.section	.rodata._.str.251,"a",@progbits
	.balign	1
	.local	_.str.251
_.str.251:
	.asciz	"exists"

	.section	.rodata._.str.252,"a",@progbits
	.balign	1
	.local	_.str.252
_.str.252:
	.asciz	"expect"

	.section	.rodata._.str.253,"a",@progbits
	.balign	1
	.local	_.str.253
_.str.253:
	.asciz	"expected"

	.section	.rodata._.str.254,"a",@progbits
	.balign	1
	.local	_.str.254
_.str.254:
	.asciz	"experiment"

	.section	.rodata._.str.255,"a",@progbits
	.balign	1
	.local	_.str.255
_.str.255:
	.asciz	"experimental"

	.section	.rodata._.str.256,"a",@progbits
	.balign	1
	.local	_.str.256
_.str.256:
	.asciz	"experiments"

	.section	.rodata._.str.257,"a",@progbits
	.balign	1
	.local	_.str.257
_.str.257:
	.asciz	"explain"

	.section	.rodata._.str.258,"a",@progbits
	.balign	1
	.local	_.str.258
_.str.258:
	.asciz	"explained"

	.section	.rodata._.str.259,"a",@progbits
	.balign	1
	.local	_.str.259
_.str.259:
	.asciz	"explaining"

	.section	.rodata._.str.260,"a",@progbits
	.balign	1
	.local	_.str.260
_.str.260:
	.asciz	"explanation"

	.section	.rodata._.str.261,"a",@progbits
	.balign	1
	.local	_.str.261
_.str.261:
	.asciz	"explanatory"

	.section	.rodata._.str.262,"a",@progbits
	.balign	1
	.local	_.str.262
_.str.262:
	.asciz	"explicit"

	.section	.rodata._.str.263,"a",@progbits
	.balign	1
	.local	_.str.263
_.str.263:
	.asciz	"explicitly"

	.section	.rodata._.str.264,"a",@progbits
	.balign	1
	.local	_.str.264
_.str.264:
	.asciz	"extra"

	.section	.rodata._.str.265,"a",@progbits
	.balign	1
	.local	_.str.265
_.str.265:
	.asciz	"extrapolating"

	.section	.rodata._.str.266,"a",@progbits
	.balign	1
	.local	_.str.266
_.str.266:
	.asciz	"extrapolation"

	.section	.rodata._.str.267,"a",@progbits
	.balign	1
	.local	_.str.267
_.str.267:
	.asciz	"extreme"

	.section	.rodata._.str.268,"a",@progbits
	.balign	1
	.local	_.str.268
_.str.268:
	.asciz	"factor"

	.section	.rodata._.str.269,"a",@progbits
	.balign	1
	.local	_.str.269
_.str.269:
	.asciz	"factorials"

	.section	.rodata._.str.270,"a",@progbits
	.balign	1
	.local	_.str.270
_.str.270:
	.asciz	"fail"

	.section	.rodata._.str.271,"a",@progbits
	.balign	1
	.local	_.str.271
_.str.271:
	.asciz	"failing"

	.section	.rodata._.str.272,"a",@progbits
	.balign	1
	.local	_.str.272
_.str.272:
	.asciz	"falls"

	.section	.rodata._.str.273,"a",@progbits
	.balign	1
	.local	_.str.273
_.str.273:
	.asciz	"false"

	.section	.rodata._.str.274,"a",@progbits
	.balign	1
	.local	_.str.274
_.str.274:
	.asciz	"favors"

	.section	.rodata._.str.275,"a",@progbits
	.balign	1
	.local	_.str.275
_.str.275:
	.asciz	"final"

	.section	.rodata._.str.276,"a",@progbits
	.balign	1
	.local	_.str.276
_.str.276:
	.asciz	"find"

	.section	.rodata._.str.277,"a",@progbits
	.balign	1
	.local	_.str.277
_.str.277:
	.asciz	"finding"

	.section	.rodata._.str.278,"a",@progbits
	.balign	1
	.local	_.str.278
_.str.278:
	.asciz	"first"

	.section	.rodata._.str.279,"a",@progbits
	.balign	1
	.local	_.str.279
_.str.279:
	.asciz	"fits"

	.section	.rodata._.str.280,"a",@progbits
	.balign	1
	.local	_.str.280
_.str.280:
	.asciz	"fluke"

	.section	.rodata._.str.281,"a",@progbits
	.balign	1
	.local	_.str.281
_.str.281:
	.asciz	"follow"

	.section	.rodata._.str.282,"a",@progbits
	.balign	1
	.local	_.str.282
_.str.282:
	.asciz	"forget"

	.section	.rodata._.str.283,"a",@progbits
	.balign	1
	.local	_.str.283
_.str.283:
	.asciz	"forgetting"

	.section	.rodata._.str.284,"a",@progbits
	.balign	1
	.local	_.str.284
_.str.284:
	.asciz	"formula"

	.section	.rodata._.str.285,"a",@progbits
	.balign	1
	.local	_.str.285
_.str.285:
	.asciz	"formulas"

	.section	.rodata._.str.286,"a",@progbits
	.balign	1
	.local	_.str.286
_.str.286:
	.asciz	"frac"

	.section	.rodata._.str.287,"a",@progbits
	.balign	1
	.local	_.str.287
_.str.287:
	.asciz	"frame"

	.section	.rodata._.str.288,"a",@progbits
	.balign	1
	.local	_.str.288
_.str.288:
	.asciz	"framework"

	.section	.rodata._.str.289,"a",@progbits
	.balign	1
	.local	_.str.289
_.str.289:
	.asciz	"freedom"

	.section	.rodata._.str.290,"a",@progbits
	.balign	1
	.local	_.str.290
_.str.290:
	.asciz	"frequency"

	.section	.rodata._.str.291,"a",@progbits
	.balign	1
	.local	_.str.291
_.str.291:
	.asciz	"from"

	.section	.rodata._.str.292,"a",@progbits
	.balign	1
	.local	_.str.292
_.str.292:
	.asciz	"frqs"

	.section	.rodata._.str.293,"a",@progbits
	.balign	1
	.local	_.str.293
_.str.293:
	.asciz	"full"

	.section	.rodata._.str.294,"a",@progbits
	.balign	1
	.local	_.str.294
_.str.294:
	.asciz	"generalize"

	.section	.rodata._.str.295,"a",@progbits
	.balign	1
	.local	_.str.295
_.str.295:
	.asciz	"generating"

	.section	.rodata._.str.296,"a",@progbits
	.balign	1
	.local	_.str.296
_.str.296:
	.asciz	"generation"

	.section	.rodata._.str.297,"a",@progbits
	.balign	1
	.local	_.str.297
_.str.297:
	.asciz	"generator"

	.section	.rodata._.str.298,"a",@progbits
	.balign	1
	.local	_.str.298
_.str.298:
	.asciz	"geometric"

	.section	.rodata._.str.299,"a",@progbits
	.balign	1
	.local	_.str.299
_.str.299:
	.asciz	"gets"

	.section	.rodata._.str.300,"a",@progbits
	.balign	1
	.local	_.str.300
_.str.300:
	.asciz	"getting"

	.section	.rodata._.str.301,"a",@progbits
	.balign	1
	.local	_.str.301
_.str.301:
	.asciz	"give"

	.section	.rodata._.str.302,"a",@progbits
	.balign	1
	.local	_.str.302
_.str.302:
	.asciz	"given"

	.section	.rodata._.str.303,"a",@progbits
	.balign	1
	.local	_.str.303
_.str.303:
	.asciz	"gives"

	.section	.rodata._.str.304,"a",@progbits
	.balign	1
	.local	_.str.304
_.str.304:
	.asciz	"goal"

	.section	.rodata._.str.305,"a",@progbits
	.balign	1
	.local	_.str.305
_.str.305:
	.asciz	"golden"

	.section	.rodata._.str.306,"a",@progbits
	.balign	1
	.local	_.str.306
_.str.306:
	.asciz	"goodness"

	.section	.rodata._.str.307,"a",@progbits
	.balign	1
	.local	_.str.307
_.str.307:
	.asciz	"grand"

	.section	.rodata._.str.308,"a",@progbits
	.balign	1
	.local	_.str.308
_.str.308:
	.asciz	"graph"

	.section	.rodata._.str.309,"a",@progbits
	.balign	1
	.local	_.str.309
_.str.309:
	.asciz	"greater"

	.section	.rodata._.str.310,"a",@progbits
	.balign	1
	.local	_.str.310
_.str.310:
	.asciz	"group"

	.section	.rodata._.str.311,"a",@progbits
	.balign	1
	.local	_.str.311
_.str.311:
	.asciz	"grouping"

	.section	.rodata._.str.312,"a",@progbits
	.balign	1
	.local	_.str.312
_.str.312:
	.asciz	"groups"

	.section	.rodata._.str.313,"a",@progbits
	.balign	1
	.local	_.str.313
_.str.313:
	.asciz	"ha"

	.section	.rodata._.str.314,"a",@progbits
	.balign	1
	.local	_.str.314
_.str.314:
	.asciz	"hack"

	.section	.rodata._.str.315,"a",@progbits
	.balign	1
	.local	_.str.315
_.str.315:
	.asciz	"handled"

	.section	.rodata._.str.316,"a",@progbits
	.balign	1
	.local	_.str.316
_.str.316:
	.asciz	"happen"

	.section	.rodata._.str.317,"a",@progbits
	.balign	1
	.local	_.str.317
_.str.317:
	.asciz	"happens"

	.section	.rodata._.str.318,"a",@progbits
	.balign	1
	.local	_.str.318
_.str.318:
	.asciz	"hat1"

	.section	.rodata._.str.319,"a",@progbits
	.balign	1
	.local	_.str.319
_.str.319:
	.asciz	"hat2"

	.section	.rodata._.str.320,"a",@progbits
	.balign	1
	.local	_.str.320
_.str.320:
	.asciz	"have"

	.section	.rodata._.str.321,"a",@progbits
	.balign	1
	.local	_.str.321
_.str.321:
	.asciz	"haven"

	.section	.rodata._.str.322,"a",@progbits
	.balign	1
	.local	_.str.322
_.str.322:
	.asciz	"heck"

	.section	.rodata._.str.323,"a",@progbits
	.balign	1
	.local	_.str.323
_.str.323:
	.asciz	"heterogeneous"

	.section	.rodata._.str.324,"a",@progbits
	.balign	1
	.local	_.str.324
_.str.324:
	.asciz	"high"

	.section	.rodata._.str.325,"a",@progbits
	.balign	1
	.local	_.str.325
_.str.325:
	.asciz	"higher"

	.section	.rodata._.str.326,"a",@progbits
	.balign	1
	.local	_.str.326
_.str.326:
	.asciz	"histogram"

	.section	.rodata._.str.327,"a",@progbits
	.balign	1
	.local	_.str.327
_.str.327:
	.asciz	"histograms"

	.section	.rodata._.str.328,"a",@progbits
	.balign	1
	.local	_.str.328
_.str.328:
	.asciz	"hitting"

	.section	.rodata._.str.329,"a",@progbits
	.balign	1
	.local	_.str.329
_.str.329:
	.asciz	"homogeneity"

	.section	.rodata._.str.330,"a",@progbits
	.balign	1
	.local	_.str.330
_.str.330:
	.asciz	"however"

	.section	.rodata._.str.331,"a",@progbits
	.balign	1
	.local	_.str.331
_.str.331:
	.asciz	"hypotheses"

	.section	.rodata._.str.332,"a",@progbits
	.balign	1
	.local	_.str.332
_.str.332:
	.asciz	"hypothesis"

	.section	.rodata._.str.333,"a",@progbits
	.balign	1
	.local	_.str.333
_.str.333:
	.asciz	"identically"

	.section	.rodata._.str.334,"a",@progbits
	.balign	1
	.local	_.str.334
_.str.334:
	.asciz	"identify"

	.section	.rodata._.str.335,"a",@progbits
	.balign	1
	.local	_.str.335
_.str.335:
	.asciz	"identifying"

	.section	.rodata._.str.336,"a",@progbits
	.balign	1
	.local	_.str.336
_.str.336:
	.asciz	"implies"

	.section	.rodata._.str.337,"a",@progbits
	.balign	1
	.local	_.str.337
_.str.337:
	.asciz	"impossible"

	.section	.rodata._.str.338,"a",@progbits
	.balign	1
	.local	_.str.338
_.str.338:
	.asciz	"improvement"

	.section	.rodata._.str.339,"a",@progbits
	.balign	1
	.local	_.str.339
_.str.339:
	.asciz	"include"

	.section	.rodata._.str.340,"a",@progbits
	.balign	1
	.local	_.str.340
_.str.340:
	.asciz	"included"

	.section	.rodata._.str.341,"a",@progbits
	.balign	1
	.local	_.str.341
_.str.341:
	.asciz	"increase"

	.section	.rodata._.str.342,"a",@progbits
	.balign	1
	.local	_.str.342
_.str.342:
	.asciz	"increases"

	.section	.rodata._.str.343,"a",@progbits
	.balign	1
	.local	_.str.343
_.str.343:
	.asciz	"increasing"

	.section	.rodata._.str.344,"a",@progbits
	.balign	1
	.local	_.str.344
_.str.344:
	.asciz	"independence"

	.section	.rodata._.str.345,"a",@progbits
	.balign	1
	.local	_.str.345
_.str.345:
	.asciz	"independent"

	.section	.rodata._.str.346,"a",@progbits
	.balign	1
	.local	_.str.346
_.str.346:
	.asciz	"indicate"

	.section	.rodata._.str.347,"a",@progbits
	.balign	1
	.local	_.str.347
_.str.347:
	.asciz	"individual"

	.section	.rodata._.str.348,"a",@progbits
	.balign	1
	.local	_.str.348
_.str.348:
	.asciz	"individuals"

	.section	.rodata._.str.349,"a",@progbits
	.balign	1
	.local	_.str.349
_.str.349:
	.asciz	"inference"

	.section	.rodata._.str.350,"a",@progbits
	.balign	1
	.local	_.str.350
_.str.350:
	.asciz	"influences"

	.section	.rodata._.str.351,"a",@progbits
	.balign	1
	.local	_.str.351
_.str.351:
	.asciz	"influential"

	.section	.rodata._.str.352,"a",@progbits
	.balign	1
	.local	_.str.352
_.str.352:
	.asciz	"instead"

	.section	.rodata._.str.353,"a",@progbits
	.balign	1
	.local	_.str.353
_.str.353:
	.asciz	"integer"

	.section	.rodata._.str.354,"a",@progbits
	.balign	1
	.local	_.str.354
_.str.354:
	.asciz	"integrity"

	.section	.rodata._.str.355,"a",@progbits
	.balign	1
	.local	_.str.355
_.str.355:
	.asciz	"intercept"

	.section	.rodata._.str.356,"a",@progbits
	.balign	1
	.local	_.str.356
_.str.356:
	.asciz	"interest"

	.section	.rodata._.str.357,"a",@progbits
	.balign	1
	.local	_.str.357
_.str.357:
	.asciz	"interpret"

	.section	.rodata._.str.358,"a",@progbits
	.balign	1
	.local	_.str.358
_.str.358:
	.asciz	"interpretation"

	.section	.rodata._.str.359,"a",@progbits
	.balign	1
	.local	_.str.359
_.str.359:
	.asciz	"interpreting"

	.section	.rodata._.str.360,"a",@progbits
	.balign	1
	.local	_.str.360
_.str.360:
	.asciz	"interval"

	.section	.rodata._.str.361,"a",@progbits
	.balign	1
	.local	_.str.361
_.str.361:
	.asciz	"intervals"

	.section	.rodata._.str.362,"a",@progbits
	.balign	1
	.local	_.str.362
_.str.362:
	.asciz	"interviewer"

	.section	.rodata._.str.363,"a",@progbits
	.balign	1
	.local	_.str.363
_.str.363:
	.asciz	"into"

	.section	.rodata._.str.364,"a",@progbits
	.balign	1
	.local	_.str.364
_.str.364:
	.asciz	"introduces"

	.section	.rodata._.str.365,"a",@progbits
	.balign	1
	.local	_.str.365
_.str.365:
	.asciz	"inverse"

	.section	.rodata._.str.366,"a",@progbits
	.balign	1
	.local	_.str.366
_.str.366:
	.asciz	"investigative"

	.section	.rodata._.str.367,"a",@progbits
	.balign	1
	.local	_.str.367
_.str.367:
	.asciz	"invnorm"

	.section	.rodata._.str.368,"a",@progbits
	.balign	1
	.local	_.str.368
_.str.368:
	.asciz	"invt"

	.section	.rodata._.str.369,"a",@progbits
	.balign	1
	.local	_.str.369
_.str.369:
	.asciz	"just"

	.section	.rodata._.str.370,"a",@progbits
	.balign	1
	.local	_.str.370
_.str.370:
	.asciz	"justification"

	.section	.rodata._.str.371,"a",@progbits
	.balign	1
	.local	_.str.371
_.str.371:
	.asciz	"justify"

	.section	.rodata._.str.372,"a",@progbits
	.balign	1
	.local	_.str.372
_.str.372:
	.asciz	"keep"

	.section	.rodata._.str.373,"a",@progbits
	.balign	1
	.local	_.str.373
_.str.373:
	.asciz	"knowledge"

	.section	.rodata._.str.374,"a",@progbits
	.balign	1
	.local	_.str.374
_.str.374:
	.asciz	"label"

	.section	.rodata._.str.375,"a",@progbits
	.balign	1
	.local	_.str.375
_.str.375:
	.asciz	"labels"

	.section	.rodata._.str.376,"a",@progbits
	.balign	1
	.local	_.str.376
_.str.376:
	.asciz	"language"

	.section	.rodata._.str.377,"a",@progbits
	.balign	1
	.local	_.str.377
_.str.377:
	.asciz	"large"

	.section	.rodata._.str.378,"a",@progbits
	.balign	1
	.local	_.str.378
_.str.378:
	.asciz	"larger"

	.section	.rodata._.str.379,"a",@progbits
	.balign	1
	.local	_.str.379
_.str.379:
	.asciz	"last"

	.section	.rodata._.str.380,"a",@progbits
	.balign	1
	.local	_.str.380
_.str.380:
	.asciz	"later"

	.section	.rodata._.str.381,"a",@progbits
	.balign	1
	.local	_.str.381
_.str.381:
	.asciz	"least"

	.section	.rodata._.str.382,"a",@progbits
	.balign	1
	.local	_.str.382
_.str.382:
	.asciz	"left"

	.section	.rodata._.str.383,"a",@progbits
	.balign	1
	.local	_.str.383
_.str.383:
	.asciz	"length"

	.section	.rodata._.str.384,"a",@progbits
	.balign	1
	.local	_.str.384
_.str.384:
	.asciz	"less"

	.section	.rodata._.str.385,"a",@progbits
	.balign	1
	.local	_.str.385
_.str.385:
	.asciz	"level"

	.section	.rodata._.str.386,"a",@progbits
	.balign	1
	.local	_.str.386
_.str.386:
	.asciz	"levels"

	.section	.rodata._.str.387,"a",@progbits
	.balign	1
	.local	_.str.387
_.str.387:
	.asciz	"like"

	.section	.rodata._.str.388,"a",@progbits
	.balign	1
	.local	_.str.388
_.str.388:
	.asciz	"likely"

	.section	.rodata._.str.389,"a",@progbits
	.balign	1
	.local	_.str.389
_.str.389:
	.asciz	"limit"

	.section	.rodata._.str.390,"a",@progbits
	.balign	1
	.local	_.str.390
_.str.390:
	.asciz	"line"

	.section	.rodata._.str.391,"a",@progbits
	.balign	1
	.local	_.str.391
_.str.391:
	.asciz	"linear"

	.section	.rodata._.str.392,"a",@progbits
	.balign	1
	.local	_.str.392
_.str.392:
	.asciz	"linearity"

	.section	.rodata._.str.393,"a",@progbits
	.balign	1
	.local	_.str.393
_.str.393:
	.asciz	"liner"

	.section	.rodata._.str.394,"a",@progbits
	.balign	1
	.local	_.str.394
_.str.394:
	.asciz	"link"

	.section	.rodata._.str.395,"a",@progbits
	.balign	1
	.local	_.str.395
_.str.395:
	.asciz	"linregttest"

	.section	.rodata._.str.396,"a",@progbits
	.balign	1
	.local	_.str.396
_.str.396:
	.asciz	"list"

	.section	.rodata._.str.397,"a",@progbits
	.balign	1
	.local	_.str.397
_.str.397:
	.asciz	"lists"

	.section	.rodata._.str.398,"a",@progbits
	.balign	1
	.local	_.str.398
_.str.398:
	.asciz	"located"

	.section	.rodata._.str.399,"a",@progbits
	.balign	1
	.local	_.str.399
_.str.399:
	.asciz	"logic"

	.section	.rodata._.str.400,"a",@progbits
	.balign	1
	.local	_.str.400
_.str.400:
	.asciz	"long"

	.section	.rodata._.str.401,"a",@progbits
	.balign	1
	.local	_.str.401
_.str.401:
	.asciz	"look"

	.section	.rodata._.str.402,"a",@progbits
	.balign	1
	.local	_.str.402
_.str.402:
	.asciz	"looking"

	.section	.rodata._.str.403,"a",@progbits
	.balign	1
	.local	_.str.403
_.str.403:
	.asciz	"lower"

	.section	.rodata._.str.404,"a",@progbits
	.balign	1
	.local	_.str.404
_.str.404:
	.asciz	"lsrl"

	.section	.rodata._.str.405,"a",@progbits
	.balign	1
	.local	_.str.405
_.str.405:
	.asciz	"lurking"

	.section	.rodata._.str.406,"a",@progbits
	.balign	1
	.local	_.str.406
_.str.406:
	.asciz	"make"

	.section	.rodata._.str.407,"a",@progbits
	.balign	1
	.local	_.str.407
_.str.407:
	.asciz	"makes"

	.section	.rodata._.str.408,"a",@progbits
	.balign	1
	.local	_.str.408
_.str.408:
	.asciz	"manual"

	.section	.rodata._.str.409,"a",@progbits
	.balign	1
	.local	_.str.409
_.str.409:
	.asciz	"many"

	.section	.rodata._.str.410,"a",@progbits
	.balign	1
	.local	_.str.410
_.str.410:
	.asciz	"margin"

	.section	.rodata._.str.411,"a",@progbits
	.balign	1
	.local	_.str.411
_.str.411:
	.asciz	"master"

	.section	.rodata._.str.412,"a",@progbits
	.balign	1
	.local	_.str.412
_.str.412:
	.asciz	"matched"

	.section	.rodata._.str.413,"a",@progbits
	.balign	1
	.local	_.str.413
_.str.413:
	.asciz	"math"

	.section	.rodata._.str.414,"a",@progbits
	.balign	1
	.local	_.str.414
_.str.414:
	.asciz	"mathematical"

	.section	.rodata._.str.415,"a",@progbits
	.balign	1
	.local	_.str.415
_.str.415:
	.asciz	"matrix"

	.section	.rodata._.str.416,"a",@progbits
	.balign	1
	.local	_.str.416
_.str.416:
	.asciz	"matter"

	.section	.rodata._.str.417,"a",@progbits
	.balign	1
	.local	_.str.417
_.str.417:
	.asciz	"maximum"

	.section	.rodata._.str.418,"a",@progbits
	.balign	1
	.local	_.str.418
_.str.418:
	.asciz	"mean"

	.section	.rodata._.str.419,"a",@progbits
	.balign	1
	.local	_.str.419
_.str.419:
	.asciz	"meaning"

	.section	.rodata._.str.420,"a",@progbits
	.balign	1
	.local	_.str.420
_.str.420:
	.asciz	"means"

	.section	.rodata._.str.421,"a",@progbits
	.balign	1
	.local	_.str.421
_.str.421:
	.asciz	"measure"

	.section	.rodata._.str.422,"a",@progbits
	.balign	1
	.local	_.str.422
_.str.422:
	.asciz	"measurements"

	.section	.rodata._.str.423,"a",@progbits
	.balign	1
	.local	_.str.423
_.str.423:
	.asciz	"measures"

	.section	.rodata._.str.424,"a",@progbits
	.balign	1
	.local	_.str.424
_.str.424:
	.asciz	"mechanics"

	.section	.rodata._.str.425,"a",@progbits
	.balign	1
	.local	_.str.425
_.str.425:
	.asciz	"mechanism"

	.section	.rodata._.str.426,"a",@progbits
	.balign	1
	.local	_.str.426
_.str.426:
	.asciz	"median"

	.section	.rodata._.str.427,"a",@progbits
	.balign	1
	.local	_.str.427
_.str.427:
	.asciz	"members"

	.section	.rodata._.str.428,"a",@progbits
	.balign	1
	.local	_.str.428
_.str.428:
	.asciz	"memory"

	.section	.rodata._.str.429,"a",@progbits
	.balign	1
	.local	_.str.429
_.str.429:
	.asciz	"method"

	.section	.rodata._.str.430,"a",@progbits
	.balign	1
	.local	_.str.430
_.str.430:
	.asciz	"misinterpreting"

	.section	.rodata._.str.431,"a",@progbits
	.balign	1
	.local	_.str.431
_.str.431:
	.asciz	"mnemonic"

	.section	.rodata._.str.432,"a",@progbits
	.balign	1
	.local	_.str.432
_.str.432:
	.asciz	"model"

	.section	.rodata._.str.433,"a",@progbits
	.balign	1
	.local	_.str.433
_.str.433:
	.asciz	"modern"

	.section	.rodata._.str.434,"a",@progbits
	.balign	1
	.local	_.str.434
_.str.434:
	.asciz	"modified"

	.section	.rodata._.str.435,"a",@progbits
	.balign	1
	.local	_.str.435
_.str.435:
	.asciz	"more"

	.section	.rodata._.str.436,"a",@progbits
	.balign	1
	.local	_.str.436
_.str.436:
	.asciz	"most"

	.section	.rodata._.str.437,"a",@progbits
	.balign	1
	.local	_.str.437
_.str.437:
	.asciz	"move"

	.section	.rodata._.str.438,"a",@progbits
	.balign	1
	.local	_.str.438
_.str.438:
	.asciz	"mu_0"

	.section	.rodata._.str.439,"a",@progbits
	.balign	1
	.local	_.str.439
_.str.439:
	.asciz	"mu_x"

	.section	.rodata._.str.440,"a",@progbits
	.balign	1
	.local	_.str.440
_.str.440:
	.asciz	"mu_y"

	.section	.rodata._.str.441,"a",@progbits
	.balign	1
	.local	_.str.441
_.str.441:
	.asciz	"much"

	.section	.rodata._.str.442,"a",@progbits
	.balign	1
	.local	_.str.442
_.str.442:
	.asciz	"multiple"

	.section	.rodata._.str.443,"a",@progbits
	.balign	1
	.local	_.str.443
_.str.443:
	.asciz	"multiplication"

	.section	.rodata._.str.444,"a",@progbits
	.balign	1
	.local	_.str.444
_.str.444:
	.asciz	"multiplied"

	.section	.rodata._.str.445,"a",@progbits
	.balign	1
	.local	_.str.445
_.str.445:
	.asciz	"multiply"

	.section	.rodata._.str.446,"a",@progbits
	.balign	1
	.local	_.str.446
_.str.446:
	.asciz	"must"

	.section	.rodata._.str.447,"a",@progbits
	.balign	1
	.local	_.str.447
_.str.447:
	.asciz	"mutually"

	.section	.rodata._.str.448,"a",@progbits
	.balign	1
	.local	_.str.448
_.str.448:
	.asciz	"nalyze"

	.section	.rodata._.str.449,"a",@progbits
	.balign	1
	.local	_.str.449
_.str.449:
	.asciz	"name"

	.section	.rodata._.str.450,"a",@progbits
	.balign	1
	.local	_.str.450
_.str.450:
	.asciz	"names"

	.section	.rodata._.str.451,"a",@progbits
	.balign	1
	.local	_.str.451
_.str.451:
	.asciz	"narrower"

	.section	.rodata._.str.452,"a",@progbits
	.balign	1
	.local	_.str.452
_.str.452:
	.asciz	"needed"

	.section	.rodata._.str.453,"a",@progbits
	.balign	1
	.local	_.str.453
_.str.453:
	.asciz	"negative"

	.section	.rodata._.str.454,"a",@progbits
	.balign	1
	.local	_.str.454
_.str.454:
	.asciz	"normal"

	.section	.rodata._.str.455,"a",@progbits
	.balign	1
	.local	_.str.455
_.str.455:
	.asciz	"normality"

	.section	.rodata._.str.456,"a",@progbits
	.balign	1
	.local	_.str.456
_.str.456:
	.asciz	"normalizing"

	.section	.rodata._.str.457,"a",@progbits
	.balign	1
	.local	_.str.457
_.str.457:
	.asciz	"note"

	.section	.rodata._.str.458,"a",@progbits
	.balign	1
	.local	_.str.458
_.str.458:
	.asciz	"nothing"

	.section	.rodata._.str.459,"a",@progbits
	.balign	1
	.local	_.str.459
_.str.459:
	.asciz	"noticeably"

	.section	.rodata._.str.460,"a",@progbits
	.balign	1
	.local	_.str.460
_.str.460:
	.asciz	"null"

	.section	.rodata._.str.461,"a",@progbits
	.balign	1
	.local	_.str.461
_.str.461:
	.asciz	"number"

	.section	.rodata._.str.462,"a",@progbits
	.balign	1
	.local	_.str.462
_.str.462:
	.asciz	"numbers"

	.section	.rodata._.str.463,"a",@progbits
	.balign	1
	.local	_.str.463
_.str.463:
	.asciz	"numerical"

	.section	.rodata._.str.464,"a",@progbits
	.balign	1
	.local	_.str.464
_.str.464:
	.asciz	"observed"

	.section	.rodata._.str.465,"a",@progbits
	.balign	1
	.local	_.str.465
_.str.465:
	.asciz	"obtain"

	.section	.rodata._.str.466,"a",@progbits
	.balign	1
	.local	_.str.466
_.str.466:
	.asciz	"obtaining"

	.section	.rodata._.str.467,"a",@progbits
	.balign	1
	.local	_.str.467
_.str.467:
	.asciz	"occur"

	.section	.rodata._.str.468,"a",@progbits
	.balign	1
	.local	_.str.468
_.str.468:
	.asciz	"occurred"

	.section	.rodata._.str.469,"a",@progbits
	.balign	1
	.local	_.str.469
_.str.469:
	.asciz	"occurring"

	.section	.rodata._.str.470,"a",@progbits
	.balign	1
	.local	_.str.470
_.str.470:
	.asciz	"often"

	.section	.rodata._.str.471,"a",@progbits
	.balign	1
	.local	_.str.471
_.str.471:
	.asciz	"other"

	.section	.rodata._.str.472,"a",@progbits
	.balign	1
	.local	_.str.472
_.str.472:
	.asciz	"others"

	.section	.rodata._.str.473,"a",@progbits
	.balign	1
	.local	_.str.473
_.str.473:
	.asciz	"ours"

	.section	.rodata._.str.474,"a",@progbits
	.balign	1
	.local	_.str.474
_.str.474:
	.asciz	"outcome"

	.section	.rodata._.str.475,"a",@progbits
	.balign	1
	.local	_.str.475
_.str.475:
	.asciz	"outcomes"

	.section	.rodata._.str.476,"a",@progbits
	.balign	1
	.local	_.str.476
_.str.476:
	.asciz	"outlier"

	.section	.rodata._.str.477,"a",@progbits
	.balign	1
	.local	_.str.477
_.str.477:
	.asciz	"outliers"

	.section	.rodata._.str.478,"a",@progbits
	.balign	1
	.local	_.str.478
_.str.478:
	.asciz	"output"

	.section	.rodata._.str.479,"a",@progbits
	.balign	1
	.local	_.str.479
_.str.479:
	.asciz	"outside"

	.section	.rodata._.str.480,"a",@progbits
	.balign	1
	.local	_.str.480
_.str.480:
	.asciz	"over"

	.section	.rodata._.str.481,"a",@progbits
	.balign	1
	.local	_.str.481
_.str.481:
	.asciz	"overlapping"

	.section	.rodata._.str.482,"a",@progbits
	.balign	1
	.local	_.str.482
_.str.482:
	.asciz	"p"

	.section	.rodata._.str.483,"a",@progbits
	.balign	1
	.local	_.str.483
_.str.483:
	.asciz	"pairs"

	.section	.rodata._.str.484,"a",@progbits
	.balign	1
	.local	_.str.484
_.str.484:
	.asciz	"panic"

	.section	.rodata._.str.485,"a",@progbits
	.balign	1
	.local	_.str.485
_.str.485:
	.asciz	"paper"

	.section	.rodata._.str.486,"a",@progbits
	.balign	1
	.local	_.str.486
_.str.486:
	.asciz	"paragraph"

	.section	.rodata._.str.487,"a",@progbits
	.balign	1
	.local	_.str.487
_.str.487:
	.asciz	"parameter"

	.section	.rodata._.str.488,"a",@progbits
	.balign	1
	.local	_.str.488
_.str.488:
	.asciz	"parameters"

	.section	.rodata._.str.489,"a",@progbits
	.balign	1
	.local	_.str.489
_.str.489:
	.asciz	"part"

	.section	.rodata._.str.490,"a",@progbits
	.balign	1
	.local	_.str.490
_.str.490:
	.asciz	"partial"

	.section	.rodata._.str.491,"a",@progbits
	.balign	1
	.local	_.str.491
_.str.491:
	.asciz	"participate"

	.section	.rodata._.str.492,"a",@progbits
	.balign	1
	.local	_.str.492
_.str.492:
	.asciz	"parts"

	.section	.rodata._.str.493,"a",@progbits
	.balign	1
	.local	_.str.493
_.str.493:
	.asciz	"path"

	.section	.rodata._.str.494,"a",@progbits
	.balign	1
	.local	_.str.494
_.str.494:
	.asciz	"pattern"

	.section	.rodata._.str.495,"a",@progbits
	.balign	1
	.local	_.str.495
_.str.495:
	.asciz	"people"

	.section	.rodata._.str.496,"a",@progbits
	.balign	1
	.local	_.str.496
_.str.496:
	.asciz	"percent"

	.section	.rodata._.str.497,"a",@progbits
	.balign	1
	.local	_.str.497
_.str.497:
	.asciz	"percentile"

	.section	.rodata._.str.498,"a",@progbits
	.balign	1
	.local	_.str.498
_.str.498:
	.asciz	"perfectly"

	.section	.rodata._.str.499,"a",@progbits
	.balign	1
	.local	_.str.499
_.str.499:
	.asciz	"perform"

	.section	.rodata._.str.500,"a",@progbits
	.balign	1
	.local	_.str.500
_.str.500:
	.asciz	"person"

	.section	.rodata._.str.501,"a",@progbits
	.balign	1
	.local	_.str.501
_.str.501:
	.asciz	"phantoms"

	.section	.rodata._.str.502,"a",@progbits
	.balign	1
	.local	_.str.502
_.str.502:
	.asciz	"phenomenon"

	.section	.rodata._.str.503,"a",@progbits
	.balign	1
	.local	_.str.503
_.str.503:
	.asciz	"physical"

	.section	.rodata._.str.504,"a",@progbits
	.balign	1
	.local	_.str.504
_.str.504:
	.asciz	"place"

	.section	.rodata._.str.505,"a",@progbits
	.balign	1
	.local	_.str.505
_.str.505:
	.asciz	"placebo"

	.section	.rodata._.str.506,"a",@progbits
	.balign	1
	.local	_.str.506
_.str.506:
	.asciz	"plot"

	.section	.rodata._.str.507,"a",@progbits
	.balign	1
	.local	_.str.507
_.str.507:
	.asciz	"point"

	.section	.rodata._.str.508,"a",@progbits
	.balign	1
	.local	_.str.508
_.str.508:
	.asciz	"pool"

	.section	.rodata._.str.509,"a",@progbits
	.balign	1
	.local	_.str.509
_.str.509:
	.asciz	"pooled"

	.section	.rodata._.str.510,"a",@progbits
	.balign	1
	.local	_.str.510
_.str.510:
	.asciz	"pooling"

	.section	.rodata._.str.511,"a",@progbits
	.balign	1
	.local	_.str.511
_.str.511:
	.asciz	"population"

	.section	.rodata._.str.512,"a",@progbits
	.balign	1
	.local	_.str.512
_.str.512:
	.asciz	"populations"

	.section	.rodata._.str.513,"a",@progbits
	.balign	1
	.local	_.str.513
_.str.513:
	.asciz	"positive"

	.section	.rodata._.str.514,"a",@progbits
	.balign	1
	.local	_.str.514
_.str.514:
	.asciz	"possible"

	.section	.rodata._.str.515,"a",@progbits
	.balign	1
	.local	_.str.515
_.str.515:
	.asciz	"power"

	.section	.rodata._.str.516,"a",@progbits
	.balign	1
	.local	_.str.516
_.str.516:
	.asciz	"practical"

	.section	.rodata._.str.517,"a",@progbits
	.balign	1
	.local	_.str.517
_.str.517:
	.asciz	"precise"

	.section	.rodata._.str.518,"a",@progbits
	.balign	1
	.local	_.str.518
_.str.518:
	.asciz	"precision"

	.section	.rodata._.str.519,"a",@progbits
	.balign	1
	.local	_.str.519
_.str.519:
	.asciz	"predict"

	.section	.rodata._.str.520,"a",@progbits
	.balign	1
	.local	_.str.520
_.str.520:
	.asciz	"predictable"

	.section	.rodata._.str.521,"a",@progbits
	.balign	1
	.local	_.str.521
_.str.521:
	.asciz	"predicted"

	.section	.rodata._.str.522,"a",@progbits
	.balign	1
	.local	_.str.522
_.str.522:
	.asciz	"predicting"

	.section	.rodata._.str.523,"a",@progbits
	.balign	1
	.local	_.str.523
_.str.523:
	.asciz	"prediction"

	.section	.rodata._.str.524,"a",@progbits
	.balign	1
	.local	_.str.524
_.str.524:
	.asciz	"predictive"

	.section	.rodata._.str.525,"a",@progbits
	.balign	1
	.local	_.str.525
_.str.525:
	.asciz	"prob_1"

	.section	.rodata._.str.526,"a",@progbits
	.balign	1
	.local	_.str.526
_.str.526:
	.asciz	"prob_2"

	.section	.rodata._.str.527,"a",@progbits
	.balign	1
	.local	_.str.527
_.str.527:
	.asciz	"prob_n"

	.section	.rodata._.str.528,"a",@progbits
	.balign	1
	.local	_.str.528
_.str.528:
	.asciz	"probabilistic"

	.section	.rodata._.str.529,"a",@progbits
	.balign	1
	.local	_.str.529
_.str.529:
	.asciz	"probabilities"

	.section	.rodata._.str.530,"a",@progbits
	.balign	1
	.local	_.str.530
_.str.530:
	.asciz	"probability"

	.section	.rodata._.str.531,"a",@progbits
	.balign	1
	.local	_.str.531
_.str.531:
	.asciz	"problem"

	.section	.rodata._.str.532,"a",@progbits
	.balign	1
	.local	_.str.532
_.str.532:
	.asciz	"procedure"

	.section	.rodata._.str.533,"a",@progbits
	.balign	1
	.local	_.str.533
_.str.533:
	.asciz	"process"

	.section	.rodata._.str.534,"a",@progbits
	.balign	1
	.local	_.str.534
_.str.534:
	.asciz	"program"

	.section	.rodata._.str.535,"a",@progbits
	.balign	1
	.local	_.str.535
_.str.535:
	.asciz	"prompt"

	.section	.rodata._.str.536,"a",@progbits
	.balign	1
	.local	_.str.536
_.str.536:
	.asciz	"proportion"

	.section	.rodata._.str.537,"a",@progbits
	.balign	1
	.local	_.str.537
_.str.537:
	.asciz	"proportions"

	.section	.rodata._.str.538,"a",@progbits
	.balign	1
	.local	_.str.538
_.str.538:
	.asciz	"prove"

	.section	.rodata._.str.539,"a",@progbits
	.balign	1
	.local	_.str.539
_.str.539:
	.asciz	"provide"

	.section	.rodata._.str.540,"a",@progbits
	.balign	1
	.local	_.str.540
_.str.540:
	.asciz	"provided"

	.section	.rodata._.str.541,"a",@progbits
	.balign	1
	.local	_.str.541
_.str.541:
	.asciz	"purpose"

	.section	.rodata._.str.542,"a",@progbits
	.balign	1
	.local	_.str.542
_.str.542:
	.asciz	"quantitative"

	.section	.rodata._.str.543,"a",@progbits
	.balign	1
	.local	_.str.543
_.str.543:
	.asciz	"question"

	.section	.rodata._.str.544,"a",@progbits
	.balign	1
	.local	_.str.544
_.str.544:
	.asciz	"random"

	.section	.rodata._.str.545,"a",@progbits
	.balign	1
	.local	_.str.545
_.str.545:
	.asciz	"randomize"

	.section	.rodata._.str.546,"a",@progbits
	.balign	1
	.local	_.str.546
_.str.546:
	.asciz	"randomly"

	.section	.rodata._.str.547,"a",@progbits
	.balign	1
	.local	_.str.547
_.str.547:
	.asciz	"range"

	.section	.rodata._.str.548,"a",@progbits
	.balign	1
	.local	_.str.548
_.str.548:
	.asciz	"rarely"

	.section	.rodata._.str.549,"a",@progbits
	.balign	1
	.local	_.str.549
_.str.549:
	.asciz	"reached"

	.section	.rodata._.str.550,"a",@progbits
	.balign	1
	.local	_.str.550
_.str.550:
	.asciz	"readers"

	.section	.rodata._.str.551,"a",@progbits
	.balign	1
	.local	_.str.551
_.str.551:
	.asciz	"reading"

	.section	.rodata._.str.552,"a",@progbits
	.balign	1
	.local	_.str.552
_.str.552:
	.asciz	"real"

	.section	.rodata._.str.553,"a",@progbits
	.balign	1
	.local	_.str.553
_.str.553:
	.asciz	"reality"

	.section	.rodata._.str.554,"a",@progbits
	.balign	1
	.local	_.str.554
_.str.554:
	.asciz	"recommend"

	.section	.rodata._.str.555,"a",@progbits
	.balign	1
	.local	_.str.555
_.str.555:
	.asciz	"reduce"

	.section	.rodata._.str.556,"a",@progbits
	.balign	1
	.local	_.str.556
_.str.556:
	.asciz	"reduces"

	.section	.rodata._.str.557,"a",@progbits
	.balign	1
	.local	_.str.557
_.str.557:
	.asciz	"reducing"

	.section	.rodata._.str.558,"a",@progbits
	.balign	1
	.local	_.str.558
_.str.558:
	.asciz	"refuse"

	.section	.rodata._.str.559,"a",@progbits
	.balign	1
	.local	_.str.559
_.str.559:
	.asciz	"regardless"

	.section	.rodata._.str.560,"a",@progbits
	.balign	1
	.local	_.str.560
_.str.560:
	.asciz	"regression"

	.section	.rodata._.str.561,"a",@progbits
	.balign	1
	.local	_.str.561
_.str.561:
	.asciz	"reject"

	.section	.rodata._.str.562,"a",@progbits
	.balign	1
	.local	_.str.562
_.str.562:
	.asciz	"rejecting"

	.section	.rodata._.str.563,"a",@progbits
	.balign	1
	.local	_.str.563
_.str.563:
	.asciz	"relate"

	.section	.rodata._.str.564,"a",@progbits
	.balign	1
	.local	_.str.564
_.str.564:
	.asciz	"relating"

	.section	.rodata._.str.565,"a",@progbits
	.balign	1
	.local	_.str.565
_.str.565:
	.asciz	"relationship"

	.section	.rodata._.str.566,"a",@progbits
	.balign	1
	.local	_.str.566
_.str.566:
	.asciz	"relative"

	.section	.rodata._.str.567,"a",@progbits
	.balign	1
	.local	_.str.567
_.str.567:
	.asciz	"relevant"

	.section	.rodata._.str.568,"a",@progbits
	.balign	1
	.local	_.str.568
_.str.568:
	.asciz	"remaining"

	.section	.rodata._.str.569,"a",@progbits
	.balign	1
	.local	_.str.569
_.str.569:
	.asciz	"remains"

	.section	.rodata._.str.570,"a",@progbits
	.balign	1
	.local	_.str.570
_.str.570:
	.asciz	"removed"

	.section	.rodata._.str.571,"a",@progbits
	.balign	1
	.local	_.str.571
_.str.571:
	.asciz	"repeats"

	.section	.rodata._.str.572,"a",@progbits
	.balign	1
	.local	_.str.572
_.str.572:
	.asciz	"replacement"

	.section	.rodata._.str.573,"a",@progbits
	.balign	1
	.local	_.str.573
_.str.573:
	.asciz	"replication"

	.section	.rodata._.str.574,"a",@progbits
	.balign	1
	.local	_.str.574
_.str.574:
	.asciz	"represent"

	.section	.rodata._.str.575,"a",@progbits
	.balign	1
	.local	_.str.575
_.str.575:
	.asciz	"required"

	.section	.rodata._.str.576,"a",@progbits
	.balign	1
	.local	_.str.576
_.str.576:
	.asciz	"residual"

	.section	.rodata._.str.577,"a",@progbits
	.balign	1
	.local	_.str.577
_.str.577:
	.asciz	"residuals"

	.section	.rodata._.str.578,"a",@progbits
	.balign	1
	.local	_.str.578
_.str.578:
	.asciz	"resistant"

	.section	.rodata._.str.579,"a",@progbits
	.balign	1
	.local	_.str.579
_.str.579:
	.asciz	"response"

	.section	.rodata._.str.580,"a",@progbits
	.balign	1
	.local	_.str.580
_.str.580:
	.asciz	"result"

	.section	.rodata._.str.581,"a",@progbits
	.balign	1
	.local	_.str.581
_.str.581:
	.asciz	"results"

	.section	.rodata._.str.582,"a",@progbits
	.balign	1
	.local	_.str.582
_.str.582:
	.asciz	"right"

	.section	.rodata._.str.583,"a",@progbits
	.balign	1
	.local	_.str.583
_.str.583:
	.asciz	"robustness"

	.section	.rodata._.str.584,"a",@progbits
	.balign	1
	.local	_.str.584
_.str.584:
	.asciz	"roughly"

	.section	.rodata._.str.585,"a",@progbits
	.balign	1
	.local	_.str.585
_.str.585:
	.asciz	"rows"

	.section	.rodata._.str.586,"a",@progbits
	.balign	1
	.local	_.str.586
_.str.586:
	.asciz	"rule"

	.section	.rodata._.str.587,"a",@progbits
	.balign	1
	.local	_.str.587
_.str.587:
	.asciz	"rules"

	.section	.rodata._.str.588,"a",@progbits
	.balign	1
	.local	_.str.588
_.str.588:
	.asciz	"same"

	.section	.rodata._.str.589,"a",@progbits
	.balign	1
	.local	_.str.589
_.str.589:
	.asciz	"sample"

	.section	.rodata._.str.590,"a",@progbits
	.balign	1
	.local	_.str.590
_.str.590:
	.asciz	"samples"

	.section	.rodata._.str.591,"a",@progbits
	.balign	1
	.local	_.str.591
_.str.591:
	.asciz	"sampling"

	.section	.rodata._.str.592,"a",@progbits
	.balign	1
	.local	_.str.592
_.str.592:
	.asciz	"saying"

	.section	.rodata._.str.593,"a",@progbits
	.balign	1
	.local	_.str.593
_.str.593:
	.asciz	"scales"

	.section	.rodata._.str.594,"a",@progbits
	.balign	1
	.local	_.str.594
_.str.594:
	.asciz	"scatterplot"

	.section	.rodata._.str.595,"a",@progbits
	.balign	1
	.local	_.str.595
_.str.595:
	.asciz	"scope"

	.section	.rodata._.str.596,"a",@progbits
	.balign	1
	.local	_.str.596
_.str.596:
	.asciz	"score"

	.section	.rodata._.str.597,"a",@progbits
	.balign	1
	.local	_.str.597
_.str.597:
	.asciz	"scores"

	.section	.rodata._.str.598,"a",@progbits
	.balign	1
	.local	_.str.598
_.str.598:
	.asciz	"scoring"

	.section	.rodata._.str.599,"a",@progbits
	.balign	1
	.local	_.str.599
_.str.599:
	.asciz	"sd"

	.section	.rodata._.str.600,"a",@progbits
	.balign	1
	.local	_.str.600
_.str.600:
	.asciz	"se_b"

	.section	.rodata._.str.601,"a",@progbits
	.balign	1
	.local	_.str.601
_.str.601:
	.asciz	"sections"

	.section	.rodata._.str.602,"a",@progbits
	.balign	1
	.local	_.str.602
_.str.602:
	.asciz	"seed"

	.section	.rodata._.str.603,"a",@progbits
	.balign	1
	.local	_.str.603
_.str.603:
	.asciz	"seen"

	.section	.rodata._.str.604,"a",@progbits
	.balign	1
	.local	_.str.604
_.str.604:
	.asciz	"select"

	.section	.rodata._.str.605,"a",@progbits
	.balign	1
	.local	_.str.605
_.str.605:
	.asciz	"selected"

	.section	.rodata._.str.606,"a",@progbits
	.balign	1
	.local	_.str.606
_.str.606:
	.asciz	"selecting"

	.section	.rodata._.str.607,"a",@progbits
	.balign	1
	.local	_.str.607
_.str.607:
	.asciz	"selection"

	.section	.rodata._.str.608,"a",@progbits
	.balign	1
	.local	_.str.608
_.str.608:
	.asciz	"sense"

	.section	.rodata._.str.609,"a",@progbits
	.balign	1
	.local	_.str.609
_.str.609:
	.asciz	"sentence"

	.section	.rodata._.str.610,"a",@progbits
	.balign	1
	.local	_.str.610
_.str.610:
	.asciz	"sequence"

	.section	.rodata._.str.611,"a",@progbits
	.balign	1
	.local	_.str.611
_.str.611:
	.asciz	"setting"

	.section	.rodata._.str.612,"a",@progbits
	.balign	1
	.local	_.str.612
_.str.612:
	.asciz	"setup"

	.section	.rodata._.str.613,"a",@progbits
	.balign	1
	.local	_.str.613
_.str.613:
	.asciz	"shading"

	.section	.rodata._.str.614,"a",@progbits
	.balign	1
	.local	_.str.614
_.str.614:
	.asciz	"shape"

	.section	.rodata._.str.615,"a",@progbits
	.balign	1
	.local	_.str.615
_.str.615:
	.asciz	"short"

	.section	.rodata._.str.616,"a",@progbits
	.balign	1
	.local	_.str.616
_.str.616:
	.asciz	"should"

	.section	.rodata._.str.617,"a",@progbits
	.balign	1
	.local	_.str.617
_.str.617:
	.asciz	"show"

	.section	.rodata._.str.618,"a",@progbits
	.balign	1
	.local	_.str.618
_.str.618:
	.asciz	"showing"

	.section	.rodata._.str.619,"a",@progbits
	.balign	1
	.local	_.str.619
_.str.619:
	.asciz	"shown"

	.section	.rodata._.str.620,"a",@progbits
	.balign	1
	.local	_.str.620
_.str.620:
	.asciz	"shows"

	.section	.rodata._.str.621,"a",@progbits
	.balign	1
	.local	_.str.621
_.str.621:
	.asciz	"side"

	.section	.rodata._.str.622,"a",@progbits
	.balign	1
	.local	_.str.622
_.str.622:
	.asciz	"sided"

	.section	.rodata._.str.623,"a",@progbits
	.balign	1
	.local	_.str.623
_.str.623:
	.asciz	"sigma"

	.section	.rodata._.str.624,"a",@progbits
	.balign	1
	.local	_.str.624
_.str.624:
	.asciz	"sigma1"

	.section	.rodata._.str.625,"a",@progbits
	.balign	1
	.local	_.str.625
_.str.625:
	.asciz	"sigma2"

	.section	.rodata._.str.626,"a",@progbits
	.balign	1
	.local	_.str.626
_.str.626:
	.asciz	"sigma_x"

	.section	.rodata._.str.627,"a",@progbits
	.balign	1
	.local	_.str.627
_.str.627:
	.asciz	"sigma_y"

	.section	.rodata._.str.628,"a",@progbits
	.balign	1
	.local	_.str.628
_.str.628:
	.asciz	"significance"

	.section	.rodata._.str.629,"a",@progbits
	.balign	1
	.local	_.str.629
_.str.629:
	.asciz	"significant"

	.section	.rodata._.str.630,"a",@progbits
	.balign	1
	.local	_.str.630
_.str.630:
	.asciz	"significantly"

	.section	.rodata._.str.631,"a",@progbits
	.balign	1
	.local	_.str.631
_.str.631:
	.asciz	"similar"

	.section	.rodata._.str.632,"a",@progbits
	.balign	1
	.local	_.str.632
_.str.632:
	.asciz	"similarities"

	.section	.rodata._.str.633,"a",@progbits
	.balign	1
	.local	_.str.633
_.str.633:
	.asciz	"simple"

	.section	.rodata._.str.634,"a",@progbits
	.balign	1
	.local	_.str.634
_.str.634:
	.asciz	"simply"

	.section	.rodata._.str.635,"a",@progbits
	.balign	1
	.local	_.str.635
_.str.635:
	.asciz	"simulation"

	.section	.rodata._.str.636,"a",@progbits
	.balign	1
	.local	_.str.636
_.str.636:
	.asciz	"simulations"

	.section	.rodata._.str.637,"a",@progbits
	.balign	1
	.local	_.str.637
_.str.637:
	.asciz	"since"

	.section	.rodata._.str.638,"a",@progbits
	.balign	1
	.local	_.str.638
_.str.638:
	.asciz	"single"

	.section	.rodata._.str.639,"a",@progbits
	.balign	1
	.local	_.str.639
_.str.639:
	.asciz	"size"

	.section	.rodata._.str.640,"a",@progbits
	.balign	1
	.local	_.str.640
_.str.640:
	.asciz	"sized"

	.section	.rodata._.str.641,"a",@progbits
	.balign	1
	.local	_.str.641
_.str.641:
	.asciz	"sizes"

	.section	.rodata._.str.642,"a",@progbits
	.balign	1
	.local	_.str.642
_.str.642:
	.asciz	"skew"

	.section	.rodata._.str.643,"a",@progbits
	.balign	1
	.local	_.str.643
_.str.643:
	.asciz	"skewed"

	.section	.rodata._.str.644,"a",@progbits
	.balign	1
	.local	_.str.644
_.str.644:
	.asciz	"skip"

	.section	.rodata._.str.645,"a",@progbits
	.balign	1
	.local	_.str.645
_.str.645:
	.asciz	"skipping"

	.section	.rodata._.str.646,"a",@progbits
	.balign	1
	.local	_.str.646
_.str.646:
	.asciz	"slips"

	.section	.rodata._.str.647,"a",@progbits
	.balign	1
	.local	_.str.647
_.str.647:
	.asciz	"slope"

	.section	.rodata._.str.648,"a",@progbits
	.balign	1
	.local	_.str.648
_.str.648:
	.asciz	"small"

	.section	.rodata._.str.649,"a",@progbits
	.balign	1
	.local	_.str.649
_.str.649:
	.asciz	"smallest"

	.section	.rodata._.str.650,"a",@progbits
	.balign	1
	.local	_.str.650
_.str.650:
	.asciz	"socs"

	.section	.rodata._.str.651,"a",@progbits
	.balign	1
	.local	_.str.651
_.str.651:
	.asciz	"some"

	.section	.rodata._.str.652,"a",@progbits
	.balign	1
	.local	_.str.652
_.str.652:
	.asciz	"someone"

	.section	.rodata._.str.653,"a",@progbits
	.balign	1
	.local	_.str.653
_.str.653:
	.asciz	"something"

	.section	.rodata._.str.654,"a",@progbits
	.balign	1
	.local	_.str.654
_.str.654:
	.asciz	"sort"

	.section	.rodata._.str.655,"a",@progbits
	.balign	1
	.local	_.str.655
_.str.655:
	.asciz	"specific"

	.section	.rodata._.str.656,"a",@progbits
	.balign	1
	.local	_.str.656
_.str.656:
	.asciz	"specifically"

	.section	.rodata._.str.657,"a",@progbits
	.balign	1
	.local	_.str.657
_.str.657:
	.asciz	"specified"

	.section	.rodata._.str.658,"a",@progbits
	.balign	1
	.local	_.str.658
_.str.658:
	.asciz	"speed"

	.section	.rodata._.str.659,"a",@progbits
	.balign	1
	.local	_.str.659
_.str.659:
	.asciz	"splitting"

	.section	.rodata._.str.660,"a",@progbits
	.balign	1
	.local	_.str.660
_.str.660:
	.asciz	"spread"

	.section	.rodata._.str.661,"a",@progbits
	.balign	1
	.local	_.str.661
_.str.661:
	.asciz	"sqrt"

	.section	.rodata._.str.662,"a",@progbits
	.balign	1
	.local	_.str.662
_.str.662:
	.asciz	"square"

	.section	.rodata._.str.663,"a",@progbits
	.balign	1
	.local	_.str.663
_.str.663:
	.asciz	"stakes"

	.section	.rodata._.str.664,"a",@progbits
	.balign	1
	.local	_.str.664
_.str.664:
	.asciz	"standard"

	.section	.rodata._.str.665,"a",@progbits
	.balign	1
	.local	_.str.665
_.str.665:
	.asciz	"standardize"

	.section	.rodata._.str.666,"a",@progbits
	.balign	1
	.local	_.str.666
_.str.666:
	.asciz	"standardizing"

	.section	.rodata._.str.667,"a",@progbits
	.balign	1
	.local	_.str.667
_.str.667:
	.asciz	"star"

	.section	.rodata._.str.668,"a",@progbits
	.balign	1
	.local	_.str.668
_.str.668:
	.asciz	"starting"

	.section	.rodata._.str.669,"a",@progbits
	.balign	1
	.local	_.str.669
_.str.669:
	.asciz	"stat"

	.section	.rodata._.str.670,"a",@progbits
	.balign	1
	.local	_.str.670
_.str.670:
	.asciz	"state"

	.section	.rodata._.str.671,"a",@progbits
	.balign	1
	.local	_.str.671
_.str.671:
	.asciz	"statement"

	.section	.rodata._.str.672,"a",@progbits
	.balign	1
	.local	_.str.672
_.str.672:
	.asciz	"stating"

	.section	.rodata._.str.673,"a",@progbits
	.balign	1
	.local	_.str.673
_.str.673:
	.asciz	"statistic"

	.section	.rodata._.str.674,"a",@progbits
	.balign	1
	.local	_.str.674
_.str.674:
	.asciz	"statistical"

	.section	.rodata._.str.675,"a",@progbits
	.balign	1
	.local	_.str.675
_.str.675:
	.asciz	"statistically"

	.section	.rodata._.str.676,"a",@progbits
	.balign	1
	.local	_.str.676
_.str.676:
	.asciz	"statistics"

	.section	.rodata._.str.677,"a",@progbits
	.balign	1
	.local	_.str.677
_.str.677:
	.asciz	"stats"

	.section	.rodata._.str.678,"a",@progbits
	.balign	1
	.local	_.str.678
_.str.678:
	.asciz	"stemplot"

	.section	.rodata._.str.679,"a",@progbits
	.balign	1
	.local	_.str.679
_.str.679:
	.asciz	"step"

	.section	.rodata._.str.680,"a",@progbits
	.balign	1
	.local	_.str.680
_.str.680:
	.asciz	"steps"

	.section	.rodata._.str.681,"a",@progbits
	.balign	1
	.local	_.str.681
_.str.681:
	.asciz	"still"

	.section	.rodata._.str.682,"a",@progbits
	.balign	1
	.local	_.str.682
_.str.682:
	.asciz	"store"

	.section	.rodata._.str.683,"a",@progbits
	.balign	1
	.local	_.str.683
_.str.683:
	.asciz	"stores"

	.section	.rodata._.str.684,"a",@progbits
	.balign	1
	.local	_.str.684
_.str.684:
	.asciz	"strata"

	.section	.rodata._.str.685,"a",@progbits
	.balign	1
	.local	_.str.685
_.str.685:
	.asciz	"strategy"

	.section	.rodata._.str.686,"a",@progbits
	.balign	1
	.local	_.str.686
_.str.686:
	.asciz	"stratified"

	.section	.rodata._.str.687,"a",@progbits
	.balign	1
	.local	_.str.687
_.str.687:
	.asciz	"strength"

	.section	.rodata._.str.688,"a",@progbits
	.balign	1
	.local	_.str.688
_.str.688:
	.asciz	"string"

	.section	.rodata._.str.689,"a",@progbits
	.balign	1
	.local	_.str.689
_.str.689:
	.asciz	"strong"

	.section	.rodata._.str.690,"a",@progbits
	.balign	1
	.local	_.str.690
_.str.690:
	.asciz	"strongly"

	.section	.rodata._.str.691,"a",@progbits
	.balign	1
	.local	_.str.691
_.str.691:
	.asciz	"students"

	.section	.rodata._.str.692,"a",@progbits
	.balign	1
	.local	_.str.692
_.str.692:
	.asciz	"studied"

	.section	.rodata._.str.693,"a",@progbits
	.balign	1
	.local	_.str.693
_.str.693:
	.asciz	"study"

	.section	.rodata._.str.694,"a",@progbits
	.balign	1
	.local	_.str.694
_.str.694:
	.asciz	"subjects"

	.section	.rodata._.str.695,"a",@progbits
	.balign	1
	.local	_.str.695
_.str.695:
	.asciz	"substitute"

	.section	.rodata._.str.696,"a",@progbits
	.balign	1
	.local	_.str.696
_.str.696:
	.asciz	"substitution"

	.section	.rodata._.str.697,"a",@progbits
	.balign	1
	.local	_.str.697
_.str.697:
	.asciz	"success"

	.section	.rodata._.str.698,"a",@progbits
	.balign	1
	.local	_.str.698
_.str.698:
	.asciz	"successes"

	.section	.rodata._.str.699,"a",@progbits
	.balign	1
	.local	_.str.699
_.str.699:
	.asciz	"summary"

	.section	.rodata._.str.700,"a",@progbits
	.balign	1
	.local	_.str.700
_.str.700:
	.asciz	"summation"

	.section	.rodata._.str.701,"a",@progbits
	.balign	1
	.local	_.str.701
_.str.701:
	.asciz	"support"

	.section	.rodata._.str.702,"a",@progbits
	.balign	1
	.local	_.str.702
_.str.702:
	.asciz	"sure"

	.section	.rodata._.str.703,"a",@progbits
	.balign	1
	.local	_.str.703
_.str.703:
	.asciz	"survey"

	.section	.rodata._.str.704,"a",@progbits
	.balign	1
	.local	_.str.704
_.str.704:
	.asciz	"switch"

	.section	.rodata._.str.705,"a",@progbits
	.balign	1
	.local	_.str.705
_.str.705:
	.asciz	"symmetric"

	.section	.rodata._.str.706,"a",@progbits
	.balign	1
	.local	_.str.706
_.str.706:
	.asciz	"syntax"

	.section	.rodata._.str.707,"a",@progbits
	.balign	1
	.local	_.str.707
_.str.707:
	.asciz	"system"

	.section	.rodata._.str.708,"a",@progbits
	.balign	1
	.local	_.str.708
_.str.708:
	.asciz	"systematic"

	.section	.rodata._.str.709,"a",@progbits
	.balign	1
	.local	_.str.709
_.str.709:
	.asciz	"t"

	.section	.rodata._.str.710,"a",@progbits
	.balign	1
	.local	_.str.710
_.str.710:
	.asciz	"table"

	.section	.rodata._.str.711,"a",@progbits
	.balign	1
	.local	_.str.711
_.str.711:
	.asciz	"tail"

	.section	.rodata._.str.712,"a",@progbits
	.balign	1
	.local	_.str.712
_.str.712:
	.asciz	"taking"

	.section	.rodata._.str.713,"a",@progbits
	.balign	1
	.local	_.str.713
_.str.713:
	.asciz	"task"

	.section	.rodata._.str.714,"a",@progbits
	.balign	1
	.local	_.str.714
_.str.714:
	.asciz	"template"

	.section	.rodata._.str.715,"a",@progbits
	.balign	1
	.local	_.str.715
_.str.715:
	.asciz	"term"

	.section	.rodata._.str.716,"a",@progbits
	.balign	1
	.local	_.str.716
_.str.716:
	.asciz	"test"

	.section	.rodata._.str.717,"a",@progbits
	.balign	1
	.local	_.str.717
_.str.717:
	.asciz	"testing"

	.section	.rodata._.str.718,"a",@progbits
	.balign	1
	.local	_.str.718
_.str.718:
	.asciz	"tests"

	.section	.rodata._.str.719,"a",@progbits
	.balign	1
	.local	_.str.719
_.str.719:
	.asciz	"text"

	.section	.rodata._.str.720,"a",@progbits
	.balign	1
	.local	_.str.720
_.str.720:
	.asciz	"than"

	.section	.rodata._.str.721,"a",@progbits
	.balign	1
	.local	_.str.721
_.str.721:
	.asciz	"that"

	.section	.rodata._.str.722,"a",@progbits
	.balign	1
	.local	_.str.722
_.str.722:
	.asciz	"them"

	.section	.rodata._.str.723,"a",@progbits
	.balign	1
	.local	_.str.723
_.str.723:
	.asciz	"theorem"

	.section	.rodata._.str.724,"a",@progbits
	.balign	1
	.local	_.str.724
_.str.724:
	.asciz	"there"

	.section	.rodata._.str.725,"a",@progbits
	.balign	1
	.local	_.str.725
_.str.725:
	.asciz	"these"

	.section	.rodata._.str.726,"a",@progbits
	.balign	1
	.local	_.str.726
_.str.726:
	.asciz	"they"

	.section	.rodata._.str.727,"a",@progbits
	.balign	1
	.local	_.str.727
_.str.727:
	.asciz	"this"

	.section	.rodata._.str.728,"a",@progbits
	.balign	1
	.local	_.str.728
_.str.728:
	.asciz	"thoroughly"

	.section	.rodata._.str.729,"a",@progbits
	.balign	1
	.local	_.str.729
_.str.729:
	.asciz	"those"

	.section	.rodata._.str.730,"a",@progbits
	.balign	1
	.local	_.str.730
_.str.730:
	.asciz	"three"

	.section	.rodata._.str.731,"a",@progbits
	.balign	1
	.local	_.str.731
_.str.731:
	.asciz	"threshold"

	.section	.rodata._.str.732,"a",@progbits
	.balign	1
	.local	_.str.732
_.str.732:
	.asciz	"through"

	.section	.rodata._.str.733,"a",@progbits
	.balign	1
	.local	_.str.733
_.str.733:
	.asciz	"tight"

	.section	.rodata._.str.734,"a",@progbits
	.balign	1
	.local	_.str.734
_.str.734:
	.asciz	"time"

	.section	.rodata._.str.735,"a",@progbits
	.balign	1
	.local	_.str.735
_.str.735:
	.asciz	"times"

	.section	.rodata._.str.736,"a",@progbits
	.balign	1
	.local	_.str.736
_.str.736:
	.asciz	"together"

	.section	.rodata._.str.737,"a",@progbits
	.balign	1
	.local	_.str.737
_.str.737:
	.asciz	"total"

	.section	.rodata._.str.738,"a",@progbits
	.balign	1
	.local	_.str.738
_.str.738:
	.asciz	"touch"

	.section	.rodata._.str.739,"a",@progbits
	.balign	1
	.local	_.str.739
_.str.739:
	.asciz	"transformed"

	.section	.rodata._.str.740,"a",@progbits
	.balign	1
	.local	_.str.740
_.str.740:
	.asciz	"transforming"

	.section	.rodata._.str.741,"a",@progbits
	.balign	1
	.local	_.str.741
_.str.741:
	.asciz	"trap"

	.section	.rodata._.str.742,"a",@progbits
	.balign	1
	.local	_.str.742
_.str.742:
	.asciz	"treated"

	.section	.rodata._.str.743,"a",@progbits
	.balign	1
	.local	_.str.743
_.str.743:
	.asciz	"treatment"

	.section	.rodata._.str.744,"a",@progbits
	.balign	1
	.local	_.str.744
_.str.744:
	.asciz	"treatments"

	.section	.rodata._.str.745,"a",@progbits
	.balign	1
	.local	_.str.745
_.str.745:
	.asciz	"trials"

	.section	.rodata._.str.746,"a",@progbits
	.balign	1
	.local	_.str.746
_.str.746:
	.asciz	"trick"

	.section	.rodata._.str.747,"a",@progbits
	.balign	1
	.local	_.str.747
_.str.747:
	.asciz	"true"

	.section	.rodata._.str.748,"a",@progbits
	.balign	1
	.local	_.str.748
_.str.748:
	.asciz	"tutorials"

	.section	.rodata._.str.749,"a",@progbits
	.balign	1
	.local	_.str.749
_.str.749:
	.asciz	"twins"

	.section	.rodata._.str.750,"a",@progbits
	.balign	1
	.local	_.str.750
_.str.750:
	.asciz	"type"

	.section	.rodata._.str.751,"a",@progbits
	.balign	1
	.local	_.str.751
_.str.751:
	.asciz	"types"

	.section	.rodata._.str.752,"a",@progbits
	.balign	1
	.local	_.str.752
_.str.752:
	.asciz	"typical"

	.section	.rodata._.str.753,"a",@progbits
	.balign	1
	.local	_.str.753
_.str.753:
	.asciz	"unbiased"

	.section	.rodata._.str.754,"a",@progbits
	.balign	1
	.local	_.str.754
_.str.754:
	.asciz	"uncertain"

	.section	.rodata._.str.755,"a",@progbits
	.balign	1
	.local	_.str.755
_.str.755:
	.asciz	"undercoverage"

	.section	.rodata._.str.756,"a",@progbits
	.balign	1
	.local	_.str.756
_.str.756:
	.asciz	"understand"

	.section	.rodata._.str.757,"a",@progbits
	.balign	1
	.local	_.str.757
_.str.757:
	.asciz	"union"

	.section	.rodata._.str.758,"a",@progbits
	.balign	1
	.local	_.str.758
_.str.758:
	.asciz	"unit"

	.section	.rodata._.str.759,"a",@progbits
	.balign	1
	.local	_.str.759
_.str.759:
	.asciz	"units"

	.section	.rodata._.str.760,"a",@progbits
	.balign	1
	.local	_.str.760
_.str.760:
	.asciz	"univariate"

	.section	.rodata._.str.761,"a",@progbits
	.balign	1
	.local	_.str.761
_.str.761:
	.asciz	"unlikely"

	.section	.rodata._.str.762,"a",@progbits
	.balign	1
	.local	_.str.762
_.str.762:
	.asciz	"unmeasured"

	.section	.rodata._.str.763,"a",@progbits
	.balign	1
	.local	_.str.763
_.str.763:
	.asciz	"unpooled"

	.section	.rodata._.str.764,"a",@progbits
	.balign	1
	.local	_.str.764
_.str.764:
	.asciz	"unreliable"

	.section	.rodata._.str.765,"a",@progbits
	.balign	1
	.local	_.str.765
_.str.765:
	.asciz	"until"

	.section	.rodata._.str.766,"a",@progbits
	.balign	1
	.local	_.str.766
_.str.766:
	.asciz	"upper"

	.section	.rodata._.str.767,"a",@progbits
	.balign	1
	.local	_.str.767
_.str.767:
	.asciz	"used"

	.section	.rodata._.str.768,"a",@progbits
	.balign	1
	.local	_.str.768
_.str.768:
	.asciz	"using"

	.section	.rodata._.str.769,"a",@progbits
	.balign	1
	.local	_.str.769
_.str.769:
	.asciz	"usually"

	.section	.rodata._.str.770,"a",@progbits
	.balign	1
	.local	_.str.770
_.str.770:
	.asciz	"valid"

	.section	.rodata._.str.771,"a",@progbits
	.balign	1
	.local	_.str.771
_.str.771:
	.asciz	"value"

	.section	.rodata._.str.772,"a",@progbits
	.balign	1
	.local	_.str.772
_.str.772:
	.asciz	"value_1"

	.section	.rodata._.str.773,"a",@progbits
	.balign	1
	.local	_.str.773
_.str.773:
	.asciz	"value_2"

	.section	.rodata._.str.774,"a",@progbits
	.balign	1
	.local	_.str.774
_.str.774:
	.asciz	"value_n"

	.section	.rodata._.str.775,"a",@progbits
	.balign	1
	.local	_.str.775
_.str.775:
	.asciz	"values"

	.section	.rodata._.str.776,"a",@progbits
	.balign	1
	.local	_.str.776
_.str.776:
	.asciz	"variability"

	.section	.rodata._.str.777,"a",@progbits
	.balign	1
	.local	_.str.777
_.str.777:
	.asciz	"variable"

	.section	.rodata._.str.778,"a",@progbits
	.balign	1
	.local	_.str.778
_.str.778:
	.asciz	"variables"

	.section	.rodata._.str.779,"a",@progbits
	.balign	1
	.local	_.str.779
_.str.779:
	.asciz	"variance"

	.section	.rodata._.str.780,"a",@progbits
	.balign	1
	.local	_.str.780
_.str.780:
	.asciz	"variances"

	.section	.rodata._.str.781,"a",@progbits
	.balign	1
	.local	_.str.781
_.str.781:
	.asciz	"variation"

	.section	.rodata._.str.782,"a",@progbits
	.balign	1
	.local	_.str.782
_.str.782:
	.asciz	"varies"

	.section	.rodata._.str.783,"a",@progbits
	.balign	1
	.local	_.str.783
_.str.783:
	.asciz	"verb"

	.section	.rodata._.str.784,"a",@progbits
	.balign	1
	.local	_.str.784
_.str.784:
	.asciz	"verbs"

	.section	.rodata._.str.785,"a",@progbits
	.balign	1
	.local	_.str.785
_.str.785:
	.asciz	"verify"

	.section	.rodata._.str.786,"a",@progbits
	.balign	1
	.local	_.str.786
_.str.786:
	.asciz	"vertical"

	.section	.rodata._.str.787,"a",@progbits
	.balign	1
	.local	_.str.787
_.str.787:
	.asciz	"very"

	.section	.rodata._.str.788,"a",@progbits
	.balign	1
	.local	_.str.788
_.str.788:
	.asciz	"view"

	.section	.rodata._.str.789,"a",@progbits
	.balign	1
	.local	_.str.789
_.str.789:
	.asciz	"visual"

	.section	.rodata._.str.790,"a",@progbits
	.balign	1
	.local	_.str.790
_.str.790:
	.asciz	"voluntary"

	.section	.rodata._.str.791,"a",@progbits
	.balign	1
	.local	_.str.791
_.str.791:
	.asciz	"were"

	.section	.rodata._.str.792,"a",@progbits
	.balign	1
	.local	_.str.792
_.str.792:
	.asciz	"what"

	.section	.rodata._.str.793,"a",@progbits
	.balign	1
	.local	_.str.793
_.str.793:
	.asciz	"when"

	.section	.rodata._.str.794,"a",@progbits
	.balign	1
	.local	_.str.794
_.str.794:
	.asciz	"where"

	.section	.rodata._.str.795,"a",@progbits
	.balign	1
	.local	_.str.795
_.str.795:
	.asciz	"whether"

	.section	.rodata._.str.796,"a",@progbits
	.balign	1
	.local	_.str.796
_.str.796:
	.asciz	"which"

	.section	.rodata._.str.797,"a",@progbits
	.balign	1
	.local	_.str.797
_.str.797:
	.asciz	"while"

	.section	.rodata._.str.798,"a",@progbits
	.balign	1
	.local	_.str.798
_.str.798:
	.asciz	"whose"

	.section	.rodata._.str.799,"a",@progbits
	.balign	1
	.local	_.str.799
_.str.799:
	.asciz	"width"

	.section	.rodata._.str.800,"a",@progbits
	.balign	1
	.local	_.str.800
_.str.800:
	.asciz	"will"

	.section	.rodata._.str.801,"a",@progbits
	.balign	1
	.local	_.str.801
_.str.801:
	.asciz	"with"

	.section	.rodata._.str.802,"a",@progbits
	.balign	1
	.local	_.str.802
_.str.802:
	.asciz	"within"

	.section	.rodata._.str.803,"a",@progbits
	.balign	1
	.local	_.str.803
_.str.803:
	.asciz	"without"

	.section	.rodata._.str.804,"a",@progbits
	.balign	1
	.local	_.str.804
_.str.804:
	.asciz	"wording"

	.section	.rodata._.str.805,"a",@progbits
	.balign	1
	.local	_.str.805
_.str.805:
	.asciz	"words"

	.section	.rodata._.str.806,"a",@progbits
	.balign	1
	.local	_.str.806
_.str.806:
	.asciz	"work"

	.section	.rodata._.str.807,"a",@progbits
	.balign	1
	.local	_.str.807
_.str.807:
	.asciz	"would"

	.section	.rodata._.str.808,"a",@progbits
	.balign	1
	.local	_.str.808
_.str.808:
	.asciz	"write"

	.section	.rodata._.str.809,"a",@progbits
	.balign	1
	.local	_.str.809
_.str.809:
	.asciz	"writing"

	.section	.rodata._.str.810,"a",@progbits
	.balign	1
	.local	_.str.810
_.str.810:
	.asciz	"wrong"

	.section	.rodata._.str.811,"a",@progbits
	.balign	1
	.local	_.str.811
_.str.811:
	.asciz	"your"

	.section	.rodata._.str.812,"a",@progbits
	.balign	1
	.local	_.str.812
_.str.812:
	.asciz	"z"

	.section	.rodata._.str.813,"a",@progbits
	.balign	1
	.local	_.str.813
_.str.813:
	.asciz	"zero"

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

	.section	.rodata._num_search_terms,"a",@progbits
	.balign	1
	.globl	_num_search_terms
_num_search_terms:
	d24	814                             ; 0x32e

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

	.section	.rodata._.str.814,"a",@progbits
	.balign	1
	.local	_.str.814
_.str.814:
	.asciz	"ANTIGRAVITY"

	.section	.rodata._.str.815,"a",@progbits
	.balign	1
	.local	_.str.815
_.str.815:
	.asciz	"AP STATISTICS ENGINE"

	.section	.rodata._.str.816,"a",@progbits
	.balign	1
	.local	_.str.816
_.str.816:
	.asciz	"v2.0"

	.section	.rodata._.str.817,"a",@progbits
	.balign	1
	.local	_.str.817
_.str.817:
	.asciz	"Build: May  7 2026 01:36:47"

	.section	.rodata._.str.818,"a",@progbits
	.balign	1
	.local	_.str.818
_.str.818:
	.asciz	"Glossary - [CLEAR] to exit, [UP]/[DOWN] scroll"

	.section	.rodata._.str.819,"a",@progbits
	.balign	1
	.local	_.str.819
_.str.819:
	.asciz	"Page %d of %d"

	.section	.rodata._.str.820,"a",@progbits
	.balign	1
	.local	_.str.820
_.str.820:
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

	.section	.rodata._.str.821,"a",@progbits
	.balign	1
	.local	_.str.821
_.str.821:
	.asciz	"Trivia: Proportions use z-tests, means use t-tests."

	.section	.rodata._.str.822,"a",@progbits
	.balign	1
	.local	_.str.822
_.str.822:
	.asciz	"Trivia: Never accept the null hypothesis!"

	.section	.rodata._.str.823,"a",@progbits
	.balign	1
	.local	_.str.823
_.str.823:
	.asciz	"Trivia: Context is required for full credit."

	.section	.rodata._.str.824,"a",@progbits
	.balign	1
	.local	_.str.824
_.str.824:
	.asciz	"Trivia: Extrapolation is dangerous!"

	.section	.rodata._.str.825,"a",@progbits
	.balign	1
	.local	_.str.825
_.str.825:
	.asciz	"Trivia: 'S' is the SD of the residuals."

	.section	.rodata.___const.gui_search_loop.trivia,"a",@progbits
	.balign	1
	.local	___const.gui_search_loop.trivia
___const.gui_search_loop.trivia:
	d24	_.str.821
	d24	_.str.822
	d24	_.str.823
	d24	_.str.824
	d24	_.str.825

	.section	.rodata._.str.826,"a",@progbits
	.balign	1
	.local	_.str.826
_.str.826:
	.asciz	"2+2"

	.section	.rodata._.str.827,"a",@progbits
	.balign	1
	.local	_.str.827
_.str.827:
	.asciz	"             4"

	.section	.rodata._.str.828,"a",@progbits
	.balign	1
	.local	_.str.828
_.str.828:
	.asciz	"Ans*10"

	.section	.rodata._.str.829,"a",@progbits
	.balign	1
	.local	_.str.829
_.str.829:
	.asciz	"            40"

	.section	.rodata._.str.830,"a",@progbits
	.balign	1
	.local	_.str.830
_.str.830:
	.asciz	"_"

	.section	.rodata._.str.831,"a",@progbits
	.balign	1
	.local	_.str.831
_.str.831:
	.asciz	"AP Statistics Lexical Search Engine"

	.section	.rodata._.str.832,"a",@progbits
	.balign	1
	.local	_.str.832
_.str.832:
	.asciz	"[A]"

	.section	.rodata._.str.833,"a",@progbits
	.balign	1
	.local	_.str.833
_.str.833:
	.asciz	"[1]"

	.section	.rodata._.str.834,"a",@progbits
	.balign	1
	.local	_.str.834
_.str.834:
	.asciz	"Query: "

	.section	.rodata._.str.835,"a",@progbits
	.balign	1
	.local	_.str.835
_.str.835:
	.asciz	"Press [MODE] to open Glossary"

	.section	.rodata._.str.836,"a",@progbits
	.balign	1
	.local	_.str.836
_.str.836:
	.asciz	"Press [GRAPH] to toggle Dark Mode"

	.section	.rodata._.str.837,"a",@progbits
	.balign	1
	.local	_.str.837
_.str.837:
	.asciz	"Press [STAT] for the Panic Button"

	.section	.rodata._.str.838,"a",@progbits
	.balign	1
	.local	_.str.838
_.str.838:
	.asciz	"Searches This Session: %d"

	.section	.rodata._.str.839,"a",@progbits
	.balign	1
	.local	_.str.839
_.str.839:
	.asciz	"Title: "

	.section	.rodata._.str.840,"a",@progbits
	.balign	1
	.local	_.str.840
_.str.840:
	.asciz	"[F1]COND"

	.section	.rodata._.str.841,"a",@progbits
	.balign	1
	.local	_.str.841
_.str.841:
	.asciz	" F1Cond "

	.section	.rodata._.str.842,"a",@progbits
	.balign	1
	.local	_.str.842
_.str.842:
	.asciz	"[F2]FORM"

	.section	.rodata._.str.843,"a",@progbits
	.balign	1
	.local	_.str.843
_.str.843:
	.asciz	" F2Form "

	.section	.rodata._.str.844,"a",@progbits
	.balign	1
	.local	_.str.844
_.str.844:
	.asciz	"[F3]CALC"

	.section	.rodata._.str.845,"a",@progbits
	.balign	1
	.local	_.str.845
_.str.845:
	.asciz	" F3Calc "

	.section	.rodata._.str.846,"a",@progbits
	.balign	1
	.local	_.str.846
_.str.846:
	.asciz	"[F4]INFO"

	.section	.rodata._.str.847,"a",@progbits
	.balign	1
	.local	_.str.847
_.str.847:
	.asciz	" F4Info "

	.section	.rodata._.str.848,"a",@progbits
	.balign	1
	.local	_.str.848
_.str.848:
	.asciz	"[F5]STEP"

	.section	.rodata._.str.849,"a",@progbits
	.balign	1
	.local	_.str.849
_.str.849:
	.asciz	" F5Step "

	.section	.rodata._.str.850,"a",@progbits
	.balign	1
	.local	_.str.850
_.str.850:
	.asciz	"No specific conditions are required for this concept."

	.section	.rodata._.str.851,"a",@progbits
	.balign	1
	.local	_.str.851
_.str.851:
	.asciz	"No specific formula is required. See the INFO tab."

	.section	.rodata._.str.852,"a",@progbits
	.balign	1
	.local	_.str.852
_.str.852:
	.asciz	"No calculator shortcut exists for this topic."

	.section	.rodata._.str.853,"a",@progbits
	.balign	1
	.local	_.str.853
_.str.853:
	.asciz	"No tutorial available. See the INFO tab for details."

	.section	.rodata._.str.854,"a",@progbits
	.balign	1
	.local	_.str.854
_.str.854:
	.asciz	"Press CLEAR to search again."

	.section	.rodata._.str.855,"a",@progbits
	.balign	1
	.local	_.str.855
_.str.855:
	.asciz	"antigravity"

	.section	.rodata._.str.856,"a",@progbits
	.balign	1
	.local	_.str.856
_.str.856:
	.asciz	"WAKE UP, NEO..."

	.section	.rodata._.str.857,"a",@progbits
	.balign	1
	.local	_.str.857
_.str.857:
	.asciz	"THE AP EXAM HAS YOU."

	.section	.rodata._.str.860,"a",@progbits
	.balign	1
	.local	_.str.860
_.str.860:
	.asciz	"Error loading node data."

	.section	.rodata._.str.861,"a",@progbits
	.balign	1
	.local	_.str.861
_.str.861:
	.asciz	"Keyword not found. Try again."

	.section	.bss._g_db,"aw",@nobits
	.balign	2
	.globl	_g_db
_g_db:
	.zero	20

	.section	.rodata._.str.858,"a",@progbits
	.balign	1
	.local	_.str.858
_.str.858:
	.asciz	"Error: Failed to load STATDAT1"

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	__Unwind_SjLj_Unregister
	.extern	__ineg
	.extern	_rand
	.extern	_os_GetCSC
	.extern	_ti_Open
	.extern	__ladd
	.extern	_llvm.umin.i24
	.extern	_gfx_GetCharWidth
	.extern	__irems
	.extern	_llvm.eh.sjlj.lsda
	.extern	_ti_Close
	.extern	_memcmp
	.extern	_llvm.memset.p0.i24
	.extern	_gfx_End
	.extern	_llvm.frameaddress.p0
	.extern	__lshl
	.extern	_sprintf
	.extern	__lcmpu
	.extern	_gfx_SetTextBGColor
	.extern	__frameset
	.extern	__ishrs_1
	.extern	_llvm.eh.sjlj.callsite
	.extern	__lmulu
	.extern	_gfx_FillRectangle
	.extern	_llvm.lifetime.end.p0
	.extern	_kb_Scan
	.extern	_gfx_GetStringWidth
	.extern	__setflag
	.extern	_llvm.stacksave.p0
	.extern	_llvm.lifetime.start.p0
	.extern	_gfx_SetTextTransparentColor
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_gfx_FillScreen
	.extern	_gfx_PrintStringXY
	.extern	_gfx_SetColor
	.extern	_llvm.memcpy.p0.p0.i24
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.stackrestore.p0
	.extern	_gfx_SetTextFGColor
	.extern	_gfx_Begin
	.extern	_llvm.smax.i24
	.extern	_gfx_SwapDraw
	.extern	__imulu
	.extern	_ti_GetDataPtr
	.extern	__frameset0
	.extern	__Unwind_SjLj_Register
	.extern	_delay
	.extern	_gfx_SetDraw
	.extern	__ishl
