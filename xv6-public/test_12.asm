
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   
   exit();
}


void worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
<<<<<<< HEAD
   6:	68 c4 0f 00 00       	push   $0xfc4
   b:	e8 20 05 00 00       	call   530 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 79 07 00 00       	call   795 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 10 0b 00 00       	push   $0xb10
  2e:	68 1a 0b 00 00       	push   $0xb1a
  33:	6a 01                	push   $0x1
  35:	e8 28 08 00 00       	call   862 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 22 0b 00 00       	push   $0xb22
  42:	68 40 0b 00 00       	push   $0xb40
  47:	6a 01                	push   $0x1
  49:	e8 14 08 00 00       	call   862 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 54 0b 00 00       	push   $0xb54
  56:	6a 01                	push   $0x1
  58:	e8 05 08 00 00       	call   862 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 d0 0f 00 00    	push   0xfd0
  66:	e8 d2 06 00 00       	call   73d <kill>
  6b:	e8 9d 06 00 00       	call   70d <exit>
   global++;
  70:	83 05 cc 0f 00 00 01 	addl   $0x1,0xfcc
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 c4 0f 00 00       	push   $0xfc4
  7f:	e8 ce 04 00 00       	call   552 <lock_release>
=======
   6:	68 a4 0f 00 00       	push   $0xfa4
   b:	e8 09 05 00 00       	call   519 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 62 07 00 00       	call   77e <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 a8 0f 00 00    	cmp    0xfa8,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 f8 0a 00 00       	push   $0xaf8
  2e:	68 02 0b 00 00       	push   $0xb02
  33:	6a 01                	push   $0x1
  35:	e8 11 08 00 00       	call   84b <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 0a 0b 00 00       	push   $0xb0a
  42:	68 28 0b 00 00       	push   $0xb28
  47:	6a 01                	push   $0x1
  49:	e8 fd 07 00 00       	call   84b <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 3c 0b 00 00       	push   $0xb3c
  56:	6a 01                	push   $0x1
  58:	e8 ee 07 00 00       	call   84b <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 b0 0f 00 00    	push   0xfb0
  66:	e8 bb 06 00 00       	call   726 <kill>
  6b:	e8 86 06 00 00       	call   6f6 <exit>
   global++;
  70:	83 05 ac 0f 00 00 01 	addl   $0x1,0xfac
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 a4 0f 00 00       	push   $0xfa4
  7f:	e8 b7 04 00 00       	call   53b <lock_release>
>>>>>>> c59b0f9 (fixed thread_join and join)

   


   lock_acquire(&lock2);
<<<<<<< HEAD
  84:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
  8b:	e8 a0 04 00 00       	call   530 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 f9 06 00 00       	call   795 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 10 0b 00 00       	push   $0xb10
  ae:	68 1a 0b 00 00       	push   $0xb1a
  b3:	6a 01                	push   $0x1
  b5:	e8 a8 07 00 00       	call   862 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 22 0b 00 00       	push   $0xb22
  c2:	68 40 0b 00 00       	push   $0xb40
  c7:	6a 01                	push   $0x1
  c9:	e8 94 07 00 00       	call   862 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 54 0b 00 00       	push   $0xb54
  d6:	6a 01                	push   $0x1
  d8:	e8 85 07 00 00       	call   862 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 d0 0f 00 00    	push   0xfd0
  e6:	e8 52 06 00 00       	call   73d <kill>
  eb:	e8 1d 06 00 00       	call   70d <exit>
   global++;
  f0:	83 05 cc 0f 00 00 01 	addl   $0x1,0xfcc
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 91 06 00 00       	call   795 <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 85 06 00 00       	call   795 <sbrk>
 110:	a3 c8 0f 00 00       	mov    %eax,0xfc8
   lock_release(&lock2);
 115:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 11c:	e8 31 04 00 00       	call   552 <lock_release>
=======
  84:	c7 04 24 a0 0f 00 00 	movl   $0xfa0,(%esp)
  8b:	e8 89 04 00 00       	call   519 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 e2 06 00 00       	call   77e <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 a8 0f 00 00    	cmp    0xfa8,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 f8 0a 00 00       	push   $0xaf8
  ae:	68 02 0b 00 00       	push   $0xb02
  b3:	6a 01                	push   $0x1
  b5:	e8 91 07 00 00       	call   84b <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 0a 0b 00 00       	push   $0xb0a
  c2:	68 28 0b 00 00       	push   $0xb28
  c7:	6a 01                	push   $0x1
  c9:	e8 7d 07 00 00       	call   84b <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 3c 0b 00 00       	push   $0xb3c
  d6:	6a 01                	push   $0x1
  d8:	e8 6e 07 00 00       	call   84b <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 b0 0f 00 00    	push   0xfb0
  e6:	e8 3b 06 00 00       	call   726 <kill>
  eb:	e8 06 06 00 00       	call   6f6 <exit>
   global++;
  f0:	83 05 ac 0f 00 00 01 	addl   $0x1,0xfac
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 7a 06 00 00       	call   77e <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 6e 06 00 00       	call   77e <sbrk>
 110:	a3 a8 0f 00 00       	mov    %eax,0xfa8
   lock_release(&lock2);
 115:	c7 04 24 a0 0f 00 00 	movl   $0xfa0,(%esp)
 11c:	e8 1a 04 00 00       	call   53b <lock_release>
>>>>>>> c59b0f9 (fixed thread_join and join)



   exit();
<<<<<<< HEAD
 121:	e8 e7 05 00 00       	call   70d <exit>
