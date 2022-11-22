
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
   b:	e8 a3 03 00 00       	call   3b3 <lock_acquire>
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
  31:	e8 9f 03 00 00       	call   3d5 <lock_release>
    exit();
  36:	e8 55 05 00 00       	call   590 <exit>

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
  47:	e8 67 03 00 00       	call   3b3 <lock_acquire>
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
  6d:	e8 63 03 00 00       	call   3d5 <lock_release>

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
  8c:	e8 d1 02 00 00       	call   362 <thread_join>
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
  a3:	68 94 09 00 00       	push   $0x994
  a8:	68 9e 09 00 00       	push   $0x99e
  ad:	6a 01                	push   $0x1
  af:	e8 31 06 00 00       	call   6e5 <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 18 0a 00 00       	push   $0xa18
  bc:	68 bc 09 00 00       	push   $0x9bc
  c1:	6a 01                	push   $0x1
  c3:	e8 1d 06 00 00       	call   6e5 <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 d0 09 00 00       	push   $0x9d0
  d0:	6a 01                	push   $0x1
  d2:	e8 0e 06 00 00       	call   6e5 <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 68 0e 00 00    	push   0xe68
  e0:	e8 db 04 00 00       	call   5c0 <kill>
  e5:	e8 a6 04 00 00       	call   590 <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 94 09 00 00       	push   $0x994
  f1:	68 9e 09 00 00       	push   $0x99e
  f6:	6a 01                	push   $0x1
  f8:	e8 e8 05 00 00       	call   6e5 <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 a6 09 00 00       	push   $0x9a6
 105:	68 bc 09 00 00       	push   $0x9bc
 10a:	6a 01                	push   $0x1
 10c:	e8 d4 05 00 00       	call   6e5 <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 d0 09 00 00       	push   $0x9d0
 119:	6a 01                	push   $0x1
 11b:	e8 c5 05 00 00       	call   6e5 <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 68 0e 00 00    	push   0xe68
 129:	e8 92 04 00 00       	call   5c0 <kill>
 12e:	e8 5d 04 00 00       	call   590 <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 94 09 00 00       	push   $0x994
 13a:	68 9e 09 00 00       	push   $0x99e
 13f:	6a 01                	push   $0x1
 141:	e8 9f 05 00 00       	call   6e5 <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 dd 09 00 00       	push   $0x9dd
 14e:	68 bc 09 00 00       	push   $0x9bc
 153:	6a 01                	push   $0x1
 155:	e8 8b 05 00 00       	call   6e5 <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 d0 09 00 00       	push   $0x9d0
 162:	6a 01                	push   $0x1
 164:	e8 7c 05 00 00       	call   6e5 <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 68 0e 00 00    	push   0xe68
 172:	e8 49 04 00 00       	call   5c0 <kill>
 177:	e8 14 04 00 00       	call   590 <exit>

   exit();
 17c:	e8 0f 04 00 00       	call   590 <exit>

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
 190:	e8 7b 04 00 00       	call   610 <getpid>
 195:	a3 68 0e 00 00       	mov    %eax,0xe68
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 60 0e 00 00       	push   $0xe60
 1a2:	e8 3c 02 00 00       	call   3e3 <lock_init>
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	39 1d 4c 0e 00 00    	cmp    %ebx,0xe4c
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
 1d6:	68 94 09 00 00       	push   $0x994
 1db:	68 9e 09 00 00       	push   $0x99e
 1e0:	6a 01                	push   $0x1
 1e2:	e8 fe 04 00 00       	call   6e5 <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 ad 09 00 00       	push   $0x9ad
 1ef:	68 bc 09 00 00       	push   $0x9bc
 1f4:	6a 01                	push   $0x1
 1f6:	e8 ea 04 00 00       	call   6e5 <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 d0 09 00 00       	push   $0x9d0
 203:	6a 01                	push   $0x1
 205:	e8 db 04 00 00       	call   6e5 <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 68 0e 00 00    	push   0xe68
 213:	e8 a8 03 00 00       	call   5c0 <kill>
 218:	e8 73 03 00 00       	call   590 <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 4c 0e 00 00       	mov    0xe4c,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 32 01 00 00       	call   362 <thread_join>
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
 23b:	68 94 09 00 00       	push   $0x994
 240:	68 9e 09 00 00       	push   $0x99e
 245:	6a 01                	push   $0x1
 247:	e8 99 04 00 00       	call   6e5 <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 e4 09 00 00       	push   $0x9e4
 254:	68 bc 09 00 00       	push   $0x9bc
 259:	6a 01                	push   $0x1
 25b:	e8 85 04 00 00       	call   6e5 <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 d0 09 00 00       	push   $0x9d0
 268:	6a 01                	push   $0x1
 26a:	e8 76 04 00 00       	call   6e5 <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 68 0e 00 00    	push   0xe68
 278:	e8 43 03 00 00       	call   5c0 <kill>
 27d:	e8 0e 03 00 00       	call   590 <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 64 0e 00 00    	cmp    0xe64,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 94 09 00 00       	push   $0x994
 293:	68 9e 09 00 00       	push   $0x99e
 298:	6a 01                	push   $0x1
 29a:	e8 46 04 00 00       	call   6e5 <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 f1 09 00 00       	push   $0x9f1
 2a7:	68 bc 09 00 00       	push   $0x9bc
 2ac:	6a 01                	push   $0x1
 2ae:	e8 32 04 00 00       	call   6e5 <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 d0 09 00 00       	push   $0x9d0
 2bb:	6a 01                	push   $0x1
 2bd:	e8 23 04 00 00       	call   6e5 <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 68 0e 00 00    	push   0xe68
 2cb:	e8 f0 02 00 00       	call   5c0 <kill>
 2d0:	e8 bb 02 00 00       	call   590 <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 0b 0a 00 00       	push   $0xa0b
 2dd:	6a 01                	push   $0x1
 2df:	e8 01 04 00 00       	call   6e5 <printf>
   exit();
 2e4:	e8 a7 02 00 00       	call   590 <exit>

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
 2fd:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 300:	68 00 20 00 00       	push   $0x2000
 305:	e8 01 06 00 00       	call   90b <malloc>
  if(n_stack == 0){
 30a:	83 c4 10             	add    $0x10,%esp
 30d:	85 c0                	test   %eax,%eax
 30f:	74 4a                	je     35b <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 311:	ba 00 00 00 00       	mov    $0x0,%edx
 316:	eb 03                	jmp    31b <thread_create+0x21>
 318:	83 c2 01             	add    $0x1,%edx
 31b:	83 fa 3f             	cmp    $0x3f,%edx
 31e:	7f 27                	jg     347 <thread_create+0x4d>
    if(threads[i]->flag==0){
 320:	8b 0c 95 80 0e 00 00 	mov    0xe80(,%edx,4),%ecx
 327:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 32b:	75 eb                	jne    318 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 32d:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 32f:	8b 0c 95 80 0e 00 00 	mov    0xe80(,%edx,4),%ecx
 336:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 339:	8b 14 95 80 0e 00 00 	mov    0xe80(,%edx,4),%edx
 340:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 347:	50                   	push   %eax
 348:	ff 75 10             	push   0x10(%ebp)
 34b:	ff 75 0c             	push   0xc(%ebp)
 34e:	ff 75 08             	push   0x8(%ebp)
 351:	e8 da 02 00 00       	call   630 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 356:	83 c4 10             	add    $0x10,%esp
}
 359:	c9                   	leave  
 35a:	c3                   	ret    
    return -1;
 35b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 360:	eb f7                	jmp    359 <thread_create+0x5f>

00000362 <thread_join>:

//TODO: fix
int thread_join() {
 362:	55                   	push   %ebp
 363:	89 e5                	mov    %esp,%ebp
 365:	56                   	push   %esi
 366:	53                   	push   %ebx
 367:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 36a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 36d:	50                   	push   %eax
 36e:	e8 c5 02 00 00       	call   638 <join>
 373:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 375:	83 c4 10             	add    $0x10,%esp
 378:	bb 00 00 00 00       	mov    $0x0,%ebx
 37d:	eb 03                	jmp    382 <thread_join+0x20>
 37f:	83 c3 01             	add    $0x1,%ebx
 382:	83 fb 3f             	cmp    $0x3f,%ebx
 385:	7f 23                	jg     3aa <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 387:	8b 04 9d 80 0e 00 00 	mov    0xe80(,%ebx,4),%eax
 38e:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 392:	75 eb                	jne    37f <thread_join+0x1d>
 394:	8b 55 f4             	mov    -0xc(%ebp),%edx
 397:	39 50 04             	cmp    %edx,0x4(%eax)
 39a:	75 e3                	jne    37f <thread_join+0x1d>
      free(stk_addr);
 39c:	83 ec 0c             	sub    $0xc,%esp
 39f:	52                   	push   %edx
 3a0:	e8 a6 04 00 00       	call   84b <free>
 3a5:	83 c4 10             	add    $0x10,%esp
 3a8:	eb d5                	jmp    37f <thread_join+0x1d>
    }
  }
  return pid;
}
 3aa:	89 f0                	mov    %esi,%eax
 3ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3af:	5b                   	pop    %ebx
 3b0:	5e                   	pop    %esi
 3b1:	5d                   	pop    %ebp
 3b2:	c3                   	ret    

