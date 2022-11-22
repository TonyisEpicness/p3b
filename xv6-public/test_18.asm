
_test_18:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:

   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1,void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
    int j;
    lock_acquire(&lock);
<<<<<<< HEAD
   6:	68 60 0e 00 00       	push   $0xe60
   b:	e8 9b 03 00 00       	call   3ab <lock_acquire>
=======
   6:	68 40 0e 00 00       	push   $0xe40
   b:	e8 84 03 00 00       	call   394 <lock_acquire>
>>>>>>> c59b0f9 (fixed thread_join and join)
    for(j=0;j<50;j++);
  10:	83 c4 10             	add    $0x10,%esp
  13:	b8 00 00 00 00       	mov    $0x0,%eax
  18:	eb 03                	jmp    1d <worker2+0x1d>
  1a:	83 c0 01             	add    $0x1,%eax
  1d:	83 f8 31             	cmp    $0x31,%eax
  20:	7e f8                	jle    1a <worker2+0x1a>
    global++;
<<<<<<< HEAD
  22:	83 05 64 0e 00 00 01 	addl   $0x1,0xe64
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 60 0e 00 00       	push   $0xe60
  31:	e8 97 03 00 00       	call   3cd <lock_release>
    exit();
  36:	e8 4d 05 00 00       	call   588 <exit>
=======
  22:	83 05 44 0e 00 00 01 	addl   $0x1,0xe44
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 40 0e 00 00       	push   $0xe40
  31:	e8 80 03 00 00       	call   3b6 <lock_release>
    exit();
  36:	e8 36 05 00 00       	call   571 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000003b <worker>:
    
}
void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %ebx
  3f:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
<<<<<<< HEAD
  42:	68 60 0e 00 00       	push   $0xe60
  47:	e8 5f 03 00 00       	call   3ab <lock_acquire>
=======
  42:	68 40 0e 00 00       	push   $0xe40
  47:	e8 48 03 00 00       	call   394 <lock_acquire>
>>>>>>> c59b0f9 (fixed thread_join and join)
    int j;
    for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb 03                	jmp    59 <worker+0x1e>
  56:	83 c0 01             	add    $0x1,%eax
  59:	83 f8 31             	cmp    $0x31,%eax
  5c:	7e f8                	jle    56 <worker+0x1b>
    global++;
<<<<<<< HEAD
  5e:	83 05 64 0e 00 00 01 	addl   $0x1,0xe64
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 60 0e 00 00       	push   $0xe60
  6d:	e8 5b 03 00 00       	call   3cd <lock_release>
=======
  5e:	83 05 44 0e 00 00 01 	addl   $0x1,0xe44
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 40 0e 00 00       	push   $0xe40
  6d:	e8 44 03 00 00       	call   3b6 <lock_release>
>>>>>>> c59b0f9 (fixed thread_join and join)

    int nested_thread_pid = thread_create(worker2, 0, 0);
  72:	83 c4 0c             	add    $0xc,%esp
  75:	6a 00                	push   $0x0
  77:	6a 00                	push   $0x0
  79:	68 00 00 00 00       	push   $0x0
  7e:	e8 77 02 00 00       	call   2fa <thread_create>
  83:	89 c3                	mov    %eax,%ebx
    assert(nested_thread_pid > 0);
  85:	83 c4 10             	add    $0x10,%esp
  88:	85 c0                	test   %eax,%eax
  8a:	7e 5e                	jle    ea <worker+0xaf>
    int nested_join_pid = thread_join();
<<<<<<< HEAD
  8c:	e8 c9 02 00 00       	call   35a <thread_join>
=======
  8c:	e8 df 02 00 00       	call   370 <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
<<<<<<< HEAD
  a3:	68 8c 09 00 00       	push   $0x98c
  a8:	68 96 09 00 00       	push   $0x996
  ad:	6a 01                	push   $0x1
  af:	e8 29 06 00 00       	call   6dd <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 10 0a 00 00       	push   $0xa10
  bc:	68 b4 09 00 00       	push   $0x9b4
  c1:	6a 01                	push   $0x1
  c3:	e8 15 06 00 00       	call   6dd <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 c8 09 00 00       	push   $0x9c8
  d0:	6a 01                	push   $0x1
  d2:	e8 06 06 00 00       	call   6dd <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 68 0e 00 00    	push   0xe68
  e0:	e8 d3 04 00 00       	call   5b8 <kill>
  e5:	e8 9e 04 00 00       	call   588 <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 8c 09 00 00       	push   $0x98c
  f1:	68 96 09 00 00       	push   $0x996
  f6:	6a 01                	push   $0x1
  f8:	e8 e0 05 00 00       	call   6dd <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 9e 09 00 00       	push   $0x99e
 105:	68 b4 09 00 00       	push   $0x9b4
 10a:	6a 01                	push   $0x1
 10c:	e8 cc 05 00 00       	call   6dd <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 c8 09 00 00       	push   $0x9c8
 119:	6a 01                	push   $0x1
 11b:	e8 bd 05 00 00       	call   6dd <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 68 0e 00 00    	push   0xe68
 129:	e8 8a 04 00 00       	call   5b8 <kill>
 12e:	e8 55 04 00 00       	call   588 <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 8c 09 00 00       	push   $0x98c
 13a:	68 96 09 00 00       	push   $0x996
 13f:	6a 01                	push   $0x1
 141:	e8 97 05 00 00       	call   6dd <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 d5 09 00 00       	push   $0x9d5
 14e:	68 b4 09 00 00       	push   $0x9b4
 153:	6a 01                	push   $0x1
 155:	e8 83 05 00 00       	call   6dd <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 c8 09 00 00       	push   $0x9c8
 162:	6a 01                	push   $0x1
 164:	e8 74 05 00 00       	call   6dd <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 68 0e 00 00    	push   0xe68
 172:	e8 41 04 00 00       	call   5b8 <kill>
 177:	e8 0c 04 00 00       	call   588 <exit>

   exit();
 17c:	e8 07 04 00 00       	call   588 <exit>