=======
 121:	e8 d0 05 00 00       	call   6f6 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000126 <main>:
{
 126:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 12a:	83 e4 f0             	and    $0xfffffff0,%esp
 12d:	ff 71 fc             	push   -0x4(%ecx)
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	51                   	push   %ecx
 135:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
<<<<<<< HEAD
 138:	e8 50 06 00 00       	call   78d <getpid>
 13d:	a3 d0 0f 00 00       	mov    %eax,0xfd0
=======
 138:	e8 39 06 00 00       	call   776 <getpid>
 13d:	a3 b0 0f 00 00       	mov    %eax,0xfb0
>>>>>>> c59b0f9 (fixed thread_join and join)
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
 153:	68 c4 0f 00 00       	push   $0xfc4
 158:	e8 03 04 00 00       	call   560 <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 164:	e8 f7 03 00 00       	call   560 <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 c4 0f 00 00 	movl   $0xfc4,(%esp)
 170:	e8 bb 03 00 00       	call   530 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 17c:	e8 af 03 00 00       	call   530 <lock_acquire>
=======
 153:	68 a4 0f 00 00       	push   $0xfa4
 158:	e8 ec 03 00 00       	call   549 <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 a0 0f 00 00 	movl   $0xfa0,(%esp)
 164:	e8 e0 03 00 00       	call   549 <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 a4 0f 00 00 	movl   $0xfa4,(%esp)
 170:	e8 a4 03 00 00       	call   519 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 a0 0f 00 00 	movl   $0xfa0,(%esp)
 17c:	e8 98 03 00 00       	call   519 <lock_acquire>
>>>>>>> c59b0f9 (fixed thread_join and join)
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
<<<<<<< HEAD
 18e:	39 1d b8 0f 00 00    	cmp    %ebx,0xfb8
=======
 18e:	39 1d 9c 0f 00 00    	cmp    %ebx,0xf9c
>>>>>>> c59b0f9 (fixed thread_join and join)
 194:	7e 65                	jle    1fb <main+0xd5>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 196:	83 ec 04             	sub    $0x4,%esp
 199:	8d 45 f0             	lea    -0x10(%ebp),%eax
 19c:	50                   	push   %eax
 19d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	68 00 00 00 00       	push   $0x0
 1a6:	e8 d4 02 00 00       	call   47f <thread_create>
      assert(thread_pid > 0);
 1ab:	83 c4 10             	add    $0x10,%esp
 1ae:	85 c0                	test   %eax,%eax
 1b0:	7f d9                	jg     18b <main+0x65>
 1b2:	6a 28                	push   $0x28
<<<<<<< HEAD
 1b4:	68 10 0b 00 00       	push   $0xb10
 1b9:	68 1a 0b 00 00       	push   $0xb1a
 1be:	6a 01                	push   $0x1
 1c0:	e8 9d 06 00 00       	call   862 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 61 0b 00 00       	push   $0xb61
 1cd:	68 40 0b 00 00       	push   $0xb40
 1d2:	6a 01                	push   $0x1
 1d4:	e8 89 06 00 00       	call   862 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 54 0b 00 00       	push   $0xb54
 1e1:	6a 01                	push   $0x1
 1e3:	e8 7a 06 00 00       	call   862 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 d0 0f 00 00    	push   0xfd0
 1f1:	e8 47 05 00 00       	call   73d <kill>
 1f6:	e8 12 05 00 00       	call   70d <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 90 05 00 00       	call   795 <sbrk>
 205:	a3 c8 0f 00 00       	mov    %eax,0xfc8
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 b8 0f 00 00       	mov    0xfb8,%eax
 212:	39 05 cc 0f 00 00    	cmp    %eax,0xfcc
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 c4 0f 00 00       	push   $0xfc4
 222:	e8 2b 03 00 00       	call   552 <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 6a 05 00 00       	call   79d <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 c4 0f 00 00 	movl   $0xfc4,(%esp)
 23a:	e8 f1 02 00 00       	call   530 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 cc 0f 00 00 00 	movl   $0x0,0xfcc
=======
 1b4:	68 f8 0a 00 00       	push   $0xaf8
 1b9:	68 02 0b 00 00       	push   $0xb02
 1be:	6a 01                	push   $0x1
 1c0:	e8 86 06 00 00       	call   84b <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 49 0b 00 00       	push   $0xb49
 1cd:	68 28 0b 00 00       	push   $0xb28
 1d2:	6a 01                	push   $0x1
 1d4:	e8 72 06 00 00       	call   84b <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 3c 0b 00 00       	push   $0xb3c
 1e1:	6a 01                	push   $0x1
 1e3:	e8 63 06 00 00       	call   84b <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 b0 0f 00 00    	push   0xfb0
 1f1:	e8 30 05 00 00       	call   726 <kill>
 1f6:	e8 fb 04 00 00       	call   6f6 <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 79 05 00 00       	call   77e <sbrk>
 205:	a3 a8 0f 00 00       	mov    %eax,0xfa8
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 9c 0f 00 00       	mov    0xf9c,%eax
 212:	39 05 ac 0f 00 00    	cmp    %eax,0xfac
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 a4 0f 00 00       	push   $0xfa4
 222:	e8 14 03 00 00       	call   53b <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 53 05 00 00       	call   786 <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 a4 0f 00 00 	movl   $0xfa4,(%esp)
 23a:	e8 da 02 00 00       	call   519 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 ac 0f 00 00 00 	movl   $0x0,0xfac
>>>>>>> c59b0f9 (fixed thread_join and join)
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
<<<<<<< HEAD
 256:	e8 3a 05 00 00       	call   795 <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 2e 05 00 00       	call   795 <sbrk>
 267:	a3 c8 0f 00 00       	mov    %eax,0xfc8
   lock_release(&lock);
 26c:	c7 04 24 c4 0f 00 00 	movl   $0xfc4,(%esp)
 273:	e8 da 02 00 00       	call   552 <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 b8 0f 00 00       	mov    0xfb8,%eax
 280:	39 05 cc 0f 00 00    	cmp    %eax,0xfcc
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 c0 0f 00 00       	push   $0xfc0
 290:	e8 bd 02 00 00       	call   552 <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 fc 04 00 00       	call   79d <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 2a8:	e8 83 02 00 00       	call   530 <lock_acquire>
=======
 256:	e8 23 05 00 00       	call   77e <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 17 05 00 00       	call   77e <sbrk>
 267:	a3 a8 0f 00 00       	mov    %eax,0xfa8
   lock_release(&lock);
 26c:	c7 04 24 a4 0f 00 00 	movl   $0xfa4,(%esp)
 273:	e8 c3 02 00 00       	call   53b <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 9c 0f 00 00       	mov    0xf9c,%eax
 280:	39 05 ac 0f 00 00    	cmp    %eax,0xfac
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 a0 0f 00 00       	push   $0xfa0
 290:	e8 a6 02 00 00       	call   53b <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 e5 04 00 00       	call   786 <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 a0 0f 00 00 	movl   $0xfa0,(%esp)
 2a8:	e8 6c 02 00 00       	call   519 <lock_acquire>
>>>>>>> c59b0f9 (fixed thread_join and join)
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
 2b5:	68 c0 0f 00 00       	push   $0xfc0
 2ba:	e8 93 02 00 00       	call   552 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d b8 0f 00 00    	cmp    %ebx,0xfb8
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 0b 02 00 00       	call   4df <thread_join>
=======
 2b5:	68 a0 0f 00 00       	push   $0xfa0
 2ba:	e8 7c 02 00 00       	call   53b <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d 9c 0f 00 00    	cmp    %ebx,0xf9c
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 21 02 00 00       	call   4f5 <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
<<<<<<< HEAD
 2df:	68 10 0b 00 00       	push   $0xb10
 2e4:	68 1a 0b 00 00       	push   $0xb1a
 2e9:	6a 01                	push   $0x1
 2eb:	e8 72 05 00 00       	call   862 <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 70 0b 00 00       	push   $0xb70
 2f8:	68 40 0b 00 00       	push   $0xb40
 2fd:	6a 01                	push   $0x1
 2ff:	e8 5e 05 00 00       	call   862 <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 54 0b 00 00       	push   $0xb54
 30c:	6a 01                	push   $0x1
 30e:	e8 4f 05 00 00       	call   862 <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 d0 0f 00 00    	push   0xfd0
 31c:	e8 1c 04 00 00       	call   73d <kill>
 321:	e8 e7 03 00 00       	call   70d <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 7d 0b 00 00       	push   $0xb7d
 32e:	6a 01                	push   $0x1
 330:	e8 2d 05 00 00       	call   862 <printf>
   exit();
 335:	e8 d3 03 00 00       	call   70d <exit>
=======
 2df:	68 f8 0a 00 00       	push   $0xaf8
 2e4:	68 02 0b 00 00       	push   $0xb02
 2e9:	6a 01                	push   $0x1
 2eb:	e8 5b 05 00 00       	call   84b <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 58 0b 00 00       	push   $0xb58
 2f8:	68 28 0b 00 00       	push   $0xb28
 2fd:	6a 01                	push   $0x1
 2ff:	e8 47 05 00 00       	call   84b <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 3c 0b 00 00       	push   $0xb3c
 30c:	6a 01                	push   $0x1
 30e:	e8 38 05 00 00       	call   84b <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 b0 0f 00 00    	push   0xfb0
 31c:	e8 05 04 00 00       	call   726 <kill>
 321:	e8 d0 03 00 00       	call   6f6 <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 65 0b 00 00       	push   $0xb65
 32e:	6a 01                	push   $0x1
 330:	e8 16 05 00 00       	call   84b <printf>
   exit();
 335:	e8 bc 03 00 00       	call   6f6 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000033a <worker2>:
{
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
 33d:	83 ec 08             	sub    $0x8,%esp
   int arg2_int = *(int*)arg2;
 340:	8b 45 0c             	mov    0xc(%ebp),%eax
 343:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 11);
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	83 38 0b             	cmpl   $0xb,(%eax)
 34b:	75 52                	jne    39f <worker2+0x65>
   assert(arg2_int == 22);
 34d:	83 fa 16             	cmp    $0x16,%edx
 350:	0f 84 92 00 00 00    	je     3e8 <worker2+0xae>
 356:	6a 4d                	push   $0x4d
<<<<<<< HEAD
 358:	68 10 0b 00 00       	push   $0xb10
 35d:	68 1a 0b 00 00       	push   $0xb1a
 362:	6a 01                	push   $0x1
 364:	e8 f9 04 00 00       	call   862 <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 99 0b 00 00       	push   $0xb99
 371:	68 40 0b 00 00       	push   $0xb40
 376:	6a 01                	push   $0x1
 378:	e8 e5 04 00 00       	call   862 <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 54 0b 00 00       	push   $0xb54
 385:	6a 01                	push   $0x1
 387:	e8 d6 04 00 00       	call   862 <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 d0 0f 00 00    	push   0xfd0
 395:	e8 a3 03 00 00       	call   73d <kill>
 39a:	e8 6e 03 00 00       	call   70d <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 10 0b 00 00       	push   $0xb10
 3a6:	68 1a 0b 00 00       	push   $0xb1a
 3ab:	6a 01                	push   $0x1
 3ad:	e8 b0 04 00 00       	call   862 <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 8a 0b 00 00       	push   $0xb8a
 3ba:	68 40 0b 00 00       	push   $0xb40
 3bf:	6a 01                	push   $0x1
 3c1:	e8 9c 04 00 00       	call   862 <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 54 0b 00 00       	push   $0xb54
 3ce:	6a 01                	push   $0x1
 3d0:	e8 8d 04 00 00       	call   862 <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 d0 0f 00 00    	push   0xfd0
 3de:	e8 5a 03 00 00       	call   73d <kill>
 3e3:	e8 25 03 00 00       	call   70d <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 c0 0f 00 00       	push   $0xfc0
 3f0:	e8 3b 01 00 00       	call   530 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 94 03 00 00       	call   795 <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 10 0b 00 00       	push   $0xb10
 413:	68 1a 0b 00 00       	push   $0xb1a
 418:	6a 01                	push   $0x1
 41a:	e8 43 04 00 00       	call   862 <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 22 0b 00 00       	push   $0xb22
 427:	68 40 0b 00 00       	push   $0xb40
 42c:	6a 01                	push   $0x1
 42e:	e8 2f 04 00 00       	call   862 <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 54 0b 00 00       	push   $0xb54
 43b:	6a 01                	push   $0x1
 43d:	e8 20 04 00 00       	call   862 <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 d0 0f 00 00    	push   0xfd0
 44b:	e8 ed 02 00 00       	call   73d <kill>
 450:	e8 b8 02 00 00       	call   70d <exit>
   global++;
 455:	83 05 cc 0f 00 00 01 	addl   $0x1,0xfcc
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 c0 0f 00 00       	push   $0xfc0
 464:	e8 e9 00 00 00       	call   552 <lock_release>
   exit();
 469:	e8 9f 02 00 00       	call   70d <exit>
=======
 358:	68 f8 0a 00 00       	push   $0xaf8
 35d:	68 02 0b 00 00       	push   $0xb02
 362:	6a 01                	push   $0x1
 364:	e8 e2 04 00 00       	call   84b <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 81 0b 00 00       	push   $0xb81
 371:	68 28 0b 00 00       	push   $0xb28
 376:	6a 01                	push   $0x1
 378:	e8 ce 04 00 00       	call   84b <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 3c 0b 00 00       	push   $0xb3c
 385:	6a 01                	push   $0x1
 387:	e8 bf 04 00 00       	call   84b <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 b0 0f 00 00    	push   0xfb0
 395:	e8 8c 03 00 00       	call   726 <kill>
 39a:	e8 57 03 00 00       	call   6f6 <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 f8 0a 00 00       	push   $0xaf8
 3a6:	68 02 0b 00 00       	push   $0xb02
 3ab:	6a 01                	push   $0x1
 3ad:	e8 99 04 00 00       	call   84b <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 72 0b 00 00       	push   $0xb72
 3ba:	68 28 0b 00 00       	push   $0xb28
 3bf:	6a 01                	push   $0x1
 3c1:	e8 85 04 00 00       	call   84b <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 3c 0b 00 00       	push   $0xb3c
 3ce:	6a 01                	push   $0x1
 3d0:	e8 76 04 00 00       	call   84b <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 b0 0f 00 00    	push   0xfb0
 3de:	e8 43 03 00 00       	call   726 <kill>
 3e3:	e8 0e 03 00 00       	call   6f6 <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 a0 0f 00 00       	push   $0xfa0
 3f0:	e8 24 01 00 00       	call   519 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 7d 03 00 00       	call   77e <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 a8 0f 00 00    	cmp    0xfa8,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 f8 0a 00 00       	push   $0xaf8
 413:	68 02 0b 00 00       	push   $0xb02
 418:	6a 01                	push   $0x1
 41a:	e8 2c 04 00 00       	call   84b <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 0a 0b 00 00       	push   $0xb0a
 427:	68 28 0b 00 00       	push   $0xb28
 42c:	6a 01                	push   $0x1
 42e:	e8 18 04 00 00       	call   84b <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 3c 0b 00 00       	push   $0xb3c
 43b:	6a 01                	push   $0x1
 43d:	e8 09 04 00 00       	call   84b <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 b0 0f 00 00    	push   0xfb0
 44b:	e8 d6 02 00 00       	call   726 <kill>
 450:	e8 a1 02 00 00       	call   6f6 <exit>
   global++;
 455:	83 05 ac 0f 00 00 01 	addl   $0x1,0xfac
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 a0 0f 00 00       	push   $0xfa0
 464:	e8 d2 00 00 00       	call   53b <lock_release>
   exit();
 469:	e8 88 02 00 00       	call   6f6 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000046e <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 474:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 476:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 479:	89 08                	mov    %ecx,(%eax)
  return old;
}
 47b:	89 d0                	mov    %edx,%eax
 47d:	5d                   	pop    %ebp
 47e:	c3                   	ret    

