
_test_20:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:
   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1, void *arg2)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
<<<<<<< HEAD
   6:	68 24 0f 00 00       	push   $0xf24
   b:	e8 71 04 00 00       	call   481 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 ca 06 00 00       	call   6e6 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 28 0f 00 00    	cmp    0xf28,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 60 0a 00 00       	push   $0xa60
  2e:	68 6a 0a 00 00       	push   $0xa6a
  33:	6a 01                	push   $0x1
  35:	e8 79 07 00 00       	call   7b3 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 72 0a 00 00       	push   $0xa72
  42:	68 90 0a 00 00       	push   $0xa90
  47:	6a 01                	push   $0x1
  49:	e8 65 07 00 00       	call   7b3 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 a4 0a 00 00       	push   $0xaa4
  56:	6a 01                	push   $0x1
  58:	e8 56 07 00 00       	call   7b3 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 30 0f 00 00    	push   0xf30
  66:	e8 23 06 00 00       	call   68e <kill>
  6b:	e8 ee 05 00 00       	call   65e <exit>
   global++;
  70:	83 05 2c 0f 00 00 01 	addl   $0x1,0xf2c
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 24 0f 00 00       	push   $0xf24
  7f:	e8 1f 04 00 00       	call   4a3 <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
  8b:	e8 f1 03 00 00       	call   481 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 4a 06 00 00       	call   6e6 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 28 0f 00 00    	cmp    0xf28,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 60 0a 00 00       	push   $0xa60
  ae:	68 6a 0a 00 00       	push   $0xa6a
  b3:	6a 01                	push   $0x1
  b5:	e8 f9 06 00 00       	call   7b3 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 72 0a 00 00       	push   $0xa72
  c2:	68 90 0a 00 00       	push   $0xa90
  c7:	6a 01                	push   $0x1
  c9:	e8 e5 06 00 00       	call   7b3 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 a4 0a 00 00       	push   $0xaa4
  d6:	6a 01                	push   $0x1
  d8:	e8 d6 06 00 00       	call   7b3 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 30 0f 00 00    	push   0xf30
  e6:	e8 a3 05 00 00       	call   68e <kill>
  eb:	e8 6e 05 00 00       	call   65e <exit>
   global++;
  f0:	83 05 2c 0f 00 00 01 	addl   $0x1,0xf2c
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 20 0f 00 00       	push   $0xf20
  ff:	e8 9f 03 00 00       	call   4a3 <lock_release>

   
   exit();
 104:	e8 55 05 00 00       	call   65e <exit>
=======
   6:	68 04 0f 00 00       	push   $0xf04
   b:	e8 5a 04 00 00       	call   46a <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 b3 06 00 00       	call   6cf <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 08 0f 00 00    	cmp    0xf08,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 4c 0a 00 00       	push   $0xa4c
  2e:	68 56 0a 00 00       	push   $0xa56
  33:	6a 01                	push   $0x1
  35:	e8 62 07 00 00       	call   79c <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 5e 0a 00 00       	push   $0xa5e
  42:	68 7c 0a 00 00       	push   $0xa7c
  47:	6a 01                	push   $0x1
  49:	e8 4e 07 00 00       	call   79c <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 90 0a 00 00       	push   $0xa90
  56:	6a 01                	push   $0x1
  58:	e8 3f 07 00 00       	call   79c <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 10 0f 00 00    	push   0xf10
  66:	e8 0c 06 00 00       	call   677 <kill>
  6b:	e8 d7 05 00 00       	call   647 <exit>
   global++;
  70:	83 05 0c 0f 00 00 01 	addl   $0x1,0xf0c
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 04 0f 00 00       	push   $0xf04
  7f:	e8 08 04 00 00       	call   48c <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 00 0f 00 00 	movl   $0xf00,(%esp)
  8b:	e8 da 03 00 00       	call   46a <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 33 06 00 00       	call   6cf <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 08 0f 00 00    	cmp    0xf08,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 4c 0a 00 00       	push   $0xa4c
  ae:	68 56 0a 00 00       	push   $0xa56
  b3:	6a 01                	push   $0x1
  b5:	e8 e2 06 00 00       	call   79c <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 5e 0a 00 00       	push   $0xa5e
  c2:	68 7c 0a 00 00       	push   $0xa7c
  c7:	6a 01                	push   $0x1
  c9:	e8 ce 06 00 00       	call   79c <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 90 0a 00 00       	push   $0xa90
  d6:	6a 01                	push   $0x1
  d8:	e8 bf 06 00 00       	call   79c <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 10 0f 00 00    	push   0xf10
  e6:	e8 8c 05 00 00       	call   677 <kill>
  eb:	e8 57 05 00 00       	call   647 <exit>
   global++;
  f0:	83 05 0c 0f 00 00 01 	addl   $0x1,0xf0c
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 00 0f 00 00       	push   $0xf00
  ff:	e8 88 03 00 00       	call   48c <lock_release>

   
   exit();
 104:	e8 3e 05 00 00       	call   647 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
<<<<<<< HEAD
 10f:	68 24 0f 00 00       	push   $0xf24
 114:	e8 98 03 00 00       	call   4b1 <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
 120:	e8 8c 03 00 00       	call   4b1 <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 12c:	e8 50 03 00 00       	call   481 <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
 138:	e8 44 03 00 00       	call   481 <lock_acquire>
=======
 10f:	68 04 0f 00 00       	push   $0xf04
 114:	e8 81 03 00 00       	call   49a <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 00 0f 00 00 	movl   $0xf00,(%esp)
 120:	e8 75 03 00 00       	call   49a <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 04 0f 00 00 	movl   $0xf04,(%esp)
 12c:	e8 39 03 00 00       	call   46a <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 00 0f 00 00 	movl   $0xf00,(%esp)
 138:	e8 2d 03 00 00       	call   46a <lock_acquire>
>>>>>>> c59b0f9 (fixed thread_join and join)

   int nested_thread_id = thread_create(worker2, 0, 0);
 13d:	83 c4 0c             	add    $0xc,%esp
 140:	6a 00                	push   $0x0
 142:	6a 00                	push   $0x0
 144:	68 00 00 00 00       	push   $0x0
 149:	e8 82 02 00 00       	call   3d0 <thread_create>
    assert(nested_thread_id > 0);
 14e:	83 c4 10             	add    $0x10,%esp
 151:	85 c0                	test   %eax,%eax
 153:	7e 14                	jle    169 <worker+0x60>
   size = (unsigned int)sbrk(0);
 155:	83 ec 0c             	sub    $0xc,%esp
 158:	6a 00                	push   $0x0
<<<<<<< HEAD
 15a:	e8 87 05 00 00       	call   6e6 <sbrk>
 15f:	a3 28 0f 00 00       	mov    %eax,0xf28
=======
 15a:	e8 70 05 00 00       	call   6cf <sbrk>
 15f:	a3 08 0f 00 00       	mov    %eax,0xf08
>>>>>>> c59b0f9 (fixed thread_join and join)

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
<<<<<<< HEAD
 16b:	68 60 0a 00 00       	push   $0xa60
 170:	68 6a 0a 00 00       	push   $0xa6a
 175:	6a 01                	push   $0x1
 177:	e8 37 06 00 00       	call   7b3 <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 b1 0a 00 00       	push   $0xab1
 184:	68 90 0a 00 00       	push   $0xa90
 189:	6a 01                	push   $0x1
 18b:	e8 23 06 00 00       	call   7b3 <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 a4 0a 00 00       	push   $0xaa4
 198:	6a 01                	push   $0x1
 19a:	e8 14 06 00 00       	call   7b3 <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 30 0f 00 00    	push   0xf30
 1a8:	e8 e1 04 00 00       	call   68e <kill>
 1ad:	e8 ac 04 00 00       	call   65e <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 24 0f 00 00       	push   $0xf24
 1ba:	e8 e4 02 00 00       	call   4a3 <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 23 05 00 00       	call   6ee <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 1d2:	e8 aa 02 00 00       	call   481 <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 04 0f 00 00       	mov    0xf04,%eax
 1df:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
=======
 16b:	68 4c 0a 00 00       	push   $0xa4c
 170:	68 56 0a 00 00       	push   $0xa56
 175:	6a 01                	push   $0x1
 177:	e8 20 06 00 00       	call   79c <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 9d 0a 00 00       	push   $0xa9d
 184:	68 7c 0a 00 00       	push   $0xa7c
 189:	6a 01                	push   $0x1
 18b:	e8 0c 06 00 00       	call   79c <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 90 0a 00 00       	push   $0xa90
 198:	6a 01                	push   $0x1
 19a:	e8 fd 05 00 00       	call   79c <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 10 0f 00 00    	push   0xf10
 1a8:	e8 ca 04 00 00       	call   677 <kill>
 1ad:	e8 95 04 00 00       	call   647 <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 04 0f 00 00       	push   $0xf04
 1ba:	e8 cd 02 00 00       	call   48c <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 0c 05 00 00       	call   6d7 <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 04 0f 00 00 	movl   $0xf04,(%esp)
 1d2:	e8 93 02 00 00       	call   46a <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 ec 0e 00 00       	mov    0xeec,%eax
 1df:	39 05 0c 0f 00 00    	cmp    %eax,0xf0c
>>>>>>> c59b0f9 (fixed thread_join and join)
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
<<<<<<< HEAD
 1e7:	c7 05 2c 0f 00 00 00 	movl   $0x0,0xf2c
=======
 1e7:	c7 05 0c 0f 00 00 00 	movl   $0x0,0xf0c
>>>>>>> c59b0f9 (fixed thread_join and join)
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
<<<<<<< HEAD
 1f9:	e8 e8 04 00 00       	call   6e6 <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 dc 04 00 00       	call   6e6 <sbrk>
 20a:	a3 28 0f 00 00       	mov    %eax,0xf28
   lock_release(&lock);
 20f:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 216:	e8 88 02 00 00       	call   4a3 <lock_release>
=======
 1f9:	e8 d1 04 00 00       	call   6cf <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 c5 04 00 00       	call   6cf <sbrk>
 20a:	a3 08 0f 00 00       	mov    %eax,0xf08
   lock_release(&lock);
 20f:	c7 04 24 04 0f 00 00 	movl   $0xf04,(%esp)
 216:	e8 71 02 00 00       	call   48c <lock_release>
