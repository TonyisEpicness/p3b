
_test_8:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
<<<<<<< HEAD
  1c:	a1 f4 0e 00 00       	mov    0xef4,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 3c 0a 00 00       	push   $0xa3c
  31:	68 45 0a 00 00       	push   $0xa45
  36:	6a 01                	push   $0x1
  38:	e8 50 07 00 00       	call   78d <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 84 0a 00 00       	push   $0xa84
  45:	68 58 0a 00 00       	push   $0xa58
  4a:	6a 01                	push   $0x1
  4c:	e8 3c 07 00 00       	call   78d <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 6c 0a 00 00       	push   $0xa6c
  59:	6a 01                	push   $0x1
  5b:	e8 2d 07 00 00       	call   78d <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 00 0f 00 00    	push   0xf00
  69:	e8 fa 05 00 00       	call   668 <kill>
  6e:	e8 c5 05 00 00       	call   638 <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 3c 0a 00 00       	push   $0xa3c
  7a:	68 45 0a 00 00       	push   $0xa45
  7f:	6a 01                	push   $0x1
  81:	e8 07 07 00 00       	call   78d <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 4d 0a 00 00       	push   $0xa4d
  8e:	68 58 0a 00 00       	push   $0xa58
  93:	6a 01                	push   $0x1
  95:	e8 f3 06 00 00       	call   78d <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 6c 0a 00 00       	push   $0xa6c
  a2:	6a 01                	push   $0x1
  a4:	e8 e4 06 00 00       	call   78d <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 00 0f 00 00    	push   0xf00
  b2:	e8 b1 05 00 00       	call   668 <kill>
  b7:	e8 7c 05 00 00       	call   638 <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 3c 0a 00 00       	push   $0xa3c
  c3:	68 45 0a 00 00       	push   $0xa45
  c8:	6a 01                	push   $0x1
  ca:	e8 be 06 00 00       	call   78d <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 79 0a 00 00       	push   $0xa79
  d7:	68 58 0a 00 00       	push   $0xa58
  dc:	6a 01                	push   $0x1
  de:	e8 aa 06 00 00       	call   78d <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 6c 0a 00 00       	push   $0xa6c
  eb:	6a 01                	push   $0x1
  ed:	e8 9b 06 00 00       	call   78d <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 00 0f 00 00    	push   0xf00
  fb:	e8 68 05 00 00       	call   668 <kill>
 100:	e8 33 05 00 00       	call   638 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 f4 0e 00 00       	mov    %eax,0xef4
   exit();
 10d:	e8 26 05 00 00       	call   638 <exit>
=======
  1c:	a1 d8 0e 00 00       	mov    0xed8,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 24 0a 00 00       	push   $0xa24
  31:	68 2d 0a 00 00       	push   $0xa2d
  36:	6a 01                	push   $0x1
  38:	e8 39 07 00 00       	call   776 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 6c 0a 00 00       	push   $0xa6c
  45:	68 40 0a 00 00       	push   $0xa40
  4a:	6a 01                	push   $0x1
  4c:	e8 25 07 00 00       	call   776 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 54 0a 00 00       	push   $0xa54
  59:	6a 01                	push   $0x1
  5b:	e8 16 07 00 00       	call   776 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 e0 0e 00 00    	push   0xee0
  69:	e8 e3 05 00 00       	call   651 <kill>
  6e:	e8 ae 05 00 00       	call   621 <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 24 0a 00 00       	push   $0xa24
  7a:	68 2d 0a 00 00       	push   $0xa2d
  7f:	6a 01                	push   $0x1
  81:	e8 f0 06 00 00       	call   776 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 35 0a 00 00       	push   $0xa35
  8e:	68 40 0a 00 00       	push   $0xa40
  93:	6a 01                	push   $0x1
  95:	e8 dc 06 00 00       	call   776 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 54 0a 00 00       	push   $0xa54
  a2:	6a 01                	push   $0x1
  a4:	e8 cd 06 00 00       	call   776 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 e0 0e 00 00    	push   0xee0
  b2:	e8 9a 05 00 00       	call   651 <kill>
  b7:	e8 65 05 00 00       	call   621 <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 24 0a 00 00       	push   $0xa24
  c3:	68 2d 0a 00 00       	push   $0xa2d
  c8:	6a 01                	push   $0x1
  ca:	e8 a7 06 00 00       	call   776 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 61 0a 00 00       	push   $0xa61
  d7:	68 40 0a 00 00       	push   $0xa40
  dc:	6a 01                	push   $0x1
  de:	e8 93 06 00 00       	call   776 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 54 0a 00 00       	push   $0xa54
  eb:	6a 01                	push   $0x1
  ed:	e8 84 06 00 00       	call   776 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 e0 0e 00 00    	push   0xee0
  fb:	e8 51 05 00 00       	call   651 <kill>
 100:	e8 1c 05 00 00       	call   621 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 d8 0e 00 00       	mov    %eax,0xed8
   exit();
 10d:	e8 0f 05 00 00       	call   621 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
<<<<<<< HEAD
 126:	e8 8d 05 00 00       	call   6b8 <getpid>
 12b:	a3 00 0f 00 00       	mov    %eax,0xf00
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 76 08 00 00       	call   9b3 <malloc>
=======
 126:	e8 76 05 00 00       	call   6a1 <getpid>
 12b:	a3 e0 0e 00 00       	mov    %eax,0xee0
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 5f 08 00 00       	call   99c <malloc>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
<<<<<<< HEAD
 15a:	68 3c 0a 00 00       	push   $0xa3c
 15f:	68 45 0a 00 00       	push   $0xa45
 164:	6a 01                	push   $0x1
 166:	e8 22 06 00 00       	call   78d <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 90 0a 00 00       	push   $0xa90
 173:	68 58 0a 00 00       	push   $0xa58
 178:	6a 01                	push   $0x1
 17a:	e8 0e 06 00 00       	call   78d <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 6c 0a 00 00       	push   $0xa6c
 187:	6a 01                	push   $0x1
 189:	e8 ff 05 00 00       	call   78d <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 00 0f 00 00    	push   0xf00
 197:	e8 cc 04 00 00       	call   668 <kill>
 19c:	e8 97 04 00 00       	call   638 <exit>
=======
 15a:	68 24 0a 00 00       	push   $0xa24
 15f:	68 2d 0a 00 00       	push   $0xa2d
 164:	6a 01                	push   $0x1
 166:	e8 0b 06 00 00       	call   776 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 78 0a 00 00       	push   $0xa78
 173:	68 40 0a 00 00       	push   $0xa40
 178:	6a 01                	push   $0x1
 17a:	e8 f7 05 00 00       	call   776 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 54 0a 00 00       	push   $0xa54
 187:	6a 01                	push   $0x1
 189:	e8 e8 05 00 00       	call   776 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 e0 0e 00 00    	push   0xee0
 197:	e8 b5 04 00 00       	call   651 <kill>
 19c:	e8 80 04 00 00       	call   621 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
<<<<<<< HEAD
 1bf:	e8 14 05 00 00       	call   6d8 <clone>
=======
 1bf:	e8 fd 04 00 00       	call   6c1 <clone>
>>>>>>> c59b0f9 (fixed thread_join and join)
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
<<<<<<< HEAD
 1d5:	e8 ee 04 00 00       	call   6c8 <sleep>
   assert(wait() == -1);
 1da:	e8 61 04 00 00       	call   640 <wait>
=======
 1d5:	e8 d7 04 00 00       	call   6b1 <sleep>
   assert(wait() == -1);
 1da:	e8 4a 04 00 00       	call   629 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
<<<<<<< HEAD
 1ed:	68 3c 0a 00 00       	push   $0xa3c
 1f2:	68 45 0a 00 00       	push   $0xa45
 1f7:	6a 01                	push   $0x1
 1f9:	e8 8f 05 00 00       	call   78d <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 a8 0a 00 00       	push   $0xaa8
 206:	68 58 0a 00 00       	push   $0xa58
 20b:	6a 01                	push   $0x1
 20d:	e8 7b 05 00 00       	call   78d <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 6c 0a 00 00       	push   $0xa6c
 21a:	6a 01                	push   $0x1
 21c:	e8 6c 05 00 00       	call   78d <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 00 0f 00 00    	push   0xf00
 22a:	e8 39 04 00 00       	call   668 <kill>
 22f:	e8 04 04 00 00       	call   638 <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 3c 0a 00 00       	push   $0xa3c
 23b:	68 45 0a 00 00       	push   $0xa45
 240:	6a 01                	push   $0x1
 242:	e8 46 05 00 00       	call   78d <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 9a 0a 00 00       	push   $0xa9a
 24f:	68 58 0a 00 00       	push   $0xa58
 254:	6a 01                	push   $0x1
 256:	e8 32 05 00 00       	call   78d <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 6c 0a 00 00       	push   $0xa6c
 263:	6a 01                	push   $0x1
 265:	e8 23 05 00 00       	call   78d <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 00 0f 00 00    	push   0xf00
 273:	e8 f0 03 00 00       	call   668 <kill>
 278:	e8 bb 03 00 00       	call   638 <exit>
