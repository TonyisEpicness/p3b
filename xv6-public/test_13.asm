
_test_13:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}


int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
  14:	e8 0a 08 00 00       	call   823 <getpid>

   assert(fib(28) == 317811);
  19:	83 ec 0c             	sub    $0xc,%esp
  1c:	6a 1c                	push   $0x1c
   ppid = getpid();
  1e:	a3 0c 11 00 00       	mov    %eax,0x110c
   assert(fib(28) == 317811);
  23:	e8 18 01 00 00       	call   140 <fib>
  28:	83 c4 10             	add    $0x10,%esp
  2b:	3d 73 d9 04 00       	cmp    $0x4d973,%eax
  30:	0f 85 92 00 00 00    	jne    c8 <main+0xc8>

   int arg1 = 11, arg2 = 22;

   for (int i = 0; i < num_threads; i++) {
  36:	83 3d 04 11 00 00 00 	cmpl   $0x0,0x1104
   int arg1 = 11, arg2 = 22;
  3d:	c7 45 e0 0b 00 00 00 	movl   $0xb,-0x20(%ebp)
  44:	c7 45 e4 16 00 00 00 	movl   $0x16,-0x1c(%ebp)
   for (int i = 0; i < num_threads; i++) {
  4b:	0f 8e d3 00 00 00    	jle    124 <main+0x124>
  51:	31 db                	xor    %ebx,%ebx
  53:	8d 7d e4             	lea    -0x1c(%ebp),%edi
  56:	8d 75 e0             	lea    -0x20(%ebp),%esi
  59:	eb 11                	jmp    6c <main+0x6c>
  5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  5f:	90                   	nop
  60:	a1 04 11 00 00       	mov    0x1104,%eax
  65:	83 c3 01             	add    $0x1,%ebx
  68:	39 d8                	cmp    %ebx,%eax
  6a:	7e 79                	jle    e5 <main+0xe5>
      int thread_pid = thread_create(worker, &arg1, &arg2);
  6c:	83 ec 04             	sub    $0x4,%esp
  6f:	57                   	push   %edi
  70:	56                   	push   %esi
  71:	68 50 03 00 00       	push   $0x350
  76:	e8 75 04 00 00       	call   4f0 <thread_create>
      assert(thread_pid > 0);
  7b:	83 c4 10             	add    $0x10,%esp
  7e:	85 c0                	test   %eax,%eax
  80:	7f de                	jg     60 <main+0x60>
  82:	6a 2e                	push   $0x2e
  84:	68 38 0c 00 00       	push   $0xc38
  89:	68 42 0c 00 00       	push   $0xc42
  8e:	6a 01                	push   $0x1
  90:	e8 7b 08 00 00       	call   910 <printf>
  95:	83 c4 0c             	add    $0xc,%esp
  98:	68 e0 0c 00 00       	push   $0xce0
  9d:	68 55 0c 00 00       	push   $0xc55
  a2:	6a 01                	push   $0x1
  a4:	e8 67 08 00 00       	call   910 <printf>
  a9:	58                   	pop    %eax
  aa:	5a                   	pop    %edx
  ab:	68 69 0c 00 00       	push   $0xc69
  b0:	6a 01                	push   $0x1
  b2:	e8 59 08 00 00       	call   910 <printf>
  b7:	59                   	pop    %ecx
  b8:	ff 35 0c 11 00 00    	push   0x110c
  be:	e8 10 07 00 00       	call   7d3 <kill>
  c3:	e8 db 06 00 00       	call   7a3 <exit>
   assert(fib(28) == 317811);
  c8:	6a 28                	push   $0x28
  ca:	68 38 0c 00 00       	push   $0xc38
  cf:	68 42 0c 00 00       	push   $0xc42
  d4:	6a 01                	push   $0x1
  d6:	e8 35 08 00 00       	call   910 <printf>
  db:	83 c4 0c             	add    $0xc,%esp
  de:	68 c1 0c 00 00       	push   $0xcc1
  e3:	eb b8                	jmp    9d <main+0x9d>
   }

   for (int i = 0; i < num_threads; i++) {
  e5:	85 c0                	test   %eax,%eax
  e7:	7e 3b                	jle    124 <main+0x124>
  e9:	31 db                	xor    %ebx,%ebx
  eb:	eb 0e                	jmp    fb <main+0xfb>
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c3 01             	add    $0x1,%ebx
  f3:	39 1d 04 11 00 00    	cmp    %ebx,0x1104
  f9:	7e 29                	jle    124 <main+0x124>
      int join_pid = thread_join();
  fb:	e8 00 04 00 00       	call   500 <thread_join>
      assert(join_pid > 0);
 100:	85 c0                	test   %eax,%eax
 102:	7f ec                	jg     f0 <main+0xf0>
 104:	6a 33                	push   $0x33
 106:	68 38 0c 00 00       	push   $0xc38
 10b:	68 42 0c 00 00       	push   $0xc42
 110:	6a 01                	push   $0x1
 112:	e8 f9 07 00 00       	call   910 <printf>
 117:	83 c4 0c             	add    $0xc,%esp
 11a:	68 ef 0c 00 00       	push   $0xcef
 11f:	e9 79 ff ff ff       	jmp    9d <main+0x9d>
   }

   printf(1, "TEST PASSED\n");
 124:	53                   	push   %ebx
 125:	53                   	push   %ebx
 126:	68 d3 0c 00 00       	push   $0xcd3
 12b:	6a 01                	push   $0x1
 12d:	e8 de 07 00 00       	call   910 <printf>
   exit();
 132:	e8 6c 06 00 00       	call   7a3 <exit>
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <fib>:
unsigned int fib(unsigned int n) {
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
 146:	83 ec 4c             	sub    $0x4c,%esp
   if (n == 0) {
 149:	8b 45 08             	mov    0x8(%ebp),%eax
 14c:	85 c0                	test   %eax,%eax
 14e:	0f 84 7d 01 00 00    	je     2d1 <fib+0x191>
   } else if (n == 1) {
 154:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 158:	0f 84 73 01 00 00    	je     2d1 <fib+0x191>
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 168:	89 45 d8             	mov    %eax,-0x28(%ebp)
      return fib(n - 1) + fib(n - 2);
 16b:	8b 45 d8             	mov    -0x28(%ebp),%eax
 16e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 175:	83 e8 01             	sub    $0x1,%eax
 178:	89 45 b8             	mov    %eax,-0x48(%ebp)
   } else if (n == 1) {
 17b:	8b 45 b8             	mov    -0x48(%ebp),%eax
 17e:	83 f8 01             	cmp    $0x1,%eax
 181:	0f 84 2c 01 00 00    	je     2b3 <fib+0x173>
      return fib(n - 1) + fib(n - 2);
 187:	83 e8 01             	sub    $0x1,%eax
 18a:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
 191:	89 45 b4             	mov    %eax,-0x4c(%ebp)
   } else if (n == 1) {
 194:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 197:	83 f8 01             	cmp    $0x1,%eax
 19a:	0f 84 90 01 00 00    	je     330 <fib+0x1f0>
      return fib(n - 1) + fib(n - 2);
 1a0:	83 e8 01             	sub    $0x1,%eax
 1a3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
 1aa:	89 45 ac             	mov    %eax,-0x54(%ebp)
   } else if (n == 1) {
 1ad:	8b 45 ac             	mov    -0x54(%ebp),%eax
 1b0:	83 f8 01             	cmp    $0x1,%eax
 1b3:	0f 84 5e 01 00 00    	je     317 <fib+0x1d7>
      return fib(n - 1) + fib(n - 2);
 1b9:	83 e8 01             	sub    $0x1,%eax
 1bc:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
 1c3:	89 45 b0             	mov    %eax,-0x50(%ebp)
   } else if (n == 1) {
 1c6:	8b 45 b0             	mov    -0x50(%ebp),%eax
 1c9:	83 f8 01             	cmp    $0x1,%eax
 1cc:	0f 84 3c 01 00 00    	je     30e <fib+0x1ce>
      return fib(n - 1) + fib(n - 2);
 1d2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 1d9:	8d 48 ff             	lea    -0x1(%eax),%ecx
 1dc:	89 cb                	mov    %ecx,%ebx
   } else if (n == 1) {
 1de:	83 fb 01             	cmp    $0x1,%ebx
 1e1:	0f 84 13 01 00 00    	je     2fa <fib+0x1ba>
      return fib(n - 1) + fib(n - 2);
 1e7:	8d 43 ff             	lea    -0x1(%ebx),%eax
 1ea:	83 eb 02             	sub    $0x2,%ebx
 1ed:	31 c9                	xor    %ecx,%ecx
 1ef:	89 45 e0             	mov    %eax,-0x20(%ebp)
 1f2:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
 1f5:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
   } else if (n == 1) {
 1f8:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
 1fc:	0f 84 01 01 00 00    	je     303 <fib+0x1c3>
 202:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 205:	31 c0                	xor    %eax,%eax
 207:	89 d7                	mov    %edx,%edi
 209:	89 c2                	mov    %eax,%edx
 20b:	83 ff 01             	cmp    $0x1,%edi
 20e:	0f 84 dc 00 00 00    	je     2f0 <fib+0x1b0>
      return fib(n - 1) + fib(n - 2);
 214:	89 7d c0             	mov    %edi,-0x40(%ebp)
 217:	8d 5f ff             	lea    -0x1(%edi),%ebx
 21a:	31 f6                	xor    %esi,%esi
 21c:	89 cf                	mov    %ecx,%edi
   } else if (n == 1) {
 21e:	83 fb 01             	cmp    $0x1,%ebx
 221:	0f 84 b9 00 00 00    	je     2e0 <fib+0x1a0>
      return fib(n - 1) + fib(n - 2);
 227:	83 ec 0c             	sub    $0xc,%esp
 22a:	8d 43 ff             	lea    -0x1(%ebx),%eax
 22d:	89 55 bc             	mov    %edx,-0x44(%ebp)
 230:	50                   	push   %eax
 231:	e8 0a ff ff ff       	call   140 <fib>
 236:	83 c4 10             	add    $0x10,%esp
   if (n == 0) {
 239:	8b 55 bc             	mov    -0x44(%ebp),%edx
 23c:	01 c6                	add    %eax,%esi
 23e:	83 eb 02             	sub    $0x2,%ebx
 241:	75 db                	jne    21e <fib+0xde>
 243:	89 f9                	mov    %edi,%ecx
 245:	8b 7d c0             	mov    -0x40(%ebp),%edi
 248:	01 f2                	add    %esi,%edx
 24a:	83 ef 02             	sub    $0x2,%edi
 24d:	75 bc                	jne    20b <fib+0xcb>
 24f:	89 d7                	mov    %edx,%edi
 251:	83 6d e4 02          	subl   $0x2,-0x1c(%ebp)
 255:	01 f9                	add    %edi,%ecx
 257:	83 6d e0 02          	subl   $0x2,-0x20(%ebp)
 25b:	75 9b                	jne    1f8 <fib+0xb8>
 25d:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
 260:	01 4d dc             	add    %ecx,-0x24(%ebp)
 263:	85 db                	test   %ebx,%ebx
 265:	0f 85 73 ff ff ff    	jne    1de <fib+0x9e>
 26b:	8b 75 dc             	mov    -0x24(%ebp),%esi
 26e:	01 75 c8             	add    %esi,-0x38(%ebp)
 271:	83 6d b0 02          	subl   $0x2,-0x50(%ebp)
 275:	0f 85 4b ff ff ff    	jne    1c6 <fib+0x86>
 27b:	8b 75 c8             	mov    -0x38(%ebp),%esi
 27e:	01 75 cc             	add    %esi,-0x34(%ebp)
 281:	83 6d ac 02          	subl   $0x2,-0x54(%ebp)
 285:	0f 85 22 ff ff ff    	jne    1ad <fib+0x6d>
 28b:	8b 75 cc             	mov    -0x34(%ebp),%esi
 28e:	01 75 d0             	add    %esi,-0x30(%ebp)
 291:	83 6d b4 02          	subl   $0x2,-0x4c(%ebp)
 295:	0f 85 f9 fe ff ff    	jne    194 <fib+0x54>
 29b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 29e:	01 75 d4             	add    %esi,-0x2c(%ebp)
 2a1:	83 6d b8 02          	subl   $0x2,-0x48(%ebp)
 2a5:	74 10                	je     2b7 <fib+0x177>
   } else if (n == 1) {
 2a7:	8b 45 b8             	mov    -0x48(%ebp),%eax
 2aa:	83 f8 01             	cmp    $0x1,%eax
 2ad:	0f 85 d4 fe ff ff    	jne    187 <fib+0x47>
 2b3:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
 2b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 2ba:	01 45 08             	add    %eax,0x8(%ebp)
   if (n == 0) {
 2bd:	83 6d d8 02          	subl   $0x2,-0x28(%ebp)
 2c1:	74 0e                	je     2d1 <fib+0x191>
   } else if (n == 1) {
 2c3:	83 7d d8 01          	cmpl   $0x1,-0x28(%ebp)
 2c7:	0f 85 9e fe ff ff    	jne    16b <fib+0x2b>
 2cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
}
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d7:	5b                   	pop    %ebx
 2d8:	5e                   	pop    %esi
 2d9:	5f                   	pop    %edi
 2da:	5d                   	pop    %ebp
 2db:	c3                   	ret    
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e0:	89 f9                	mov    %edi,%ecx
 2e2:	83 c6 01             	add    $0x1,%esi
 2e5:	8b 7d c0             	mov    -0x40(%ebp),%edi
 2e8:	e9 5b ff ff ff       	jmp    248 <fib+0x108>
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
 2f0:	89 d7                	mov    %edx,%edi
 2f2:	83 c7 01             	add    $0x1,%edi
 2f5:	e9 57 ff ff ff       	jmp    251 <fib+0x111>
 2fa:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
 2fe:	e9 68 ff ff ff       	jmp    26b <fib+0x12b>
 303:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
 306:	83 c1 01             	add    $0x1,%ecx
 309:	e9 52 ff ff ff       	jmp    260 <fib+0x120>
 30e:	83 45 c8 01          	addl   $0x1,-0x38(%ebp)
 312:	e9 64 ff ff ff       	jmp    27b <fib+0x13b>
 317:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
 31b:	8b 75 cc             	mov    -0x34(%ebp),%esi
 31e:	01 75 d0             	add    %esi,-0x30(%ebp)
   if (n == 0) {
 321:	83 6d b4 02          	subl   $0x2,-0x4c(%ebp)
 325:	0f 85 69 fe ff ff    	jne    194 <fib+0x54>
 32b:	e9 6b ff ff ff       	jmp    29b <fib+0x15b>
 330:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
 334:	8b 75 d0             	mov    -0x30(%ebp),%esi
 337:	01 75 d4             	add    %esi,-0x2c(%ebp)
 33a:	83 6d b8 02          	subl   $0x2,-0x48(%ebp)
 33e:	0f 85 63 ff ff ff    	jne    2a7 <fib+0x167>
 344:	e9 6e ff ff ff       	jmp    2b7 <fib+0x177>
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000350 <worker>:
}

void
worker(void *arg1, void *arg2) {
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
 356:	8b 45 0c             	mov    0xc(%ebp),%eax
 359:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 11);
 35b:	8b 45 08             	mov    0x8(%ebp),%eax
 35e:	83 38 0b             	cmpl   $0xb,(%eax)
 361:	75 75                	jne    3d8 <worker+0x88>
   assert(tmp2 == 22);
 363:	83 fa 16             	cmp    $0x16,%edx
 366:	75 2a                	jne    392 <worker+0x42>
   assert(global == 1);
 368:	83 3d 08 11 00 00 01 	cmpl   $0x1,0x1108
 36f:	0f 84 80 00 00 00    	je     3f5 <worker+0xa5>
 375:	6a 40                	push   $0x40
 377:	68 38 0c 00 00       	push   $0xc38
 37c:	68 42 0c 00 00       	push   $0xc42
 381:	6a 01                	push   $0x1
 383:	e8 88 05 00 00       	call   910 <printf>
 388:	83 c4 0c             	add    $0xc,%esp
 38b:	68 81 0c 00 00       	push   $0xc81
 390:	eb 1b                	jmp    3ad <worker+0x5d>
   assert(tmp2 == 22);
 392:	6a 3f                	push   $0x3f
 394:	68 38 0c 00 00       	push   $0xc38
 399:	68 42 0c 00 00       	push   $0xc42
 39e:	6a 01                	push   $0x1
 3a0:	e8 6b 05 00 00       	call   910 <printf>
 3a5:	83 c4 0c             	add    $0xc,%esp
 3a8:	68 76 0c 00 00       	push   $0xc76
 3ad:	68 55 0c 00 00       	push   $0xc55
 3b2:	6a 01                	push   $0x1
 3b4:	e8 57 05 00 00       	call   910 <printf>
 3b9:	58                   	pop    %eax
 3ba:	5a                   	pop    %edx
 3bb:	68 69 0c 00 00       	push   $0xc69
 3c0:	6a 01                	push   $0x1
 3c2:	e8 49 05 00 00       	call   910 <printf>
 3c7:	59                   	pop    %ecx
 3c8:	ff 35 0c 11 00 00    	push   0x110c
 3ce:	e8 00 04 00 00       	call   7d3 <kill>
 3d3:	e8 cb 03 00 00       	call   7a3 <exit>
   assert(tmp1 == 11);
 3d8:	6a 3e                	push   $0x3e
 3da:	68 38 0c 00 00       	push   $0xc38
 3df:	68 42 0c 00 00       	push   $0xc42
 3e4:	6a 01                	push   $0x1
 3e6:	e8 25 05 00 00       	call   910 <printf>
 3eb:	83 c4 0c             	add    $0xc,%esp
 3ee:	68 4a 0c 00 00       	push   $0xc4a
 3f3:	eb b8                	jmp    3ad <worker+0x5d>
   assert(fib(2) == 1);
 3f5:	83 ec 0c             	sub    $0xc,%esp
 3f8:	6a 02                	push   $0x2
 3fa:	e8 41 fd ff ff       	call   140 <fib>
 3ff:	83 c4 10             	add    $0x10,%esp
 402:	83 e8 01             	sub    $0x1,%eax
 405:	74 1d                	je     424 <worker+0xd4>
 407:	6a 41                	push   $0x41
 409:	68 38 0c 00 00       	push   $0xc38
 40e:	68 42 0c 00 00       	push   $0xc42
 413:	6a 01                	push   $0x1
 415:	e8 f6 04 00 00       	call   910 <printf>
 41a:	83 c4 0c             	add    $0xc,%esp
 41d:	68 8d 0c 00 00       	push   $0xc8d
 422:	eb 89                	jmp    3ad <worker+0x5d>
   assert(fib(3) == 2);
 424:	83 ec 0c             	sub    $0xc,%esp
 427:	6a 03                	push   $0x3
 429:	e8 12 fd ff ff       	call   140 <fib>
 42e:	83 c4 10             	add    $0x10,%esp
 431:	83 f8 02             	cmp    $0x2,%eax
 434:	74 20                	je     456 <worker+0x106>
 436:	6a 42                	push   $0x42
 438:	68 38 0c 00 00       	push   $0xc38
 43d:	68 42 0c 00 00       	push   $0xc42
 442:	6a 01                	push   $0x1
 444:	e8 c7 04 00 00       	call   910 <printf>
 449:	83 c4 0c             	add    $0xc,%esp
 44c:	68 99 0c 00 00       	push   $0xc99
 451:	e9 57 ff ff ff       	jmp    3ad <worker+0x5d>
   assert(fib(9) == 34);
 456:	83 ec 0c             	sub    $0xc,%esp
 459:	6a 09                	push   $0x9
 45b:	e8 e0 fc ff ff       	call   140 <fib>
 460:	83 c4 10             	add    $0x10,%esp
 463:	83 f8 22             	cmp    $0x22,%eax
 466:	74 20                	je     488 <worker+0x138>
 468:	6a 43                	push   $0x43
 46a:	68 38 0c 00 00       	push   $0xc38
 46f:	68 42 0c 00 00       	push   $0xc42
 474:	6a 01                	push   $0x1
 476:	e8 95 04 00 00       	call   910 <printf>
 47b:	83 c4 0c             	add    $0xc,%esp
 47e:	68 a5 0c 00 00       	push   $0xca5
 483:	e9 25 ff ff ff       	jmp    3ad <worker+0x5d>
   assert(fib(15) == 610);
 488:	83 ec 0c             	sub    $0xc,%esp
 48b:	6a 0f                	push   $0xf
 48d:	e8 ae fc ff ff       	call   140 <fib>
 492:	83 c4 10             	add    $0x10,%esp
 495:	3d 62 02 00 00       	cmp    $0x262,%eax
 49a:	74 20                	je     4bc <worker+0x16c>
 49c:	6a 44                	push   $0x44
 49e:	68 38 0c 00 00       	push   $0xc38
 4a3:	68 42 0c 00 00       	push   $0xc42
 4a8:	6a 01                	push   $0x1
 4aa:	e8 61 04 00 00       	call   910 <printf>
 4af:	83 c4 0c             	add    $0xc,%esp
 4b2:	68 b2 0c 00 00       	push   $0xcb2
 4b7:	e9 f1 fe ff ff       	jmp    3ad <worker+0x5d>
   exit();
 4bc:	e8 e2 02 00 00       	call   7a3 <exit>
 4c1:	66 90                	xchg   %ax,%ax
 4c3:	66 90                	xchg   %ax,%ax
 4c5:	66 90                	xchg   %ax,%ax
 4c7:	66 90                	xchg   %ax,%ax
 4c9:	66 90                	xchg   %ax,%ax
 4cb:	66 90                	xchg   %ax,%ax
 4cd:	66 90                	xchg   %ax,%ax
 4cf:	90                   	nop

000004d0 <test_and_set>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int test_and_set(int *old_ptr, int new_ptr) {
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  *old_ptr = new_ptr;
 4d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *old_ptr;
 4d9:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 4db:	89 08                	mov    %ecx,(%eax)
  return old;
}
 4dd:	5d                   	pop    %ebp
 4de:	89 d0                	mov    %edx,%eax
 4e0:	c3                   	ret    
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop

000004f0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  return 0;
}
 4f0:	31 c0                	xor    %eax,%eax
 4f2:	c3                   	ret    
 4f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000500 <thread_join>:

int thread_join() {
  return 0;
}
 500:	31 c0                	xor    %eax,%eax
 502:	c3                   	ret    
 503:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000510 <lock_acquire>:

void lock_acquire(lock_t *lock){
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	8b 45 08             	mov    0x8(%ebp),%eax
  while(test_and_set(&lock->flag, 1) == 1)
 516:	83 38 01             	cmpl   $0x1,(%eax)
 519:	75 05                	jne    520 <lock_acquire+0x10>
 51b:	eb fe                	jmp    51b <lock_acquire+0xb>
 51d:	8d 76 00             	lea    0x0(%esi),%esi
 520:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    
 528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop

00000530 <lock_release>:

void lock_release(lock_t *lock) {
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 53c:	5d                   	pop    %ebp
 53d:	c3                   	ret    
 53e:	66 90                	xchg   %ax,%ax

00000540 <lock_init>:
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	8b 45 08             	mov    0x8(%ebp),%eax
 546:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 54c:	5d                   	pop    %ebp
 54d:	c3                   	ret    
 54e:	66 90                	xchg   %ax,%ax

00000550 <strcpy>:
  lock->flag = 0;
}

char*
strcpy(char *s, const char *t)
{
 550:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 551:	31 c0                	xor    %eax,%eax
{
 553:	89 e5                	mov    %esp,%ebp
 555:	53                   	push   %ebx
 556:	8b 4d 08             	mov    0x8(%ebp),%ecx
 559:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 560:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 564:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 567:	83 c0 01             	add    $0x1,%eax
 56a:	84 d2                	test   %dl,%dl
 56c:	75 f2                	jne    560 <strcpy+0x10>
    ;
  return os;
}
 56e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 571:	89 c8                	mov    %ecx,%eax
 573:	c9                   	leave  
 574:	c3                   	ret    
 575:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000580 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	8b 55 08             	mov    0x8(%ebp),%edx
 587:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 58a:	0f b6 02             	movzbl (%edx),%eax
 58d:	84 c0                	test   %al,%al
 58f:	75 17                	jne    5a8 <strcmp+0x28>
 591:	eb 3a                	jmp    5cd <strcmp+0x4d>
 593:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 597:	90                   	nop
 598:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 59c:	83 c2 01             	add    $0x1,%edx
 59f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 5a2:	84 c0                	test   %al,%al
 5a4:	74 1a                	je     5c0 <strcmp+0x40>
    p++, q++;
 5a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 5a8:	0f b6 19             	movzbl (%ecx),%ebx
 5ab:	38 c3                	cmp    %al,%bl
 5ad:	74 e9                	je     598 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 5af:	29 d8                	sub    %ebx,%eax
}
 5b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5b4:	c9                   	leave  
 5b5:	c3                   	ret    
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 5c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 5c4:	31 c0                	xor    %eax,%eax
 5c6:	29 d8                	sub    %ebx,%eax
}
 5c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5cb:	c9                   	leave  
 5cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 5cd:	0f b6 19             	movzbl (%ecx),%ebx
 5d0:	31 c0                	xor    %eax,%eax
 5d2:	eb db                	jmp    5af <strcmp+0x2f>
 5d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <strlen>:

uint
strlen(const char *s)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 5e6:	80 3a 00             	cmpb   $0x0,(%edx)
 5e9:	74 15                	je     600 <strlen+0x20>
 5eb:	31 c0                	xor    %eax,%eax
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
 5f0:	83 c0 01             	add    $0x1,%eax
 5f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 5f7:	89 c1                	mov    %eax,%ecx
 5f9:	75 f5                	jne    5f0 <strlen+0x10>
    ;
  return n;
}
 5fb:	89 c8                	mov    %ecx,%eax
 5fd:	5d                   	pop    %ebp
 5fe:	c3                   	ret    
 5ff:	90                   	nop
  for(n = 0; s[n]; n++)
 600:	31 c9                	xor    %ecx,%ecx
}
 602:	5d                   	pop    %ebp
 603:	89 c8                	mov    %ecx,%eax
 605:	c3                   	ret    
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi

00000610 <memset>:

void*
memset(void *dst, int c, uint n)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 617:	8b 4d 10             	mov    0x10(%ebp),%ecx
 61a:	8b 45 0c             	mov    0xc(%ebp),%eax
 61d:	89 d7                	mov    %edx,%edi
 61f:	fc                   	cld    
 620:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 622:	8b 7d fc             	mov    -0x4(%ebp),%edi
 625:	89 d0                	mov    %edx,%eax
 627:	c9                   	leave  
 628:	c3                   	ret    
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000630 <strchr>:

char*
strchr(const char *s, char c)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 63a:	0f b6 10             	movzbl (%eax),%edx
 63d:	84 d2                	test   %dl,%dl
 63f:	75 12                	jne    653 <strchr+0x23>
 641:	eb 1d                	jmp    660 <strchr+0x30>
 643:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 647:	90                   	nop
 648:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 64c:	83 c0 01             	add    $0x1,%eax
 64f:	84 d2                	test   %dl,%dl
 651:	74 0d                	je     660 <strchr+0x30>
    if(*s == c)
 653:	38 d1                	cmp    %dl,%cl
 655:	75 f1                	jne    648 <strchr+0x18>
      return (char*)s;
  return 0;
}
 657:	5d                   	pop    %ebp
 658:	c3                   	ret    
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 660:	31 c0                	xor    %eax,%eax
}
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop

00000670 <gets>:

char*
gets(char *buf, int max)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 675:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 678:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 679:	31 db                	xor    %ebx,%ebx
{
 67b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 67e:	eb 27                	jmp    6a7 <gets+0x37>
    cc = read(0, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	6a 01                	push   $0x1
 685:	57                   	push   %edi
 686:	6a 00                	push   $0x0
 688:	e8 2e 01 00 00       	call   7bb <read>
    if(cc < 1)
 68d:	83 c4 10             	add    $0x10,%esp
 690:	85 c0                	test   %eax,%eax
 692:	7e 1d                	jle    6b1 <gets+0x41>
      break;
    buf[i++] = c;
 694:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 698:	8b 55 08             	mov    0x8(%ebp),%edx
 69b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 69f:	3c 0a                	cmp    $0xa,%al
 6a1:	74 1d                	je     6c0 <gets+0x50>
 6a3:	3c 0d                	cmp    $0xd,%al
 6a5:	74 19                	je     6c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 6a7:	89 de                	mov    %ebx,%esi
 6a9:	83 c3 01             	add    $0x1,%ebx
 6ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 6af:	7c cf                	jl     680 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 6b1:	8b 45 08             	mov    0x8(%ebp),%eax
 6b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 6b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bb:	5b                   	pop    %ebx
 6bc:	5e                   	pop    %esi
 6bd:	5f                   	pop    %edi
 6be:	5d                   	pop    %ebp
 6bf:	c3                   	ret    
  buf[i] = '\0';
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	89 de                	mov    %ebx,%esi
 6c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 6c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cc:	5b                   	pop    %ebx
 6cd:	5e                   	pop    %esi
 6ce:	5f                   	pop    %edi
 6cf:	5d                   	pop    %ebp
 6d0:	c3                   	ret    
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop

000006e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	56                   	push   %esi
 6e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6e5:	83 ec 08             	sub    $0x8,%esp
 6e8:	6a 00                	push   $0x0
 6ea:	ff 75 08             	push   0x8(%ebp)
 6ed:	e8 f1 00 00 00       	call   7e3 <open>
  if(fd < 0)
 6f2:	83 c4 10             	add    $0x10,%esp
 6f5:	85 c0                	test   %eax,%eax
 6f7:	78 27                	js     720 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 6f9:	83 ec 08             	sub    $0x8,%esp
 6fc:	ff 75 0c             	push   0xc(%ebp)
 6ff:	89 c3                	mov    %eax,%ebx
 701:	50                   	push   %eax
 702:	e8 f4 00 00 00       	call   7fb <fstat>
  close(fd);
 707:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 70a:	89 c6                	mov    %eax,%esi
  close(fd);
 70c:	e8 ba 00 00 00       	call   7cb <close>
  return r;
 711:	83 c4 10             	add    $0x10,%esp
}
 714:	8d 65 f8             	lea    -0x8(%ebp),%esp
 717:	89 f0                	mov    %esi,%eax
 719:	5b                   	pop    %ebx
 71a:	5e                   	pop    %esi
 71b:	5d                   	pop    %ebp
 71c:	c3                   	ret    
 71d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 720:	be ff ff ff ff       	mov    $0xffffffff,%esi
 725:	eb ed                	jmp    714 <stat+0x34>
 727:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72e:	66 90                	xchg   %ax,%ax

00000730 <atoi>:

int
atoi(const char *s)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	53                   	push   %ebx
 734:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 737:	0f be 02             	movsbl (%edx),%eax
 73a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 73d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 740:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 745:	77 1e                	ja     765 <atoi+0x35>
 747:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 750:	83 c2 01             	add    $0x1,%edx
 753:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 756:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 75a:	0f be 02             	movsbl (%edx),%eax
 75d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 760:	80 fb 09             	cmp    $0x9,%bl
 763:	76 eb                	jbe    750 <atoi+0x20>
  return n;
}
 765:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 768:	89 c8                	mov    %ecx,%eax
 76a:	c9                   	leave  
 76b:	c3                   	ret    
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000770 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	8b 45 10             	mov    0x10(%ebp),%eax
 777:	8b 55 08             	mov    0x8(%ebp),%edx
 77a:	56                   	push   %esi
 77b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 77e:	85 c0                	test   %eax,%eax
 780:	7e 13                	jle    795 <memmove+0x25>
 782:	01 d0                	add    %edx,%eax
  dst = vdst;
 784:	89 d7                	mov    %edx,%edi
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 790:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 791:	39 f8                	cmp    %edi,%eax
 793:	75 fb                	jne    790 <memmove+0x20>
  return vdst;
}
 795:	5e                   	pop    %esi
 796:	89 d0                	mov    %edx,%eax
 798:	5f                   	pop    %edi
 799:	5d                   	pop    %ebp
 79a:	c3                   	ret    