>>>>>>> c59b0f9 (fixed thread_join and join)

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
 223:	68 20 0f 00 00       	push   $0xf20
 228:	e8 76 02 00 00       	call   4a3 <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 b5 04 00 00       	call   6ee <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
 240:	e8 3c 02 00 00       	call   481 <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 04 0f 00 00       	mov    0xf04,%eax
 24d:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
=======
 223:	68 00 0f 00 00       	push   $0xf00
 228:	e8 5f 02 00 00       	call   48c <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 9e 04 00 00       	call   6d7 <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 00 0f 00 00 	movl   $0xf00,(%esp)
 240:	e8 25 02 00 00       	call   46a <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 ec 0e 00 00       	mov    0xeec,%eax
 24d:	39 05 0c 0f 00 00    	cmp    %eax,0xf0c
>>>>>>> c59b0f9 (fixed thread_join and join)
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
 258:	68 20 0f 00 00       	push   $0xf20
 25d:	e8 41 02 00 00       	call   4a3 <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 c9 01 00 00       	call   430 <thread_join>
=======
 258:	68 00 0f 00 00       	push   $0xf00
 25d:	e8 2a 02 00 00       	call   48c <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 df 01 00 00       	call   446 <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
<<<<<<< HEAD
 26e:	e8 eb 03 00 00       	call   65e <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 60 0a 00 00       	push   $0xa60
 27a:	68 6a 0a 00 00       	push   $0xa6a
 27f:	6a 01                	push   $0x1
 281:	e8 2d 05 00 00       	call   7b3 <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 c6 0a 00 00       	push   $0xac6
 28e:	68 90 0a 00 00       	push   $0xa90
 293:	6a 01                	push   $0x1
 295:	e8 19 05 00 00       	call   7b3 <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 a4 0a 00 00       	push   $0xaa4
 2a2:	6a 01                	push   $0x1
 2a4:	e8 0a 05 00 00       	call   7b3 <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 30 0f 00 00    	push   0xf30
 2b2:	e8 d7 03 00 00       	call   68e <kill>
 2b7:	e8 a2 03 00 00       	call   65e <exit>
