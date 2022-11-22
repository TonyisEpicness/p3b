
_test_13:     file format elf32-i386


Disassembly of section .text:

00000000 <fib>:
   exit(); \
}

void worker(void *arg1, void *arg2);

unsigned int fib(unsigned int n) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if (n == 0) {
   8:	85 db                	test   %ebx,%ebx
   a:	74 05                	je     11 <fib+0x11>
      return 0;
   } else if (n == 1) {
   c:	83 fb 01             	cmp    $0x1,%ebx
   f:	75 09                	jne    1a <fib+0x1a>
      return 1;
   } else {
      return fib(n - 1) + fib(n - 2);
   }
}
  11:	89 d8                	mov    %ebx,%eax
  13:	8d 65 f8             	lea    -0x8(%ebp),%esp
  16:	5b                   	pop    %ebx
  17:	5e                   	pop    %esi
  18:	5d                   	pop    %ebp
  19:	c3                   	ret    
      return fib(n - 1) + fib(n - 2);
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	8d 43 ff             	lea    -0x1(%ebx),%eax
  20:	50                   	push   %eax
  21:	e8 da ff ff ff       	call   0 <fib>
  26:	89 c6                	mov    %eax,%esi
  28:	83 eb 02             	sub    $0x2,%ebx
  2b:	89 1c 24             	mov    %ebx,(%esp)
  2e:	e8 cd ff ff ff       	call   0 <fib>
  33:	83 c4 10             	add    $0x10,%esp
  36:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  39:	eb d6                	jmp    11 <fib+0x11>

0000003b <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
  41:	8b 45 0c             	mov    0xc(%ebp),%eax
  44:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 11);
  46:	8b 45 08             	mov    0x8(%ebp),%eax
  49:	83 38 0b             	cmpl   $0xb,(%eax)
  4c:	75 5f                	jne    ad <worker+0x72>
   assert(tmp2 == 22);
  4e:	83 fa 16             	cmp    $0x16,%edx
  51:	0f 85 9f 00 00 00    	jne    f6 <worker+0xbb>
   assert(global == 1);
<<<<<<< HEAD
  57:	83 3d b8 0f 00 00 01 	cmpl   $0x1,0xfb8
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 d0 0a 00 00       	push   $0xad0
  6b:	68 da 0a 00 00       	push   $0xada
  70:	6a 01                	push   $0x1
  72:	e8 a9 07 00 00       	call   820 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 19 0b 00 00       	push   $0xb19
  7f:	68 ed 0a 00 00       	push   $0xaed
  84:	6a 01                	push   $0x1
  86:	e8 95 07 00 00       	call   820 <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 01 0b 00 00       	push   $0xb01
  93:	6a 01                	push   $0x1
  95:	e8 86 07 00 00       	call   820 <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 c0 0f 00 00    	push   0xfc0
  a3:	e8 53 06 00 00       	call   6fb <kill>
  a8:	e8 1e 06 00 00       	call   6cb <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 d0 0a 00 00       	push   $0xad0
  b4:	68 da 0a 00 00       	push   $0xada
  b9:	6a 01                	push   $0x1
  bb:	e8 60 07 00 00       	call   820 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 e2 0a 00 00       	push   $0xae2
  c8:	68 ed 0a 00 00       	push   $0xaed
  cd:	6a 01                	push   $0x1
  cf:	e8 4c 07 00 00       	call   820 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 01 0b 00 00       	push   $0xb01
  dc:	6a 01                	push   $0x1
  de:	e8 3d 07 00 00       	call   820 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 c0 0f 00 00    	push   0xfc0
  ec:	e8 0a 06 00 00       	call   6fb <kill>
  f1:	e8 d5 05 00 00       	call   6cb <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 d0 0a 00 00       	push   $0xad0
  fd:	68 da 0a 00 00       	push   $0xada
 102:	6a 01                	push   $0x1
 104:	e8 17 07 00 00       	call   820 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 0e 0b 00 00       	push   $0xb0e
 111:	68 ed 0a 00 00       	push   $0xaed
 116:	6a 01                	push   $0x1
 118:	e8 03 07 00 00       	call   820 <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 01 0b 00 00       	push   $0xb01
 125:	6a 01                	push   $0x1
 127:	e8 f4 06 00 00       	call   820 <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 c0 0f 00 00    	push   0xfc0
 135:	e8 c1 05 00 00       	call   6fb <kill>
 13a:	e8 8c 05 00 00       	call   6cb <exit>
=======
  57:	83 3d 9c 0f 00 00 01 	cmpl   $0x1,0xf9c
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 b8 0a 00 00       	push   $0xab8
  6b:	68 c2 0a 00 00       	push   $0xac2
  70:	6a 01                	push   $0x1
  72:	e8 92 07 00 00       	call   809 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 01 0b 00 00       	push   $0xb01
  7f:	68 d5 0a 00 00       	push   $0xad5
  84:	6a 01                	push   $0x1
  86:	e8 7e 07 00 00       	call   809 <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 e9 0a 00 00       	push   $0xae9
  93:	6a 01                	push   $0x1
  95:	e8 6f 07 00 00       	call   809 <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 a0 0f 00 00    	push   0xfa0
  a3:	e8 3c 06 00 00       	call   6e4 <kill>
  a8:	e8 07 06 00 00       	call   6b4 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 b8 0a 00 00       	push   $0xab8
  b4:	68 c2 0a 00 00       	push   $0xac2
  b9:	6a 01                	push   $0x1
  bb:	e8 49 07 00 00       	call   809 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 ca 0a 00 00       	push   $0xaca
  c8:	68 d5 0a 00 00       	push   $0xad5
  cd:	6a 01                	push   $0x1
  cf:	e8 35 07 00 00       	call   809 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 e9 0a 00 00       	push   $0xae9
  dc:	6a 01                	push   $0x1
  de:	e8 26 07 00 00       	call   809 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 a0 0f 00 00    	push   0xfa0
  ec:	e8 f3 05 00 00       	call   6e4 <kill>
  f1:	e8 be 05 00 00       	call   6b4 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 b8 0a 00 00       	push   $0xab8
  fd:	68 c2 0a 00 00       	push   $0xac2
 102:	6a 01                	push   $0x1
 104:	e8 00 07 00 00       	call   809 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 f6 0a 00 00       	push   $0xaf6
 111:	68 d5 0a 00 00       	push   $0xad5
 116:	6a 01                	push   $0x1
 118:	e8 ec 06 00 00       	call   809 <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 e9 0a 00 00       	push   $0xae9
 125:	6a 01                	push   $0x1
 127:	e8 dd 06 00 00       	call   809 <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 a0 0f 00 00    	push   0xfa0
 135:	e8 aa 05 00 00       	call   6e4 <kill>
 13a:	e8 75 05 00 00       	call   6b4 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
<<<<<<< HEAD
 153:	68 d0 0a 00 00       	push   $0xad0
 158:	68 da 0a 00 00       	push   $0xada
 15d:	6a 01                	push   $0x1
 15f:	e8 bc 06 00 00       	call   820 <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 25 0b 00 00       	push   $0xb25
 16c:	68 ed 0a 00 00       	push   $0xaed
 171:	6a 01                	push   $0x1
 173:	e8 a8 06 00 00       	call   820 <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 01 0b 00 00       	push   $0xb01
 180:	6a 01                	push   $0x1
 182:	e8 99 06 00 00       	call   820 <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 c0 0f 00 00    	push   0xfc0
 190:	e8 66 05 00 00       	call   6fb <kill>
 195:	e8 31 05 00 00       	call   6cb <exit>
=======
 153:	68 b8 0a 00 00       	push   $0xab8
 158:	68 c2 0a 00 00       	push   $0xac2
 15d:	6a 01                	push   $0x1
 15f:	e8 a5 06 00 00       	call   809 <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 0d 0b 00 00       	push   $0xb0d
 16c:	68 d5 0a 00 00       	push   $0xad5
 171:	6a 01                	push   $0x1
 173:	e8 91 06 00 00       	call   809 <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 e9 0a 00 00       	push   $0xae9
 180:	6a 01                	push   $0x1
 182:	e8 82 06 00 00       	call   809 <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 a0 0f 00 00    	push   0xfa0
 190:	e8 4f 05 00 00       	call   6e4 <kill>
 195:	e8 1a 05 00 00       	call   6b4 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
<<<<<<< HEAD
 1ae:	68 d0 0a 00 00       	push   $0xad0
 1b3:	68 da 0a 00 00       	push   $0xada
 1b8:	6a 01                	push   $0x1
 1ba:	e8 61 06 00 00       	call   820 <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 31 0b 00 00       	push   $0xb31
 1c7:	68 ed 0a 00 00       	push   $0xaed
 1cc:	6a 01                	push   $0x1
 1ce:	e8 4d 06 00 00       	call   820 <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 01 0b 00 00       	push   $0xb01
 1db:	6a 01                	push   $0x1
 1dd:	e8 3e 06 00 00       	call   820 <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 c0 0f 00 00    	push   0xfc0
 1eb:	e8 0b 05 00 00       	call   6fb <kill>
 1f0:	e8 d6 04 00 00       	call   6cb <exit>
=======
 1ae:	68 b8 0a 00 00       	push   $0xab8
 1b3:	68 c2 0a 00 00       	push   $0xac2
 1b8:	6a 01                	push   $0x1
 1ba:	e8 4a 06 00 00       	call   809 <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 19 0b 00 00       	push   $0xb19
 1c7:	68 d5 0a 00 00       	push   $0xad5
 1cc:	6a 01                	push   $0x1
 1ce:	e8 36 06 00 00       	call   809 <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 e9 0a 00 00       	push   $0xae9
 1db:	6a 01                	push   $0x1
 1dd:	e8 27 06 00 00       	call   809 <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 a0 0f 00 00    	push   0xfa0
 1eb:	e8 f4 04 00 00       	call   6e4 <kill>
 1f0:	e8 bf 04 00 00       	call   6b4 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
<<<<<<< HEAD
 209:	68 d0 0a 00 00       	push   $0xad0
 20e:	68 da 0a 00 00       	push   $0xada
 213:	6a 01                	push   $0x1
 215:	e8 06 06 00 00       	call   820 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 3d 0b 00 00       	push   $0xb3d
 222:	68 ed 0a 00 00       	push   $0xaed
 227:	6a 01                	push   $0x1
 229:	e8 f2 05 00 00       	call   820 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 01 0b 00 00       	push   $0xb01
 236:	6a 01                	push   $0x1
 238:	e8 e3 05 00 00       	call   820 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 c0 0f 00 00    	push   0xfc0
 246:	e8 b0 04 00 00       	call   6fb <kill>
 24b:	e8 7b 04 00 00       	call   6cb <exit>