=======
  a3:	68 74 09 00 00       	push   $0x974
  a8:	68 7e 09 00 00       	push   $0x97e
  ad:	6a 01                	push   $0x1
  af:	e8 12 06 00 00       	call   6c6 <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 f8 09 00 00       	push   $0x9f8
  bc:	68 9c 09 00 00       	push   $0x99c
  c1:	6a 01                	push   $0x1
  c3:	e8 fe 05 00 00       	call   6c6 <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 b0 09 00 00       	push   $0x9b0
  d0:	6a 01                	push   $0x1
  d2:	e8 ef 05 00 00       	call   6c6 <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 48 0e 00 00    	push   0xe48
  e0:	e8 bc 04 00 00       	call   5a1 <kill>
  e5:	e8 87 04 00 00       	call   571 <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 74 09 00 00       	push   $0x974
  f1:	68 7e 09 00 00       	push   $0x97e
  f6:	6a 01                	push   $0x1
  f8:	e8 c9 05 00 00       	call   6c6 <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 86 09 00 00       	push   $0x986
 105:	68 9c 09 00 00       	push   $0x99c
 10a:	6a 01                	push   $0x1
 10c:	e8 b5 05 00 00       	call   6c6 <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 b0 09 00 00       	push   $0x9b0
 119:	6a 01                	push   $0x1
 11b:	e8 a6 05 00 00       	call   6c6 <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 48 0e 00 00    	push   0xe48
 129:	e8 73 04 00 00       	call   5a1 <kill>
 12e:	e8 3e 04 00 00       	call   571 <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 74 09 00 00       	push   $0x974
 13a:	68 7e 09 00 00       	push   $0x97e
 13f:	6a 01                	push   $0x1
 141:	e8 80 05 00 00       	call   6c6 <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 bd 09 00 00       	push   $0x9bd
 14e:	68 9c 09 00 00       	push   $0x99c
 153:	6a 01                	push   $0x1
 155:	e8 6c 05 00 00       	call   6c6 <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 b0 09 00 00       	push   $0x9b0
 162:	6a 01                	push   $0x1
 164:	e8 5d 05 00 00       	call   6c6 <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 48 0e 00 00    	push   0xe48
 172:	e8 2a 04 00 00       	call   5a1 <kill>
 177:	e8 f5 03 00 00       	call   571 <exit>

   exit();
 17c:	e8 f0 03 00 00       	call   571 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000181 <main>:
{
 181:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 185:	83 e4 f0             	and    $0xfffffff0,%esp
 188:	ff 71 fc             	push   -0x4(%ecx)
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	53                   	push   %ebx
 18f:	51                   	push   %ecx
   ppid = getpid();
<<<<<<< HEAD
 190:	e8 73 04 00 00       	call   608 <getpid>
 195:	a3 68 0e 00 00       	mov    %eax,0xe68
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 60 0e 00 00       	push   $0xe60
 1a2:	e8 34 02 00 00       	call   3db <lock_init>
=======
 190:	e8 5c 04 00 00       	call   5f1 <getpid>
 195:	a3 48 0e 00 00       	mov    %eax,0xe48
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 40 0e 00 00       	push   $0xe40
 1a2:	e8 1d 02 00 00       	call   3c4 <lock_init>
>>>>>>> c59b0f9 (fixed thread_join and join)
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
<<<<<<< HEAD
 1b4:	39 1d 48 0e 00 00    	cmp    %ebx,0xe48
=======
 1b4:	39 1d 2c 0e 00 00    	cmp    %ebx,0xe2c
>>>>>>> c59b0f9 (fixed thread_join and join)
 1ba:	7e 61                	jle    21d <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
 1bc:	83 ec 04             	sub    $0x4,%esp
 1bf:	6a 00                	push   $0x0
 1c1:	6a 00                	push   $0x0
 1c3:	68 3b 00 00 00       	push   $0x3b
 1c8:	e8 2d 01 00 00       	call   2fa <thread_create>
      assert(thread_pid > 0);
 1cd:	83 c4 10             	add    $0x10,%esp
 1d0:	85 c0                	test   %eax,%eax
 1d2:	7f dd                	jg     1b1 <main+0x30>
 1d4:	6a 26                	push   $0x26
<<<<<<< HEAD
 1d6:	68 8c 09 00 00       	push   $0x98c
 1db:	68 96 09 00 00       	push   $0x996
 1e0:	6a 01                	push   $0x1
 1e2:	e8 f6 04 00 00       	call   6dd <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 a5 09 00 00       	push   $0x9a5
 1ef:	68 b4 09 00 00       	push   $0x9b4
 1f4:	6a 01                	push   $0x1
 1f6:	e8 e2 04 00 00       	call   6dd <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 c8 09 00 00       	push   $0x9c8
 203:	6a 01                	push   $0x1
 205:	e8 d3 04 00 00       	call   6dd <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 68 0e 00 00    	push   0xe68
 213:	e8 a0 03 00 00       	call   5b8 <kill>
 218:	e8 6b 03 00 00       	call   588 <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 48 0e 00 00       	mov    0xe48,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 2a 01 00 00       	call   35a <thread_join>
=======
 1d6:	68 74 09 00 00       	push   $0x974
 1db:	68 7e 09 00 00       	push   $0x97e
 1e0:	6a 01                	push   $0x1
 1e2:	e8 df 04 00 00       	call   6c6 <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 8d 09 00 00       	push   $0x98d
 1ef:	68 9c 09 00 00       	push   $0x99c
 1f4:	6a 01                	push   $0x1
 1f6:	e8 cb 04 00 00       	call   6c6 <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 b0 09 00 00       	push   $0x9b0
 203:	6a 01                	push   $0x1
 205:	e8 bc 04 00 00       	call   6c6 <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 48 0e 00 00    	push   0xe48
 213:	e8 89 03 00 00       	call   5a1 <kill>
 218:	e8 54 03 00 00       	call   571 <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 2c 0e 00 00       	mov    0xe2c,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 40 01 00 00       	call   370 <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
<<<<<<< HEAD
 23b:	68 8c 09 00 00       	push   $0x98c
 240:	68 96 09 00 00       	push   $0x996
 245:	6a 01                	push   $0x1
 247:	e8 91 04 00 00       	call   6dd <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 dc 09 00 00       	push   $0x9dc
 254:	68 b4 09 00 00       	push   $0x9b4
 259:	6a 01                	push   $0x1
 25b:	e8 7d 04 00 00       	call   6dd <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 c8 09 00 00       	push   $0x9c8
 268:	6a 01                	push   $0x1
 26a:	e8 6e 04 00 00       	call   6dd <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 68 0e 00 00    	push   0xe68
 278:	e8 3b 03 00 00       	call   5b8 <kill>
 27d:	e8 06 03 00 00       	call   588 <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 64 0e 00 00    	cmp    0xe64,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 8c 09 00 00       	push   $0x98c
 293:	68 96 09 00 00       	push   $0x996
 298:	6a 01                	push   $0x1
 29a:	e8 3e 04 00 00       	call   6dd <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 e9 09 00 00       	push   $0x9e9
 2a7:	68 b4 09 00 00       	push   $0x9b4
 2ac:	6a 01                	push   $0x1
 2ae:	e8 2a 04 00 00       	call   6dd <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 c8 09 00 00       	push   $0x9c8
 2bb:	6a 01                	push   $0x1
 2bd:	e8 1b 04 00 00       	call   6dd <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 68 0e 00 00    	push   0xe68
 2cb:	e8 e8 02 00 00       	call   5b8 <kill>
 2d0:	e8 b3 02 00 00       	call   588 <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 03 0a 00 00       	push   $0xa03
 2dd:	6a 01                	push   $0x1
 2df:	e8 f9 03 00 00       	call   6dd <printf>
   exit();
 2e4:	e8 9f 02 00 00       	call   588 <exit>
=======
 23b:	68 74 09 00 00       	push   $0x974
 240:	68 7e 09 00 00       	push   $0x97e
 245:	6a 01                	push   $0x1
 247:	e8 7a 04 00 00       	call   6c6 <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 c4 09 00 00       	push   $0x9c4
 254:	68 9c 09 00 00       	push   $0x99c
 259:	6a 01                	push   $0x1
 25b:	e8 66 04 00 00       	call   6c6 <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 b0 09 00 00       	push   $0x9b0
 268:	6a 01                	push   $0x1
 26a:	e8 57 04 00 00       	call   6c6 <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 48 0e 00 00    	push   0xe48
 278:	e8 24 03 00 00       	call   5a1 <kill>
 27d:	e8 ef 02 00 00       	call   571 <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 44 0e 00 00    	cmp    0xe44,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 74 09 00 00       	push   $0x974
 293:	68 7e 09 00 00       	push   $0x97e
 298:	6a 01                	push   $0x1
 29a:	e8 27 04 00 00       	call   6c6 <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 d1 09 00 00       	push   $0x9d1
 2a7:	68 9c 09 00 00       	push   $0x99c
 2ac:	6a 01                	push   $0x1
 2ae:	e8 13 04 00 00       	call   6c6 <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 b0 09 00 00       	push   $0x9b0
 2bb:	6a 01                	push   $0x1
 2bd:	e8 04 04 00 00       	call   6c6 <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 48 0e 00 00    	push   0xe48
 2cb:	e8 d1 02 00 00       	call   5a1 <kill>
 2d0:	e8 9c 02 00 00       	call   571 <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 eb 09 00 00       	push   $0x9eb
 2dd:	6a 01                	push   $0x1
 2df:	e8 e2 03 00 00       	call   6c6 <printf>
   exit();
 2e4:	e8 88 02 00 00       	call   571 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000002e9 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2ef:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2f1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2f4:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    

000002fa <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	53                   	push   %ebx
 2fe:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 301:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 306:	e8 f8 05 00 00       	call   903 <malloc>
  if(n_stack == 0){
 30b:	83 c4 10             	add    $0x10,%esp
 30e:	85 c0                	test   %eax,%eax
 310:	74 41                	je     353 <thread_create+0x59>
 312:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 314:	50                   	push   %eax
 315:	ff 75 10             	push   0x10(%ebp)
 318:	ff 75 0c             	push   0xc(%ebp)
 31b:	ff 75 08             	push   0x8(%ebp)
 31e:	e8 05 03 00 00       	call   628 <clone>
=======
 306:	e8 e1 05 00 00       	call   8ec <malloc>
  if(n_stack == 0){
 30b:	83 c4 10             	add    $0x10,%esp
 30e:	85 c0                	test   %eax,%eax
 310:	74 57                	je     369 <thread_create+0x6f>
 312:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 314:	b8 00 00 00 00       	mov    $0x0,%eax
 319:	eb 03                	jmp    31e <thread_create+0x24>
 31b:	83 c0 01             	add    $0x1,%eax
 31e:	83 f8 3f             	cmp    $0x3f,%eax
 321:	7f 2f                	jg     352 <thread_create+0x58>
    if(threads[i].flag==0){
 323:	8d 14 40             	lea    (%eax,%eax,2),%edx
 326:	83 3c 95 68 0e 00 00 	cmpl   $0x0,0xe68(,%edx,4)
 32d:	00 
 32e:	75 eb                	jne    31b <thread_create+0x21>
      threads[i].maddr = n_stack;
 330:	8d 14 00             	lea    (%eax,%eax,1),%edx
 333:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 336:	c1 e3 02             	shl    $0x2,%ebx
 339:	89 8b 60 0e 00 00    	mov    %ecx,0xe60(%ebx)
      threads[i].pg1addr = n_stack;
 33f:	89 8b 64 0e 00 00    	mov    %ecx,0xe64(%ebx)
      threads[i].flag = 1;
 345:	01 c2                	add    %eax,%edx
 347:	c7 04 95 68 0e 00 00 	movl   $0x1,0xe68(,%edx,4)
 34e:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 352:	51                   	push   %ecx
 353:	ff 75 10             	push   0x10(%ebp)
 356:	ff 75 0c             	push   0xc(%ebp)
 359:	ff 75 08             	push   0x8(%ebp)
 35c:	e8 b0 02 00 00       	call   611 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 323:	83 c4 10             	add    $0x10,%esp
 326:	ba 00 00 00 00       	mov    $0x0,%edx
 32b:	eb 03                	jmp    330 <thread_create+0x36>
 32d:	83 c2 01             	add    $0x1,%edx
 330:	83 fa 3f             	cmp    $0x3f,%edx
 333:	7f 19                	jg     34e <thread_create+0x54>
    if(threads[i]->flag==0){
 335:	8b 0c 95 80 0e 00 00 	mov    0xe80(,%edx,4),%ecx
 33c:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 340:	75 eb                	jne    32d <thread_create+0x33>
      threads[i]->maddr = n_stack;
 342:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 344:	8b 14 95 80 0e 00 00 	mov    0xe80(,%edx,4),%edx
 34b:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 34e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 351:	c9                   	leave  
 352:	c3                   	ret    
    return -1;
 353:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 358:	eb f4                	jmp    34e <thread_create+0x54>

0000035a <thread_join>:
=======
 361:	83 c4 10             	add    $0x10,%esp
}
 364:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 367:	c9                   	leave  
 368:	c3                   	ret    
    return -1;
 369:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 36e:	eb f4                	jmp    364 <thread_create+0x6a>

00000370 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 35a:	55                   	push   %ebp
 35b:	89 e5                	mov    %esp,%ebp
 35d:	56                   	push   %esi
 35e:	53                   	push   %ebx
 35f:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 362:	8d 45 f4             	lea    -0xc(%ebp),%eax
 365:	50                   	push   %eax
 366:	e8 c5 02 00 00       	call   630 <join>
 36b:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 36d:	83 c4 10             	add    $0x10,%esp
 370:	bb 00 00 00 00       	mov    $0x0,%ebx
 375:	eb 03                	jmp    37a <thread_join+0x20>
 377:	83 c3 01             	add    $0x1,%ebx
 37a:	83 fb 3f             	cmp    $0x3f,%ebx
 37d:	7f 23                	jg     3a2 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 37f:	8b 04 9d 80 0e 00 00 	mov    0xe80(,%ebx,4),%eax
 386:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 38a:	75 eb                	jne    377 <thread_join+0x1d>
 38c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 38f:	39 50 04             	cmp    %edx,0x4(%eax)
 392:	75 e3                	jne    377 <thread_join+0x1d>
      free(stk_addr);
 394:	83 ec 0c             	sub    $0xc,%esp
 397:	52                   	push   %edx
 398:	e8 a6 04 00 00       	call   843 <free>
 39d:	83 c4 10             	add    $0x10,%esp
 3a0:	eb d5                	jmp    377 <thread_join+0x1d>
    }
  }
  return pid;
}
 3a2:	89 f0                	mov    %esi,%eax
 3a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a7:	5b                   	pop    %ebx
 3a8:	5e                   	pop    %esi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    

000003ab <lock_acquire>:

void lock_acquire(lock_t *lock){
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	53                   	push   %ebx
 3af:	83 ec 04             	sub    $0x4,%esp
 3b2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3b5:	83 ec 08             	sub    $0x8,%esp
 3b8:	6a 01                	push   $0x1
 3ba:	53                   	push   %ebx
 3bb:	e8 29 ff ff ff       	call   2e9 <test_and_set>
 3c0:	83 c4 10             	add    $0x10,%esp
 3c3:	83 f8 01             	cmp    $0x1,%eax
 3c6:	74 ed                	je     3b5 <lock_acquire+0xa>
    ;
}
 3c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cb:	c9                   	leave  
 3cc:	c3                   	ret    

000003cd <lock_release>:

void lock_release(lock_t *lock) {
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3d0:	8b 45 08             	mov    0x8(%ebp),%eax
 3d3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <lock_init>:

void lock_init(lock_t *lock) {
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3de:	8b 45 08             	mov    0x8(%ebp),%eax
 3e1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    

000003e9 <strcpy>:
=======
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 377:	8d 45 f4             	lea    -0xc(%ebp),%eax
 37a:	50                   	push   %eax
 37b:	e8 99 02 00 00       	call   619 <join>
 380:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 382:	83 c4 04             	add    $0x4,%esp
 385:	ff 75 f4             	push   -0xc(%ebp)
 388:	e8 9f 04 00 00       	call   82c <free>
  return pid;
}
 38d:	89 d8                	mov    %ebx,%eax
 38f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 392:	c9                   	leave  
 393:	c3                   	ret    

00000394 <lock_acquire>:

void lock_acquire(lock_t *lock){
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	53                   	push   %ebx
 398:	83 ec 04             	sub    $0x4,%esp
 39b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	6a 01                	push   $0x1
 3a3:	53                   	push   %ebx
 3a4:	e8 40 ff ff ff       	call   2e9 <test_and_set>
 3a9:	83 c4 10             	add    $0x10,%esp
 3ac:	83 f8 01             	cmp    $0x1,%eax
 3af:	74 ed                	je     39e <lock_acquire+0xa>
    ;
}
 3b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b4:	c9                   	leave  
 3b5:	c3                   	ret    

000003b6 <lock_release>:

void lock_release(lock_t *lock) {
 3b6:	55                   	push   %ebp
 3b7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3b9:	8b 45 08             	mov    0x8(%ebp),%eax
 3bc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    

000003c4 <lock_init>:

void lock_init(lock_t *lock) {
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3d0:	5d                   	pop    %ebp
 3d1:	c3                   	ret    

000003d2 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 3e9:	55                   	push   %ebp
 3ea:	89 e5                	mov    %esp,%ebp
 3ec:	56                   	push   %esi
 3ed:	53                   	push   %ebx
 3ee:	8b 75 08             	mov    0x8(%ebp),%esi
 3f1:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 3d2:	55                   	push   %ebp
 3d3:	89 e5                	mov    %esp,%ebp
 3d5:	56                   	push   %esi
 3d6:	53                   	push   %ebx
 3d7:	8b 75 08             	mov    0x8(%ebp),%esi
 3da:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 3f4:	89 f0                	mov    %esi,%eax
 3f6:	89 d1                	mov    %edx,%ecx
 3f8:	83 c2 01             	add    $0x1,%edx
 3fb:	89 c3                	mov    %eax,%ebx
 3fd:	83 c0 01             	add    $0x1,%eax
 400:	0f b6 09             	movzbl (%ecx),%ecx
 403:	88 0b                	mov    %cl,(%ebx)
 405:	84 c9                	test   %cl,%cl
 407:	75 ed                	jne    3f6 <strcpy+0xd>
    ;
  return os;
}
 409:	89 f0                	mov    %esi,%eax
 40b:	5b                   	pop    %ebx
 40c:	5e                   	pop    %esi
 40d:	5d                   	pop    %ebp
 40e:	c3                   	ret    

0000040f <strcmp>:
=======
 3dd:	89 f0                	mov    %esi,%eax
 3df:	89 d1                	mov    %edx,%ecx
 3e1:	83 c2 01             	add    $0x1,%edx
 3e4:	89 c3                	mov    %eax,%ebx
 3e6:	83 c0 01             	add    $0x1,%eax
 3e9:	0f b6 09             	movzbl (%ecx),%ecx
 3ec:	88 0b                	mov    %cl,(%ebx)
 3ee:	84 c9                	test   %cl,%cl
 3f0:	75 ed                	jne    3df <strcpy+0xd>
    ;
  return os;
}
 3f2:	89 f0                	mov    %esi,%eax
 3f4:	5b                   	pop    %ebx
 3f5:	5e                   	pop    %esi
 3f6:	5d                   	pop    %ebp
 3f7:	c3                   	ret    

000003f8 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 40f:	55                   	push   %ebp
 410:	89 e5                	mov    %esp,%ebp
 412:	8b 4d 08             	mov    0x8(%ebp),%ecx
 415:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 418:	eb 06                	jmp    420 <strcmp+0x11>
    p++, q++;
 41a:	83 c1 01             	add    $0x1,%ecx
 41d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 420:	0f b6 01             	movzbl (%ecx),%eax
 423:	84 c0                	test   %al,%al
 425:	74 04                	je     42b <strcmp+0x1c>
 427:	3a 02                	cmp    (%edx),%al
 429:	74 ef                	je     41a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 42b:	0f b6 c0             	movzbl %al,%eax
 42e:	0f b6 12             	movzbl (%edx),%edx
 431:	29 d0                	sub    %edx,%eax
}
 433:	5d                   	pop    %ebp
 434:	c3                   	ret    

00000435 <strlen>:
=======
 3f8:	55                   	push   %ebp
 3f9:	89 e5                	mov    %esp,%ebp
 3fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3fe:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 401:	eb 06                	jmp    409 <strcmp+0x11>
    p++, q++;
 403:	83 c1 01             	add    $0x1,%ecx
 406:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 409:	0f b6 01             	movzbl (%ecx),%eax
 40c:	84 c0                	test   %al,%al
 40e:	74 04                	je     414 <strcmp+0x1c>
 410:	3a 02                	cmp    (%edx),%al
 412:	74 ef                	je     403 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 414:	0f b6 c0             	movzbl %al,%eax
 417:	0f b6 12             	movzbl (%edx),%edx
 41a:	29 d0                	sub    %edx,%eax
}
 41c:	5d                   	pop    %ebp
 41d:	c3                   	ret    