000003b3 <lock_acquire>:

void lock_acquire(lock_t *lock){
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	53                   	push   %ebx
 3b7:	83 ec 04             	sub    $0x4,%esp
 3ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3bd:	83 ec 08             	sub    $0x8,%esp
 3c0:	6a 01                	push   $0x1
 3c2:	53                   	push   %ebx
 3c3:	e8 21 ff ff ff       	call   2e9 <test_and_set>
 3c8:	83 c4 10             	add    $0x10,%esp
 3cb:	83 f8 01             	cmp    $0x1,%eax
 3ce:	74 ed                	je     3bd <lock_acquire+0xa>
    ;
}
 3d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d3:	c9                   	leave  
 3d4:	c3                   	ret    

000003d5 <lock_release>:

void lock_release(lock_t *lock) {
 3d5:	55                   	push   %ebp
 3d6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3d8:	8b 45 08             	mov    0x8(%ebp),%eax
 3db:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3e1:	5d                   	pop    %ebp
 3e2:	c3                   	ret    

000003e3 <lock_init>:

void lock_init(lock_t *lock) {
 3e3:	55                   	push   %ebp
 3e4:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3e6:	8b 45 08             	mov    0x8(%ebp),%eax
 3e9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3ef:	5d                   	pop    %ebp
 3f0:	c3                   	ret    

000003f1 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3f1:	55                   	push   %ebp
 3f2:	89 e5                	mov    %esp,%ebp
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	8b 75 08             	mov    0x8(%ebp),%esi
 3f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3fc:	89 f0                	mov    %esi,%eax
 3fe:	89 d1                	mov    %edx,%ecx
 400:	83 c2 01             	add    $0x1,%edx
 403:	89 c3                	mov    %eax,%ebx
 405:	83 c0 01             	add    $0x1,%eax
 408:	0f b6 09             	movzbl (%ecx),%ecx
 40b:	88 0b                	mov    %cl,(%ebx)
 40d:	84 c9                	test   %cl,%cl
 40f:	75 ed                	jne    3fe <strcpy+0xd>
    ;
  return os;
}
 411:	89 f0                	mov    %esi,%eax
 413:	5b                   	pop    %ebx
 414:	5e                   	pop    %esi
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    

00000417 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 417:	55                   	push   %ebp
 418:	89 e5                	mov    %esp,%ebp
 41a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 41d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 420:	eb 06                	jmp    428 <strcmp+0x11>
    p++, q++;
 422:	83 c1 01             	add    $0x1,%ecx
 425:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 428:	0f b6 01             	movzbl (%ecx),%eax
 42b:	84 c0                	test   %al,%al
 42d:	74 04                	je     433 <strcmp+0x1c>
 42f:	3a 02                	cmp    (%edx),%al
 431:	74 ef                	je     422 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 433:	0f b6 c0             	movzbl %al,%eax
 436:	0f b6 12             	movzbl (%edx),%edx
 439:	29 d0                	sub    %edx,%eax
}
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    