=======
 209:	68 b8 0a 00 00       	push   $0xab8
 20e:	68 c2 0a 00 00       	push   $0xac2
 213:	6a 01                	push   $0x1
 215:	e8 ef 05 00 00       	call   809 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 25 0b 00 00       	push   $0xb25
 222:	68 d5 0a 00 00       	push   $0xad5
 227:	6a 01                	push   $0x1
 229:	e8 db 05 00 00       	call   809 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 e9 0a 00 00       	push   $0xae9
 236:	6a 01                	push   $0x1
 238:	e8 cc 05 00 00       	call   809 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 a0 0f 00 00    	push   0xfa0
 246:	e8 99 04 00 00       	call   6e4 <kill>
 24b:	e8 64 04 00 00       	call   6b4 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
<<<<<<< HEAD
 266:	68 d0 0a 00 00       	push   $0xad0
 26b:	68 da 0a 00 00       	push   $0xada
 270:	6a 01                	push   $0x1
 272:	e8 a9 05 00 00       	call   820 <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 4a 0b 00 00       	push   $0xb4a
 27f:	68 ed 0a 00 00       	push   $0xaed
 284:	6a 01                	push   $0x1
 286:	e8 95 05 00 00       	call   820 <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 01 0b 00 00       	push   $0xb01
 293:	6a 01                	push   $0x1
 295:	e8 86 05 00 00       	call   820 <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 c0 0f 00 00    	push   0xfc0
 2a3:	e8 53 04 00 00       	call   6fb <kill>
 2a8:	e8 1e 04 00 00       	call   6cb <exit>
   exit();
 2ad:	e8 19 04 00 00       	call   6cb <exit>
