
_test_3:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 0c             	sub    $0xc,%esp
   assert(write(3, "hello\n", 6) == 6);
   6:	6a 06                	push   $0x6
<<<<<<< HEAD
   8:	68 70 09 00 00       	push   $0x970
   d:	6a 03                	push   $0x3
   f:	e8 78 05 00 00       	call   58c <write>
=======
   8:	68 58 09 00 00       	push   $0x958
   d:	6a 03                	push   $0x3
   f:	e8 61 05 00 00       	call   575 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
<<<<<<< HEAD
  1e:	68 77 09 00 00       	push   $0x977
  23:	68 80 09 00 00       	push   $0x980
  28:	6a 01                	push   $0x1
  2a:	e8 92 06 00 00       	call   6c1 <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 88 09 00 00       	push   $0x988
  37:	68 a4 09 00 00       	push   $0x9a4
  3c:	6a 01                	push   $0x1
  3e:	e8 7e 06 00 00       	call   6c1 <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 b8 09 00 00       	push   $0x9b8
  4b:	6a 01                	push   $0x1
  4d:	e8 6f 06 00 00       	call   6c1 <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 44 0e 00 00    	push   0xe44
  5b:	e8 3c 05 00 00       	call   59c <kill>
  60:	e8 07 05 00 00       	call   56c <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 c5 09 00 00       	push   $0x9c5
  72:	e8 35 05 00 00       	call   5ac <open>
=======
  1e:	68 5f 09 00 00       	push   $0x95f
  23:	68 68 09 00 00       	push   $0x968
  28:	6a 01                	push   $0x1
  2a:	e8 7b 06 00 00       	call   6aa <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 70 09 00 00       	push   $0x970
  37:	68 8c 09 00 00       	push   $0x98c
  3c:	6a 01                	push   $0x1
  3e:	e8 67 06 00 00       	call   6aa <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 a0 09 00 00       	push   $0x9a0
  4b:	6a 01                	push   $0x1
  4d:	e8 58 06 00 00       	call   6aa <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 24 0e 00 00    	push   0xe24
  5b:	e8 25 05 00 00       	call   585 <kill>
  60:	e8 f0 04 00 00       	call   555 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 ad 09 00 00       	push   $0x9ad
  72:	e8 1e 05 00 00       	call   595 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
<<<<<<< HEAD
  77:	f0 87 05 40 0e 00 00 	lock xchg %eax,0xe40
   exit();
  7e:	e8 e9 04 00 00       	call   56c <exit>