0000079b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 79b:	b8 01 00 00 00       	mov    $0x1,%eax
 7a0:	cd 40                	int    $0x40
 7a2:	c3                   	ret    

000007a3 <exit>:
SYSCALL(exit)
 7a3:	b8 02 00 00 00       	mov    $0x2,%eax
 7a8:	cd 40                	int    $0x40
 7aa:	c3                   	ret    

000007ab <wait>:
SYSCALL(wait)
 7ab:	b8 03 00 00 00       	mov    $0x3,%eax
 7b0:	cd 40                	int    $0x40
 7b2:	c3                   	ret    

000007b3 <pipe>:
SYSCALL(pipe)
 7b3:	b8 04 00 00 00       	mov    $0x4,%eax
 7b8:	cd 40                	int    $0x40
 7ba:	c3                   	ret    

000007bb <read>:
SYSCALL(read)
 7bb:	b8 05 00 00 00       	mov    $0x5,%eax
 7c0:	cd 40                	int    $0x40
 7c2:	c3                   	ret    

000007c3 <write>:
SYSCALL(write)
 7c3:	b8 10 00 00 00       	mov    $0x10,%eax
 7c8:	cd 40                	int    $0x40
 7ca:	c3                   	ret    

000007cb <close>:
SYSCALL(close)
 7cb:	b8 15 00 00 00       	mov    $0x15,%eax
 7d0:	cd 40                	int    $0x40
 7d2:	c3                   	ret    