0000041e <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 435:	55                   	push   %ebp
 436:	89 e5                	mov    %esp,%ebp
 438:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 43b:	b8 00 00 00 00       	mov    $0x0,%eax
 440:	eb 03                	jmp    445 <strlen+0x10>
 442:	83 c0 01             	add    $0x1,%eax
 445:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 449:	75 f7                	jne    442 <strlen+0xd>
    ;
  return n;
}
 44b:	5d                   	pop    %ebp
 44c:	c3                   	ret    

0000044d <memset>:
=======
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 424:	b8 00 00 00 00       	mov    $0x0,%eax
 429:	eb 03                	jmp    42e <strlen+0x10>
 42b:	83 c0 01             	add    $0x1,%eax
 42e:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 432:	75 f7                	jne    42b <strlen+0xd>
    ;
  return n;
}
 434:	5d                   	pop    %ebp
 435:	c3                   	ret    

00000436 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 44d:	55                   	push   %ebp
 44e:	89 e5                	mov    %esp,%ebp
 450:	57                   	push   %edi
 451:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	57                   	push   %edi
 43a:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 454:	89 d7                	mov    %edx,%edi
 456:	8b 4d 10             	mov    0x10(%ebp),%ecx
 459:	8b 45 0c             	mov    0xc(%ebp),%eax
 45c:	fc                   	cld    
 45d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 45f:	89 d0                	mov    %edx,%eax
 461:	8b 7d fc             	mov    -0x4(%ebp),%edi
 464:	c9                   	leave  
 465:	c3                   	ret    