=======
  77:	f0 87 05 20 0e 00 00 	lock xchg %eax,0xe20
   exit();
  7e:	e8 d2 04 00 00       	call   555 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000083 <main>:
{
  83:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  87:	83 e4 f0             	and    $0xfffffff0,%esp
  8a:	ff 71 fc             	push   -0x4(%ecx)
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	51                   	push   %ecx
  93:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
<<<<<<< HEAD
  96:	e8 51 05 00 00       	call   5ec <getpid>
  9b:	a3 44 0e 00 00       	mov    %eax,0xe44
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 3a 08 00 00       	call   8e7 <malloc>
=======
  96:	e8 3a 05 00 00       	call   5d5 <getpid>
  9b:	a3 24 0e 00 00       	mov    %eax,0xe24
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 23 08 00 00       	call   8d0 <malloc>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(p != NULL);
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	85 c0                	test   %eax,%eax
  b2:	74 7d                	je     131 <main+0xae>
  b4:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b6:	25 ff 0f 00 00       	and    $0xfff,%eax
  bb:	0f 84 b9 00 00 00    	je     17a <main+0xf7>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  c1:	be 00 10 00 00       	mov    $0x1000,%esi
  c6:	29 c6                	sub    %eax,%esi
  c8:	01 de                	add    %ebx,%esi
   int fd = open("tmp", O_WRONLY|O_CREATE);
  ca:	83 ec 08             	sub    $0x8,%esp
  cd:	68 01 02 00 00       	push   $0x201
<<<<<<< HEAD
  d2:	68 d4 09 00 00       	push   $0x9d4
  d7:	e8 d0 04 00 00       	call   5ac <open>
=======
  d2:	68 bc 09 00 00       	push   $0x9bc
  d7:	e8 b9 04 00 00       	call   595 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
<<<<<<< HEAD
  ea:	68 77 09 00 00       	push   $0x977
  ef:	68 80 09 00 00       	push   $0x980
  f4:	6a 01                	push   $0x1
  f6:	e8 c6 05 00 00       	call   6c1 <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 d8 09 00 00       	push   $0x9d8
 103:	68 a4 09 00 00       	push   $0x9a4
 108:	6a 01                	push   $0x1
 10a:	e8 b2 05 00 00       	call   6c1 <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 b8 09 00 00       	push   $0x9b8
 117:	6a 01                	push   $0x1
 119:	e8 a3 05 00 00       	call   6c1 <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 44 0e 00 00    	push   0xe44
 127:	e8 70 04 00 00       	call   59c <kill>
 12c:	e8 3b 04 00 00       	call   56c <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 77 09 00 00       	push   $0x977
 138:	68 80 09 00 00       	push   $0x980
 13d:	6a 01                	push   $0x1
 13f:	e8 7d 05 00 00       	call   6c1 <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 ca 09 00 00       	push   $0x9ca
 14c:	68 a4 09 00 00       	push   $0x9a4
 151:	6a 01                	push   $0x1
 153:	e8 69 05 00 00       	call   6c1 <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 b8 09 00 00       	push   $0x9b8
 160:	6a 01                	push   $0x1
 162:	e8 5a 05 00 00       	call   6c1 <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 44 0e 00 00    	push   0xe44
 170:	e8 27 04 00 00       	call   59c <kill>
 175:	e8 f2 03 00 00       	call   56c <exit>
=======
  ea:	68 5f 09 00 00       	push   $0x95f
  ef:	68 68 09 00 00       	push   $0x968
  f4:	6a 01                	push   $0x1
  f6:	e8 af 05 00 00       	call   6aa <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 c0 09 00 00       	push   $0x9c0
 103:	68 8c 09 00 00       	push   $0x98c
 108:	6a 01                	push   $0x1
 10a:	e8 9b 05 00 00       	call   6aa <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 a0 09 00 00       	push   $0x9a0
 117:	6a 01                	push   $0x1
 119:	e8 8c 05 00 00       	call   6aa <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 24 0e 00 00    	push   0xe24
 127:	e8 59 04 00 00       	call   585 <kill>
 12c:	e8 24 04 00 00       	call   555 <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 5f 09 00 00       	push   $0x95f
 138:	68 68 09 00 00       	push   $0x968
 13d:	6a 01                	push   $0x1
 13f:	e8 66 05 00 00       	call   6aa <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 b2 09 00 00       	push   $0x9b2
 14c:	68 8c 09 00 00       	push   $0x98c
 151:	6a 01                	push   $0x1
 153:	e8 52 05 00 00       	call   6aa <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 a0 09 00 00       	push   $0x9a0
 160:	6a 01                	push   $0x1
 162:	e8 43 05 00 00       	call   6aa <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 24 0e 00 00    	push   0xe24
 170:	e8 10 04 00 00       	call   585 <kill>
 175:	e8 db 03 00 00       	call   555 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
<<<<<<< HEAD
 18b:	e8 7c 04 00 00       	call   60c <clone>
=======
 18b:	e8 65 04 00 00       	call   5f5 <clone>
>>>>>>> c59b0f9 (fixed thread_join and join)
 190:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	7e 73                	jle    20c <main+0x189>
   while(!newfd);
<<<<<<< HEAD
 199:	a1 40 0e 00 00       	mov    0xe40,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 40 0e 00 00       	mov    0xe40,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 ee 09 00 00       	push   $0x9ee
 1b1:	50                   	push   %eax
 1b2:	e8 d5 03 00 00       	call   58c <write>
=======
 199:	a1 20 0e 00 00       	mov    0xe20,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 20 0e 00 00       	mov    0xe20,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 d6 09 00 00       	push   $0x9d6
 1b1:	50                   	push   %eax
 1b2:	e8 be 03 00 00       	call   575 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
<<<<<<< HEAD
 1c5:	68 77 09 00 00       	push   $0x977
 1ca:	68 80 09 00 00       	push   $0x980
 1cf:	6a 01                	push   $0x1
 1d1:	e8 eb 04 00 00       	call   6c1 <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 1c 0a 00 00       	push   $0xa1c
 1de:	68 a4 09 00 00       	push   $0x9a4
 1e3:	6a 01                	push   $0x1
 1e5:	e8 d7 04 00 00       	call   6c1 <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 b8 09 00 00       	push   $0x9b8
 1f2:	6a 01                	push   $0x1
 1f4:	e8 c8 04 00 00       	call   6c1 <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 44 0e 00 00    	push   0xe44
 202:	e8 95 03 00 00       	call   59c <kill>
 207:	e8 60 03 00 00       	call   56c <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 77 09 00 00       	push   $0x977
 213:	68 80 09 00 00       	push   $0x980
 218:	6a 01                	push   $0x1
 21a:	e8 a2 04 00 00       	call   6c1 <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 e0 09 00 00       	push   $0x9e0
 227:	68 a4 09 00 00       	push   $0x9a4
 22c:	6a 01                	push   $0x1
 22e:	e8 8e 04 00 00       	call   6c1 <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 b8 09 00 00       	push   $0x9b8
 23b:	6a 01                	push   $0x1
 23d:	e8 7f 04 00 00       	call   6c1 <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 44 0e 00 00    	push   0xe44
 24b:	e8 4c 03 00 00       	call   59c <kill>
 250:	e8 17 03 00 00       	call   56c <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 f7 09 00 00       	push   $0x9f7
 25d:	6a 01                	push   $0x1
 25f:	e8 5d 04 00 00       	call   6c1 <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 a5 03 00 00       	call   614 <join>
=======
 1c5:	68 5f 09 00 00       	push   $0x95f
 1ca:	68 68 09 00 00       	push   $0x968
 1cf:	6a 01                	push   $0x1
 1d1:	e8 d4 04 00 00       	call   6aa <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 04 0a 00 00       	push   $0xa04
 1de:	68 8c 09 00 00       	push   $0x98c
 1e3:	6a 01                	push   $0x1
 1e5:	e8 c0 04 00 00       	call   6aa <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 a0 09 00 00       	push   $0x9a0
 1f2:	6a 01                	push   $0x1
 1f4:	e8 b1 04 00 00       	call   6aa <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 24 0e 00 00    	push   0xe24
 202:	e8 7e 03 00 00       	call   585 <kill>
 207:	e8 49 03 00 00       	call   555 <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 5f 09 00 00       	push   $0x95f
 213:	68 68 09 00 00       	push   $0x968
 218:	6a 01                	push   $0x1
 21a:	e8 8b 04 00 00       	call   6aa <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 c8 09 00 00       	push   $0x9c8
 227:	68 8c 09 00 00       	push   $0x98c
 22c:	6a 01                	push   $0x1
 22e:	e8 77 04 00 00       	call   6aa <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 a0 09 00 00       	push   $0x9a0
 23b:	6a 01                	push   $0x1
 23d:	e8 68 04 00 00       	call   6aa <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 24 0e 00 00    	push   0xe24
 24b:	e8 35 03 00 00       	call   585 <kill>
 250:	e8 00 03 00 00       	call   555 <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 df 09 00 00       	push   $0x9df
 25d:	6a 01                	push   $0x1
 25f:	e8 46 04 00 00       	call   6aa <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 8e 03 00 00       	call   5fd <join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
<<<<<<< HEAD
 278:	68 77 09 00 00       	push   $0x977
 27d:	68 80 09 00 00       	push   $0x980
 282:	6a 01                	push   $0x1
 284:	e8 38 04 00 00       	call   6c1 <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 04 0a 00 00       	push   $0xa04
 291:	68 a4 09 00 00       	push   $0x9a4
 296:	6a 01                	push   $0x1
 298:	e8 24 04 00 00       	call   6c1 <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 b8 09 00 00       	push   $0x9b8
 2a5:	6a 01                	push   $0x1
 2a7:	e8 15 04 00 00       	call   6c1 <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 44 0e 00 00    	push   0xe44
 2b5:	e8 e2 02 00 00       	call   59c <kill>
 2ba:	e8 ad 02 00 00       	call   56c <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 5f 05 00 00       	call   827 <free>
   exit();
 2c8:	e8 9f 02 00 00       	call   56c <exit>
=======
 278:	68 5f 09 00 00       	push   $0x95f
 27d:	68 68 09 00 00       	push   $0x968
 282:	6a 01                	push   $0x1
 284:	e8 21 04 00 00       	call   6aa <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 ec 09 00 00       	push   $0x9ec
 291:	68 8c 09 00 00       	push   $0x98c
 296:	6a 01                	push   $0x1
 298:	e8 0d 04 00 00       	call   6aa <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 a0 09 00 00       	push   $0x9a0
 2a5:	6a 01                	push   $0x1
 2a7:	e8 fe 03 00 00       	call   6aa <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 24 0e 00 00    	push   0xe24
 2b5:	e8 cb 02 00 00       	call   585 <kill>
 2ba:	e8 96 02 00 00       	call   555 <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 48 05 00 00       	call   810 <free>
   exit();
 2c8:	e8 88 02 00 00       	call   555 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000002cd <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2d3:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d8:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2da:	89 d0                	mov    %edx,%eax
 2dc:	5d                   	pop    %ebp
 2dd:	c3                   	ret    

000002de <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	53                   	push   %ebx
 2e2:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2e5:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 2ea:	e8 f8 05 00 00       	call   8e7 <malloc>
  if(n_stack == 0){
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	85 c0                	test   %eax,%eax
 2f4:	74 41                	je     337 <thread_create+0x59>
 2f6:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 2f8:	50                   	push   %eax
 2f9:	ff 75 10             	push   0x10(%ebp)
 2fc:	ff 75 0c             	push   0xc(%ebp)
 2ff:	ff 75 08             	push   0x8(%ebp)
 302:	e8 05 03 00 00       	call   60c <clone>
=======
 2ea:	e8 e1 05 00 00       	call   8d0 <malloc>
  if(n_stack == 0){
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	85 c0                	test   %eax,%eax
 2f4:	74 57                	je     34d <thread_create+0x6f>
 2f6:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 2f8:	b8 00 00 00 00       	mov    $0x0,%eax
 2fd:	eb 03                	jmp    302 <thread_create+0x24>
 2ff:	83 c0 01             	add    $0x1,%eax
 302:	83 f8 3f             	cmp    $0x3f,%eax
 305:	7f 2f                	jg     336 <thread_create+0x58>
    if(threads[i].flag==0){
 307:	8d 14 40             	lea    (%eax,%eax,2),%edx
 30a:	83 3c 95 48 0e 00 00 	cmpl   $0x0,0xe48(,%edx,4)
 311:	00 
 312:	75 eb                	jne    2ff <thread_create+0x21>
      threads[i].maddr = n_stack;
 314:	8d 14 00             	lea    (%eax,%eax,1),%edx
 317:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 31a:	c1 e3 02             	shl    $0x2,%ebx
 31d:	89 8b 40 0e 00 00    	mov    %ecx,0xe40(%ebx)
      threads[i].pg1addr = n_stack;
 323:	89 8b 44 0e 00 00    	mov    %ecx,0xe44(%ebx)
      threads[i].flag = 1;
 329:	01 c2                	add    %eax,%edx
 32b:	c7 04 95 48 0e 00 00 	movl   $0x1,0xe48(,%edx,4)
 332:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 336:	51                   	push   %ecx
 337:	ff 75 10             	push   0x10(%ebp)
 33a:	ff 75 0c             	push   0xc(%ebp)
 33d:	ff 75 08             	push   0x8(%ebp)
 340:	e8 b0 02 00 00       	call   5f5 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 307:	83 c4 10             	add    $0x10,%esp
 30a:	ba 00 00 00 00       	mov    $0x0,%edx
 30f:	eb 03                	jmp    314 <thread_create+0x36>
 311:	83 c2 01             	add    $0x1,%edx
 314:	83 fa 3f             	cmp    $0x3f,%edx
 317:	7f 19                	jg     332 <thread_create+0x54>
    if(threads[i]->flag==0){
 319:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 320:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 324:	75 eb                	jne    311 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 326:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 328:	8b 14 95 60 0e 00 00 	mov    0xe60(,%edx,4),%edx
 32f:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 332:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 335:	c9                   	leave  
 336:	c3                   	ret    
    return -1;
 337:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 33c:	eb f4                	jmp    332 <thread_create+0x54>

0000033e <thread_join>:
=======
 345:	83 c4 10             	add    $0x10,%esp
}
 348:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34b:	c9                   	leave  
 34c:	c3                   	ret    
    return -1;
 34d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 352:	eb f4                	jmp    348 <thread_create+0x6a>

00000354 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 33e:	55                   	push   %ebp
 33f:	89 e5                	mov    %esp,%ebp
 341:	56                   	push   %esi
 342:	53                   	push   %ebx
 343:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 346:	8d 45 f4             	lea    -0xc(%ebp),%eax
 349:	50                   	push   %eax
 34a:	e8 c5 02 00 00       	call   614 <join>
 34f:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 351:	83 c4 10             	add    $0x10,%esp
 354:	bb 00 00 00 00       	mov    $0x0,%ebx
 359:	eb 03                	jmp    35e <thread_join+0x20>
 35b:	83 c3 01             	add    $0x1,%ebx
 35e:	83 fb 3f             	cmp    $0x3f,%ebx
 361:	7f 23                	jg     386 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 363:	8b 04 9d 60 0e 00 00 	mov    0xe60(,%ebx,4),%eax
 36a:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 36e:	75 eb                	jne    35b <thread_join+0x1d>
 370:	8b 55 f4             	mov    -0xc(%ebp),%edx
 373:	39 50 04             	cmp    %edx,0x4(%eax)
 376:	75 e3                	jne    35b <thread_join+0x1d>
      free(stk_addr);
 378:	83 ec 0c             	sub    $0xc,%esp
 37b:	52                   	push   %edx
 37c:	e8 a6 04 00 00       	call   827 <free>
 381:	83 c4 10             	add    $0x10,%esp
 384:	eb d5                	jmp    35b <thread_join+0x1d>
    }
  }
  return pid;
}
 386:	89 f0                	mov    %esi,%eax
 388:	8d 65 f8             	lea    -0x8(%ebp),%esp
 38b:	5b                   	pop    %ebx
 38c:	5e                   	pop    %esi
 38d:	5d                   	pop    %ebp
 38e:	c3                   	ret    

0000038f <lock_acquire>:

void lock_acquire(lock_t *lock){
 38f:	55                   	push   %ebp
 390:	89 e5                	mov    %esp,%ebp
 392:	53                   	push   %ebx
 393:	83 ec 04             	sub    $0x4,%esp
 396:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 399:	83 ec 08             	sub    $0x8,%esp
 39c:	6a 01                	push   $0x1
 39e:	53                   	push   %ebx
 39f:	e8 29 ff ff ff       	call   2cd <test_and_set>
 3a4:	83 c4 10             	add    $0x10,%esp
 3a7:	83 f8 01             	cmp    $0x1,%eax
 3aa:	74 ed                	je     399 <lock_acquire+0xa>
    ;
}
 3ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3af:	c9                   	leave  
 3b0:	c3                   	ret    

000003b1 <lock_release>:

void lock_release(lock_t *lock) {
 3b1:	55                   	push   %ebp
 3b2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3b4:	8b 45 08             	mov    0x8(%ebp),%eax
 3b7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3bd:	5d                   	pop    %ebp
 3be:	c3                   	ret    

000003bf <lock_init>:

void lock_init(lock_t *lock) {
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    

000003cd <strcpy>:
=======
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	53                   	push   %ebx
 358:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 35b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 35e:	50                   	push   %eax
 35f:	e8 99 02 00 00       	call   5fd <join>
 364:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 366:	83 c4 04             	add    $0x4,%esp
 369:	ff 75 f4             	push   -0xc(%ebp)
 36c:	e8 9f 04 00 00       	call   810 <free>
  return pid;
}
 371:	89 d8                	mov    %ebx,%eax
 373:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 376:	c9                   	leave  
 377:	c3                   	ret    

00000378 <lock_acquire>:

void lock_acquire(lock_t *lock){
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	53                   	push   %ebx
 37c:	83 ec 04             	sub    $0x4,%esp
 37f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 382:	83 ec 08             	sub    $0x8,%esp
 385:	6a 01                	push   $0x1
 387:	53                   	push   %ebx
 388:	e8 40 ff ff ff       	call   2cd <test_and_set>
 38d:	83 c4 10             	add    $0x10,%esp
 390:	83 f8 01             	cmp    $0x1,%eax
 393:	74 ed                	je     382 <lock_acquire+0xa>
    ;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	c9                   	leave  
 399:	c3                   	ret    

0000039a <lock_release>:

void lock_release(lock_t *lock) {
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 39d:	8b 45 08             	mov    0x8(%ebp),%eax
 3a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    

000003a8 <lock_init>:

void lock_init(lock_t *lock) {
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3ab:	8b 45 08             	mov    0x8(%ebp),%eax
 3ae:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3b4:	5d                   	pop    %ebp
 3b5:	c3                   	ret    

000003b6 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
 3d0:	56                   	push   %esi
 3d1:	53                   	push   %ebx
 3d2:	8b 75 08             	mov    0x8(%ebp),%esi
 3d5:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 3b6:	55                   	push   %ebp
 3b7:	89 e5                	mov    %esp,%ebp
 3b9:	56                   	push   %esi
 3ba:	53                   	push   %ebx
 3bb:	8b 75 08             	mov    0x8(%ebp),%esi
 3be:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 3d8:	89 f0                	mov    %esi,%eax
 3da:	89 d1                	mov    %edx,%ecx
 3dc:	83 c2 01             	add    $0x1,%edx
 3df:	89 c3                	mov    %eax,%ebx
 3e1:	83 c0 01             	add    $0x1,%eax
 3e4:	0f b6 09             	movzbl (%ecx),%ecx
 3e7:	88 0b                	mov    %cl,(%ebx)
 3e9:	84 c9                	test   %cl,%cl
 3eb:	75 ed                	jne    3da <strcpy+0xd>
    ;
  return os;
}
 3ed:	89 f0                	mov    %esi,%eax
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    

000003f3 <strcmp>:
=======
 3c1:	89 f0                	mov    %esi,%eax
 3c3:	89 d1                	mov    %edx,%ecx
 3c5:	83 c2 01             	add    $0x1,%edx
 3c8:	89 c3                	mov    %eax,%ebx
 3ca:	83 c0 01             	add    $0x1,%eax
 3cd:	0f b6 09             	movzbl (%ecx),%ecx
 3d0:	88 0b                	mov    %cl,(%ebx)
 3d2:	84 c9                	test   %cl,%cl
 3d4:	75 ed                	jne    3c3 <strcpy+0xd>
    ;
  return os;
}
 3d6:	89 f0                	mov    %esi,%eax
 3d8:	5b                   	pop    %ebx
 3d9:	5e                   	pop    %esi
 3da:	5d                   	pop    %ebp
 3db:	c3                   	ret    

000003dc <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3fc:	eb 06                	jmp    404 <strcmp+0x11>
    p++, q++;
 3fe:	83 c1 01             	add    $0x1,%ecx
 401:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 404:	0f b6 01             	movzbl (%ecx),%eax
 407:	84 c0                	test   %al,%al
 409:	74 04                	je     40f <strcmp+0x1c>
 40b:	3a 02                	cmp    (%edx),%al
 40d:	74 ef                	je     3fe <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 40f:	0f b6 c0             	movzbl %al,%eax
 412:	0f b6 12             	movzbl (%edx),%edx
 415:	29 d0                	sub    %edx,%eax
}
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    

00000419 <strlen>:
=======
 3dc:	55                   	push   %ebp
 3dd:	89 e5                	mov    %esp,%ebp
 3df:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e2:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3e5:	eb 06                	jmp    3ed <strcmp+0x11>
    p++, q++;
 3e7:	83 c1 01             	add    $0x1,%ecx
 3ea:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3ed:	0f b6 01             	movzbl (%ecx),%eax
 3f0:	84 c0                	test   %al,%al
 3f2:	74 04                	je     3f8 <strcmp+0x1c>
 3f4:	3a 02                	cmp    (%edx),%al
 3f6:	74 ef                	je     3e7 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3f8:	0f b6 c0             	movzbl %al,%eax
 3fb:	0f b6 12             	movzbl (%edx),%edx
 3fe:	29 d0                	sub    %edx,%eax
}
 400:	5d                   	pop    %ebp
 401:	c3                   	ret    

00000402 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 419:	55                   	push   %ebp
 41a:	89 e5                	mov    %esp,%ebp
 41c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 41f:	b8 00 00 00 00       	mov    $0x0,%eax
 424:	eb 03                	jmp    429 <strlen+0x10>
 426:	83 c0 01             	add    $0x1,%eax
 429:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 42d:	75 f7                	jne    426 <strlen+0xd>
    ;
  return n;
}
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    