0000047f <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 47f:	55                   	push   %ebp
 480:	89 e5                	mov    %esp,%ebp
 482:	53                   	push   %ebx
 483:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 486:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 48b:	e8 f8 05 00 00       	call   a88 <malloc>
  if(n_stack == 0){
 490:	83 c4 10             	add    $0x10,%esp
 493:	85 c0                	test   %eax,%eax
 495:	74 41                	je     4d8 <thread_create+0x59>
 497:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 499:	50                   	push   %eax
 49a:	ff 75 10             	push   0x10(%ebp)
 49d:	ff 75 0c             	push   0xc(%ebp)
 4a0:	ff 75 08             	push   0x8(%ebp)
 4a3:	e8 05 03 00 00       	call   7ad <clone>
=======
 48b:	e8 e1 05 00 00       	call   a71 <malloc>
  if(n_stack == 0){
 490:	83 c4 10             	add    $0x10,%esp
 493:	85 c0                	test   %eax,%eax
 495:	74 57                	je     4ee <thread_create+0x6f>
 497:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 499:	b8 00 00 00 00       	mov    $0x0,%eax
 49e:	eb 03                	jmp    4a3 <thread_create+0x24>
 4a0:	83 c0 01             	add    $0x1,%eax
 4a3:	83 f8 3f             	cmp    $0x3f,%eax
 4a6:	7f 2f                	jg     4d7 <thread_create+0x58>
    if(threads[i].flag==0){
 4a8:	8d 14 40             	lea    (%eax,%eax,2),%edx
 4ab:	83 3c 95 c8 0f 00 00 	cmpl   $0x0,0xfc8(,%edx,4)
 4b2:	00 
 4b3:	75 eb                	jne    4a0 <thread_create+0x21>
      threads[i].maddr = n_stack;
 4b5:	8d 14 00             	lea    (%eax,%eax,1),%edx
 4b8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 4bb:	c1 e3 02             	shl    $0x2,%ebx
 4be:	89 8b c0 0f 00 00    	mov    %ecx,0xfc0(%ebx)
      threads[i].pg1addr = n_stack;
 4c4:	89 8b c4 0f 00 00    	mov    %ecx,0xfc4(%ebx)
      threads[i].flag = 1;
 4ca:	01 c2                	add    %eax,%edx
 4cc:	c7 04 95 c8 0f 00 00 	movl   $0x1,0xfc8(,%edx,4)
 4d3:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 4d7:	51                   	push   %ecx
 4d8:	ff 75 10             	push   0x10(%ebp)
 4db:	ff 75 0c             	push   0xc(%ebp)
 4de:	ff 75 08             	push   0x8(%ebp)
 4e1:	e8 b0 02 00 00       	call   796 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 4a8:	83 c4 10             	add    $0x10,%esp
 4ab:	ba 00 00 00 00       	mov    $0x0,%edx
 4b0:	eb 03                	jmp    4b5 <thread_create+0x36>
 4b2:	83 c2 01             	add    $0x1,%edx
 4b5:	83 fa 3f             	cmp    $0x3f,%edx
 4b8:	7f 19                	jg     4d3 <thread_create+0x54>
    if(threads[i]->flag==0){
 4ba:	8b 0c 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%ecx
 4c1:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 4c5:	75 eb                	jne    4b2 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 4c7:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 4c9:	8b 14 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%edx
 4d0:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 4d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d6:	c9                   	leave  
 4d7:	c3                   	ret    
    return -1;
 4d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4dd:	eb f4                	jmp    4d3 <thread_create+0x54>

000004df <thread_join>:
=======
 4e6:	83 c4 10             	add    $0x10,%esp
}
 4e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ec:	c9                   	leave  
 4ed:	c3                   	ret    
    return -1;
 4ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4f3:	eb f4                	jmp    4e9 <thread_create+0x6a>

000004f5 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 4df:	55                   	push   %ebp
 4e0:	89 e5                	mov    %esp,%ebp
 4e2:	56                   	push   %esi
 4e3:	53                   	push   %ebx
 4e4:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4e7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ea:	50                   	push   %eax
 4eb:	e8 c5 02 00 00       	call   7b5 <join>
 4f0:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	bb 00 00 00 00       	mov    $0x0,%ebx
 4fa:	eb 03                	jmp    4ff <thread_join+0x20>
 4fc:	83 c3 01             	add    $0x1,%ebx
 4ff:	83 fb 3f             	cmp    $0x3f,%ebx
 502:	7f 23                	jg     527 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 504:	8b 04 9d e0 0f 00 00 	mov    0xfe0(,%ebx,4),%eax
 50b:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 50f:	75 eb                	jne    4fc <thread_join+0x1d>
 511:	8b 55 f4             	mov    -0xc(%ebp),%edx
 514:	39 50 04             	cmp    %edx,0x4(%eax)
 517:	75 e3                	jne    4fc <thread_join+0x1d>
      free(stk_addr);
 519:	83 ec 0c             	sub    $0xc,%esp
 51c:	52                   	push   %edx
 51d:	e8 a6 04 00 00       	call   9c8 <free>
 522:	83 c4 10             	add    $0x10,%esp
 525:	eb d5                	jmp    4fc <thread_join+0x1d>
    }
  }
  return pid;
}
 527:	89 f0                	mov    %esi,%eax
 529:	8d 65 f8             	lea    -0x8(%ebp),%esp
 52c:	5b                   	pop    %ebx
 52d:	5e                   	pop    %esi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    

00000530 <lock_acquire>:

void lock_acquire(lock_t *lock){
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
 534:	83 ec 04             	sub    $0x4,%esp
 537:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 53a:	83 ec 08             	sub    $0x8,%esp
 53d:	6a 01                	push   $0x1
 53f:	53                   	push   %ebx
 540:	e8 29 ff ff ff       	call   46e <test_and_set>
 545:	83 c4 10             	add    $0x10,%esp
 548:	83 f8 01             	cmp    $0x1,%eax
 54b:	74 ed                	je     53a <lock_acquire+0xa>
    ;
}
 54d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 550:	c9                   	leave  
 551:	c3                   	ret    

00000552 <lock_release>:

void lock_release(lock_t *lock) {
 552:	55                   	push   %ebp
 553:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    

00000560 <lock_init>:

void lock_init(lock_t *lock) {
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 56c:	5d                   	pop    %ebp
 56d:	c3                   	ret    

0000056e <strcpy>:
=======
 4f5:	55                   	push   %ebp
 4f6:	89 e5                	mov    %esp,%ebp
 4f8:	53                   	push   %ebx
 4f9:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4fc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ff:	50                   	push   %eax
 500:	e8 99 02 00 00       	call   79e <join>
 505:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 507:	83 c4 04             	add    $0x4,%esp
 50a:	ff 75 f4             	push   -0xc(%ebp)
 50d:	e8 9f 04 00 00       	call   9b1 <free>
  return pid;
}
 512:	89 d8                	mov    %ebx,%eax
 514:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 517:	c9                   	leave  
 518:	c3                   	ret    

00000519 <lock_acquire>:

void lock_acquire(lock_t *lock){
 519:	55                   	push   %ebp
 51a:	89 e5                	mov    %esp,%ebp
 51c:	53                   	push   %ebx
 51d:	83 ec 04             	sub    $0x4,%esp
 520:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 523:	83 ec 08             	sub    $0x8,%esp
 526:	6a 01                	push   $0x1
 528:	53                   	push   %ebx
 529:	e8 40 ff ff ff       	call   46e <test_and_set>
 52e:	83 c4 10             	add    $0x10,%esp
 531:	83 f8 01             	cmp    $0x1,%eax
 534:	74 ed                	je     523 <lock_acquire+0xa>
    ;
}
 536:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 539:	c9                   	leave  
 53a:	c3                   	ret    

0000053b <lock_release>:

void lock_release(lock_t *lock) {
 53b:	55                   	push   %ebp
 53c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 53e:	8b 45 08             	mov    0x8(%ebp),%eax
 541:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 547:	5d                   	pop    %ebp
 548:	c3                   	ret    

00000549 <lock_init>:

void lock_init(lock_t *lock) {
 549:	55                   	push   %ebp
 54a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 54c:	8b 45 08             	mov    0x8(%ebp),%eax
 54f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 555:	5d                   	pop    %ebp
 556:	c3                   	ret    

00000557 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 56e:	55                   	push   %ebp
 56f:	89 e5                	mov    %esp,%ebp
 571:	56                   	push   %esi
 572:	53                   	push   %ebx
 573:	8b 75 08             	mov    0x8(%ebp),%esi
 576:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 557:	55                   	push   %ebp
 558:	89 e5                	mov    %esp,%ebp
 55a:	56                   	push   %esi
 55b:	53                   	push   %ebx
 55c:	8b 75 08             	mov    0x8(%ebp),%esi
 55f:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 579:	89 f0                	mov    %esi,%eax
 57b:	89 d1                	mov    %edx,%ecx
 57d:	83 c2 01             	add    $0x1,%edx
 580:	89 c3                	mov    %eax,%ebx
 582:	83 c0 01             	add    $0x1,%eax
 585:	0f b6 09             	movzbl (%ecx),%ecx
 588:	88 0b                	mov    %cl,(%ebx)
 58a:	84 c9                	test   %cl,%cl
 58c:	75 ed                	jne    57b <strcpy+0xd>
    ;
  return os;
}
 58e:	89 f0                	mov    %esi,%eax
 590:	5b                   	pop    %ebx
 591:	5e                   	pop    %esi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    

00000594 <strcmp>:
=======
 562:	89 f0                	mov    %esi,%eax
 564:	89 d1                	mov    %edx,%ecx
 566:	83 c2 01             	add    $0x1,%edx
 569:	89 c3                	mov    %eax,%ebx
 56b:	83 c0 01             	add    $0x1,%eax
 56e:	0f b6 09             	movzbl (%ecx),%ecx
 571:	88 0b                	mov    %cl,(%ebx)
 573:	84 c9                	test   %cl,%cl
 575:	75 ed                	jne    564 <strcpy+0xd>
    ;
  return os;
}
 577:	89 f0                	mov    %esi,%eax
 579:	5b                   	pop    %ebx
 57a:	5e                   	pop    %esi
 57b:	5d                   	pop    %ebp
 57c:	c3                   	ret    

0000057d <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	8b 4d 08             	mov    0x8(%ebp),%ecx
 59a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 59d:	eb 06                	jmp    5a5 <strcmp+0x11>
    p++, q++;
 59f:	83 c1 01             	add    $0x1,%ecx
 5a2:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 5a5:	0f b6 01             	movzbl (%ecx),%eax
 5a8:	84 c0                	test   %al,%al
 5aa:	74 04                	je     5b0 <strcmp+0x1c>
 5ac:	3a 02                	cmp    (%edx),%al
 5ae:	74 ef                	je     59f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 5b0:	0f b6 c0             	movzbl %al,%eax
 5b3:	0f b6 12             	movzbl (%edx),%edx
 5b6:	29 d0                	sub    %edx,%eax
}
 5b8:	5d                   	pop    %ebp
 5b9:	c3                   	ret    