=======
 1ed:	68 24 0a 00 00       	push   $0xa24
 1f2:	68 2d 0a 00 00       	push   $0xa2d
 1f7:	6a 01                	push   $0x1
 1f9:	e8 78 05 00 00       	call   776 <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 90 0a 00 00       	push   $0xa90
 206:	68 40 0a 00 00       	push   $0xa40
 20b:	6a 01                	push   $0x1
 20d:	e8 64 05 00 00       	call   776 <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 54 0a 00 00       	push   $0xa54
 21a:	6a 01                	push   $0x1
 21c:	e8 55 05 00 00       	call   776 <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 e0 0e 00 00    	push   0xee0
 22a:	e8 22 04 00 00       	call   651 <kill>
 22f:	e8 ed 03 00 00       	call   621 <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 24 0a 00 00       	push   $0xa24
 23b:	68 2d 0a 00 00       	push   $0xa2d
 240:	6a 01                	push   $0x1
 242:	e8 2f 05 00 00       	call   776 <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 82 0a 00 00       	push   $0xa82
 24f:	68 40 0a 00 00       	push   $0xa40
 254:	6a 01                	push   $0x1
 256:	e8 1b 05 00 00       	call   776 <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 54 0a 00 00       	push   $0xa54
 263:	6a 01                	push   $0x1
 265:	e8 0c 05 00 00       	call   776 <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 e0 0e 00 00    	push   0xee0
 273:	e8 d9 03 00 00       	call   651 <kill>
 278:	e8 a4 03 00 00       	call   621 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
<<<<<<< HEAD
 284:	e8 57 04 00 00       	call   6e0 <join>
=======
 284:	e8 40 04 00 00       	call   6c9 <join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
<<<<<<< HEAD
 29b:	68 3c 0a 00 00       	push   $0xa3c
 2a0:	68 45 0a 00 00       	push   $0xa45
 2a5:	6a 01                	push   $0x1
 2a7:	e8 e1 04 00 00       	call   78d <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 cb 0a 00 00       	push   $0xacb
 2b4:	68 58 0a 00 00       	push   $0xa58
 2b9:	6a 01                	push   $0x1
 2bb:	e8 cd 04 00 00       	call   78d <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 6c 0a 00 00       	push   $0xa6c
 2c8:	6a 01                	push   $0x1
 2ca:	e8 be 04 00 00       	call   78d <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 00 0f 00 00    	push   0xf00
 2d8:	e8 8b 03 00 00       	call   668 <kill>
 2dd:	e8 56 03 00 00       	call   638 <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 3c 0a 00 00       	push   $0xa3c
 2e9:	68 45 0a 00 00       	push   $0xa45
 2ee:	6a 01                	push   $0x1
 2f0:	e8 98 04 00 00       	call   78d <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 b5 0a 00 00       	push   $0xab5
 2fd:	68 58 0a 00 00       	push   $0xa58
 302:	6a 01                	push   $0x1
 304:	e8 84 04 00 00       	call   78d <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 6c 0a 00 00       	push   $0xa6c
 311:	6a 01                	push   $0x1
 313:	e8 75 04 00 00       	call   78d <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 00 0f 00 00    	push   0xf00
 321:	e8 42 03 00 00       	call   668 <kill>
 326:	e8 0d 03 00 00       	call   638 <exit>
   assert(global == 2);
 32b:	83 3d f4 0e 00 00 02 	cmpl   $0x2,0xef4
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 3c 0a 00 00       	push   $0xa3c
 33b:	68 45 0a 00 00       	push   $0xa45
 340:	6a 01                	push   $0x1
 342:	e8 46 04 00 00       	call   78d <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 df 0a 00 00       	push   $0xadf
 34f:	68 58 0a 00 00       	push   $0xa58
 354:	6a 01                	push   $0x1
 356:	e8 32 04 00 00       	call   78d <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 6c 0a 00 00       	push   $0xa6c
 363:	6a 01                	push   $0x1
 365:	e8 23 04 00 00       	call   78d <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 00 0f 00 00    	push   0xf00
 373:	e8 f0 02 00 00       	call   668 <kill>
 378:	e8 bb 02 00 00       	call   638 <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 eb 0a 00 00       	push   $0xaeb
 385:	6a 01                	push   $0x1
 387:	e8 01 04 00 00       	call   78d <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 5f 05 00 00       	call   8f3 <free>
   exit();
 394:	e8 9f 02 00 00       	call   638 <exit>
=======
 29b:	68 24 0a 00 00       	push   $0xa24
 2a0:	68 2d 0a 00 00       	push   $0xa2d
 2a5:	6a 01                	push   $0x1
 2a7:	e8 ca 04 00 00       	call   776 <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 b3 0a 00 00       	push   $0xab3
 2b4:	68 40 0a 00 00       	push   $0xa40
 2b9:	6a 01                	push   $0x1
 2bb:	e8 b6 04 00 00       	call   776 <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 54 0a 00 00       	push   $0xa54
 2c8:	6a 01                	push   $0x1
 2ca:	e8 a7 04 00 00       	call   776 <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 e0 0e 00 00    	push   0xee0
 2d8:	e8 74 03 00 00       	call   651 <kill>
 2dd:	e8 3f 03 00 00       	call   621 <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 24 0a 00 00       	push   $0xa24
 2e9:	68 2d 0a 00 00       	push   $0xa2d
 2ee:	6a 01                	push   $0x1
 2f0:	e8 81 04 00 00       	call   776 <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 9d 0a 00 00       	push   $0xa9d
 2fd:	68 40 0a 00 00       	push   $0xa40
 302:	6a 01                	push   $0x1
 304:	e8 6d 04 00 00       	call   776 <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 54 0a 00 00       	push   $0xa54
 311:	6a 01                	push   $0x1
 313:	e8 5e 04 00 00       	call   776 <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 e0 0e 00 00    	push   0xee0
 321:	e8 2b 03 00 00       	call   651 <kill>
 326:	e8 f6 02 00 00       	call   621 <exit>
   assert(global == 2);
 32b:	83 3d d8 0e 00 00 02 	cmpl   $0x2,0xed8
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 24 0a 00 00       	push   $0xa24
 33b:	68 2d 0a 00 00       	push   $0xa2d
 340:	6a 01                	push   $0x1
 342:	e8 2f 04 00 00       	call   776 <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 c7 0a 00 00       	push   $0xac7
 34f:	68 40 0a 00 00       	push   $0xa40
 354:	6a 01                	push   $0x1
 356:	e8 1b 04 00 00       	call   776 <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 54 0a 00 00       	push   $0xa54
 363:	6a 01                	push   $0x1
 365:	e8 0c 04 00 00       	call   776 <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 e0 0e 00 00    	push   0xee0
 373:	e8 d9 02 00 00       	call   651 <kill>
 378:	e8 a4 02 00 00       	call   621 <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 d3 0a 00 00       	push   $0xad3
 385:	6a 01                	push   $0x1
 387:	e8 ea 03 00 00       	call   776 <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 48 05 00 00       	call   8dc <free>
   exit();
 394:	e8 88 02 00 00       	call   621 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000399 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 39f:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3a4:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    

000003aa <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
 3ad:	53                   	push   %ebx
 3ae:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 3b1:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 3b6:	e8 f8 05 00 00       	call   9b3 <malloc>
  if(n_stack == 0){
 3bb:	83 c4 10             	add    $0x10,%esp
 3be:	85 c0                	test   %eax,%eax
 3c0:	74 41                	je     403 <thread_create+0x59>
 3c2:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 3c4:	50                   	push   %eax
 3c5:	ff 75 10             	push   0x10(%ebp)
 3c8:	ff 75 0c             	push   0xc(%ebp)
 3cb:	ff 75 08             	push   0x8(%ebp)
 3ce:	e8 05 03 00 00       	call   6d8 <clone>
=======
 3b6:	e8 e1 05 00 00       	call   99c <malloc>
  if(n_stack == 0){
 3bb:	83 c4 10             	add    $0x10,%esp
 3be:	85 c0                	test   %eax,%eax
 3c0:	74 57                	je     419 <thread_create+0x6f>
 3c2:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 3c4:	b8 00 00 00 00       	mov    $0x0,%eax
 3c9:	eb 03                	jmp    3ce <thread_create+0x24>
 3cb:	83 c0 01             	add    $0x1,%eax
 3ce:	83 f8 3f             	cmp    $0x3f,%eax
 3d1:	7f 2f                	jg     402 <thread_create+0x58>
    if(threads[i].flag==0){
 3d3:	8d 14 40             	lea    (%eax,%eax,2),%edx
 3d6:	83 3c 95 08 0f 00 00 	cmpl   $0x0,0xf08(,%edx,4)
 3dd:	00 
 3de:	75 eb                	jne    3cb <thread_create+0x21>
      threads[i].maddr = n_stack;
 3e0:	8d 14 00             	lea    (%eax,%eax,1),%edx
 3e3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 3e6:	c1 e3 02             	shl    $0x2,%ebx
 3e9:	89 8b 00 0f 00 00    	mov    %ecx,0xf00(%ebx)
      threads[i].pg1addr = n_stack;
 3ef:	89 8b 04 0f 00 00    	mov    %ecx,0xf04(%ebx)
      threads[i].flag = 1;
 3f5:	01 c2                	add    %eax,%edx
 3f7:	c7 04 95 08 0f 00 00 	movl   $0x1,0xf08(,%edx,4)
 3fe:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 402:	51                   	push   %ecx
 403:	ff 75 10             	push   0x10(%ebp)
 406:	ff 75 0c             	push   0xc(%ebp)
 409:	ff 75 08             	push   0x8(%ebp)
 40c:	e8 b0 02 00 00       	call   6c1 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 3d3:	83 c4 10             	add    $0x10,%esp
 3d6:	ba 00 00 00 00       	mov    $0x0,%edx
 3db:	eb 03                	jmp    3e0 <thread_create+0x36>
 3dd:	83 c2 01             	add    $0x1,%edx
 3e0:	83 fa 3f             	cmp    $0x3f,%edx
 3e3:	7f 19                	jg     3fe <thread_create+0x54>
    if(threads[i]->flag==0){
 3e5:	8b 0c 95 20 0f 00 00 	mov    0xf20(,%edx,4),%ecx
 3ec:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 3f0:	75 eb                	jne    3dd <thread_create+0x33>
      threads[i]->maddr = n_stack;
 3f2:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 3f4:	8b 14 95 20 0f 00 00 	mov    0xf20(,%edx,4),%edx
 3fb:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 3fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 401:	c9                   	leave  
 402:	c3                   	ret    
    return -1;
 403:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 408:	eb f4                	jmp    3fe <thread_create+0x54>

0000040a <thread_join>:
=======
 411:	83 c4 10             	add    $0x10,%esp
}
 414:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 417:	c9                   	leave  
 418:	c3                   	ret    
    return -1;
 419:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 41e:	eb f4                	jmp    414 <thread_create+0x6a>

00000420 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 40a:	55                   	push   %ebp
 40b:	89 e5                	mov    %esp,%ebp
 40d:	56                   	push   %esi
 40e:	53                   	push   %ebx
 40f:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 412:	8d 45 f4             	lea    -0xc(%ebp),%eax
 415:	50                   	push   %eax
 416:	e8 c5 02 00 00       	call   6e0 <join>
 41b:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 41d:	83 c4 10             	add    $0x10,%esp
 420:	bb 00 00 00 00       	mov    $0x0,%ebx
 425:	eb 03                	jmp    42a <thread_join+0x20>
 427:	83 c3 01             	add    $0x1,%ebx
 42a:	83 fb 3f             	cmp    $0x3f,%ebx
 42d:	7f 23                	jg     452 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 42f:	8b 04 9d 20 0f 00 00 	mov    0xf20(,%ebx,4),%eax
 436:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 43a:	75 eb                	jne    427 <thread_join+0x1d>
 43c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 43f:	39 50 04             	cmp    %edx,0x4(%eax)
 442:	75 e3                	jne    427 <thread_join+0x1d>
      free(stk_addr);
 444:	83 ec 0c             	sub    $0xc,%esp
 447:	52                   	push   %edx
 448:	e8 a6 04 00 00       	call   8f3 <free>
 44d:	83 c4 10             	add    $0x10,%esp
 450:	eb d5                	jmp    427 <thread_join+0x1d>
    }
  }
  return pid;
}
 452:	89 f0                	mov    %esi,%eax
 454:	8d 65 f8             	lea    -0x8(%ebp),%esp
 457:	5b                   	pop    %ebx
 458:	5e                   	pop    %esi
 459:	5d                   	pop    %ebp
 45a:	c3                   	ret    