00000466 <strchr>:
=======
 43d:	89 d7                	mov    %edx,%edi
 43f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 442:	8b 45 0c             	mov    0xc(%ebp),%eax
 445:	fc                   	cld    
 446:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 448:	89 d0                	mov    %edx,%eax
 44a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 44d:	c9                   	leave  
 44e:	c3                   	ret    

0000044f <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	8b 45 08             	mov    0x8(%ebp),%eax
 46c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 470:	eb 03                	jmp    475 <strchr+0xf>
 472:	83 c0 01             	add    $0x1,%eax
 475:	0f b6 10             	movzbl (%eax),%edx
 478:	84 d2                	test   %dl,%dl
 47a:	74 06                	je     482 <strchr+0x1c>
    if(*s == c)
 47c:	38 ca                	cmp    %cl,%dl
 47e:	75 f2                	jne    472 <strchr+0xc>
 480:	eb 05                	jmp    487 <strchr+0x21>
      return (char*)s;
  return 0;
 482:	b8 00 00 00 00       	mov    $0x0,%eax
}
 487:	5d                   	pop    %ebp
 488:	c3                   	ret    

00000489 <gets>:
=======
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	8b 45 08             	mov    0x8(%ebp),%eax
 455:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 459:	eb 03                	jmp    45e <strchr+0xf>
 45b:	83 c0 01             	add    $0x1,%eax
 45e:	0f b6 10             	movzbl (%eax),%edx
 461:	84 d2                	test   %dl,%dl
 463:	74 06                	je     46b <strchr+0x1c>
    if(*s == c)
 465:	38 ca                	cmp    %cl,%dl
 467:	75 f2                	jne    45b <strchr+0xc>
 469:	eb 05                	jmp    470 <strchr+0x21>
      return (char*)s;
  return 0;
 46b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 470:	5d                   	pop    %ebp
 471:	c3                   	ret    

00000472 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 489:	55                   	push   %ebp
 48a:	89 e5                	mov    %esp,%ebp
 48c:	57                   	push   %edi
 48d:	56                   	push   %esi
 48e:	53                   	push   %ebx
 48f:	83 ec 1c             	sub    $0x1c,%esp
 492:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	57                   	push   %edi
 476:	56                   	push   %esi
 477:	53                   	push   %ebx
 478:	83 ec 1c             	sub    $0x1c,%esp
 47b:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 495:	bb 00 00 00 00       	mov    $0x0,%ebx
 49a:	89 de                	mov    %ebx,%esi
 49c:	83 c3 01             	add    $0x1,%ebx
 49f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4a2:	7d 2e                	jge    4d2 <gets+0x49>
    cc = read(0, &c, 1);
 4a4:	83 ec 04             	sub    $0x4,%esp
 4a7:	6a 01                	push   $0x1
 4a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ac:	50                   	push   %eax
 4ad:	6a 00                	push   $0x0
 4af:	e8 ec 00 00 00       	call   5a0 <read>
    if(cc < 1)
 4b4:	83 c4 10             	add    $0x10,%esp
 4b7:	85 c0                	test   %eax,%eax
 4b9:	7e 17                	jle    4d2 <gets+0x49>
      break;
    buf[i++] = c;
 4bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4c2:	3c 0a                	cmp    $0xa,%al
 4c4:	0f 94 c2             	sete   %dl
 4c7:	3c 0d                	cmp    $0xd,%al
 4c9:	0f 94 c0             	sete   %al
 4cc:	08 c2                	or     %al,%dl
 4ce:	74 ca                	je     49a <gets+0x11>
    buf[i++] = c;
 4d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4d6:	89 f8                	mov    %edi,%eax
 4d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4db:	5b                   	pop    %ebx
 4dc:	5e                   	pop    %esi
 4dd:	5f                   	pop    %edi
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    

000004e0 <stat>:
=======
 47e:	bb 00 00 00 00       	mov    $0x0,%ebx
 483:	89 de                	mov    %ebx,%esi
 485:	83 c3 01             	add    $0x1,%ebx
 488:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 48b:	7d 2e                	jge    4bb <gets+0x49>
    cc = read(0, &c, 1);
 48d:	83 ec 04             	sub    $0x4,%esp
 490:	6a 01                	push   $0x1
 492:	8d 45 e7             	lea    -0x19(%ebp),%eax
 495:	50                   	push   %eax
 496:	6a 00                	push   $0x0
 498:	e8 ec 00 00 00       	call   589 <read>
    if(cc < 1)
 49d:	83 c4 10             	add    $0x10,%esp
 4a0:	85 c0                	test   %eax,%eax
 4a2:	7e 17                	jle    4bb <gets+0x49>
      break;
    buf[i++] = c;
 4a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4a8:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4ab:	3c 0a                	cmp    $0xa,%al
 4ad:	0f 94 c2             	sete   %dl
 4b0:	3c 0d                	cmp    $0xd,%al
 4b2:	0f 94 c0             	sete   %al
 4b5:	08 c2                	or     %al,%dl
 4b7:	74 ca                	je     483 <gets+0x11>
    buf[i++] = c;
 4b9:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4bb:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4bf:	89 f8                	mov    %edi,%eax
 4c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c4:	5b                   	pop    %ebx
 4c5:	5e                   	pop    %esi
 4c6:	5f                   	pop    %edi
 4c7:	5d                   	pop    %ebp
 4c8:	c3                   	ret    

000004c9 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	56                   	push   %esi
 4e4:	53                   	push   %ebx
=======
 4c9:	55                   	push   %ebp
 4ca:	89 e5                	mov    %esp,%ebp
 4cc:	56                   	push   %esi
 4cd:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 4e5:	83 ec 08             	sub    $0x8,%esp
 4e8:	6a 00                	push   $0x0
 4ea:	ff 75 08             	push   0x8(%ebp)
 4ed:	e8 d6 00 00 00       	call   5c8 <open>
  if(fd < 0)
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	85 c0                	test   %eax,%eax
 4f7:	78 24                	js     51d <stat+0x3d>
 4f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4fb:	83 ec 08             	sub    $0x8,%esp
 4fe:	ff 75 0c             	push   0xc(%ebp)
 501:	50                   	push   %eax
 502:	e8 d9 00 00 00       	call   5e0 <fstat>
 507:	89 c6                	mov    %eax,%esi
  close(fd);
 509:	89 1c 24             	mov    %ebx,(%esp)
 50c:	e8 9f 00 00 00       	call   5b0 <close>
  return r;
 511:	83 c4 10             	add    $0x10,%esp
}
 514:	89 f0                	mov    %esi,%eax
 516:	8d 65 f8             	lea    -0x8(%ebp),%esp
 519:	5b                   	pop    %ebx
 51a:	5e                   	pop    %esi
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    
    return -1;
 51d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 522:	eb f0                	jmp    514 <stat+0x34>

00000524 <atoi>:
=======
 4ce:	83 ec 08             	sub    $0x8,%esp
 4d1:	6a 00                	push   $0x0
 4d3:	ff 75 08             	push   0x8(%ebp)
 4d6:	e8 d6 00 00 00       	call   5b1 <open>
  if(fd < 0)
 4db:	83 c4 10             	add    $0x10,%esp
 4de:	85 c0                	test   %eax,%eax
 4e0:	78 24                	js     506 <stat+0x3d>
 4e2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4e4:	83 ec 08             	sub    $0x8,%esp
 4e7:	ff 75 0c             	push   0xc(%ebp)
 4ea:	50                   	push   %eax
 4eb:	e8 d9 00 00 00       	call   5c9 <fstat>
 4f0:	89 c6                	mov    %eax,%esi
  close(fd);
 4f2:	89 1c 24             	mov    %ebx,(%esp)
 4f5:	e8 9f 00 00 00       	call   599 <close>
  return r;
 4fa:	83 c4 10             	add    $0x10,%esp
}
 4fd:	89 f0                	mov    %esi,%eax
 4ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
 502:	5b                   	pop    %ebx
 503:	5e                   	pop    %esi
 504:	5d                   	pop    %ebp
 505:	c3                   	ret    
    return -1;
 506:	be ff ff ff ff       	mov    $0xffffffff,%esi
 50b:	eb f0                	jmp    4fd <stat+0x34>

0000050d <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	53                   	push   %ebx
 528:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 52b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 530:	eb 10                	jmp    542 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 532:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 535:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 538:	83 c1 01             	add    $0x1,%ecx
 53b:	0f be c0             	movsbl %al,%eax
 53e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 542:	0f b6 01             	movzbl (%ecx),%eax
 545:	8d 58 d0             	lea    -0x30(%eax),%ebx
 548:	80 fb 09             	cmp    $0x9,%bl
 54b:	76 e5                	jbe    532 <atoi+0xe>
  return n;
}
 54d:	89 d0                	mov    %edx,%eax
 54f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 552:	c9                   	leave  
 553:	c3                   	ret    

00000554 <memmove>:
=======
 50d:	55                   	push   %ebp
 50e:	89 e5                	mov    %esp,%ebp
 510:	53                   	push   %ebx
 511:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 514:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 519:	eb 10                	jmp    52b <atoi+0x1e>
    n = n*10 + *s++ - '0';
 51b:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 51e:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 521:	83 c1 01             	add    $0x1,%ecx
 524:	0f be c0             	movsbl %al,%eax
 527:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 52b:	0f b6 01             	movzbl (%ecx),%eax
 52e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 531:	80 fb 09             	cmp    $0x9,%bl
 534:	76 e5                	jbe    51b <atoi+0xe>
  return n;
}
 536:	89 d0                	mov    %edx,%eax
 538:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 53b:	c9                   	leave  
 53c:	c3                   	ret    