000005ba <strlen>:
=======
 57d:	55                   	push   %ebp
 57e:	89 e5                	mov    %esp,%ebp
 580:	8b 4d 08             	mov    0x8(%ebp),%ecx
 583:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 586:	eb 06                	jmp    58e <strcmp+0x11>
    p++, q++;
 588:	83 c1 01             	add    $0x1,%ecx
 58b:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 58e:	0f b6 01             	movzbl (%ecx),%eax
 591:	84 c0                	test   %al,%al
 593:	74 04                	je     599 <strcmp+0x1c>
 595:	3a 02                	cmp    (%edx),%al
 597:	74 ef                	je     588 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 599:	0f b6 c0             	movzbl %al,%eax
 59c:	0f b6 12             	movzbl (%edx),%edx
 59f:	29 d0                	sub    %edx,%eax
}
 5a1:	5d                   	pop    %ebp
 5a2:	c3                   	ret    

000005a3 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 5ba:	55                   	push   %ebp
 5bb:	89 e5                	mov    %esp,%ebp
 5bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5c0:	b8 00 00 00 00       	mov    $0x0,%eax
 5c5:	eb 03                	jmp    5ca <strlen+0x10>
 5c7:	83 c0 01             	add    $0x1,%eax
 5ca:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 5ce:	75 f7                	jne    5c7 <strlen+0xd>
    ;
  return n;
}
 5d0:	5d                   	pop    %ebp
 5d1:	c3                   	ret    

000005d2 <memset>:
=======
 5a3:	55                   	push   %ebp
 5a4:	89 e5                	mov    %esp,%ebp
 5a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5a9:	b8 00 00 00 00       	mov    $0x0,%eax
 5ae:	eb 03                	jmp    5b3 <strlen+0x10>
 5b0:	83 c0 01             	add    $0x1,%eax
 5b3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 5b7:	75 f7                	jne    5b0 <strlen+0xd>
    ;
  return n;
}
 5b9:	5d                   	pop    %ebp
 5ba:	c3                   	ret    

000005bb <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 5d2:	55                   	push   %ebp
 5d3:	89 e5                	mov    %esp,%ebp
 5d5:	57                   	push   %edi
 5d6:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 5bb:	55                   	push   %ebp
 5bc:	89 e5                	mov    %esp,%ebp
 5be:	57                   	push   %edi
 5bf:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 5d9:	89 d7                	mov    %edx,%edi
 5db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5de:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e1:	fc                   	cld    
 5e2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5e4:	89 d0                	mov    %edx,%eax
 5e6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 5e9:	c9                   	leave  
 5ea:	c3                   	ret    

000005eb <strchr>:
=======
 5c2:	89 d7                	mov    %edx,%edi
 5c4:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ca:	fc                   	cld    
 5cb:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5cd:	89 d0                	mov    %edx,%eax
 5cf:	8b 7d fc             	mov    -0x4(%ebp),%edi
 5d2:	c9                   	leave  
 5d3:	c3                   	ret    

000005d4 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 5eb:	55                   	push   %ebp
 5ec:	89 e5                	mov    %esp,%ebp
 5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 5f1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5f5:	eb 03                	jmp    5fa <strchr+0xf>
 5f7:	83 c0 01             	add    $0x1,%eax
 5fa:	0f b6 10             	movzbl (%eax),%edx
 5fd:	84 d2                	test   %dl,%dl
 5ff:	74 06                	je     607 <strchr+0x1c>
    if(*s == c)
 601:	38 ca                	cmp    %cl,%dl
 603:	75 f2                	jne    5f7 <strchr+0xc>
 605:	eb 05                	jmp    60c <strchr+0x21>
      return (char*)s;
  return 0;
 607:	b8 00 00 00 00       	mov    $0x0,%eax
}
 60c:	5d                   	pop    %ebp
 60d:	c3                   	ret    

0000060e <gets>:
=======
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	8b 45 08             	mov    0x8(%ebp),%eax
 5da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5de:	eb 03                	jmp    5e3 <strchr+0xf>
 5e0:	83 c0 01             	add    $0x1,%eax
 5e3:	0f b6 10             	movzbl (%eax),%edx
 5e6:	84 d2                	test   %dl,%dl
 5e8:	74 06                	je     5f0 <strchr+0x1c>
    if(*s == c)
 5ea:	38 ca                	cmp    %cl,%dl
 5ec:	75 f2                	jne    5e0 <strchr+0xc>
 5ee:	eb 05                	jmp    5f5 <strchr+0x21>
      return (char*)s;
  return 0;
 5f0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 5f5:	5d                   	pop    %ebp
 5f6:	c3                   	ret    

000005f7 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 60e:	55                   	push   %ebp
 60f:	89 e5                	mov    %esp,%ebp
 611:	57                   	push   %edi
 612:	56                   	push   %esi
 613:	53                   	push   %ebx
 614:	83 ec 1c             	sub    $0x1c,%esp
 617:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 5f7:	55                   	push   %ebp
 5f8:	89 e5                	mov    %esp,%ebp
 5fa:	57                   	push   %edi
 5fb:	56                   	push   %esi
 5fc:	53                   	push   %ebx
 5fd:	83 ec 1c             	sub    $0x1c,%esp
 600:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 61a:	bb 00 00 00 00       	mov    $0x0,%ebx
 61f:	89 de                	mov    %ebx,%esi
 621:	83 c3 01             	add    $0x1,%ebx
 624:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 627:	7d 2e                	jge    657 <gets+0x49>
    cc = read(0, &c, 1);
 629:	83 ec 04             	sub    $0x4,%esp
 62c:	6a 01                	push   $0x1
 62e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 631:	50                   	push   %eax
 632:	6a 00                	push   $0x0
 634:	e8 ec 00 00 00       	call   725 <read>
    if(cc < 1)
 639:	83 c4 10             	add    $0x10,%esp
 63c:	85 c0                	test   %eax,%eax
 63e:	7e 17                	jle    657 <gets+0x49>
      break;
    buf[i++] = c;
 640:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 644:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 647:	3c 0a                	cmp    $0xa,%al
 649:	0f 94 c2             	sete   %dl
 64c:	3c 0d                	cmp    $0xd,%al
 64e:	0f 94 c0             	sete   %al
 651:	08 c2                	or     %al,%dl
 653:	74 ca                	je     61f <gets+0x11>
    buf[i++] = c;
 655:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 657:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 65b:	89 f8                	mov    %edi,%eax
 65d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 660:	5b                   	pop    %ebx
 661:	5e                   	pop    %esi
 662:	5f                   	pop    %edi
 663:	5d                   	pop    %ebp
 664:	c3                   	ret    

00000665 <stat>:
=======
 603:	bb 00 00 00 00       	mov    $0x0,%ebx
 608:	89 de                	mov    %ebx,%esi
 60a:	83 c3 01             	add    $0x1,%ebx
 60d:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 610:	7d 2e                	jge    640 <gets+0x49>
    cc = read(0, &c, 1);
 612:	83 ec 04             	sub    $0x4,%esp
 615:	6a 01                	push   $0x1
 617:	8d 45 e7             	lea    -0x19(%ebp),%eax
 61a:	50                   	push   %eax
 61b:	6a 00                	push   $0x0
 61d:	e8 ec 00 00 00       	call   70e <read>
    if(cc < 1)
 622:	83 c4 10             	add    $0x10,%esp
 625:	85 c0                	test   %eax,%eax
 627:	7e 17                	jle    640 <gets+0x49>
      break;
    buf[i++] = c;
 629:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 62d:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 630:	3c 0a                	cmp    $0xa,%al
 632:	0f 94 c2             	sete   %dl
 635:	3c 0d                	cmp    $0xd,%al
 637:	0f 94 c0             	sete   %al
 63a:	08 c2                	or     %al,%dl
 63c:	74 ca                	je     608 <gets+0x11>
    buf[i++] = c;
 63e:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 640:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 644:	89 f8                	mov    %edi,%eax
 646:	8d 65 f4             	lea    -0xc(%ebp),%esp
 649:	5b                   	pop    %ebx
 64a:	5e                   	pop    %esi
 64b:	5f                   	pop    %edi
 64c:	5d                   	pop    %ebp
 64d:	c3                   	ret    

0000064e <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 665:	55                   	push   %ebp
 666:	89 e5                	mov    %esp,%ebp
 668:	56                   	push   %esi
 669:	53                   	push   %ebx
=======
 64e:	55                   	push   %ebp
 64f:	89 e5                	mov    %esp,%ebp
 651:	56                   	push   %esi
 652:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 66a:	83 ec 08             	sub    $0x8,%esp
 66d:	6a 00                	push   $0x0
 66f:	ff 75 08             	push   0x8(%ebp)
 672:	e8 d6 00 00 00       	call   74d <open>
  if(fd < 0)
 677:	83 c4 10             	add    $0x10,%esp
 67a:	85 c0                	test   %eax,%eax
 67c:	78 24                	js     6a2 <stat+0x3d>
 67e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 680:	83 ec 08             	sub    $0x8,%esp
 683:	ff 75 0c             	push   0xc(%ebp)
 686:	50                   	push   %eax
 687:	e8 d9 00 00 00       	call   765 <fstat>
 68c:	89 c6                	mov    %eax,%esi
  close(fd);
 68e:	89 1c 24             	mov    %ebx,(%esp)
 691:	e8 9f 00 00 00       	call   735 <close>
  return r;
 696:	83 c4 10             	add    $0x10,%esp
}
 699:	89 f0                	mov    %esi,%eax
 69b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 69e:	5b                   	pop    %ebx
 69f:	5e                   	pop    %esi
 6a0:	5d                   	pop    %ebp
 6a1:	c3                   	ret    
    return -1;
 6a2:	be ff ff ff ff       	mov    $0xffffffff,%esi
 6a7:	eb f0                	jmp    699 <stat+0x34>

000006a9 <atoi>:
=======
 653:	83 ec 08             	sub    $0x8,%esp
 656:	6a 00                	push   $0x0
 658:	ff 75 08             	push   0x8(%ebp)
 65b:	e8 d6 00 00 00       	call   736 <open>
  if(fd < 0)
 660:	83 c4 10             	add    $0x10,%esp
 663:	85 c0                	test   %eax,%eax
 665:	78 24                	js     68b <stat+0x3d>
 667:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 669:	83 ec 08             	sub    $0x8,%esp
 66c:	ff 75 0c             	push   0xc(%ebp)
 66f:	50                   	push   %eax
 670:	e8 d9 00 00 00       	call   74e <fstat>
 675:	89 c6                	mov    %eax,%esi
  close(fd);
 677:	89 1c 24             	mov    %ebx,(%esp)
 67a:	e8 9f 00 00 00       	call   71e <close>
  return r;
 67f:	83 c4 10             	add    $0x10,%esp
}
 682:	89 f0                	mov    %esi,%eax
 684:	8d 65 f8             	lea    -0x8(%ebp),%esp
 687:	5b                   	pop    %ebx
 688:	5e                   	pop    %esi
 689:	5d                   	pop    %ebp
 68a:	c3                   	ret    
    return -1;
 68b:	be ff ff ff ff       	mov    $0xffffffff,%esi
 690:	eb f0                	jmp    682 <stat+0x34>