=======
 266:	68 b8 0a 00 00       	push   $0xab8
 26b:	68 c2 0a 00 00       	push   $0xac2
 270:	6a 01                	push   $0x1
 272:	e8 92 05 00 00       	call   809 <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 32 0b 00 00       	push   $0xb32
 27f:	68 d5 0a 00 00       	push   $0xad5
 284:	6a 01                	push   $0x1
 286:	e8 7e 05 00 00       	call   809 <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 e9 0a 00 00       	push   $0xae9
 293:	6a 01                	push   $0x1
 295:	e8 6f 05 00 00       	call   809 <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 a0 0f 00 00    	push   0xfa0
 2a3:	e8 3c 04 00 00       	call   6e4 <kill>
 2a8:	e8 07 04 00 00       	call   6b4 <exit>
   exit();
 2ad:	e8 02 04 00 00       	call   6b4 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000002b2 <main>:
{
 2b2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2b6:	83 e4 f0             	and    $0xfffffff0,%esp
 2b9:	ff 71 fc             	push   -0x4(%ecx)
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	53                   	push   %ebx
 2c0:	51                   	push   %ecx
 2c1:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
<<<<<<< HEAD
 2c4:	e8 82 04 00 00       	call   74b <getpid>
 2c9:	a3 c0 0f 00 00       	mov    %eax,0xfc0
=======
 2c4:	e8 6b 04 00 00       	call   734 <getpid>
 2c9:	a3 a0 0f 00 00       	mov    %eax,0xfa0
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(fib(28) == 317811);
 2ce:	83 ec 0c             	sub    $0xc,%esp
 2d1:	6a 1c                	push   $0x1c
 2d3:	e8 28 fd ff ff       	call   0 <fib>
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	3d 73 d9 04 00       	cmp    $0x4d973,%eax
 2e0:	75 40                	jne    322 <main+0x70>
   int arg1 = 11, arg2 = 22;
 2e2:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2e9:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   for (int i = 0; i < num_threads; i++) {
 2f0:	bb 00 00 00 00       	mov    $0x0,%ebx
<<<<<<< HEAD
 2f5:	39 1d b4 0f 00 00    	cmp    %ebx,0xfb4
=======
 2f5:	39 1d 98 0f 00 00    	cmp    %ebx,0xf98
>>>>>>> c59b0f9 (fixed thread_join and join)
 2fb:	0f 8e b3 00 00 00    	jle    3b4 <main+0x102>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 301:	83 ec 04             	sub    $0x4,%esp
 304:	8d 45 f0             	lea    -0x10(%ebp),%eax
 307:	50                   	push   %eax
 308:	8d 45 f4             	lea    -0xc(%ebp),%eax
 30b:	50                   	push   %eax
 30c:	68 3b 00 00 00       	push   $0x3b
 311:	e8 27 01 00 00       	call   43d <thread_create>
      assert(thread_pid > 0);
 316:	83 c4 10             	add    $0x10,%esp
 319:	85 c0                	test   %eax,%eax
 31b:	7e 4e                	jle    36b <main+0xb9>
   for (int i = 0; i < num_threads; i++) {
 31d:	83 c3 01             	add    $0x1,%ebx
 320:	eb d3                	jmp    2f5 <main+0x43>
   assert(fib(28) == 317811);
 322:	6a 28                	push   $0x28
<<<<<<< HEAD
 324:	68 d0 0a 00 00       	push   $0xad0
 329:	68 da 0a 00 00       	push   $0xada
 32e:	6a 01                	push   $0x1
 330:	e8 eb 04 00 00       	call   820 <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 59 0b 00 00       	push   $0xb59
 33d:	68 ed 0a 00 00       	push   $0xaed
 342:	6a 01                	push   $0x1
 344:	e8 d7 04 00 00       	call   820 <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 01 0b 00 00       	push   $0xb01
 351:	6a 01                	push   $0x1
 353:	e8 c8 04 00 00       	call   820 <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 c0 0f 00 00    	push   0xfc0
 361:	e8 95 03 00 00       	call   6fb <kill>
 366:	e8 60 03 00 00       	call   6cb <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 d0 0a 00 00       	push   $0xad0
 372:	68 da 0a 00 00       	push   $0xada
 377:	6a 01                	push   $0x1
 379:	e8 a2 04 00 00       	call   820 <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 6b 0b 00 00       	push   $0xb6b
 386:	68 ed 0a 00 00       	push   $0xaed
 38b:	6a 01                	push   $0x1
 38d:	e8 8e 04 00 00       	call   820 <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 01 0b 00 00       	push   $0xb01
 39a:	6a 01                	push   $0x1
 39c:	e8 7f 04 00 00       	call   820 <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 c0 0f 00 00    	push   0xfc0
 3aa:	e8 4c 03 00 00       	call   6fb <kill>
 3af:	e8 17 03 00 00       	call   6cb <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d b4 0f 00 00    	cmp    %ebx,0xfb4
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 d7 00 00 00       	call   49d <thread_join>
=======
 324:	68 b8 0a 00 00       	push   $0xab8
 329:	68 c2 0a 00 00       	push   $0xac2
 32e:	6a 01                	push   $0x1
 330:	e8 d4 04 00 00       	call   809 <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 41 0b 00 00       	push   $0xb41
 33d:	68 d5 0a 00 00       	push   $0xad5
 342:	6a 01                	push   $0x1
 344:	e8 c0 04 00 00       	call   809 <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 e9 0a 00 00       	push   $0xae9
 351:	6a 01                	push   $0x1
 353:	e8 b1 04 00 00       	call   809 <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 a0 0f 00 00    	push   0xfa0
 361:	e8 7e 03 00 00       	call   6e4 <kill>
 366:	e8 49 03 00 00       	call   6b4 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 b8 0a 00 00       	push   $0xab8
 372:	68 c2 0a 00 00       	push   $0xac2
 377:	6a 01                	push   $0x1
 379:	e8 8b 04 00 00       	call   809 <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 53 0b 00 00       	push   $0xb53
 386:	68 d5 0a 00 00       	push   $0xad5
 38b:	6a 01                	push   $0x1
 38d:	e8 77 04 00 00       	call   809 <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 e9 0a 00 00       	push   $0xae9
 39a:	6a 01                	push   $0x1
 39c:	e8 68 04 00 00       	call   809 <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 a0 0f 00 00    	push   0xfa0
 3aa:	e8 35 03 00 00       	call   6e4 <kill>
 3af:	e8 00 03 00 00       	call   6b4 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d 98 0f 00 00    	cmp    %ebx,0xf98
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 ed 00 00 00       	call   4b3 <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
<<<<<<< HEAD
 3d1:	68 d0 0a 00 00       	push   $0xad0
 3d6:	68 da 0a 00 00       	push   $0xada
 3db:	6a 01                	push   $0x1
 3dd:	e8 3e 04 00 00       	call   820 <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 7a 0b 00 00       	push   $0xb7a
 3ea:	68 ed 0a 00 00       	push   $0xaed
 3ef:	6a 01                	push   $0x1
 3f1:	e8 2a 04 00 00       	call   820 <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 01 0b 00 00       	push   $0xb01
 3fe:	6a 01                	push   $0x1
 400:	e8 1b 04 00 00       	call   820 <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 c0 0f 00 00    	push   0xfc0
 40e:	e8 e8 02 00 00       	call   6fb <kill>
 413:	e8 b3 02 00 00       	call   6cb <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 87 0b 00 00       	push   $0xb87
 420:	6a 01                	push   $0x1
 422:	e8 f9 03 00 00       	call   820 <printf>
   exit();
 427:	e8 9f 02 00 00       	call   6cb <exit>
=======
 3d1:	68 b8 0a 00 00       	push   $0xab8
 3d6:	68 c2 0a 00 00       	push   $0xac2
 3db:	6a 01                	push   $0x1
 3dd:	e8 27 04 00 00       	call   809 <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 62 0b 00 00       	push   $0xb62
 3ea:	68 d5 0a 00 00       	push   $0xad5
 3ef:	6a 01                	push   $0x1
 3f1:	e8 13 04 00 00       	call   809 <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 e9 0a 00 00       	push   $0xae9
 3fe:	6a 01                	push   $0x1
 400:	e8 04 04 00 00       	call   809 <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 a0 0f 00 00    	push   0xfa0
 40e:	e8 d1 02 00 00       	call   6e4 <kill>
 413:	e8 9c 02 00 00       	call   6b4 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 6f 0b 00 00       	push   $0xb6f
 420:	6a 01                	push   $0x1
 422:	e8 e2 03 00 00       	call   809 <printf>
   exit();
 427:	e8 88 02 00 00       	call   6b4 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000042c <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 432:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 434:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 437:	89 08                	mov    %ecx,(%eax)
  return old;
}
 439:	89 d0                	mov    %edx,%eax
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    

0000043d <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	53                   	push   %ebx
 441:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 444:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 449:	e8 f8 05 00 00       	call   a46 <malloc>
  if(n_stack == 0){
 44e:	83 c4 10             	add    $0x10,%esp
 451:	85 c0                	test   %eax,%eax
 453:	74 41                	je     496 <thread_create+0x59>
 455:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 457:	50                   	push   %eax
 458:	ff 75 10             	push   0x10(%ebp)
 45b:	ff 75 0c             	push   0xc(%ebp)
 45e:	ff 75 08             	push   0x8(%ebp)
 461:	e8 05 03 00 00       	call   76b <clone>
=======
 449:	e8 e1 05 00 00       	call   a2f <malloc>
  if(n_stack == 0){
 44e:	83 c4 10             	add    $0x10,%esp
 451:	85 c0                	test   %eax,%eax
 453:	74 57                	je     4ac <thread_create+0x6f>
 455:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 457:	b8 00 00 00 00       	mov    $0x0,%eax
 45c:	eb 03                	jmp    461 <thread_create+0x24>
 45e:	83 c0 01             	add    $0x1,%eax
 461:	83 f8 3f             	cmp    $0x3f,%eax
 464:	7f 2f                	jg     495 <thread_create+0x58>
    if(threads[i].flag==0){
 466:	8d 14 40             	lea    (%eax,%eax,2),%edx
 469:	83 3c 95 c8 0f 00 00 	cmpl   $0x0,0xfc8(,%edx,4)
 470:	00 
 471:	75 eb                	jne    45e <thread_create+0x21>
      threads[i].maddr = n_stack;
 473:	8d 14 00             	lea    (%eax,%eax,1),%edx
 476:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 479:	c1 e3 02             	shl    $0x2,%ebx
 47c:	89 8b c0 0f 00 00    	mov    %ecx,0xfc0(%ebx)
      threads[i].pg1addr = n_stack;
 482:	89 8b c4 0f 00 00    	mov    %ecx,0xfc4(%ebx)
      threads[i].flag = 1;
 488:	01 c2                	add    %eax,%edx
 48a:	c7 04 95 c8 0f 00 00 	movl   $0x1,0xfc8(,%edx,4)
 491:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 495:	51                   	push   %ecx
 496:	ff 75 10             	push   0x10(%ebp)
 499:	ff 75 0c             	push   0xc(%ebp)
 49c:	ff 75 08             	push   0x8(%ebp)
 49f:	e8 b0 02 00 00       	call   754 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 466:	83 c4 10             	add    $0x10,%esp
 469:	ba 00 00 00 00       	mov    $0x0,%edx
 46e:	eb 03                	jmp    473 <thread_create+0x36>
 470:	83 c2 01             	add    $0x1,%edx
 473:	83 fa 3f             	cmp    $0x3f,%edx
 476:	7f 19                	jg     491 <thread_create+0x54>
    if(threads[i]->flag==0){
 478:	8b 0c 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%ecx
 47f:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 483:	75 eb                	jne    470 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 485:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 487:	8b 14 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%edx
 48e:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 491:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 494:	c9                   	leave  
 495:	c3                   	ret    
    return -1;
 496:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 49b:	eb f4                	jmp    491 <thread_create+0x54>

0000049d <thread_join>:
=======
 4a4:	83 c4 10             	add    $0x10,%esp
}
 4a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4aa:	c9                   	leave  
 4ab:	c3                   	ret    
    return -1;
 4ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4b1:	eb f4                	jmp    4a7 <thread_create+0x6a>

000004b3 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 49d:	55                   	push   %ebp
 49e:	89 e5                	mov    %esp,%ebp
 4a0:	56                   	push   %esi
 4a1:	53                   	push   %ebx
 4a2:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4a5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a8:	50                   	push   %eax
 4a9:	e8 c5 02 00 00       	call   773 <join>
 4ae:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 4b0:	83 c4 10             	add    $0x10,%esp
 4b3:	bb 00 00 00 00       	mov    $0x0,%ebx
 4b8:	eb 03                	jmp    4bd <thread_join+0x20>
 4ba:	83 c3 01             	add    $0x1,%ebx
 4bd:	83 fb 3f             	cmp    $0x3f,%ebx
 4c0:	7f 23                	jg     4e5 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 4c2:	8b 04 9d e0 0f 00 00 	mov    0xfe0(,%ebx,4),%eax
 4c9:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 4cd:	75 eb                	jne    4ba <thread_join+0x1d>
 4cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d2:	39 50 04             	cmp    %edx,0x4(%eax)
 4d5:	75 e3                	jne    4ba <thread_join+0x1d>
      free(stk_addr);
 4d7:	83 ec 0c             	sub    $0xc,%esp
 4da:	52                   	push   %edx
 4db:	e8 a6 04 00 00       	call   986 <free>
 4e0:	83 c4 10             	add    $0x10,%esp
 4e3:	eb d5                	jmp    4ba <thread_join+0x1d>
    }
  }
  return pid;
}
 4e5:	89 f0                	mov    %esi,%eax
 4e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ea:	5b                   	pop    %ebx
 4eb:	5e                   	pop    %esi
 4ec:	5d                   	pop    %ebp
 4ed:	c3                   	ret    

000004ee <lock_acquire>:

void lock_acquire(lock_t *lock){
 4ee:	55                   	push   %ebp
 4ef:	89 e5                	mov    %esp,%ebp
 4f1:	53                   	push   %ebx
 4f2:	83 ec 04             	sub    $0x4,%esp
 4f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4f8:	83 ec 08             	sub    $0x8,%esp
 4fb:	6a 01                	push   $0x1
 4fd:	53                   	push   %ebx
 4fe:	e8 29 ff ff ff       	call   42c <test_and_set>
 503:	83 c4 10             	add    $0x10,%esp
 506:	83 f8 01             	cmp    $0x1,%eax
 509:	74 ed                	je     4f8 <lock_acquire+0xa>
    ;
}
 50b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 50e:	c9                   	leave  
 50f:	c3                   	ret    

00000510 <lock_release>:

void lock_release(lock_t *lock) {
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret    

0000051e <lock_init>:

void lock_init(lock_t *lock) {
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 52a:	5d                   	pop    %ebp
 52b:	c3                   	ret    

0000052c <strcpy>:
=======
 4b3:	55                   	push   %ebp
 4b4:	89 e5                	mov    %esp,%ebp
 4b6:	53                   	push   %ebx
 4b7:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4ba:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4bd:	50                   	push   %eax
 4be:	e8 99 02 00 00       	call   75c <join>
 4c3:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 4c5:	83 c4 04             	add    $0x4,%esp
 4c8:	ff 75 f4             	push   -0xc(%ebp)
 4cb:	e8 9f 04 00 00       	call   96f <free>
  return pid;
}
 4d0:	89 d8                	mov    %ebx,%eax
 4d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d5:	c9                   	leave  
 4d6:	c3                   	ret    

000004d7 <lock_acquire>:

void lock_acquire(lock_t *lock){
 4d7:	55                   	push   %ebp
 4d8:	89 e5                	mov    %esp,%ebp
 4da:	53                   	push   %ebx
 4db:	83 ec 04             	sub    $0x4,%esp
 4de:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4e1:	83 ec 08             	sub    $0x8,%esp
 4e4:	6a 01                	push   $0x1
 4e6:	53                   	push   %ebx
 4e7:	e8 40 ff ff ff       	call   42c <test_and_set>
 4ec:	83 c4 10             	add    $0x10,%esp
 4ef:	83 f8 01             	cmp    $0x1,%eax
 4f2:	74 ed                	je     4e1 <lock_acquire+0xa>
    ;
}
 4f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4f7:	c9                   	leave  
 4f8:	c3                   	ret    

000004f9 <lock_release>:

void lock_release(lock_t *lock) {
 4f9:	55                   	push   %ebp
 4fa:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4fc:	8b 45 08             	mov    0x8(%ebp),%eax
 4ff:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 505:	5d                   	pop    %ebp
 506:	c3                   	ret    

00000507 <lock_init>:

void lock_init(lock_t *lock) {
 507:	55                   	push   %ebp
 508:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 50a:	8b 45 08             	mov    0x8(%ebp),%eax
 50d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 513:	5d                   	pop    %ebp
 514:	c3                   	ret    

00000515 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	56                   	push   %esi
 530:	53                   	push   %ebx
 531:	8b 75 08             	mov    0x8(%ebp),%esi
 534:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 515:	55                   	push   %ebp
 516:	89 e5                	mov    %esp,%ebp
 518:	56                   	push   %esi
 519:	53                   	push   %ebx
 51a:	8b 75 08             	mov    0x8(%ebp),%esi
 51d:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 537:	89 f0                	mov    %esi,%eax
 539:	89 d1                	mov    %edx,%ecx
 53b:	83 c2 01             	add    $0x1,%edx
 53e:	89 c3                	mov    %eax,%ebx
 540:	83 c0 01             	add    $0x1,%eax
 543:	0f b6 09             	movzbl (%ecx),%ecx
 546:	88 0b                	mov    %cl,(%ebx)
 548:	84 c9                	test   %cl,%cl
 54a:	75 ed                	jne    539 <strcpy+0xd>
    ;
  return os;
}
 54c:	89 f0                	mov    %esi,%eax
 54e:	5b                   	pop    %ebx
 54f:	5e                   	pop    %esi
 550:	5d                   	pop    %ebp
 551:	c3                   	ret    

00000552 <strcmp>:
=======
 520:	89 f0                	mov    %esi,%eax
 522:	89 d1                	mov    %edx,%ecx
 524:	83 c2 01             	add    $0x1,%edx
 527:	89 c3                	mov    %eax,%ebx
 529:	83 c0 01             	add    $0x1,%eax
 52c:	0f b6 09             	movzbl (%ecx),%ecx
 52f:	88 0b                	mov    %cl,(%ebx)
 531:	84 c9                	test   %cl,%cl
 533:	75 ed                	jne    522 <strcpy+0xd>
    ;
  return os;
}
 535:	89 f0                	mov    %esi,%eax
 537:	5b                   	pop    %ebx
 538:	5e                   	pop    %esi
 539:	5d                   	pop    %ebp
 53a:	c3                   	ret    

0000053b <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 552:	55                   	push   %ebp
 553:	89 e5                	mov    %esp,%ebp
 555:	8b 4d 08             	mov    0x8(%ebp),%ecx
 558:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 55b:	eb 06                	jmp    563 <strcmp+0x11>
    p++, q++;
 55d:	83 c1 01             	add    $0x1,%ecx
 560:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 563:	0f b6 01             	movzbl (%ecx),%eax
 566:	84 c0                	test   %al,%al
 568:	74 04                	je     56e <strcmp+0x1c>
 56a:	3a 02                	cmp    (%edx),%al
 56c:	74 ef                	je     55d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 56e:	0f b6 c0             	movzbl %al,%eax
 571:	0f b6 12             	movzbl (%edx),%edx
 574:	29 d0                	sub    %edx,%eax
}
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    

00000578 <strlen>:
=======
 53b:	55                   	push   %ebp
 53c:	89 e5                	mov    %esp,%ebp
 53e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 541:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 544:	eb 06                	jmp    54c <strcmp+0x11>
    p++, q++;
 546:	83 c1 01             	add    $0x1,%ecx
 549:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 54c:	0f b6 01             	movzbl (%ecx),%eax
 54f:	84 c0                	test   %al,%al
 551:	74 04                	je     557 <strcmp+0x1c>
 553:	3a 02                	cmp    (%edx),%al
 555:	74 ef                	je     546 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 557:	0f b6 c0             	movzbl %al,%eax
 55a:	0f b6 12             	movzbl (%edx),%edx
 55d:	29 d0                	sub    %edx,%eax
}
 55f:	5d                   	pop    %ebp
 560:	c3                   	ret    

00000561 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 578:	55                   	push   %ebp
 579:	89 e5                	mov    %esp,%ebp
 57b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 57e:	b8 00 00 00 00       	mov    $0x0,%eax
 583:	eb 03                	jmp    588 <strlen+0x10>
 585:	83 c0 01             	add    $0x1,%eax
 588:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 58c:	75 f7                	jne    585 <strlen+0xd>
    ;
  return n;
}
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    