0000043d <strlen>:

uint
strlen(const char *s)
{
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 443:	b8 00 00 00 00       	mov    $0x0,%eax
 448:	eb 03                	jmp    44d <strlen+0x10>
 44a:	83 c0 01             	add    $0x1,%eax
 44d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 451:	75 f7                	jne    44a <strlen+0xd>
    ;
  return n;
}
 453:	5d                   	pop    %ebp
 454:	c3                   	ret    

00000455 <memset>:

void*
memset(void *dst, int c, uint n)
{
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
 458:	57                   	push   %edi
 459:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 45c:	89 d7                	mov    %edx,%edi
 45e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 461:	8b 45 0c             	mov    0xc(%ebp),%eax
 464:	fc                   	cld    
 465:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 467:	89 d0                	mov    %edx,%eax
 469:	8b 7d fc             	mov    -0x4(%ebp),%edi
 46c:	c9                   	leave  
 46d:	c3                   	ret    

0000046e <strchr>:

char*
strchr(const char *s, char c)
{
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	8b 45 08             	mov    0x8(%ebp),%eax
 474:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 478:	eb 03                	jmp    47d <strchr+0xf>
 47a:	83 c0 01             	add    $0x1,%eax
 47d:	0f b6 10             	movzbl (%eax),%edx
 480:	84 d2                	test   %dl,%dl
 482:	74 06                	je     48a <strchr+0x1c>
    if(*s == c)
 484:	38 ca                	cmp    %cl,%dl
 486:	75 f2                	jne    47a <strchr+0xc>
 488:	eb 05                	jmp    48f <strchr+0x21>
      return (char*)s;
  return 0;
 48a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret    

00000491 <gets>:

char*
gets(char *buf, int max)
{
 491:	55                   	push   %ebp
 492:	89 e5                	mov    %esp,%ebp
 494:	57                   	push   %edi
 495:	56                   	push   %esi
 496:	53                   	push   %ebx
 497:	83 ec 1c             	sub    $0x1c,%esp
 49a:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 49d:	bb 00 00 00 00       	mov    $0x0,%ebx
 4a2:	89 de                	mov    %ebx,%esi
 4a4:	83 c3 01             	add    $0x1,%ebx
 4a7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4aa:	7d 2e                	jge    4da <gets+0x49>
    cc = read(0, &c, 1);
 4ac:	83 ec 04             	sub    $0x4,%esp
 4af:	6a 01                	push   $0x1
 4b1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4b4:	50                   	push   %eax
 4b5:	6a 00                	push   $0x0
 4b7:	e8 ec 00 00 00       	call   5a8 <read>
    if(cc < 1)
 4bc:	83 c4 10             	add    $0x10,%esp
 4bf:	85 c0                	test   %eax,%eax
 4c1:	7e 17                	jle    4da <gets+0x49>
      break;
    buf[i++] = c;
 4c3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4c7:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4ca:	3c 0a                	cmp    $0xa,%al
 4cc:	0f 94 c2             	sete   %dl
 4cf:	3c 0d                	cmp    $0xd,%al
 4d1:	0f 94 c0             	sete   %al
 4d4:	08 c2                	or     %al,%dl
 4d6:	74 ca                	je     4a2 <gets+0x11>
    buf[i++] = c;
 4d8:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4da:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4de:	89 f8                	mov    %edi,%eax
 4e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5f                   	pop    %edi
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    

000004e8 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	56                   	push   %esi
 4ec:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4ed:	83 ec 08             	sub    $0x8,%esp
 4f0:	6a 00                	push   $0x0
 4f2:	ff 75 08             	push   0x8(%ebp)
 4f5:	e8 d6 00 00 00       	call   5d0 <open>
  if(fd < 0)
 4fa:	83 c4 10             	add    $0x10,%esp
 4fd:	85 c0                	test   %eax,%eax
 4ff:	78 24                	js     525 <stat+0x3d>
 501:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 503:	83 ec 08             	sub    $0x8,%esp
 506:	ff 75 0c             	push   0xc(%ebp)
 509:	50                   	push   %eax
 50a:	e8 d9 00 00 00       	call   5e8 <fstat>
 50f:	89 c6                	mov    %eax,%esi
  close(fd);
 511:	89 1c 24             	mov    %ebx,(%esp)
 514:	e8 9f 00 00 00       	call   5b8 <close>
  return r;
 519:	83 c4 10             	add    $0x10,%esp
}
 51c:	89 f0                	mov    %esi,%eax
 51e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 521:	5b                   	pop    %ebx
 522:	5e                   	pop    %esi
 523:	5d                   	pop    %ebp
 524:	c3                   	ret    
    return -1;
 525:	be ff ff ff ff       	mov    $0xffffffff,%esi
 52a:	eb f0                	jmp    51c <stat+0x34>

0000052c <atoi>:

int
atoi(const char *s)
{
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	53                   	push   %ebx
 530:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 533:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 538:	eb 10                	jmp    54a <atoi+0x1e>
    n = n*10 + *s++ - '0';
 53a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 53d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 540:	83 c1 01             	add    $0x1,%ecx
 543:	0f be c0             	movsbl %al,%eax
 546:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 54a:	0f b6 01             	movzbl (%ecx),%eax
 54d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 550:	80 fb 09             	cmp    $0x9,%bl
 553:	76 e5                	jbe    53a <atoi+0xe>
  return n;
}
 555:	89 d0                	mov    %edx,%eax
 557:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 55a:	c9                   	leave  
 55b:	c3                   	ret    

0000055c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	56                   	push   %esi
 560:	53                   	push   %ebx
 561:	8b 75 08             	mov    0x8(%ebp),%esi
 564:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 567:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 56a:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 56c:	eb 0d                	jmp    57b <memmove+0x1f>
    *dst++ = *src++;
 56e:	0f b6 01             	movzbl (%ecx),%eax
 571:	88 02                	mov    %al,(%edx)
 573:	8d 49 01             	lea    0x1(%ecx),%ecx
 576:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 579:	89 d8                	mov    %ebx,%eax
 57b:	8d 58 ff             	lea    -0x1(%eax),%ebx
 57e:	85 c0                	test   %eax,%eax
 580:	7f ec                	jg     56e <memmove+0x12>
  return vdst;
}
 582:	89 f0                	mov    %esi,%eax
 584:	5b                   	pop    %ebx
 585:	5e                   	pop    %esi
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    

00000588 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 588:	b8 01 00 00 00       	mov    $0x1,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <exit>:
SYSCALL(exit)
 590:	b8 02 00 00 00       	mov    $0x2,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <wait>:
SYSCALL(wait)
 598:	b8 03 00 00 00       	mov    $0x3,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <pipe>:
SYSCALL(pipe)
 5a0:	b8 04 00 00 00       	mov    $0x4,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <read>:
SYSCALL(read)
 5a8:	b8 05 00 00 00       	mov    $0x5,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <write>:
SYSCALL(write)
 5b0:	b8 10 00 00 00       	mov    $0x10,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <close>:
SYSCALL(close)
 5b8:	b8 15 00 00 00       	mov    $0x15,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <kill>:
SYSCALL(kill)
 5c0:	b8 06 00 00 00       	mov    $0x6,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <exec>:
SYSCALL(exec)
 5c8:	b8 07 00 00 00       	mov    $0x7,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <open>:
SYSCALL(open)
 5d0:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <mknod>:
SYSCALL(mknod)
 5d8:	b8 11 00 00 00       	mov    $0x11,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <unlink>:
SYSCALL(unlink)
 5e0:	b8 12 00 00 00       	mov    $0x12,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <fstat>:
SYSCALL(fstat)
 5e8:	b8 08 00 00 00       	mov    $0x8,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <link>:
SYSCALL(link)
 5f0:	b8 13 00 00 00       	mov    $0x13,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <mkdir>:
SYSCALL(mkdir)
 5f8:	b8 14 00 00 00       	mov    $0x14,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <chdir>:
SYSCALL(chdir)
 600:	b8 09 00 00 00       	mov    $0x9,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <dup>:
SYSCALL(dup)
 608:	b8 0a 00 00 00       	mov    $0xa,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <getpid>:
SYSCALL(getpid)
 610:	b8 0b 00 00 00       	mov    $0xb,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <sbrk>:
SYSCALL(sbrk)
 618:	b8 0c 00 00 00       	mov    $0xc,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <sleep>:
SYSCALL(sleep)
 620:	b8 0d 00 00 00       	mov    $0xd,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <uptime>:
SYSCALL(uptime)
 628:	b8 0e 00 00 00       	mov    $0xe,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <clone>:
SYSCALL(clone)
 630:	b8 16 00 00 00       	mov    $0x16,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <join>:
 638:	b8 17 00 00 00       	mov    $0x17,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	83 ec 1c             	sub    $0x1c,%esp
 646:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 64e:	52                   	push   %edx
 64f:	50                   	push   %eax
 650:	e8 5b ff ff ff       	call   5b0 <write>
}
 655:	83 c4 10             	add    $0x10,%esp
 658:	c9                   	leave  
 659:	c3                   	ret    