00000692 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 6a9:	55                   	push   %ebp
 6aa:	89 e5                	mov    %esp,%ebp
 6ac:	53                   	push   %ebx
 6ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 6b0:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 6b5:	eb 10                	jmp    6c7 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 6b7:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 6ba:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 6bd:	83 c1 01             	add    $0x1,%ecx
 6c0:	0f be c0             	movsbl %al,%eax
 6c3:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 6c7:	0f b6 01             	movzbl (%ecx),%eax
 6ca:	8d 58 d0             	lea    -0x30(%eax),%ebx
 6cd:	80 fb 09             	cmp    $0x9,%bl
 6d0:	76 e5                	jbe    6b7 <atoi+0xe>
  return n;
}
 6d2:	89 d0                	mov    %edx,%eax
 6d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d7:	c9                   	leave  
 6d8:	c3                   	ret    

000006d9 <memmove>:
=======
 692:	55                   	push   %ebp
 693:	89 e5                	mov    %esp,%ebp
 695:	53                   	push   %ebx
 696:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 699:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 69e:	eb 10                	jmp    6b0 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 6a0:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 6a3:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 6a6:	83 c1 01             	add    $0x1,%ecx
 6a9:	0f be c0             	movsbl %al,%eax
 6ac:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 6b0:	0f b6 01             	movzbl (%ecx),%eax
 6b3:	8d 58 d0             	lea    -0x30(%eax),%ebx
 6b6:	80 fb 09             	cmp    $0x9,%bl
 6b9:	76 e5                	jbe    6a0 <atoi+0xe>
  return n;
}
 6bb:	89 d0                	mov    %edx,%eax
 6bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6c0:	c9                   	leave  
 6c1:	c3                   	ret    

000006c2 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 6d9:	55                   	push   %ebp
 6da:	89 e5                	mov    %esp,%ebp
 6dc:	56                   	push   %esi
 6dd:	53                   	push   %ebx
 6de:	8b 75 08             	mov    0x8(%ebp),%esi
 6e1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 6e4:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 6c2:	55                   	push   %ebp
 6c3:	89 e5                	mov    %esp,%ebp
 6c5:	56                   	push   %esi
 6c6:	53                   	push   %ebx
 6c7:	8b 75 08             	mov    0x8(%ebp),%esi
 6ca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 6cd:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 6e7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 6e9:	eb 0d                	jmp    6f8 <memmove+0x1f>
    *dst++ = *src++;
 6eb:	0f b6 01             	movzbl (%ecx),%eax
 6ee:	88 02                	mov    %al,(%edx)
 6f0:	8d 49 01             	lea    0x1(%ecx),%ecx
 6f3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 6f6:	89 d8                	mov    %ebx,%eax
 6f8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 6fb:	85 c0                	test   %eax,%eax
 6fd:	7f ec                	jg     6eb <memmove+0x12>
  return vdst;
}
 6ff:	89 f0                	mov    %esi,%eax
 701:	5b                   	pop    %ebx
 702:	5e                   	pop    %esi
 703:	5d                   	pop    %ebp
 704:	c3                   	ret    

00000705 <fork>:
=======
 6d0:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 6d2:	eb 0d                	jmp    6e1 <memmove+0x1f>
    *dst++ = *src++;
 6d4:	0f b6 01             	movzbl (%ecx),%eax
 6d7:	88 02                	mov    %al,(%edx)
 6d9:	8d 49 01             	lea    0x1(%ecx),%ecx
 6dc:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 6df:	89 d8                	mov    %ebx,%eax
 6e1:	8d 58 ff             	lea    -0x1(%eax),%ebx
 6e4:	85 c0                	test   %eax,%eax
 6e6:	7f ec                	jg     6d4 <memmove+0x12>
  return vdst;
}
 6e8:	89 f0                	mov    %esi,%eax
 6ea:	5b                   	pop    %ebx
 6eb:	5e                   	pop    %esi
 6ec:	5d                   	pop    %ebp
 6ed:	c3                   	ret    

000006ee <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 705:	b8 01 00 00 00       	mov    $0x1,%eax
 70a:	cd 40                	int    $0x40
 70c:	c3                   	ret    

0000070d <exit>:
SYSCALL(exit)
 70d:	b8 02 00 00 00       	mov    $0x2,%eax
 712:	cd 40                	int    $0x40
 714:	c3                   	ret    

00000715 <wait>:
SYSCALL(wait)
 715:	b8 03 00 00 00       	mov    $0x3,%eax
 71a:	cd 40                	int    $0x40
 71c:	c3                   	ret    

0000071d <pipe>:
SYSCALL(pipe)
 71d:	b8 04 00 00 00       	mov    $0x4,%eax
 722:	cd 40                	int    $0x40
 724:	c3                   	ret    

00000725 <read>:
SYSCALL(read)
 725:	b8 05 00 00 00       	mov    $0x5,%eax
 72a:	cd 40                	int    $0x40
 72c:	c3                   	ret    

0000072d <write>:
SYSCALL(write)
 72d:	b8 10 00 00 00       	mov    $0x10,%eax
 732:	cd 40                	int    $0x40
 734:	c3                   	ret    

00000735 <close>:
SYSCALL(close)
 735:	b8 15 00 00 00       	mov    $0x15,%eax
 73a:	cd 40                	int    $0x40
 73c:	c3                   	ret    

0000073d <kill>:
SYSCALL(kill)
 73d:	b8 06 00 00 00       	mov    $0x6,%eax
 742:	cd 40                	int    $0x40
 744:	c3                   	ret    

00000745 <exec>:
SYSCALL(exec)
 745:	b8 07 00 00 00       	mov    $0x7,%eax
 74a:	cd 40                	int    $0x40
 74c:	c3                   	ret    

0000074d <open>:
SYSCALL(open)
 74d:	b8 0f 00 00 00       	mov    $0xf,%eax
 752:	cd 40                	int    $0x40
 754:	c3                   	ret    

00000755 <mknod>:
SYSCALL(mknod)
 755:	b8 11 00 00 00       	mov    $0x11,%eax
 75a:	cd 40                	int    $0x40
 75c:	c3                   	ret    

0000075d <unlink>:
SYSCALL(unlink)
 75d:	b8 12 00 00 00       	mov    $0x12,%eax
 762:	cd 40                	int    $0x40
 764:	c3                   	ret    

00000765 <fstat>:
SYSCALL(fstat)
 765:	b8 08 00 00 00       	mov    $0x8,%eax
 76a:	cd 40                	int    $0x40
 76c:	c3                   	ret    

0000076d <link>:
SYSCALL(link)
 76d:	b8 13 00 00 00       	mov    $0x13,%eax
 772:	cd 40                	int    $0x40
 774:	c3                   	ret    

00000775 <mkdir>:
SYSCALL(mkdir)
 775:	b8 14 00 00 00       	mov    $0x14,%eax
 77a:	cd 40                	int    $0x40
 77c:	c3                   	ret    

0000077d <chdir>:
SYSCALL(chdir)
 77d:	b8 09 00 00 00       	mov    $0x9,%eax
 782:	cd 40                	int    $0x40
 784:	c3                   	ret    

00000785 <dup>:
SYSCALL(dup)
 785:	b8 0a 00 00 00       	mov    $0xa,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <getpid>:
SYSCALL(getpid)
 78d:	b8 0b 00 00 00       	mov    $0xb,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <sbrk>:
SYSCALL(sbrk)
 795:	b8 0c 00 00 00       	mov    $0xc,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <sleep>:
SYSCALL(sleep)
 79d:	b8 0d 00 00 00       	mov    $0xd,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <uptime>:
SYSCALL(uptime)
 7a5:	b8 0e 00 00 00       	mov    $0xe,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <clone>:
SYSCALL(clone)
 7ad:	b8 16 00 00 00       	mov    $0x16,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <join>:
 7b5:	b8 17 00 00 00       	mov    $0x17,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <putc>:
=======
 6ee:	b8 01 00 00 00       	mov    $0x1,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <exit>:
SYSCALL(exit)
 6f6:	b8 02 00 00 00       	mov    $0x2,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <wait>:
SYSCALL(wait)
 6fe:	b8 03 00 00 00       	mov    $0x3,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <pipe>:
SYSCALL(pipe)
 706:	b8 04 00 00 00       	mov    $0x4,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret    

0000070e <read>:
SYSCALL(read)
 70e:	b8 05 00 00 00       	mov    $0x5,%eax
 713:	cd 40                	int    $0x40
 715:	c3                   	ret    

00000716 <write>:
SYSCALL(write)
 716:	b8 10 00 00 00       	mov    $0x10,%eax
 71b:	cd 40                	int    $0x40
 71d:	c3                   	ret    

0000071e <close>:
SYSCALL(close)
 71e:	b8 15 00 00 00       	mov    $0x15,%eax
 723:	cd 40                	int    $0x40
 725:	c3                   	ret    

00000726 <kill>:
SYSCALL(kill)
 726:	b8 06 00 00 00       	mov    $0x6,%eax
 72b:	cd 40                	int    $0x40
 72d:	c3                   	ret    

0000072e <exec>:
SYSCALL(exec)
 72e:	b8 07 00 00 00       	mov    $0x7,%eax
 733:	cd 40                	int    $0x40
 735:	c3                   	ret    

00000736 <open>:
SYSCALL(open)
 736:	b8 0f 00 00 00       	mov    $0xf,%eax
 73b:	cd 40                	int    $0x40
 73d:	c3                   	ret    

0000073e <mknod>:
SYSCALL(mknod)
 73e:	b8 11 00 00 00       	mov    $0x11,%eax
 743:	cd 40                	int    $0x40
 745:	c3                   	ret    

00000746 <unlink>:
SYSCALL(unlink)
 746:	b8 12 00 00 00       	mov    $0x12,%eax
 74b:	cd 40                	int    $0x40
 74d:	c3                   	ret    

0000074e <fstat>:
SYSCALL(fstat)
 74e:	b8 08 00 00 00       	mov    $0x8,%eax
 753:	cd 40                	int    $0x40
 755:	c3                   	ret    

00000756 <link>:
SYSCALL(link)
 756:	b8 13 00 00 00       	mov    $0x13,%eax
 75b:	cd 40                	int    $0x40
 75d:	c3                   	ret    

0000075e <mkdir>:
SYSCALL(mkdir)
 75e:	b8 14 00 00 00       	mov    $0x14,%eax
 763:	cd 40                	int    $0x40
 765:	c3                   	ret    

00000766 <chdir>:
SYSCALL(chdir)
 766:	b8 09 00 00 00       	mov    $0x9,%eax
 76b:	cd 40                	int    $0x40
 76d:	c3                   	ret    

0000076e <dup>:
SYSCALL(dup)
 76e:	b8 0a 00 00 00       	mov    $0xa,%eax
 773:	cd 40                	int    $0x40
 775:	c3                   	ret    

00000776 <getpid>:
SYSCALL(getpid)
 776:	b8 0b 00 00 00       	mov    $0xb,%eax
 77b:	cd 40                	int    $0x40
 77d:	c3                   	ret    