00000590 <memset>:
=======
 561:	55                   	push   %ebp
 562:	89 e5                	mov    %esp,%ebp
 564:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 567:	b8 00 00 00 00       	mov    $0x0,%eax
 56c:	eb 03                	jmp    571 <strlen+0x10>
 56e:	83 c0 01             	add    $0x1,%eax
 571:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 575:	75 f7                	jne    56e <strlen+0xd>
    ;
  return n;
}
 577:	5d                   	pop    %ebp
 578:	c3                   	ret    

00000579 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 579:	55                   	push   %ebp
 57a:	89 e5                	mov    %esp,%ebp
 57c:	57                   	push   %edi
 57d:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 597:	89 d7                	mov    %edx,%edi
 599:	8b 4d 10             	mov    0x10(%ebp),%ecx
 59c:	8b 45 0c             	mov    0xc(%ebp),%eax
 59f:	fc                   	cld    
 5a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5a2:	89 d0                	mov    %edx,%eax
 5a4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 5a7:	c9                   	leave  
 5a8:	c3                   	ret    

000005a9 <strchr>:
=======
 580:	89 d7                	mov    %edx,%edi
 582:	8b 4d 10             	mov    0x10(%ebp),%ecx
 585:	8b 45 0c             	mov    0xc(%ebp),%eax
 588:	fc                   	cld    
 589:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 58b:	89 d0                	mov    %edx,%eax
 58d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 590:	c9                   	leave  
 591:	c3                   	ret    

00000592 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 5a9:	55                   	push   %ebp
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	8b 45 08             	mov    0x8(%ebp),%eax
 5af:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5b3:	eb 03                	jmp    5b8 <strchr+0xf>
 5b5:	83 c0 01             	add    $0x1,%eax
 5b8:	0f b6 10             	movzbl (%eax),%edx
 5bb:	84 d2                	test   %dl,%dl
 5bd:	74 06                	je     5c5 <strchr+0x1c>
    if(*s == c)
 5bf:	38 ca                	cmp    %cl,%dl
 5c1:	75 f2                	jne    5b5 <strchr+0xc>
 5c3:	eb 05                	jmp    5ca <strchr+0x21>
      return (char*)s;
  return 0;
 5c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 5ca:	5d                   	pop    %ebp
 5cb:	c3                   	ret    

000005cc <gets>:
=======
 592:	55                   	push   %ebp
 593:	89 e5                	mov    %esp,%ebp
 595:	8b 45 08             	mov    0x8(%ebp),%eax
 598:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 59c:	eb 03                	jmp    5a1 <strchr+0xf>
 59e:	83 c0 01             	add    $0x1,%eax
 5a1:	0f b6 10             	movzbl (%eax),%edx
 5a4:	84 d2                	test   %dl,%dl
 5a6:	74 06                	je     5ae <strchr+0x1c>
    if(*s == c)
 5a8:	38 ca                	cmp    %cl,%dl
 5aa:	75 f2                	jne    59e <strchr+0xc>
 5ac:	eb 05                	jmp    5b3 <strchr+0x21>
      return (char*)s;
  return 0;
 5ae:	b8 00 00 00 00       	mov    $0x0,%eax
}
 5b3:	5d                   	pop    %ebp
 5b4:	c3                   	ret    

000005b5 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 5cc:	55                   	push   %ebp
 5cd:	89 e5                	mov    %esp,%ebp
 5cf:	57                   	push   %edi
 5d0:	56                   	push   %esi
 5d1:	53                   	push   %ebx
 5d2:	83 ec 1c             	sub    $0x1c,%esp
 5d5:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 5b5:	55                   	push   %ebp
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	57                   	push   %edi
 5b9:	56                   	push   %esi
 5ba:	53                   	push   %ebx
 5bb:	83 ec 1c             	sub    $0x1c,%esp
 5be:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 5d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 5dd:	89 de                	mov    %ebx,%esi
 5df:	83 c3 01             	add    $0x1,%ebx
 5e2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5e5:	7d 2e                	jge    615 <gets+0x49>
    cc = read(0, &c, 1);
 5e7:	83 ec 04             	sub    $0x4,%esp
 5ea:	6a 01                	push   $0x1
 5ec:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5ef:	50                   	push   %eax
 5f0:	6a 00                	push   $0x0
 5f2:	e8 ec 00 00 00       	call   6e3 <read>
    if(cc < 1)
 5f7:	83 c4 10             	add    $0x10,%esp
 5fa:	85 c0                	test   %eax,%eax
 5fc:	7e 17                	jle    615 <gets+0x49>
      break;
    buf[i++] = c;
 5fe:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 602:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 605:	3c 0a                	cmp    $0xa,%al
 607:	0f 94 c2             	sete   %dl
 60a:	3c 0d                	cmp    $0xd,%al
 60c:	0f 94 c0             	sete   %al
 60f:	08 c2                	or     %al,%dl
 611:	74 ca                	je     5dd <gets+0x11>
    buf[i++] = c;
 613:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 615:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 619:	89 f8                	mov    %edi,%eax
 61b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61e:	5b                   	pop    %ebx
 61f:	5e                   	pop    %esi
 620:	5f                   	pop    %edi
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    

00000623 <stat>:
=======
 5c1:	bb 00 00 00 00       	mov    $0x0,%ebx
 5c6:	89 de                	mov    %ebx,%esi
 5c8:	83 c3 01             	add    $0x1,%ebx
 5cb:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5ce:	7d 2e                	jge    5fe <gets+0x49>
    cc = read(0, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	6a 01                	push   $0x1
 5d5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5d8:	50                   	push   %eax
 5d9:	6a 00                	push   $0x0
 5db:	e8 ec 00 00 00       	call   6cc <read>
    if(cc < 1)
 5e0:	83 c4 10             	add    $0x10,%esp
 5e3:	85 c0                	test   %eax,%eax
 5e5:	7e 17                	jle    5fe <gets+0x49>
      break;
    buf[i++] = c;
 5e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5eb:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5ee:	3c 0a                	cmp    $0xa,%al
 5f0:	0f 94 c2             	sete   %dl
 5f3:	3c 0d                	cmp    $0xd,%al
 5f5:	0f 94 c0             	sete   %al
 5f8:	08 c2                	or     %al,%dl
 5fa:	74 ca                	je     5c6 <gets+0x11>
    buf[i++] = c;
 5fc:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5fe:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 602:	89 f8                	mov    %edi,%eax
 604:	8d 65 f4             	lea    -0xc(%ebp),%esp
 607:	5b                   	pop    %ebx
 608:	5e                   	pop    %esi
 609:	5f                   	pop    %edi
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret    

0000060c <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 623:	55                   	push   %ebp
 624:	89 e5                	mov    %esp,%ebp
 626:	56                   	push   %esi
 627:	53                   	push   %ebx
=======
 60c:	55                   	push   %ebp
 60d:	89 e5                	mov    %esp,%ebp
 60f:	56                   	push   %esi
 610:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 628:	83 ec 08             	sub    $0x8,%esp
 62b:	6a 00                	push   $0x0
 62d:	ff 75 08             	push   0x8(%ebp)
 630:	e8 d6 00 00 00       	call   70b <open>
  if(fd < 0)
 635:	83 c4 10             	add    $0x10,%esp
 638:	85 c0                	test   %eax,%eax
 63a:	78 24                	js     660 <stat+0x3d>
 63c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 63e:	83 ec 08             	sub    $0x8,%esp
 641:	ff 75 0c             	push   0xc(%ebp)
 644:	50                   	push   %eax
 645:	e8 d9 00 00 00       	call   723 <fstat>
 64a:	89 c6                	mov    %eax,%esi
  close(fd);
 64c:	89 1c 24             	mov    %ebx,(%esp)
 64f:	e8 9f 00 00 00       	call   6f3 <close>
  return r;
 654:	83 c4 10             	add    $0x10,%esp
}
 657:	89 f0                	mov    %esi,%eax
 659:	8d 65 f8             	lea    -0x8(%ebp),%esp
 65c:	5b                   	pop    %ebx
 65d:	5e                   	pop    %esi
 65e:	5d                   	pop    %ebp
 65f:	c3                   	ret    
    return -1;
 660:	be ff ff ff ff       	mov    $0xffffffff,%esi
 665:	eb f0                	jmp    657 <stat+0x34>