=======
 26e:	e8 d4 03 00 00       	call   647 <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 4c 0a 00 00       	push   $0xa4c
 27a:	68 56 0a 00 00       	push   $0xa56
 27f:	6a 01                	push   $0x1
 281:	e8 16 05 00 00       	call   79c <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 b2 0a 00 00       	push   $0xab2
 28e:	68 7c 0a 00 00       	push   $0xa7c
 293:	6a 01                	push   $0x1
 295:	e8 02 05 00 00       	call   79c <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 90 0a 00 00       	push   $0xa90
 2a2:	6a 01                	push   $0x1
 2a4:	e8 f3 04 00 00       	call   79c <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 10 0f 00 00    	push   0xf10
 2b2:	e8 c0 03 00 00       	call   677 <kill>
 2b7:	e8 8b 03 00 00       	call   647 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000002bc <main>:
{
 2bc:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2c0:	83 e4 f0             	and    $0xfffffff0,%esp
 2c3:	ff 71 fc             	push   -0x4(%ecx)
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	51                   	push   %ecx
 2ca:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
<<<<<<< HEAD
 2cd:	e8 0c 04 00 00       	call   6de <getpid>
 2d2:	a3 30 0f 00 00       	mov    %eax,0xf30
=======
 2cd:	e8 f5 03 00 00       	call   6c7 <getpid>
 2d2:	a3 10 0f 00 00       	mov    %eax,0xf10
>>>>>>> c59b0f9 (fixed thread_join and join)
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
<<<<<<< HEAD
 2ea:	e8 f7 03 00 00       	call   6e6 <sbrk>
 2ef:	a3 28 0f 00 00       	mov    %eax,0xf28
=======
 2ea:	e8 e0 03 00 00       	call   6cf <sbrk>
 2ef:	a3 08 0f 00 00       	mov    %eax,0xf08
>>>>>>> c59b0f9 (fixed thread_join and join)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2f4:	83 c4 0c             	add    $0xc,%esp
 2f7:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2fa:	50                   	push   %eax
 2fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fe:	50                   	push   %eax
 2ff:	68 09 01 00 00       	push   $0x109
 304:	e8 c7 00 00 00       	call   3d0 <thread_create>
   assert(thread_pid > 0);
 309:	83 c4 10             	add    $0x10,%esp
 30c:	85 c0                	test   %eax,%eax
 30e:	7e 1d                	jle    32d <main+0x71>
   int join_pid = thread_join();
<<<<<<< HEAD
 310:	e8 1b 01 00 00       	call   430 <thread_join>
=======
 310:	e8 31 01 00 00       	call   446 <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
 31c:	68 e9 0a 00 00       	push   $0xae9
 321:	6a 01                	push   $0x1
 323:	e8 8b 04 00 00       	call   7b3 <printf>
   exit();
 328:	e8 31 03 00 00       	call   65e <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 60 0a 00 00       	push   $0xa60
 334:	68 6a 0a 00 00       	push   $0xa6a
 339:	6a 01                	push   $0x1
 33b:	e8 73 04 00 00       	call   7b3 <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 da 0a 00 00       	push   $0xada
 348:	68 90 0a 00 00       	push   $0xa90
 34d:	6a 01                	push   $0x1
 34f:	e8 5f 04 00 00       	call   7b3 <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 a4 0a 00 00       	push   $0xaa4
 35c:	6a 01                	push   $0x1
 35e:	e8 50 04 00 00       	call   7b3 <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 30 0f 00 00    	push   0xf30
 36c:	e8 1d 03 00 00       	call   68e <kill>
 371:	e8 e8 02 00 00       	call   65e <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 60 0a 00 00       	push   $0xa60
 37d:	68 6a 0a 00 00       	push   $0xa6a
 382:	6a 01                	push   $0x1
 384:	e8 2a 04 00 00       	call   7b3 <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 cd 0a 00 00       	push   $0xacd
 391:	68 90 0a 00 00       	push   $0xa90
 396:	6a 01                	push   $0x1
 398:	e8 16 04 00 00       	call   7b3 <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 a4 0a 00 00       	push   $0xaa4
 3a5:	6a 01                	push   $0x1
 3a7:	e8 07 04 00 00       	call   7b3 <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 30 0f 00 00    	push   0xf30
 3b5:	e8 d4 02 00 00       	call   68e <kill>
 3ba:	e8 9f 02 00 00       	call   65e <exit>
=======
 31c:	68 d5 0a 00 00       	push   $0xad5
 321:	6a 01                	push   $0x1
 323:	e8 74 04 00 00       	call   79c <printf>
   exit();
 328:	e8 1a 03 00 00       	call   647 <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 4c 0a 00 00       	push   $0xa4c
 334:	68 56 0a 00 00       	push   $0xa56
 339:	6a 01                	push   $0x1
 33b:	e8 5c 04 00 00       	call   79c <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 c6 0a 00 00       	push   $0xac6
 348:	68 7c 0a 00 00       	push   $0xa7c
 34d:	6a 01                	push   $0x1
 34f:	e8 48 04 00 00       	call   79c <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 90 0a 00 00       	push   $0xa90
 35c:	6a 01                	push   $0x1
 35e:	e8 39 04 00 00       	call   79c <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 10 0f 00 00    	push   0xf10
 36c:	e8 06 03 00 00       	call   677 <kill>
 371:	e8 d1 02 00 00       	call   647 <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 4c 0a 00 00       	push   $0xa4c
 37d:	68 56 0a 00 00       	push   $0xa56
 382:	6a 01                	push   $0x1
 384:	e8 13 04 00 00       	call   79c <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 b9 0a 00 00       	push   $0xab9
 391:	68 7c 0a 00 00       	push   $0xa7c
 396:	6a 01                	push   $0x1
 398:	e8 ff 03 00 00       	call   79c <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 90 0a 00 00       	push   $0xa90
 3a5:	6a 01                	push   $0x1
 3a7:	e8 f0 03 00 00       	call   79c <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 10 0f 00 00    	push   0xf10
 3b5:	e8 bd 02 00 00       	call   677 <kill>
 3ba:	e8 88 02 00 00       	call   647 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000003bf <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 3c5:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3ca:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3cc:	89 d0                	mov    %edx,%eax
 3ce:	5d                   	pop    %ebp
 3cf:	c3                   	ret    

000003d0 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 3d7:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 3dc:	e8 f8 05 00 00       	call   9d9 <malloc>
  if(n_stack == 0){
 3e1:	83 c4 10             	add    $0x10,%esp
 3e4:	85 c0                	test   %eax,%eax
 3e6:	74 41                	je     429 <thread_create+0x59>
 3e8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 3ea:	50                   	push   %eax
 3eb:	ff 75 10             	push   0x10(%ebp)
 3ee:	ff 75 0c             	push   0xc(%ebp)
 3f1:	ff 75 08             	push   0x8(%ebp)
 3f4:	e8 05 03 00 00       	call   6fe <clone>
=======
 3dc:	e8 e1 05 00 00       	call   9c2 <malloc>
  if(n_stack == 0){
 3e1:	83 c4 10             	add    $0x10,%esp
 3e4:	85 c0                	test   %eax,%eax
 3e6:	74 57                	je     43f <thread_create+0x6f>
 3e8:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 3ea:	b8 00 00 00 00       	mov    $0x0,%eax
 3ef:	eb 03                	jmp    3f4 <thread_create+0x24>
 3f1:	83 c0 01             	add    $0x1,%eax
 3f4:	83 f8 3f             	cmp    $0x3f,%eax
 3f7:	7f 2f                	jg     428 <thread_create+0x58>
    if(threads[i].flag==0){
 3f9:	8d 14 40             	lea    (%eax,%eax,2),%edx
 3fc:	83 3c 95 28 0f 00 00 	cmpl   $0x0,0xf28(,%edx,4)
 403:	00 
 404:	75 eb                	jne    3f1 <thread_create+0x21>
      threads[i].maddr = n_stack;
 406:	8d 14 00             	lea    (%eax,%eax,1),%edx
 409:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 40c:	c1 e3 02             	shl    $0x2,%ebx
 40f:	89 8b 20 0f 00 00    	mov    %ecx,0xf20(%ebx)
      threads[i].pg1addr = n_stack;
 415:	89 8b 24 0f 00 00    	mov    %ecx,0xf24(%ebx)
      threads[i].flag = 1;
 41b:	01 c2                	add    %eax,%edx
 41d:	c7 04 95 28 0f 00 00 	movl   $0x1,0xf28(,%edx,4)
 424:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 428:	51                   	push   %ecx
 429:	ff 75 10             	push   0x10(%ebp)
 42c:	ff 75 0c             	push   0xc(%ebp)
 42f:	ff 75 08             	push   0x8(%ebp)
 432:	e8 b0 02 00 00       	call   6e7 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 3f9:	83 c4 10             	add    $0x10,%esp
 3fc:	ba 00 00 00 00       	mov    $0x0,%edx
 401:	eb 03                	jmp    406 <thread_create+0x36>
 403:	83 c2 01             	add    $0x1,%edx
 406:	83 fa 3f             	cmp    $0x3f,%edx
 409:	7f 19                	jg     424 <thread_create+0x54>
    if(threads[i]->flag==0){
 40b:	8b 0c 95 40 0f 00 00 	mov    0xf40(,%edx,4),%ecx
 412:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 416:	75 eb                	jne    403 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 418:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 41a:	8b 14 95 40 0f 00 00 	mov    0xf40(,%edx,4),%edx
 421:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 424:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 427:	c9                   	leave  
 428:	c3                   	ret    
    return -1;
 429:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 42e:	eb f4                	jmp    424 <thread_create+0x54>

00000430 <thread_join>:
=======
 437:	83 c4 10             	add    $0x10,%esp
}
 43a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 43d:	c9                   	leave  
 43e:	c3                   	ret    
    return -1;
 43f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 444:	eb f4                	jmp    43a <thread_create+0x6a>

00000446 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 438:	8d 45 f4             	lea    -0xc(%ebp),%eax
 43b:	50                   	push   %eax
 43c:	e8 c5 02 00 00       	call   706 <join>
 441:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 443:	83 c4 10             	add    $0x10,%esp
 446:	bb 00 00 00 00       	mov    $0x0,%ebx
 44b:	eb 03                	jmp    450 <thread_join+0x20>
 44d:	83 c3 01             	add    $0x1,%ebx
 450:	83 fb 3f             	cmp    $0x3f,%ebx
 453:	7f 23                	jg     478 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 455:	8b 04 9d 40 0f 00 00 	mov    0xf40(,%ebx,4),%eax
 45c:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 460:	75 eb                	jne    44d <thread_join+0x1d>
 462:	8b 55 f4             	mov    -0xc(%ebp),%edx
 465:	39 50 04             	cmp    %edx,0x4(%eax)
 468:	75 e3                	jne    44d <thread_join+0x1d>
      free(stk_addr);
 46a:	83 ec 0c             	sub    $0xc,%esp
 46d:	52                   	push   %edx
 46e:	e8 a6 04 00 00       	call   919 <free>
 473:	83 c4 10             	add    $0x10,%esp
 476:	eb d5                	jmp    44d <thread_join+0x1d>
    }
  }
  return pid;
}
 478:	89 f0                	mov    %esi,%eax
 47a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 47d:	5b                   	pop    %ebx
 47e:	5e                   	pop    %esi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    

00000481 <lock_acquire>:

void lock_acquire(lock_t *lock){
 481:	55                   	push   %ebp
 482:	89 e5                	mov    %esp,%ebp
 484:	53                   	push   %ebx
 485:	83 ec 04             	sub    $0x4,%esp
 488:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 48b:	83 ec 08             	sub    $0x8,%esp
 48e:	6a 01                	push   $0x1
 490:	53                   	push   %ebx
 491:	e8 29 ff ff ff       	call   3bf <test_and_set>
 496:	83 c4 10             	add    $0x10,%esp
 499:	83 f8 01             	cmp    $0x1,%eax
 49c:	74 ed                	je     48b <lock_acquire+0xa>
    ;
}
 49e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a1:	c9                   	leave  
 4a2:	c3                   	ret    

000004a3 <lock_release>:

void lock_release(lock_t *lock) {
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4a6:	8b 45 08             	mov    0x8(%ebp),%eax
 4a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    

000004b1 <lock_init>:

void lock_init(lock_t *lock) {
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4bd:	5d                   	pop    %ebp
 4be:	c3                   	ret    

000004bf <strcpy>:
=======
 446:	55                   	push   %ebp
 447:	89 e5                	mov    %esp,%ebp
 449:	53                   	push   %ebx
 44a:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 44d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 450:	50                   	push   %eax
 451:	e8 99 02 00 00       	call   6ef <join>
 456:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 458:	83 c4 04             	add    $0x4,%esp
 45b:	ff 75 f4             	push   -0xc(%ebp)
 45e:	e8 9f 04 00 00       	call   902 <free>
  return pid;
}
 463:	89 d8                	mov    %ebx,%eax
 465:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 468:	c9                   	leave  
 469:	c3                   	ret    

0000046a <lock_acquire>:

void lock_acquire(lock_t *lock){
 46a:	55                   	push   %ebp
 46b:	89 e5                	mov    %esp,%ebp
 46d:	53                   	push   %ebx
 46e:	83 ec 04             	sub    $0x4,%esp
 471:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 474:	83 ec 08             	sub    $0x8,%esp
 477:	6a 01                	push   $0x1
 479:	53                   	push   %ebx
 47a:	e8 40 ff ff ff       	call   3bf <test_and_set>
 47f:	83 c4 10             	add    $0x10,%esp
 482:	83 f8 01             	cmp    $0x1,%eax
 485:	74 ed                	je     474 <lock_acquire+0xa>
    ;
}
 487:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 48a:	c9                   	leave  
 48b:	c3                   	ret    

0000048c <lock_release>:

void lock_release(lock_t *lock) {
 48c:	55                   	push   %ebp
 48d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 48f:	8b 45 08             	mov    0x8(%ebp),%eax
 492:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 498:	5d                   	pop    %ebp
 499:	c3                   	ret    

0000049a <lock_init>:

void lock_init(lock_t *lock) {
 49a:	55                   	push   %ebp
 49b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
 4a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    

000004a8 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 4bf:	55                   	push   %ebp
 4c0:	89 e5                	mov    %esp,%ebp
 4c2:	56                   	push   %esi
 4c3:	53                   	push   %ebx
 4c4:	8b 75 08             	mov    0x8(%ebp),%esi
 4c7:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	56                   	push   %esi
 4ac:	53                   	push   %ebx
 4ad:	8b 75 08             	mov    0x8(%ebp),%esi
 4b0:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 4ca:	89 f0                	mov    %esi,%eax
 4cc:	89 d1                	mov    %edx,%ecx
 4ce:	83 c2 01             	add    $0x1,%edx
 4d1:	89 c3                	mov    %eax,%ebx
 4d3:	83 c0 01             	add    $0x1,%eax
 4d6:	0f b6 09             	movzbl (%ecx),%ecx
 4d9:	88 0b                	mov    %cl,(%ebx)
 4db:	84 c9                	test   %cl,%cl
 4dd:	75 ed                	jne    4cc <strcpy+0xd>
    ;
  return os;
}
 4df:	89 f0                	mov    %esi,%eax
 4e1:	5b                   	pop    %ebx
 4e2:	5e                   	pop    %esi
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret    

000004e5 <strcmp>:
=======
 4b3:	89 f0                	mov    %esi,%eax
 4b5:	89 d1                	mov    %edx,%ecx
 4b7:	83 c2 01             	add    $0x1,%edx
 4ba:	89 c3                	mov    %eax,%ebx
 4bc:	83 c0 01             	add    $0x1,%eax
 4bf:	0f b6 09             	movzbl (%ecx),%ecx
 4c2:	88 0b                	mov    %cl,(%ebx)
 4c4:	84 c9                	test   %cl,%cl
 4c6:	75 ed                	jne    4b5 <strcpy+0xd>
    ;
  return os;
}
 4c8:	89 f0                	mov    %esi,%eax
 4ca:	5b                   	pop    %ebx
 4cb:	5e                   	pop    %esi
 4cc:	5d                   	pop    %ebp
 4cd:	c3                   	ret    

000004ce <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 4e5:	55                   	push   %ebp
 4e6:	89 e5                	mov    %esp,%ebp
 4e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4ee:	eb 06                	jmp    4f6 <strcmp+0x11>
    p++, q++;
 4f0:	83 c1 01             	add    $0x1,%ecx
 4f3:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4f6:	0f b6 01             	movzbl (%ecx),%eax
 4f9:	84 c0                	test   %al,%al
 4fb:	74 04                	je     501 <strcmp+0x1c>
 4fd:	3a 02                	cmp    (%edx),%al
 4ff:	74 ef                	je     4f0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 501:	0f b6 c0             	movzbl %al,%eax
 504:	0f b6 12             	movzbl (%edx),%edx
 507:	29 d0                	sub    %edx,%eax
}
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    

0000050b <strlen>:
=======
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4d4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4d7:	eb 06                	jmp    4df <strcmp+0x11>
    p++, q++;
 4d9:	83 c1 01             	add    $0x1,%ecx
 4dc:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4df:	0f b6 01             	movzbl (%ecx),%eax
 4e2:	84 c0                	test   %al,%al
 4e4:	74 04                	je     4ea <strcmp+0x1c>
 4e6:	3a 02                	cmp    (%edx),%al
 4e8:	74 ef                	je     4d9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4ea:	0f b6 c0             	movzbl %al,%eax
 4ed:	0f b6 12             	movzbl (%edx),%edx
 4f0:	29 d0                	sub    %edx,%eax
}
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    

000004f4 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 511:	b8 00 00 00 00       	mov    $0x0,%eax
 516:	eb 03                	jmp    51b <strlen+0x10>
 518:	83 c0 01             	add    $0x1,%eax
 51b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 51f:	75 f7                	jne    518 <strlen+0xd>
    ;
  return n;
}
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <memset>:
=======
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4fa:	b8 00 00 00 00       	mov    $0x0,%eax
 4ff:	eb 03                	jmp    504 <strlen+0x10>
 501:	83 c0 01             	add    $0x1,%eax
 504:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 508:	75 f7                	jne    501 <strlen+0xd>
    ;
  return n;
}
 50a:	5d                   	pop    %ebp
 50b:	c3                   	ret    