0000077e <sbrk>:
SYSCALL(sbrk)
 77e:	b8 0c 00 00 00       	mov    $0xc,%eax
 783:	cd 40                	int    $0x40
 785:	c3                   	ret    

00000786 <sleep>:
SYSCALL(sleep)
 786:	b8 0d 00 00 00       	mov    $0xd,%eax
 78b:	cd 40                	int    $0x40
 78d:	c3                   	ret    

0000078e <uptime>:
SYSCALL(uptime)
 78e:	b8 0e 00 00 00       	mov    $0xe,%eax
 793:	cd 40                	int    $0x40
 795:	c3                   	ret    

00000796 <clone>:
SYSCALL(clone)
 796:	b8 16 00 00 00       	mov    $0x16,%eax
 79b:	cd 40                	int    $0x40
 79d:	c3                   	ret    

0000079e <join>:
 79e:	b8 17 00 00 00       	mov    $0x17,%eax
 7a3:	cd 40                	int    $0x40
 7a5:	c3                   	ret    

000007a6 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 7bd:	55                   	push   %ebp
 7be:	89 e5                	mov    %esp,%ebp
 7c0:	83 ec 1c             	sub    $0x1c,%esp
 7c3:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 7c6:	6a 01                	push   $0x1
 7c8:	8d 55 f4             	lea    -0xc(%ebp),%edx
 7cb:	52                   	push   %edx
 7cc:	50                   	push   %eax
 7cd:	e8 5b ff ff ff       	call   72d <write>
}
 7d2:	83 c4 10             	add    $0x10,%esp
 7d5:	c9                   	leave  
 7d6:	c3                   	ret    

000007d7 <printint>:
=======
 7a6:	55                   	push   %ebp
 7a7:	89 e5                	mov    %esp,%ebp
 7a9:	83 ec 1c             	sub    $0x1c,%esp
 7ac:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 7af:	6a 01                	push   $0x1
 7b1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 7b4:	52                   	push   %edx
 7b5:	50                   	push   %eax
 7b6:	e8 5b ff ff ff       	call   716 <write>
}
 7bb:	83 c4 10             	add    $0x10,%esp
 7be:	c9                   	leave  
 7bf:	c3                   	ret    

000007c0 <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 7d7:	55                   	push   %ebp
 7d8:	89 e5                	mov    %esp,%ebp
 7da:	57                   	push   %edi
 7db:	56                   	push   %esi
 7dc:	53                   	push   %ebx
 7dd:	83 ec 2c             	sub    $0x2c,%esp
 7e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7e3:	89 d0                	mov    %edx,%eax
 7e5:	89 ce                	mov    %ecx,%esi
=======
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 2c             	sub    $0x2c,%esp
 7c9:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7cc:	89 d0                	mov    %edx,%eax
 7ce:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 7e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7eb:	0f 95 c1             	setne  %cl
 7ee:	c1 ea 1f             	shr    $0x1f,%edx
 7f1:	84 d1                	test   %dl,%cl
 7f3:	74 44                	je     839 <printint+0x62>
    neg = 1;
    x = -xx;
 7f5:	f7 d8                	neg    %eax
 7f7:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7f9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 7d0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7d4:	0f 95 c1             	setne  %cl
 7d7:	c1 ea 1f             	shr    $0x1f,%edx
 7da:	84 d1                	test   %dl,%cl
 7dc:	74 44                	je     822 <printint+0x62>
    neg = 1;
    x = -xx;
 7de:	f7 d8                	neg    %eax
 7e0:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7e2:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 800:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 805:	89 c8                	mov    %ecx,%eax
 807:	ba 00 00 00 00       	mov    $0x0,%edx
 80c:	f7 f6                	div    %esi
 80e:	89 df                	mov    %ebx,%edi
 810:	83 c3 01             	add    $0x1,%ebx
 813:	0f b6 92 08 0c 00 00 	movzbl 0xc08(%edx),%edx
 81a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 81e:	89 ca                	mov    %ecx,%edx
 820:	89 c1                	mov    %eax,%ecx
 822:	39 d6                	cmp    %edx,%esi
 824:	76 df                	jbe    805 <printint+0x2e>
  if(neg)
 826:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 82a:	74 31                	je     85d <printint+0x86>
    buf[i++] = '-';
 82c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 831:	8d 5f 02             	lea    0x2(%edi),%ebx
 834:	8b 75 d0             	mov    -0x30(%ebp),%esi
 837:	eb 17                	jmp    850 <printint+0x79>
    x = xx;
 839:	89 c1                	mov    %eax,%ecx
  neg = 0;
 83b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 842:	eb bc                	jmp    800 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 844:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 849:	89 f0                	mov    %esi,%eax
 84b:	e8 6d ff ff ff       	call   7bd <putc>
  while(--i >= 0)
 850:	83 eb 01             	sub    $0x1,%ebx
 853:	79 ef                	jns    844 <printint+0x6d>
}
 855:	83 c4 2c             	add    $0x2c,%esp
 858:	5b                   	pop    %ebx
 859:	5e                   	pop    %esi
 85a:	5f                   	pop    %edi
 85b:	5d                   	pop    %ebp
 85c:	c3                   	ret    
 85d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 860:	eb ee                	jmp    850 <printint+0x79>

00000862 <printf>:
=======
 7e9:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7ee:	89 c8                	mov    %ecx,%eax
 7f0:	ba 00 00 00 00       	mov    $0x0,%edx
 7f5:	f7 f6                	div    %esi
 7f7:	89 df                	mov    %ebx,%edi
 7f9:	83 c3 01             	add    $0x1,%ebx
 7fc:	0f b6 92 f0 0b 00 00 	movzbl 0xbf0(%edx),%edx
 803:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 807:	89 ca                	mov    %ecx,%edx
 809:	89 c1                	mov    %eax,%ecx
 80b:	39 d6                	cmp    %edx,%esi
 80d:	76 df                	jbe    7ee <printint+0x2e>
  if(neg)
 80f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 813:	74 31                	je     846 <printint+0x86>
    buf[i++] = '-';
 815:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 81a:	8d 5f 02             	lea    0x2(%edi),%ebx
 81d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 820:	eb 17                	jmp    839 <printint+0x79>
    x = xx;
 822:	89 c1                	mov    %eax,%ecx
  neg = 0;
 824:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 82b:	eb bc                	jmp    7e9 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 82d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 832:	89 f0                	mov    %esi,%eax
 834:	e8 6d ff ff ff       	call   7a6 <putc>
  while(--i >= 0)
 839:	83 eb 01             	sub    $0x1,%ebx
 83c:	79 ef                	jns    82d <printint+0x6d>
}
 83e:	83 c4 2c             	add    $0x2c,%esp
 841:	5b                   	pop    %ebx
 842:	5e                   	pop    %esi
 843:	5f                   	pop    %edi
 844:	5d                   	pop    %ebp
 845:	c3                   	ret    
 846:	8b 75 d0             	mov    -0x30(%ebp),%esi
 849:	eb ee                	jmp    839 <printint+0x79>

0000084b <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 862:	55                   	push   %ebp
 863:	89 e5                	mov    %esp,%ebp
 865:	57                   	push   %edi
 866:	56                   	push   %esi
 867:	53                   	push   %ebx
 868:	83 ec 1c             	sub    $0x1c,%esp
=======
 84b:	55                   	push   %ebp
 84c:	89 e5                	mov    %esp,%ebp
 84e:	57                   	push   %edi
 84f:	56                   	push   %esi
 850:	53                   	push   %ebx
 851:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 86b:	8d 45 10             	lea    0x10(%ebp),%eax
 86e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 871:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 876:	bb 00 00 00 00       	mov    $0x0,%ebx
 87b:	eb 14                	jmp    891 <printf+0x2f>