0000045b <lock_acquire>:

void lock_acquire(lock_t *lock){
 45b:	55                   	push   %ebp
 45c:	89 e5                	mov    %esp,%ebp
 45e:	53                   	push   %ebx
 45f:	83 ec 04             	sub    $0x4,%esp
 462:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 465:	83 ec 08             	sub    $0x8,%esp
 468:	6a 01                	push   $0x1
 46a:	53                   	push   %ebx
 46b:	e8 29 ff ff ff       	call   399 <test_and_set>
 470:	83 c4 10             	add    $0x10,%esp
 473:	83 f8 01             	cmp    $0x1,%eax
 476:	74 ed                	je     465 <lock_acquire+0xa>
    ;
}
 478:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 47b:	c9                   	leave  
 47c:	c3                   	ret    

0000047d <lock_release>:

void lock_release(lock_t *lock) {
 47d:	55                   	push   %ebp
 47e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 480:	8b 45 08             	mov    0x8(%ebp),%eax
 483:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 489:	5d                   	pop    %ebp
 48a:	c3                   	ret    

0000048b <lock_init>:

void lock_init(lock_t *lock) {
 48b:	55                   	push   %ebp
 48c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 48e:	8b 45 08             	mov    0x8(%ebp),%eax
 491:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 497:	5d                   	pop    %ebp
 498:	c3                   	ret    

00000499 <strcpy>:
=======
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
 424:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 427:	8d 45 f4             	lea    -0xc(%ebp),%eax
 42a:	50                   	push   %eax
 42b:	e8 99 02 00 00       	call   6c9 <join>
 430:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 432:	83 c4 04             	add    $0x4,%esp
 435:	ff 75 f4             	push   -0xc(%ebp)
 438:	e8 9f 04 00 00       	call   8dc <free>
  return pid;
}
 43d:	89 d8                	mov    %ebx,%eax
 43f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 442:	c9                   	leave  
 443:	c3                   	ret    

00000444 <lock_acquire>:

void lock_acquire(lock_t *lock){
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	53                   	push   %ebx
 448:	83 ec 04             	sub    $0x4,%esp
 44b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 44e:	83 ec 08             	sub    $0x8,%esp
 451:	6a 01                	push   $0x1
 453:	53                   	push   %ebx
 454:	e8 40 ff ff ff       	call   399 <test_and_set>
 459:	83 c4 10             	add    $0x10,%esp
 45c:	83 f8 01             	cmp    $0x1,%eax
 45f:	74 ed                	je     44e <lock_acquire+0xa>
    ;
}
 461:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 464:	c9                   	leave  
 465:	c3                   	ret    

00000466 <lock_release>:

void lock_release(lock_t *lock) {
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 469:	8b 45 08             	mov    0x8(%ebp),%eax
 46c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 472:	5d                   	pop    %ebp
 473:	c3                   	ret    

00000474 <lock_init>:

void lock_init(lock_t *lock) {
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 477:	8b 45 08             	mov    0x8(%ebp),%eax
 47a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 480:	5d                   	pop    %ebp
 481:	c3                   	ret    

00000482 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	56                   	push   %esi
 49d:	53                   	push   %ebx
 49e:	8b 75 08             	mov    0x8(%ebp),%esi
 4a1:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 482:	55                   	push   %ebp
 483:	89 e5                	mov    %esp,%ebp
 485:	56                   	push   %esi
 486:	53                   	push   %ebx
 487:	8b 75 08             	mov    0x8(%ebp),%esi
 48a:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 4a4:	89 f0                	mov    %esi,%eax
 4a6:	89 d1                	mov    %edx,%ecx
 4a8:	83 c2 01             	add    $0x1,%edx
 4ab:	89 c3                	mov    %eax,%ebx
 4ad:	83 c0 01             	add    $0x1,%eax
 4b0:	0f b6 09             	movzbl (%ecx),%ecx
 4b3:	88 0b                	mov    %cl,(%ebx)
 4b5:	84 c9                	test   %cl,%cl
 4b7:	75 ed                	jne    4a6 <strcpy+0xd>
    ;
  return os;
}
 4b9:	89 f0                	mov    %esi,%eax
 4bb:	5b                   	pop    %ebx
 4bc:	5e                   	pop    %esi
 4bd:	5d                   	pop    %ebp
 4be:	c3                   	ret    

000004bf <strcmp>:
=======
 48d:	89 f0                	mov    %esi,%eax
 48f:	89 d1                	mov    %edx,%ecx
 491:	83 c2 01             	add    $0x1,%edx
 494:	89 c3                	mov    %eax,%ebx
 496:	83 c0 01             	add    $0x1,%eax
 499:	0f b6 09             	movzbl (%ecx),%ecx
 49c:	88 0b                	mov    %cl,(%ebx)
 49e:	84 c9                	test   %cl,%cl
 4a0:	75 ed                	jne    48f <strcpy+0xd>
    ;
  return os;
}
 4a2:	89 f0                	mov    %esi,%eax
 4a4:	5b                   	pop    %ebx
 4a5:	5e                   	pop    %esi
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    

000004a8 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 4bf:	55                   	push   %ebp
 4c0:	89 e5                	mov    %esp,%ebp
 4c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4c8:	eb 06                	jmp    4d0 <strcmp+0x11>
    p++, q++;
 4ca:	83 c1 01             	add    $0x1,%ecx
 4cd:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4d0:	0f b6 01             	movzbl (%ecx),%eax
 4d3:	84 c0                	test   %al,%al
 4d5:	74 04                	je     4db <strcmp+0x1c>
 4d7:	3a 02                	cmp    (%edx),%al
 4d9:	74 ef                	je     4ca <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4db:	0f b6 c0             	movzbl %al,%eax
 4de:	0f b6 12             	movzbl (%edx),%edx
 4e1:	29 d0                	sub    %edx,%eax
}
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret    

000004e5 <strlen>:
=======
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4ae:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4b1:	eb 06                	jmp    4b9 <strcmp+0x11>
    p++, q++;
 4b3:	83 c1 01             	add    $0x1,%ecx
 4b6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4b9:	0f b6 01             	movzbl (%ecx),%eax
 4bc:	84 c0                	test   %al,%al
 4be:	74 04                	je     4c4 <strcmp+0x1c>
 4c0:	3a 02                	cmp    (%edx),%al
 4c2:	74 ef                	je     4b3 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4c4:	0f b6 c0             	movzbl %al,%eax
 4c7:	0f b6 12             	movzbl (%edx),%edx
 4ca:	29 d0                	sub    %edx,%eax
}
 4cc:	5d                   	pop    %ebp
 4cd:	c3                   	ret    

000004ce <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 4e5:	55                   	push   %ebp
 4e6:	89 e5                	mov    %esp,%ebp
 4e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4eb:	b8 00 00 00 00       	mov    $0x0,%eax
 4f0:	eb 03                	jmp    4f5 <strlen+0x10>
 4f2:	83 c0 01             	add    $0x1,%eax
 4f5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4f9:	75 f7                	jne    4f2 <strlen+0xd>
    ;
  return n;
}
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    

000004fd <memset>:
=======
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4d4:	b8 00 00 00 00       	mov    $0x0,%eax
 4d9:	eb 03                	jmp    4de <strlen+0x10>
 4db:	83 c0 01             	add    $0x1,%eax
 4de:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4e2:	75 f7                	jne    4db <strlen+0xd>
    ;
  return n;
}
 4e4:	5d                   	pop    %ebp
 4e5:	c3                   	ret    

