
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
  18:	a1 48 10 00 00       	mov    0x1048,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 48 10 00 00       	mov    %eax,0x1048
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 34 0b 00 00       	push   $0xb34
  37:	68 3e 0b 00 00       	push   $0xb3e
  3c:	6a 01                	push   $0x1
  3e:	e8 43 08 00 00       	call   886 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 46 0b 00 00       	push   $0xb46
  4b:	68 55 0b 00 00       	push   $0xb55
  50:	6a 01                	push   $0x1
  52:	e8 2f 08 00 00       	call   886 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 69 0b 00 00       	push   $0xb69
  5f:	6a 01                	push   $0x1
  61:	e8 20 08 00 00       	call   886 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 60 10 00 00    	push   0x1060
  6f:	e8 ed 06 00 00       	call   761 <kill>
  74:	e8 b8 06 00 00       	call   731 <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 34 0b 00 00       	push   $0xb34
  80:	68 3e 0b 00 00       	push   $0xb3e
  85:	6a 01                	push   $0x1
  87:	e8 fa 07 00 00       	call   886 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 76 0b 00 00       	push   $0xb76
  94:	68 55 0b 00 00       	push   $0xb55
  99:	6a 01                	push   $0x1
  9b:	e8 e6 07 00 00       	call   886 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 69 0b 00 00       	push   $0xb69
  a8:	6a 01                	push   $0x1
  aa:	e8 d7 07 00 00       	call   886 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 60 10 00 00    	push   0x1060
  b8:	e8 a4 06 00 00       	call   761 <kill>
  bd:	e8 6f 06 00 00       	call   731 <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 34 0b 00 00       	push   $0xb34
  c9:	68 3e 0b 00 00       	push   $0xb3e
  ce:	6a 01                	push   $0x1
  d0:	e8 b1 07 00 00       	call   886 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 85 0b 00 00       	push   $0xb85
  dd:	68 55 0b 00 00       	push   $0xb55
  e2:	6a 01                	push   $0x1
  e4:	e8 9d 07 00 00       	call   886 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 69 0b 00 00       	push   $0xb69
  f1:	6a 01                	push   $0x1
  f3:	e8 8e 07 00 00       	call   886 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 60 10 00 00    	push   0x1060
 101:	e8 5b 06 00 00       	call   761 <kill>
 106:	e8 26 06 00 00       	call   731 <exit>

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
 130:	a1 48 10 00 00       	mov    0x1048,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 34 0b 00 00       	push   $0xb34
 145:	68 3e 0b 00 00       	push   $0xb3e
 14a:	6a 01                	push   $0x1
 14c:	e8 35 07 00 00       	call   886 <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 a7 0b 00 00       	push   $0xba7
 159:	68 55 0b 00 00       	push   $0xb55
 15e:	6a 01                	push   $0x1
 160:	e8 21 07 00 00       	call   886 <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 69 0b 00 00       	push   $0xb69
 16d:	6a 01                	push   $0x1
 16f:	e8 12 07 00 00       	call   886 <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 60 10 00 00    	push   0x1060
 17d:	e8 df 05 00 00       	call   761 <kill>
 182:	e8 aa 05 00 00       	call   731 <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 34 0b 00 00       	push   $0xb34
 18e:	68 3e 0b 00 00       	push   $0xb3e
 193:	6a 01                	push   $0x1
 195:	e8 ec 06 00 00       	call   886 <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 91 0b 00 00       	push   $0xb91
 1a2:	68 55 0b 00 00       	push   $0xb55
 1a7:	6a 01                	push   $0x1
 1a9:	e8 d8 06 00 00       	call   886 <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 69 0b 00 00       	push   $0xb69
 1b6:	6a 01                	push   $0x1
 1b8:	e8 c9 06 00 00       	call   886 <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 60 10 00 00    	push   0x1060
 1c6:	e8 96 05 00 00       	call   761 <kill>
 1cb:	e8 61 05 00 00       	call   731 <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 34 0b 00 00       	push   $0xb34
 1d7:	68 3e 0b 00 00       	push   $0xb3e
 1dc:	6a 01                	push   $0x1
 1de:	e8 a3 06 00 00       	call   886 <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 9c 0b 00 00       	push   $0xb9c
 1eb:	68 55 0b 00 00       	push   $0xb55
 1f0:	6a 01                	push   $0x1
 1f2:	e8 8f 06 00 00       	call   886 <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 69 0b 00 00       	push   $0xb69
 1ff:	6a 01                	push   $0x1
 201:	e8 80 06 00 00       	call   886 <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 60 10 00 00    	push   0x1060
 20f:	e8 4d 05 00 00       	call   761 <kill>
 214:	e8 18 05 00 00       	call   731 <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 48 10 00 00       	mov    %eax,0x1048

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
 248:	68 34 0b 00 00       	push   $0xb34
 24d:	68 3e 0b 00 00       	push   $0xb3e
 252:	6a 01                	push   $0x1
 254:	e8 2d 06 00 00       	call   886 <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 b3 0b 00 00       	push   $0xbb3
 261:	68 55 0b 00 00       	push   $0xb55
 266:	6a 01                	push   $0x1
 268:	e8 19 06 00 00       	call   886 <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 69 0b 00 00       	push   $0xb69
 275:	6a 01                	push   $0x1
 277:	e8 0a 06 00 00       	call   886 <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 60 10 00 00    	push   0x1060
 285:	e8 d7 04 00 00       	call   761 <kill>
 28a:	e8 a2 04 00 00       	call   731 <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 65 02 00 00       	call   503 <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 34 0b 00 00       	push   $0xb34
 2b1:	68 3e 0b 00 00       	push   $0xb3e
 2b6:	6a 01                	push   $0x1
 2b8:	e8 c9 05 00 00       	call   886 <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 0c 0c 00 00       	push   $0xc0c
 2c5:	68 55 0b 00 00       	push   $0xb55
 2ca:	6a 01                	push   $0x1
 2cc:	e8 b5 05 00 00       	call   886 <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 69 0b 00 00       	push   $0xb69
 2d9:	6a 01                	push   $0x1
 2db:	e8 a6 05 00 00       	call   886 <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 60 10 00 00    	push   0x1060
 2e9:	e8 73 04 00 00       	call   761 <kill>
 2ee:	e8 3e 04 00 00       	call   731 <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 34 0b 00 00       	push   $0xb34
 2fa:	68 3e 0b 00 00       	push   $0xb3e
 2ff:	6a 01                	push   $0x1
 301:	e8 80 05 00 00       	call   886 <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 c9 0b 00 00       	push   $0xbc9
 30e:	68 55 0b 00 00       	push   $0xb55
 313:	6a 01                	push   $0x1
 315:	e8 6c 05 00 00       	call   886 <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 69 0b 00 00       	push   $0xb69
 322:	6a 01                	push   $0x1
 324:	e8 5d 05 00 00       	call   886 <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 60 10 00 00    	push   0x1060
 332:	e8 2a 04 00 00       	call   761 <kill>
 337:	e8 f5 03 00 00       	call   731 <exit>
   exit();
 33c:	e8 f0 03 00 00       	call   731 <exit>

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
 353:	e8 59 04 00 00       	call   7b1 <getpid>
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
 389:	e8 75 01 00 00       	call   503 <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d 48 10 00 00 03 	cmpl   $0x3,0x1048
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 34 0b 00 00       	push   $0xb34
 3aa:	68 3e 0b 00 00       	push   $0xb3e
 3af:	6a 01                	push   $0x1
 3b1:	e8 d0 04 00 00       	call   886 <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 f0 0b 00 00       	push   $0xbf0
 3be:	68 55 0b 00 00       	push   $0xb55
 3c3:	6a 01                	push   $0x1
 3c5:	e8 bc 04 00 00       	call   886 <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 69 0b 00 00       	push   $0xb69
 3d2:	6a 01                	push   $0x1
 3d4:	e8 ad 04 00 00       	call   886 <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 60 10 00 00    	push   0x1060
 3e2:	e8 7a 03 00 00       	call   761 <kill>
 3e7:	e8 45 03 00 00       	call   731 <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 34 0b 00 00       	push   $0xb34
 3f3:	68 3e 0b 00 00       	push   $0xb3e
 3f8:	6a 01                	push   $0x1
 3fa:	e8 87 04 00 00       	call   886 <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 ba 0b 00 00       	push   $0xbba
 407:	68 55 0b 00 00       	push   $0xb55
 40c:	6a 01                	push   $0x1
 40e:	e8 73 04 00 00       	call   886 <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 69 0b 00 00       	push   $0xb69
 41b:	6a 01                	push   $0x1
 41d:	e8 64 04 00 00       	call   886 <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 60 10 00 00    	push   0x1060
 42b:	e8 31 03 00 00       	call   761 <kill>
 430:	e8 fc 02 00 00       	call   731 <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 34 0b 00 00       	push   $0xb34
 43c:	68 3e 0b 00 00       	push   $0xb3e
 441:	6a 01                	push   $0x1
 443:	e8 3e 04 00 00       	call   886 <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 d9 0b 00 00       	push   $0xbd9
 450:	68 55 0b 00 00       	push   $0xb55
 455:	6a 01                	push   $0x1
 457:	e8 2a 04 00 00       	call   886 <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 69 0b 00 00       	push   $0xb69
 464:	6a 01                	push   $0x1
 466:	e8 1b 04 00 00       	call   886 <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 60 10 00 00    	push   0x1060
 474:	e8 e8 02 00 00       	call   761 <kill>
 479:	e8 b3 02 00 00       	call   731 <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 fc 0b 00 00       	push   $0xbfc
 486:	6a 01                	push   $0x1
 488:	e8 f9 03 00 00       	call   886 <printf>
   exit();
 48d:	e8 9f 02 00 00       	call   731 <exit>

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
 4a6:	53                   	push   %ebx
 4a7:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 4aa:	68 00 20 00 00       	push   $0x2000
 4af:	e8 f8 05 00 00       	call   aac <malloc>
  if(n_stack == 0){
 4b4:	83 c4 10             	add    $0x10,%esp
 4b7:	85 c0                	test   %eax,%eax
 4b9:	74 41                	je     4fc <thread_create+0x59>
 4bb:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 4bd:	50                   	push   %eax
 4be:	ff 75 10             	push   0x10(%ebp)
 4c1:	ff 75 0c             	push   0xc(%ebp)
 4c4:	ff 75 08             	push   0x8(%ebp)
 4c7:	e8 05 03 00 00       	call   7d1 <clone>

  for(int i=0; i<64; i++){
 4cc:	83 c4 10             	add    $0x10,%esp
 4cf:	ba 00 00 00 00       	mov    $0x0,%edx
 4d4:	eb 03                	jmp    4d9 <thread_create+0x36>
 4d6:	83 c2 01             	add    $0x1,%edx
 4d9:	83 fa 3f             	cmp    $0x3f,%edx
 4dc:	7f 19                	jg     4f7 <thread_create+0x54>
    if(threads[i]->flag==0){
 4de:	8b 0c 95 80 10 00 00 	mov    0x1080(,%edx,4),%ecx
 4e5:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 4e9:	75 eb                	jne    4d6 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 4eb:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 4ed:	8b 14 95 80 10 00 00 	mov    0x1080(,%edx,4),%edx
 4f4:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 4f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4fa:	c9                   	leave  
 4fb:	c3                   	ret    
    return -1;
 4fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 501:	eb f4                	jmp    4f7 <thread_create+0x54>

00000503 <thread_join>:

//TODO: fix
int thread_join() {
 503:	55                   	push   %ebp
 504:	89 e5                	mov    %esp,%ebp
 506:	56                   	push   %esi
 507:	53                   	push   %ebx
 508:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 50b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 50e:	50                   	push   %eax
 50f:	e8 c5 02 00 00       	call   7d9 <join>
 514:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 516:	83 c4 10             	add    $0x10,%esp
 519:	bb 00 00 00 00       	mov    $0x0,%ebx
 51e:	eb 03                	jmp    523 <thread_join+0x20>
 520:	83 c3 01             	add    $0x1,%ebx
 523:	83 fb 3f             	cmp    $0x3f,%ebx
 526:	7f 23                	jg     54b <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 528:	8b 04 9d 80 10 00 00 	mov    0x1080(,%ebx,4),%eax
 52f:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 533:	75 eb                	jne    520 <thread_join+0x1d>
 535:	8b 55 f4             	mov    -0xc(%ebp),%edx
 538:	39 50 04             	cmp    %edx,0x4(%eax)
 53b:	75 e3                	jne    520 <thread_join+0x1d>
      free(stk_addr);
 53d:	83 ec 0c             	sub    $0xc,%esp
 540:	52                   	push   %edx
 541:	e8 a6 04 00 00       	call   9ec <free>
 546:	83 c4 10             	add    $0x10,%esp
 549:	eb d5                	jmp    520 <thread_join+0x1d>
    }
  }
  return pid;
}
 54b:	89 f0                	mov    %esi,%eax
 54d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 550:	5b                   	pop    %ebx
 551:	5e                   	pop    %esi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    

00000554 <lock_acquire>:

void lock_acquire(lock_t *lock){
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	53                   	push   %ebx
 558:	83 ec 04             	sub    $0x4,%esp
 55b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 55e:	83 ec 08             	sub    $0x8,%esp
 561:	6a 01                	push   $0x1
 563:	53                   	push   %ebx
 564:	e8 29 ff ff ff       	call   492 <test_and_set>
 569:	83 c4 10             	add    $0x10,%esp
 56c:	83 f8 01             	cmp    $0x1,%eax
 56f:	74 ed                	je     55e <lock_acquire+0xa>
    ;
}
 571:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 574:	c9                   	leave  
 575:	c3                   	ret    

00000576 <lock_release>:

void lock_release(lock_t *lock) {
 576:	55                   	push   %ebp
 577:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    

00000584 <lock_init>:

void lock_init(lock_t *lock) {
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 590:	5d                   	pop    %ebp
 591:	c3                   	ret    

00000592 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 592:	55                   	push   %ebp
 593:	89 e5                	mov    %esp,%ebp
 595:	56                   	push   %esi
 596:	53                   	push   %ebx
 597:	8b 75 08             	mov    0x8(%ebp),%esi
 59a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 59d:	89 f0                	mov    %esi,%eax
 59f:	89 d1                	mov    %edx,%ecx
 5a1:	83 c2 01             	add    $0x1,%edx
 5a4:	89 c3                	mov    %eax,%ebx
 5a6:	83 c0 01             	add    $0x1,%eax
 5a9:	0f b6 09             	movzbl (%ecx),%ecx
 5ac:	88 0b                	mov    %cl,(%ebx)
 5ae:	84 c9                	test   %cl,%cl
 5b0:	75 ed                	jne    59f <strcpy+0xd>
    ;
  return os;
}
 5b2:	89 f0                	mov    %esi,%eax
 5b4:	5b                   	pop    %ebx
 5b5:	5e                   	pop    %esi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    

000005b8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 5b8:	55                   	push   %ebp
 5b9:	89 e5                	mov    %esp,%ebp
 5bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5be:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 5c1:	eb 06                	jmp    5c9 <strcmp+0x11>
    p++, q++;
 5c3:	83 c1 01             	add    $0x1,%ecx
 5c6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 5c9:	0f b6 01             	movzbl (%ecx),%eax
 5cc:	84 c0                	test   %al,%al
 5ce:	74 04                	je     5d4 <strcmp+0x1c>
 5d0:	3a 02                	cmp    (%edx),%al
 5d2:	74 ef                	je     5c3 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 5d4:	0f b6 c0             	movzbl %al,%eax
 5d7:	0f b6 12             	movzbl (%edx),%edx
 5da:	29 d0                	sub    %edx,%eax
}
 5dc:	5d                   	pop    %ebp
 5dd:	c3                   	ret    

000005de <strlen>:

uint
strlen(const char *s)
{
 5de:	55                   	push   %ebp
 5df:	89 e5                	mov    %esp,%ebp
 5e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5e4:	b8 00 00 00 00       	mov    $0x0,%eax
 5e9:	eb 03                	jmp    5ee <strlen+0x10>
 5eb:	83 c0 01             	add    $0x1,%eax
 5ee:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 5f2:	75 f7                	jne    5eb <strlen+0xd>
    ;
  return n;
}
 5f4:	5d                   	pop    %ebp
 5f5:	c3                   	ret    

000005f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 5f6:	55                   	push   %ebp
 5f7:	89 e5                	mov    %esp,%ebp
 5f9:	57                   	push   %edi
 5fa:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5fd:	89 d7                	mov    %edx,%edi
 5ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
 602:	8b 45 0c             	mov    0xc(%ebp),%eax
 605:	fc                   	cld    
 606:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 608:	89 d0                	mov    %edx,%eax
 60a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 60d:	c9                   	leave  
 60e:	c3                   	ret    

0000060f <strchr>:

char*
strchr(const char *s, char c)
{
 60f:	55                   	push   %ebp
 610:	89 e5                	mov    %esp,%ebp
 612:	8b 45 08             	mov    0x8(%ebp),%eax
 615:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 619:	eb 03                	jmp    61e <strchr+0xf>
 61b:	83 c0 01             	add    $0x1,%eax
 61e:	0f b6 10             	movzbl (%eax),%edx
 621:	84 d2                	test   %dl,%dl
 623:	74 06                	je     62b <strchr+0x1c>
    if(*s == c)
 625:	38 ca                	cmp    %cl,%dl
 627:	75 f2                	jne    61b <strchr+0xc>
 629:	eb 05                	jmp    630 <strchr+0x21>
      return (char*)s;
  return 0;
 62b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 630:	5d                   	pop    %ebp
 631:	c3                   	ret    

00000632 <gets>:

char*
gets(char *buf, int max)
{
 632:	55                   	push   %ebp
 633:	89 e5                	mov    %esp,%ebp
 635:	57                   	push   %edi
 636:	56                   	push   %esi
 637:	53                   	push   %ebx
 638:	83 ec 1c             	sub    $0x1c,%esp
 63b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 63e:	bb 00 00 00 00       	mov    $0x0,%ebx
 643:	89 de                	mov    %ebx,%esi
 645:	83 c3 01             	add    $0x1,%ebx
 648:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 64b:	7d 2e                	jge    67b <gets+0x49>
    cc = read(0, &c, 1);
 64d:	83 ec 04             	sub    $0x4,%esp
 650:	6a 01                	push   $0x1
 652:	8d 45 e7             	lea    -0x19(%ebp),%eax
 655:	50                   	push   %eax
 656:	6a 00                	push   $0x0
 658:	e8 ec 00 00 00       	call   749 <read>
    if(cc < 1)
 65d:	83 c4 10             	add    $0x10,%esp
 660:	85 c0                	test   %eax,%eax
 662:	7e 17                	jle    67b <gets+0x49>
      break;
    buf[i++] = c;
 664:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 668:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 66b:	3c 0a                	cmp    $0xa,%al
 66d:	0f 94 c2             	sete   %dl
 670:	3c 0d                	cmp    $0xd,%al
 672:	0f 94 c0             	sete   %al
 675:	08 c2                	or     %al,%dl
 677:	74 ca                	je     643 <gets+0x11>
    buf[i++] = c;
 679:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 67b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 67f:	89 f8                	mov    %edi,%eax
 681:	8d 65 f4             	lea    -0xc(%ebp),%esp
 684:	5b                   	pop    %ebx
 685:	5e                   	pop    %esi
 686:	5f                   	pop    %edi
 687:	5d                   	pop    %ebp
 688:	c3                   	ret    

00000689 <stat>:

int
stat(const char *n, struct stat *st)
{
 689:	55                   	push   %ebp
 68a:	89 e5                	mov    %esp,%ebp
 68c:	56                   	push   %esi
 68d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 68e:	83 ec 08             	sub    $0x8,%esp
 691:	6a 00                	push   $0x0
 693:	ff 75 08             	push   0x8(%ebp)
 696:	e8 d6 00 00 00       	call   771 <open>
  if(fd < 0)
 69b:	83 c4 10             	add    $0x10,%esp
 69e:	85 c0                	test   %eax,%eax
 6a0:	78 24                	js     6c6 <stat+0x3d>
 6a2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 6a4:	83 ec 08             	sub    $0x8,%esp
 6a7:	ff 75 0c             	push   0xc(%ebp)
 6aa:	50                   	push   %eax
 6ab:	e8 d9 00 00 00       	call   789 <fstat>
 6b0:	89 c6                	mov    %eax,%esi
  close(fd);
 6b2:	89 1c 24             	mov    %ebx,(%esp)
 6b5:	e8 9f 00 00 00       	call   759 <close>
  return r;
 6ba:	83 c4 10             	add    $0x10,%esp
}
 6bd:	89 f0                	mov    %esi,%eax
 6bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6c2:	5b                   	pop    %ebx
 6c3:	5e                   	pop    %esi
 6c4:	5d                   	pop    %ebp
 6c5:	c3                   	ret    
    return -1;
 6c6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 6cb:	eb f0                	jmp    6bd <stat+0x34>

000006cd <atoi>:

int
atoi(const char *s)
{
 6cd:	55                   	push   %ebp
 6ce:	89 e5                	mov    %esp,%ebp
 6d0:	53                   	push   %ebx
 6d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 6d4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 6d9:	eb 10                	jmp    6eb <atoi+0x1e>
    n = n*10 + *s++ - '0';
 6db:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 6de:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 6e1:	83 c1 01             	add    $0x1,%ecx
 6e4:	0f be c0             	movsbl %al,%eax
 6e7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 6eb:	0f b6 01             	movzbl (%ecx),%eax
 6ee:	8d 58 d0             	lea    -0x30(%eax),%ebx
 6f1:	80 fb 09             	cmp    $0x9,%bl
 6f4:	76 e5                	jbe    6db <atoi+0xe>
  return n;
}
 6f6:	89 d0                	mov    %edx,%eax
 6f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6fb:	c9                   	leave  
 6fc:	c3                   	ret    

000006fd <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6fd:	55                   	push   %ebp
 6fe:	89 e5                	mov    %esp,%ebp
 700:	56                   	push   %esi
 701:	53                   	push   %ebx
 702:	8b 75 08             	mov    0x8(%ebp),%esi
 705:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 708:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 70b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 70d:	eb 0d                	jmp    71c <memmove+0x1f>
    *dst++ = *src++;
 70f:	0f b6 01             	movzbl (%ecx),%eax
 712:	88 02                	mov    %al,(%edx)
 714:	8d 49 01             	lea    0x1(%ecx),%ecx
 717:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 71a:	89 d8                	mov    %ebx,%eax
 71c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 71f:	85 c0                	test   %eax,%eax
 721:	7f ec                	jg     70f <memmove+0x12>
  return vdst;
}
 723:	89 f0                	mov    %esi,%eax
 725:	5b                   	pop    %ebx
 726:	5e                   	pop    %esi
 727:	5d                   	pop    %ebp
 728:	c3                   	ret    

00000729 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 729:	b8 01 00 00 00       	mov    $0x1,%eax
 72e:	cd 40                	int    $0x40
 730:	c3                   	ret    

00000731 <exit>:
SYSCALL(exit)
 731:	b8 02 00 00 00       	mov    $0x2,%eax
 736:	cd 40                	int    $0x40
 738:	c3                   	ret    

00000739 <wait>:
SYSCALL(wait)
 739:	b8 03 00 00 00       	mov    $0x3,%eax
 73e:	cd 40                	int    $0x40
 740:	c3                   	ret    

00000741 <pipe>:
SYSCALL(pipe)
 741:	b8 04 00 00 00       	mov    $0x4,%eax
 746:	cd 40                	int    $0x40
 748:	c3                   	ret    

00000749 <read>:
SYSCALL(read)
 749:	b8 05 00 00 00       	mov    $0x5,%eax
 74e:	cd 40                	int    $0x40
 750:	c3                   	ret    

00000751 <write>:
SYSCALL(write)
 751:	b8 10 00 00 00       	mov    $0x10,%eax
 756:	cd 40                	int    $0x40
 758:	c3                   	ret    

00000759 <close>:
SYSCALL(close)
 759:	b8 15 00 00 00       	mov    $0x15,%eax
 75e:	cd 40                	int    $0x40
 760:	c3                   	ret    

00000761 <kill>:
SYSCALL(kill)
 761:	b8 06 00 00 00       	mov    $0x6,%eax
 766:	cd 40                	int    $0x40
 768:	c3                   	ret    

00000769 <exec>:
SYSCALL(exec)
 769:	b8 07 00 00 00       	mov    $0x7,%eax
 76e:	cd 40                	int    $0x40
 770:	c3                   	ret    

00000771 <open>:
SYSCALL(open)
 771:	b8 0f 00 00 00       	mov    $0xf,%eax
 776:	cd 40                	int    $0x40
 778:	c3                   	ret    

00000779 <mknod>:
SYSCALL(mknod)
 779:	b8 11 00 00 00       	mov    $0x11,%eax
 77e:	cd 40                	int    $0x40
 780:	c3                   	ret    

00000781 <unlink>:
SYSCALL(unlink)
 781:	b8 12 00 00 00       	mov    $0x12,%eax
 786:	cd 40                	int    $0x40
 788:	c3                   	ret    

00000789 <fstat>:
SYSCALL(fstat)
 789:	b8 08 00 00 00       	mov    $0x8,%eax
 78e:	cd 40                	int    $0x40
 790:	c3                   	ret    

00000791 <link>:
SYSCALL(link)
 791:	b8 13 00 00 00       	mov    $0x13,%eax
 796:	cd 40                	int    $0x40
 798:	c3                   	ret    

00000799 <mkdir>:
SYSCALL(mkdir)
 799:	b8 14 00 00 00       	mov    $0x14,%eax
 79e:	cd 40                	int    $0x40
 7a0:	c3                   	ret    

000007a1 <chdir>:
SYSCALL(chdir)
 7a1:	b8 09 00 00 00       	mov    $0x9,%eax
 7a6:	cd 40                	int    $0x40
 7a8:	c3                   	ret    

000007a9 <dup>:
SYSCALL(dup)
 7a9:	b8 0a 00 00 00       	mov    $0xa,%eax
 7ae:	cd 40                	int    $0x40
 7b0:	c3                   	ret    

000007b1 <getpid>:
SYSCALL(getpid)
 7b1:	b8 0b 00 00 00       	mov    $0xb,%eax
 7b6:	cd 40                	int    $0x40
 7b8:	c3                   	ret    

000007b9 <sbrk>:
SYSCALL(sbrk)
 7b9:	b8 0c 00 00 00       	mov    $0xc,%eax
 7be:	cd 40                	int    $0x40
 7c0:	c3                   	ret    

000007c1 <sleep>:
SYSCALL(sleep)
 7c1:	b8 0d 00 00 00       	mov    $0xd,%eax
 7c6:	cd 40                	int    $0x40
 7c8:	c3                   	ret    

000007c9 <uptime>:
SYSCALL(uptime)
 7c9:	b8 0e 00 00 00       	mov    $0xe,%eax
 7ce:	cd 40                	int    $0x40
 7d0:	c3                   	ret    

000007d1 <clone>:
SYSCALL(clone)
 7d1:	b8 16 00 00 00       	mov    $0x16,%eax
 7d6:	cd 40                	int    $0x40
 7d8:	c3                   	ret    

000007d9 <join>:
 7d9:	b8 17 00 00 00       	mov    $0x17,%eax
 7de:	cd 40                	int    $0x40
 7e0:	c3                   	ret    

000007e1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7e1:	55                   	push   %ebp
 7e2:	89 e5                	mov    %esp,%ebp
 7e4:	83 ec 1c             	sub    $0x1c,%esp
 7e7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 7ea:	6a 01                	push   $0x1
 7ec:	8d 55 f4             	lea    -0xc(%ebp),%edx
 7ef:	52                   	push   %edx
 7f0:	50                   	push   %eax
 7f1:	e8 5b ff ff ff       	call   751 <write>
}
 7f6:	83 c4 10             	add    $0x10,%esp
 7f9:	c9                   	leave  
 7fa:	c3                   	ret    

000007fb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7fb:	55                   	push   %ebp
 7fc:	89 e5                	mov    %esp,%ebp
 7fe:	57                   	push   %edi
 7ff:	56                   	push   %esi
 800:	53                   	push   %ebx
 801:	83 ec 2c             	sub    $0x2c,%esp
 804:	89 45 d0             	mov    %eax,-0x30(%ebp)
 807:	89 d0                	mov    %edx,%eax
 809:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 80b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80f:	0f 95 c1             	setne  %cl
 812:	c1 ea 1f             	shr    $0x1f,%edx
 815:	84 d1                	test   %dl,%cl
 817:	74 44                	je     85d <printint+0x62>
    neg = 1;
    x = -xx;
 819:	f7 d8                	neg    %eax
 81b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 81d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 824:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 829:	89 c8                	mov    %ecx,%eax
 82b:	ba 00 00 00 00       	mov    $0x0,%edx
 830:	f7 f6                	div    %esi
 832:	89 df                	mov    %ebx,%edi
 834:	83 c3 01             	add    $0x1,%ebx
 837:	0f b6 92 90 0c 00 00 	movzbl 0xc90(%edx),%edx
 83e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 842:	89 ca                	mov    %ecx,%edx
 844:	89 c1                	mov    %eax,%ecx
 846:	39 d6                	cmp    %edx,%esi
 848:	76 df                	jbe    829 <printint+0x2e>
  if(neg)
 84a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 84e:	74 31                	je     881 <printint+0x86>
    buf[i++] = '-';
 850:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 855:	8d 5f 02             	lea    0x2(%edi),%ebx
 858:	8b 75 d0             	mov    -0x30(%ebp),%esi
 85b:	eb 17                	jmp    874 <printint+0x79>
    x = xx;
 85d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 85f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 866:	eb bc                	jmp    824 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 868:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 86d:	89 f0                	mov    %esi,%eax
 86f:	e8 6d ff ff ff       	call   7e1 <putc>
  while(--i >= 0)
 874:	83 eb 01             	sub    $0x1,%ebx
 877:	79 ef                	jns    868 <printint+0x6d>
}
 879:	83 c4 2c             	add    $0x2c,%esp
 87c:	5b                   	pop    %ebx
 87d:	5e                   	pop    %esi
 87e:	5f                   	pop    %edi
 87f:	5d                   	pop    %ebp
 880:	c3                   	ret    
 881:	8b 75 d0             	mov    -0x30(%ebp),%esi
 884:	eb ee                	jmp    874 <printint+0x79>