0000050c <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
 526:	57                   	push   %edi
 527:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 50c:	55                   	push   %ebp
 50d:	89 e5                	mov    %esp,%ebp
 50f:	57                   	push   %edi
 510:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 52a:	89 d7                	mov    %edx,%edi
 52c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 52f:	8b 45 0c             	mov    0xc(%ebp),%eax
 532:	fc                   	cld    
 533:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 535:	89 d0                	mov    %edx,%eax
 537:	8b 7d fc             	mov    -0x4(%ebp),%edi
 53a:	c9                   	leave  
 53b:	c3                   	ret    

0000053c <strchr>:
=======
 513:	89 d7                	mov    %edx,%edi
 515:	8b 4d 10             	mov    0x10(%ebp),%ecx
 518:	8b 45 0c             	mov    0xc(%ebp),%eax
 51b:	fc                   	cld    
 51c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 51e:	89 d0                	mov    %edx,%eax
 520:	8b 7d fc             	mov    -0x4(%ebp),%edi
 523:	c9                   	leave  
 524:	c3                   	ret    

00000525 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 53c:	55                   	push   %ebp
 53d:	89 e5                	mov    %esp,%ebp
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 546:	eb 03                	jmp    54b <strchr+0xf>
 548:	83 c0 01             	add    $0x1,%eax
 54b:	0f b6 10             	movzbl (%eax),%edx
 54e:	84 d2                	test   %dl,%dl
 550:	74 06                	je     558 <strchr+0x1c>
    if(*s == c)
 552:	38 ca                	cmp    %cl,%dl
 554:	75 f2                	jne    548 <strchr+0xc>
 556:	eb 05                	jmp    55d <strchr+0x21>
      return (char*)s;
  return 0;
 558:	b8 00 00 00 00       	mov    $0x0,%eax
}
 55d:	5d                   	pop    %ebp
 55e:	c3                   	ret    

0000055f <gets>:
=======
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 52f:	eb 03                	jmp    534 <strchr+0xf>
 531:	83 c0 01             	add    $0x1,%eax
 534:	0f b6 10             	movzbl (%eax),%edx
 537:	84 d2                	test   %dl,%dl
 539:	74 06                	je     541 <strchr+0x1c>
    if(*s == c)
 53b:	38 ca                	cmp    %cl,%dl
 53d:	75 f2                	jne    531 <strchr+0xc>
 53f:	eb 05                	jmp    546 <strchr+0x21>
      return (char*)s;
  return 0;
 541:	b8 00 00 00 00       	mov    $0x0,%eax
}
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    

00000548 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 55f:	55                   	push   %ebp
 560:	89 e5                	mov    %esp,%ebp
 562:	57                   	push   %edi
 563:	56                   	push   %esi
 564:	53                   	push   %ebx
 565:	83 ec 1c             	sub    $0x1c,%esp
 568:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 548:	55                   	push   %ebp
 549:	89 e5                	mov    %esp,%ebp
 54b:	57                   	push   %edi
 54c:	56                   	push   %esi
 54d:	53                   	push   %ebx
 54e:	83 ec 1c             	sub    $0x1c,%esp
 551:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 56b:	bb 00 00 00 00       	mov    $0x0,%ebx
 570:	89 de                	mov    %ebx,%esi
 572:	83 c3 01             	add    $0x1,%ebx
 575:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 578:	7d 2e                	jge    5a8 <gets+0x49>
    cc = read(0, &c, 1);
 57a:	83 ec 04             	sub    $0x4,%esp
 57d:	6a 01                	push   $0x1
 57f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 582:	50                   	push   %eax
 583:	6a 00                	push   $0x0
 585:	e8 ec 00 00 00       	call   676 <read>
    if(cc < 1)
 58a:	83 c4 10             	add    $0x10,%esp
 58d:	85 c0                	test   %eax,%eax
 58f:	7e 17                	jle    5a8 <gets+0x49>
      break;
    buf[i++] = c;
 591:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 595:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 598:	3c 0a                	cmp    $0xa,%al
 59a:	0f 94 c2             	sete   %dl
 59d:	3c 0d                	cmp    $0xd,%al
 59f:	0f 94 c0             	sete   %al
 5a2:	08 c2                	or     %al,%dl
 5a4:	74 ca                	je     570 <gets+0x11>
    buf[i++] = c;
 5a6:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5a8:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5ac:	89 f8                	mov    %edi,%eax
 5ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b1:	5b                   	pop    %ebx
 5b2:	5e                   	pop    %esi
 5b3:	5f                   	pop    %edi
 5b4:	5d                   	pop    %ebp
 5b5:	c3                   	ret    

000005b6 <stat>:
=======
 554:	bb 00 00 00 00       	mov    $0x0,%ebx
 559:	89 de                	mov    %ebx,%esi
 55b:	83 c3 01             	add    $0x1,%ebx
 55e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 561:	7d 2e                	jge    591 <gets+0x49>
    cc = read(0, &c, 1);
 563:	83 ec 04             	sub    $0x4,%esp
 566:	6a 01                	push   $0x1
 568:	8d 45 e7             	lea    -0x19(%ebp),%eax
 56b:	50                   	push   %eax
 56c:	6a 00                	push   $0x0
 56e:	e8 ec 00 00 00       	call   65f <read>
    if(cc < 1)
 573:	83 c4 10             	add    $0x10,%esp
 576:	85 c0                	test   %eax,%eax
 578:	7e 17                	jle    591 <gets+0x49>
      break;
    buf[i++] = c;
 57a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 57e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 581:	3c 0a                	cmp    $0xa,%al
 583:	0f 94 c2             	sete   %dl
 586:	3c 0d                	cmp    $0xd,%al
 588:	0f 94 c0             	sete   %al
 58b:	08 c2                	or     %al,%dl
 58d:	74 ca                	je     559 <gets+0x11>
    buf[i++] = c;
 58f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 591:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 595:	89 f8                	mov    %edi,%eax
 597:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59a:	5b                   	pop    %ebx
 59b:	5e                   	pop    %esi
 59c:	5f                   	pop    %edi
 59d:	5d                   	pop    %ebp
 59e:	c3                   	ret    

0000059f <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 5b6:	55                   	push   %ebp
 5b7:	89 e5                	mov    %esp,%ebp
 5b9:	56                   	push   %esi
 5ba:	53                   	push   %ebx
=======
 59f:	55                   	push   %ebp
 5a0:	89 e5                	mov    %esp,%ebp
 5a2:	56                   	push   %esi
 5a3:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 5bb:	83 ec 08             	sub    $0x8,%esp
 5be:	6a 00                	push   $0x0
 5c0:	ff 75 08             	push   0x8(%ebp)
 5c3:	e8 d6 00 00 00       	call   69e <open>
  if(fd < 0)
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	85 c0                	test   %eax,%eax
 5cd:	78 24                	js     5f3 <stat+0x3d>
 5cf:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5d1:	83 ec 08             	sub    $0x8,%esp
 5d4:	ff 75 0c             	push   0xc(%ebp)
 5d7:	50                   	push   %eax
 5d8:	e8 d9 00 00 00       	call   6b6 <fstat>
 5dd:	89 c6                	mov    %eax,%esi
  close(fd);
 5df:	89 1c 24             	mov    %ebx,(%esp)
 5e2:	e8 9f 00 00 00       	call   686 <close>
  return r;
 5e7:	83 c4 10             	add    $0x10,%esp
}
 5ea:	89 f0                	mov    %esi,%eax
 5ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5ef:	5b                   	pop    %ebx
 5f0:	5e                   	pop    %esi
 5f1:	5d                   	pop    %ebp
 5f2:	c3                   	ret    
    return -1;
 5f3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5f8:	eb f0                	jmp    5ea <stat+0x34>

000005fa <atoi>:
=======
 5a4:	83 ec 08             	sub    $0x8,%esp
 5a7:	6a 00                	push   $0x0
 5a9:	ff 75 08             	push   0x8(%ebp)
 5ac:	e8 d6 00 00 00       	call   687 <open>
  if(fd < 0)
 5b1:	83 c4 10             	add    $0x10,%esp
 5b4:	85 c0                	test   %eax,%eax
 5b6:	78 24                	js     5dc <stat+0x3d>
 5b8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5ba:	83 ec 08             	sub    $0x8,%esp
 5bd:	ff 75 0c             	push   0xc(%ebp)
 5c0:	50                   	push   %eax
 5c1:	e8 d9 00 00 00       	call   69f <fstat>
 5c6:	89 c6                	mov    %eax,%esi
  close(fd);
 5c8:	89 1c 24             	mov    %ebx,(%esp)
 5cb:	e8 9f 00 00 00       	call   66f <close>
  return r;
 5d0:	83 c4 10             	add    $0x10,%esp
}
 5d3:	89 f0                	mov    %esi,%eax
 5d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5d8:	5b                   	pop    %ebx
 5d9:	5e                   	pop    %esi
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    
    return -1;
 5dc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5e1:	eb f0                	jmp    5d3 <stat+0x34>

000005e3 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 5fa:	55                   	push   %ebp
 5fb:	89 e5                	mov    %esp,%ebp
 5fd:	53                   	push   %ebx
 5fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 601:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 606:	eb 10                	jmp    618 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 608:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 60b:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 60e:	83 c1 01             	add    $0x1,%ecx
 611:	0f be c0             	movsbl %al,%eax
 614:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 618:	0f b6 01             	movzbl (%ecx),%eax
 61b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 61e:	80 fb 09             	cmp    $0x9,%bl
 621:	76 e5                	jbe    608 <atoi+0xe>
  return n;
}
 623:	89 d0                	mov    %edx,%eax
 625:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 628:	c9                   	leave  
 629:	c3                   	ret    

0000062a <memmove>:
=======
 5e3:	55                   	push   %ebp
 5e4:	89 e5                	mov    %esp,%ebp
 5e6:	53                   	push   %ebx
 5e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5ea:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5ef:	eb 10                	jmp    601 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5f1:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5f4:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5f7:	83 c1 01             	add    $0x1,%ecx
 5fa:	0f be c0             	movsbl %al,%eax
 5fd:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 601:	0f b6 01             	movzbl (%ecx),%eax
 604:	8d 58 d0             	lea    -0x30(%eax),%ebx
 607:	80 fb 09             	cmp    $0x9,%bl
 60a:	76 e5                	jbe    5f1 <atoi+0xe>
  return n;
}
 60c:	89 d0                	mov    %edx,%eax
 60e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 611:	c9                   	leave  
 612:	c3                   	ret    