000007d3 <kill>:
SYSCALL(kill)
 7d3:	b8 06 00 00 00       	mov    $0x6,%eax
 7d8:	cd 40                	int    $0x40
 7da:	c3                   	ret    

000007db <exec>:
SYSCALL(exec)
 7db:	b8 07 00 00 00       	mov    $0x7,%eax
 7e0:	cd 40                	int    $0x40
 7e2:	c3                   	ret    

000007e3 <open>:
SYSCALL(open)
 7e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 7e8:	cd 40                	int    $0x40
 7ea:	c3                   	ret    

000007eb <mknod>:
SYSCALL(mknod)
 7eb:	b8 11 00 00 00       	mov    $0x11,%eax
 7f0:	cd 40                	int    $0x40
 7f2:	c3                   	ret    

000007f3 <unlink>:
SYSCALL(unlink)
 7f3:	b8 12 00 00 00       	mov    $0x12,%eax
 7f8:	cd 40                	int    $0x40
 7fa:	c3                   	ret    

000007fb <fstat>:
SYSCALL(fstat)
 7fb:	b8 08 00 00 00       	mov    $0x8,%eax
 800:	cd 40                	int    $0x40
 802:	c3                   	ret    

00000803 <link>:
SYSCALL(link)
 803:	b8 13 00 00 00       	mov    $0x13,%eax
 808:	cd 40                	int    $0x40
 80a:	c3                   	ret    