000004e6 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 4fd:	55                   	push   %ebp
 4fe:	89 e5                	mov    %esp,%ebp
 500:	57                   	push   %edi
 501:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	57                   	push   %edi
 4ea:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 504:	89 d7                	mov    %edx,%edi
 506:	8b 4d 10             	mov    0x10(%ebp),%ecx
 509:	8b 45 0c             	mov    0xc(%ebp),%eax
 50c:	fc                   	cld    
 50d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 50f:	89 d0                	mov    %edx,%eax
 511:	8b 7d fc             	mov    -0x4(%ebp),%edi
 514:	c9                   	leave  
 515:	c3                   	ret    

00000516 <strchr>:
=======
 4ed:	89 d7                	mov    %edx,%edi
 4ef:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f5:	fc                   	cld    
 4f6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4f8:	89 d0                	mov    %edx,%eax
 4fa:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4fd:	c9                   	leave  
 4fe:	c3                   	ret    

000004ff <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 520:	eb 03                	jmp    525 <strchr+0xf>
 522:	83 c0 01             	add    $0x1,%eax
 525:	0f b6 10             	movzbl (%eax),%edx
 528:	84 d2                	test   %dl,%dl
 52a:	74 06                	je     532 <strchr+0x1c>
    if(*s == c)
 52c:	38 ca                	cmp    %cl,%dl
 52e:	75 f2                	jne    522 <strchr+0xc>
 530:	eb 05                	jmp    537 <strchr+0x21>
      return (char*)s;
  return 0;
 532:	b8 00 00 00 00       	mov    $0x0,%eax
}
 537:	5d                   	pop    %ebp
 538:	c3                   	ret    

00000539 <gets>:
=======
 4ff:	55                   	push   %ebp
 500:	89 e5                	mov    %esp,%ebp
 502:	8b 45 08             	mov    0x8(%ebp),%eax
 505:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 509:	eb 03                	jmp    50e <strchr+0xf>
 50b:	83 c0 01             	add    $0x1,%eax
 50e:	0f b6 10             	movzbl (%eax),%edx
 511:	84 d2                	test   %dl,%dl
 513:	74 06                	je     51b <strchr+0x1c>
    if(*s == c)
 515:	38 ca                	cmp    %cl,%dl
 517:	75 f2                	jne    50b <strchr+0xc>
 519:	eb 05                	jmp    520 <strchr+0x21>
      return (char*)s;
  return 0;
 51b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 520:	5d                   	pop    %ebp
 521:	c3                   	ret    

00000522 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 539:	55                   	push   %ebp
 53a:	89 e5                	mov    %esp,%ebp
 53c:	57                   	push   %edi
 53d:	56                   	push   %esi
 53e:	53                   	push   %ebx
 53f:	83 ec 1c             	sub    $0x1c,%esp
 542:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 522:	55                   	push   %ebp
 523:	89 e5                	mov    %esp,%ebp
 525:	57                   	push   %edi
 526:	56                   	push   %esi
 527:	53                   	push   %ebx
 528:	83 ec 1c             	sub    $0x1c,%esp
 52b:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 545:	bb 00 00 00 00       	mov    $0x0,%ebx
 54a:	89 de                	mov    %ebx,%esi
 54c:	83 c3 01             	add    $0x1,%ebx
 54f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 552:	7d 2e                	jge    582 <gets+0x49>
    cc = read(0, &c, 1);
 554:	83 ec 04             	sub    $0x4,%esp
 557:	6a 01                	push   $0x1
 559:	8d 45 e7             	lea    -0x19(%ebp),%eax
 55c:	50                   	push   %eax
 55d:	6a 00                	push   $0x0
 55f:	e8 ec 00 00 00       	call   650 <read>
    if(cc < 1)
 564:	83 c4 10             	add    $0x10,%esp
 567:	85 c0                	test   %eax,%eax
 569:	7e 17                	jle    582 <gets+0x49>
      break;
    buf[i++] = c;
 56b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 56f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 572:	3c 0a                	cmp    $0xa,%al
 574:	0f 94 c2             	sete   %dl
 577:	3c 0d                	cmp    $0xd,%al
 579:	0f 94 c0             	sete   %al
 57c:	08 c2                	or     %al,%dl
 57e:	74 ca                	je     54a <gets+0x11>
    buf[i++] = c;
 580:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 582:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 586:	89 f8                	mov    %edi,%eax
 588:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58b:	5b                   	pop    %ebx
 58c:	5e                   	pop    %esi
 58d:	5f                   	pop    %edi
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    

00000590 <stat>:
=======
 52e:	bb 00 00 00 00       	mov    $0x0,%ebx
 533:	89 de                	mov    %ebx,%esi
 535:	83 c3 01             	add    $0x1,%ebx
 538:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 53b:	7d 2e                	jge    56b <gets+0x49>
    cc = read(0, &c, 1);
 53d:	83 ec 04             	sub    $0x4,%esp
 540:	6a 01                	push   $0x1
 542:	8d 45 e7             	lea    -0x19(%ebp),%eax
 545:	50                   	push   %eax
 546:	6a 00                	push   $0x0
 548:	e8 ec 00 00 00       	call   639 <read>
    if(cc < 1)
 54d:	83 c4 10             	add    $0x10,%esp
 550:	85 c0                	test   %eax,%eax
 552:	7e 17                	jle    56b <gets+0x49>
      break;
    buf[i++] = c;
 554:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 558:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 55b:	3c 0a                	cmp    $0xa,%al
 55d:	0f 94 c2             	sete   %dl
 560:	3c 0d                	cmp    $0xd,%al
 562:	0f 94 c0             	sete   %al
 565:	08 c2                	or     %al,%dl
 567:	74 ca                	je     533 <gets+0x11>
    buf[i++] = c;
 569:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 56b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 56f:	89 f8                	mov    %edi,%eax
 571:	8d 65 f4             	lea    -0xc(%ebp),%esp
 574:	5b                   	pop    %ebx
 575:	5e                   	pop    %esi
 576:	5f                   	pop    %edi
 577:	5d                   	pop    %ebp
 578:	c3                   	ret    

00000579 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	56                   	push   %esi
 594:	53                   	push   %ebx
=======
 579:	55                   	push   %ebp
 57a:	89 e5                	mov    %esp,%ebp
 57c:	56                   	push   %esi
 57d:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 595:	83 ec 08             	sub    $0x8,%esp
 598:	6a 00                	push   $0x0
 59a:	ff 75 08             	push   0x8(%ebp)
 59d:	e8 d6 00 00 00       	call   678 <open>
  if(fd < 0)
 5a2:	83 c4 10             	add    $0x10,%esp
 5a5:	85 c0                	test   %eax,%eax
 5a7:	78 24                	js     5cd <stat+0x3d>
 5a9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5ab:	83 ec 08             	sub    $0x8,%esp
 5ae:	ff 75 0c             	push   0xc(%ebp)
 5b1:	50                   	push   %eax
 5b2:	e8 d9 00 00 00       	call   690 <fstat>
 5b7:	89 c6                	mov    %eax,%esi
  close(fd);
 5b9:	89 1c 24             	mov    %ebx,(%esp)
 5bc:	e8 9f 00 00 00       	call   660 <close>
  return r;
 5c1:	83 c4 10             	add    $0x10,%esp
}
 5c4:	89 f0                	mov    %esi,%eax
 5c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5c9:	5b                   	pop    %ebx
 5ca:	5e                   	pop    %esi
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret    
    return -1;
 5cd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5d2:	eb f0                	jmp    5c4 <stat+0x34>

000005d4 <atoi>:
=======
 57e:	83 ec 08             	sub    $0x8,%esp
 581:	6a 00                	push   $0x0
 583:	ff 75 08             	push   0x8(%ebp)
 586:	e8 d6 00 00 00       	call   661 <open>
  if(fd < 0)
 58b:	83 c4 10             	add    $0x10,%esp
 58e:	85 c0                	test   %eax,%eax
 590:	78 24                	js     5b6 <stat+0x3d>
 592:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 594:	83 ec 08             	sub    $0x8,%esp
 597:	ff 75 0c             	push   0xc(%ebp)
 59a:	50                   	push   %eax
 59b:	e8 d9 00 00 00       	call   679 <fstat>
 5a0:	89 c6                	mov    %eax,%esi
  close(fd);
 5a2:	89 1c 24             	mov    %ebx,(%esp)
 5a5:	e8 9f 00 00 00       	call   649 <close>
  return r;
 5aa:	83 c4 10             	add    $0x10,%esp
}
 5ad:	89 f0                	mov    %esi,%eax
 5af:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5b2:	5b                   	pop    %ebx
 5b3:	5e                   	pop    %esi
 5b4:	5d                   	pop    %ebp
 5b5:	c3                   	ret    
    return -1;
 5b6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5bb:	eb f0                	jmp    5ad <stat+0x34>

000005bd <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	53                   	push   %ebx
 5d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5db:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5e0:	eb 10                	jmp    5f2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5e2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5e5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5e8:	83 c1 01             	add    $0x1,%ecx
 5eb:	0f be c0             	movsbl %al,%eax
 5ee:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5f2:	0f b6 01             	movzbl (%ecx),%eax
 5f5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5f8:	80 fb 09             	cmp    $0x9,%bl
 5fb:	76 e5                	jbe    5e2 <atoi+0xe>
  return n;
}
 5fd:	89 d0                	mov    %edx,%eax
 5ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 602:	c9                   	leave  
 603:	c3                   	ret    

00000604 <memmove>:
=======
 5bd:	55                   	push   %ebp
 5be:	89 e5                	mov    %esp,%ebp
 5c0:	53                   	push   %ebx
 5c1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5c4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5c9:	eb 10                	jmp    5db <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5cb:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5ce:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5d1:	83 c1 01             	add    $0x1,%ecx
 5d4:	0f be c0             	movsbl %al,%eax
 5d7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5db:	0f b6 01             	movzbl (%ecx),%eax
 5de:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5e1:	80 fb 09             	cmp    $0x9,%bl
 5e4:	76 e5                	jbe    5cb <atoi+0xe>
  return n;
}
 5e6:	89 d0                	mov    %edx,%eax
 5e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5eb:	c9                   	leave  
 5ec:	c3                   	ret    