0000053d <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	56                   	push   %esi
 558:	53                   	push   %ebx
 559:	8b 75 08             	mov    0x8(%ebp),%esi
 55c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 55f:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	56                   	push   %esi
 541:	53                   	push   %ebx
 542:	8b 75 08             	mov    0x8(%ebp),%esi
 545:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 548:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 562:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 564:	eb 0d                	jmp    573 <memmove+0x1f>
    *dst++ = *src++;
 566:	0f b6 01             	movzbl (%ecx),%eax
 569:	88 02                	mov    %al,(%edx)
 56b:	8d 49 01             	lea    0x1(%ecx),%ecx
 56e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 571:	89 d8                	mov    %ebx,%eax
 573:	8d 58 ff             	lea    -0x1(%eax),%ebx
 576:	85 c0                	test   %eax,%eax
 578:	7f ec                	jg     566 <memmove+0x12>
  return vdst;
}
 57a:	89 f0                	mov    %esi,%eax
 57c:	5b                   	pop    %ebx
 57d:	5e                   	pop    %esi
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    

00000580 <fork>:
=======
 54b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 54d:	eb 0d                	jmp    55c <memmove+0x1f>
    *dst++ = *src++;
 54f:	0f b6 01             	movzbl (%ecx),%eax
 552:	88 02                	mov    %al,(%edx)
 554:	8d 49 01             	lea    0x1(%ecx),%ecx
 557:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 55a:	89 d8                	mov    %ebx,%eax
 55c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 55f:	85 c0                	test   %eax,%eax
 561:	7f ec                	jg     54f <memmove+0x12>
  return vdst;
}
 563:	89 f0                	mov    %esi,%eax
 565:	5b                   	pop    %ebx
 566:	5e                   	pop    %esi
 567:	5d                   	pop    %ebp
 568:	c3                   	ret    

00000569 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 580:	b8 01 00 00 00       	mov    $0x1,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <exit>:
SYSCALL(exit)
 588:	b8 02 00 00 00       	mov    $0x2,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <wait>:
SYSCALL(wait)
 590:	b8 03 00 00 00       	mov    $0x3,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <pipe>:
SYSCALL(pipe)
 598:	b8 04 00 00 00       	mov    $0x4,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <read>:
SYSCALL(read)
 5a0:	b8 05 00 00 00       	mov    $0x5,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <write>:
SYSCALL(write)
 5a8:	b8 10 00 00 00       	mov    $0x10,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <close>:
SYSCALL(close)
 5b0:	b8 15 00 00 00       	mov    $0x15,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <kill>:
SYSCALL(kill)
 5b8:	b8 06 00 00 00       	mov    $0x6,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <exec>:
SYSCALL(exec)
 5c0:	b8 07 00 00 00       	mov    $0x7,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <open>:
SYSCALL(open)
 5c8:	b8 0f 00 00 00       	mov    $0xf,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <mknod>:
SYSCALL(mknod)
 5d0:	b8 11 00 00 00       	mov    $0x11,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <unlink>:
SYSCALL(unlink)
 5d8:	b8 12 00 00 00       	mov    $0x12,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <fstat>:
SYSCALL(fstat)
 5e0:	b8 08 00 00 00       	mov    $0x8,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <link>:
SYSCALL(link)
 5e8:	b8 13 00 00 00       	mov    $0x13,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <mkdir>:
SYSCALL(mkdir)
 5f0:	b8 14 00 00 00       	mov    $0x14,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <chdir>:
SYSCALL(chdir)
 5f8:	b8 09 00 00 00       	mov    $0x9,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <dup>:
SYSCALL(dup)
 600:	b8 0a 00 00 00       	mov    $0xa,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <getpid>:
SYSCALL(getpid)
 608:	b8 0b 00 00 00       	mov    $0xb,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <sbrk>:
SYSCALL(sbrk)
 610:	b8 0c 00 00 00       	mov    $0xc,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <sleep>:
SYSCALL(sleep)
 618:	b8 0d 00 00 00       	mov    $0xd,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <uptime>:
SYSCALL(uptime)
 620:	b8 0e 00 00 00       	mov    $0xe,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <clone>:
SYSCALL(clone)
 628:	b8 16 00 00 00       	mov    $0x16,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <join>:
 630:	b8 17 00 00 00       	mov    $0x17,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <putc>:
=======
 569:	b8 01 00 00 00       	mov    $0x1,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <exit>:
SYSCALL(exit)
 571:	b8 02 00 00 00       	mov    $0x2,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <wait>:
SYSCALL(wait)
 579:	b8 03 00 00 00       	mov    $0x3,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <pipe>:
SYSCALL(pipe)
 581:	b8 04 00 00 00       	mov    $0x4,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <read>:
SYSCALL(read)
 589:	b8 05 00 00 00       	mov    $0x5,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <write>:
SYSCALL(write)
 591:	b8 10 00 00 00       	mov    $0x10,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <close>:
SYSCALL(close)
 599:	b8 15 00 00 00       	mov    $0x15,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <kill>:
SYSCALL(kill)
 5a1:	b8 06 00 00 00       	mov    $0x6,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <exec>:
SYSCALL(exec)
 5a9:	b8 07 00 00 00       	mov    $0x7,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <open>:
SYSCALL(open)
 5b1:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <mknod>:
SYSCALL(mknod)
 5b9:	b8 11 00 00 00       	mov    $0x11,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <unlink>:
SYSCALL(unlink)
 5c1:	b8 12 00 00 00       	mov    $0x12,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <fstat>:
SYSCALL(fstat)
 5c9:	b8 08 00 00 00       	mov    $0x8,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <link>:
SYSCALL(link)
 5d1:	b8 13 00 00 00       	mov    $0x13,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <mkdir>:
SYSCALL(mkdir)
 5d9:	b8 14 00 00 00       	mov    $0x14,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <chdir>:
SYSCALL(chdir)
 5e1:	b8 09 00 00 00       	mov    $0x9,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <dup>:
SYSCALL(dup)
 5e9:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <getpid>:
SYSCALL(getpid)
 5f1:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <sbrk>:
SYSCALL(sbrk)
 5f9:	b8 0c 00 00 00       	mov    $0xc,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <sleep>:
SYSCALL(sleep)
 601:	b8 0d 00 00 00       	mov    $0xd,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <uptime>:
SYSCALL(uptime)
 609:	b8 0e 00 00 00       	mov    $0xe,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <clone>:
SYSCALL(clone)
 611:	b8 16 00 00 00       	mov    $0x16,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <join>:
 619:	b8 17 00 00 00       	mov    $0x17,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 638:	55                   	push   %ebp
 639:	89 e5                	mov    %esp,%ebp
 63b:	83 ec 1c             	sub    $0x1c,%esp
 63e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 641:	6a 01                	push   $0x1
 643:	8d 55 f4             	lea    -0xc(%ebp),%edx
 646:	52                   	push   %edx
 647:	50                   	push   %eax
 648:	e8 5b ff ff ff       	call   5a8 <write>
}
 64d:	83 c4 10             	add    $0x10,%esp
 650:	c9                   	leave  
 651:	c3                   	ret    

00000652 <printint>:
=======
 621:	55                   	push   %ebp
 622:	89 e5                	mov    %esp,%ebp
 624:	83 ec 1c             	sub    $0x1c,%esp
 627:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 62a:	6a 01                	push   $0x1
 62c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 62f:	52                   	push   %edx
 630:	50                   	push   %eax
 631:	e8 5b ff ff ff       	call   591 <write>
}
 636:	83 c4 10             	add    $0x10,%esp
 639:	c9                   	leave  
 63a:	c3                   	ret    

0000063b <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 652:	55                   	push   %ebp
 653:	89 e5                	mov    %esp,%ebp
 655:	57                   	push   %edi
 656:	56                   	push   %esi
 657:	53                   	push   %ebx
 658:	83 ec 2c             	sub    $0x2c,%esp
 65b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 65e:	89 d0                	mov    %edx,%eax
 660:	89 ce                	mov    %ecx,%esi