00000667 <atoi>:
=======
 611:	83 ec 08             	sub    $0x8,%esp
 614:	6a 00                	push   $0x0
 616:	ff 75 08             	push   0x8(%ebp)
 619:	e8 d6 00 00 00       	call   6f4 <open>
  if(fd < 0)
 61e:	83 c4 10             	add    $0x10,%esp
 621:	85 c0                	test   %eax,%eax
 623:	78 24                	js     649 <stat+0x3d>
 625:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 627:	83 ec 08             	sub    $0x8,%esp
 62a:	ff 75 0c             	push   0xc(%ebp)
 62d:	50                   	push   %eax
 62e:	e8 d9 00 00 00       	call   70c <fstat>
 633:	89 c6                	mov    %eax,%esi
  close(fd);
 635:	89 1c 24             	mov    %ebx,(%esp)
 638:	e8 9f 00 00 00       	call   6dc <close>
  return r;
 63d:	83 c4 10             	add    $0x10,%esp
}
 640:	89 f0                	mov    %esi,%eax
 642:	8d 65 f8             	lea    -0x8(%ebp),%esp
 645:	5b                   	pop    %ebx
 646:	5e                   	pop    %esi
 647:	5d                   	pop    %ebp
 648:	c3                   	ret    
    return -1;
 649:	be ff ff ff ff       	mov    $0xffffffff,%esi
 64e:	eb f0                	jmp    640 <stat+0x34>

00000650 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 667:	55                   	push   %ebp
 668:	89 e5                	mov    %esp,%ebp
 66a:	53                   	push   %ebx
 66b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 66e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 673:	eb 10                	jmp    685 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 675:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 678:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 67b:	83 c1 01             	add    $0x1,%ecx
 67e:	0f be c0             	movsbl %al,%eax
 681:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 685:	0f b6 01             	movzbl (%ecx),%eax
 688:	8d 58 d0             	lea    -0x30(%eax),%ebx
 68b:	80 fb 09             	cmp    $0x9,%bl
 68e:	76 e5                	jbe    675 <atoi+0xe>
  return n;
}
 690:	89 d0                	mov    %edx,%eax
 692:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 695:	c9                   	leave  
 696:	c3                   	ret    

00000697 <memmove>:
=======
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	53                   	push   %ebx
 654:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 657:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 65c:	eb 10                	jmp    66e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 65e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 661:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 664:	83 c1 01             	add    $0x1,%ecx
 667:	0f be c0             	movsbl %al,%eax
 66a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 66e:	0f b6 01             	movzbl (%ecx),%eax
 671:	8d 58 d0             	lea    -0x30(%eax),%ebx
 674:	80 fb 09             	cmp    $0x9,%bl
 677:	76 e5                	jbe    65e <atoi+0xe>
  return n;
}
 679:	89 d0                	mov    %edx,%eax
 67b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 67e:	c9                   	leave  
 67f:	c3                   	ret    

00000680 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 697:	55                   	push   %ebp
 698:	89 e5                	mov    %esp,%ebp
 69a:	56                   	push   %esi
 69b:	53                   	push   %ebx
 69c:	8b 75 08             	mov    0x8(%ebp),%esi
 69f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 6a2:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	56                   	push   %esi
 684:	53                   	push   %ebx
 685:	8b 75 08             	mov    0x8(%ebp),%esi
 688:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 68b:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 6a5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 6a7:	eb 0d                	jmp    6b6 <memmove+0x1f>
    *dst++ = *src++;
 6a9:	0f b6 01             	movzbl (%ecx),%eax
 6ac:	88 02                	mov    %al,(%edx)
 6ae:	8d 49 01             	lea    0x1(%ecx),%ecx
 6b1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 6b4:	89 d8                	mov    %ebx,%eax
 6b6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 6b9:	85 c0                	test   %eax,%eax
 6bb:	7f ec                	jg     6a9 <memmove+0x12>
  return vdst;
}
 6bd:	89 f0                	mov    %esi,%eax
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5d                   	pop    %ebp
 6c2:	c3                   	ret    

000006c3 <fork>:
=======
 68e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 690:	eb 0d                	jmp    69f <memmove+0x1f>
    *dst++ = *src++;
 692:	0f b6 01             	movzbl (%ecx),%eax
 695:	88 02                	mov    %al,(%edx)
 697:	8d 49 01             	lea    0x1(%ecx),%ecx
 69a:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 69d:	89 d8                	mov    %ebx,%eax
 69f:	8d 58 ff             	lea    -0x1(%eax),%ebx
 6a2:	85 c0                	test   %eax,%eax
 6a4:	7f ec                	jg     692 <memmove+0x12>
  return vdst;
}
 6a6:	89 f0                	mov    %esi,%eax
 6a8:	5b                   	pop    %ebx
 6a9:	5e                   	pop    %esi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret    

000006ac <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 6c3:	b8 01 00 00 00       	mov    $0x1,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <exit>:
SYSCALL(exit)
 6cb:	b8 02 00 00 00       	mov    $0x2,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <wait>:
SYSCALL(wait)
 6d3:	b8 03 00 00 00       	mov    $0x3,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <pipe>:
SYSCALL(pipe)
 6db:	b8 04 00 00 00       	mov    $0x4,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <read>:
SYSCALL(read)
 6e3:	b8 05 00 00 00       	mov    $0x5,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <write>:
SYSCALL(write)
 6eb:	b8 10 00 00 00       	mov    $0x10,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <close>:
SYSCALL(close)
 6f3:	b8 15 00 00 00       	mov    $0x15,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <kill>:
SYSCALL(kill)
 6fb:	b8 06 00 00 00       	mov    $0x6,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <exec>:
SYSCALL(exec)
 703:	b8 07 00 00 00       	mov    $0x7,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <open>:
SYSCALL(open)
 70b:	b8 0f 00 00 00       	mov    $0xf,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <mknod>:
SYSCALL(mknod)
 713:	b8 11 00 00 00       	mov    $0x11,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <unlink>:
SYSCALL(unlink)
 71b:	b8 12 00 00 00       	mov    $0x12,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <fstat>:
SYSCALL(fstat)
 723:	b8 08 00 00 00       	mov    $0x8,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <link>:
SYSCALL(link)
 72b:	b8 13 00 00 00       	mov    $0x13,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <mkdir>:
SYSCALL(mkdir)
 733:	b8 14 00 00 00       	mov    $0x14,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <chdir>:
SYSCALL(chdir)
 73b:	b8 09 00 00 00       	mov    $0x9,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <dup>:
SYSCALL(dup)
 743:	b8 0a 00 00 00       	mov    $0xa,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <getpid>:
SYSCALL(getpid)
 74b:	b8 0b 00 00 00       	mov    $0xb,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <sbrk>:
SYSCALL(sbrk)
 753:	b8 0c 00 00 00       	mov    $0xc,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <sleep>:
SYSCALL(sleep)
 75b:	b8 0d 00 00 00       	mov    $0xd,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <uptime>:
SYSCALL(uptime)
 763:	b8 0e 00 00 00       	mov    $0xe,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <clone>:
SYSCALL(clone)
 76b:	b8 16 00 00 00       	mov    $0x16,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <join>:
 773:	b8 17 00 00 00       	mov    $0x17,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <putc>:
=======
 6ac:	b8 01 00 00 00       	mov    $0x1,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <exit>:
SYSCALL(exit)
 6b4:	b8 02 00 00 00       	mov    $0x2,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <wait>:
SYSCALL(wait)
 6bc:	b8 03 00 00 00       	mov    $0x3,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <pipe>:
SYSCALL(pipe)
 6c4:	b8 04 00 00 00       	mov    $0x4,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <read>:
SYSCALL(read)
 6cc:	b8 05 00 00 00       	mov    $0x5,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <write>:
SYSCALL(write)
 6d4:	b8 10 00 00 00       	mov    $0x10,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <close>:
SYSCALL(close)
 6dc:	b8 15 00 00 00       	mov    $0x15,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <kill>:
SYSCALL(kill)
 6e4:	b8 06 00 00 00       	mov    $0x6,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <exec>:
SYSCALL(exec)
 6ec:	b8 07 00 00 00       	mov    $0x7,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <open>:
SYSCALL(open)
 6f4:	b8 0f 00 00 00       	mov    $0xf,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <mknod>:
SYSCALL(mknod)
 6fc:	b8 11 00 00 00       	mov    $0x11,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <unlink>:
SYSCALL(unlink)
 704:	b8 12 00 00 00       	mov    $0x12,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <fstat>:
SYSCALL(fstat)
 70c:	b8 08 00 00 00       	mov    $0x8,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <link>:
SYSCALL(link)
 714:	b8 13 00 00 00       	mov    $0x13,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <mkdir>:
SYSCALL(mkdir)
 71c:	b8 14 00 00 00       	mov    $0x14,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <chdir>:
SYSCALL(chdir)
 724:	b8 09 00 00 00       	mov    $0x9,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <dup>:
SYSCALL(dup)
 72c:	b8 0a 00 00 00       	mov    $0xa,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    

00000734 <getpid>:
SYSCALL(getpid)
 734:	b8 0b 00 00 00       	mov    $0xb,%eax
 739:	cd 40                	int    $0x40
 73b:	c3                   	ret    

0000073c <sbrk>:
SYSCALL(sbrk)
 73c:	b8 0c 00 00 00       	mov    $0xc,%eax
 741:	cd 40                	int    $0x40
 743:	c3                   	ret    

00000744 <sleep>:
SYSCALL(sleep)
 744:	b8 0d 00 00 00       	mov    $0xd,%eax
 749:	cd 40                	int    $0x40
 74b:	c3                   	ret    

0000074c <uptime>:
SYSCALL(uptime)
 74c:	b8 0e 00 00 00       	mov    $0xe,%eax
 751:	cd 40                	int    $0x40
 753:	c3                   	ret    

00000754 <clone>:
SYSCALL(clone)
 754:	b8 16 00 00 00       	mov    $0x16,%eax
 759:	cd 40                	int    $0x40
 75b:	c3                   	ret    

0000075c <join>:
 75c:	b8 17 00 00 00       	mov    $0x17,%eax
 761:	cd 40                	int    $0x40
 763:	c3                   	ret    