00000613 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	56                   	push   %esi
 62e:	53                   	push   %ebx
 62f:	8b 75 08             	mov    0x8(%ebp),%esi
 632:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 635:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 613:	55                   	push   %ebp
 614:	89 e5                	mov    %esp,%ebp
 616:	56                   	push   %esi
 617:	53                   	push   %ebx
 618:	8b 75 08             	mov    0x8(%ebp),%esi
 61b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 61e:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 638:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 63a:	eb 0d                	jmp    649 <memmove+0x1f>
    *dst++ = *src++;
 63c:	0f b6 01             	movzbl (%ecx),%eax
 63f:	88 02                	mov    %al,(%edx)
 641:	8d 49 01             	lea    0x1(%ecx),%ecx
 644:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 647:	89 d8                	mov    %ebx,%eax
 649:	8d 58 ff             	lea    -0x1(%eax),%ebx
 64c:	85 c0                	test   %eax,%eax
 64e:	7f ec                	jg     63c <memmove+0x12>
  return vdst;
}
 650:	89 f0                	mov    %esi,%eax
 652:	5b                   	pop    %ebx
 653:	5e                   	pop    %esi
 654:	5d                   	pop    %ebp
 655:	c3                   	ret    

00000656 <fork>:
=======
 621:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 623:	eb 0d                	jmp    632 <memmove+0x1f>
    *dst++ = *src++;
 625:	0f b6 01             	movzbl (%ecx),%eax
 628:	88 02                	mov    %al,(%edx)
 62a:	8d 49 01             	lea    0x1(%ecx),%ecx
 62d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 630:	89 d8                	mov    %ebx,%eax
 632:	8d 58 ff             	lea    -0x1(%eax),%ebx
 635:	85 c0                	test   %eax,%eax
 637:	7f ec                	jg     625 <memmove+0x12>
  return vdst;
}
 639:	89 f0                	mov    %esi,%eax
 63b:	5b                   	pop    %ebx
 63c:	5e                   	pop    %esi
 63d:	5d                   	pop    %ebp
 63e:	c3                   	ret    

0000063f <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 656:	b8 01 00 00 00       	mov    $0x1,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <exit>:
SYSCALL(exit)
 65e:	b8 02 00 00 00       	mov    $0x2,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <wait>:
SYSCALL(wait)
 666:	b8 03 00 00 00       	mov    $0x3,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <pipe>:
SYSCALL(pipe)
 66e:	b8 04 00 00 00       	mov    $0x4,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <read>:
SYSCALL(read)
 676:	b8 05 00 00 00       	mov    $0x5,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <write>:
SYSCALL(write)
 67e:	b8 10 00 00 00       	mov    $0x10,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    

00000686 <close>:
SYSCALL(close)
 686:	b8 15 00 00 00       	mov    $0x15,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret    

0000068e <kill>:
SYSCALL(kill)
 68e:	b8 06 00 00 00       	mov    $0x6,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret    

00000696 <exec>:
SYSCALL(exec)
 696:	b8 07 00 00 00       	mov    $0x7,%eax
 69b:	cd 40                	int    $0x40
 69d:	c3                   	ret    

0000069e <open>:
SYSCALL(open)
 69e:	b8 0f 00 00 00       	mov    $0xf,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret    

000006a6 <mknod>:
SYSCALL(mknod)
 6a6:	b8 11 00 00 00       	mov    $0x11,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret    

000006ae <unlink>:
SYSCALL(unlink)
 6ae:	b8 12 00 00 00       	mov    $0x12,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret    

000006b6 <fstat>:
SYSCALL(fstat)
 6b6:	b8 08 00 00 00       	mov    $0x8,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret    

000006be <link>:
SYSCALL(link)
 6be:	b8 13 00 00 00       	mov    $0x13,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret    

000006c6 <mkdir>:
SYSCALL(mkdir)
 6c6:	b8 14 00 00 00       	mov    $0x14,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret    

000006ce <chdir>:
SYSCALL(chdir)
 6ce:	b8 09 00 00 00       	mov    $0x9,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <dup>:
SYSCALL(dup)
 6d6:	b8 0a 00 00 00       	mov    $0xa,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <getpid>:
SYSCALL(getpid)
 6de:	b8 0b 00 00 00       	mov    $0xb,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <sbrk>:
SYSCALL(sbrk)
 6e6:	b8 0c 00 00 00       	mov    $0xc,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <sleep>:
SYSCALL(sleep)
 6ee:	b8 0d 00 00 00       	mov    $0xd,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <uptime>:
SYSCALL(uptime)
 6f6:	b8 0e 00 00 00       	mov    $0xe,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <clone>:
SYSCALL(clone)
 6fe:	b8 16 00 00 00       	mov    $0x16,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <join>:
 706:	b8 17 00 00 00       	mov    $0x17,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret    

0000070e <putc>:
=======
 63f:	b8 01 00 00 00       	mov    $0x1,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret    

00000647 <exit>:
SYSCALL(exit)
 647:	b8 02 00 00 00       	mov    $0x2,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret    

0000064f <wait>:
SYSCALL(wait)
 64f:	b8 03 00 00 00       	mov    $0x3,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret    

00000657 <pipe>:
SYSCALL(pipe)
 657:	b8 04 00 00 00       	mov    $0x4,%eax
 65c:	cd 40                	int    $0x40
 65e:	c3                   	ret    

0000065f <read>:
SYSCALL(read)
 65f:	b8 05 00 00 00       	mov    $0x5,%eax
 664:	cd 40                	int    $0x40
 666:	c3                   	ret    

00000667 <write>:
SYSCALL(write)
 667:	b8 10 00 00 00       	mov    $0x10,%eax
 66c:	cd 40                	int    $0x40
 66e:	c3                   	ret    

0000066f <close>:
SYSCALL(close)
 66f:	b8 15 00 00 00       	mov    $0x15,%eax
 674:	cd 40                	int    $0x40
 676:	c3                   	ret    

00000677 <kill>:
SYSCALL(kill)
 677:	b8 06 00 00 00       	mov    $0x6,%eax
 67c:	cd 40                	int    $0x40
 67e:	c3                   	ret    

0000067f <exec>:
SYSCALL(exec)
 67f:	b8 07 00 00 00       	mov    $0x7,%eax
 684:	cd 40                	int    $0x40
 686:	c3                   	ret    

00000687 <open>:
SYSCALL(open)
 687:	b8 0f 00 00 00       	mov    $0xf,%eax
 68c:	cd 40                	int    $0x40
 68e:	c3                   	ret    

0000068f <mknod>:
SYSCALL(mknod)
 68f:	b8 11 00 00 00       	mov    $0x11,%eax
 694:	cd 40                	int    $0x40
 696:	c3                   	ret    

00000697 <unlink>:
SYSCALL(unlink)
 697:	b8 12 00 00 00       	mov    $0x12,%eax
 69c:	cd 40                	int    $0x40
 69e:	c3                   	ret    

0000069f <fstat>:
SYSCALL(fstat)
 69f:	b8 08 00 00 00       	mov    $0x8,%eax
 6a4:	cd 40                	int    $0x40
 6a6:	c3                   	ret    

000006a7 <link>:
SYSCALL(link)
 6a7:	b8 13 00 00 00       	mov    $0x13,%eax
 6ac:	cd 40                	int    $0x40
 6ae:	c3                   	ret    

000006af <mkdir>:
SYSCALL(mkdir)
 6af:	b8 14 00 00 00       	mov    $0x14,%eax
 6b4:	cd 40                	int    $0x40
 6b6:	c3                   	ret    

000006b7 <chdir>:
SYSCALL(chdir)
 6b7:	b8 09 00 00 00       	mov    $0x9,%eax
 6bc:	cd 40                	int    $0x40
 6be:	c3                   	ret    

000006bf <dup>:
SYSCALL(dup)
 6bf:	b8 0a 00 00 00       	mov    $0xa,%eax
 6c4:	cd 40                	int    $0x40
 6c6:	c3                   	ret    

000006c7 <getpid>:
SYSCALL(getpid)
 6c7:	b8 0b 00 00 00       	mov    $0xb,%eax
 6cc:	cd 40                	int    $0x40
 6ce:	c3                   	ret    

000006cf <sbrk>:
SYSCALL(sbrk)
 6cf:	b8 0c 00 00 00       	mov    $0xc,%eax
 6d4:	cd 40                	int    $0x40
 6d6:	c3                   	ret    

000006d7 <sleep>:
SYSCALL(sleep)
 6d7:	b8 0d 00 00 00       	mov    $0xd,%eax
 6dc:	cd 40                	int    $0x40
 6de:	c3                   	ret    

000006df <uptime>:
SYSCALL(uptime)
 6df:	b8 0e 00 00 00       	mov    $0xe,%eax
 6e4:	cd 40                	int    $0x40
 6e6:	c3                   	ret    

000006e7 <clone>:
SYSCALL(clone)
 6e7:	b8 16 00 00 00       	mov    $0x16,%eax
 6ec:	cd 40                	int    $0x40
 6ee:	c3                   	ret    

000006ef <join>:
 6ef:	b8 17 00 00 00       	mov    $0x17,%eax
 6f4:	cd 40                	int    $0x40
 6f6:	c3                   	ret    

000006f7 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 70e:	55                   	push   %ebp
 70f:	89 e5                	mov    %esp,%ebp
 711:	83 ec 1c             	sub    $0x1c,%esp
 714:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 717:	6a 01                	push   $0x1
 719:	8d 55 f4             	lea    -0xc(%ebp),%edx
 71c:	52                   	push   %edx
 71d:	50                   	push   %eax
 71e:	e8 5b ff ff ff       	call   67e <write>
}
 723:	83 c4 10             	add    $0x10,%esp
 726:	c9                   	leave  
 727:	c3                   	ret    

00000728 <printint>:
=======
 6f7:	55                   	push   %ebp
 6f8:	89 e5                	mov    %esp,%ebp
 6fa:	83 ec 1c             	sub    $0x1c,%esp
 6fd:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 700:	6a 01                	push   $0x1
 702:	8d 55 f4             	lea    -0xc(%ebp),%edx
 705:	52                   	push   %edx
 706:	50                   	push   %eax
 707:	e8 5b ff ff ff       	call   667 <write>
}
 70c:	83 c4 10             	add    $0x10,%esp
 70f:	c9                   	leave  
 710:	c3                   	ret    