0000080b <mkdir>:
SYSCALL(mkdir)
 80b:	b8 14 00 00 00       	mov    $0x14,%eax
 810:	cd 40                	int    $0x40
 812:	c3                   	ret    

00000813 <chdir>:
SYSCALL(chdir)
 813:	b8 09 00 00 00       	mov    $0x9,%eax
 818:	cd 40                	int    $0x40
 81a:	c3                   	ret    

0000081b <dup>:
SYSCALL(dup)
 81b:	b8 0a 00 00 00       	mov    $0xa,%eax
 820:	cd 40                	int    $0x40
 822:	c3                   	ret    

00000823 <getpid>:
SYSCALL(getpid)
 823:	b8 0b 00 00 00       	mov    $0xb,%eax
 828:	cd 40                	int    $0x40
 82a:	c3                   	ret    

0000082b <sbrk>:
SYSCALL(sbrk)
 82b:	b8 0c 00 00 00       	mov    $0xc,%eax
 830:	cd 40                	int    $0x40
 832:	c3                   	ret    

00000833 <sleep>:
SYSCALL(sleep)
 833:	b8 0d 00 00 00       	mov    $0xd,%eax
 838:	cd 40                	int    $0x40
 83a:	c3                   	ret    

0000083b <uptime>:
SYSCALL(uptime)
 83b:	b8 0e 00 00 00       	mov    $0xe,%eax
 840:	cd 40                	int    $0x40
 842:	c3                   	ret    