00000764 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 77b:	55                   	push   %ebp
 77c:	89 e5                	mov    %esp,%ebp
 77e:	83 ec 1c             	sub    $0x1c,%esp
 781:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 784:	6a 01                	push   $0x1
 786:	8d 55 f4             	lea    -0xc(%ebp),%edx
 789:	52                   	push   %edx
 78a:	50                   	push   %eax
 78b:	e8 5b ff ff ff       	call   6eb <write>
}
 790:	83 c4 10             	add    $0x10,%esp
 793:	c9                   	leave  
 794:	c3                   	ret    

00000795 <printint>:
=======
 764:	55                   	push   %ebp
 765:	89 e5                	mov    %esp,%ebp
 767:	83 ec 1c             	sub    $0x1c,%esp
 76a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 76d:	6a 01                	push   $0x1
 76f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 772:	52                   	push   %edx
 773:	50                   	push   %eax
 774:	e8 5b ff ff ff       	call   6d4 <write>
}
 779:	83 c4 10             	add    $0x10,%esp
 77c:	c9                   	leave  
 77d:	c3                   	ret    

0000077e <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 795:	55                   	push   %ebp
 796:	89 e5                	mov    %esp,%ebp
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	83 ec 2c             	sub    $0x2c,%esp
 79e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7a1:	89 d0                	mov    %edx,%eax
 7a3:	89 ce                	mov    %ecx,%esi
=======
 77e:	55                   	push   %ebp
 77f:	89 e5                	mov    %esp,%ebp
 781:	57                   	push   %edi
 782:	56                   	push   %esi
 783:	53                   	push   %ebx
 784:	83 ec 2c             	sub    $0x2c,%esp
 787:	89 45 d0             	mov    %eax,-0x30(%ebp)
 78a:	89 d0                	mov    %edx,%eax
 78c:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 7a5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7a9:	0f 95 c1             	setne  %cl
 7ac:	c1 ea 1f             	shr    $0x1f,%edx
 7af:	84 d1                	test   %dl,%cl
 7b1:	74 44                	je     7f7 <printint+0x62>
    neg = 1;
    x = -xx;
 7b3:	f7 d8                	neg    %eax
 7b5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7b7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 78e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 792:	0f 95 c1             	setne  %cl
 795:	c1 ea 1f             	shr    $0x1f,%edx
 798:	84 d1                	test   %dl,%cl
 79a:	74 44                	je     7e0 <printint+0x62>
    neg = 1;
    x = -xx;
 79c:	f7 d8                	neg    %eax
 79e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7a0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 7be:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7c3:	89 c8                	mov    %ecx,%eax
 7c5:	ba 00 00 00 00       	mov    $0x0,%edx
 7ca:	f7 f6                	div    %esi
 7cc:	89 df                	mov    %ebx,%edi
 7ce:	83 c3 01             	add    $0x1,%ebx
 7d1:	0f b6 92 f4 0b 00 00 	movzbl 0xbf4(%edx),%edx
 7d8:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7dc:	89 ca                	mov    %ecx,%edx
 7de:	89 c1                	mov    %eax,%ecx
 7e0:	39 d6                	cmp    %edx,%esi
 7e2:	76 df                	jbe    7c3 <printint+0x2e>
  if(neg)
 7e4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7e8:	74 31                	je     81b <printint+0x86>
    buf[i++] = '-';
 7ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7ef:	8d 5f 02             	lea    0x2(%edi),%ebx
 7f2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7f5:	eb 17                	jmp    80e <printint+0x79>
    x = xx;
 7f7:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7f9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 800:	eb bc                	jmp    7be <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 802:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 807:	89 f0                	mov    %esi,%eax
 809:	e8 6d ff ff ff       	call   77b <putc>
  while(--i >= 0)
 80e:	83 eb 01             	sub    $0x1,%ebx
 811:	79 ef                	jns    802 <printint+0x6d>
}
 813:	83 c4 2c             	add    $0x2c,%esp
 816:	5b                   	pop    %ebx
 817:	5e                   	pop    %esi
 818:	5f                   	pop    %edi
 819:	5d                   	pop    %ebp
 81a:	c3                   	ret    
 81b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 81e:	eb ee                	jmp    80e <printint+0x79>

00000820 <printf>:
=======
 7a7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7ac:	89 c8                	mov    %ecx,%eax
 7ae:	ba 00 00 00 00       	mov    $0x0,%edx
 7b3:	f7 f6                	div    %esi
 7b5:	89 df                	mov    %ebx,%edi
 7b7:	83 c3 01             	add    $0x1,%ebx
 7ba:	0f b6 92 dc 0b 00 00 	movzbl 0xbdc(%edx),%edx
 7c1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7c5:	89 ca                	mov    %ecx,%edx
 7c7:	89 c1                	mov    %eax,%ecx
 7c9:	39 d6                	cmp    %edx,%esi
 7cb:	76 df                	jbe    7ac <printint+0x2e>
  if(neg)
 7cd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7d1:	74 31                	je     804 <printint+0x86>
    buf[i++] = '-';
 7d3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7d8:	8d 5f 02             	lea    0x2(%edi),%ebx
 7db:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7de:	eb 17                	jmp    7f7 <printint+0x79>
    x = xx;
 7e0:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7e2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7e9:	eb bc                	jmp    7a7 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7eb:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7f0:	89 f0                	mov    %esi,%eax
 7f2:	e8 6d ff ff ff       	call   764 <putc>
  while(--i >= 0)
 7f7:	83 eb 01             	sub    $0x1,%ebx
 7fa:	79 ef                	jns    7eb <printint+0x6d>
}
 7fc:	83 c4 2c             	add    $0x2c,%esp
 7ff:	5b                   	pop    %ebx
 800:	5e                   	pop    %esi
 801:	5f                   	pop    %edi
 802:	5d                   	pop    %ebp
 803:	c3                   	ret    
 804:	8b 75 d0             	mov    -0x30(%ebp),%esi
 807:	eb ee                	jmp    7f7 <printint+0x79>

00000809 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 1c             	sub    $0x1c,%esp
=======
 809:	55                   	push   %ebp
 80a:	89 e5                	mov    %esp,%ebp
 80c:	57                   	push   %edi
 80d:	56                   	push   %esi
 80e:	53                   	push   %ebx
 80f:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 829:	8d 45 10             	lea    0x10(%ebp),%eax
 82c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 82f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 834:	bb 00 00 00 00       	mov    $0x0,%ebx
 839:	eb 14                	jmp    84f <printf+0x2f>