=======
 63b:	55                   	push   %ebp
 63c:	89 e5                	mov    %esp,%ebp
 63e:	57                   	push   %edi
 63f:	56                   	push   %esi
 640:	53                   	push   %ebx
 641:	83 ec 2c             	sub    $0x2c,%esp
 644:	89 45 d0             	mov    %eax,-0x30(%ebp)
 647:	89 d0                	mov    %edx,%eax
 649:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 662:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 666:	0f 95 c1             	setne  %cl
 669:	c1 ea 1f             	shr    $0x1f,%edx
 66c:	84 d1                	test   %dl,%cl
 66e:	74 44                	je     6b4 <printint+0x62>
    neg = 1;
    x = -xx;
 670:	f7 d8                	neg    %eax
 672:	89 c1                	mov    %eax,%ecx
    neg = 1;
 674:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 64b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 64f:	0f 95 c1             	setne  %cl
 652:	c1 ea 1f             	shr    $0x1f,%edx
 655:	84 d1                	test   %dl,%cl
 657:	74 44                	je     69d <printint+0x62>
    neg = 1;
    x = -xx;
 659:	f7 d8                	neg    %eax
 65b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 65d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 67b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 680:	89 c8                	mov    %ecx,%eax
 682:	ba 00 00 00 00       	mov    $0x0,%edx
 687:	f7 f6                	div    %esi
 689:	89 df                	mov    %ebx,%edi
 68b:	83 c3 01             	add    $0x1,%ebx
 68e:	0f b6 92 94 0a 00 00 	movzbl 0xa94(%edx),%edx
 695:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 699:	89 ca                	mov    %ecx,%edx
 69b:	89 c1                	mov    %eax,%ecx
 69d:	39 d6                	cmp    %edx,%esi
 69f:	76 df                	jbe    680 <printint+0x2e>
  if(neg)
 6a1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6a5:	74 31                	je     6d8 <printint+0x86>
    buf[i++] = '-';
 6a7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6ac:	8d 5f 02             	lea    0x2(%edi),%ebx
 6af:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6b2:	eb 17                	jmp    6cb <printint+0x79>
    x = xx;
 6b4:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6b6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6bd:	eb bc                	jmp    67b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6bf:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6c4:	89 f0                	mov    %esi,%eax
 6c6:	e8 6d ff ff ff       	call   638 <putc>
  while(--i >= 0)
 6cb:	83 eb 01             	sub    $0x1,%ebx
 6ce:	79 ef                	jns    6bf <printint+0x6d>
}
 6d0:	83 c4 2c             	add    $0x2c,%esp
 6d3:	5b                   	pop    %ebx
 6d4:	5e                   	pop    %esi
 6d5:	5f                   	pop    %edi
 6d6:	5d                   	pop    %ebp
 6d7:	c3                   	ret    
 6d8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6db:	eb ee                	jmp    6cb <printint+0x79>

000006dd <printf>:
=======
 664:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 669:	89 c8                	mov    %ecx,%eax
 66b:	ba 00 00 00 00       	mov    $0x0,%edx
 670:	f7 f6                	div    %esi
 672:	89 df                	mov    %ebx,%edi
 674:	83 c3 01             	add    $0x1,%ebx
 677:	0f b6 92 7c 0a 00 00 	movzbl 0xa7c(%edx),%edx
 67e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 682:	89 ca                	mov    %ecx,%edx
 684:	89 c1                	mov    %eax,%ecx
 686:	39 d6                	cmp    %edx,%esi
 688:	76 df                	jbe    669 <printint+0x2e>
  if(neg)
 68a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 68e:	74 31                	je     6c1 <printint+0x86>
    buf[i++] = '-';
 690:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 695:	8d 5f 02             	lea    0x2(%edi),%ebx
 698:	8b 75 d0             	mov    -0x30(%ebp),%esi
 69b:	eb 17                	jmp    6b4 <printint+0x79>
    x = xx;
 69d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 69f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6a6:	eb bc                	jmp    664 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6a8:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6ad:	89 f0                	mov    %esi,%eax
 6af:	e8 6d ff ff ff       	call   621 <putc>
  while(--i >= 0)
 6b4:	83 eb 01             	sub    $0x1,%ebx
 6b7:	79 ef                	jns    6a8 <printint+0x6d>
}
 6b9:	83 c4 2c             	add    $0x2c,%esp
 6bc:	5b                   	pop    %ebx
 6bd:	5e                   	pop    %esi
 6be:	5f                   	pop    %edi
 6bf:	5d                   	pop    %ebp
 6c0:	c3                   	ret    
 6c1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6c4:	eb ee                	jmp    6b4 <printint+0x79>

000006c6 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 6dd:	55                   	push   %ebp
 6de:	89 e5                	mov    %esp,%ebp
 6e0:	57                   	push   %edi
 6e1:	56                   	push   %esi
 6e2:	53                   	push   %ebx
 6e3:	83 ec 1c             	sub    $0x1c,%esp
=======
 6c6:	55                   	push   %ebp
 6c7:	89 e5                	mov    %esp,%ebp
 6c9:	57                   	push   %edi
 6ca:	56                   	push   %esi
 6cb:	53                   	push   %ebx
 6cc:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 6e6:	8d 45 10             	lea    0x10(%ebp),%eax
 6e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6ec:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6f1:	bb 00 00 00 00       	mov    $0x0,%ebx
 6f6:	eb 14                	jmp    70c <printf+0x2f>