00000886 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 886:	55                   	push   %ebp
 887:	89 e5                	mov    %esp,%ebp
 889:	57                   	push   %edi
 88a:	56                   	push   %esi
 88b:	53                   	push   %ebx
 88c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 88f:	8d 45 10             	lea    0x10(%ebp),%eax
 892:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 895:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 89a:	bb 00 00 00 00       	mov    $0x0,%ebx
 89f:	eb 14                	jmp    8b5 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 8a1:	89 fa                	mov    %edi,%edx
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	e8 36 ff ff ff       	call   7e1 <putc>
 8ab:	eb 05                	jmp    8b2 <printf+0x2c>
      }
    } else if(state == '%'){
 8ad:	83 fe 25             	cmp    $0x25,%esi
 8b0:	74 25                	je     8d7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 8b2:	83 c3 01             	add    $0x1,%ebx
 8b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 8b8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 8bc:	84 c0                	test   %al,%al
 8be:	0f 84 20 01 00 00    	je     9e4 <printf+0x15e>
    c = fmt[i] & 0xff;
 8c4:	0f be f8             	movsbl %al,%edi
 8c7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 8ca:	85 f6                	test   %esi,%esi
 8cc:	75 df                	jne    8ad <printf+0x27>
      if(c == '%'){
 8ce:	83 f8 25             	cmp    $0x25,%eax
 8d1:	75 ce                	jne    8a1 <printf+0x1b>
        state = '%';
 8d3:	89 c6                	mov    %eax,%esi
 8d5:	eb db                	jmp    8b2 <printf+0x2c>
      if(c == 'd'){
 8d7:	83 f8 25             	cmp    $0x25,%eax
 8da:	0f 84 cf 00 00 00    	je     9af <printf+0x129>
 8e0:	0f 8c dd 00 00 00    	jl     9c3 <printf+0x13d>
 8e6:	83 f8 78             	cmp    $0x78,%eax
 8e9:	0f 8f d4 00 00 00    	jg     9c3 <printf+0x13d>
 8ef:	83 f8 63             	cmp    $0x63,%eax
 8f2:	0f 8c cb 00 00 00    	jl     9c3 <printf+0x13d>
 8f8:	83 e8 63             	sub    $0x63,%eax
 8fb:	83 f8 15             	cmp    $0x15,%eax
 8fe:	0f 87 bf 00 00 00    	ja     9c3 <printf+0x13d>
 904:	ff 24 85 38 0c 00 00 	jmp    *0xc38(,%eax,4)
        printint(fd, *ap, 10, 1);
 90b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 90e:	8b 17                	mov    (%edi),%edx
 910:	83 ec 0c             	sub    $0xc,%esp
 913:	6a 01                	push   $0x1
 915:	b9 0a 00 00 00       	mov    $0xa,%ecx
 91a:	8b 45 08             	mov    0x8(%ebp),%eax
 91d:	e8 d9 fe ff ff       	call   7fb <printint>
        ap++;
 922:	83 c7 04             	add    $0x4,%edi
 925:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 928:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 92b:	be 00 00 00 00       	mov    $0x0,%esi
 930:	eb 80                	jmp    8b2 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 932:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 935:	8b 17                	mov    (%edi),%edx
 937:	83 ec 0c             	sub    $0xc,%esp
 93a:	6a 00                	push   $0x0
 93c:	b9 10 00 00 00       	mov    $0x10,%ecx
 941:	8b 45 08             	mov    0x8(%ebp),%eax
 944:	e8 b2 fe ff ff       	call   7fb <printint>
        ap++;
 949:	83 c7 04             	add    $0x4,%edi
 94c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 94f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 952:	be 00 00 00 00       	mov    $0x0,%esi
 957:	e9 56 ff ff ff       	jmp    8b2 <printf+0x2c>
        s = (char*)*ap;
 95c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 95f:	8b 30                	mov    (%eax),%esi
        ap++;
 961:	83 c0 04             	add    $0x4,%eax
 964:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 967:	85 f6                	test   %esi,%esi
 969:	75 15                	jne    980 <printf+0xfa>
          s = "(null)";
 96b:	be 31 0c 00 00       	mov    $0xc31,%esi
 970:	eb 0e                	jmp    980 <printf+0xfa>
          putc(fd, *s);
 972:	0f be d2             	movsbl %dl,%edx
 975:	8b 45 08             	mov    0x8(%ebp),%eax
 978:	e8 64 fe ff ff       	call   7e1 <putc>
          s++;
 97d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 980:	0f b6 16             	movzbl (%esi),%edx
 983:	84 d2                	test   %dl,%dl
 985:	75 eb                	jne    972 <printf+0xec>
      state = 0;
 987:	be 00 00 00 00       	mov    $0x0,%esi
 98c:	e9 21 ff ff ff       	jmp    8b2 <printf+0x2c>
        putc(fd, *ap);
 991:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 994:	0f be 17             	movsbl (%edi),%edx
 997:	8b 45 08             	mov    0x8(%ebp),%eax
 99a:	e8 42 fe ff ff       	call   7e1 <putc>
        ap++;
 99f:	83 c7 04             	add    $0x4,%edi
 9a2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 9a5:	be 00 00 00 00       	mov    $0x0,%esi
 9aa:	e9 03 ff ff ff       	jmp    8b2 <printf+0x2c>
        putc(fd, c);
 9af:	89 fa                	mov    %edi,%edx
 9b1:	8b 45 08             	mov    0x8(%ebp),%eax
 9b4:	e8 28 fe ff ff       	call   7e1 <putc>
      state = 0;
 9b9:	be 00 00 00 00       	mov    $0x0,%esi
 9be:	e9 ef fe ff ff       	jmp    8b2 <printf+0x2c>
        putc(fd, '%');
 9c3:	ba 25 00 00 00       	mov    $0x25,%edx
 9c8:	8b 45 08             	mov    0x8(%ebp),%eax
 9cb:	e8 11 fe ff ff       	call   7e1 <putc>
        putc(fd, c);
 9d0:	89 fa                	mov    %edi,%edx
 9d2:	8b 45 08             	mov    0x8(%ebp),%eax
 9d5:	e8 07 fe ff ff       	call   7e1 <putc>
      state = 0;
 9da:	be 00 00 00 00       	mov    $0x0,%esi
 9df:	e9 ce fe ff ff       	jmp    8b2 <printf+0x2c>
    }
  }
}
 9e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9e7:	5b                   	pop    %ebx
 9e8:	5e                   	pop    %esi
 9e9:	5f                   	pop    %edi
 9ea:	5d                   	pop    %ebp
 9eb:	c3                   	ret    