00000431 <memset>:
=======
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
 405:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 408:	b8 00 00 00 00       	mov    $0x0,%eax
 40d:	eb 03                	jmp    412 <strlen+0x10>
 40f:	83 c0 01             	add    $0x1,%eax
 412:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 416:	75 f7                	jne    40f <strlen+0xd>
    ;
  return n;
}
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    

0000041a <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 431:	55                   	push   %ebp
 432:	89 e5                	mov    %esp,%ebp
 434:	57                   	push   %edi
 435:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 438:	89 d7                	mov    %edx,%edi
 43a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 43d:	8b 45 0c             	mov    0xc(%ebp),%eax
 440:	fc                   	cld    
 441:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 443:	89 d0                	mov    %edx,%eax
 445:	8b 7d fc             	mov    -0x4(%ebp),%edi
 448:	c9                   	leave  
 449:	c3                   	ret    

0000044a <strchr>:
=======
 41a:	55                   	push   %ebp
 41b:	89 e5                	mov    %esp,%ebp
 41d:	57                   	push   %edi
 41e:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 421:	89 d7                	mov    %edx,%edi
 423:	8b 4d 10             	mov    0x10(%ebp),%ecx
 426:	8b 45 0c             	mov    0xc(%ebp),%eax
 429:	fc                   	cld    
 42a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 42c:	89 d0                	mov    %edx,%eax
 42e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 431:	c9                   	leave  
 432:	c3                   	ret    

00000433 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 44a:	55                   	push   %ebp
 44b:	89 e5                	mov    %esp,%ebp
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
 450:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 454:	eb 03                	jmp    459 <strchr+0xf>
 456:	83 c0 01             	add    $0x1,%eax
 459:	0f b6 10             	movzbl (%eax),%edx
 45c:	84 d2                	test   %dl,%dl
 45e:	74 06                	je     466 <strchr+0x1c>
    if(*s == c)
 460:	38 ca                	cmp    %cl,%dl
 462:	75 f2                	jne    456 <strchr+0xc>
 464:	eb 05                	jmp    46b <strchr+0x21>
      return (char*)s;
  return 0;
 466:	b8 00 00 00 00       	mov    $0x0,%eax
}
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    