=======
 6cf:	8d 45 10             	lea    0x10(%ebp),%eax
 6d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6d5:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6da:	bb 00 00 00 00       	mov    $0x0,%ebx
 6df:	eb 14                	jmp    6f5 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 6f8:	89 fa                	mov    %edi,%edx
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	e8 36 ff ff ff       	call   638 <putc>
 702:	eb 05                	jmp    709 <printf+0x2c>
      }
    } else if(state == '%'){
 704:	83 fe 25             	cmp    $0x25,%esi
 707:	74 25                	je     72e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 709:	83 c3 01             	add    $0x1,%ebx
 70c:	8b 45 0c             	mov    0xc(%ebp),%eax
 70f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 713:	84 c0                	test   %al,%al
 715:	0f 84 20 01 00 00    	je     83b <printf+0x15e>
    c = fmt[i] & 0xff;
 71b:	0f be f8             	movsbl %al,%edi
 71e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 721:	85 f6                	test   %esi,%esi
 723:	75 df                	jne    704 <printf+0x27>
      if(c == '%'){
 725:	83 f8 25             	cmp    $0x25,%eax
 728:	75 ce                	jne    6f8 <printf+0x1b>
        state = '%';
 72a:	89 c6                	mov    %eax,%esi
 72c:	eb db                	jmp    709 <printf+0x2c>
      if(c == 'd'){
 72e:	83 f8 25             	cmp    $0x25,%eax
 731:	0f 84 cf 00 00 00    	je     806 <printf+0x129>
 737:	0f 8c dd 00 00 00    	jl     81a <printf+0x13d>
 73d:	83 f8 78             	cmp    $0x78,%eax
 740:	0f 8f d4 00 00 00    	jg     81a <printf+0x13d>
 746:	83 f8 63             	cmp    $0x63,%eax
 749:	0f 8c cb 00 00 00    	jl     81a <printf+0x13d>
 74f:	83 e8 63             	sub    $0x63,%eax
 752:	83 f8 15             	cmp    $0x15,%eax
 755:	0f 87 bf 00 00 00    	ja     81a <printf+0x13d>
 75b:	ff 24 85 3c 0a 00 00 	jmp    *0xa3c(,%eax,4)
        printint(fd, *ap, 10, 1);
 762:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 765:	8b 17                	mov    (%edi),%edx
 767:	83 ec 0c             	sub    $0xc,%esp
 76a:	6a 01                	push   $0x1
 76c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 771:	8b 45 08             	mov    0x8(%ebp),%eax
 774:	e8 d9 fe ff ff       	call   652 <printint>
        ap++;
 779:	83 c7 04             	add    $0x4,%edi
 77c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 77f:	83 c4 10             	add    $0x10,%esp
=======
 6e1:	89 fa                	mov    %edi,%edx
 6e3:	8b 45 08             	mov    0x8(%ebp),%eax
 6e6:	e8 36 ff ff ff       	call   621 <putc>
 6eb:	eb 05                	jmp    6f2 <printf+0x2c>
      }
    } else if(state == '%'){
 6ed:	83 fe 25             	cmp    $0x25,%esi
 6f0:	74 25                	je     717 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6f2:	83 c3 01             	add    $0x1,%ebx
 6f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6f8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6fc:	84 c0                	test   %al,%al
 6fe:	0f 84 20 01 00 00    	je     824 <printf+0x15e>
    c = fmt[i] & 0xff;
 704:	0f be f8             	movsbl %al,%edi
 707:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 70a:	85 f6                	test   %esi,%esi
 70c:	75 df                	jne    6ed <printf+0x27>
      if(c == '%'){
 70e:	83 f8 25             	cmp    $0x25,%eax
 711:	75 ce                	jne    6e1 <printf+0x1b>
        state = '%';
 713:	89 c6                	mov    %eax,%esi
 715:	eb db                	jmp    6f2 <printf+0x2c>
      if(c == 'd'){
 717:	83 f8 25             	cmp    $0x25,%eax
 71a:	0f 84 cf 00 00 00    	je     7ef <printf+0x129>
 720:	0f 8c dd 00 00 00    	jl     803 <printf+0x13d>
 726:	83 f8 78             	cmp    $0x78,%eax
 729:	0f 8f d4 00 00 00    	jg     803 <printf+0x13d>
 72f:	83 f8 63             	cmp    $0x63,%eax
 732:	0f 8c cb 00 00 00    	jl     803 <printf+0x13d>
 738:	83 e8 63             	sub    $0x63,%eax
 73b:	83 f8 15             	cmp    $0x15,%eax
 73e:	0f 87 bf 00 00 00    	ja     803 <printf+0x13d>
 744:	ff 24 85 24 0a 00 00 	jmp    *0xa24(,%eax,4)
        printint(fd, *ap, 10, 1);
 74b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 74e:	8b 17                	mov    (%edi),%edx
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	6a 01                	push   $0x1
 755:	b9 0a 00 00 00       	mov    $0xa,%ecx
 75a:	8b 45 08             	mov    0x8(%ebp),%eax
 75d:	e8 d9 fe ff ff       	call   63b <printint>
        ap++;
 762:	83 c7 04             	add    $0x4,%edi
 765:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 768:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 782:	be 00 00 00 00       	mov    $0x0,%esi
 787:	eb 80                	jmp    709 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 789:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 78c:	8b 17                	mov    (%edi),%edx
 78e:	83 ec 0c             	sub    $0xc,%esp
 791:	6a 00                	push   $0x0
 793:	b9 10 00 00 00       	mov    $0x10,%ecx
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	e8 b2 fe ff ff       	call   652 <printint>
        ap++;
 7a0:	83 c7 04             	add    $0x4,%edi
 7a3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7a9:	be 00 00 00 00       	mov    $0x0,%esi
 7ae:	e9 56 ff ff ff       	jmp    709 <printf+0x2c>
        s = (char*)*ap;
 7b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b6:	8b 30                	mov    (%eax),%esi
        ap++;
 7b8:	83 c0 04             	add    $0x4,%eax
 7bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7be:	85 f6                	test   %esi,%esi
 7c0:	75 15                	jne    7d7 <printf+0xfa>
          s = "(null)";
 7c2:	be 33 0a 00 00       	mov    $0xa33,%esi
 7c7:	eb 0e                	jmp    7d7 <printf+0xfa>
          putc(fd, *s);
 7c9:	0f be d2             	movsbl %dl,%edx
 7cc:	8b 45 08             	mov    0x8(%ebp),%eax
 7cf:	e8 64 fe ff ff       	call   638 <putc>
          s++;
 7d4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7d7:	0f b6 16             	movzbl (%esi),%edx
 7da:	84 d2                	test   %dl,%dl
 7dc:	75 eb                	jne    7c9 <printf+0xec>
      state = 0;
 7de:	be 00 00 00 00       	mov    $0x0,%esi
 7e3:	e9 21 ff ff ff       	jmp    709 <printf+0x2c>
        putc(fd, *ap);
 7e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7eb:	0f be 17             	movsbl (%edi),%edx
 7ee:	8b 45 08             	mov    0x8(%ebp),%eax
 7f1:	e8 42 fe ff ff       	call   638 <putc>
        ap++;
 7f6:	83 c7 04             	add    $0x4,%edi
 7f9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7fc:	be 00 00 00 00       	mov    $0x0,%esi
 801:	e9 03 ff ff ff       	jmp    709 <printf+0x2c>
        putc(fd, c);
 806:	89 fa                	mov    %edi,%edx
 808:	8b 45 08             	mov    0x8(%ebp),%eax
 80b:	e8 28 fe ff ff       	call   638 <putc>
      state = 0;
 810:	be 00 00 00 00       	mov    $0x0,%esi
 815:	e9 ef fe ff ff       	jmp    709 <printf+0x2c>
        putc(fd, '%');
 81a:	ba 25 00 00 00       	mov    $0x25,%edx
 81f:	8b 45 08             	mov    0x8(%ebp),%eax
 822:	e8 11 fe ff ff       	call   638 <putc>
        putc(fd, c);
 827:	89 fa                	mov    %edi,%edx
 829:	8b 45 08             	mov    0x8(%ebp),%eax
 82c:	e8 07 fe ff ff       	call   638 <putc>
      state = 0;
 831:	be 00 00 00 00       	mov    $0x0,%esi
 836:	e9 ce fe ff ff       	jmp    709 <printf+0x2c>
    }
  }
}
 83b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 83e:	5b                   	pop    %ebx
 83f:	5e                   	pop    %esi
 840:	5f                   	pop    %edi
 841:	5d                   	pop    %ebp
 842:	c3                   	ret    

00000843 <free>:
=======
 76b:	be 00 00 00 00       	mov    $0x0,%esi
 770:	eb 80                	jmp    6f2 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 772:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 775:	8b 17                	mov    (%edi),%edx
 777:	83 ec 0c             	sub    $0xc,%esp
 77a:	6a 00                	push   $0x0
 77c:	b9 10 00 00 00       	mov    $0x10,%ecx
 781:	8b 45 08             	mov    0x8(%ebp),%eax
 784:	e8 b2 fe ff ff       	call   63b <printint>
        ap++;
 789:	83 c7 04             	add    $0x4,%edi
 78c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 78f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 792:	be 00 00 00 00       	mov    $0x0,%esi
 797:	e9 56 ff ff ff       	jmp    6f2 <printf+0x2c>
        s = (char*)*ap;
 79c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79f:	8b 30                	mov    (%eax),%esi
        ap++;
 7a1:	83 c0 04             	add    $0x4,%eax
 7a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7a7:	85 f6                	test   %esi,%esi
 7a9:	75 15                	jne    7c0 <printf+0xfa>
          s = "(null)";
 7ab:	be 1b 0a 00 00       	mov    $0xa1b,%esi
 7b0:	eb 0e                	jmp    7c0 <printf+0xfa>
          putc(fd, *s);
 7b2:	0f be d2             	movsbl %dl,%edx
 7b5:	8b 45 08             	mov    0x8(%ebp),%eax
 7b8:	e8 64 fe ff ff       	call   621 <putc>
          s++;
 7bd:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7c0:	0f b6 16             	movzbl (%esi),%edx
 7c3:	84 d2                	test   %dl,%dl
 7c5:	75 eb                	jne    7b2 <printf+0xec>
      state = 0;
 7c7:	be 00 00 00 00       	mov    $0x0,%esi
 7cc:	e9 21 ff ff ff       	jmp    6f2 <printf+0x2c>
        putc(fd, *ap);
 7d1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7d4:	0f be 17             	movsbl (%edi),%edx
 7d7:	8b 45 08             	mov    0x8(%ebp),%eax
 7da:	e8 42 fe ff ff       	call   621 <putc>
        ap++;
 7df:	83 c7 04             	add    $0x4,%edi
 7e2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7e5:	be 00 00 00 00       	mov    $0x0,%esi
 7ea:	e9 03 ff ff ff       	jmp    6f2 <printf+0x2c>
        putc(fd, c);
 7ef:	89 fa                	mov    %edi,%edx
 7f1:	8b 45 08             	mov    0x8(%ebp),%eax
 7f4:	e8 28 fe ff ff       	call   621 <putc>
      state = 0;
 7f9:	be 00 00 00 00       	mov    $0x0,%esi
 7fe:	e9 ef fe ff ff       	jmp    6f2 <printf+0x2c>
        putc(fd, '%');
 803:	ba 25 00 00 00       	mov    $0x25,%edx
 808:	8b 45 08             	mov    0x8(%ebp),%eax
 80b:	e8 11 fe ff ff       	call   621 <putc>
        putc(fd, c);
 810:	89 fa                	mov    %edi,%edx
 812:	8b 45 08             	mov    0x8(%ebp),%eax
 815:	e8 07 fe ff ff       	call   621 <putc>
      state = 0;
 81a:	be 00 00 00 00       	mov    $0x0,%esi
 81f:	e9 ce fe ff ff       	jmp    6f2 <printf+0x2c>
    }
  }
}
 824:	8d 65 f4             	lea    -0xc(%ebp),%esp
 827:	5b                   	pop    %ebx
 828:	5e                   	pop    %esi
 829:	5f                   	pop    %edi
 82a:	5d                   	pop    %ebp
 82b:	c3                   	ret    

0000082c <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 843:	55                   	push   %ebp
 844:	89 e5                	mov    %esp,%ebp
 846:	57                   	push   %edi
 847:	56                   	push   %esi
 848:	53                   	push   %ebx
 849:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 84c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84f:	a1 80 0f 00 00       	mov    0xf80,%eax
 854:	eb 02                	jmp    858 <free+0x15>
 856:	89 d0                	mov    %edx,%eax
 858:	39 c8                	cmp    %ecx,%eax
 85a:	73 04                	jae    860 <free+0x1d>
 85c:	39 08                	cmp    %ecx,(%eax)
 85e:	77 12                	ja     872 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 860:	8b 10                	mov    (%eax),%edx
 862:	39 c2                	cmp    %eax,%edx
 864:	77 f0                	ja     856 <free+0x13>
 866:	39 c8                	cmp    %ecx,%eax
 868:	72 08                	jb     872 <free+0x2f>
 86a:	39 ca                	cmp    %ecx,%edx
 86c:	77 04                	ja     872 <free+0x2f>
 86e:	89 d0                	mov    %edx,%eax
 870:	eb e6                	jmp    858 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 872:	8b 73 fc             	mov    -0x4(%ebx),%esi
 875:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 878:	8b 10                	mov    (%eax),%edx
 87a:	39 d7                	cmp    %edx,%edi
 87c:	74 19                	je     897 <free+0x54>
=======
 82c:	55                   	push   %ebp
 82d:	89 e5                	mov    %esp,%ebp
 82f:	57                   	push   %edi
 830:	56                   	push   %esi
 831:	53                   	push   %ebx
 832:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 835:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 838:	a1 60 11 00 00       	mov    0x1160,%eax
 83d:	eb 02                	jmp    841 <free+0x15>
 83f:	89 d0                	mov    %edx,%eax
 841:	39 c8                	cmp    %ecx,%eax
 843:	73 04                	jae    849 <free+0x1d>
 845:	39 08                	cmp    %ecx,(%eax)
 847:	77 12                	ja     85b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 849:	8b 10                	mov    (%eax),%edx
 84b:	39 c2                	cmp    %eax,%edx
 84d:	77 f0                	ja     83f <free+0x13>
 84f:	39 c8                	cmp    %ecx,%eax
 851:	72 08                	jb     85b <free+0x2f>
 853:	39 ca                	cmp    %ecx,%edx
 855:	77 04                	ja     85b <free+0x2f>
 857:	89 d0                	mov    %edx,%eax
 859:	eb e6                	jmp    841 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 85b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 85e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 861:	8b 10                	mov    (%eax),%edx
 863:	39 d7                	cmp    %edx,%edi
 865:	74 19                	je     880 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 87e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 881:	8b 50 04             	mov    0x4(%eax),%edx
 884:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 887:	39 ce                	cmp    %ecx,%esi
 889:	74 1b                	je     8a6 <free+0x63>