00000843 <clone>:
SYSCALL(clone)
 843:	b8 16 00 00 00       	mov    $0x16,%eax
 848:	cd 40                	int    $0x40
 84a:	c3                   	ret    

0000084b <join>:
 84b:	b8 17 00 00 00       	mov    $0x17,%eax
 850:	cd 40                	int    $0x40
 852:	c3                   	ret    
 853:	66 90                	xchg   %ax,%ax
 855:	66 90                	xchg   %ax,%ax
 857:	66 90                	xchg   %ax,%ax
 859:	66 90                	xchg   %ax,%ax
 85b:	66 90                	xchg   %ax,%ax
 85d:	66 90                	xchg   %ax,%ax
 85f:	90                   	nop

00000860 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	57                   	push   %edi
 864:	56                   	push   %esi
 865:	53                   	push   %ebx
 866:	83 ec 3c             	sub    $0x3c,%esp
 869:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 86c:	89 d1                	mov    %edx,%ecx
{
 86e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 871:	85 d2                	test   %edx,%edx
 873:	0f 89 7f 00 00 00    	jns    8f8 <printint+0x98>
 879:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 87d:	74 79                	je     8f8 <printint+0x98>
    neg = 1;
 87f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 886:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 888:	31 db                	xor    %ebx,%ebx
 88a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 88d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 890:	89 c8                	mov    %ecx,%eax
 892:	31 d2                	xor    %edx,%edx
 894:	89 cf                	mov    %ecx,%edi
 896:	f7 75 c4             	divl   -0x3c(%ebp)
 899:	0f b6 92 5c 0d 00 00 	movzbl 0xd5c(%edx),%edx
 8a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8a3:	89 d8                	mov    %ebx,%eax
 8a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 8b1:	76 dd                	jbe    890 <printint+0x30>
  if(neg)
 8b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 8b6:	85 c9                	test   %ecx,%ecx
 8b8:	74 0c                	je     8c6 <printint+0x66>
    buf[i++] = '-';
 8ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 8bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 8c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 8c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 8c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 8cd:	eb 07                	jmp    8d6 <printint+0x76>
 8cf:	90                   	nop
    putc(fd, buf[i]);
 8d0:	0f b6 13             	movzbl (%ebx),%edx
 8d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 8d6:	83 ec 04             	sub    $0x4,%esp
 8d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 8dc:	6a 01                	push   $0x1
 8de:	56                   	push   %esi
 8df:	57                   	push   %edi
 8e0:	e8 de fe ff ff       	call   7c3 <write>
  while(--i >= 0)
 8e5:	83 c4 10             	add    $0x10,%esp
 8e8:	39 de                	cmp    %ebx,%esi
 8ea:	75 e4                	jne    8d0 <printint+0x70>
}
 8ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ef:	5b                   	pop    %ebx
 8f0:	5e                   	pop    %esi
 8f1:	5f                   	pop    %edi
 8f2:	5d                   	pop    %ebp
 8f3:	c3                   	ret    
 8f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 8f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 8ff:	eb 87                	jmp    888 <printint+0x28>
 901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 908:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90f:	90                   	nop