=======
 854:	8d 45 10             	lea    0x10(%ebp),%eax
 857:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 85a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 85f:	bb 00 00 00 00       	mov    $0x0,%ebx
 864:	eb 14                	jmp    87a <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 87d:	89 fa                	mov    %edi,%edx
 87f:	8b 45 08             	mov    0x8(%ebp),%eax
 882:	e8 36 ff ff ff       	call   7bd <putc>
 887:	eb 05                	jmp    88e <printf+0x2c>
      }
    } else if(state == '%'){
 889:	83 fe 25             	cmp    $0x25,%esi
 88c:	74 25                	je     8b3 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 88e:	83 c3 01             	add    $0x1,%ebx
 891:	8b 45 0c             	mov    0xc(%ebp),%eax
 894:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 898:	84 c0                	test   %al,%al
 89a:	0f 84 20 01 00 00    	je     9c0 <printf+0x15e>
    c = fmt[i] & 0xff;
 8a0:	0f be f8             	movsbl %al,%edi
 8a3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 8a6:	85 f6                	test   %esi,%esi
 8a8:	75 df                	jne    889 <printf+0x27>
      if(c == '%'){
 8aa:	83 f8 25             	cmp    $0x25,%eax
 8ad:	75 ce                	jne    87d <printf+0x1b>
        state = '%';
 8af:	89 c6                	mov    %eax,%esi
 8b1:	eb db                	jmp    88e <printf+0x2c>
      if(c == 'd'){
 8b3:	83 f8 25             	cmp    $0x25,%eax
 8b6:	0f 84 cf 00 00 00    	je     98b <printf+0x129>
 8bc:	0f 8c dd 00 00 00    	jl     99f <printf+0x13d>
 8c2:	83 f8 78             	cmp    $0x78,%eax
 8c5:	0f 8f d4 00 00 00    	jg     99f <printf+0x13d>
 8cb:	83 f8 63             	cmp    $0x63,%eax
 8ce:	0f 8c cb 00 00 00    	jl     99f <printf+0x13d>
 8d4:	83 e8 63             	sub    $0x63,%eax
 8d7:	83 f8 15             	cmp    $0x15,%eax
 8da:	0f 87 bf 00 00 00    	ja     99f <printf+0x13d>
 8e0:	ff 24 85 b0 0b 00 00 	jmp    *0xbb0(,%eax,4)
        printint(fd, *ap, 10, 1);
 8e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8ea:	8b 17                	mov    (%edi),%edx
 8ec:	83 ec 0c             	sub    $0xc,%esp
 8ef:	6a 01                	push   $0x1
 8f1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8f6:	8b 45 08             	mov    0x8(%ebp),%eax
 8f9:	e8 d9 fe ff ff       	call   7d7 <printint>
        ap++;
 8fe:	83 c7 04             	add    $0x4,%edi
 901:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 904:	83 c4 10             	add    $0x10,%esp
=======
 866:	89 fa                	mov    %edi,%edx
 868:	8b 45 08             	mov    0x8(%ebp),%eax
 86b:	e8 36 ff ff ff       	call   7a6 <putc>
 870:	eb 05                	jmp    877 <printf+0x2c>
      }
    } else if(state == '%'){
 872:	83 fe 25             	cmp    $0x25,%esi
 875:	74 25                	je     89c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 877:	83 c3 01             	add    $0x1,%ebx
 87a:	8b 45 0c             	mov    0xc(%ebp),%eax
 87d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 881:	84 c0                	test   %al,%al
 883:	0f 84 20 01 00 00    	je     9a9 <printf+0x15e>
    c = fmt[i] & 0xff;
 889:	0f be f8             	movsbl %al,%edi
 88c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 88f:	85 f6                	test   %esi,%esi
 891:	75 df                	jne    872 <printf+0x27>
      if(c == '%'){
 893:	83 f8 25             	cmp    $0x25,%eax
 896:	75 ce                	jne    866 <printf+0x1b>
        state = '%';
 898:	89 c6                	mov    %eax,%esi
 89a:	eb db                	jmp    877 <printf+0x2c>
      if(c == 'd'){
 89c:	83 f8 25             	cmp    $0x25,%eax
 89f:	0f 84 cf 00 00 00    	je     974 <printf+0x129>
 8a5:	0f 8c dd 00 00 00    	jl     988 <printf+0x13d>
 8ab:	83 f8 78             	cmp    $0x78,%eax
 8ae:	0f 8f d4 00 00 00    	jg     988 <printf+0x13d>
 8b4:	83 f8 63             	cmp    $0x63,%eax
 8b7:	0f 8c cb 00 00 00    	jl     988 <printf+0x13d>
 8bd:	83 e8 63             	sub    $0x63,%eax
 8c0:	83 f8 15             	cmp    $0x15,%eax
 8c3:	0f 87 bf 00 00 00    	ja     988 <printf+0x13d>
 8c9:	ff 24 85 98 0b 00 00 	jmp    *0xb98(,%eax,4)
        printint(fd, *ap, 10, 1);
 8d0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8d3:	8b 17                	mov    (%edi),%edx
 8d5:	83 ec 0c             	sub    $0xc,%esp
 8d8:	6a 01                	push   $0x1
 8da:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8df:	8b 45 08             	mov    0x8(%ebp),%eax
 8e2:	e8 d9 fe ff ff       	call   7c0 <printint>
        ap++;
 8e7:	83 c7 04             	add    $0x4,%edi
 8ea:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8ed:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 907:	be 00 00 00 00       	mov    $0x0,%esi
 90c:	eb 80                	jmp    88e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 90e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 911:	8b 17                	mov    (%edi),%edx
 913:	83 ec 0c             	sub    $0xc,%esp
 916:	6a 00                	push   $0x0
 918:	b9 10 00 00 00       	mov    $0x10,%ecx
 91d:	8b 45 08             	mov    0x8(%ebp),%eax
 920:	e8 b2 fe ff ff       	call   7d7 <printint>
        ap++;
 925:	83 c7 04             	add    $0x4,%edi
 928:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 92b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 92e:	be 00 00 00 00       	mov    $0x0,%esi
 933:	e9 56 ff ff ff       	jmp    88e <printf+0x2c>
        s = (char*)*ap;
 938:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 93b:	8b 30                	mov    (%eax),%esi
        ap++;
 93d:	83 c0 04             	add    $0x4,%eax
 940:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 943:	85 f6                	test   %esi,%esi
 945:	75 15                	jne    95c <printf+0xfa>
          s = "(null)";
 947:	be a8 0b 00 00       	mov    $0xba8,%esi
 94c:	eb 0e                	jmp    95c <printf+0xfa>
          putc(fd, *s);
 94e:	0f be d2             	movsbl %dl,%edx
 951:	8b 45 08             	mov    0x8(%ebp),%eax
 954:	e8 64 fe ff ff       	call   7bd <putc>
          s++;
 959:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 95c:	0f b6 16             	movzbl (%esi),%edx
 95f:	84 d2                	test   %dl,%dl
 961:	75 eb                	jne    94e <printf+0xec>
      state = 0;
 963:	be 00 00 00 00       	mov    $0x0,%esi
 968:	e9 21 ff ff ff       	jmp    88e <printf+0x2c>
        putc(fd, *ap);
 96d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 970:	0f be 17             	movsbl (%edi),%edx
 973:	8b 45 08             	mov    0x8(%ebp),%eax
 976:	e8 42 fe ff ff       	call   7bd <putc>
        ap++;
 97b:	83 c7 04             	add    $0x4,%edi
 97e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 981:	be 00 00 00 00       	mov    $0x0,%esi
 986:	e9 03 ff ff ff       	jmp    88e <printf+0x2c>
        putc(fd, c);
 98b:	89 fa                	mov    %edi,%edx
 98d:	8b 45 08             	mov    0x8(%ebp),%eax
 990:	e8 28 fe ff ff       	call   7bd <putc>
      state = 0;
 995:	be 00 00 00 00       	mov    $0x0,%esi
 99a:	e9 ef fe ff ff       	jmp    88e <printf+0x2c>
        putc(fd, '%');
 99f:	ba 25 00 00 00       	mov    $0x25,%edx
 9a4:	8b 45 08             	mov    0x8(%ebp),%eax
 9a7:	e8 11 fe ff ff       	call   7bd <putc>
        putc(fd, c);
 9ac:	89 fa                	mov    %edi,%edx
 9ae:	8b 45 08             	mov    0x8(%ebp),%eax
 9b1:	e8 07 fe ff ff       	call   7bd <putc>
      state = 0;
 9b6:	be 00 00 00 00       	mov    $0x0,%esi
 9bb:	e9 ce fe ff ff       	jmp    88e <printf+0x2c>
    }
  }
}
 9c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9c3:	5b                   	pop    %ebx
 9c4:	5e                   	pop    %esi
 9c5:	5f                   	pop    %edi
 9c6:	5d                   	pop    %ebp
 9c7:	c3                   	ret    

000009c8 <free>:
=======
 8f0:	be 00 00 00 00       	mov    $0x0,%esi
 8f5:	eb 80                	jmp    877 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8f7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8fa:	8b 17                	mov    (%edi),%edx
 8fc:	83 ec 0c             	sub    $0xc,%esp
 8ff:	6a 00                	push   $0x0
 901:	b9 10 00 00 00       	mov    $0x10,%ecx
 906:	8b 45 08             	mov    0x8(%ebp),%eax
 909:	e8 b2 fe ff ff       	call   7c0 <printint>
        ap++;
 90e:	83 c7 04             	add    $0x4,%edi
 911:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 914:	83 c4 10             	add    $0x10,%esp
      state = 0;
 917:	be 00 00 00 00       	mov    $0x0,%esi
 91c:	e9 56 ff ff ff       	jmp    877 <printf+0x2c>
        s = (char*)*ap;
 921:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 924:	8b 30                	mov    (%eax),%esi
        ap++;
 926:	83 c0 04             	add    $0x4,%eax
 929:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 92c:	85 f6                	test   %esi,%esi
 92e:	75 15                	jne    945 <printf+0xfa>
          s = "(null)";
 930:	be 90 0b 00 00       	mov    $0xb90,%esi
 935:	eb 0e                	jmp    945 <printf+0xfa>
          putc(fd, *s);
 937:	0f be d2             	movsbl %dl,%edx
 93a:	8b 45 08             	mov    0x8(%ebp),%eax
 93d:	e8 64 fe ff ff       	call   7a6 <putc>
          s++;
 942:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 945:	0f b6 16             	movzbl (%esi),%edx
 948:	84 d2                	test   %dl,%dl
 94a:	75 eb                	jne    937 <printf+0xec>
      state = 0;
 94c:	be 00 00 00 00       	mov    $0x0,%esi
 951:	e9 21 ff ff ff       	jmp    877 <printf+0x2c>
        putc(fd, *ap);
 956:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 959:	0f be 17             	movsbl (%edi),%edx
 95c:	8b 45 08             	mov    0x8(%ebp),%eax
 95f:	e8 42 fe ff ff       	call   7a6 <putc>
        ap++;
 964:	83 c7 04             	add    $0x4,%edi
 967:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 96a:	be 00 00 00 00       	mov    $0x0,%esi
 96f:	e9 03 ff ff ff       	jmp    877 <printf+0x2c>
        putc(fd, c);
 974:	89 fa                	mov    %edi,%edx
 976:	8b 45 08             	mov    0x8(%ebp),%eax
 979:	e8 28 fe ff ff       	call   7a6 <putc>
      state = 0;
 97e:	be 00 00 00 00       	mov    $0x0,%esi
 983:	e9 ef fe ff ff       	jmp    877 <printf+0x2c>
        putc(fd, '%');
 988:	ba 25 00 00 00       	mov    $0x25,%edx
 98d:	8b 45 08             	mov    0x8(%ebp),%eax
 990:	e8 11 fe ff ff       	call   7a6 <putc>
        putc(fd, c);
 995:	89 fa                	mov    %edi,%edx
 997:	8b 45 08             	mov    0x8(%ebp),%eax
 99a:	e8 07 fe ff ff       	call   7a6 <putc>
      state = 0;
 99f:	be 00 00 00 00       	mov    $0x0,%esi
 9a4:	e9 ce fe ff ff       	jmp    877 <printf+0x2c>
    }
  }
}
 9a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9ac:	5b                   	pop    %ebx
 9ad:	5e                   	pop    %esi
 9ae:	5f                   	pop    %edi
 9af:	5d                   	pop    %ebp
 9b0:	c3                   	ret    

000009b1 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 9c8:	55                   	push   %ebp
 9c9:	89 e5                	mov    %esp,%ebp
 9cb:	57                   	push   %edi
 9cc:	56                   	push   %esi
 9cd:	53                   	push   %ebx
 9ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9d1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d4:	a1 e0 10 00 00       	mov    0x10e0,%eax
 9d9:	eb 02                	jmp    9dd <free+0x15>
 9db:	89 d0                	mov    %edx,%eax
 9dd:	39 c8                	cmp    %ecx,%eax
 9df:	73 04                	jae    9e5 <free+0x1d>
 9e1:	39 08                	cmp    %ecx,(%eax)
 9e3:	77 12                	ja     9f7 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e5:	8b 10                	mov    (%eax),%edx
 9e7:	39 c2                	cmp    %eax,%edx
 9e9:	77 f0                	ja     9db <free+0x13>
 9eb:	39 c8                	cmp    %ecx,%eax
 9ed:	72 08                	jb     9f7 <free+0x2f>
 9ef:	39 ca                	cmp    %ecx,%edx
 9f1:	77 04                	ja     9f7 <free+0x2f>
 9f3:	89 d0                	mov    %edx,%eax
 9f5:	eb e6                	jmp    9dd <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9f7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9fa:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9fd:	8b 10                	mov    (%eax),%edx
 9ff:	39 d7                	cmp    %edx,%edi
 a01:	74 19                	je     a1c <free+0x54>