=======
 867:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 86a:	8b 50 04             	mov    0x4(%eax),%edx
 86d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 870:	39 ce                	cmp    %ecx,%esi
 872:	74 1b                	je     88f <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 88b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 88d:	a3 80 0f 00 00       	mov    %eax,0xf80
}
 892:	5b                   	pop    %ebx
 893:	5e                   	pop    %esi
 894:	5f                   	pop    %edi
 895:	5d                   	pop    %ebp
 896:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 897:	03 72 04             	add    0x4(%edx),%esi
 89a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 89d:	8b 10                	mov    (%eax),%edx
 89f:	8b 12                	mov    (%edx),%edx
 8a1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8a4:	eb db                	jmp    881 <free+0x3e>
    p->s.size += bp->s.size;
 8a6:	03 53 fc             	add    -0x4(%ebx),%edx
 8a9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8ac:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8af:	89 10                	mov    %edx,(%eax)
 8b1:	eb da                	jmp    88d <free+0x4a>

000008b3 <morecore>:
=======
 874:	89 08                	mov    %ecx,(%eax)
  freep = p;
 876:	a3 60 11 00 00       	mov    %eax,0x1160
}
 87b:	5b                   	pop    %ebx
 87c:	5e                   	pop    %esi
 87d:	5f                   	pop    %edi
 87e:	5d                   	pop    %ebp
 87f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 880:	03 72 04             	add    0x4(%edx),%esi
 883:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 886:	8b 10                	mov    (%eax),%edx
 888:	8b 12                	mov    (%edx),%edx
 88a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 88d:	eb db                	jmp    86a <free+0x3e>
    p->s.size += bp->s.size;
 88f:	03 53 fc             	add    -0x4(%ebx),%edx
 892:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 895:	8b 53 f8             	mov    -0x8(%ebx),%edx
 898:	89 10                	mov    %edx,(%eax)
 89a:	eb da                	jmp    876 <free+0x4a>

0000089c <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 8b3:	55                   	push   %ebp
 8b4:	89 e5                	mov    %esp,%ebp
 8b6:	53                   	push   %ebx
 8b7:	83 ec 04             	sub    $0x4,%esp
 8ba:	89 c3                	mov    %eax,%ebx
=======
 89c:	55                   	push   %ebp
 89d:	89 e5                	mov    %esp,%ebp
 89f:	53                   	push   %ebx
 8a0:	83 ec 04             	sub    $0x4,%esp
 8a3:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 8bc:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8c1:	77 05                	ja     8c8 <morecore+0x15>
    nu = 4096;
 8c3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8c8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8cf:	83 ec 0c             	sub    $0xc,%esp
 8d2:	50                   	push   %eax
 8d3:	e8 38 fd ff ff       	call   610 <sbrk>
  if(p == (char*)-1)
 8d8:	83 c4 10             	add    $0x10,%esp
 8db:	83 f8 ff             	cmp    $0xffffffff,%eax
 8de:	74 1c                	je     8fc <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8e3:	83 c0 08             	add    $0x8,%eax
 8e6:	83 ec 0c             	sub    $0xc,%esp
 8e9:	50                   	push   %eax
 8ea:	e8 54 ff ff ff       	call   843 <free>
  return freep;
 8ef:	a1 80 0f 00 00       	mov    0xf80,%eax
 8f4:	83 c4 10             	add    $0x10,%esp
}
 8f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8fa:	c9                   	leave  
 8fb:	c3                   	ret    
    return 0;
 8fc:	b8 00 00 00 00       	mov    $0x0,%eax
 901:	eb f4                	jmp    8f7 <morecore+0x44>

00000903 <malloc>:
=======
 8a5:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8aa:	77 05                	ja     8b1 <morecore+0x15>
    nu = 4096;
 8ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8b1:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8b8:	83 ec 0c             	sub    $0xc,%esp
 8bb:	50                   	push   %eax
 8bc:	e8 38 fd ff ff       	call   5f9 <sbrk>
  if(p == (char*)-1)
 8c1:	83 c4 10             	add    $0x10,%esp
 8c4:	83 f8 ff             	cmp    $0xffffffff,%eax
 8c7:	74 1c                	je     8e5 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8c9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8cc:	83 c0 08             	add    $0x8,%eax
 8cf:	83 ec 0c             	sub    $0xc,%esp
 8d2:	50                   	push   %eax
 8d3:	e8 54 ff ff ff       	call   82c <free>
  return freep;
 8d8:	a1 60 11 00 00       	mov    0x1160,%eax
 8dd:	83 c4 10             	add    $0x10,%esp
}
 8e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8e3:	c9                   	leave  
 8e4:	c3                   	ret    
    return 0;
 8e5:	b8 00 00 00 00       	mov    $0x0,%eax
 8ea:	eb f4                	jmp    8e0 <morecore+0x44>

000008ec <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 903:	55                   	push   %ebp
 904:	89 e5                	mov    %esp,%ebp
 906:	53                   	push   %ebx
 907:	83 ec 04             	sub    $0x4,%esp
=======
 8ec:	55                   	push   %ebp
 8ed:	89 e5                	mov    %esp,%ebp
 8ef:	53                   	push   %ebx
 8f0:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 90a:	8b 45 08             	mov    0x8(%ebp),%eax
 90d:	8d 58 07             	lea    0x7(%eax),%ebx
 910:	c1 eb 03             	shr    $0x3,%ebx
 913:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 916:	8b 0d 80 0f 00 00    	mov    0xf80,%ecx
 91c:	85 c9                	test   %ecx,%ecx
 91e:	74 04                	je     924 <malloc+0x21>
=======
 8f3:	8b 45 08             	mov    0x8(%ebp),%eax
 8f6:	8d 58 07             	lea    0x7(%eax),%ebx
 8f9:	c1 eb 03             	shr    $0x3,%ebx
 8fc:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8ff:	8b 0d 60 11 00 00    	mov    0x1160,%ecx
 905:	85 c9                	test   %ecx,%ecx
 907:	74 04                	je     90d <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 920:	8b 01                	mov    (%ecx),%eax
 922:	eb 4a                	jmp    96e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 924:	c7 05 80 0f 00 00 84 	movl   $0xf84,0xf80
 92b:	0f 00 00 
 92e:	c7 05 84 0f 00 00 84 	movl   $0xf84,0xf84
 935:	0f 00 00 
    base.s.size = 0;
 938:	c7 05 88 0f 00 00 00 	movl   $0x0,0xf88
 93f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 942:	b9 84 0f 00 00       	mov    $0xf84,%ecx
 947:	eb d7                	jmp    920 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 949:	74 19                	je     964 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 94b:	29 da                	sub    %ebx,%edx
 94d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 950:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 953:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 956:	89 0d 80 0f 00 00    	mov    %ecx,0xf80
      return (void*)(p + 1);
 95c:	83 c0 08             	add    $0x8,%eax
=======
 909:	8b 01                	mov    (%ecx),%eax
 90b:	eb 4a                	jmp    957 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 90d:	c7 05 60 11 00 00 64 	movl   $0x1164,0x1160
 914:	11 00 00 
 917:	c7 05 64 11 00 00 64 	movl   $0x1164,0x1164
 91e:	11 00 00 
    base.s.size = 0;
 921:	c7 05 68 11 00 00 00 	movl   $0x0,0x1168
 928:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 92b:	b9 64 11 00 00       	mov    $0x1164,%ecx
 930:	eb d7                	jmp    909 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 932:	74 19                	je     94d <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 934:	29 da                	sub    %ebx,%edx
 936:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 939:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 93c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 93f:	89 0d 60 11 00 00    	mov    %ecx,0x1160
      return (void*)(p + 1);
 945:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 95f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 962:	c9                   	leave  
 963:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 964:	8b 10                	mov    (%eax),%edx
 966:	89 11                	mov    %edx,(%ecx)
 968:	eb ec                	jmp    956 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 96a:	89 c1                	mov    %eax,%ecx
 96c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 96e:	8b 50 04             	mov    0x4(%eax),%edx
 971:	39 da                	cmp    %ebx,%edx
 973:	73 d4                	jae    949 <malloc+0x46>
    if(p == freep)
 975:	39 05 80 0f 00 00    	cmp    %eax,0xf80
 97b:	75 ed                	jne    96a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 97d:	89 d8                	mov    %ebx,%eax
 97f:	e8 2f ff ff ff       	call   8b3 <morecore>
 984:	85 c0                	test   %eax,%eax
 986:	75 e2                	jne    96a <malloc+0x67>
 988:	eb d5                	jmp    95f <malloc+0x5c>
=======
 948:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 94b:	c9                   	leave  
 94c:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 94d:	8b 10                	mov    (%eax),%edx
 94f:	89 11                	mov    %edx,(%ecx)
 951:	eb ec                	jmp    93f <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 953:	89 c1                	mov    %eax,%ecx
 955:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 957:	8b 50 04             	mov    0x4(%eax),%edx
 95a:	39 da                	cmp    %ebx,%edx
 95c:	73 d4                	jae    932 <malloc+0x46>
    if(p == freep)
 95e:	39 05 60 11 00 00    	cmp    %eax,0x1160
 964:	75 ed                	jne    953 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 966:	89 d8                	mov    %ebx,%eax
 968:	e8 2f ff ff ff       	call   89c <morecore>
 96d:	85 c0                	test   %eax,%eax
 96f:	75 e2                	jne    953 <malloc+0x67>
 971:	eb d5                	jmp    948 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