000005ed <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	56                   	push   %esi
 608:	53                   	push   %ebx
 609:	8b 75 08             	mov    0x8(%ebp),%esi
 60c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 60f:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 5ed:	55                   	push   %ebp
 5ee:	89 e5                	mov    %esp,%ebp
 5f0:	56                   	push   %esi
 5f1:	53                   	push   %ebx
 5f2:	8b 75 08             	mov    0x8(%ebp),%esi
 5f5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5f8:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 612:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 614:	eb 0d                	jmp    623 <memmove+0x1f>
    *dst++ = *src++;
 616:	0f b6 01             	movzbl (%ecx),%eax
 619:	88 02                	mov    %al,(%edx)
 61b:	8d 49 01             	lea    0x1(%ecx),%ecx
 61e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 621:	89 d8                	mov    %ebx,%eax
 623:	8d 58 ff             	lea    -0x1(%eax),%ebx
 626:	85 c0                	test   %eax,%eax
 628:	7f ec                	jg     616 <memmove+0x12>
  return vdst;
}
 62a:	89 f0                	mov    %esi,%eax
 62c:	5b                   	pop    %ebx
 62d:	5e                   	pop    %esi
 62e:	5d                   	pop    %ebp
 62f:	c3                   	ret    

00000630 <fork>:
=======
 5fb:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5fd:	eb 0d                	jmp    60c <memmove+0x1f>
    *dst++ = *src++;
 5ff:	0f b6 01             	movzbl (%ecx),%eax
 602:	88 02                	mov    %al,(%edx)
 604:	8d 49 01             	lea    0x1(%ecx),%ecx
 607:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 60a:	89 d8                	mov    %ebx,%eax
 60c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 60f:	85 c0                	test   %eax,%eax
 611:	7f ec                	jg     5ff <memmove+0x12>
  return vdst;
}
 613:	89 f0                	mov    %esi,%eax
 615:	5b                   	pop    %ebx
 616:	5e                   	pop    %esi
 617:	5d                   	pop    %ebp
 618:	c3                   	ret    

00000619 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 630:	b8 01 00 00 00       	mov    $0x1,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <exit>:
SYSCALL(exit)
 638:	b8 02 00 00 00       	mov    $0x2,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <wait>:
SYSCALL(wait)
 640:	b8 03 00 00 00       	mov    $0x3,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <pipe>:
SYSCALL(pipe)
 648:	b8 04 00 00 00       	mov    $0x4,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <read>:
SYSCALL(read)
 650:	b8 05 00 00 00       	mov    $0x5,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <write>:
SYSCALL(write)
 658:	b8 10 00 00 00       	mov    $0x10,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <close>:
SYSCALL(close)
 660:	b8 15 00 00 00       	mov    $0x15,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <kill>:
SYSCALL(kill)
 668:	b8 06 00 00 00       	mov    $0x6,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <exec>:
SYSCALL(exec)
 670:	b8 07 00 00 00       	mov    $0x7,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <open>:
SYSCALL(open)
 678:	b8 0f 00 00 00       	mov    $0xf,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <mknod>:
SYSCALL(mknod)
 680:	b8 11 00 00 00       	mov    $0x11,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <unlink>:
SYSCALL(unlink)
 688:	b8 12 00 00 00       	mov    $0x12,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <fstat>:
SYSCALL(fstat)
 690:	b8 08 00 00 00       	mov    $0x8,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <link>:
SYSCALL(link)
 698:	b8 13 00 00 00       	mov    $0x13,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <mkdir>:
SYSCALL(mkdir)
 6a0:	b8 14 00 00 00       	mov    $0x14,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <chdir>:
SYSCALL(chdir)
 6a8:	b8 09 00 00 00       	mov    $0x9,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <dup>:
SYSCALL(dup)
 6b0:	b8 0a 00 00 00       	mov    $0xa,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <getpid>:
SYSCALL(getpid)
 6b8:	b8 0b 00 00 00       	mov    $0xb,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <sbrk>:
SYSCALL(sbrk)
 6c0:	b8 0c 00 00 00       	mov    $0xc,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <sleep>:
SYSCALL(sleep)
 6c8:	b8 0d 00 00 00       	mov    $0xd,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <uptime>:
SYSCALL(uptime)
 6d0:	b8 0e 00 00 00       	mov    $0xe,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <clone>:
SYSCALL(clone)
 6d8:	b8 16 00 00 00       	mov    $0x16,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <join>:
 6e0:	b8 17 00 00 00       	mov    $0x17,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <putc>:
=======
 619:	b8 01 00 00 00       	mov    $0x1,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <exit>:
SYSCALL(exit)
 621:	b8 02 00 00 00       	mov    $0x2,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <wait>:
SYSCALL(wait)
 629:	b8 03 00 00 00       	mov    $0x3,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <pipe>:
SYSCALL(pipe)
 631:	b8 04 00 00 00       	mov    $0x4,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <read>:
SYSCALL(read)
 639:	b8 05 00 00 00       	mov    $0x5,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <write>:
SYSCALL(write)
 641:	b8 10 00 00 00       	mov    $0x10,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <close>:
SYSCALL(close)
 649:	b8 15 00 00 00       	mov    $0x15,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <kill>:
SYSCALL(kill)
 651:	b8 06 00 00 00       	mov    $0x6,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <exec>:
SYSCALL(exec)
 659:	b8 07 00 00 00       	mov    $0x7,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <open>:
SYSCALL(open)
 661:	b8 0f 00 00 00       	mov    $0xf,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <mknod>:
SYSCALL(mknod)
 669:	b8 11 00 00 00       	mov    $0x11,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <unlink>:
SYSCALL(unlink)
 671:	b8 12 00 00 00       	mov    $0x12,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <fstat>:
SYSCALL(fstat)
 679:	b8 08 00 00 00       	mov    $0x8,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <link>:
SYSCALL(link)
 681:	b8 13 00 00 00       	mov    $0x13,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <mkdir>:
SYSCALL(mkdir)
 689:	b8 14 00 00 00       	mov    $0x14,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <chdir>:
SYSCALL(chdir)
 691:	b8 09 00 00 00       	mov    $0x9,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <dup>:
SYSCALL(dup)
 699:	b8 0a 00 00 00       	mov    $0xa,%eax
 69e:	cd 40                	int    $0x40
 6a0:	c3                   	ret    

000006a1 <getpid>:
SYSCALL(getpid)
 6a1:	b8 0b 00 00 00       	mov    $0xb,%eax
 6a6:	cd 40                	int    $0x40
 6a8:	c3                   	ret    

000006a9 <sbrk>:
SYSCALL(sbrk)
 6a9:	b8 0c 00 00 00       	mov    $0xc,%eax
 6ae:	cd 40                	int    $0x40
 6b0:	c3                   	ret    

000006b1 <sleep>:
SYSCALL(sleep)
 6b1:	b8 0d 00 00 00       	mov    $0xd,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <uptime>:
SYSCALL(uptime)
 6b9:	b8 0e 00 00 00       	mov    $0xe,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <clone>:
SYSCALL(clone)
 6c1:	b8 16 00 00 00       	mov    $0x16,%eax
 6c6:	cd 40                	int    $0x40
 6c8:	c3                   	ret    

000006c9 <join>:
 6c9:	b8 17 00 00 00       	mov    $0x17,%eax
 6ce:	cd 40                	int    $0x40
 6d0:	c3                   	ret    

000006d1 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 6e8:	55                   	push   %ebp
 6e9:	89 e5                	mov    %esp,%ebp
 6eb:	83 ec 1c             	sub    $0x1c,%esp
 6ee:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6f1:	6a 01                	push   $0x1
 6f3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6f6:	52                   	push   %edx
 6f7:	50                   	push   %eax
 6f8:	e8 5b ff ff ff       	call   658 <write>
}
 6fd:	83 c4 10             	add    $0x10,%esp
 700:	c9                   	leave  
 701:	c3                   	ret    

00000702 <printint>:
=======
 6d1:	55                   	push   %ebp
 6d2:	89 e5                	mov    %esp,%ebp
 6d4:	83 ec 1c             	sub    $0x1c,%esp
 6d7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6da:	6a 01                	push   $0x1
 6dc:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6df:	52                   	push   %edx
 6e0:	50                   	push   %eax
 6e1:	e8 5b ff ff ff       	call   641 <write>
}
 6e6:	83 c4 10             	add    $0x10,%esp
 6e9:	c9                   	leave  
 6ea:	c3                   	ret    

000006eb <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 702:	55                   	push   %ebp
 703:	89 e5                	mov    %esp,%ebp
 705:	57                   	push   %edi
 706:	56                   	push   %esi
 707:	53                   	push   %ebx
 708:	83 ec 2c             	sub    $0x2c,%esp
 70b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 70e:	89 d0                	mov    %edx,%eax
 710:	89 ce                	mov    %ecx,%esi