0000065a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 65a:	55                   	push   %ebp
 65b:	89 e5                	mov    %esp,%ebp
 65d:	57                   	push   %edi
 65e:	56                   	push   %esi
 65f:	53                   	push   %ebx
 660:	83 ec 2c             	sub    $0x2c,%esp
 663:	89 45 d0             	mov    %eax,-0x30(%ebp)
 666:	89 d0                	mov    %edx,%eax
 668:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 66a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 66e:	0f 95 c1             	setne  %cl
 671:	c1 ea 1f             	shr    $0x1f,%edx
 674:	84 d1                	test   %dl,%cl
 676:	74 44                	je     6bc <printint+0x62>
    neg = 1;
    x = -xx;
 678:	f7 d8                	neg    %eax
 67a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 67c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 683:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 688:	89 c8                	mov    %ecx,%eax
 68a:	ba 00 00 00 00       	mov    $0x0,%edx
 68f:	f7 f6                	div    %esi
 691:	89 df                	mov    %ebx,%edi
 693:	83 c3 01             	add    $0x1,%ebx
 696:	0f b6 92 9c 0a 00 00 	movzbl 0xa9c(%edx),%edx
 69d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6a1:	89 ca                	mov    %ecx,%edx
 6a3:	89 c1                	mov    %eax,%ecx
 6a5:	39 d6                	cmp    %edx,%esi
 6a7:	76 df                	jbe    688 <printint+0x2e>
  if(neg)
 6a9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6ad:	74 31                	je     6e0 <printint+0x86>
    buf[i++] = '-';
 6af:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6b4:	8d 5f 02             	lea    0x2(%edi),%ebx
 6b7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ba:	eb 17                	jmp    6d3 <printint+0x79>
    x = xx;
 6bc:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6be:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6c5:	eb bc                	jmp    683 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6c7:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6cc:	89 f0                	mov    %esi,%eax
 6ce:	e8 6d ff ff ff       	call   640 <putc>
  while(--i >= 0)
 6d3:	83 eb 01             	sub    $0x1,%ebx
 6d6:	79 ef                	jns    6c7 <printint+0x6d>
}
 6d8:	83 c4 2c             	add    $0x2c,%esp
 6db:	5b                   	pop    %ebx
 6dc:	5e                   	pop    %esi
 6dd:	5f                   	pop    %edi
 6de:	5d                   	pop    %ebp
 6df:	c3                   	ret    
 6e0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6e3:	eb ee                	jmp    6d3 <printint+0x79>