0000046d <gets>:
=======
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
 436:	8b 45 08             	mov    0x8(%ebp),%eax
 439:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 43d:	eb 03                	jmp    442 <strchr+0xf>
 43f:	83 c0 01             	add    $0x1,%eax
 442:	0f b6 10             	movzbl (%eax),%edx
 445:	84 d2                	test   %dl,%dl
 447:	74 06                	je     44f <strchr+0x1c>
    if(*s == c)
 449:	38 ca                	cmp    %cl,%dl
 44b:	75 f2                	jne    43f <strchr+0xc>
 44d:	eb 05                	jmp    454 <strchr+0x21>
      return (char*)s;
  return 0;
 44f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 454:	5d                   	pop    %ebp
 455:	c3                   	ret    

00000456 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	57                   	push   %edi
 471:	56                   	push   %esi
 472:	53                   	push   %ebx
 473:	83 ec 1c             	sub    $0x1c,%esp
 476:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 456:	55                   	push   %ebp
 457:	89 e5                	mov    %esp,%ebp
 459:	57                   	push   %edi
 45a:	56                   	push   %esi
 45b:	53                   	push   %ebx
 45c:	83 ec 1c             	sub    $0x1c,%esp
 45f:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 479:	bb 00 00 00 00       	mov    $0x0,%ebx
 47e:	89 de                	mov    %ebx,%esi
 480:	83 c3 01             	add    $0x1,%ebx
 483:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 486:	7d 2e                	jge    4b6 <gets+0x49>
    cc = read(0, &c, 1);
 488:	83 ec 04             	sub    $0x4,%esp
 48b:	6a 01                	push   $0x1
 48d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 490:	50                   	push   %eax
 491:	6a 00                	push   $0x0
 493:	e8 ec 00 00 00       	call   584 <read>
    if(cc < 1)
 498:	83 c4 10             	add    $0x10,%esp
 49b:	85 c0                	test   %eax,%eax
 49d:	7e 17                	jle    4b6 <gets+0x49>
      break;
    buf[i++] = c;
 49f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4a3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4a6:	3c 0a                	cmp    $0xa,%al
 4a8:	0f 94 c2             	sete   %dl
 4ab:	3c 0d                	cmp    $0xd,%al
 4ad:	0f 94 c0             	sete   %al
 4b0:	08 c2                	or     %al,%dl
 4b2:	74 ca                	je     47e <gets+0x11>
    buf[i++] = c;
 4b4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4b6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4ba:	89 f8                	mov    %edi,%eax
 4bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5f                   	pop    %edi
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    

000004c4 <stat>:
=======
 462:	bb 00 00 00 00       	mov    $0x0,%ebx
 467:	89 de                	mov    %ebx,%esi
 469:	83 c3 01             	add    $0x1,%ebx
 46c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 46f:	7d 2e                	jge    49f <gets+0x49>
    cc = read(0, &c, 1);
 471:	83 ec 04             	sub    $0x4,%esp
 474:	6a 01                	push   $0x1
 476:	8d 45 e7             	lea    -0x19(%ebp),%eax
 479:	50                   	push   %eax
 47a:	6a 00                	push   $0x0
 47c:	e8 ec 00 00 00       	call   56d <read>
    if(cc < 1)
 481:	83 c4 10             	add    $0x10,%esp
 484:	85 c0                	test   %eax,%eax
 486:	7e 17                	jle    49f <gets+0x49>
      break;
    buf[i++] = c;
 488:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 48c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 48f:	3c 0a                	cmp    $0xa,%al
 491:	0f 94 c2             	sete   %dl
 494:	3c 0d                	cmp    $0xd,%al
 496:	0f 94 c0             	sete   %al
 499:	08 c2                	or     %al,%dl
 49b:	74 ca                	je     467 <gets+0x11>
    buf[i++] = c;
 49d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 49f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4a3:	89 f8                	mov    %edi,%eax
 4a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a8:	5b                   	pop    %ebx
 4a9:	5e                   	pop    %esi
 4aa:	5f                   	pop    %edi
 4ab:	5d                   	pop    %ebp
 4ac:	c3                   	ret    

000004ad <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	56                   	push   %esi
 4c8:	53                   	push   %ebx
=======
 4ad:	55                   	push   %ebp
 4ae:	89 e5                	mov    %esp,%ebp
 4b0:	56                   	push   %esi
 4b1:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 4c9:	83 ec 08             	sub    $0x8,%esp
 4cc:	6a 00                	push   $0x0
 4ce:	ff 75 08             	push   0x8(%ebp)
 4d1:	e8 d6 00 00 00       	call   5ac <open>
  if(fd < 0)
 4d6:	83 c4 10             	add    $0x10,%esp
 4d9:	85 c0                	test   %eax,%eax
 4db:	78 24                	js     501 <stat+0x3d>
 4dd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4df:	83 ec 08             	sub    $0x8,%esp
 4e2:	ff 75 0c             	push   0xc(%ebp)
 4e5:	50                   	push   %eax
 4e6:	e8 d9 00 00 00       	call   5c4 <fstat>
 4eb:	89 c6                	mov    %eax,%esi
  close(fd);
 4ed:	89 1c 24             	mov    %ebx,(%esp)
 4f0:	e8 9f 00 00 00       	call   594 <close>
  return r;
 4f5:	83 c4 10             	add    $0x10,%esp
}
 4f8:	89 f0                	mov    %esi,%eax
 4fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4fd:	5b                   	pop    %ebx
 4fe:	5e                   	pop    %esi
 4ff:	5d                   	pop    %ebp
 500:	c3                   	ret    
    return -1;
 501:	be ff ff ff ff       	mov    $0xffffffff,%esi
 506:	eb f0                	jmp    4f8 <stat+0x34>

00000508 <atoi>:
=======
 4b2:	83 ec 08             	sub    $0x8,%esp
 4b5:	6a 00                	push   $0x0
 4b7:	ff 75 08             	push   0x8(%ebp)
 4ba:	e8 d6 00 00 00       	call   595 <open>
  if(fd < 0)
 4bf:	83 c4 10             	add    $0x10,%esp
 4c2:	85 c0                	test   %eax,%eax
 4c4:	78 24                	js     4ea <stat+0x3d>
 4c6:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4c8:	83 ec 08             	sub    $0x8,%esp
 4cb:	ff 75 0c             	push   0xc(%ebp)
 4ce:	50                   	push   %eax
 4cf:	e8 d9 00 00 00       	call   5ad <fstat>
 4d4:	89 c6                	mov    %eax,%esi
  close(fd);
 4d6:	89 1c 24             	mov    %ebx,(%esp)
 4d9:	e8 9f 00 00 00       	call   57d <close>
  return r;
 4de:	83 c4 10             	add    $0x10,%esp
}
 4e1:	89 f0                	mov    %esi,%eax
 4e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e6:	5b                   	pop    %ebx
 4e7:	5e                   	pop    %esi
 4e8:	5d                   	pop    %ebp
 4e9:	c3                   	ret    
    return -1;
 4ea:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4ef:	eb f0                	jmp    4e1 <stat+0x34>

000004f1 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 508:	55                   	push   %ebp
 509:	89 e5                	mov    %esp,%ebp
 50b:	53                   	push   %ebx
 50c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 50f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 514:	eb 10                	jmp    526 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 516:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 519:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 51c:	83 c1 01             	add    $0x1,%ecx
 51f:	0f be c0             	movsbl %al,%eax
 522:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 526:	0f b6 01             	movzbl (%ecx),%eax
 529:	8d 58 d0             	lea    -0x30(%eax),%ebx
 52c:	80 fb 09             	cmp    $0x9,%bl
 52f:	76 e5                	jbe    516 <atoi+0xe>
  return n;
}
 531:	89 d0                	mov    %edx,%eax
 533:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 536:	c9                   	leave  
 537:	c3                   	ret    

00000538 <memmove>:
=======
 4f1:	55                   	push   %ebp
 4f2:	89 e5                	mov    %esp,%ebp
 4f4:	53                   	push   %ebx
 4f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4f8:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4fd:	eb 10                	jmp    50f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4ff:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 502:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 505:	83 c1 01             	add    $0x1,%ecx
 508:	0f be c0             	movsbl %al,%eax
 50b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 50f:	0f b6 01             	movzbl (%ecx),%eax
 512:	8d 58 d0             	lea    -0x30(%eax),%ebx
 515:	80 fb 09             	cmp    $0x9,%bl
 518:	76 e5                	jbe    4ff <atoi+0xe>
  return n;
}
 51a:	89 d0                	mov    %edx,%eax
 51c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 51f:	c9                   	leave  
 520:	c3                   	ret    

