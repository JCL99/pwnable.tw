/* My analysis */
/*     sw      */

start:     file format elf32-i386


Disassembly of section .text:

08048060 <_start>:
 8048060:	54                   	push   %esp        // save initial stack pointer
 8048061:	68 9d 80 04 08       	push   $0x804809d  // push _exit address
 8048066:	31 c0                	xor    %eax,%eax   // zero eax
 8048068:	31 db                	xor    %ebx,%ebx   // zero ebx
 804806a:	31 c9                	xor    %ecx,%ecx   // zero ecx
 804806c:	31 d2                	xor    %edx,%edx   // zero edx
 804806e:	68 43 54 46 3a       	push   $0x3a465443 // push string to stack
 8048073:	68 74 68 65 20       	push   $0x20656874 //  ''    ''   ''  ''
 8048078:	68 61 72 74 20       	push   $0x20747261 //  ''    ''   ''  ''
 804807d:	68 73 20 73 74       	push   $0x74732073 //  ''    ''   ''  ''
 8048082:	68 4c 65 74 27       	push   $0x2774654c //  ''    ''   ''  ''
 8048087:	89 e1                	mov    %esp,%ecx   // ecx = sp (now the beggining of the string)
 8048089:	b2 14                	mov    $0x14,%dl   // dl = 0x14 (decimal 20) this is the number of bytes to write
 804808b:	b3 01                	mov    $0x1,%bl    // bl = 0x1 this is the fd (stdin in this case, 1)
 804808d:	b0 04                	mov    $0x4,%al    // al = 0x4 this is the system call no. (4 -> write())
 804808f:	cd 80                	int    $0x80       // syscall() ---> write()
 8048091:	31 db                	xor    %ebx,%ebx   // zero ebx
 8048093:	b2 3c                	mov    $0x3c,%dl   // dl = 0x3c (decimal 60) this is the number of bytes to read
 8048095:	b0 03                	mov    $0x3,%al    // al = 0x3 this is the system call no.
 8048097:	cd 80                	int    $0x80       // syscall() ---> read()
 8048099:	83 c4 14             	add    $0x14,%esp  // shrink stack 0x14 (decimal 20) bytes
 804809c:	c3                   	ret                // this jumps to where the value on the stack top points to. In this case it is _exit

0804809d <_exit>:
 804809d:	5c                   	pop    %esp        // restore stack
 804809e:	31 c0                	xor    %eax,%eax   // zero eax
 80480a0:	40                   	inc    %eax        // eax = 0x1
 80480a1:	cd 80                	int    $0x80       //syscall() ---> exit()