=======
 812:	8d 45 10             	lea    0x10(%ebp),%eax
 815:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 818:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 81d:	bb 00 00 00 00       	mov    $0x0,%ebx
 822:	eb 14                	jmp    838 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 83b:	89 fa                	mov    %edi,%edx
 83d:	8b 45 08             	mov    0x8(%ebp),%eax
 840:	e8 36 ff ff ff       	call   77b <putc>
 845:	eb 05                	jmp    84c <printf+0x2c>
      }
    } else if(state == '%'){
 847:	83 fe 25             	cmp    $0x25,%esi
 84a:	74 25                	je     871 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 84c:	83 c3 01             	add    $0x1,%ebx
 84f:	8b 45 0c             	mov    0xc(%ebp),%eax
 852:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 856:	84 c0                	test   %al,%al
 858:	0f 84 20 01 00 00    	je     97e <printf+0x15e>
    c = fmt[i] & 0xff;
 85e:	0f be f8             	movsbl %al,%edi
 861:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 864:	85 f6                	test   %esi,%esi
 866:	75 df                	jne    847 <printf+0x27>
      if(c == '%'){
 868:	83 f8 25             	cmp    $0x25,%eax
 86b:	75 ce                	jne    83b <printf+0x1b>
        state = '%';
 86d:	89 c6                	mov    %eax,%esi
 86f:	eb db                	jmp    84c <printf+0x2c>
      if(c == 'd'){
 871:	83 f8 25             	cmp    $0x25,%eax
 874:	0f 84 cf 00 00 00    	je     949 <printf+0x129>
 87a:	0f 8c dd 00 00 00    	jl     95d <printf+0x13d>
 880:	83 f8 78             	cmp    $0x78,%eax
 883:	0f 8f d4 00 00 00    	jg     95d <printf+0x13d>
 889:	83 f8 63             	cmp    $0x63,%eax
 88c:	0f 8c cb 00 00 00    	jl     95d <printf+0x13d>
 892:	83 e8 63             	sub    $0x63,%eax
 895:	83 f8 15             	cmp    $0x15,%eax
 898:	0f 87 bf 00 00 00    	ja     95d <printf+0x13d>
 89e:	ff 24 85 9c 0b 00 00 	jmp    *0xb9c(,%eax,4)
        printint(fd, *ap, 10, 1);
 8a5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8a8:	8b 17                	mov    (%edi),%edx
 8aa:	83 ec 0c             	sub    $0xc,%esp
 8ad:	6a 01                	push   $0x1
 8af:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8b4:	8b 45 08             	mov    0x8(%ebp),%eax
 8b7:	e8 d9 fe ff ff       	call   795 <printint>
        ap++;
 8bc:	83 c7 04             	add    $0x4,%edi
 8bf:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8c2:	83 c4 10             	add    $0x10,%esp
=======
 824:	89 fa                	mov    %edi,%edx
 826:	8b 45 08             	mov    0x8(%ebp),%eax
 829:	e8 36 ff ff ff       	call   764 <putc>
 82e:	eb 05                	jmp    835 <printf+0x2c>
      }
    } else if(state == '%'){
 830:	83 fe 25             	cmp    $0x25,%esi
 833:	74 25                	je     85a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 835:	83 c3 01             	add    $0x1,%ebx
 838:	8b 45 0c             	mov    0xc(%ebp),%eax
 83b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 83f:	84 c0                	test   %al,%al
 841:	0f 84 20 01 00 00    	je     967 <printf+0x15e>
    c = fmt[i] & 0xff;
 847:	0f be f8             	movsbl %al,%edi
 84a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 84d:	85 f6                	test   %esi,%esi
 84f:	75 df                	jne    830 <printf+0x27>
      if(c == '%'){
 851:	83 f8 25             	cmp    $0x25,%eax
 854:	75 ce                	jne    824 <printf+0x1b>
        state = '%';
 856:	89 c6                	mov    %eax,%esi
 858:	eb db                	jmp    835 <printf+0x2c>
      if(c == 'd'){
 85a:	83 f8 25             	cmp    $0x25,%eax
 85d:	0f 84 cf 00 00 00    	je     932 <printf+0x129>
 863:	0f 8c dd 00 00 00    	jl     946 <printf+0x13d>
 869:	83 f8 78             	cmp    $0x78,%eax
 86c:	0f 8f d4 00 00 00    	jg     946 <printf+0x13d>
 872:	83 f8 63             	cmp    $0x63,%eax
 875:	0f 8c cb 00 00 00    	jl     946 <printf+0x13d>
 87b:	83 e8 63             	sub    $0x63,%eax
 87e:	83 f8 15             	cmp    $0x15,%eax
 881:	0f 87 bf 00 00 00    	ja     946 <printf+0x13d>
 887:	ff 24 85 84 0b 00 00 	jmp    *0xb84(,%eax,4)
        printint(fd, *ap, 10, 1);
 88e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 891:	8b 17                	mov    (%edi),%edx
 893:	83 ec 0c             	sub    $0xc,%esp
 896:	6a 01                	push   $0x1
 898:	b9 0a 00 00 00       	mov    $0xa,%ecx
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
 8a0:	e8 d9 fe ff ff       	call   77e <printint>
        ap++;
 8a5:	83 c7 04             	add    $0x4,%edi
 8a8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8ab:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 8c5:	be 00 00 00 00       	mov    $0x0,%esi
 8ca:	eb 80                	jmp    84c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8cf:	8b 17                	mov    (%edi),%edx
 8d1:	83 ec 0c             	sub    $0xc,%esp
 8d4:	6a 00                	push   $0x0
 8d6:	b9 10 00 00 00       	mov    $0x10,%ecx
 8db:	8b 45 08             	mov    0x8(%ebp),%eax
 8de:	e8 b2 fe ff ff       	call   795 <printint>
        ap++;
 8e3:	83 c7 04             	add    $0x4,%edi
 8e6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ec:	be 00 00 00 00       	mov    $0x0,%esi
 8f1:	e9 56 ff ff ff       	jmp    84c <printf+0x2c>
        s = (char*)*ap;
 8f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8f9:	8b 30                	mov    (%eax),%esi
        ap++;
 8fb:	83 c0 04             	add    $0x4,%eax
 8fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 901:	85 f6                	test   %esi,%esi
 903:	75 15                	jne    91a <printf+0xfa>
          s = "(null)";
 905:	be 94 0b 00 00       	mov    $0xb94,%esi
 90a:	eb 0e                	jmp    91a <printf+0xfa>
          putc(fd, *s);
 90c:	0f be d2             	movsbl %dl,%edx
 90f:	8b 45 08             	mov    0x8(%ebp),%eax
 912:	e8 64 fe ff ff       	call   77b <putc>
          s++;
 917:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 91a:	0f b6 16             	movzbl (%esi),%edx
 91d:	84 d2                	test   %dl,%dl
 91f:	75 eb                	jne    90c <printf+0xec>
      state = 0;
 921:	be 00 00 00 00       	mov    $0x0,%esi
 926:	e9 21 ff ff ff       	jmp    84c <printf+0x2c>
        putc(fd, *ap);
 92b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 92e:	0f be 17             	movsbl (%edi),%edx
 931:	8b 45 08             	mov    0x8(%ebp),%eax
 934:	e8 42 fe ff ff       	call   77b <putc>
        ap++;
 939:	83 c7 04             	add    $0x4,%edi
 93c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 93f:	be 00 00 00 00       	mov    $0x0,%esi
 944:	e9 03 ff ff ff       	jmp    84c <printf+0x2c>
        putc(fd, c);
 949:	89 fa                	mov    %edi,%edx
 94b:	8b 45 08             	mov    0x8(%ebp),%eax
 94e:	e8 28 fe ff ff       	call   77b <putc>
      state = 0;
 953:	be 00 00 00 00       	mov    $0x0,%esi
 958:	e9 ef fe ff ff       	jmp    84c <printf+0x2c>
        putc(fd, '%');
 95d:	ba 25 00 00 00       	mov    $0x25,%edx
 962:	8b 45 08             	mov    0x8(%ebp),%eax
 965:	e8 11 fe ff ff       	call   77b <putc>
        putc(fd, c);
 96a:	89 fa                	mov    %edi,%edx
 96c:	8b 45 08             	mov    0x8(%ebp),%eax
 96f:	e8 07 fe ff ff       	call   77b <putc>
      state = 0;
 974:	be 00 00 00 00       	mov    $0x0,%esi
 979:	e9 ce fe ff ff       	jmp    84c <printf+0x2c>
    }
  }
}
 97e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 981:	5b                   	pop    %ebx
 982:	5e                   	pop    %esi
 983:	5f                   	pop    %edi
 984:	5d                   	pop    %ebp
 985:	c3                   	ret    

00000986 <free>:
=======
 8ae:	be 00 00 00 00       	mov    $0x0,%esi
 8b3:	eb 80                	jmp    835 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8b5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8b8:	8b 17                	mov    (%edi),%edx
 8ba:	83 ec 0c             	sub    $0xc,%esp
 8bd:	6a 00                	push   $0x0
 8bf:	b9 10 00 00 00       	mov    $0x10,%ecx
 8c4:	8b 45 08             	mov    0x8(%ebp),%eax
 8c7:	e8 b2 fe ff ff       	call   77e <printint>
        ap++;
 8cc:	83 c7 04             	add    $0x4,%edi
 8cf:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8d2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8d5:	be 00 00 00 00       	mov    $0x0,%esi
 8da:	e9 56 ff ff ff       	jmp    835 <printf+0x2c>
        s = (char*)*ap;
 8df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8e2:	8b 30                	mov    (%eax),%esi
        ap++;
 8e4:	83 c0 04             	add    $0x4,%eax
 8e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8ea:	85 f6                	test   %esi,%esi
 8ec:	75 15                	jne    903 <printf+0xfa>
          s = "(null)";
 8ee:	be 7c 0b 00 00       	mov    $0xb7c,%esi
 8f3:	eb 0e                	jmp    903 <printf+0xfa>
          putc(fd, *s);
 8f5:	0f be d2             	movsbl %dl,%edx
 8f8:	8b 45 08             	mov    0x8(%ebp),%eax
 8fb:	e8 64 fe ff ff       	call   764 <putc>
          s++;
 900:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 903:	0f b6 16             	movzbl (%esi),%edx
 906:	84 d2                	test   %dl,%dl
 908:	75 eb                	jne    8f5 <printf+0xec>
      state = 0;
 90a:	be 00 00 00 00       	mov    $0x0,%esi
 90f:	e9 21 ff ff ff       	jmp    835 <printf+0x2c>
        putc(fd, *ap);
 914:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 917:	0f be 17             	movsbl (%edi),%edx
 91a:	8b 45 08             	mov    0x8(%ebp),%eax
 91d:	e8 42 fe ff ff       	call   764 <putc>
        ap++;
 922:	83 c7 04             	add    $0x4,%edi
 925:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 928:	be 00 00 00 00       	mov    $0x0,%esi
 92d:	e9 03 ff ff ff       	jmp    835 <printf+0x2c>
        putc(fd, c);
 932:	89 fa                	mov    %edi,%edx
 934:	8b 45 08             	mov    0x8(%ebp),%eax
 937:	e8 28 fe ff ff       	call   764 <putc>
      state = 0;
 93c:	be 00 00 00 00       	mov    $0x0,%esi
 941:	e9 ef fe ff ff       	jmp    835 <printf+0x2c>
        putc(fd, '%');
 946:	ba 25 00 00 00       	mov    $0x25,%edx
 94b:	8b 45 08             	mov    0x8(%ebp),%eax
 94e:	e8 11 fe ff ff       	call   764 <putc>
        putc(fd, c);
 953:	89 fa                	mov    %edi,%edx
 955:	8b 45 08             	mov    0x8(%ebp),%eax
 958:	e8 07 fe ff ff       	call   764 <putc>
      state = 0;
 95d:	be 00 00 00 00       	mov    $0x0,%esi
 962:	e9 ce fe ff ff       	jmp    835 <printf+0x2c>
    }
  }
}
 967:	8d 65 f4             	lea    -0xc(%ebp),%esp
 96a:	5b                   	pop    %ebx
 96b:	5e                   	pop    %esi
 96c:	5f                   	pop    %edi
 96d:	5d                   	pop    %ebp
 96e:	c3                   	ret    

0000096f <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 986:	55                   	push   %ebp
 987:	89 e5                	mov    %esp,%ebp
 989:	57                   	push   %edi
 98a:	56                   	push   %esi
 98b:	53                   	push   %ebx
 98c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 98f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 992:	a1 e0 10 00 00       	mov    0x10e0,%eax
 997:	eb 02                	jmp    99b <free+0x15>
 999:	89 d0                	mov    %edx,%eax
 99b:	39 c8                	cmp    %ecx,%eax
 99d:	73 04                	jae    9a3 <free+0x1d>
 99f:	39 08                	cmp    %ecx,(%eax)
 9a1:	77 12                	ja     9b5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a3:	8b 10                	mov    (%eax),%edx
 9a5:	39 c2                	cmp    %eax,%edx
 9a7:	77 f0                	ja     999 <free+0x13>
 9a9:	39 c8                	cmp    %ecx,%eax
 9ab:	72 08                	jb     9b5 <free+0x2f>
 9ad:	39 ca                	cmp    %ecx,%edx
 9af:	77 04                	ja     9b5 <free+0x2f>
 9b1:	89 d0                	mov    %edx,%eax
 9b3:	eb e6                	jmp    99b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9b5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9b8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9bb:	8b 10                	mov    (%eax),%edx
 9bd:	39 d7                	cmp    %edx,%edi
 9bf:	74 19                	je     9da <free+0x54>