00000521 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 538:	55                   	push   %ebp
 539:	89 e5                	mov    %esp,%ebp
 53b:	56                   	push   %esi
 53c:	53                   	push   %ebx
 53d:	8b 75 08             	mov    0x8(%ebp),%esi
 540:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 543:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 521:	55                   	push   %ebp
 522:	89 e5                	mov    %esp,%ebp
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	8b 75 08             	mov    0x8(%ebp),%esi
 529:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 52c:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 546:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 548:	eb 0d                	jmp    557 <memmove+0x1f>
    *dst++ = *src++;
 54a:	0f b6 01             	movzbl (%ecx),%eax
 54d:	88 02                	mov    %al,(%edx)
 54f:	8d 49 01             	lea    0x1(%ecx),%ecx
 552:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 555:	89 d8                	mov    %ebx,%eax
 557:	8d 58 ff             	lea    -0x1(%eax),%ebx
 55a:	85 c0                	test   %eax,%eax
 55c:	7f ec                	jg     54a <memmove+0x12>
  return vdst;
}
 55e:	89 f0                	mov    %esi,%eax
 560:	5b                   	pop    %ebx
 561:	5e                   	pop    %esi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    

00000564 <fork>:
=======
 52f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 531:	eb 0d                	jmp    540 <memmove+0x1f>
    *dst++ = *src++;
 533:	0f b6 01             	movzbl (%ecx),%eax
 536:	88 02                	mov    %al,(%edx)
 538:	8d 49 01             	lea    0x1(%ecx),%ecx
 53b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 53e:	89 d8                	mov    %ebx,%eax
 540:	8d 58 ff             	lea    -0x1(%eax),%ebx
 543:	85 c0                	test   %eax,%eax
 545:	7f ec                	jg     533 <memmove+0x12>
  return vdst;
}
 547:	89 f0                	mov    %esi,%eax
 549:	5b                   	pop    %ebx
 54a:	5e                   	pop    %esi
 54b:	5d                   	pop    %ebp
 54c:	c3                   	ret    

0000054d <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 564:	b8 01 00 00 00       	mov    $0x1,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <exit>:
SYSCALL(exit)
 56c:	b8 02 00 00 00       	mov    $0x2,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <wait>:
SYSCALL(wait)
 574:	b8 03 00 00 00       	mov    $0x3,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <pipe>:
SYSCALL(pipe)
 57c:	b8 04 00 00 00       	mov    $0x4,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <read>:
SYSCALL(read)
 584:	b8 05 00 00 00       	mov    $0x5,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <write>:
SYSCALL(write)
 58c:	b8 10 00 00 00       	mov    $0x10,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <close>:
SYSCALL(close)
 594:	b8 15 00 00 00       	mov    $0x15,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <kill>:
SYSCALL(kill)
 59c:	b8 06 00 00 00       	mov    $0x6,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <exec>:
SYSCALL(exec)
 5a4:	b8 07 00 00 00       	mov    $0x7,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <open>:
SYSCALL(open)
 5ac:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <mknod>:
SYSCALL(mknod)
 5b4:	b8 11 00 00 00       	mov    $0x11,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <unlink>:
SYSCALL(unlink)
 5bc:	b8 12 00 00 00       	mov    $0x12,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <fstat>:
SYSCALL(fstat)
 5c4:	b8 08 00 00 00       	mov    $0x8,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <link>:
SYSCALL(link)
 5cc:	b8 13 00 00 00       	mov    $0x13,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <mkdir>:
SYSCALL(mkdir)
 5d4:	b8 14 00 00 00       	mov    $0x14,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <chdir>:
SYSCALL(chdir)
 5dc:	b8 09 00 00 00       	mov    $0x9,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <dup>:
SYSCALL(dup)
 5e4:	b8 0a 00 00 00       	mov    $0xa,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <getpid>:
SYSCALL(getpid)
 5ec:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <sbrk>:
SYSCALL(sbrk)
 5f4:	b8 0c 00 00 00       	mov    $0xc,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <sleep>:
SYSCALL(sleep)
 5fc:	b8 0d 00 00 00       	mov    $0xd,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <uptime>:
SYSCALL(uptime)
 604:	b8 0e 00 00 00       	mov    $0xe,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <clone>:
SYSCALL(clone)
 60c:	b8 16 00 00 00       	mov    $0x16,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <join>:
 614:	b8 17 00 00 00       	mov    $0x17,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <putc>:
=======
 54d:	b8 01 00 00 00       	mov    $0x1,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <exit>:
SYSCALL(exit)
 555:	b8 02 00 00 00       	mov    $0x2,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <wait>:
SYSCALL(wait)
 55d:	b8 03 00 00 00       	mov    $0x3,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <pipe>:
SYSCALL(pipe)
 565:	b8 04 00 00 00       	mov    $0x4,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <read>:
SYSCALL(read)
 56d:	b8 05 00 00 00       	mov    $0x5,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <write>:
SYSCALL(write)
 575:	b8 10 00 00 00       	mov    $0x10,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <close>:
SYSCALL(close)
 57d:	b8 15 00 00 00       	mov    $0x15,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <kill>:
SYSCALL(kill)
 585:	b8 06 00 00 00       	mov    $0x6,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <exec>:
SYSCALL(exec)
 58d:	b8 07 00 00 00       	mov    $0x7,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <open>:
SYSCALL(open)
 595:	b8 0f 00 00 00       	mov    $0xf,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <mknod>:
SYSCALL(mknod)
 59d:	b8 11 00 00 00       	mov    $0x11,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <unlink>:
SYSCALL(unlink)
 5a5:	b8 12 00 00 00       	mov    $0x12,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <fstat>:
SYSCALL(fstat)
 5ad:	b8 08 00 00 00       	mov    $0x8,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <link>:
SYSCALL(link)
 5b5:	b8 13 00 00 00       	mov    $0x13,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <mkdir>:
SYSCALL(mkdir)
 5bd:	b8 14 00 00 00       	mov    $0x14,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <chdir>:
SYSCALL(chdir)
 5c5:	b8 09 00 00 00       	mov    $0x9,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <dup>:
SYSCALL(dup)
 5cd:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <getpid>:
SYSCALL(getpid)
 5d5:	b8 0b 00 00 00       	mov    $0xb,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <sbrk>:
SYSCALL(sbrk)
 5dd:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <sleep>:
SYSCALL(sleep)
 5e5:	b8 0d 00 00 00       	mov    $0xd,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <uptime>:
SYSCALL(uptime)
 5ed:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <clone>:
SYSCALL(clone)
 5f5:	b8 16 00 00 00       	mov    $0x16,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <join>:
 5fd:	b8 17 00 00 00       	mov    $0x17,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 61c:	55                   	push   %ebp
 61d:	89 e5                	mov    %esp,%ebp
 61f:	83 ec 1c             	sub    $0x1c,%esp
 622:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 625:	6a 01                	push   $0x1
 627:	8d 55 f4             	lea    -0xc(%ebp),%edx
 62a:	52                   	push   %edx
 62b:	50                   	push   %eax
 62c:	e8 5b ff ff ff       	call   58c <write>
}
 631:	83 c4 10             	add    $0x10,%esp
 634:	c9                   	leave  
 635:	c3                   	ret    

00000636 <printint>:
=======
 605:	55                   	push   %ebp
 606:	89 e5                	mov    %esp,%ebp
 608:	83 ec 1c             	sub    $0x1c,%esp
 60b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 60e:	6a 01                	push   $0x1
 610:	8d 55 f4             	lea    -0xc(%ebp),%edx
 613:	52                   	push   %edx
 614:	50                   	push   %eax
 615:	e8 5b ff ff ff       	call   575 <write>
}
 61a:	83 c4 10             	add    $0x10,%esp
 61d:	c9                   	leave  
 61e:	c3                   	ret    

0000061f <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 636:	55                   	push   %ebp
 637:	89 e5                	mov    %esp,%ebp
 639:	57                   	push   %edi
 63a:	56                   	push   %esi
 63b:	53                   	push   %ebx
 63c:	83 ec 2c             	sub    $0x2c,%esp
 63f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 642:	89 d0                	mov    %edx,%eax
 644:	89 ce                	mov    %ecx,%esi
=======
 61f:	55                   	push   %ebp
 620:	89 e5                	mov    %esp,%ebp
 622:	57                   	push   %edi
 623:	56                   	push   %esi
 624:	53                   	push   %ebx
 625:	83 ec 2c             	sub    $0x2c,%esp
 628:	89 45 d0             	mov    %eax,-0x30(%ebp)
 62b:	89 d0                	mov    %edx,%eax
 62d:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 646:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 64a:	0f 95 c1             	setne  %cl
 64d:	c1 ea 1f             	shr    $0x1f,%edx
 650:	84 d1                	test   %dl,%cl
 652:	74 44                	je     698 <printint+0x62>
    neg = 1;
    x = -xx;
 654:	f7 d8                	neg    %eax
 656:	89 c1                	mov    %eax,%ecx
    neg = 1;
 658:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 62f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 633:	0f 95 c1             	setne  %cl
 636:	c1 ea 1f             	shr    $0x1f,%edx
 639:	84 d1                	test   %dl,%cl
 63b:	74 44                	je     681 <printint+0x62>
    neg = 1;
    x = -xx;
 63d:	f7 d8                	neg    %eax
 63f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 641:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 65f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 664:	89 c8                	mov    %ecx,%eax
 666:	ba 00 00 00 00       	mov    $0x0,%edx
 66b:	f7 f6                	div    %esi
 66d:	89 df                	mov    %ebx,%edi
 66f:	83 c3 01             	add    $0x1,%ebx
 672:	0f b6 92 a0 0a 00 00 	movzbl 0xaa0(%edx),%edx
 679:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 67d:	89 ca                	mov    %ecx,%edx
 67f:	89 c1                	mov    %eax,%ecx
 681:	39 d6                	cmp    %edx,%esi
 683:	76 df                	jbe    664 <printint+0x2e>
  if(neg)
 685:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 689:	74 31                	je     6bc <printint+0x86>
    buf[i++] = '-';
 68b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 690:	8d 5f 02             	lea    0x2(%edi),%ebx
 693:	8b 75 d0             	mov    -0x30(%ebp),%esi
 696:	eb 17                	jmp    6af <printint+0x79>
    x = xx;
 698:	89 c1                	mov    %eax,%ecx
  neg = 0;
 69a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6a1:	eb bc                	jmp    65f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6a3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6a8:	89 f0                	mov    %esi,%eax
 6aa:	e8 6d ff ff ff       	call   61c <putc>
  while(--i >= 0)
 6af:	83 eb 01             	sub    $0x1,%ebx
 6b2:	79 ef                	jns    6a3 <printint+0x6d>
}
 6b4:	83 c4 2c             	add    $0x2c,%esp
 6b7:	5b                   	pop    %ebx
 6b8:	5e                   	pop    %esi
 6b9:	5f                   	pop    %edi
 6ba:	5d                   	pop    %ebp
 6bb:	c3                   	ret    
 6bc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6bf:	eb ee                	jmp    6af <printint+0x79>