=======
 6eb:	55                   	push   %ebp
 6ec:	89 e5                	mov    %esp,%ebp
 6ee:	57                   	push   %edi
 6ef:	56                   	push   %esi
 6f0:	53                   	push   %ebx
 6f1:	83 ec 2c             	sub    $0x2c,%esp
 6f4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6f7:	89 d0                	mov    %edx,%eax
 6f9:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 712:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 716:	0f 95 c1             	setne  %cl
 719:	c1 ea 1f             	shr    $0x1f,%edx
 71c:	84 d1                	test   %dl,%cl
 71e:	74 44                	je     764 <printint+0x62>
    neg = 1;
    x = -xx;
 720:	f7 d8                	neg    %eax
 722:	89 c1                	mov    %eax,%ecx
    neg = 1;
 724:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 6fb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6ff:	0f 95 c1             	setne  %cl
 702:	c1 ea 1f             	shr    $0x1f,%edx
 705:	84 d1                	test   %dl,%cl
 707:	74 44                	je     74d <printint+0x62>
    neg = 1;
    x = -xx;
 709:	f7 d8                	neg    %eax
 70b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 70d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 72b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 730:	89 c8                	mov    %ecx,%eax
 732:	ba 00 00 00 00       	mov    $0x0,%edx
 737:	f7 f6                	div    %esi
 739:	89 df                	mov    %ebx,%edi
 73b:	83 c3 01             	add    $0x1,%ebx
 73e:	0f b6 92 58 0b 00 00 	movzbl 0xb58(%edx),%edx
 745:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 749:	89 ca                	mov    %ecx,%edx
 74b:	89 c1                	mov    %eax,%ecx
 74d:	39 d6                	cmp    %edx,%esi
 74f:	76 df                	jbe    730 <printint+0x2e>
  if(neg)
 751:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 755:	74 31                	je     788 <printint+0x86>
    buf[i++] = '-';
 757:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 75c:	8d 5f 02             	lea    0x2(%edi),%ebx
 75f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 762:	eb 17                	jmp    77b <printint+0x79>
    x = xx;
 764:	89 c1                	mov    %eax,%ecx
  neg = 0;
 766:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 76d:	eb bc                	jmp    72b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 76f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 774:	89 f0                	mov    %esi,%eax
 776:	e8 6d ff ff ff       	call   6e8 <putc>
  while(--i >= 0)
 77b:	83 eb 01             	sub    $0x1,%ebx
 77e:	79 ef                	jns    76f <printint+0x6d>
}
 780:	83 c4 2c             	add    $0x2c,%esp
 783:	5b                   	pop    %ebx
 784:	5e                   	pop    %esi
 785:	5f                   	pop    %edi
 786:	5d                   	pop    %ebp
 787:	c3                   	ret    
 788:	8b 75 d0             	mov    -0x30(%ebp),%esi
 78b:	eb ee                	jmp    77b <printint+0x79>

0000078d <printf>:
=======
 714:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 719:	89 c8                	mov    %ecx,%eax
 71b:	ba 00 00 00 00       	mov    $0x0,%edx
 720:	f7 f6                	div    %esi
 722:	89 df                	mov    %ebx,%edi
 724:	83 c3 01             	add    $0x1,%ebx
 727:	0f b6 92 40 0b 00 00 	movzbl 0xb40(%edx),%edx
 72e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 732:	89 ca                	mov    %ecx,%edx
 734:	89 c1                	mov    %eax,%ecx
 736:	39 d6                	cmp    %edx,%esi
 738:	76 df                	jbe    719 <printint+0x2e>
  if(neg)
 73a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 73e:	74 31                	je     771 <printint+0x86>
    buf[i++] = '-';
 740:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 745:	8d 5f 02             	lea    0x2(%edi),%ebx
 748:	8b 75 d0             	mov    -0x30(%ebp),%esi
 74b:	eb 17                	jmp    764 <printint+0x79>
    x = xx;
 74d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 74f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 756:	eb bc                	jmp    714 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 758:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 75d:	89 f0                	mov    %esi,%eax
 75f:	e8 6d ff ff ff       	call   6d1 <putc>
  while(--i >= 0)
 764:	83 eb 01             	sub    $0x1,%ebx
 767:	79 ef                	jns    758 <printint+0x6d>
}
 769:	83 c4 2c             	add    $0x2c,%esp
 76c:	5b                   	pop    %ebx
 76d:	5e                   	pop    %esi
 76e:	5f                   	pop    %edi
 76f:	5d                   	pop    %ebp
 770:	c3                   	ret    
 771:	8b 75 d0             	mov    -0x30(%ebp),%esi
 774:	eb ee                	jmp    764 <printint+0x79>

00000776 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 78d:	55                   	push   %ebp
 78e:	89 e5                	mov    %esp,%ebp
 790:	57                   	push   %edi
 791:	56                   	push   %esi
 792:	53                   	push   %ebx
 793:	83 ec 1c             	sub    $0x1c,%esp
=======
 776:	55                   	push   %ebp
 777:	89 e5                	mov    %esp,%ebp
 779:	57                   	push   %edi
 77a:	56                   	push   %esi
 77b:	53                   	push   %ebx
 77c:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 796:	8d 45 10             	lea    0x10(%ebp),%eax
 799:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 79c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7a1:	bb 00 00 00 00       	mov    $0x0,%ebx
 7a6:	eb 14                	jmp    7bc <printf+0x2f>