=======
 96f:	55                   	push   %ebp
 970:	89 e5                	mov    %esp,%ebp
 972:	57                   	push   %edi
 973:	56                   	push   %esi
 974:	53                   	push   %ebx
 975:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 978:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 97b:	a1 c0 12 00 00       	mov    0x12c0,%eax
 980:	eb 02                	jmp    984 <free+0x15>
 982:	89 d0                	mov    %edx,%eax
 984:	39 c8                	cmp    %ecx,%eax
 986:	73 04                	jae    98c <free+0x1d>
 988:	39 08                	cmp    %ecx,(%eax)
 98a:	77 12                	ja     99e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 98c:	8b 10                	mov    (%eax),%edx
 98e:	39 c2                	cmp    %eax,%edx
 990:	77 f0                	ja     982 <free+0x13>
 992:	39 c8                	cmp    %ecx,%eax
 994:	72 08                	jb     99e <free+0x2f>
 996:	39 ca                	cmp    %ecx,%edx
 998:	77 04                	ja     99e <free+0x2f>
 99a:	89 d0                	mov    %edx,%eax
 99c:	eb e6                	jmp    984 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 99e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9a4:	8b 10                	mov    (%eax),%edx
 9a6:	39 d7                	cmp    %edx,%edi
 9a8:	74 19                	je     9c3 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 9c1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9c4:	8b 50 04             	mov    0x4(%eax),%edx
 9c7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9ca:	39 ce                	cmp    %ecx,%esi
 9cc:	74 1b                	je     9e9 <free+0x63>
=======
 9aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ad:	8b 50 04             	mov    0x4(%eax),%edx
 9b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b3:	39 ce                	cmp    %ecx,%esi
 9b5:	74 1b                	je     9d2 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 9ce:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9d0:	a3 e0 10 00 00       	mov    %eax,0x10e0
}
 9d5:	5b                   	pop    %ebx
 9d6:	5e                   	pop    %esi
 9d7:	5f                   	pop    %edi
 9d8:	5d                   	pop    %ebp
 9d9:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9da:	03 72 04             	add    0x4(%edx),%esi
 9dd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9e0:	8b 10                	mov    (%eax),%edx
 9e2:	8b 12                	mov    (%edx),%edx
 9e4:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9e7:	eb db                	jmp    9c4 <free+0x3e>
    p->s.size += bp->s.size;
 9e9:	03 53 fc             	add    -0x4(%ebx),%edx
 9ec:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ef:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9f2:	89 10                	mov    %edx,(%eax)
 9f4:	eb da                	jmp    9d0 <free+0x4a>

000009f6 <morecore>:
=======
 9b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9b9:	a3 c0 12 00 00       	mov    %eax,0x12c0
}
 9be:	5b                   	pop    %ebx
 9bf:	5e                   	pop    %esi
 9c0:	5f                   	pop    %edi
 9c1:	5d                   	pop    %ebp
 9c2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9c3:	03 72 04             	add    0x4(%edx),%esi
 9c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9c9:	8b 10                	mov    (%eax),%edx
 9cb:	8b 12                	mov    (%edx),%edx
 9cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9d0:	eb db                	jmp    9ad <free+0x3e>
    p->s.size += bp->s.size;
 9d2:	03 53 fc             	add    -0x4(%ebx),%edx
 9d5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9d8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9db:	89 10                	mov    %edx,(%eax)
 9dd:	eb da                	jmp    9b9 <free+0x4a>

000009df <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 9f6:	55                   	push   %ebp
 9f7:	89 e5                	mov    %esp,%ebp
 9f9:	53                   	push   %ebx
 9fa:	83 ec 04             	sub    $0x4,%esp
 9fd:	89 c3                	mov    %eax,%ebx
=======
 9df:	55                   	push   %ebp
 9e0:	89 e5                	mov    %esp,%ebp
 9e2:	53                   	push   %ebx
 9e3:	83 ec 04             	sub    $0x4,%esp
 9e6:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 9ff:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a04:	77 05                	ja     a0b <morecore+0x15>
    nu = 4096;
 a06:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a0b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a12:	83 ec 0c             	sub    $0xc,%esp
 a15:	50                   	push   %eax
 a16:	e8 38 fd ff ff       	call   753 <sbrk>
  if(p == (char*)-1)
 a1b:	83 c4 10             	add    $0x10,%esp
 a1e:	83 f8 ff             	cmp    $0xffffffff,%eax
 a21:	74 1c                	je     a3f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a23:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a26:	83 c0 08             	add    $0x8,%eax
 a29:	83 ec 0c             	sub    $0xc,%esp
 a2c:	50                   	push   %eax
 a2d:	e8 54 ff ff ff       	call   986 <free>
  return freep;
 a32:	a1 e0 10 00 00       	mov    0x10e0,%eax
 a37:	83 c4 10             	add    $0x10,%esp
}
 a3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a3d:	c9                   	leave  
 a3e:	c3                   	ret    
    return 0;
 a3f:	b8 00 00 00 00       	mov    $0x0,%eax
 a44:	eb f4                	jmp    a3a <morecore+0x44>

00000a46 <malloc>:
=======
 9e8:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9ed:	77 05                	ja     9f4 <morecore+0x15>
    nu = 4096;
 9ef:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9f4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9fb:	83 ec 0c             	sub    $0xc,%esp
 9fe:	50                   	push   %eax
 9ff:	e8 38 fd ff ff       	call   73c <sbrk>
  if(p == (char*)-1)
 a04:	83 c4 10             	add    $0x10,%esp
 a07:	83 f8 ff             	cmp    $0xffffffff,%eax
 a0a:	74 1c                	je     a28 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a0c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a0f:	83 c0 08             	add    $0x8,%eax
 a12:	83 ec 0c             	sub    $0xc,%esp
 a15:	50                   	push   %eax
 a16:	e8 54 ff ff ff       	call   96f <free>
  return freep;
 a1b:	a1 c0 12 00 00       	mov    0x12c0,%eax
 a20:	83 c4 10             	add    $0x10,%esp
}
 a23:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a26:	c9                   	leave  
 a27:	c3                   	ret    
    return 0;
 a28:	b8 00 00 00 00       	mov    $0x0,%eax
 a2d:	eb f4                	jmp    a23 <morecore+0x44>

00000a2f <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 a46:	55                   	push   %ebp
 a47:	89 e5                	mov    %esp,%ebp
 a49:	53                   	push   %ebx
 a4a:	83 ec 04             	sub    $0x4,%esp
=======
 a2f:	55                   	push   %ebp
 a30:	89 e5                	mov    %esp,%ebp
 a32:	53                   	push   %ebx
 a33:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 a4d:	8b 45 08             	mov    0x8(%ebp),%eax
 a50:	8d 58 07             	lea    0x7(%eax),%ebx
 a53:	c1 eb 03             	shr    $0x3,%ebx
 a56:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a59:	8b 0d e0 10 00 00    	mov    0x10e0,%ecx
 a5f:	85 c9                	test   %ecx,%ecx
 a61:	74 04                	je     a67 <malloc+0x21>
=======
 a36:	8b 45 08             	mov    0x8(%ebp),%eax
 a39:	8d 58 07             	lea    0x7(%eax),%ebx
 a3c:	c1 eb 03             	shr    $0x3,%ebx
 a3f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a42:	8b 0d c0 12 00 00    	mov    0x12c0,%ecx
 a48:	85 c9                	test   %ecx,%ecx
 a4a:	74 04                	je     a50 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 a63:	8b 01                	mov    (%ecx),%eax
 a65:	eb 4a                	jmp    ab1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a67:	c7 05 e0 10 00 00 e4 	movl   $0x10e4,0x10e0
 a6e:	10 00 00 
 a71:	c7 05 e4 10 00 00 e4 	movl   $0x10e4,0x10e4
 a78:	10 00 00 
    base.s.size = 0;
 a7b:	c7 05 e8 10 00 00 00 	movl   $0x0,0x10e8
 a82:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a85:	b9 e4 10 00 00       	mov    $0x10e4,%ecx
 a8a:	eb d7                	jmp    a63 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a8c:	74 19                	je     aa7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a8e:	29 da                	sub    %ebx,%edx
 a90:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a93:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a96:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a99:	89 0d e0 10 00 00    	mov    %ecx,0x10e0
      return (void*)(p + 1);
 a9f:	83 c0 08             	add    $0x8,%eax
=======
 a4c:	8b 01                	mov    (%ecx),%eax
 a4e:	eb 4a                	jmp    a9a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a50:	c7 05 c0 12 00 00 c4 	movl   $0x12c4,0x12c0
 a57:	12 00 00 
 a5a:	c7 05 c4 12 00 00 c4 	movl   $0x12c4,0x12c4
 a61:	12 00 00 
    base.s.size = 0;
 a64:	c7 05 c8 12 00 00 00 	movl   $0x0,0x12c8
 a6b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a6e:	b9 c4 12 00 00       	mov    $0x12c4,%ecx
 a73:	eb d7                	jmp    a4c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a75:	74 19                	je     a90 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a77:	29 da                	sub    %ebx,%edx
 a79:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a7c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a7f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a82:	89 0d c0 12 00 00    	mov    %ecx,0x12c0
      return (void*)(p + 1);
 a88:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 aa2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aa5:	c9                   	leave  
 aa6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 aa7:	8b 10                	mov    (%eax),%edx
 aa9:	89 11                	mov    %edx,(%ecx)
 aab:	eb ec                	jmp    a99 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aad:	89 c1                	mov    %eax,%ecx
 aaf:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 ab1:	8b 50 04             	mov    0x4(%eax),%edx
 ab4:	39 da                	cmp    %ebx,%edx
 ab6:	73 d4                	jae    a8c <malloc+0x46>
    if(p == freep)
 ab8:	39 05 e0 10 00 00    	cmp    %eax,0x10e0
 abe:	75 ed                	jne    aad <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 ac0:	89 d8                	mov    %ebx,%eax
 ac2:	e8 2f ff ff ff       	call   9f6 <morecore>
 ac7:	85 c0                	test   %eax,%eax
 ac9:	75 e2                	jne    aad <malloc+0x67>
 acb:	eb d5                	jmp    aa2 <malloc+0x5c>
=======
 a8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a8e:	c9                   	leave  
 a8f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a90:	8b 10                	mov    (%eax),%edx
 a92:	89 11                	mov    %edx,(%ecx)
 a94:	eb ec                	jmp    a82 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a96:	89 c1                	mov    %eax,%ecx
 a98:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a9a:	8b 50 04             	mov    0x4(%eax),%edx
 a9d:	39 da                	cmp    %ebx,%edx
 a9f:	73 d4                	jae    a75 <malloc+0x46>
    if(p == freep)
 aa1:	39 05 c0 12 00 00    	cmp    %eax,0x12c0
 aa7:	75 ed                	jne    a96 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 aa9:	89 d8                	mov    %ebx,%eax
 aab:	e8 2f ff ff ff       	call   9df <morecore>
 ab0:	85 c0                	test   %eax,%eax
 ab2:	75 e2                	jne    a96 <malloc+0x67>
 ab4:	eb d5                	jmp    a8b <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