000009ec <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9ec:	55                   	push   %ebp
 9ed:	89 e5                	mov    %esp,%ebp
 9ef:	57                   	push   %edi
 9f0:	56                   	push   %esi
 9f1:	53                   	push   %ebx
 9f2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9f5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f8:	a1 80 11 00 00       	mov    0x1180,%eax
 9fd:	eb 02                	jmp    a01 <free+0x15>
 9ff:	89 d0                	mov    %edx,%eax
 a01:	39 c8                	cmp    %ecx,%eax
 a03:	73 04                	jae    a09 <free+0x1d>
 a05:	39 08                	cmp    %ecx,(%eax)
 a07:	77 12                	ja     a1b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a09:	8b 10                	mov    (%eax),%edx
 a0b:	39 c2                	cmp    %eax,%edx
 a0d:	77 f0                	ja     9ff <free+0x13>
 a0f:	39 c8                	cmp    %ecx,%eax
 a11:	72 08                	jb     a1b <free+0x2f>
 a13:	39 ca                	cmp    %ecx,%edx
 a15:	77 04                	ja     a1b <free+0x2f>
 a17:	89 d0                	mov    %edx,%eax
 a19:	eb e6                	jmp    a01 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a1b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a1e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a21:	8b 10                	mov    (%eax),%edx
 a23:	39 d7                	cmp    %edx,%edi
 a25:	74 19                	je     a40 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a27:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a2a:	8b 50 04             	mov    0x4(%eax),%edx
 a2d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a30:	39 ce                	cmp    %ecx,%esi
 a32:	74 1b                	je     a4f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a34:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a36:	a3 80 11 00 00       	mov    %eax,0x1180
}
 a3b:	5b                   	pop    %ebx
 a3c:	5e                   	pop    %esi
 a3d:	5f                   	pop    %edi
 a3e:	5d                   	pop    %ebp
 a3f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 a40:	03 72 04             	add    0x4(%edx),%esi
 a43:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a46:	8b 10                	mov    (%eax),%edx
 a48:	8b 12                	mov    (%edx),%edx
 a4a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a4d:	eb db                	jmp    a2a <free+0x3e>
    p->s.size += bp->s.size;
 a4f:	03 53 fc             	add    -0x4(%ebx),%edx
 a52:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a55:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a58:	89 10                	mov    %edx,(%eax)
 a5a:	eb da                	jmp    a36 <free+0x4a>