=======
 9b1:	55                   	push   %ebp
 9b2:	89 e5                	mov    %esp,%ebp
 9b4:	57                   	push   %edi
 9b5:	56                   	push   %esi
 9b6:	53                   	push   %ebx
 9b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9ba:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9bd:	a1 c0 12 00 00       	mov    0x12c0,%eax
 9c2:	eb 02                	jmp    9c6 <free+0x15>
 9c4:	89 d0                	mov    %edx,%eax
 9c6:	39 c8                	cmp    %ecx,%eax
 9c8:	73 04                	jae    9ce <free+0x1d>
 9ca:	39 08                	cmp    %ecx,(%eax)
 9cc:	77 12                	ja     9e0 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9ce:	8b 10                	mov    (%eax),%edx
 9d0:	39 c2                	cmp    %eax,%edx
 9d2:	77 f0                	ja     9c4 <free+0x13>
 9d4:	39 c8                	cmp    %ecx,%eax
 9d6:	72 08                	jb     9e0 <free+0x2f>
 9d8:	39 ca                	cmp    %ecx,%edx
 9da:	77 04                	ja     9e0 <free+0x2f>
 9dc:	89 d0                	mov    %edx,%eax
 9de:	eb e6                	jmp    9c6 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9e0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9e3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9e6:	8b 10                	mov    (%eax),%edx
 9e8:	39 d7                	cmp    %edx,%edi
 9ea:	74 19                	je     a05 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 a03:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a06:	8b 50 04             	mov    0x4(%eax),%edx
 a09:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a0c:	39 ce                	cmp    %ecx,%esi
 a0e:	74 1b                	je     a2b <free+0x63>
=======
 9ec:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ef:	8b 50 04             	mov    0x4(%eax),%edx
 9f2:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9f5:	39 ce                	cmp    %ecx,%esi
 9f7:	74 1b                	je     a14 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 a10:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a12:	a3 e0 10 00 00       	mov    %eax,0x10e0
}
 a17:	5b                   	pop    %ebx
 a18:	5e                   	pop    %esi
 a19:	5f                   	pop    %edi
 a1a:	5d                   	pop    %ebp
 a1b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 a1c:	03 72 04             	add    0x4(%edx),%esi
 a1f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a22:	8b 10                	mov    (%eax),%edx
 a24:	8b 12                	mov    (%edx),%edx
 a26:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a29:	eb db                	jmp    a06 <free+0x3e>
    p->s.size += bp->s.size;
 a2b:	03 53 fc             	add    -0x4(%ebx),%edx
 a2e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a31:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a34:	89 10                	mov    %edx,(%eax)
 a36:	eb da                	jmp    a12 <free+0x4a>

00000a38 <morecore>:
=======
 9f9:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9fb:	a3 c0 12 00 00       	mov    %eax,0x12c0
}
 a00:	5b                   	pop    %ebx
 a01:	5e                   	pop    %esi
 a02:	5f                   	pop    %edi
 a03:	5d                   	pop    %ebp
 a04:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 a05:	03 72 04             	add    0x4(%edx),%esi
 a08:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a0b:	8b 10                	mov    (%eax),%edx
 a0d:	8b 12                	mov    (%edx),%edx
 a0f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a12:	eb db                	jmp    9ef <free+0x3e>
    p->s.size += bp->s.size;
 a14:	03 53 fc             	add    -0x4(%ebx),%edx
 a17:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a1a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a1d:	89 10                	mov    %edx,(%eax)
 a1f:	eb da                	jmp    9fb <free+0x4a>

00000a21 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 a38:	55                   	push   %ebp
 a39:	89 e5                	mov    %esp,%ebp
 a3b:	53                   	push   %ebx
 a3c:	83 ec 04             	sub    $0x4,%esp
 a3f:	89 c3                	mov    %eax,%ebx
=======
 a21:	55                   	push   %ebp
 a22:	89 e5                	mov    %esp,%ebp
 a24:	53                   	push   %ebx
 a25:	83 ec 04             	sub    $0x4,%esp
 a28:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 a41:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a46:	77 05                	ja     a4d <morecore+0x15>
    nu = 4096;
 a48:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a4d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a54:	83 ec 0c             	sub    $0xc,%esp
 a57:	50                   	push   %eax
 a58:	e8 38 fd ff ff       	call   795 <sbrk>
  if(p == (char*)-1)
 a5d:	83 c4 10             	add    $0x10,%esp
 a60:	83 f8 ff             	cmp    $0xffffffff,%eax
 a63:	74 1c                	je     a81 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a65:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a68:	83 c0 08             	add    $0x8,%eax
 a6b:	83 ec 0c             	sub    $0xc,%esp
 a6e:	50                   	push   %eax
 a6f:	e8 54 ff ff ff       	call   9c8 <free>
  return freep;
 a74:	a1 e0 10 00 00       	mov    0x10e0,%eax
 a79:	83 c4 10             	add    $0x10,%esp
}
 a7c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a7f:	c9                   	leave  
 a80:	c3                   	ret    
    return 0;
 a81:	b8 00 00 00 00       	mov    $0x0,%eax
 a86:	eb f4                	jmp    a7c <morecore+0x44>

00000a88 <malloc>:
=======
 a2a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a2f:	77 05                	ja     a36 <morecore+0x15>
    nu = 4096;
 a31:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a36:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a3d:	83 ec 0c             	sub    $0xc,%esp
 a40:	50                   	push   %eax
 a41:	e8 38 fd ff ff       	call   77e <sbrk>
  if(p == (char*)-1)
 a46:	83 c4 10             	add    $0x10,%esp
 a49:	83 f8 ff             	cmp    $0xffffffff,%eax
 a4c:	74 1c                	je     a6a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a4e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a51:	83 c0 08             	add    $0x8,%eax
 a54:	83 ec 0c             	sub    $0xc,%esp
 a57:	50                   	push   %eax
 a58:	e8 54 ff ff ff       	call   9b1 <free>
  return freep;
 a5d:	a1 c0 12 00 00       	mov    0x12c0,%eax
 a62:	83 c4 10             	add    $0x10,%esp
}
 a65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a68:	c9                   	leave  
 a69:	c3                   	ret    
    return 0;
 a6a:	b8 00 00 00 00       	mov    $0x0,%eax
 a6f:	eb f4                	jmp    a65 <morecore+0x44>

00000a71 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 a88:	55                   	push   %ebp
 a89:	89 e5                	mov    %esp,%ebp
 a8b:	53                   	push   %ebx
 a8c:	83 ec 04             	sub    $0x4,%esp
=======
 a71:	55                   	push   %ebp
 a72:	89 e5                	mov    %esp,%ebp
 a74:	53                   	push   %ebx
 a75:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 a8f:	8b 45 08             	mov    0x8(%ebp),%eax
 a92:	8d 58 07             	lea    0x7(%eax),%ebx
 a95:	c1 eb 03             	shr    $0x3,%ebx
 a98:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a9b:	8b 0d e0 10 00 00    	mov    0x10e0,%ecx
 aa1:	85 c9                	test   %ecx,%ecx
 aa3:	74 04                	je     aa9 <malloc+0x21>
=======
 a78:	8b 45 08             	mov    0x8(%ebp),%eax
 a7b:	8d 58 07             	lea    0x7(%eax),%ebx
 a7e:	c1 eb 03             	shr    $0x3,%ebx
 a81:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a84:	8b 0d c0 12 00 00    	mov    0x12c0,%ecx
 a8a:	85 c9                	test   %ecx,%ecx
 a8c:	74 04                	je     a92 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 aa5:	8b 01                	mov    (%ecx),%eax
 aa7:	eb 4a                	jmp    af3 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 aa9:	c7 05 e0 10 00 00 e4 	movl   $0x10e4,0x10e0
 ab0:	10 00 00 
 ab3:	c7 05 e4 10 00 00 e4 	movl   $0x10e4,0x10e4
 aba:	10 00 00 
    base.s.size = 0;
 abd:	c7 05 e8 10 00 00 00 	movl   $0x0,0x10e8
 ac4:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 ac7:	b9 e4 10 00 00       	mov    $0x10e4,%ecx
 acc:	eb d7                	jmp    aa5 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ace:	74 19                	je     ae9 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ad0:	29 da                	sub    %ebx,%edx
 ad2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ad5:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 ad8:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 adb:	89 0d e0 10 00 00    	mov    %ecx,0x10e0
      return (void*)(p + 1);
 ae1:	83 c0 08             	add    $0x8,%eax
=======
 a8e:	8b 01                	mov    (%ecx),%eax
 a90:	eb 4a                	jmp    adc <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a92:	c7 05 c0 12 00 00 c4 	movl   $0x12c4,0x12c0
 a99:	12 00 00 
 a9c:	c7 05 c4 12 00 00 c4 	movl   $0x12c4,0x12c4
 aa3:	12 00 00 
    base.s.size = 0;
 aa6:	c7 05 c8 12 00 00 00 	movl   $0x0,0x12c8
 aad:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 ab0:	b9 c4 12 00 00       	mov    $0x12c4,%ecx
 ab5:	eb d7                	jmp    a8e <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ab7:	74 19                	je     ad2 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ab9:	29 da                	sub    %ebx,%edx
 abb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 abe:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 ac1:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 ac4:	89 0d c0 12 00 00    	mov    %ecx,0x12c0
      return (void*)(p + 1);
 aca:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 ae4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ae7:	c9                   	leave  
 ae8:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 ae9:	8b 10                	mov    (%eax),%edx
 aeb:	89 11                	mov    %edx,(%ecx)
 aed:	eb ec                	jmp    adb <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aef:	89 c1                	mov    %eax,%ecx
 af1:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 af3:	8b 50 04             	mov    0x4(%eax),%edx
 af6:	39 da                	cmp    %ebx,%edx
 af8:	73 d4                	jae    ace <malloc+0x46>
    if(p == freep)
 afa:	39 05 e0 10 00 00    	cmp    %eax,0x10e0
 b00:	75 ed                	jne    aef <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 b02:	89 d8                	mov    %ebx,%eax
 b04:	e8 2f ff ff ff       	call   a38 <morecore>
 b09:	85 c0                	test   %eax,%eax
 b0b:	75 e2                	jne    aef <malloc+0x67>
 b0d:	eb d5                	jmp    ae4 <malloc+0x5c>
=======
 acd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ad0:	c9                   	leave  
 ad1:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 ad2:	8b 10                	mov    (%eax),%edx
 ad4:	89 11                	mov    %edx,(%ecx)
 ad6:	eb ec                	jmp    ac4 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad8:	89 c1                	mov    %eax,%ecx
 ada:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 adc:	8b 50 04             	mov    0x4(%eax),%edx
 adf:	39 da                	cmp    %ebx,%edx
 ae1:	73 d4                	jae    ab7 <malloc+0x46>
    if(p == freep)
 ae3:	39 05 c0 12 00 00    	cmp    %eax,0x12c0
 ae9:	75 ed                	jne    ad8 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 aeb:	89 d8                	mov    %ebx,%eax
 aed:	e8 2f ff ff ff       	call   a21 <morecore>
 af2:	85 c0                	test   %eax,%eax
 af4:	75 e2                	jne    ad8 <malloc+0x67>
 af6:	eb d5                	jmp    acd <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
