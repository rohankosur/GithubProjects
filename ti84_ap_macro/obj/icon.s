	.assume adl=1

	.section .header.icon

	.local ___icon
___icon_jump:
	jp	__start
	.db	$02

	.global ___description
___description:
	.db	"AP Macroeconomics Reference Tool", 0
	.extern __start