=======
 77f:	8d 45 10             	lea    0x10(%ebp),%eax
 782:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 785:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 78a:	bb 00 00 00 00       	mov    $0x0,%ebx
 78f:	eb 14                	jmp    7a5 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 7a8:	89 fa                	mov    %edi,%edx
 7aa:	8b 45 08             	mov    0x8(%ebp),%eax
 7ad:	e8 36 ff ff ff       	call   6e8 <putc>
 7b2:	eb 05                	jmp    7b9 <printf+0x2c>
      }
    } else if(state == '%'){
 7b4:	83 fe 25             	cmp    $0x25,%esi
 7b7:	74 25                	je     7de <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7b9:	83 c3 01             	add    $0x1,%ebx
 7bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 7bf:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7c3:	84 c0                	test   %al,%al
 7c5:	0f 84 20 01 00 00    	je     8eb <printf+0x15e>
    c = fmt[i] & 0xff;
 7cb:	0f be f8             	movsbl %al,%edi
 7ce:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7d1:	85 f6                	test   %esi,%esi
 7d3:	75 df                	jne    7b4 <printf+0x27>
      if(c == '%'){
 7d5:	83 f8 25             	cmp    $0x25,%eax
 7d8:	75 ce                	jne    7a8 <printf+0x1b>
        state = '%';
 7da:	89 c6                	mov    %eax,%esi
 7dc:	eb db                	jmp    7b9 <printf+0x2c>
      if(c == 'd'){
 7de:	83 f8 25             	cmp    $0x25,%eax
 7e1:	0f 84 cf 00 00 00    	je     8b6 <printf+0x129>
 7e7:	0f 8c dd 00 00 00    	jl     8ca <printf+0x13d>
 7ed:	83 f8 78             	cmp    $0x78,%eax
 7f0:	0f 8f d4 00 00 00    	jg     8ca <printf+0x13d>
 7f6:	83 f8 63             	cmp    $0x63,%eax
 7f9:	0f 8c cb 00 00 00    	jl     8ca <printf+0x13d>
 7ff:	83 e8 63             	sub    $0x63,%eax
 802:	83 f8 15             	cmp    $0x15,%eax
 805:	0f 87 bf 00 00 00    	ja     8ca <printf+0x13d>
 80b:	ff 24 85 00 0b 00 00 	jmp    *0xb00(,%eax,4)
        printint(fd, *ap, 10, 1);
 812:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 815:	8b 17                	mov    (%edi),%edx
 817:	83 ec 0c             	sub    $0xc,%esp
 81a:	6a 01                	push   $0x1
 81c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	e8 d9 fe ff ff       	call   702 <printint>
        ap++;
 829:	83 c7 04             	add    $0x4,%edi
 82c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 82f:	83 c4 10             	add    $0x10,%esp
=======
 791:	89 fa                	mov    %edi,%edx
 793:	8b 45 08             	mov    0x8(%ebp),%eax
 796:	e8 36 ff ff ff       	call   6d1 <putc>
 79b:	eb 05                	jmp    7a2 <printf+0x2c>
      }
    } else if(state == '%'){
 79d:	83 fe 25             	cmp    $0x25,%esi
 7a0:	74 25                	je     7c7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7a2:	83 c3 01             	add    $0x1,%ebx
 7a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 7a8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7ac:	84 c0                	test   %al,%al
 7ae:	0f 84 20 01 00 00    	je     8d4 <printf+0x15e>
    c = fmt[i] & 0xff;
 7b4:	0f be f8             	movsbl %al,%edi
 7b7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7ba:	85 f6                	test   %esi,%esi
 7bc:	75 df                	jne    79d <printf+0x27>
      if(c == '%'){
 7be:	83 f8 25             	cmp    $0x25,%eax
 7c1:	75 ce                	jne    791 <printf+0x1b>
        state = '%';
 7c3:	89 c6                	mov    %eax,%esi
 7c5:	eb db                	jmp    7a2 <printf+0x2c>
      if(c == 'd'){
 7c7:	83 f8 25             	cmp    $0x25,%eax
 7ca:	0f 84 cf 00 00 00    	je     89f <printf+0x129>
 7d0:	0f 8c dd 00 00 00    	jl     8b3 <printf+0x13d>
 7d6:	83 f8 78             	cmp    $0x78,%eax
 7d9:	0f 8f d4 00 00 00    	jg     8b3 <printf+0x13d>
 7df:	83 f8 63             	cmp    $0x63,%eax
 7e2:	0f 8c cb 00 00 00    	jl     8b3 <printf+0x13d>
 7e8:	83 e8 63             	sub    $0x63,%eax
 7eb:	83 f8 15             	cmp    $0x15,%eax
 7ee:	0f 87 bf 00 00 00    	ja     8b3 <printf+0x13d>
 7f4:	ff 24 85 e8 0a 00 00 	jmp    *0xae8(,%eax,4)
        printint(fd, *ap, 10, 1);
 7fb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7fe:	8b 17                	mov    (%edi),%edx
 800:	83 ec 0c             	sub    $0xc,%esp
 803:	6a 01                	push   $0x1
 805:	b9 0a 00 00 00       	mov    $0xa,%ecx
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	e8 d9 fe ff ff       	call   6eb <printint>
        ap++;
 812:	83 c7 04             	add    $0x4,%edi
 815:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 818:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 832:	be 00 00 00 00       	mov    $0x0,%esi
 837:	eb 80                	jmp    7b9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 839:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 83c:	8b 17                	mov    (%edi),%edx
 83e:	83 ec 0c             	sub    $0xc,%esp
 841:	6a 00                	push   $0x0
 843:	b9 10 00 00 00       	mov    $0x10,%ecx
 848:	8b 45 08             	mov    0x8(%ebp),%eax
 84b:	e8 b2 fe ff ff       	call   702 <printint>
        ap++;
 850:	83 c7 04             	add    $0x4,%edi
 853:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 856:	83 c4 10             	add    $0x10,%esp
      state = 0;
 859:	be 00 00 00 00       	mov    $0x0,%esi
 85e:	e9 56 ff ff ff       	jmp    7b9 <printf+0x2c>
        s = (char*)*ap;
 863:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 866:	8b 30                	mov    (%eax),%esi
        ap++;
 868:	83 c0 04             	add    $0x4,%eax
 86b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 86e:	85 f6                	test   %esi,%esi
 870:	75 15                	jne    887 <printf+0xfa>
          s = "(null)";
 872:	be f8 0a 00 00       	mov    $0xaf8,%esi
 877:	eb 0e                	jmp    887 <printf+0xfa>
          putc(fd, *s);
 879:	0f be d2             	movsbl %dl,%edx
 87c:	8b 45 08             	mov    0x8(%ebp),%eax
 87f:	e8 64 fe ff ff       	call   6e8 <putc>
          s++;
 884:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 887:	0f b6 16             	movzbl (%esi),%edx
 88a:	84 d2                	test   %dl,%dl
 88c:	75 eb                	jne    879 <printf+0xec>
      state = 0;
 88e:	be 00 00 00 00       	mov    $0x0,%esi
 893:	e9 21 ff ff ff       	jmp    7b9 <printf+0x2c>
        putc(fd, *ap);
 898:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 89b:	0f be 17             	movsbl (%edi),%edx
 89e:	8b 45 08             	mov    0x8(%ebp),%eax
 8a1:	e8 42 fe ff ff       	call   6e8 <putc>
        ap++;
 8a6:	83 c7 04             	add    $0x4,%edi
 8a9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8ac:	be 00 00 00 00       	mov    $0x0,%esi
 8b1:	e9 03 ff ff ff       	jmp    7b9 <printf+0x2c>
        putc(fd, c);
 8b6:	89 fa                	mov    %edi,%edx
 8b8:	8b 45 08             	mov    0x8(%ebp),%eax
 8bb:	e8 28 fe ff ff       	call   6e8 <putc>
      state = 0;
 8c0:	be 00 00 00 00       	mov    $0x0,%esi
 8c5:	e9 ef fe ff ff       	jmp    7b9 <printf+0x2c>
        putc(fd, '%');
 8ca:	ba 25 00 00 00       	mov    $0x25,%edx
 8cf:	8b 45 08             	mov    0x8(%ebp),%eax
 8d2:	e8 11 fe ff ff       	call   6e8 <putc>
        putc(fd, c);
 8d7:	89 fa                	mov    %edi,%edx
 8d9:	8b 45 08             	mov    0x8(%ebp),%eax
 8dc:	e8 07 fe ff ff       	call   6e8 <putc>
      state = 0;
 8e1:	be 00 00 00 00       	mov    $0x0,%esi
 8e6:	e9 ce fe ff ff       	jmp    7b9 <printf+0x2c>
    }
  }
}
 8eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ee:	5b                   	pop    %ebx
 8ef:	5e                   	pop    %esi
 8f0:	5f                   	pop    %edi
 8f1:	5d                   	pop    %ebp
 8f2:	c3                   	ret    

000008f3 <free>:
=======
 81b:	be 00 00 00 00       	mov    $0x0,%esi
 820:	eb 80                	jmp    7a2 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 822:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 825:	8b 17                	mov    (%edi),%edx
 827:	83 ec 0c             	sub    $0xc,%esp
 82a:	6a 00                	push   $0x0
 82c:	b9 10 00 00 00       	mov    $0x10,%ecx
 831:	8b 45 08             	mov    0x8(%ebp),%eax
 834:	e8 b2 fe ff ff       	call   6eb <printint>
        ap++;
 839:	83 c7 04             	add    $0x4,%edi
 83c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 83f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 842:	be 00 00 00 00       	mov    $0x0,%esi
 847:	e9 56 ff ff ff       	jmp    7a2 <printf+0x2c>
        s = (char*)*ap;
 84c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 84f:	8b 30                	mov    (%eax),%esi
        ap++;
 851:	83 c0 04             	add    $0x4,%eax
 854:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 857:	85 f6                	test   %esi,%esi
 859:	75 15                	jne    870 <printf+0xfa>
          s = "(null)";
 85b:	be e0 0a 00 00       	mov    $0xae0,%esi
 860:	eb 0e                	jmp    870 <printf+0xfa>
          putc(fd, *s);
 862:	0f be d2             	movsbl %dl,%edx
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	e8 64 fe ff ff       	call   6d1 <putc>
          s++;
 86d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 870:	0f b6 16             	movzbl (%esi),%edx
 873:	84 d2                	test   %dl,%dl
 875:	75 eb                	jne    862 <printf+0xec>
      state = 0;
 877:	be 00 00 00 00       	mov    $0x0,%esi
 87c:	e9 21 ff ff ff       	jmp    7a2 <printf+0x2c>
        putc(fd, *ap);
 881:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 884:	0f be 17             	movsbl (%edi),%edx
 887:	8b 45 08             	mov    0x8(%ebp),%eax
 88a:	e8 42 fe ff ff       	call   6d1 <putc>
        ap++;
 88f:	83 c7 04             	add    $0x4,%edi
 892:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 895:	be 00 00 00 00       	mov    $0x0,%esi
 89a:	e9 03 ff ff ff       	jmp    7a2 <printf+0x2c>
        putc(fd, c);
 89f:	89 fa                	mov    %edi,%edx
 8a1:	8b 45 08             	mov    0x8(%ebp),%eax
 8a4:	e8 28 fe ff ff       	call   6d1 <putc>
      state = 0;
 8a9:	be 00 00 00 00       	mov    $0x0,%esi
 8ae:	e9 ef fe ff ff       	jmp    7a2 <printf+0x2c>
        putc(fd, '%');
 8b3:	ba 25 00 00 00       	mov    $0x25,%edx
 8b8:	8b 45 08             	mov    0x8(%ebp),%eax
 8bb:	e8 11 fe ff ff       	call   6d1 <putc>
        putc(fd, c);
 8c0:	89 fa                	mov    %edi,%edx
 8c2:	8b 45 08             	mov    0x8(%ebp),%eax
 8c5:	e8 07 fe ff ff       	call   6d1 <putc>
      state = 0;
 8ca:	be 00 00 00 00       	mov    $0x0,%esi
 8cf:	e9 ce fe ff ff       	jmp    7a2 <printf+0x2c>
    }
  }
}
 8d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8d7:	5b                   	pop    %ebx
 8d8:	5e                   	pop    %esi
 8d9:	5f                   	pop    %edi
 8da:	5d                   	pop    %ebp
 8db:	c3                   	ret    

000008dc <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 8f3:	55                   	push   %ebp
 8f4:	89 e5                	mov    %esp,%ebp
 8f6:	57                   	push   %edi
 8f7:	56                   	push   %esi
 8f8:	53                   	push   %ebx
 8f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8fc:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ff:	a1 20 10 00 00       	mov    0x1020,%eax
 904:	eb 02                	jmp    908 <free+0x15>
 906:	89 d0                	mov    %edx,%eax
 908:	39 c8                	cmp    %ecx,%eax
 90a:	73 04                	jae    910 <free+0x1d>
 90c:	39 08                	cmp    %ecx,(%eax)
 90e:	77 12                	ja     922 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 910:	8b 10                	mov    (%eax),%edx
 912:	39 c2                	cmp    %eax,%edx
 914:	77 f0                	ja     906 <free+0x13>
 916:	39 c8                	cmp    %ecx,%eax
 918:	72 08                	jb     922 <free+0x2f>
 91a:	39 ca                	cmp    %ecx,%edx
 91c:	77 04                	ja     922 <free+0x2f>
 91e:	89 d0                	mov    %edx,%eax
 920:	eb e6                	jmp    908 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 922:	8b 73 fc             	mov    -0x4(%ebx),%esi
 925:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 928:	8b 10                	mov    (%eax),%edx
 92a:	39 d7                	cmp    %edx,%edi
 92c:	74 19                	je     947 <free+0x54>
=======
 8dc:	55                   	push   %ebp
 8dd:	89 e5                	mov    %esp,%ebp
 8df:	57                   	push   %edi
 8e0:	56                   	push   %esi
 8e1:	53                   	push   %ebx
 8e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8e5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e8:	a1 00 12 00 00       	mov    0x1200,%eax
 8ed:	eb 02                	jmp    8f1 <free+0x15>
 8ef:	89 d0                	mov    %edx,%eax
 8f1:	39 c8                	cmp    %ecx,%eax
 8f3:	73 04                	jae    8f9 <free+0x1d>
 8f5:	39 08                	cmp    %ecx,(%eax)
 8f7:	77 12                	ja     90b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8f9:	8b 10                	mov    (%eax),%edx
 8fb:	39 c2                	cmp    %eax,%edx
 8fd:	77 f0                	ja     8ef <free+0x13>
 8ff:	39 c8                	cmp    %ecx,%eax
 901:	72 08                	jb     90b <free+0x2f>
 903:	39 ca                	cmp    %ecx,%edx
 905:	77 04                	ja     90b <free+0x2f>
 907:	89 d0                	mov    %edx,%eax
 909:	eb e6                	jmp    8f1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 90b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 90e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 911:	8b 10                	mov    (%eax),%edx
 913:	39 d7                	cmp    %edx,%edi
 915:	74 19                	je     930 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 92e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 931:	8b 50 04             	mov    0x4(%eax),%edx
 934:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 937:	39 ce                	cmp    %ecx,%esi
 939:	74 1b                	je     956 <free+0x63>