000006c1 <printf>:
=======
 648:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 64d:	89 c8                	mov    %ecx,%eax
 64f:	ba 00 00 00 00       	mov    $0x0,%edx
 654:	f7 f6                	div    %esi
 656:	89 df                	mov    %ebx,%edi
 658:	83 c3 01             	add    $0x1,%ebx
 65b:	0f b6 92 88 0a 00 00 	movzbl 0xa88(%edx),%edx
 662:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 666:	89 ca                	mov    %ecx,%edx
 668:	89 c1                	mov    %eax,%ecx
 66a:	39 d6                	cmp    %edx,%esi
 66c:	76 df                	jbe    64d <printint+0x2e>
  if(neg)
 66e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 672:	74 31                	je     6a5 <printint+0x86>
    buf[i++] = '-';
 674:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 679:	8d 5f 02             	lea    0x2(%edi),%ebx
 67c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 67f:	eb 17                	jmp    698 <printint+0x79>
    x = xx;
 681:	89 c1                	mov    %eax,%ecx
  neg = 0;
 683:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 68a:	eb bc                	jmp    648 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 68c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 691:	89 f0                	mov    %esi,%eax
 693:	e8 6d ff ff ff       	call   605 <putc>
  while(--i >= 0)
 698:	83 eb 01             	sub    $0x1,%ebx
 69b:	79 ef                	jns    68c <printint+0x6d>
}
 69d:	83 c4 2c             	add    $0x2c,%esp
 6a0:	5b                   	pop    %ebx
 6a1:	5e                   	pop    %esi
 6a2:	5f                   	pop    %edi
 6a3:	5d                   	pop    %ebp
 6a4:	c3                   	ret    
 6a5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6a8:	eb ee                	jmp    698 <printint+0x79>

000006aa <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 6c1:	55                   	push   %ebp
 6c2:	89 e5                	mov    %esp,%ebp
 6c4:	57                   	push   %edi
 6c5:	56                   	push   %esi
 6c6:	53                   	push   %ebx
 6c7:	83 ec 1c             	sub    $0x1c,%esp
=======
 6aa:	55                   	push   %ebp
 6ab:	89 e5                	mov    %esp,%ebp
 6ad:	57                   	push   %edi
 6ae:	56                   	push   %esi
 6af:	53                   	push   %ebx
 6b0:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 6ca:	8d 45 10             	lea    0x10(%ebp),%eax
 6cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6d0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6d5:	bb 00 00 00 00       	mov    $0x0,%ebx
 6da:	eb 14                	jmp    6f0 <printf+0x2f>
