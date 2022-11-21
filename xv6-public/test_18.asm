
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
   6:	68 60 0e 00 00       	push   $0xe60
   b:	e8 9b 03 00 00       	call   3ab <lock_acquire>
    for(j=0;j<50;j++);
  10:	83 c4 10             	add    $0x10,%esp
  13:	b8 00 00 00 00       	mov    $0x0,%eax
  18:	eb 03                	jmp    1d <worker2+0x1d>
  1a:	83 c0 01             	add    $0x1,%eax
  1d:	83 f8 31             	cmp    $0x31,%eax
  20:	7e f8                	jle    1a <worker2+0x1a>
    global++;
  22:	83 05 64 0e 00 00 01 	addl   $0x1,0xe64
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 60 0e 00 00       	push   $0xe60
  31:	e8 97 03 00 00       	call   3cd <lock_release>
    exit();
  36:	e8 4d 05 00 00       	call   588 <exit>

0000003b <worker>:
    
}
void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %ebx
  3f:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
  42:	68 60 0e 00 00       	push   $0xe60
  47:	e8 5f 03 00 00       	call   3ab <lock_acquire>
    int j;
    for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb 03                	jmp    59 <worker+0x1e>
  56:	83 c0 01             	add    $0x1,%eax
  59:	83 f8 31             	cmp    $0x31,%eax
  5c:	7e f8                	jle    56 <worker+0x1b>
    global++;
  5e:	83 05 64 0e 00 00 01 	addl   $0x1,0xe64
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 60 0e 00 00       	push   $0xe60
  6d:	e8 5b 03 00 00       	call   3cd <lock_release>

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
  8c:	e8 c9 02 00 00       	call   35a <thread_join>
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
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
 190:	e8 73 04 00 00       	call   608 <getpid>
 195:	a3 68 0e 00 00       	mov    %eax,0xe68
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 60 0e 00 00       	push   $0xe60
 1a2:	e8 34 02 00 00       	call   3db <lock_init>
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	39 1d 48 0e 00 00    	cmp    %ebx,0xe48
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
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
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

000002e9 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

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
}
 34e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 351:	c9                   	leave  
 352:	c3                   	ret    
    return -1;
 353:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 358:	eb f4                	jmp    34e <thread_create+0x54>

0000035a <thread_join>:

//TODO: fix
int thread_join() {
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

char*
strcpy(char *s, const char *t)
{
 3e9:	55                   	push   %ebp
 3ea:	89 e5                	mov    %esp,%ebp
 3ec:	56                   	push   %esi
 3ed:	53                   	push   %ebx
 3ee:	8b 75 08             	mov    0x8(%ebp),%esi
 3f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
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

int
strcmp(const char *p, const char *q)
{
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

uint
strlen(const char *s)
{
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

void*
memset(void *dst, int c, uint n)
{
 44d:	55                   	push   %ebp
 44e:	89 e5                	mov    %esp,%ebp
 450:	57                   	push   %edi
 451:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
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

char*
strchr(const char *s, char c)
{
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

char*
gets(char *buf, int max)
{
 489:	55                   	push   %ebp
 48a:	89 e5                	mov    %esp,%ebp
 48c:	57                   	push   %edi
 48d:	56                   	push   %esi
 48e:	53                   	push   %ebx
 48f:	83 ec 1c             	sub    $0x1c,%esp
 492:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
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

int
stat(const char *n, struct stat *st)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	56                   	push   %esi
 4e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
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

int
atoi(const char *s)
{
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

void*
memmove(void *vdst, const void *vsrc, int n)
{
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	56                   	push   %esi
 558:	53                   	push   %ebx
 559:	8b 75 08             	mov    0x8(%ebp),%esi
 55c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 55f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
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
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
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
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
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

static void
printint(int fd, int xx, int base, int sgn)
{
 652:	55                   	push   %ebp
 653:	89 e5                	mov    %esp,%ebp
 655:	57                   	push   %edi
 656:	56                   	push   %esi
 657:	53                   	push   %ebx
 658:	83 ec 2c             	sub    $0x2c,%esp
 65b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 65e:	89 d0                	mov    %edx,%eax
 660:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
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
  } else {
    x = xx;
  }

  i = 0;
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

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6dd:	55                   	push   %ebp
 6de:	89 e5                	mov    %esp,%ebp
 6e0:	57                   	push   %edi
 6e1:	56                   	push   %esi
 6e2:	53                   	push   %ebx
 6e3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6e6:	8d 45 10             	lea    0x10(%ebp),%eax
 6e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6ec:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6f1:	bb 00 00 00 00       	mov    $0x0,%ebx
 6f6:	eb 14                	jmp    70c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
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
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
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
static Header base;
static Header *freep;

void
free(void *ap)
{
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
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 87e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 881:	8b 50 04             	mov    0x4(%eax),%edx
 884:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 887:	39 ce                	cmp    %ecx,%esi
 889:	74 1b                	je     8a6 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
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

static Header*
morecore(uint nu)
{
 8b3:	55                   	push   %ebp
 8b4:	89 e5                	mov    %esp,%ebp
 8b6:	53                   	push   %ebx
 8b7:	83 ec 04             	sub    $0x4,%esp
 8ba:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
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

void*
malloc(uint nbytes)
{
 903:	55                   	push   %ebp
 904:	89 e5                	mov    %esp,%ebp
 906:	53                   	push   %ebx
 907:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 90a:	8b 45 08             	mov    0x8(%ebp),%eax
 90d:	8d 58 07             	lea    0x7(%eax),%ebx
 910:	c1 eb 03             	shr    $0x3,%ebx
 913:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 916:	8b 0d 80 0f 00 00    	mov    0xf80,%ecx
 91c:	85 c9                	test   %ecx,%ecx
 91e:	74 04                	je     924 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
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
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
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