000006e5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6e5:	55                   	push   %ebp
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6ee:	8d 45 10             	lea    0x10(%ebp),%eax
 6f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6f4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6f9:	bb 00 00 00 00       	mov    $0x0,%ebx
 6fe:	eb 14                	jmp    714 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 700:	89 fa                	mov    %edi,%edx
 702:	8b 45 08             	mov    0x8(%ebp),%eax
 705:	e8 36 ff ff ff       	call   640 <putc>
 70a:	eb 05                	jmp    711 <printf+0x2c>
      }
    } else if(state == '%'){
 70c:	83 fe 25             	cmp    $0x25,%esi
 70f:	74 25                	je     736 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 711:	83 c3 01             	add    $0x1,%ebx
 714:	8b 45 0c             	mov    0xc(%ebp),%eax
 717:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 71b:	84 c0                	test   %al,%al
 71d:	0f 84 20 01 00 00    	je     843 <printf+0x15e>
    c = fmt[i] & 0xff;
 723:	0f be f8             	movsbl %al,%edi
 726:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 729:	85 f6                	test   %esi,%esi
 72b:	75 df                	jne    70c <printf+0x27>
      if(c == '%'){
 72d:	83 f8 25             	cmp    $0x25,%eax
 730:	75 ce                	jne    700 <printf+0x1b>
        state = '%';
 732:	89 c6                	mov    %eax,%esi
 734:	eb db                	jmp    711 <printf+0x2c>
      if(c == 'd'){
 736:	83 f8 25             	cmp    $0x25,%eax
 739:	0f 84 cf 00 00 00    	je     80e <printf+0x129>
 73f:	0f 8c dd 00 00 00    	jl     822 <printf+0x13d>
 745:	83 f8 78             	cmp    $0x78,%eax
 748:	0f 8f d4 00 00 00    	jg     822 <printf+0x13d>
 74e:	83 f8 63             	cmp    $0x63,%eax
 751:	0f 8c cb 00 00 00    	jl     822 <printf+0x13d>
 757:	83 e8 63             	sub    $0x63,%eax
 75a:	83 f8 15             	cmp    $0x15,%eax
 75d:	0f 87 bf 00 00 00    	ja     822 <printf+0x13d>
 763:	ff 24 85 44 0a 00 00 	jmp    *0xa44(,%eax,4)
        printint(fd, *ap, 10, 1);
 76a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 76d:	8b 17                	mov    (%edi),%edx
 76f:	83 ec 0c             	sub    $0xc,%esp
 772:	6a 01                	push   $0x1
 774:	b9 0a 00 00 00       	mov    $0xa,%ecx
 779:	8b 45 08             	mov    0x8(%ebp),%eax
 77c:	e8 d9 fe ff ff       	call   65a <printint>
        ap++;
 781:	83 c7 04             	add    $0x4,%edi
 784:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 787:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 78a:	be 00 00 00 00       	mov    $0x0,%esi
 78f:	eb 80                	jmp    711 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 791:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 794:	8b 17                	mov    (%edi),%edx
 796:	83 ec 0c             	sub    $0xc,%esp
 799:	6a 00                	push   $0x0
 79b:	b9 10 00 00 00       	mov    $0x10,%ecx
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
 7a3:	e8 b2 fe ff ff       	call   65a <printint>
        ap++;
 7a8:	83 c7 04             	add    $0x4,%edi
 7ab:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7ae:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7b1:	be 00 00 00 00       	mov    $0x0,%esi
 7b6:	e9 56 ff ff ff       	jmp    711 <printf+0x2c>
        s = (char*)*ap;
 7bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7be:	8b 30                	mov    (%eax),%esi
        ap++;
 7c0:	83 c0 04             	add    $0x4,%eax
 7c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7c6:	85 f6                	test   %esi,%esi
 7c8:	75 15                	jne    7df <printf+0xfa>
          s = "(null)";
 7ca:	be 3b 0a 00 00       	mov    $0xa3b,%esi
 7cf:	eb 0e                	jmp    7df <printf+0xfa>
          putc(fd, *s);
 7d1:	0f be d2             	movsbl %dl,%edx
 7d4:	8b 45 08             	mov    0x8(%ebp),%eax
 7d7:	e8 64 fe ff ff       	call   640 <putc>
          s++;
 7dc:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7df:	0f b6 16             	movzbl (%esi),%edx
 7e2:	84 d2                	test   %dl,%dl
 7e4:	75 eb                	jne    7d1 <printf+0xec>
      state = 0;
 7e6:	be 00 00 00 00       	mov    $0x0,%esi
 7eb:	e9 21 ff ff ff       	jmp    711 <printf+0x2c>
        putc(fd, *ap);
 7f0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7f3:	0f be 17             	movsbl (%edi),%edx
 7f6:	8b 45 08             	mov    0x8(%ebp),%eax
 7f9:	e8 42 fe ff ff       	call   640 <putc>
        ap++;
 7fe:	83 c7 04             	add    $0x4,%edi
 801:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 804:	be 00 00 00 00       	mov    $0x0,%esi
 809:	e9 03 ff ff ff       	jmp    711 <printf+0x2c>
        putc(fd, c);
 80e:	89 fa                	mov    %edi,%edx
 810:	8b 45 08             	mov    0x8(%ebp),%eax
 813:	e8 28 fe ff ff       	call   640 <putc>
      state = 0;
 818:	be 00 00 00 00       	mov    $0x0,%esi
 81d:	e9 ef fe ff ff       	jmp    711 <printf+0x2c>
        putc(fd, '%');
 822:	ba 25 00 00 00       	mov    $0x25,%edx
 827:	8b 45 08             	mov    0x8(%ebp),%eax
 82a:	e8 11 fe ff ff       	call   640 <putc>
        putc(fd, c);
 82f:	89 fa                	mov    %edi,%edx
 831:	8b 45 08             	mov    0x8(%ebp),%eax
 834:	e8 07 fe ff ff       	call   640 <putc>
      state = 0;
 839:	be 00 00 00 00       	mov    $0x0,%esi
 83e:	e9 ce fe ff ff       	jmp    711 <printf+0x2c>
    }
  }
}
 843:	8d 65 f4             	lea    -0xc(%ebp),%esp
 846:	5b                   	pop    %ebx
 847:	5e                   	pop    %esi
 848:	5f                   	pop    %edi
 849:	5d                   	pop    %ebp
 84a:	c3                   	ret    