=======
 6b3:	8d 45 10             	lea    0x10(%ebp),%eax
 6b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6b9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6be:	bb 00 00 00 00       	mov    $0x0,%ebx
 6c3:	eb 14                	jmp    6d9 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 6dc:	89 fa                	mov    %edi,%edx
 6de:	8b 45 08             	mov    0x8(%ebp),%eax
 6e1:	e8 36 ff ff ff       	call   61c <putc>
 6e6:	eb 05                	jmp    6ed <printf+0x2c>
      }
    } else if(state == '%'){
 6e8:	83 fe 25             	cmp    $0x25,%esi
 6eb:	74 25                	je     712 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6ed:	83 c3 01             	add    $0x1,%ebx
 6f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 6f3:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6f7:	84 c0                	test   %al,%al
 6f9:	0f 84 20 01 00 00    	je     81f <printf+0x15e>
    c = fmt[i] & 0xff;
 6ff:	0f be f8             	movsbl %al,%edi
 702:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 705:	85 f6                	test   %esi,%esi
 707:	75 df                	jne    6e8 <printf+0x27>
      if(c == '%'){
 709:	83 f8 25             	cmp    $0x25,%eax
 70c:	75 ce                	jne    6dc <printf+0x1b>
        state = '%';
 70e:	89 c6                	mov    %eax,%esi
 710:	eb db                	jmp    6ed <printf+0x2c>
      if(c == 'd'){
 712:	83 f8 25             	cmp    $0x25,%eax
 715:	0f 84 cf 00 00 00    	je     7ea <printf+0x129>
 71b:	0f 8c dd 00 00 00    	jl     7fe <printf+0x13d>
 721:	83 f8 78             	cmp    $0x78,%eax
 724:	0f 8f d4 00 00 00    	jg     7fe <printf+0x13d>
 72a:	83 f8 63             	cmp    $0x63,%eax
 72d:	0f 8c cb 00 00 00    	jl     7fe <printf+0x13d>
 733:	83 e8 63             	sub    $0x63,%eax
 736:	83 f8 15             	cmp    $0x15,%eax
 739:	0f 87 bf 00 00 00    	ja     7fe <printf+0x13d>
 73f:	ff 24 85 48 0a 00 00 	jmp    *0xa48(,%eax,4)
        printint(fd, *ap, 10, 1);
 746:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 749:	8b 17                	mov    (%edi),%edx
 74b:	83 ec 0c             	sub    $0xc,%esp
 74e:	6a 01                	push   $0x1
 750:	b9 0a 00 00 00       	mov    $0xa,%ecx
 755:	8b 45 08             	mov    0x8(%ebp),%eax
 758:	e8 d9 fe ff ff       	call   636 <printint>
        ap++;
 75d:	83 c7 04             	add    $0x4,%edi
 760:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 763:	83 c4 10             	add    $0x10,%esp
=======
 6c5:	89 fa                	mov    %edi,%edx
 6c7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ca:	e8 36 ff ff ff       	call   605 <putc>
 6cf:	eb 05                	jmp    6d6 <printf+0x2c>
      }
    } else if(state == '%'){
 6d1:	83 fe 25             	cmp    $0x25,%esi
 6d4:	74 25                	je     6fb <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6d6:	83 c3 01             	add    $0x1,%ebx
 6d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 6dc:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6e0:	84 c0                	test   %al,%al
 6e2:	0f 84 20 01 00 00    	je     808 <printf+0x15e>
    c = fmt[i] & 0xff;
 6e8:	0f be f8             	movsbl %al,%edi
 6eb:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ee:	85 f6                	test   %esi,%esi
 6f0:	75 df                	jne    6d1 <printf+0x27>
      if(c == '%'){
 6f2:	83 f8 25             	cmp    $0x25,%eax
 6f5:	75 ce                	jne    6c5 <printf+0x1b>
        state = '%';
 6f7:	89 c6                	mov    %eax,%esi
 6f9:	eb db                	jmp    6d6 <printf+0x2c>
      if(c == 'd'){
 6fb:	83 f8 25             	cmp    $0x25,%eax
 6fe:	0f 84 cf 00 00 00    	je     7d3 <printf+0x129>
 704:	0f 8c dd 00 00 00    	jl     7e7 <printf+0x13d>
 70a:	83 f8 78             	cmp    $0x78,%eax
 70d:	0f 8f d4 00 00 00    	jg     7e7 <printf+0x13d>
 713:	83 f8 63             	cmp    $0x63,%eax
 716:	0f 8c cb 00 00 00    	jl     7e7 <printf+0x13d>
 71c:	83 e8 63             	sub    $0x63,%eax
 71f:	83 f8 15             	cmp    $0x15,%eax
 722:	0f 87 bf 00 00 00    	ja     7e7 <printf+0x13d>
 728:	ff 24 85 30 0a 00 00 	jmp    *0xa30(,%eax,4)
        printint(fd, *ap, 10, 1);
 72f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 732:	8b 17                	mov    (%edi),%edx
 734:	83 ec 0c             	sub    $0xc,%esp
 737:	6a 01                	push   $0x1
 739:	b9 0a 00 00 00       	mov    $0xa,%ecx
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	e8 d9 fe ff ff       	call   61f <printint>
        ap++;
 746:	83 c7 04             	add    $0x4,%edi
 749:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 74c:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 766:	be 00 00 00 00       	mov    $0x0,%esi
 76b:	eb 80                	jmp    6ed <printf+0x2c>
        printint(fd, *ap, 16, 0);
 76d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 770:	8b 17                	mov    (%edi),%edx
 772:	83 ec 0c             	sub    $0xc,%esp
 775:	6a 00                	push   $0x0
 777:	b9 10 00 00 00       	mov    $0x10,%ecx
 77c:	8b 45 08             	mov    0x8(%ebp),%eax
 77f:	e8 b2 fe ff ff       	call   636 <printint>
        ap++;
 784:	83 c7 04             	add    $0x4,%edi
 787:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 78a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78d:	be 00 00 00 00       	mov    $0x0,%esi
 792:	e9 56 ff ff ff       	jmp    6ed <printf+0x2c>
        s = (char*)*ap;
 797:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79a:	8b 30                	mov    (%eax),%esi
        ap++;
 79c:	83 c0 04             	add    $0x4,%eax
 79f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7a2:	85 f6                	test   %esi,%esi
 7a4:	75 15                	jne    7bb <printf+0xfa>
          s = "(null)";
 7a6:	be 3f 0a 00 00       	mov    $0xa3f,%esi
 7ab:	eb 0e                	jmp    7bb <printf+0xfa>
          putc(fd, *s);
 7ad:	0f be d2             	movsbl %dl,%edx
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	e8 64 fe ff ff       	call   61c <putc>
          s++;
 7b8:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7bb:	0f b6 16             	movzbl (%esi),%edx
 7be:	84 d2                	test   %dl,%dl
 7c0:	75 eb                	jne    7ad <printf+0xec>
      state = 0;
 7c2:	be 00 00 00 00       	mov    $0x0,%esi
 7c7:	e9 21 ff ff ff       	jmp    6ed <printf+0x2c>
        putc(fd, *ap);
 7cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7cf:	0f be 17             	movsbl (%edi),%edx
 7d2:	8b 45 08             	mov    0x8(%ebp),%eax
 7d5:	e8 42 fe ff ff       	call   61c <putc>
        ap++;
 7da:	83 c7 04             	add    $0x4,%edi
 7dd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7e0:	be 00 00 00 00       	mov    $0x0,%esi
 7e5:	e9 03 ff ff ff       	jmp    6ed <printf+0x2c>
        putc(fd, c);
 7ea:	89 fa                	mov    %edi,%edx
 7ec:	8b 45 08             	mov    0x8(%ebp),%eax
 7ef:	e8 28 fe ff ff       	call   61c <putc>
      state = 0;
 7f4:	be 00 00 00 00       	mov    $0x0,%esi
 7f9:	e9 ef fe ff ff       	jmp    6ed <printf+0x2c>
        putc(fd, '%');
 7fe:	ba 25 00 00 00       	mov    $0x25,%edx
 803:	8b 45 08             	mov    0x8(%ebp),%eax
 806:	e8 11 fe ff ff       	call   61c <putc>
        putc(fd, c);
 80b:	89 fa                	mov    %edi,%edx
 80d:	8b 45 08             	mov    0x8(%ebp),%eax
 810:	e8 07 fe ff ff       	call   61c <putc>
      state = 0;
 815:	be 00 00 00 00       	mov    $0x0,%esi
 81a:	e9 ce fe ff ff       	jmp    6ed <printf+0x2c>
    }
  }
}
 81f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 822:	5b                   	pop    %ebx
 823:	5e                   	pop    %esi
 824:	5f                   	pop    %edi
 825:	5d                   	pop    %ebp
 826:	c3                   	ret    

00000827 <free>:
=======
 74f:	be 00 00 00 00       	mov    $0x0,%esi
 754:	eb 80                	jmp    6d6 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 756:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 759:	8b 17                	mov    (%edi),%edx
 75b:	83 ec 0c             	sub    $0xc,%esp
 75e:	6a 00                	push   $0x0
 760:	b9 10 00 00 00       	mov    $0x10,%ecx
 765:	8b 45 08             	mov    0x8(%ebp),%eax
 768:	e8 b2 fe ff ff       	call   61f <printint>
        ap++;
 76d:	83 c7 04             	add    $0x4,%edi
 770:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 773:	83 c4 10             	add    $0x10,%esp
      state = 0;
 776:	be 00 00 00 00       	mov    $0x0,%esi
 77b:	e9 56 ff ff ff       	jmp    6d6 <printf+0x2c>
        s = (char*)*ap;
 780:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 783:	8b 30                	mov    (%eax),%esi
        ap++;
 785:	83 c0 04             	add    $0x4,%eax
 788:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 78b:	85 f6                	test   %esi,%esi
 78d:	75 15                	jne    7a4 <printf+0xfa>
          s = "(null)";
 78f:	be 27 0a 00 00       	mov    $0xa27,%esi
 794:	eb 0e                	jmp    7a4 <printf+0xfa>
          putc(fd, *s);
 796:	0f be d2             	movsbl %dl,%edx
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	e8 64 fe ff ff       	call   605 <putc>
          s++;
 7a1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7a4:	0f b6 16             	movzbl (%esi),%edx
 7a7:	84 d2                	test   %dl,%dl
 7a9:	75 eb                	jne    796 <printf+0xec>
      state = 0;
 7ab:	be 00 00 00 00       	mov    $0x0,%esi
 7b0:	e9 21 ff ff ff       	jmp    6d6 <printf+0x2c>
        putc(fd, *ap);
 7b5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7b8:	0f be 17             	movsbl (%edi),%edx
 7bb:	8b 45 08             	mov    0x8(%ebp),%eax
 7be:	e8 42 fe ff ff       	call   605 <putc>
        ap++;
 7c3:	83 c7 04             	add    $0x4,%edi
 7c6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7c9:	be 00 00 00 00       	mov    $0x0,%esi
 7ce:	e9 03 ff ff ff       	jmp    6d6 <printf+0x2c>
        putc(fd, c);
 7d3:	89 fa                	mov    %edi,%edx
 7d5:	8b 45 08             	mov    0x8(%ebp),%eax
 7d8:	e8 28 fe ff ff       	call   605 <putc>
      state = 0;
 7dd:	be 00 00 00 00       	mov    $0x0,%esi
 7e2:	e9 ef fe ff ff       	jmp    6d6 <printf+0x2c>
        putc(fd, '%');
 7e7:	ba 25 00 00 00       	mov    $0x25,%edx
 7ec:	8b 45 08             	mov    0x8(%ebp),%eax
 7ef:	e8 11 fe ff ff       	call   605 <putc>
        putc(fd, c);
 7f4:	89 fa                	mov    %edi,%edx
 7f6:	8b 45 08             	mov    0x8(%ebp),%eax
 7f9:	e8 07 fe ff ff       	call   605 <putc>
      state = 0;
 7fe:	be 00 00 00 00       	mov    $0x0,%esi
 803:	e9 ce fe ff ff       	jmp    6d6 <printf+0x2c>
    }
  }
}
 808:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80b:	5b                   	pop    %ebx
 80c:	5e                   	pop    %esi
 80d:	5f                   	pop    %edi
 80e:	5d                   	pop    %ebp
 80f:	c3                   	ret    

00000810 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 827:	55                   	push   %ebp
 828:	89 e5                	mov    %esp,%ebp
 82a:	57                   	push   %edi
 82b:	56                   	push   %esi
 82c:	53                   	push   %ebx
 82d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 830:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 833:	a1 60 0f 00 00       	mov    0xf60,%eax
 838:	eb 02                	jmp    83c <free+0x15>
 83a:	89 d0                	mov    %edx,%eax
 83c:	39 c8                	cmp    %ecx,%eax
 83e:	73 04                	jae    844 <free+0x1d>
 840:	39 08                	cmp    %ecx,(%eax)
 842:	77 12                	ja     856 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 844:	8b 10                	mov    (%eax),%edx
 846:	39 c2                	cmp    %eax,%edx
 848:	77 f0                	ja     83a <free+0x13>
 84a:	39 c8                	cmp    %ecx,%eax
 84c:	72 08                	jb     856 <free+0x2f>
 84e:	39 ca                	cmp    %ecx,%edx
 850:	77 04                	ja     856 <free+0x2f>
 852:	89 d0                	mov    %edx,%eax
 854:	eb e6                	jmp    83c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 856:	8b 73 fc             	mov    -0x4(%ebx),%esi
 859:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 85c:	8b 10                	mov    (%eax),%edx
 85e:	39 d7                	cmp    %edx,%edi
 860:	74 19                	je     87b <free+0x54>
=======
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 819:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 81c:	a1 40 11 00 00       	mov    0x1140,%eax
 821:	eb 02                	jmp    825 <free+0x15>
 823:	89 d0                	mov    %edx,%eax
 825:	39 c8                	cmp    %ecx,%eax
 827:	73 04                	jae    82d <free+0x1d>
 829:	39 08                	cmp    %ecx,(%eax)
 82b:	77 12                	ja     83f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 82d:	8b 10                	mov    (%eax),%edx
 82f:	39 c2                	cmp    %eax,%edx
 831:	77 f0                	ja     823 <free+0x13>
 833:	39 c8                	cmp    %ecx,%eax
 835:	72 08                	jb     83f <free+0x2f>
 837:	39 ca                	cmp    %ecx,%edx
 839:	77 04                	ja     83f <free+0x2f>
 83b:	89 d0                	mov    %edx,%eax
 83d:	eb e6                	jmp    825 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 83f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 842:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 845:	8b 10                	mov    (%eax),%edx
 847:	39 d7                	cmp    %edx,%edi
 849:	74 19                	je     864 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 862:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 865:	8b 50 04             	mov    0x4(%eax),%edx
 868:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 86b:	39 ce                	cmp    %ecx,%esi
 86d:	74 1b                	je     88a <free+0x63>
