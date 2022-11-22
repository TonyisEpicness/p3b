
_test_19:     file format elf32-i386


Disassembly of section .text:

00000000 <nested_worker>:

   printf(1, "TEST PASSED\n");
   exit();
}

void nested_worker(void *arg1, void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <nested_worker+0x30>
   assert(arg2_int == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <nested_worker+0x79>
   assert(global == 2);
  18:	a1 4c 10 00 00       	mov    0x104c,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 4c 10 00 00       	mov    %eax,0x104c
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 3c 0b 00 00       	push   $0xb3c
  37:	68 46 0b 00 00       	push   $0xb46
  3c:	6a 01                	push   $0x1
  3e:	e8 4b 08 00 00       	call   88e <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 4e 0b 00 00       	push   $0xb4e
  4b:	68 5d 0b 00 00       	push   $0xb5d
  50:	6a 01                	push   $0x1
  52:	e8 37 08 00 00       	call   88e <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 71 0b 00 00       	push   $0xb71
  5f:	6a 01                	push   $0x1
  61:	e8 28 08 00 00       	call   88e <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 60 10 00 00    	push   0x1060
  6f:	e8 f5 06 00 00       	call   769 <kill>
  74:	e8 c0 06 00 00       	call   739 <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 3c 0b 00 00       	push   $0xb3c
  80:	68 46 0b 00 00       	push   $0xb46
  85:	6a 01                	push   $0x1
  87:	e8 02 08 00 00       	call   88e <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 7e 0b 00 00       	push   $0xb7e
  94:	68 5d 0b 00 00       	push   $0xb5d
  99:	6a 01                	push   $0x1
  9b:	e8 ee 07 00 00       	call   88e <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 71 0b 00 00       	push   $0xb71
  a8:	6a 01                	push   $0x1
  aa:	e8 df 07 00 00       	call   88e <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 60 10 00 00    	push   0x1060
  b8:	e8 ac 06 00 00       	call   769 <kill>
  bd:	e8 77 06 00 00       	call   739 <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 3c 0b 00 00       	push   $0xb3c
  c9:	68 46 0b 00 00       	push   $0xb46
  ce:	6a 01                	push   $0x1
  d0:	e8 b9 07 00 00       	call   88e <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 8d 0b 00 00       	push   $0xb8d
  dd:	68 5d 0b 00 00       	push   $0xb5d
  e2:	6a 01                	push   $0x1
  e4:	e8 a5 07 00 00       	call   88e <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 71 0b 00 00       	push   $0xb71
  f1:	6a 01                	push   $0x1
  f3:	e8 96 07 00 00       	call   88e <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 60 10 00 00    	push   0x1060
 101:	e8 63 06 00 00       	call   769 <kill>
 106:	e8 2e 06 00 00       	call   739 <exit>

0000010b <worker>:

void
worker(void *arg1, void *arg2) {
 10b:	55                   	push   %ebp
 10c:	89 e5                	mov    %esp,%ebp
 10e:	53                   	push   %ebx
 10f:	83 ec 14             	sub    $0x14,%esp
   int tmp1 = *(int*)arg1;
 112:	8b 45 08             	mov    0x8(%ebp),%eax
 115:	8b 00                	mov    (%eax),%eax
 117:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int tmp2 = *(int*)arg2;
 11a:	8b 55 0c             	mov    0xc(%ebp),%edx
 11d:	8b 12                	mov    (%edx),%edx
 11f:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(tmp1 == 42);
 122:	83 f8 2a             	cmp    $0x2a,%eax
 125:	75 60                	jne    187 <worker+0x7c>
   assert(tmp2 == 24);
 127:	83 fa 18             	cmp    $0x18,%edx
 12a:	0f 85 a0 00 00 00    	jne    1d0 <worker+0xc5>
   assert(global == 1);
 130:	a1 4c 10 00 00       	mov    0x104c,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 3c 0b 00 00       	push   $0xb3c
 145:	68 46 0b 00 00       	push   $0xb46
 14a:	6a 01                	push   $0x1
 14c:	e8 3d 07 00 00       	call   88e <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 af 0b 00 00       	push   $0xbaf
 159:	68 5d 0b 00 00       	push   $0xb5d
 15e:	6a 01                	push   $0x1
 160:	e8 29 07 00 00       	call   88e <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 71 0b 00 00       	push   $0xb71
 16d:	6a 01                	push   $0x1
 16f:	e8 1a 07 00 00       	call   88e <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 60 10 00 00    	push   0x1060
 17d:	e8 e7 05 00 00       	call   769 <kill>
 182:	e8 b2 05 00 00       	call   739 <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 3c 0b 00 00       	push   $0xb3c
 18e:	68 46 0b 00 00       	push   $0xb46
 193:	6a 01                	push   $0x1
 195:	e8 f4 06 00 00       	call   88e <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 99 0b 00 00       	push   $0xb99
 1a2:	68 5d 0b 00 00       	push   $0xb5d
 1a7:	6a 01                	push   $0x1
 1a9:	e8 e0 06 00 00       	call   88e <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 71 0b 00 00       	push   $0xb71
 1b6:	6a 01                	push   $0x1
 1b8:	e8 d1 06 00 00       	call   88e <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 60 10 00 00    	push   0x1060
 1c6:	e8 9e 05 00 00       	call   769 <kill>
 1cb:	e8 69 05 00 00       	call   739 <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 3c 0b 00 00       	push   $0xb3c
 1d7:	68 46 0b 00 00       	push   $0xb46
 1dc:	6a 01                	push   $0x1
 1de:	e8 ab 06 00 00       	call   88e <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 a4 0b 00 00       	push   $0xba4
 1eb:	68 5d 0b 00 00       	push   $0xb5d
 1f0:	6a 01                	push   $0x1
 1f2:	e8 97 06 00 00       	call   88e <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 71 0b 00 00       	push   $0xb71
 1ff:	6a 01                	push   $0x1
 201:	e8 88 06 00 00       	call   88e <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 60 10 00 00    	push   0x1060
 20f:	e8 55 05 00 00       	call   769 <kill>
 214:	e8 20 05 00 00       	call   739 <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 4c 10 00 00       	mov    %eax,0x104c

   int nested_thread_pid = thread_create(nested_worker, &tmp1, &tmp2);
 221:	83 ec 04             	sub    $0x4,%esp
 224:	8d 45 f0             	lea    -0x10(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 45 f4             	lea    -0xc(%ebp),%eax
 22b:	50                   	push   %eax
 22c:	68 00 00 00 00       	push   $0x0
 231:	e8 6d 02 00 00       	call   4a3 <thread_create>
 236:	89 c3                	mov    %eax,%ebx
   assert(nested_thread_pid > 0);
 238:	83 c4 10             	add    $0x10,%esp
 23b:	85 c0                	test   %eax,%eax
 23d:	7e 07                	jle    246 <worker+0x13b>
   for(int j=0;j<10000;j++);
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
 244:	eb 4c                	jmp    292 <worker+0x187>
   assert(nested_thread_pid > 0);
 246:	6a 3c                	push   $0x3c
 248:	68 3c 0b 00 00       	push   $0xb3c
 24d:	68 46 0b 00 00       	push   $0xb46
 252:	6a 01                	push   $0x1
 254:	e8 35 06 00 00       	call   88e <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 bb 0b 00 00       	push   $0xbbb
 261:	68 5d 0b 00 00       	push   $0xb5d
 266:	6a 01                	push   $0x1
 268:	e8 21 06 00 00       	call   88e <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 71 0b 00 00       	push   $0xb71
 275:	6a 01                	push   $0x1
 277:	e8 12 06 00 00       	call   88e <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 60 10 00 00    	push   0x1060
 285:	e8 df 04 00 00       	call   769 <kill>
 28a:	e8 aa 04 00 00       	call   739 <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 6d 02 00 00       	call   50b <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 3c 0b 00 00       	push   $0xb3c
 2b1:	68 46 0b 00 00       	push   $0xb46
 2b6:	6a 01                	push   $0x1
 2b8:	e8 d1 05 00 00       	call   88e <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 14 0c 00 00       	push   $0xc14
 2c5:	68 5d 0b 00 00       	push   $0xb5d
 2ca:	6a 01                	push   $0x1
 2cc:	e8 bd 05 00 00       	call   88e <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 71 0b 00 00       	push   $0xb71
 2d9:	6a 01                	push   $0x1
 2db:	e8 ae 05 00 00       	call   88e <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 60 10 00 00    	push   0x1060
 2e9:	e8 7b 04 00 00       	call   769 <kill>
 2ee:	e8 46 04 00 00       	call   739 <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 3c 0b 00 00       	push   $0xb3c
 2fa:	68 46 0b 00 00       	push   $0xb46
 2ff:	6a 01                	push   $0x1
 301:	e8 88 05 00 00       	call   88e <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 d1 0b 00 00       	push   $0xbd1
 30e:	68 5d 0b 00 00       	push   $0xb5d
 313:	6a 01                	push   $0x1
 315:	e8 74 05 00 00       	call   88e <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 71 0b 00 00       	push   $0xb71
 322:	6a 01                	push   $0x1
 324:	e8 65 05 00 00       	call   88e <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 60 10 00 00    	push   0x1060
 332:	e8 32 04 00 00       	call   769 <kill>
 337:	e8 fd 03 00 00       	call   739 <exit>
   exit();
 33c:	e8 f8 03 00 00       	call   739 <exit>

00000341 <main>:
{
 341:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 345:	83 e4 f0             	and    $0xfffffff0,%esp
 348:	ff 71 fc             	push   -0x4(%ecx)
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	53                   	push   %ebx
 34f:	51                   	push   %ecx
 350:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 353:	e8 61 04 00 00       	call   7b9 <getpid>
 358:	a3 60 10 00 00       	mov    %eax,0x1060
   int arg1 = 42, arg2 = 24;
 35d:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 364:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 36b:	83 ec 04             	sub    $0x4,%esp
 36e:	8d 45 f0             	lea    -0x10(%ebp),%eax
 371:	50                   	push   %eax
 372:	8d 45 f4             	lea    -0xc(%ebp),%eax
 375:	50                   	push   %eax
 376:	68 0b 01 00 00       	push   $0x10b
 37b:	e8 23 01 00 00       	call   4a3 <thread_create>
   assert(thread_pid > 0);
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	7e 65                	jle    3ec <main+0xab>
 387:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 389:	e8 7d 01 00 00       	call   50b <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d 4c 10 00 00 03 	cmpl   $0x3,0x104c
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 3c 0b 00 00       	push   $0xb3c
 3aa:	68 46 0b 00 00       	push   $0xb46
 3af:	6a 01                	push   $0x1
 3b1:	e8 d8 04 00 00       	call   88e <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 f8 0b 00 00       	push   $0xbf8
 3be:	68 5d 0b 00 00       	push   $0xb5d
 3c3:	6a 01                	push   $0x1
 3c5:	e8 c4 04 00 00       	call   88e <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 71 0b 00 00       	push   $0xb71
 3d2:	6a 01                	push   $0x1
 3d4:	e8 b5 04 00 00       	call   88e <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 60 10 00 00    	push   0x1060
 3e2:	e8 82 03 00 00       	call   769 <kill>
 3e7:	e8 4d 03 00 00       	call   739 <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 3c 0b 00 00       	push   $0xb3c
 3f3:	68 46 0b 00 00       	push   $0xb46
 3f8:	6a 01                	push   $0x1
 3fa:	e8 8f 04 00 00       	call   88e <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 c2 0b 00 00       	push   $0xbc2
 407:	68 5d 0b 00 00       	push   $0xb5d
 40c:	6a 01                	push   $0x1
 40e:	e8 7b 04 00 00       	call   88e <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 71 0b 00 00       	push   $0xb71
 41b:	6a 01                	push   $0x1
 41d:	e8 6c 04 00 00       	call   88e <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 60 10 00 00    	push   0x1060
 42b:	e8 39 03 00 00       	call   769 <kill>
 430:	e8 04 03 00 00       	call   739 <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 3c 0b 00 00       	push   $0xb3c
 43c:	68 46 0b 00 00       	push   $0xb46
 441:	6a 01                	push   $0x1
 443:	e8 46 04 00 00       	call   88e <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 e1 0b 00 00       	push   $0xbe1
 450:	68 5d 0b 00 00       	push   $0xb5d
 455:	6a 01                	push   $0x1
 457:	e8 32 04 00 00       	call   88e <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 71 0b 00 00       	push   $0xb71
 464:	6a 01                	push   $0x1
 466:	e8 23 04 00 00       	call   88e <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 60 10 00 00    	push   0x1060
 474:	e8 f0 02 00 00       	call   769 <kill>
 479:	e8 bb 02 00 00       	call   739 <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 04 0c 00 00       	push   $0xc04
 486:	6a 01                	push   $0x1
 488:	e8 01 04 00 00       	call   88e <printf>
   exit();
 48d:	e8 a7 02 00 00       	call   739 <exit>

00000492 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 498:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 49a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 49d:	89 08                	mov    %ecx,(%eax)
  return old;
}
 49f:	89 d0                	mov    %edx,%eax
 4a1:	5d                   	pop    %ebp
 4a2:	c3                   	ret    

000004a3 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
 4a6:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 4a9:	68 00 20 00 00       	push   $0x2000
 4ae:	e8 01 06 00 00       	call   ab4 <malloc>
  if(n_stack == 0){
 4b3:	83 c4 10             	add    $0x10,%esp
 4b6:	85 c0                	test   %eax,%eax
 4b8:	74 4a                	je     504 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 4ba:	ba 00 00 00 00       	mov    $0x0,%edx
 4bf:	eb 03                	jmp    4c4 <thread_create+0x21>
 4c1:	83 c2 01             	add    $0x1,%edx
 4c4:	83 fa 3f             	cmp    $0x3f,%edx
 4c7:	7f 27                	jg     4f0 <thread_create+0x4d>
    if(threads[i]->flag==0){
 4c9:	8b 0c 95 80 10 00 00 	mov    0x1080(,%edx,4),%ecx
 4d0:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 4d4:	75 eb                	jne    4c1 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 4d6:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 4d8:	8b 0c 95 80 10 00 00 	mov    0x1080(,%edx,4),%ecx
 4df:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 4e2:	8b 14 95 80 10 00 00 	mov    0x1080(,%edx,4),%edx
 4e9:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 4f0:	50                   	push   %eax
 4f1:	ff 75 10             	push   0x10(%ebp)
 4f4:	ff 75 0c             	push   0xc(%ebp)
 4f7:	ff 75 08             	push   0x8(%ebp)
 4fa:	e8 da 02 00 00       	call   7d9 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 4ff:	83 c4 10             	add    $0x10,%esp
}
 502:	c9                   	leave  
 503:	c3                   	ret    
    return -1;
 504:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 509:	eb f7                	jmp    502 <thread_create+0x5f>

0000050b <thread_join>:

//TODO: fix
int thread_join() {
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	56                   	push   %esi
 50f:	53                   	push   %ebx
 510:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 513:	8d 45 f4             	lea    -0xc(%ebp),%eax
 516:	50                   	push   %eax
 517:	e8 c5 02 00 00       	call   7e1 <join>
 51c:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 51e:	83 c4 10             	add    $0x10,%esp
 521:	bb 00 00 00 00       	mov    $0x0,%ebx
 526:	eb 03                	jmp    52b <thread_join+0x20>
 528:	83 c3 01             	add    $0x1,%ebx
 52b:	83 fb 3f             	cmp    $0x3f,%ebx
 52e:	7f 23                	jg     553 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 530:	8b 04 9d 80 10 00 00 	mov    0x1080(,%ebx,4),%eax
 537:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 53b:	75 eb                	jne    528 <thread_join+0x1d>
 53d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 540:	39 50 04             	cmp    %edx,0x4(%eax)
 543:	75 e3                	jne    528 <thread_join+0x1d>
      free(stk_addr);
 545:	83 ec 0c             	sub    $0xc,%esp
 548:	52                   	push   %edx
 549:	e8 a6 04 00 00       	call   9f4 <free>
 54e:	83 c4 10             	add    $0x10,%esp
 551:	eb d5                	jmp    528 <thread_join+0x1d>
    }
  }
  return pid;
}
 553:	89 f0                	mov    %esi,%eax
 555:	8d 65 f8             	lea    -0x8(%ebp),%esp
 558:	5b                   	pop    %ebx
 559:	5e                   	pop    %esi
 55a:	5d                   	pop    %ebp
 55b:	c3                   	ret    

0000055c <lock_acquire>:

void lock_acquire(lock_t *lock){
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	53                   	push   %ebx
 560:	83 ec 04             	sub    $0x4,%esp
 563:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 566:	83 ec 08             	sub    $0x8,%esp
 569:	6a 01                	push   $0x1
 56b:	53                   	push   %ebx
 56c:	e8 21 ff ff ff       	call   492 <test_and_set>
 571:	83 c4 10             	add    $0x10,%esp
 574:	83 f8 01             	cmp    $0x1,%eax
 577:	74 ed                	je     566 <lock_acquire+0xa>
    ;
}
 579:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 57c:	c9                   	leave  
 57d:	c3                   	ret    

0000057e <lock_release>:

void lock_release(lock_t *lock) {
 57e:	55                   	push   %ebp
 57f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 581:	8b 45 08             	mov    0x8(%ebp),%eax
 584:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 58a:	5d                   	pop    %ebp
 58b:	c3                   	ret    

0000058c <lock_init>:

void lock_init(lock_t *lock) {
 58c:	55                   	push   %ebp
 58d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 598:	5d                   	pop    %ebp
 599:	c3                   	ret    

0000059a <strcpy>:

char*
strcpy(char *s, const char *t)
{
 59a:	55                   	push   %ebp
 59b:	89 e5                	mov    %esp,%ebp
 59d:	56                   	push   %esi
 59e:	53                   	push   %ebx
 59f:	8b 75 08             	mov    0x8(%ebp),%esi
 5a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 5a5:	89 f0                	mov    %esi,%eax
 5a7:	89 d1                	mov    %edx,%ecx
 5a9:	83 c2 01             	add    $0x1,%edx
 5ac:	89 c3                	mov    %eax,%ebx
 5ae:	83 c0 01             	add    $0x1,%eax
 5b1:	0f b6 09             	movzbl (%ecx),%ecx
 5b4:	88 0b                	mov    %cl,(%ebx)
 5b6:	84 c9                	test   %cl,%cl
 5b8:	75 ed                	jne    5a7 <strcpy+0xd>
    ;
  return os;
}
 5ba:	89 f0                	mov    %esi,%eax
 5bc:	5b                   	pop    %ebx
 5bd:	5e                   	pop    %esi
 5be:	5d                   	pop    %ebp
 5bf:	c3                   	ret    

000005c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 5c9:	eb 06                	jmp    5d1 <strcmp+0x11>
    p++, q++;
 5cb:	83 c1 01             	add    $0x1,%ecx
 5ce:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 5d1:	0f b6 01             	movzbl (%ecx),%eax
 5d4:	84 c0                	test   %al,%al
 5d6:	74 04                	je     5dc <strcmp+0x1c>
 5d8:	3a 02                	cmp    (%edx),%al
 5da:	74 ef                	je     5cb <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 5dc:	0f b6 c0             	movzbl %al,%eax
 5df:	0f b6 12             	movzbl (%edx),%edx
 5e2:	29 d0                	sub    %edx,%eax
}
 5e4:	5d                   	pop    %ebp
 5e5:	c3                   	ret    

000005e6 <strlen>:

uint
strlen(const char *s)
{
 5e6:	55                   	push   %ebp
 5e7:	89 e5                	mov    %esp,%ebp
 5e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5ec:	b8 00 00 00 00       	mov    $0x0,%eax
 5f1:	eb 03                	jmp    5f6 <strlen+0x10>
 5f3:	83 c0 01             	add    $0x1,%eax
 5f6:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 5fa:	75 f7                	jne    5f3 <strlen+0xd>
    ;
  return n;
}
 5fc:	5d                   	pop    %ebp
 5fd:	c3                   	ret    

000005fe <memset>:

void*
memset(void *dst, int c, uint n)
{
 5fe:	55                   	push   %ebp
 5ff:	89 e5                	mov    %esp,%ebp
 601:	57                   	push   %edi
 602:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 605:	89 d7                	mov    %edx,%edi
 607:	8b 4d 10             	mov    0x10(%ebp),%ecx
 60a:	8b 45 0c             	mov    0xc(%ebp),%eax
 60d:	fc                   	cld    
 60e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 610:	89 d0                	mov    %edx,%eax
 612:	8b 7d fc             	mov    -0x4(%ebp),%edi
 615:	c9                   	leave  
 616:	c3                   	ret    

00000617 <strchr>:

char*
strchr(const char *s, char c)
{
 617:	55                   	push   %ebp
 618:	89 e5                	mov    %esp,%ebp
 61a:	8b 45 08             	mov    0x8(%ebp),%eax
 61d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 621:	eb 03                	jmp    626 <strchr+0xf>
 623:	83 c0 01             	add    $0x1,%eax
 626:	0f b6 10             	movzbl (%eax),%edx
 629:	84 d2                	test   %dl,%dl
 62b:	74 06                	je     633 <strchr+0x1c>
    if(*s == c)
 62d:	38 ca                	cmp    %cl,%dl
 62f:	75 f2                	jne    623 <strchr+0xc>
 631:	eb 05                	jmp    638 <strchr+0x21>
      return (char*)s;
  return 0;
 633:	b8 00 00 00 00       	mov    $0x0,%eax
}
 638:	5d                   	pop    %ebp
 639:	c3                   	ret    

0000063a <gets>:

char*
gets(char *buf, int max)
{
 63a:	55                   	push   %ebp
 63b:	89 e5                	mov    %esp,%ebp
 63d:	57                   	push   %edi
 63e:	56                   	push   %esi
 63f:	53                   	push   %ebx
 640:	83 ec 1c             	sub    $0x1c,%esp
 643:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 646:	bb 00 00 00 00       	mov    $0x0,%ebx
 64b:	89 de                	mov    %ebx,%esi
 64d:	83 c3 01             	add    $0x1,%ebx
 650:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 653:	7d 2e                	jge    683 <gets+0x49>
    cc = read(0, &c, 1);
 655:	83 ec 04             	sub    $0x4,%esp
 658:	6a 01                	push   $0x1
 65a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 65d:	50                   	push   %eax
 65e:	6a 00                	push   $0x0
 660:	e8 ec 00 00 00       	call   751 <read>
    if(cc < 1)
 665:	83 c4 10             	add    $0x10,%esp
 668:	85 c0                	test   %eax,%eax
 66a:	7e 17                	jle    683 <gets+0x49>
      break;
    buf[i++] = c;
 66c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 670:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 673:	3c 0a                	cmp    $0xa,%al
 675:	0f 94 c2             	sete   %dl
 678:	3c 0d                	cmp    $0xd,%al
 67a:	0f 94 c0             	sete   %al
 67d:	08 c2                	or     %al,%dl
 67f:	74 ca                	je     64b <gets+0x11>
    buf[i++] = c;
 681:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 683:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 687:	89 f8                	mov    %edi,%eax
 689:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68c:	5b                   	pop    %ebx
 68d:	5e                   	pop    %esi
 68e:	5f                   	pop    %edi
 68f:	5d                   	pop    %ebp
 690:	c3                   	ret    

00000691 <stat>:

int
stat(const char *n, struct stat *st)
{
 691:	55                   	push   %ebp
 692:	89 e5                	mov    %esp,%ebp
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 696:	83 ec 08             	sub    $0x8,%esp
 699:	6a 00                	push   $0x0
 69b:	ff 75 08             	push   0x8(%ebp)
 69e:	e8 d6 00 00 00       	call   779 <open>
  if(fd < 0)
 6a3:	83 c4 10             	add    $0x10,%esp
 6a6:	85 c0                	test   %eax,%eax
 6a8:	78 24                	js     6ce <stat+0x3d>
 6aa:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 6ac:	83 ec 08             	sub    $0x8,%esp
 6af:	ff 75 0c             	push   0xc(%ebp)
 6b2:	50                   	push   %eax
 6b3:	e8 d9 00 00 00       	call   791 <fstat>
 6b8:	89 c6                	mov    %eax,%esi
  close(fd);
 6ba:	89 1c 24             	mov    %ebx,(%esp)
 6bd:	e8 9f 00 00 00       	call   761 <close>
  return r;
 6c2:	83 c4 10             	add    $0x10,%esp
}
 6c5:	89 f0                	mov    %esi,%eax
 6c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6ca:	5b                   	pop    %ebx
 6cb:	5e                   	pop    %esi
 6cc:	5d                   	pop    %ebp
 6cd:	c3                   	ret    
    return -1;
 6ce:	be ff ff ff ff       	mov    $0xffffffff,%esi
 6d3:	eb f0                	jmp    6c5 <stat+0x34>

000006d5 <atoi>:

int
atoi(const char *s)
{
 6d5:	55                   	push   %ebp
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	53                   	push   %ebx
 6d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 6dc:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 6e1:	eb 10                	jmp    6f3 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 6e3:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 6e6:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 6e9:	83 c1 01             	add    $0x1,%ecx
 6ec:	0f be c0             	movsbl %al,%eax
 6ef:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 6f3:	0f b6 01             	movzbl (%ecx),%eax
 6f6:	8d 58 d0             	lea    -0x30(%eax),%ebx
 6f9:	80 fb 09             	cmp    $0x9,%bl
 6fc:	76 e5                	jbe    6e3 <atoi+0xe>
  return n;
}
 6fe:	89 d0                	mov    %edx,%eax
 700:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 703:	c9                   	leave  
 704:	c3                   	ret    

00000705 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 705:	55                   	push   %ebp
 706:	89 e5                	mov    %esp,%ebp
 708:	56                   	push   %esi
 709:	53                   	push   %ebx
 70a:	8b 75 08             	mov    0x8(%ebp),%esi
 70d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 710:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 713:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 715:	eb 0d                	jmp    724 <memmove+0x1f>
    *dst++ = *src++;
 717:	0f b6 01             	movzbl (%ecx),%eax
 71a:	88 02                	mov    %al,(%edx)
 71c:	8d 49 01             	lea    0x1(%ecx),%ecx
 71f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 722:	89 d8                	mov    %ebx,%eax
 724:	8d 58 ff             	lea    -0x1(%eax),%ebx
 727:	85 c0                	test   %eax,%eax
 729:	7f ec                	jg     717 <memmove+0x12>
  return vdst;
}
 72b:	89 f0                	mov    %esi,%eax
 72d:	5b                   	pop    %ebx
 72e:	5e                   	pop    %esi
 72f:	5d                   	pop    %ebp
 730:	c3                   	ret    

00000731 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 731:	b8 01 00 00 00       	mov    $0x1,%eax
 736:	cd 40                	int    $0x40
 738:	c3                   	ret    

00000739 <exit>:
SYSCALL(exit)
 739:	b8 02 00 00 00       	mov    $0x2,%eax
 73e:	cd 40                	int    $0x40
 740:	c3                   	ret    

00000741 <wait>:
SYSCALL(wait)
 741:	b8 03 00 00 00       	mov    $0x3,%eax
 746:	cd 40                	int    $0x40
 748:	c3                   	ret    

00000749 <pipe>:
SYSCALL(pipe)
 749:	b8 04 00 00 00       	mov    $0x4,%eax
 74e:	cd 40                	int    $0x40
 750:	c3                   	ret    

00000751 <read>:
SYSCALL(read)
 751:	b8 05 00 00 00       	mov    $0x5,%eax
 756:	cd 40                	int    $0x40
 758:	c3                   	ret    

00000759 <write>:
SYSCALL(write)
 759:	b8 10 00 00 00       	mov    $0x10,%eax
 75e:	cd 40                	int    $0x40
 760:	c3                   	ret    

00000761 <close>:
SYSCALL(close)
 761:	b8 15 00 00 00       	mov    $0x15,%eax
 766:	cd 40                	int    $0x40
 768:	c3                   	ret    

00000769 <kill>:
SYSCALL(kill)
 769:	b8 06 00 00 00       	mov    $0x6,%eax
 76e:	cd 40                	int    $0x40
 770:	c3                   	ret    

00000771 <exec>:
SYSCALL(exec)
 771:	b8 07 00 00 00       	mov    $0x7,%eax
 776:	cd 40                	int    $0x40
 778:	c3                   	ret    

00000779 <open>:
SYSCALL(open)
 779:	b8 0f 00 00 00       	mov    $0xf,%eax
 77e:	cd 40                	int    $0x40
 780:	c3                   	ret    

00000781 <mknod>:
SYSCALL(mknod)
 781:	b8 11 00 00 00       	mov    $0x11,%eax
 786:	cd 40                	int    $0x40
 788:	c3                   	ret    

00000789 <unlink>:
SYSCALL(unlink)
 789:	b8 12 00 00 00       	mov    $0x12,%eax
 78e:	cd 40                	int    $0x40
 790:	c3                   	ret    

00000791 <fstat>:
SYSCALL(fstat)
 791:	b8 08 00 00 00       	mov    $0x8,%eax
 796:	cd 40                	int    $0x40
 798:	c3                   	ret    

00000799 <link>:
SYSCALL(link)
 799:	b8 13 00 00 00       	mov    $0x13,%eax
 79e:	cd 40                	int    $0x40
 7a0:	c3                   	ret    

000007a1 <mkdir>:
SYSCALL(mkdir)
 7a1:	b8 14 00 00 00       	mov    $0x14,%eax
 7a6:	cd 40                	int    $0x40
 7a8:	c3                   	ret    

000007a9 <chdir>:
SYSCALL(chdir)
 7a9:	b8 09 00 00 00       	mov    $0x9,%eax
 7ae:	cd 40                	int    $0x40
 7b0:	c3                   	ret    

000007b1 <dup>:
SYSCALL(dup)
 7b1:	b8 0a 00 00 00       	mov    $0xa,%eax
 7b6:	cd 40                	int    $0x40
 7b8:	c3                   	ret    

000007b9 <getpid>:
SYSCALL(getpid)
 7b9:	b8 0b 00 00 00       	mov    $0xb,%eax
 7be:	cd 40                	int    $0x40
 7c0:	c3                   	ret    

000007c1 <sbrk>:
SYSCALL(sbrk)
 7c1:	b8 0c 00 00 00       	mov    $0xc,%eax
 7c6:	cd 40                	int    $0x40
 7c8:	c3                   	ret    

000007c9 <sleep>:
SYSCALL(sleep)
 7c9:	b8 0d 00 00 00       	mov    $0xd,%eax
 7ce:	cd 40                	int    $0x40
 7d0:	c3                   	ret    

000007d1 <uptime>:
SYSCALL(uptime)
 7d1:	b8 0e 00 00 00       	mov    $0xe,%eax
 7d6:	cd 40                	int    $0x40
 7d8:	c3                   	ret    

000007d9 <clone>:
SYSCALL(clone)
 7d9:	b8 16 00 00 00       	mov    $0x16,%eax
 7de:	cd 40                	int    $0x40
 7e0:	c3                   	ret    

000007e1 <join>:
 7e1:	b8 17 00 00 00       	mov    $0x17,%eax
 7e6:	cd 40                	int    $0x40
 7e8:	c3                   	ret    

000007e9 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7e9:	55                   	push   %ebp
 7ea:	89 e5                	mov    %esp,%ebp
 7ec:	83 ec 1c             	sub    $0x1c,%esp
 7ef:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 7f2:	6a 01                	push   $0x1
 7f4:	8d 55 f4             	lea    -0xc(%ebp),%edx
 7f7:	52                   	push   %edx
 7f8:	50                   	push   %eax
 7f9:	e8 5b ff ff ff       	call   759 <write>
}
 7fe:	83 c4 10             	add    $0x10,%esp
 801:	c9                   	leave  
 802:	c3                   	ret    

00000803 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 803:	55                   	push   %ebp
 804:	89 e5                	mov    %esp,%ebp
 806:	57                   	push   %edi
 807:	56                   	push   %esi
 808:	53                   	push   %ebx
 809:	83 ec 2c             	sub    $0x2c,%esp
 80c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 80f:	89 d0                	mov    %edx,%eax
 811:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 813:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 817:	0f 95 c1             	setne  %cl
 81a:	c1 ea 1f             	shr    $0x1f,%edx
 81d:	84 d1                	test   %dl,%cl
 81f:	74 44                	je     865 <printint+0x62>
    neg = 1;
    x = -xx;
 821:	f7 d8                	neg    %eax
 823:	89 c1                	mov    %eax,%ecx
    neg = 1;
 825:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 82c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 831:	89 c8                	mov    %ecx,%eax
 833:	ba 00 00 00 00       	mov    $0x0,%edx
 838:	f7 f6                	div    %esi
 83a:	89 df                	mov    %ebx,%edi
 83c:	83 c3 01             	add    $0x1,%ebx
 83f:	0f b6 92 98 0c 00 00 	movzbl 0xc98(%edx),%edx
 846:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 84a:	89 ca                	mov    %ecx,%edx
 84c:	89 c1                	mov    %eax,%ecx
 84e:	39 d6                	cmp    %edx,%esi
 850:	76 df                	jbe    831 <printint+0x2e>
  if(neg)
 852:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 856:	74 31                	je     889 <printint+0x86>
    buf[i++] = '-';
 858:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 85d:	8d 5f 02             	lea    0x2(%edi),%ebx
 860:	8b 75 d0             	mov    -0x30(%ebp),%esi
 863:	eb 17                	jmp    87c <printint+0x79>
    x = xx;
 865:	89 c1                	mov    %eax,%ecx
  neg = 0;
 867:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 86e:	eb bc                	jmp    82c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 870:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 875:	89 f0                	mov    %esi,%eax
 877:	e8 6d ff ff ff       	call   7e9 <putc>
  while(--i >= 0)
 87c:	83 eb 01             	sub    $0x1,%ebx
 87f:	79 ef                	jns    870 <printint+0x6d>
}
 881:	83 c4 2c             	add    $0x2c,%esp
 884:	5b                   	pop    %ebx
 885:	5e                   	pop    %esi
 886:	5f                   	pop    %edi
 887:	5d                   	pop    %ebp
 888:	c3                   	ret    
 889:	8b 75 d0             	mov    -0x30(%ebp),%esi
 88c:	eb ee                	jmp    87c <printint+0x79>

0000088e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 88e:	55                   	push   %ebp
 88f:	89 e5                	mov    %esp,%ebp
 891:	57                   	push   %edi
 892:	56                   	push   %esi
 893:	53                   	push   %ebx
 894:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 897:	8d 45 10             	lea    0x10(%ebp),%eax
 89a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 89d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 8a2:	bb 00 00 00 00       	mov    $0x0,%ebx
 8a7:	eb 14                	jmp    8bd <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 8a9:	89 fa                	mov    %edi,%edx
 8ab:	8b 45 08             	mov    0x8(%ebp),%eax
 8ae:	e8 36 ff ff ff       	call   7e9 <putc>
 8b3:	eb 05                	jmp    8ba <printf+0x2c>
      }
    } else if(state == '%'){
 8b5:	83 fe 25             	cmp    $0x25,%esi
 8b8:	74 25                	je     8df <printf+0x51>
  for(i = 0; fmt[i]; i++){
 8ba:	83 c3 01             	add    $0x1,%ebx
 8bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8c0:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 8c4:	84 c0                	test   %al,%al
 8c6:	0f 84 20 01 00 00    	je     9ec <printf+0x15e>
    c = fmt[i] & 0xff;
 8cc:	0f be f8             	movsbl %al,%edi
 8cf:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 8d2:	85 f6                	test   %esi,%esi
 8d4:	75 df                	jne    8b5 <printf+0x27>
      if(c == '%'){
 8d6:	83 f8 25             	cmp    $0x25,%eax
 8d9:	75 ce                	jne    8a9 <printf+0x1b>
        state = '%';
 8db:	89 c6                	mov    %eax,%esi
 8dd:	eb db                	jmp    8ba <printf+0x2c>
      if(c == 'd'){
 8df:	83 f8 25             	cmp    $0x25,%eax
 8e2:	0f 84 cf 00 00 00    	je     9b7 <printf+0x129>
 8e8:	0f 8c dd 00 00 00    	jl     9cb <printf+0x13d>
 8ee:	83 f8 78             	cmp    $0x78,%eax
 8f1:	0f 8f d4 00 00 00    	jg     9cb <printf+0x13d>
 8f7:	83 f8 63             	cmp    $0x63,%eax
 8fa:	0f 8c cb 00 00 00    	jl     9cb <printf+0x13d>
 900:	83 e8 63             	sub    $0x63,%eax
 903:	83 f8 15             	cmp    $0x15,%eax
 906:	0f 87 bf 00 00 00    	ja     9cb <printf+0x13d>
 90c:	ff 24 85 40 0c 00 00 	jmp    *0xc40(,%eax,4)
        printint(fd, *ap, 10, 1);
 913:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 916:	8b 17                	mov    (%edi),%edx
 918:	83 ec 0c             	sub    $0xc,%esp
 91b:	6a 01                	push   $0x1
 91d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 922:	8b 45 08             	mov    0x8(%ebp),%eax
 925:	e8 d9 fe ff ff       	call   803 <printint>
        ap++;
 92a:	83 c7 04             	add    $0x4,%edi
 92d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 930:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 933:	be 00 00 00 00       	mov    $0x0,%esi
 938:	eb 80                	jmp    8ba <printf+0x2c>
        printint(fd, *ap, 16, 0);
 93a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 93d:	8b 17                	mov    (%edi),%edx
 93f:	83 ec 0c             	sub    $0xc,%esp
 942:	6a 00                	push   $0x0
 944:	b9 10 00 00 00       	mov    $0x10,%ecx
 949:	8b 45 08             	mov    0x8(%ebp),%eax
 94c:	e8 b2 fe ff ff       	call   803 <printint>
        ap++;
 951:	83 c7 04             	add    $0x4,%edi
 954:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 957:	83 c4 10             	add    $0x10,%esp
      state = 0;
 95a:	be 00 00 00 00       	mov    $0x0,%esi
 95f:	e9 56 ff ff ff       	jmp    8ba <printf+0x2c>
        s = (char*)*ap;
 964:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 967:	8b 30                	mov    (%eax),%esi
        ap++;
 969:	83 c0 04             	add    $0x4,%eax
 96c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 96f:	85 f6                	test   %esi,%esi
 971:	75 15                	jne    988 <printf+0xfa>
          s = "(null)";
 973:	be 39 0c 00 00       	mov    $0xc39,%esi
 978:	eb 0e                	jmp    988 <printf+0xfa>
          putc(fd, *s);
 97a:	0f be d2             	movsbl %dl,%edx
 97d:	8b 45 08             	mov    0x8(%ebp),%eax
 980:	e8 64 fe ff ff       	call   7e9 <putc>
          s++;
 985:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 988:	0f b6 16             	movzbl (%esi),%edx
 98b:	84 d2                	test   %dl,%dl
 98d:	75 eb                	jne    97a <printf+0xec>
      state = 0;
 98f:	be 00 00 00 00       	mov    $0x0,%esi
 994:	e9 21 ff ff ff       	jmp    8ba <printf+0x2c>
        putc(fd, *ap);
 999:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 99c:	0f be 17             	movsbl (%edi),%edx
 99f:	8b 45 08             	mov    0x8(%ebp),%eax
 9a2:	e8 42 fe ff ff       	call   7e9 <putc>
        ap++;
 9a7:	83 c7 04             	add    $0x4,%edi
 9aa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 9ad:	be 00 00 00 00       	mov    $0x0,%esi
 9b2:	e9 03 ff ff ff       	jmp    8ba <printf+0x2c>
        putc(fd, c);
 9b7:	89 fa                	mov    %edi,%edx
 9b9:	8b 45 08             	mov    0x8(%ebp),%eax
 9bc:	e8 28 fe ff ff       	call   7e9 <putc>
      state = 0;
 9c1:	be 00 00 00 00       	mov    $0x0,%esi
 9c6:	e9 ef fe ff ff       	jmp    8ba <printf+0x2c>
        putc(fd, '%');
 9cb:	ba 25 00 00 00       	mov    $0x25,%edx
 9d0:	8b 45 08             	mov    0x8(%ebp),%eax
 9d3:	e8 11 fe ff ff       	call   7e9 <putc>
        putc(fd, c);
 9d8:	89 fa                	mov    %edi,%edx
 9da:	8b 45 08             	mov    0x8(%ebp),%eax
 9dd:	e8 07 fe ff ff       	call   7e9 <putc>
      state = 0;
 9e2:	be 00 00 00 00       	mov    $0x0,%esi
 9e7:	e9 ce fe ff ff       	jmp    8ba <printf+0x2c>
    }
  }
}
 9ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9ef:	5b                   	pop    %ebx
 9f0:	5e                   	pop    %esi
 9f1:	5f                   	pop    %edi
 9f2:	5d                   	pop    %ebp
 9f3:	c3                   	ret    

000009f4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9f4:	55                   	push   %ebp
 9f5:	89 e5                	mov    %esp,%ebp
 9f7:	57                   	push   %edi
 9f8:	56                   	push   %esi
 9f9:	53                   	push   %ebx
 9fa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9fd:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a00:	a1 80 11 00 00       	mov    0x1180,%eax
 a05:	eb 02                	jmp    a09 <free+0x15>
 a07:	89 d0                	mov    %edx,%eax
 a09:	39 c8                	cmp    %ecx,%eax
 a0b:	73 04                	jae    a11 <free+0x1d>
 a0d:	39 08                	cmp    %ecx,(%eax)
 a0f:	77 12                	ja     a23 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a11:	8b 10                	mov    (%eax),%edx
 a13:	39 c2                	cmp    %eax,%edx
 a15:	77 f0                	ja     a07 <free+0x13>
 a17:	39 c8                	cmp    %ecx,%eax
 a19:	72 08                	jb     a23 <free+0x2f>
 a1b:	39 ca                	cmp    %ecx,%edx
 a1d:	77 04                	ja     a23 <free+0x2f>
 a1f:	89 d0                	mov    %edx,%eax
 a21:	eb e6                	jmp    a09 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a23:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a26:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a29:	8b 10                	mov    (%eax),%edx
 a2b:	39 d7                	cmp    %edx,%edi
 a2d:	74 19                	je     a48 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a2f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a32:	8b 50 04             	mov    0x4(%eax),%edx
 a35:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a38:	39 ce                	cmp    %ecx,%esi
 a3a:	74 1b                	je     a57 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a3c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a3e:	a3 80 11 00 00       	mov    %eax,0x1180
}
 a43:	5b                   	pop    %ebx
 a44:	5e                   	pop    %esi
 a45:	5f                   	pop    %edi
 a46:	5d                   	pop    %ebp
 a47:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 a48:	03 72 04             	add    0x4(%edx),%esi
 a4b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a4e:	8b 10                	mov    (%eax),%edx
 a50:	8b 12                	mov    (%edx),%edx
 a52:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a55:	eb db                	jmp    a32 <free+0x3e>
    p->s.size += bp->s.size;
 a57:	03 53 fc             	add    -0x4(%ebx),%edx
 a5a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a5d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a60:	89 10                	mov    %edx,(%eax)
 a62:	eb da                	jmp    a3e <free+0x4a>

00000a64 <morecore>:

static Header*
morecore(uint nu)
{
 a64:	55                   	push   %ebp
 a65:	89 e5                	mov    %esp,%ebp
 a67:	53                   	push   %ebx
 a68:	83 ec 04             	sub    $0x4,%esp
 a6b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a6d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a72:	77 05                	ja     a79 <morecore+0x15>
    nu = 4096;
 a74:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a79:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a80:	83 ec 0c             	sub    $0xc,%esp
 a83:	50                   	push   %eax
 a84:	e8 38 fd ff ff       	call   7c1 <sbrk>
  if(p == (char*)-1)
 a89:	83 c4 10             	add    $0x10,%esp
 a8c:	83 f8 ff             	cmp    $0xffffffff,%eax
 a8f:	74 1c                	je     aad <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a91:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a94:	83 c0 08             	add    $0x8,%eax
 a97:	83 ec 0c             	sub    $0xc,%esp
 a9a:	50                   	push   %eax
 a9b:	e8 54 ff ff ff       	call   9f4 <free>
  return freep;
 aa0:	a1 80 11 00 00       	mov    0x1180,%eax
 aa5:	83 c4 10             	add    $0x10,%esp
}
 aa8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aab:	c9                   	leave  
 aac:	c3                   	ret    
    return 0;
 aad:	b8 00 00 00 00       	mov    $0x0,%eax
 ab2:	eb f4                	jmp    aa8 <morecore+0x44>

00000ab4 <malloc>:

void*
malloc(uint nbytes)
{
 ab4:	55                   	push   %ebp
 ab5:	89 e5                	mov    %esp,%ebp
 ab7:	53                   	push   %ebx
 ab8:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 abb:	8b 45 08             	mov    0x8(%ebp),%eax
 abe:	8d 58 07             	lea    0x7(%eax),%ebx
 ac1:	c1 eb 03             	shr    $0x3,%ebx
 ac4:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 ac7:	8b 0d 80 11 00 00    	mov    0x1180,%ecx
 acd:	85 c9                	test   %ecx,%ecx
 acf:	74 04                	je     ad5 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad1:	8b 01                	mov    (%ecx),%eax
 ad3:	eb 4a                	jmp    b1f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 ad5:	c7 05 80 11 00 00 84 	movl   $0x1184,0x1180
 adc:	11 00 00 
 adf:	c7 05 84 11 00 00 84 	movl   $0x1184,0x1184
 ae6:	11 00 00 
    base.s.size = 0;
 ae9:	c7 05 88 11 00 00 00 	movl   $0x0,0x1188
 af0:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 af3:	b9 84 11 00 00       	mov    $0x1184,%ecx
 af8:	eb d7                	jmp    ad1 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 afa:	74 19                	je     b15 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 afc:	29 da                	sub    %ebx,%edx
 afe:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 b01:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 b04:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 b07:	89 0d 80 11 00 00    	mov    %ecx,0x1180
      return (void*)(p + 1);
 b0d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 b10:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b13:	c9                   	leave  
 b14:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 b15:	8b 10                	mov    (%eax),%edx
 b17:	89 11                	mov    %edx,(%ecx)
 b19:	eb ec                	jmp    b07 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b1b:	89 c1                	mov    %eax,%ecx
 b1d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 b1f:	8b 50 04             	mov    0x4(%eax),%edx
 b22:	39 da                	cmp    %ebx,%edx
 b24:	73 d4                	jae    afa <malloc+0x46>
    if(p == freep)
 b26:	39 05 80 11 00 00    	cmp    %eax,0x1180
 b2c:	75 ed                	jne    b1b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 b2e:	89 d8                	mov    %ebx,%eax
 b30:	e8 2f ff ff ff       	call   a64 <morecore>
 b35:	85 c0                	test   %eax,%eax
 b37:	75 e2                	jne    b1b <malloc+0x67>
 b39:	eb d5                	jmp    b10 <malloc+0x5c>