0000084b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 84b:	55                   	push   %ebp
 84c:	89 e5                	mov    %esp,%ebp
 84e:	57                   	push   %edi
 84f:	56                   	push   %esi
 850:	53                   	push   %ebx
 851:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 854:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 857:	a1 80 0f 00 00       	mov    0xf80,%eax
 85c:	eb 02                	jmp    860 <free+0x15>
 85e:	89 d0                	mov    %edx,%eax
 860:	39 c8                	cmp    %ecx,%eax
 862:	73 04                	jae    868 <free+0x1d>
 864:	39 08                	cmp    %ecx,(%eax)
 866:	77 12                	ja     87a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 868:	8b 10                	mov    (%eax),%edx
 86a:	39 c2                	cmp    %eax,%edx
 86c:	77 f0                	ja     85e <free+0x13>
 86e:	39 c8                	cmp    %ecx,%eax
 870:	72 08                	jb     87a <free+0x2f>
 872:	39 ca                	cmp    %ecx,%edx
 874:	77 04                	ja     87a <free+0x2f>
 876:	89 d0                	mov    %edx,%eax
 878:	eb e6                	jmp    860 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 87a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 87d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 880:	8b 10                	mov    (%eax),%edx
 882:	39 d7                	cmp    %edx,%edi
 884:	74 19                	je     89f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 886:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 889:	8b 50 04             	mov    0x4(%eax),%edx
 88c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 88f:	39 ce                	cmp    %ecx,%esi
 891:	74 1b                	je     8ae <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 893:	89 08                	mov    %ecx,(%eax)
  freep = p;
 895:	a3 80 0f 00 00       	mov    %eax,0xf80
}
 89a:	5b                   	pop    %ebx
 89b:	5e                   	pop    %esi
 89c:	5f                   	pop    %edi
 89d:	5d                   	pop    %ebp
 89e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 89f:	03 72 04             	add    0x4(%edx),%esi
 8a2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a5:	8b 10                	mov    (%eax),%edx
 8a7:	8b 12                	mov    (%edx),%edx
 8a9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8ac:	eb db                	jmp    889 <free+0x3e>
    p->s.size += bp->s.size;
 8ae:	03 53 fc             	add    -0x4(%ebx),%edx
 8b1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8b4:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8b7:	89 10                	mov    %edx,(%eax)
 8b9:	eb da                	jmp    895 <free+0x4a>