00000910 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 919:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 91c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 91f:	0f b6 13             	movzbl (%ebx),%edx
 922:	84 d2                	test   %dl,%dl
 924:	74 6a                	je     990 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 926:	8d 45 10             	lea    0x10(%ebp),%eax
 929:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 92c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 92f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 931:	89 45 d0             	mov    %eax,-0x30(%ebp)
 934:	eb 36                	jmp    96c <printf+0x5c>
 936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93d:	8d 76 00             	lea    0x0(%esi),%esi
 940:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 943:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 948:	83 f8 25             	cmp    $0x25,%eax
 94b:	74 15                	je     962 <printf+0x52>
  write(fd, &c, 1);
 94d:	83 ec 04             	sub    $0x4,%esp
 950:	88 55 e7             	mov    %dl,-0x19(%ebp)
 953:	6a 01                	push   $0x1
 955:	57                   	push   %edi
 956:	56                   	push   %esi
 957:	e8 67 fe ff ff       	call   7c3 <write>
 95c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 95f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 962:	0f b6 13             	movzbl (%ebx),%edx
 965:	83 c3 01             	add    $0x1,%ebx
 968:	84 d2                	test   %dl,%dl
 96a:	74 24                	je     990 <printf+0x80>
    c = fmt[i] & 0xff;
 96c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 96f:	85 c9                	test   %ecx,%ecx
 971:	74 cd                	je     940 <printf+0x30>
      }
    } else if(state == '%'){
 973:	83 f9 25             	cmp    $0x25,%ecx
 976:	75 ea                	jne    962 <printf+0x52>
      if(c == 'd'){
 978:	83 f8 25             	cmp    $0x25,%eax
 97b:	0f 84 07 01 00 00    	je     a88 <printf+0x178>
 981:	83 e8 63             	sub    $0x63,%eax
 984:	83 f8 15             	cmp    $0x15,%eax
 987:	77 17                	ja     9a0 <printf+0x90>
 989:	ff 24 85 04 0d 00 00 	jmp    *0xd04(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 990:	8d 65 f4             	lea    -0xc(%ebp),%esp
 993:	5b                   	pop    %ebx
 994:	5e                   	pop    %esi
 995:	5f                   	pop    %edi
 996:	5d                   	pop    %ebp
 997:	c3                   	ret    
 998:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99f:	90                   	nop
  write(fd, &c, 1);
 9a0:	83 ec 04             	sub    $0x4,%esp
 9a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 9a6:	6a 01                	push   $0x1
 9a8:	57                   	push   %edi
 9a9:	56                   	push   %esi
 9aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9ae:	e8 10 fe ff ff       	call   7c3 <write>
        putc(fd, c);
 9b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 9b7:	83 c4 0c             	add    $0xc,%esp
 9ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 9bd:	6a 01                	push   $0x1
 9bf:	57                   	push   %edi
 9c0:	56                   	push   %esi
 9c1:	e8 fd fd ff ff       	call   7c3 <write>
        putc(fd, c);
 9c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9c9:	31 c9                	xor    %ecx,%ecx
 9cb:	eb 95                	jmp    962 <printf+0x52>
 9cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 9d0:	83 ec 0c             	sub    $0xc,%esp
 9d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9d8:	6a 00                	push   $0x0
 9da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9dd:	8b 10                	mov    (%eax),%edx
 9df:	89 f0                	mov    %esi,%eax
 9e1:	e8 7a fe ff ff       	call   860 <printint>
        ap++;
 9e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 9ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9ed:	31 c9                	xor    %ecx,%ecx
 9ef:	e9 6e ff ff ff       	jmp    962 <printf+0x52>
 9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 9f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9fb:	8b 10                	mov    (%eax),%edx
        ap++;
 9fd:	83 c0 04             	add    $0x4,%eax
 a00:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a03:	85 d2                	test   %edx,%edx
 a05:	0f 84 8d 00 00 00    	je     a98 <printf+0x188>
        while(*s != 0){
 a0b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 a0e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 a10:	84 c0                	test   %al,%al
 a12:	0f 84 4a ff ff ff    	je     962 <printf+0x52>
 a18:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 a1b:	89 d3                	mov    %edx,%ebx
 a1d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 a20:	83 ec 04             	sub    $0x4,%esp
          s++;
 a23:	83 c3 01             	add    $0x1,%ebx
 a26:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a29:	6a 01                	push   $0x1
 a2b:	57                   	push   %edi
 a2c:	56                   	push   %esi
 a2d:	e8 91 fd ff ff       	call   7c3 <write>
        while(*s != 0){
 a32:	0f b6 03             	movzbl (%ebx),%eax
 a35:	83 c4 10             	add    $0x10,%esp
 a38:	84 c0                	test   %al,%al
 a3a:	75 e4                	jne    a20 <printf+0x110>
      state = 0;
 a3c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 a3f:	31 c9                	xor    %ecx,%ecx
 a41:	e9 1c ff ff ff       	jmp    962 <printf+0x52>
 a46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a4d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a50:	83 ec 0c             	sub    $0xc,%esp
 a53:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a58:	6a 01                	push   $0x1
 a5a:	e9 7b ff ff ff       	jmp    9da <printf+0xca>
 a5f:	90                   	nop
        putc(fd, *ap);
 a60:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 a63:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a66:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 a68:	6a 01                	push   $0x1
 a6a:	57                   	push   %edi
 a6b:	56                   	push   %esi
        putc(fd, *ap);
 a6c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a6f:	e8 4f fd ff ff       	call   7c3 <write>
        ap++;
 a74:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 a78:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a7b:	31 c9                	xor    %ecx,%ecx
 a7d:	e9 e0 fe ff ff       	jmp    962 <printf+0x52>
 a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 a88:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 a8b:	83 ec 04             	sub    $0x4,%esp
 a8e:	e9 2a ff ff ff       	jmp    9bd <printf+0xad>
 a93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a97:	90                   	nop
          s = "(null)";
 a98:	ba fc 0c 00 00       	mov    $0xcfc,%edx
        while(*s != 0){
 a9d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 aa0:	b8 28 00 00 00       	mov    $0x28,%eax
 aa5:	89 d3                	mov    %edx,%ebx
 aa7:	e9 74 ff ff ff       	jmp    a20 <printf+0x110>
 aac:	66 90                	xchg   %ax,%ax
 aae:	66 90                	xchg   %ax,%ax

00000ab0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ab0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab1:	a1 10 11 00 00       	mov    0x1110,%eax
{
 ab6:	89 e5                	mov    %esp,%ebp
 ab8:	57                   	push   %edi
 ab9:	56                   	push   %esi
 aba:	53                   	push   %ebx
 abb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 abe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ac8:	89 c2                	mov    %eax,%edx
 aca:	8b 00                	mov    (%eax),%eax
 acc:	39 ca                	cmp    %ecx,%edx
 ace:	73 30                	jae    b00 <free+0x50>
 ad0:	39 c1                	cmp    %eax,%ecx
 ad2:	72 04                	jb     ad8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ad4:	39 c2                	cmp    %eax,%edx
 ad6:	72 f0                	jb     ac8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ad8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 adb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ade:	39 f8                	cmp    %edi,%eax
 ae0:	74 30                	je     b12 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 ae2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 ae5:	8b 42 04             	mov    0x4(%edx),%eax
 ae8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 aeb:	39 f1                	cmp    %esi,%ecx
 aed:	74 3a                	je     b29 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 aef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 af1:	5b                   	pop    %ebx
  freep = p;
 af2:	89 15 10 11 00 00    	mov    %edx,0x1110
}
 af8:	5e                   	pop    %esi
 af9:	5f                   	pop    %edi
 afa:	5d                   	pop    %ebp
 afb:	c3                   	ret    
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b00:	39 c2                	cmp    %eax,%edx
 b02:	72 c4                	jb     ac8 <free+0x18>
 b04:	39 c1                	cmp    %eax,%ecx
 b06:	73 c0                	jae    ac8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 b08:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b0b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b0e:	39 f8                	cmp    %edi,%eax
 b10:	75 d0                	jne    ae2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 b12:	03 70 04             	add    0x4(%eax),%esi
 b15:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b18:	8b 02                	mov    (%edx),%eax
 b1a:	8b 00                	mov    (%eax),%eax
 b1c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 b1f:	8b 42 04             	mov    0x4(%edx),%eax
 b22:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 b25:	39 f1                	cmp    %esi,%ecx
 b27:	75 c6                	jne    aef <free+0x3f>
    p->s.size += bp->s.size;
 b29:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 b2c:	89 15 10 11 00 00    	mov    %edx,0x1110
    p->s.size += bp->s.size;
 b32:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 b35:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 b38:	89 0a                	mov    %ecx,(%edx)
}
 b3a:	5b                   	pop    %ebx
 b3b:	5e                   	pop    %esi
 b3c:	5f                   	pop    %edi
 b3d:	5d                   	pop    %ebp
 b3e:	c3                   	ret    
 b3f:	90                   	nop

00000b40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	57                   	push   %edi
 b44:	56                   	push   %esi
 b45:	53                   	push   %ebx
 b46:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b49:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b4c:	8b 3d 10 11 00 00    	mov    0x1110,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b52:	8d 70 07             	lea    0x7(%eax),%esi
 b55:	c1 ee 03             	shr    $0x3,%esi
 b58:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b5b:	85 ff                	test   %edi,%edi
 b5d:	0f 84 9d 00 00 00    	je     c00 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b63:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 b65:	8b 4a 04             	mov    0x4(%edx),%ecx
 b68:	39 f1                	cmp    %esi,%ecx
 b6a:	73 6a                	jae    bd6 <malloc+0x96>
 b6c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b71:	39 de                	cmp    %ebx,%esi
 b73:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b76:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 b7d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b80:	eb 17                	jmp    b99 <malloc+0x59>
 b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b88:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b8a:	8b 48 04             	mov    0x4(%eax),%ecx
 b8d:	39 f1                	cmp    %esi,%ecx
 b8f:	73 4f                	jae    be0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b91:	8b 3d 10 11 00 00    	mov    0x1110,%edi
 b97:	89 c2                	mov    %eax,%edx
 b99:	39 d7                	cmp    %edx,%edi
 b9b:	75 eb                	jne    b88 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 b9d:	83 ec 0c             	sub    $0xc,%esp
 ba0:	ff 75 e4             	push   -0x1c(%ebp)
 ba3:	e8 83 fc ff ff       	call   82b <sbrk>
  if(p == (char*)-1)
 ba8:	83 c4 10             	add    $0x10,%esp
 bab:	83 f8 ff             	cmp    $0xffffffff,%eax
 bae:	74 1c                	je     bcc <malloc+0x8c>
  hp->s.size = nu;
 bb0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 bb3:	83 ec 0c             	sub    $0xc,%esp
 bb6:	83 c0 08             	add    $0x8,%eax
 bb9:	50                   	push   %eax
 bba:	e8 f1 fe ff ff       	call   ab0 <free>
  return freep;
 bbf:	8b 15 10 11 00 00    	mov    0x1110,%edx
      if((p = morecore(nunits)) == 0)
 bc5:	83 c4 10             	add    $0x10,%esp
 bc8:	85 d2                	test   %edx,%edx
 bca:	75 bc                	jne    b88 <malloc+0x48>
        return 0;
  }
}
 bcc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bcf:	31 c0                	xor    %eax,%eax
}
 bd1:	5b                   	pop    %ebx
 bd2:	5e                   	pop    %esi
 bd3:	5f                   	pop    %edi
 bd4:	5d                   	pop    %ebp
 bd5:	c3                   	ret    
    if(p->s.size >= nunits){
 bd6:	89 d0                	mov    %edx,%eax
 bd8:	89 fa                	mov    %edi,%edx
 bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 be0:	39 ce                	cmp    %ecx,%esi
 be2:	74 4c                	je     c30 <malloc+0xf0>
        p->s.size -= nunits;
 be4:	29 f1                	sub    %esi,%ecx
 be6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 be9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 bec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 bef:	89 15 10 11 00 00    	mov    %edx,0x1110
}
 bf5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 bf8:	83 c0 08             	add    $0x8,%eax
}
 bfb:	5b                   	pop    %ebx
 bfc:	5e                   	pop    %esi
 bfd:	5f                   	pop    %edi
 bfe:	5d                   	pop    %ebp
 bff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 c00:	c7 05 10 11 00 00 14 	movl   $0x1114,0x1110
 c07:	11 00 00 
    base.s.size = 0;
 c0a:	bf 14 11 00 00       	mov    $0x1114,%edi
    base.s.ptr = freep = prevp = &base;
 c0f:	c7 05 14 11 00 00 14 	movl   $0x1114,0x1114
 c16:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c19:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 c1b:	c7 05 18 11 00 00 00 	movl   $0x0,0x1118
 c22:	00 00 00 
    if(p->s.size >= nunits){
 c25:	e9 42 ff ff ff       	jmp    b6c <malloc+0x2c>
 c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c30:	8b 08                	mov    (%eax),%ecx
 c32:	89 0a                	mov    %ecx,(%edx)
 c34:	eb b9                	jmp    bef <malloc+0xaf>