=======
 917:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 91a:	8b 50 04             	mov    0x4(%eax),%edx
 91d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 920:	39 ce                	cmp    %ecx,%esi
 922:	74 1b                	je     93f <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 93b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 93d:	a3 20 10 00 00       	mov    %eax,0x1020
}
 942:	5b                   	pop    %ebx
 943:	5e                   	pop    %esi
 944:	5f                   	pop    %edi
 945:	5d                   	pop    %ebp
 946:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 947:	03 72 04             	add    0x4(%edx),%esi
 94a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 94d:	8b 10                	mov    (%eax),%edx
 94f:	8b 12                	mov    (%edx),%edx
 951:	89 53 f8             	mov    %edx,-0x8(%ebx)
 954:	eb db                	jmp    931 <free+0x3e>
    p->s.size += bp->s.size;
 956:	03 53 fc             	add    -0x4(%ebx),%edx
 959:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 95c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 95f:	89 10                	mov    %edx,(%eax)
 961:	eb da                	jmp    93d <free+0x4a>

00000963 <morecore>:
=======
 924:	89 08                	mov    %ecx,(%eax)
  freep = p;
 926:	a3 00 12 00 00       	mov    %eax,0x1200
}
 92b:	5b                   	pop    %ebx
 92c:	5e                   	pop    %esi
 92d:	5f                   	pop    %edi
 92e:	5d                   	pop    %ebp
 92f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 930:	03 72 04             	add    0x4(%edx),%esi
 933:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 936:	8b 10                	mov    (%eax),%edx
 938:	8b 12                	mov    (%edx),%edx
 93a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 93d:	eb db                	jmp    91a <free+0x3e>
    p->s.size += bp->s.size;
 93f:	03 53 fc             	add    -0x4(%ebx),%edx
 942:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 945:	8b 53 f8             	mov    -0x8(%ebx),%edx
 948:	89 10                	mov    %edx,(%eax)
 94a:	eb da                	jmp    926 <free+0x4a>

0000094c <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 963:	55                   	push   %ebp
 964:	89 e5                	mov    %esp,%ebp
 966:	53                   	push   %ebx
 967:	83 ec 04             	sub    $0x4,%esp
 96a:	89 c3                	mov    %eax,%ebx
=======
 94c:	55                   	push   %ebp
 94d:	89 e5                	mov    %esp,%ebp
 94f:	53                   	push   %ebx
 950:	83 ec 04             	sub    $0x4,%esp
 953:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 96c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 971:	77 05                	ja     978 <morecore+0x15>
    nu = 4096;
 973:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 978:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 97f:	83 ec 0c             	sub    $0xc,%esp
 982:	50                   	push   %eax
 983:	e8 38 fd ff ff       	call   6c0 <sbrk>
  if(p == (char*)-1)
 988:	83 c4 10             	add    $0x10,%esp
 98b:	83 f8 ff             	cmp    $0xffffffff,%eax
 98e:	74 1c                	je     9ac <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 990:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 993:	83 c0 08             	add    $0x8,%eax
 996:	83 ec 0c             	sub    $0xc,%esp
 999:	50                   	push   %eax
 99a:	e8 54 ff ff ff       	call   8f3 <free>
  return freep;
 99f:	a1 20 10 00 00       	mov    0x1020,%eax
 9a4:	83 c4 10             	add    $0x10,%esp
}
 9a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9aa:	c9                   	leave  
 9ab:	c3                   	ret    
    return 0;
 9ac:	b8 00 00 00 00       	mov    $0x0,%eax
 9b1:	eb f4                	jmp    9a7 <morecore+0x44>

000009b3 <malloc>:
=======
 955:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 95a:	77 05                	ja     961 <morecore+0x15>
    nu = 4096;
 95c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 961:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 968:	83 ec 0c             	sub    $0xc,%esp
 96b:	50                   	push   %eax
 96c:	e8 38 fd ff ff       	call   6a9 <sbrk>
  if(p == (char*)-1)
 971:	83 c4 10             	add    $0x10,%esp
 974:	83 f8 ff             	cmp    $0xffffffff,%eax
 977:	74 1c                	je     995 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 979:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 97c:	83 c0 08             	add    $0x8,%eax
 97f:	83 ec 0c             	sub    $0xc,%esp
 982:	50                   	push   %eax
 983:	e8 54 ff ff ff       	call   8dc <free>
  return freep;
 988:	a1 00 12 00 00       	mov    0x1200,%eax
 98d:	83 c4 10             	add    $0x10,%esp
}
 990:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 993:	c9                   	leave  
 994:	c3                   	ret    
    return 0;
 995:	b8 00 00 00 00       	mov    $0x0,%eax
 99a:	eb f4                	jmp    990 <morecore+0x44>

0000099c <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 9b3:	55                   	push   %ebp
 9b4:	89 e5                	mov    %esp,%ebp
 9b6:	53                   	push   %ebx
 9b7:	83 ec 04             	sub    $0x4,%esp
=======
 99c:	55                   	push   %ebp
 99d:	89 e5                	mov    %esp,%ebp
 99f:	53                   	push   %ebx
 9a0:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 9ba:	8b 45 08             	mov    0x8(%ebp),%eax
 9bd:	8d 58 07             	lea    0x7(%eax),%ebx
 9c0:	c1 eb 03             	shr    $0x3,%ebx
 9c3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9c6:	8b 0d 20 10 00 00    	mov    0x1020,%ecx
 9cc:	85 c9                	test   %ecx,%ecx
 9ce:	74 04                	je     9d4 <malloc+0x21>
=======
 9a3:	8b 45 08             	mov    0x8(%ebp),%eax
 9a6:	8d 58 07             	lea    0x7(%eax),%ebx
 9a9:	c1 eb 03             	shr    $0x3,%ebx
 9ac:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9af:	8b 0d 00 12 00 00    	mov    0x1200,%ecx
 9b5:	85 c9                	test   %ecx,%ecx
 9b7:	74 04                	je     9bd <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 9d0:	8b 01                	mov    (%ecx),%eax
 9d2:	eb 4a                	jmp    a1e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9d4:	c7 05 20 10 00 00 24 	movl   $0x1024,0x1020
 9db:	10 00 00 
 9de:	c7 05 24 10 00 00 24 	movl   $0x1024,0x1024
 9e5:	10 00 00 
    base.s.size = 0;
 9e8:	c7 05 28 10 00 00 00 	movl   $0x0,0x1028
 9ef:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9f2:	b9 24 10 00 00       	mov    $0x1024,%ecx
 9f7:	eb d7                	jmp    9d0 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9f9:	74 19                	je     a14 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9fb:	29 da                	sub    %ebx,%edx
 9fd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a00:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a03:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a06:	89 0d 20 10 00 00    	mov    %ecx,0x1020
      return (void*)(p + 1);
 a0c:	83 c0 08             	add    $0x8,%eax
=======
 9b9:	8b 01                	mov    (%ecx),%eax
 9bb:	eb 4a                	jmp    a07 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9bd:	c7 05 00 12 00 00 04 	movl   $0x1204,0x1200
 9c4:	12 00 00 
 9c7:	c7 05 04 12 00 00 04 	movl   $0x1204,0x1204
 9ce:	12 00 00 
    base.s.size = 0;
 9d1:	c7 05 08 12 00 00 00 	movl   $0x0,0x1208
 9d8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9db:	b9 04 12 00 00       	mov    $0x1204,%ecx
 9e0:	eb d7                	jmp    9b9 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9e2:	74 19                	je     9fd <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9e4:	29 da                	sub    %ebx,%edx
 9e6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9e9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9ec:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9ef:	89 0d 00 12 00 00    	mov    %ecx,0x1200
      return (void*)(p + 1);
 9f5:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 a0f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a12:	c9                   	leave  
 a13:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a14:	8b 10                	mov    (%eax),%edx
 a16:	89 11                	mov    %edx,(%ecx)
 a18:	eb ec                	jmp    a06 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1a:	89 c1                	mov    %eax,%ecx
 a1c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a1e:	8b 50 04             	mov    0x4(%eax),%edx
 a21:	39 da                	cmp    %ebx,%edx
 a23:	73 d4                	jae    9f9 <malloc+0x46>
    if(p == freep)
 a25:	39 05 20 10 00 00    	cmp    %eax,0x1020
 a2b:	75 ed                	jne    a1a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a2d:	89 d8                	mov    %ebx,%eax
 a2f:	e8 2f ff ff ff       	call   963 <morecore>
 a34:	85 c0                	test   %eax,%eax
 a36:	75 e2                	jne    a1a <malloc+0x67>
 a38:	eb d5                	jmp    a0f <malloc+0x5c>
=======
 9f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9fb:	c9                   	leave  
 9fc:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9fd:	8b 10                	mov    (%eax),%edx
 9ff:	89 11                	mov    %edx,(%ecx)
 a01:	eb ec                	jmp    9ef <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a03:	89 c1                	mov    %eax,%ecx
 a05:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a07:	8b 50 04             	mov    0x4(%eax),%edx
 a0a:	39 da                	cmp    %ebx,%edx
 a0c:	73 d4                	jae    9e2 <malloc+0x46>
    if(p == freep)
 a0e:	39 05 00 12 00 00    	cmp    %eax,0x1200
 a14:	75 ed                	jne    a03 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a16:	89 d8                	mov    %ebx,%eax
 a18:	e8 2f ff ff ff       	call   94c <morecore>
 a1d:	85 c0                	test   %eax,%eax
 a1f:	75 e2                	jne    a03 <malloc+0x67>
 a21:	eb d5                	jmp    9f8 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