00000711 <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 728:	55                   	push   %ebp
 729:	89 e5                	mov    %esp,%ebp
 72b:	57                   	push   %edi
 72c:	56                   	push   %esi
 72d:	53                   	push   %ebx
 72e:	83 ec 2c             	sub    $0x2c,%esp
 731:	89 45 d0             	mov    %eax,-0x30(%ebp)
 734:	89 d0                	mov    %edx,%eax
 736:	89 ce                	mov    %ecx,%esi
=======
 711:	55                   	push   %ebp
 712:	89 e5                	mov    %esp,%ebp
 714:	57                   	push   %edi
 715:	56                   	push   %esi
 716:	53                   	push   %ebx
 717:	83 ec 2c             	sub    $0x2c,%esp
 71a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 71d:	89 d0                	mov    %edx,%eax
 71f:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 738:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 73c:	0f 95 c1             	setne  %cl
 73f:	c1 ea 1f             	shr    $0x1f,%edx
 742:	84 d1                	test   %dl,%cl
 744:	74 44                	je     78a <printint+0x62>
    neg = 1;
    x = -xx;
 746:	f7 d8                	neg    %eax
 748:	89 c1                	mov    %eax,%ecx
    neg = 1;
 74a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 721:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 725:	0f 95 c1             	setne  %cl
 728:	c1 ea 1f             	shr    $0x1f,%edx
 72b:	84 d1                	test   %dl,%cl
 72d:	74 44                	je     773 <printint+0x62>
    neg = 1;
    x = -xx;
 72f:	f7 d8                	neg    %eax
 731:	89 c1                	mov    %eax,%ecx
    neg = 1;
 733:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 751:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 756:	89 c8                	mov    %ecx,%eax
 758:	ba 00 00 00 00       	mov    $0x0,%edx
 75d:	f7 f6                	div    %esi
 75f:	89 df                	mov    %ebx,%edi
 761:	83 c3 01             	add    $0x1,%ebx
 764:	0f b6 92 58 0b 00 00 	movzbl 0xb58(%edx),%edx
 76b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 76f:	89 ca                	mov    %ecx,%edx
 771:	89 c1                	mov    %eax,%ecx
 773:	39 d6                	cmp    %edx,%esi
 775:	76 df                	jbe    756 <printint+0x2e>
  if(neg)
 777:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 77b:	74 31                	je     7ae <printint+0x86>
    buf[i++] = '-';
 77d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 782:	8d 5f 02             	lea    0x2(%edi),%ebx
 785:	8b 75 d0             	mov    -0x30(%ebp),%esi
 788:	eb 17                	jmp    7a1 <printint+0x79>
    x = xx;
 78a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 78c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 793:	eb bc                	jmp    751 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 795:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 79a:	89 f0                	mov    %esi,%eax
 79c:	e8 6d ff ff ff       	call   70e <putc>
  while(--i >= 0)
 7a1:	83 eb 01             	sub    $0x1,%ebx
 7a4:	79 ef                	jns    795 <printint+0x6d>
}
 7a6:	83 c4 2c             	add    $0x2c,%esp
 7a9:	5b                   	pop    %ebx
 7aa:	5e                   	pop    %esi
 7ab:	5f                   	pop    %edi
 7ac:	5d                   	pop    %ebp
 7ad:	c3                   	ret    
 7ae:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7b1:	eb ee                	jmp    7a1 <printint+0x79>

000007b3 <printf>:
=======
 73a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 73f:	89 c8                	mov    %ecx,%eax
 741:	ba 00 00 00 00       	mov    $0x0,%edx
 746:	f7 f6                	div    %esi
 748:	89 df                	mov    %ebx,%edi
 74a:	83 c3 01             	add    $0x1,%ebx
 74d:	0f b6 92 44 0b 00 00 	movzbl 0xb44(%edx),%edx
 754:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 758:	89 ca                	mov    %ecx,%edx
 75a:	89 c1                	mov    %eax,%ecx
 75c:	39 d6                	cmp    %edx,%esi
 75e:	76 df                	jbe    73f <printint+0x2e>
  if(neg)
 760:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 764:	74 31                	je     797 <printint+0x86>
    buf[i++] = '-';
 766:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 76b:	8d 5f 02             	lea    0x2(%edi),%ebx
 76e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 771:	eb 17                	jmp    78a <printint+0x79>
    x = xx;
 773:	89 c1                	mov    %eax,%ecx
  neg = 0;
 775:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 77c:	eb bc                	jmp    73a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 77e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 783:	89 f0                	mov    %esi,%eax
 785:	e8 6d ff ff ff       	call   6f7 <putc>
  while(--i >= 0)
 78a:	83 eb 01             	sub    $0x1,%ebx
 78d:	79 ef                	jns    77e <printint+0x6d>
}
 78f:	83 c4 2c             	add    $0x2c,%esp
 792:	5b                   	pop    %ebx
 793:	5e                   	pop    %esi
 794:	5f                   	pop    %edi
 795:	5d                   	pop    %ebp
 796:	c3                   	ret    
 797:	8b 75 d0             	mov    -0x30(%ebp),%esi
 79a:	eb ee                	jmp    78a <printint+0x79>

0000079c <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 7b3:	55                   	push   %ebp
 7b4:	89 e5                	mov    %esp,%ebp
 7b6:	57                   	push   %edi
 7b7:	56                   	push   %esi
 7b8:	53                   	push   %ebx
 7b9:	83 ec 1c             	sub    $0x1c,%esp
=======
 79c:	55                   	push   %ebp
 79d:	89 e5                	mov    %esp,%ebp
 79f:	57                   	push   %edi
 7a0:	56                   	push   %esi
 7a1:	53                   	push   %ebx
 7a2:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 7bc:	8d 45 10             	lea    0x10(%ebp),%eax
 7bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7c2:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7c7:	bb 00 00 00 00       	mov    $0x0,%ebx
 7cc:	eb 14                	jmp    7e2 <printf+0x2f>