000008bb <morecore>:

static Header*
morecore(uint nu)
{
 8bb:	55                   	push   %ebp
 8bc:	89 e5                	mov    %esp,%ebp
 8be:	53                   	push   %ebx
 8bf:	83 ec 04             	sub    $0x4,%esp
 8c2:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8c4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8c9:	77 05                	ja     8d0 <morecore+0x15>
    nu = 4096;
 8cb:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8d0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8d7:	83 ec 0c             	sub    $0xc,%esp
 8da:	50                   	push   %eax
 8db:	e8 38 fd ff ff       	call   618 <sbrk>
  if(p == (char*)-1)
 8e0:	83 c4 10             	add    $0x10,%esp
 8e3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e6:	74 1c                	je     904 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8e8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8eb:	83 c0 08             	add    $0x8,%eax
 8ee:	83 ec 0c             	sub    $0xc,%esp
 8f1:	50                   	push   %eax
 8f2:	e8 54 ff ff ff       	call   84b <free>
  return freep;
 8f7:	a1 80 0f 00 00       	mov    0xf80,%eax
 8fc:	83 c4 10             	add    $0x10,%esp
}
 8ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 902:	c9                   	leave  
 903:	c3                   	ret    
    return 0;
 904:	b8 00 00 00 00       	mov    $0x0,%eax
 909:	eb f4                	jmp    8ff <morecore+0x44>