00000a5c <morecore>:

static Header*
morecore(uint nu)
{
 a5c:	55                   	push   %ebp
 a5d:	89 e5                	mov    %esp,%ebp
 a5f:	53                   	push   %ebx
 a60:	83 ec 04             	sub    $0x4,%esp
 a63:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a65:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a6a:	77 05                	ja     a71 <morecore+0x15>
    nu = 4096;
 a6c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a71:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a78:	83 ec 0c             	sub    $0xc,%esp
 a7b:	50                   	push   %eax
 a7c:	e8 38 fd ff ff       	call   7b9 <sbrk>
  if(p == (char*)-1)
 a81:	83 c4 10             	add    $0x10,%esp
 a84:	83 f8 ff             	cmp    $0xffffffff,%eax
 a87:	74 1c                	je     aa5 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a89:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a8c:	83 c0 08             	add    $0x8,%eax
 a8f:	83 ec 0c             	sub    $0xc,%esp
 a92:	50                   	push   %eax
 a93:	e8 54 ff ff ff       	call   9ec <free>
  return freep;
 a98:	a1 80 11 00 00       	mov    0x1180,%eax
 a9d:	83 c4 10             	add    $0x10,%esp
}
 aa0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aa3:	c9                   	leave  
 aa4:	c3                   	ret    
    return 0;
 aa5:	b8 00 00 00 00       	mov    $0x0,%eax
 aaa:	eb f4                	jmp    aa0 <morecore+0x44>