=======
 7a5:	8d 45 10             	lea    0x10(%ebp),%eax
 7a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7ab:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7b0:	bb 00 00 00 00       	mov    $0x0,%ebx
 7b5:	eb 14                	jmp    7cb <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 7ce:	89 fa                	mov    %edi,%edx
 7d0:	8b 45 08             	mov    0x8(%ebp),%eax
 7d3:	e8 36 ff ff ff       	call   70e <putc>
 7d8:	eb 05                	jmp    7df <printf+0x2c>
      }
    } else if(state == '%'){
 7da:	83 fe 25             	cmp    $0x25,%esi
 7dd:	74 25                	je     804 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7df:	83 c3 01             	add    $0x1,%ebx
 7e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7e9:	84 c0                	test   %al,%al
 7eb:	0f 84 20 01 00 00    	je     911 <printf+0x15e>
    c = fmt[i] & 0xff;
 7f1:	0f be f8             	movsbl %al,%edi
 7f4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7f7:	85 f6                	test   %esi,%esi
 7f9:	75 df                	jne    7da <printf+0x27>
      if(c == '%'){
 7fb:	83 f8 25             	cmp    $0x25,%eax
 7fe:	75 ce                	jne    7ce <printf+0x1b>
        state = '%';
 800:	89 c6                	mov    %eax,%esi
 802:	eb db                	jmp    7df <printf+0x2c>
      if(c == 'd'){
 804:	83 f8 25             	cmp    $0x25,%eax
 807:	0f 84 cf 00 00 00    	je     8dc <printf+0x129>
 80d:	0f 8c dd 00 00 00    	jl     8f0 <printf+0x13d>
 813:	83 f8 78             	cmp    $0x78,%eax
 816:	0f 8f d4 00 00 00    	jg     8f0 <printf+0x13d>
 81c:	83 f8 63             	cmp    $0x63,%eax
 81f:	0f 8c cb 00 00 00    	jl     8f0 <printf+0x13d>
 825:	83 e8 63             	sub    $0x63,%eax
 828:	83 f8 15             	cmp    $0x15,%eax
 82b:	0f 87 bf 00 00 00    	ja     8f0 <printf+0x13d>
 831:	ff 24 85 00 0b 00 00 	jmp    *0xb00(,%eax,4)
        printint(fd, *ap, 10, 1);
 838:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 83b:	8b 17                	mov    (%edi),%edx
 83d:	83 ec 0c             	sub    $0xc,%esp
 840:	6a 01                	push   $0x1
 842:	b9 0a 00 00 00       	mov    $0xa,%ecx
 847:	8b 45 08             	mov    0x8(%ebp),%eax
 84a:	e8 d9 fe ff ff       	call   728 <printint>
        ap++;
 84f:	83 c7 04             	add    $0x4,%edi
 852:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 855:	83 c4 10             	add    $0x10,%esp
=======
 7b7:	89 fa                	mov    %edi,%edx
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
 7bc:	e8 36 ff ff ff       	call   6f7 <putc>
 7c1:	eb 05                	jmp    7c8 <printf+0x2c>
      }
    } else if(state == '%'){
 7c3:	83 fe 25             	cmp    $0x25,%esi
 7c6:	74 25                	je     7ed <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7c8:	83 c3 01             	add    $0x1,%ebx
 7cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 7ce:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7d2:	84 c0                	test   %al,%al
 7d4:	0f 84 20 01 00 00    	je     8fa <printf+0x15e>
    c = fmt[i] & 0xff;
 7da:	0f be f8             	movsbl %al,%edi
 7dd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7e0:	85 f6                	test   %esi,%esi
 7e2:	75 df                	jne    7c3 <printf+0x27>
      if(c == '%'){
 7e4:	83 f8 25             	cmp    $0x25,%eax
 7e7:	75 ce                	jne    7b7 <printf+0x1b>
        state = '%';
 7e9:	89 c6                	mov    %eax,%esi
 7eb:	eb db                	jmp    7c8 <printf+0x2c>
      if(c == 'd'){
 7ed:	83 f8 25             	cmp    $0x25,%eax
 7f0:	0f 84 cf 00 00 00    	je     8c5 <printf+0x129>
 7f6:	0f 8c dd 00 00 00    	jl     8d9 <printf+0x13d>
 7fc:	83 f8 78             	cmp    $0x78,%eax
 7ff:	0f 8f d4 00 00 00    	jg     8d9 <printf+0x13d>
 805:	83 f8 63             	cmp    $0x63,%eax
 808:	0f 8c cb 00 00 00    	jl     8d9 <printf+0x13d>
 80e:	83 e8 63             	sub    $0x63,%eax
 811:	83 f8 15             	cmp    $0x15,%eax
 814:	0f 87 bf 00 00 00    	ja     8d9 <printf+0x13d>
 81a:	ff 24 85 ec 0a 00 00 	jmp    *0xaec(,%eax,4)
        printint(fd, *ap, 10, 1);
 821:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 824:	8b 17                	mov    (%edi),%edx
 826:	83 ec 0c             	sub    $0xc,%esp
 829:	6a 01                	push   $0x1
 82b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 830:	8b 45 08             	mov    0x8(%ebp),%eax
 833:	e8 d9 fe ff ff       	call   711 <printint>
        ap++;
 838:	83 c7 04             	add    $0x4,%edi
 83b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 83e:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 858:	be 00 00 00 00       	mov    $0x0,%esi
 85d:	eb 80                	jmp    7df <printf+0x2c>
        printint(fd, *ap, 16, 0);
 85f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 862:	8b 17                	mov    (%edi),%edx
 864:	83 ec 0c             	sub    $0xc,%esp
 867:	6a 00                	push   $0x0
 869:	b9 10 00 00 00       	mov    $0x10,%ecx
 86e:	8b 45 08             	mov    0x8(%ebp),%eax
 871:	e8 b2 fe ff ff       	call   728 <printint>
        ap++;
 876:	83 c7 04             	add    $0x4,%edi
 879:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 87c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87f:	be 00 00 00 00       	mov    $0x0,%esi
 884:	e9 56 ff ff ff       	jmp    7df <printf+0x2c>
        s = (char*)*ap;
 889:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 88c:	8b 30                	mov    (%eax),%esi
        ap++;
 88e:	83 c0 04             	add    $0x4,%eax
 891:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 894:	85 f6                	test   %esi,%esi
 896:	75 15                	jne    8ad <printf+0xfa>
          s = "(null)";
 898:	be f6 0a 00 00       	mov    $0xaf6,%esi
 89d:	eb 0e                	jmp    8ad <printf+0xfa>
          putc(fd, *s);
 89f:	0f be d2             	movsbl %dl,%edx
 8a2:	8b 45 08             	mov    0x8(%ebp),%eax
 8a5:	e8 64 fe ff ff       	call   70e <putc>
          s++;
 8aa:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8ad:	0f b6 16             	movzbl (%esi),%edx
 8b0:	84 d2                	test   %dl,%dl
 8b2:	75 eb                	jne    89f <printf+0xec>
      state = 0;
 8b4:	be 00 00 00 00       	mov    $0x0,%esi
 8b9:	e9 21 ff ff ff       	jmp    7df <printf+0x2c>
        putc(fd, *ap);
 8be:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c1:	0f be 17             	movsbl (%edi),%edx
 8c4:	8b 45 08             	mov    0x8(%ebp),%eax
 8c7:	e8 42 fe ff ff       	call   70e <putc>
        ap++;
 8cc:	83 c7 04             	add    $0x4,%edi
 8cf:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8d2:	be 00 00 00 00       	mov    $0x0,%esi
 8d7:	e9 03 ff ff ff       	jmp    7df <printf+0x2c>
        putc(fd, c);
 8dc:	89 fa                	mov    %edi,%edx
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	e8 28 fe ff ff       	call   70e <putc>
      state = 0;
 8e6:	be 00 00 00 00       	mov    $0x0,%esi
 8eb:	e9 ef fe ff ff       	jmp    7df <printf+0x2c>
        putc(fd, '%');
 8f0:	ba 25 00 00 00       	mov    $0x25,%edx
 8f5:	8b 45 08             	mov    0x8(%ebp),%eax
 8f8:	e8 11 fe ff ff       	call   70e <putc>
        putc(fd, c);
 8fd:	89 fa                	mov    %edi,%edx
 8ff:	8b 45 08             	mov    0x8(%ebp),%eax
 902:	e8 07 fe ff ff       	call   70e <putc>
      state = 0;
 907:	be 00 00 00 00       	mov    $0x0,%esi
 90c:	e9 ce fe ff ff       	jmp    7df <printf+0x2c>
    }
  }
}
 911:	8d 65 f4             	lea    -0xc(%ebp),%esp
 914:	5b                   	pop    %ebx
 915:	5e                   	pop    %esi
 916:	5f                   	pop    %edi
 917:	5d                   	pop    %ebp
 918:	c3                   	ret    

00000919 <free>:
=======
 841:	be 00 00 00 00       	mov    $0x0,%esi
 846:	eb 80                	jmp    7c8 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 848:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 84b:	8b 17                	mov    (%edi),%edx
 84d:	83 ec 0c             	sub    $0xc,%esp
 850:	6a 00                	push   $0x0
 852:	b9 10 00 00 00       	mov    $0x10,%ecx
 857:	8b 45 08             	mov    0x8(%ebp),%eax
 85a:	e8 b2 fe ff ff       	call   711 <printint>
        ap++;
 85f:	83 c7 04             	add    $0x4,%edi
 862:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 865:	83 c4 10             	add    $0x10,%esp
      state = 0;
 868:	be 00 00 00 00       	mov    $0x0,%esi
 86d:	e9 56 ff ff ff       	jmp    7c8 <printf+0x2c>
        s = (char*)*ap;
 872:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 875:	8b 30                	mov    (%eax),%esi
        ap++;
 877:	83 c0 04             	add    $0x4,%eax
 87a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 87d:	85 f6                	test   %esi,%esi
 87f:	75 15                	jne    896 <printf+0xfa>
          s = "(null)";
 881:	be e2 0a 00 00       	mov    $0xae2,%esi
 886:	eb 0e                	jmp    896 <printf+0xfa>
          putc(fd, *s);
 888:	0f be d2             	movsbl %dl,%edx
 88b:	8b 45 08             	mov    0x8(%ebp),%eax
 88e:	e8 64 fe ff ff       	call   6f7 <putc>
          s++;
 893:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 896:	0f b6 16             	movzbl (%esi),%edx
 899:	84 d2                	test   %dl,%dl
 89b:	75 eb                	jne    888 <printf+0xec>
      state = 0;
 89d:	be 00 00 00 00       	mov    $0x0,%esi
 8a2:	e9 21 ff ff ff       	jmp    7c8 <printf+0x2c>
        putc(fd, *ap);
 8a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8aa:	0f be 17             	movsbl (%edi),%edx
 8ad:	8b 45 08             	mov    0x8(%ebp),%eax
 8b0:	e8 42 fe ff ff       	call   6f7 <putc>
        ap++;
 8b5:	83 c7 04             	add    $0x4,%edi
 8b8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8bb:	be 00 00 00 00       	mov    $0x0,%esi
 8c0:	e9 03 ff ff ff       	jmp    7c8 <printf+0x2c>
        putc(fd, c);
 8c5:	89 fa                	mov    %edi,%edx
 8c7:	8b 45 08             	mov    0x8(%ebp),%eax
 8ca:	e8 28 fe ff ff       	call   6f7 <putc>
      state = 0;
 8cf:	be 00 00 00 00       	mov    $0x0,%esi
 8d4:	e9 ef fe ff ff       	jmp    7c8 <printf+0x2c>
        putc(fd, '%');
 8d9:	ba 25 00 00 00       	mov    $0x25,%edx
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	e8 11 fe ff ff       	call   6f7 <putc>
        putc(fd, c);
 8e6:	89 fa                	mov    %edi,%edx
 8e8:	8b 45 08             	mov    0x8(%ebp),%eax
 8eb:	e8 07 fe ff ff       	call   6f7 <putc>
      state = 0;
 8f0:	be 00 00 00 00       	mov    $0x0,%esi
 8f5:	e9 ce fe ff ff       	jmp    7c8 <printf+0x2c>
    }
  }
}
 8fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8fd:	5b                   	pop    %ebx
 8fe:	5e                   	pop    %esi
 8ff:	5f                   	pop    %edi
 900:	5d                   	pop    %ebp
 901:	c3                   	ret    

00000902 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 919:	55                   	push   %ebp
 91a:	89 e5                	mov    %esp,%ebp
 91c:	57                   	push   %edi
 91d:	56                   	push   %esi
 91e:	53                   	push   %ebx
 91f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 922:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 925:	a1 40 10 00 00       	mov    0x1040,%eax
 92a:	eb 02                	jmp    92e <free+0x15>
 92c:	89 d0                	mov    %edx,%eax
 92e:	39 c8                	cmp    %ecx,%eax
 930:	73 04                	jae    936 <free+0x1d>
 932:	39 08                	cmp    %ecx,(%eax)
 934:	77 12                	ja     948 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 936:	8b 10                	mov    (%eax),%edx
 938:	39 c2                	cmp    %eax,%edx
 93a:	77 f0                	ja     92c <free+0x13>
 93c:	39 c8                	cmp    %ecx,%eax
 93e:	72 08                	jb     948 <free+0x2f>
 940:	39 ca                	cmp    %ecx,%edx
 942:	77 04                	ja     948 <free+0x2f>
 944:	89 d0                	mov    %edx,%eax
 946:	eb e6                	jmp    92e <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 948:	8b 73 fc             	mov    -0x4(%ebx),%esi
 94b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 94e:	8b 10                	mov    (%eax),%edx
 950:	39 d7                	cmp    %edx,%edi
 952:	74 19                	je     96d <free+0x54>
=======
 902:	55                   	push   %ebp
 903:	89 e5                	mov    %esp,%ebp
 905:	57                   	push   %edi
 906:	56                   	push   %esi
 907:	53                   	push   %ebx
 908:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 90b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 90e:	a1 20 12 00 00       	mov    0x1220,%eax
 913:	eb 02                	jmp    917 <free+0x15>
 915:	89 d0                	mov    %edx,%eax
 917:	39 c8                	cmp    %ecx,%eax
 919:	73 04                	jae    91f <free+0x1d>
 91b:	39 08                	cmp    %ecx,(%eax)
 91d:	77 12                	ja     931 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 91f:	8b 10                	mov    (%eax),%edx
 921:	39 c2                	cmp    %eax,%edx
 923:	77 f0                	ja     915 <free+0x13>
 925:	39 c8                	cmp    %ecx,%eax
 927:	72 08                	jb     931 <free+0x2f>
 929:	39 ca                	cmp    %ecx,%edx
 92b:	77 04                	ja     931 <free+0x2f>
 92d:	89 d0                	mov    %edx,%eax
 92f:	eb e6                	jmp    917 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 931:	8b 73 fc             	mov    -0x4(%ebx),%esi
 934:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 937:	8b 10                	mov    (%eax),%edx
 939:	39 d7                	cmp    %edx,%edi
 93b:	74 19                	je     956 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 954:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 957:	8b 50 04             	mov    0x4(%eax),%edx
 95a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 95d:	39 ce                	cmp    %ecx,%esi
 95f:	74 1b                	je     97c <free+0x63>