=======
 84b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 84e:	8b 50 04             	mov    0x4(%eax),%edx
 851:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 854:	39 ce                	cmp    %ecx,%esi
 856:	74 1b                	je     873 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 86f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 871:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 876:	5b                   	pop    %ebx
 877:	5e                   	pop    %esi
 878:	5f                   	pop    %edi
 879:	5d                   	pop    %ebp
 87a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 87b:	03 72 04             	add    0x4(%edx),%esi
 87e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 881:	8b 10                	mov    (%eax),%edx
 883:	8b 12                	mov    (%edx),%edx
 885:	89 53 f8             	mov    %edx,-0x8(%ebx)
 888:	eb db                	jmp    865 <free+0x3e>
    p->s.size += bp->s.size;
 88a:	03 53 fc             	add    -0x4(%ebx),%edx
 88d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 890:	8b 53 f8             	mov    -0x8(%ebx),%edx
 893:	89 10                	mov    %edx,(%eax)
 895:	eb da                	jmp    871 <free+0x4a>

00000897 <morecore>:
=======
 858:	89 08                	mov    %ecx,(%eax)
  freep = p;
 85a:	a3 40 11 00 00       	mov    %eax,0x1140
}
 85f:	5b                   	pop    %ebx
 860:	5e                   	pop    %esi
 861:	5f                   	pop    %edi
 862:	5d                   	pop    %ebp
 863:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 864:	03 72 04             	add    0x4(%edx),%esi
 867:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 86a:	8b 10                	mov    (%eax),%edx
 86c:	8b 12                	mov    (%edx),%edx
 86e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 871:	eb db                	jmp    84e <free+0x3e>
    p->s.size += bp->s.size;
 873:	03 53 fc             	add    -0x4(%ebx),%edx
 876:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 879:	8b 53 f8             	mov    -0x8(%ebx),%edx
 87c:	89 10                	mov    %edx,(%eax)
 87e:	eb da                	jmp    85a <free+0x4a>

00000880 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 897:	55                   	push   %ebp
 898:	89 e5                	mov    %esp,%ebp
 89a:	53                   	push   %ebx
 89b:	83 ec 04             	sub    $0x4,%esp
 89e:	89 c3                	mov    %eax,%ebx
=======
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	53                   	push   %ebx
 884:	83 ec 04             	sub    $0x4,%esp
 887:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 8a0:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8a5:	77 05                	ja     8ac <morecore+0x15>
    nu = 4096;
 8a7:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8ac:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8b3:	83 ec 0c             	sub    $0xc,%esp
 8b6:	50                   	push   %eax
 8b7:	e8 38 fd ff ff       	call   5f4 <sbrk>
  if(p == (char*)-1)
 8bc:	83 c4 10             	add    $0x10,%esp
 8bf:	83 f8 ff             	cmp    $0xffffffff,%eax
 8c2:	74 1c                	je     8e0 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8c4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8c7:	83 c0 08             	add    $0x8,%eax
 8ca:	83 ec 0c             	sub    $0xc,%esp
 8cd:	50                   	push   %eax
 8ce:	e8 54 ff ff ff       	call   827 <free>
  return freep;
 8d3:	a1 60 0f 00 00       	mov    0xf60,%eax
 8d8:	83 c4 10             	add    $0x10,%esp
}
 8db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8de:	c9                   	leave  
 8df:	c3                   	ret    
    return 0;
 8e0:	b8 00 00 00 00       	mov    $0x0,%eax
 8e5:	eb f4                	jmp    8db <morecore+0x44>

000008e7 <malloc>:
=======
 889:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 88e:	77 05                	ja     895 <morecore+0x15>
    nu = 4096;
 890:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 895:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 89c:	83 ec 0c             	sub    $0xc,%esp
 89f:	50                   	push   %eax
 8a0:	e8 38 fd ff ff       	call   5dd <sbrk>
  if(p == (char*)-1)
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ab:	74 1c                	je     8c9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8ad:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8b0:	83 c0 08             	add    $0x8,%eax
 8b3:	83 ec 0c             	sub    $0xc,%esp
 8b6:	50                   	push   %eax
 8b7:	e8 54 ff ff ff       	call   810 <free>
  return freep;
 8bc:	a1 40 11 00 00       	mov    0x1140,%eax
 8c1:	83 c4 10             	add    $0x10,%esp
}
 8c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c7:	c9                   	leave  
 8c8:	c3                   	ret    
    return 0;
 8c9:	b8 00 00 00 00       	mov    $0x0,%eax
 8ce:	eb f4                	jmp    8c4 <morecore+0x44>

000008d0 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 8e7:	55                   	push   %ebp
 8e8:	89 e5                	mov    %esp,%ebp
 8ea:	53                   	push   %ebx
 8eb:	83 ec 04             	sub    $0x4,%esp
=======
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	53                   	push   %ebx
 8d4:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 8ee:	8b 45 08             	mov    0x8(%ebp),%eax
 8f1:	8d 58 07             	lea    0x7(%eax),%ebx
 8f4:	c1 eb 03             	shr    $0x3,%ebx
 8f7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8fa:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 900:	85 c9                	test   %ecx,%ecx
 902:	74 04                	je     908 <malloc+0x21>
=======
 8d7:	8b 45 08             	mov    0x8(%ebp),%eax
 8da:	8d 58 07             	lea    0x7(%eax),%ebx
 8dd:	c1 eb 03             	shr    $0x3,%ebx
 8e0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8e3:	8b 0d 40 11 00 00    	mov    0x1140,%ecx
 8e9:	85 c9                	test   %ecx,%ecx
 8eb:	74 04                	je     8f1 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 904:	8b 01                	mov    (%ecx),%eax
 906:	eb 4a                	jmp    952 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 908:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 90f:	0f 00 00 
 912:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 919:	0f 00 00 
    base.s.size = 0;
 91c:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 923:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 926:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 92b:	eb d7                	jmp    904 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 92d:	74 19                	je     948 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 92f:	29 da                	sub    %ebx,%edx
 931:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 934:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 937:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 93a:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 940:	83 c0 08             	add    $0x8,%eax
=======
 8ed:	8b 01                	mov    (%ecx),%eax
 8ef:	eb 4a                	jmp    93b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8f1:	c7 05 40 11 00 00 44 	movl   $0x1144,0x1140
 8f8:	11 00 00 
 8fb:	c7 05 44 11 00 00 44 	movl   $0x1144,0x1144
 902:	11 00 00 
    base.s.size = 0;
 905:	c7 05 48 11 00 00 00 	movl   $0x0,0x1148
 90c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 90f:	b9 44 11 00 00       	mov    $0x1144,%ecx
 914:	eb d7                	jmp    8ed <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 916:	74 19                	je     931 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 918:	29 da                	sub    %ebx,%edx
 91a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 91d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 920:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 923:	89 0d 40 11 00 00    	mov    %ecx,0x1140
      return (void*)(p + 1);
 929:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 943:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 946:	c9                   	leave  
 947:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 948:	8b 10                	mov    (%eax),%edx
 94a:	89 11                	mov    %edx,(%ecx)
 94c:	eb ec                	jmp    93a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 94e:	89 c1                	mov    %eax,%ecx
 950:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 952:	8b 50 04             	mov    0x4(%eax),%edx
 955:	39 da                	cmp    %ebx,%edx
 957:	73 d4                	jae    92d <malloc+0x46>
    if(p == freep)
 959:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 95f:	75 ed                	jne    94e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 961:	89 d8                	mov    %ebx,%eax
 963:	e8 2f ff ff ff       	call   897 <morecore>
 968:	85 c0                	test   %eax,%eax
 96a:	75 e2                	jne    94e <malloc+0x67>
 96c:	eb d5                	jmp    943 <malloc+0x5c>
=======
 92c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 92f:	c9                   	leave  
 930:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 931:	8b 10                	mov    (%eax),%edx
 933:	89 11                	mov    %edx,(%ecx)
 935:	eb ec                	jmp    923 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 937:	89 c1                	mov    %eax,%ecx
 939:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 93b:	8b 50 04             	mov    0x4(%eax),%edx
 93e:	39 da                	cmp    %ebx,%edx
 940:	73 d4                	jae    916 <malloc+0x46>
    if(p == freep)
 942:	39 05 40 11 00 00    	cmp    %eax,0x1140
 948:	75 ed                	jne    937 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 94a:	89 d8                	mov    %ebx,%eax
 94c:	e8 2f ff ff ff       	call   880 <morecore>
 951:	85 c0                	test   %eax,%eax
 953:	75 e2                	jne    937 <malloc+0x67>
 955:	eb d5                	jmp    92c <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