0000090b <malloc>:

void*
malloc(uint nbytes)
{
 90b:	55                   	push   %ebp
 90c:	89 e5                	mov    %esp,%ebp
 90e:	53                   	push   %ebx
 90f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 912:	8b 45 08             	mov    0x8(%ebp),%eax
 915:	8d 58 07             	lea    0x7(%eax),%ebx
 918:	c1 eb 03             	shr    $0x3,%ebx
 91b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 91e:	8b 0d 80 0f 00 00    	mov    0xf80,%ecx
 924:	85 c9                	test   %ecx,%ecx
 926:	74 04                	je     92c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 928:	8b 01                	mov    (%ecx),%eax
 92a:	eb 4a                	jmp    976 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 92c:	c7 05 80 0f 00 00 84 	movl   $0xf84,0xf80
 933:	0f 00 00 
 936:	c7 05 84 0f 00 00 84 	movl   $0xf84,0xf84
 93d:	0f 00 00 
    base.s.size = 0;
 940:	c7 05 88 0f 00 00 00 	movl   $0x0,0xf88
 947:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 94a:	b9 84 0f 00 00       	mov    $0xf84,%ecx
 94f:	eb d7                	jmp    928 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 951:	74 19                	je     96c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 953:	29 da                	sub    %ebx,%edx
 955:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 958:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 95b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 95e:	89 0d 80 0f 00 00    	mov    %ecx,0xf80
      return (void*)(p + 1);
 964:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 967:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 96a:	c9                   	leave  
 96b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 96c:	8b 10                	mov    (%eax),%edx
 96e:	89 11                	mov    %edx,(%ecx)
 970:	eb ec                	jmp    95e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 972:	89 c1                	mov    %eax,%ecx
 974:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 976:	8b 50 04             	mov    0x4(%eax),%edx
 979:	39 da                	cmp    %ebx,%edx
 97b:	73 d4                	jae    951 <malloc+0x46>
    if(p == freep)
 97d:	39 05 80 0f 00 00    	cmp    %eax,0xf80
 983:	75 ed                	jne    972 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 985:	89 d8                	mov    %ebx,%eax
 987:	e8 2f ff ff ff       	call   8bb <morecore>
 98c:	85 c0                	test   %eax,%eax
 98e:	75 e2                	jne    972 <malloc+0x67>
 990:	eb d5                	jmp    967 <malloc+0x5c>