=======
 93d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 940:	8b 50 04             	mov    0x4(%eax),%edx
 943:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 946:	39 ce                	cmp    %ecx,%esi
 948:	74 1b                	je     965 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 961:	89 08                	mov    %ecx,(%eax)
  freep = p;
 963:	a3 40 10 00 00       	mov    %eax,0x1040
}
 968:	5b                   	pop    %ebx
 969:	5e                   	pop    %esi
 96a:	5f                   	pop    %edi
 96b:	5d                   	pop    %ebp
 96c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 96d:	03 72 04             	add    0x4(%edx),%esi
 970:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 973:	8b 10                	mov    (%eax),%edx
 975:	8b 12                	mov    (%edx),%edx
 977:	89 53 f8             	mov    %edx,-0x8(%ebx)
 97a:	eb db                	jmp    957 <free+0x3e>
    p->s.size += bp->s.size;
 97c:	03 53 fc             	add    -0x4(%ebx),%edx
 97f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 982:	8b 53 f8             	mov    -0x8(%ebx),%edx
 985:	89 10                	mov    %edx,(%eax)
 987:	eb da                	jmp    963 <free+0x4a>

00000989 <morecore>:
=======
 94a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 94c:	a3 20 12 00 00       	mov    %eax,0x1220
}
 951:	5b                   	pop    %ebx
 952:	5e                   	pop    %esi
 953:	5f                   	pop    %edi
 954:	5d                   	pop    %ebp
 955:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 956:	03 72 04             	add    0x4(%edx),%esi
 959:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 95c:	8b 10                	mov    (%eax),%edx
 95e:	8b 12                	mov    (%edx),%edx
 960:	89 53 f8             	mov    %edx,-0x8(%ebx)
 963:	eb db                	jmp    940 <free+0x3e>
    p->s.size += bp->s.size;
 965:	03 53 fc             	add    -0x4(%ebx),%edx
 968:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 96b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 96e:	89 10                	mov    %edx,(%eax)
 970:	eb da                	jmp    94c <free+0x4a>

00000972 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 989:	55                   	push   %ebp
 98a:	89 e5                	mov    %esp,%ebp
 98c:	53                   	push   %ebx
 98d:	83 ec 04             	sub    $0x4,%esp
 990:	89 c3                	mov    %eax,%ebx
=======
 972:	55                   	push   %ebp
 973:	89 e5                	mov    %esp,%ebp
 975:	53                   	push   %ebx
 976:	83 ec 04             	sub    $0x4,%esp
 979:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 992:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 997:	77 05                	ja     99e <morecore+0x15>
    nu = 4096;
 999:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 99e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9a5:	83 ec 0c             	sub    $0xc,%esp
 9a8:	50                   	push   %eax
 9a9:	e8 38 fd ff ff       	call   6e6 <sbrk>
  if(p == (char*)-1)
 9ae:	83 c4 10             	add    $0x10,%esp
 9b1:	83 f8 ff             	cmp    $0xffffffff,%eax
 9b4:	74 1c                	je     9d2 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9b6:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9b9:	83 c0 08             	add    $0x8,%eax
 9bc:	83 ec 0c             	sub    $0xc,%esp
 9bf:	50                   	push   %eax
 9c0:	e8 54 ff ff ff       	call   919 <free>
  return freep;
 9c5:	a1 40 10 00 00       	mov    0x1040,%eax
 9ca:	83 c4 10             	add    $0x10,%esp
}
 9cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9d0:	c9                   	leave  
 9d1:	c3                   	ret    
    return 0;
 9d2:	b8 00 00 00 00       	mov    $0x0,%eax
 9d7:	eb f4                	jmp    9cd <morecore+0x44>

000009d9 <malloc>:
=======
 97b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 980:	77 05                	ja     987 <morecore+0x15>
    nu = 4096;
 982:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 987:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 98e:	83 ec 0c             	sub    $0xc,%esp
 991:	50                   	push   %eax
 992:	e8 38 fd ff ff       	call   6cf <sbrk>
  if(p == (char*)-1)
 997:	83 c4 10             	add    $0x10,%esp
 99a:	83 f8 ff             	cmp    $0xffffffff,%eax
 99d:	74 1c                	je     9bb <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 99f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9a2:	83 c0 08             	add    $0x8,%eax
 9a5:	83 ec 0c             	sub    $0xc,%esp
 9a8:	50                   	push   %eax
 9a9:	e8 54 ff ff ff       	call   902 <free>
  return freep;
 9ae:	a1 20 12 00 00       	mov    0x1220,%eax
 9b3:	83 c4 10             	add    $0x10,%esp
}
 9b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9b9:	c9                   	leave  
 9ba:	c3                   	ret    
    return 0;
 9bb:	b8 00 00 00 00       	mov    $0x0,%eax
 9c0:	eb f4                	jmp    9b6 <morecore+0x44>

000009c2 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 9d9:	55                   	push   %ebp
 9da:	89 e5                	mov    %esp,%ebp
 9dc:	53                   	push   %ebx
 9dd:	83 ec 04             	sub    $0x4,%esp
=======
 9c2:	55                   	push   %ebp
 9c3:	89 e5                	mov    %esp,%ebp
 9c5:	53                   	push   %ebx
 9c6:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 9e0:	8b 45 08             	mov    0x8(%ebp),%eax
 9e3:	8d 58 07             	lea    0x7(%eax),%ebx
 9e6:	c1 eb 03             	shr    $0x3,%ebx
 9e9:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9ec:	8b 0d 40 10 00 00    	mov    0x1040,%ecx
 9f2:	85 c9                	test   %ecx,%ecx
 9f4:	74 04                	je     9fa <malloc+0x21>
=======
 9c9:	8b 45 08             	mov    0x8(%ebp),%eax
 9cc:	8d 58 07             	lea    0x7(%eax),%ebx
 9cf:	c1 eb 03             	shr    $0x3,%ebx
 9d2:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9d5:	8b 0d 20 12 00 00    	mov    0x1220,%ecx
 9db:	85 c9                	test   %ecx,%ecx
 9dd:	74 04                	je     9e3 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 9f6:	8b 01                	mov    (%ecx),%eax
 9f8:	eb 4a                	jmp    a44 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9fa:	c7 05 40 10 00 00 44 	movl   $0x1044,0x1040
 a01:	10 00 00 
 a04:	c7 05 44 10 00 00 44 	movl   $0x1044,0x1044
 a0b:	10 00 00 
    base.s.size = 0;
 a0e:	c7 05 48 10 00 00 00 	movl   $0x0,0x1048
 a15:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a18:	b9 44 10 00 00       	mov    $0x1044,%ecx
 a1d:	eb d7                	jmp    9f6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a1f:	74 19                	je     a3a <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a21:	29 da                	sub    %ebx,%edx
 a23:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a26:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a29:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a2c:	89 0d 40 10 00 00    	mov    %ecx,0x1040
      return (void*)(p + 1);
 a32:	83 c0 08             	add    $0x8,%eax
=======
 9df:	8b 01                	mov    (%ecx),%eax
 9e1:	eb 4a                	jmp    a2d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9e3:	c7 05 20 12 00 00 24 	movl   $0x1224,0x1220
 9ea:	12 00 00 
 9ed:	c7 05 24 12 00 00 24 	movl   $0x1224,0x1224
 9f4:	12 00 00 
    base.s.size = 0;
 9f7:	c7 05 28 12 00 00 00 	movl   $0x0,0x1228
 9fe:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a01:	b9 24 12 00 00       	mov    $0x1224,%ecx
 a06:	eb d7                	jmp    9df <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a08:	74 19                	je     a23 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a0a:	29 da                	sub    %ebx,%edx
 a0c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a0f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a12:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a15:	89 0d 20 12 00 00    	mov    %ecx,0x1220
      return (void*)(p + 1);
 a1b:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 a35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a38:	c9                   	leave  
 a39:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a3a:	8b 10                	mov    (%eax),%edx
 a3c:	89 11                	mov    %edx,(%ecx)
 a3e:	eb ec                	jmp    a2c <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a40:	89 c1                	mov    %eax,%ecx
 a42:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a44:	8b 50 04             	mov    0x4(%eax),%edx
 a47:	39 da                	cmp    %ebx,%edx
 a49:	73 d4                	jae    a1f <malloc+0x46>
    if(p == freep)
 a4b:	39 05 40 10 00 00    	cmp    %eax,0x1040
 a51:	75 ed                	jne    a40 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a53:	89 d8                	mov    %ebx,%eax
 a55:	e8 2f ff ff ff       	call   989 <morecore>
 a5a:	85 c0                	test   %eax,%eax
 a5c:	75 e2                	jne    a40 <malloc+0x67>
 a5e:	eb d5                	jmp    a35 <malloc+0x5c>
=======
 a1e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a21:	c9                   	leave  
 a22:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a23:	8b 10                	mov    (%eax),%edx
 a25:	89 11                	mov    %edx,(%ecx)
 a27:	eb ec                	jmp    a15 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a29:	89 c1                	mov    %eax,%ecx
 a2b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a2d:	8b 50 04             	mov    0x4(%eax),%edx
 a30:	39 da                	cmp    %ebx,%edx
 a32:	73 d4                	jae    a08 <malloc+0x46>
    if(p == freep)
 a34:	39 05 20 12 00 00    	cmp    %eax,0x1220
 a3a:	75 ed                	jne    a29 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a3c:	89 d8                	mov    %ebx,%eax
 a3e:	e8 2f ff ff ff       	call   972 <morecore>
 a43:	85 c0                	test   %eax,%eax
 a45:	75 e2                	jne    a29 <malloc+0x67>
 a47:	eb d5                	jmp    a1e <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