00000aac <malloc>:

void*
malloc(uint nbytes)
{
 aac:	55                   	push   %ebp
 aad:	89 e5                	mov    %esp,%ebp
 aaf:	53                   	push   %ebx
 ab0:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab3:	8b 45 08             	mov    0x8(%ebp),%eax
 ab6:	8d 58 07             	lea    0x7(%eax),%ebx
 ab9:	c1 eb 03             	shr    $0x3,%ebx
 abc:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 abf:	8b 0d 80 11 00 00    	mov    0x1180,%ecx
 ac5:	85 c9                	test   %ecx,%ecx
 ac7:	74 04                	je     acd <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac9:	8b 01                	mov    (%ecx),%eax
 acb:	eb 4a                	jmp    b17 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 acd:	c7 05 80 11 00 00 84 	movl   $0x1184,0x1180
 ad4:	11 00 00 
 ad7:	c7 05 84 11 00 00 84 	movl   $0x1184,0x1184
 ade:	11 00 00 
    base.s.size = 0;
 ae1:	c7 05 88 11 00 00 00 	movl   $0x0,0x1188
 ae8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 aeb:	b9 84 11 00 00       	mov    $0x1184,%ecx
 af0:	eb d7                	jmp    ac9 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 af2:	74 19                	je     b0d <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 af4:	29 da                	sub    %ebx,%edx
 af6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 af9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 afc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 aff:	89 0d 80 11 00 00    	mov    %ecx,0x1180
      return (void*)(p + 1);
 b05:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 b08:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b0b:	c9                   	leave  
 b0c:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 b0d:	8b 10                	mov    (%eax),%edx
 b0f:	89 11                	mov    %edx,(%ecx)
 b11:	eb ec                	jmp    aff <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b13:	89 c1                	mov    %eax,%ecx
 b15:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 b17:	8b 50 04             	mov    0x4(%eax),%edx
 b1a:	39 da                	cmp    %ebx,%edx
 b1c:	73 d4                	jae    af2 <malloc+0x46>
    if(p == freep)
 b1e:	39 05 80 11 00 00    	cmp    %eax,0x1180
 b24:	75 ed                	jne    b13 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 b26:	89 d8                	mov    %ebx,%eax
 b28:	e8 2f ff ff ff       	call   a5c <morecore>
 b2d:	85 c0                	test   %eax,%eax
 b2f:	75 e2                	jne    b13 <malloc+0x67>
 b31:	eb d5                	jmp    b08 <malloc+0x5c>
