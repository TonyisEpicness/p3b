
_test_11:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   assert(global == 1);
   6:	a1 80 0d 00 00       	mov    0xd80,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 d0 08 00 00       	push   $0x8d0
  17:	68 da 08 00 00       	push   $0x8da
  1c:	6a 01                	push   $0x1
  1e:	e8 ff 05 00 00       	call   622 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 e2 08 00 00       	push   $0x8e2
  2b:	68 ee 08 00 00       	push   $0x8ee
  30:	6a 01                	push   $0x1
  32:	e8 eb 05 00 00       	call   622 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 02 09 00 00       	push   $0x902
  3f:	6a 01                	push   $0x1
  41:	e8 dc 05 00 00       	call   622 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 84 0d 00 00    	push   0xd84
  4f:	e8 a9 04 00 00       	call   4fd <kill>
  54:	e8 74 04 00 00       	call   4cd <exit>
   global += 4;
  59:	a1 80 0d 00 00       	mov    0xd80,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 80 0d 00 00       	mov    %eax,0xd80
   exit();
  66:	e8 62 04 00 00       	call   4cd <exit>

0000006b <main>:
{
  6b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6f:	83 e4 f0             	and    $0xfffffff0,%esp
  72:	ff 71 fc             	push   -0x4(%ecx)
  75:	55                   	push   %ebp
  76:	89 e5                	mov    %esp,%ebp
  78:	56                   	push   %esi
  79:	53                   	push   %ebx
  7a:	51                   	push   %ecx
  7b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  7e:	e8 ca 04 00 00       	call   54d <getpid>
  83:	a3 84 0d 00 00       	mov    %eax,0xd84
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 80 0d 00 00 01 	movl   $0x1,0xd80
  9d:	00 00 00 
      thread_pid = thread_create(worker, 0, 0);
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	6a 00                	push   $0x0
  a5:	6a 00                	push   $0x0
  a7:	68 00 00 00 00       	push   $0x0
  ac:	e8 86 01 00 00       	call   237 <thread_create>
  b1:	89 c3                	mov    %eax,%ebx
      assert(thread_pid > 0);
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	85 c0                	test   %eax,%eax
  b8:	7e 34                	jle    ee <main+0x83>
      join_pid = thread_join();
  ba:	e8 e0 01 00 00       	call   29f <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 80 0d 00 00       	mov    0xd80,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 7a 04 00 00       	call   555 <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 d0 08 00 00       	push   $0x8d0
  f5:	68 da 08 00 00       	push   $0x8da
  fa:	6a 01                	push   $0x1
  fc:	e8 21 05 00 00       	call   622 <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 0f 09 00 00       	push   $0x90f
 109:	68 ee 08 00 00       	push   $0x8ee
 10e:	6a 01                	push   $0x1
 110:	e8 0d 05 00 00       	call   622 <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 02 09 00 00       	push   $0x902
 11d:	6a 01                	push   $0x1
 11f:	e8 fe 04 00 00       	call   622 <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 84 0d 00 00    	push   0xd84
 12d:	e8 cb 03 00 00       	call   4fd <kill>
 132:	e8 96 03 00 00       	call   4cd <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 d0 08 00 00       	push   $0x8d0
 13e:	68 da 08 00 00       	push   $0x8da
 143:	6a 01                	push   $0x1
 145:	e8 d8 04 00 00       	call   622 <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 1e 09 00 00       	push   $0x91e
 152:	68 ee 08 00 00       	push   $0x8ee
 157:	6a 01                	push   $0x1
 159:	e8 c4 04 00 00       	call   622 <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 02 09 00 00       	push   $0x902
 166:	6a 01                	push   $0x1
 168:	e8 b5 04 00 00       	call   622 <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 84 0d 00 00    	push   0xd84
 176:	e8 82 03 00 00       	call   4fd <kill>
 17b:	e8 4d 03 00 00       	call   4cd <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 d0 08 00 00       	push   $0x8d0
 187:	68 da 08 00 00       	push   $0x8da
 18c:	6a 01                	push   $0x1
 18e:	e8 8f 04 00 00       	call   622 <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 35 09 00 00       	push   $0x935
 19b:	68 ee 08 00 00       	push   $0x8ee
 1a0:	6a 01                	push   $0x1
 1a2:	e8 7b 04 00 00       	call   622 <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 02 09 00 00       	push   $0x902
 1af:	6a 01                	push   $0x1
 1b1:	e8 6c 04 00 00       	call   622 <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 84 0d 00 00    	push   0xd84
 1bf:	e8 39 03 00 00       	call   4fd <kill>
 1c4:	e8 04 03 00 00       	call   4cd <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 d0 08 00 00       	push   $0x8d0
 1d0:	68 da 08 00 00       	push   $0x8da
 1d5:	6a 01                	push   $0x1
 1d7:	e8 46 04 00 00       	call   622 <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 50 09 00 00       	push   $0x950
 1e4:	68 ee 08 00 00       	push   $0x8ee
 1e9:	6a 01                	push   $0x1
 1eb:	e8 32 04 00 00       	call   622 <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 02 09 00 00       	push   $0x902
 1f8:	6a 01                	push   $0x1
 1fa:	e8 23 04 00 00       	call   622 <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 84 0d 00 00    	push   0xd84
 208:	e8 f0 02 00 00       	call   4fd <kill>
 20d:	e8 bb 02 00 00       	call   4cd <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 41 09 00 00       	push   $0x941
 21a:	6a 01                	push   $0x1
 21c:	e8 01 04 00 00       	call   622 <printf>
   exit();
 221:	e8 a7 02 00 00       	call   4cd <exit>

00000226 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 22c:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 22e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 231:	89 08                	mov    %ecx,(%eax)
  return old;
}
 233:	89 d0                	mov    %edx,%eax
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    

00000237 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 237:	55                   	push   %ebp
 238:	89 e5                	mov    %esp,%ebp
 23a:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 23d:	68 00 20 00 00       	push   $0x2000
 242:	e8 01 06 00 00       	call   848 <malloc>
  if(n_stack == 0){
 247:	83 c4 10             	add    $0x10,%esp
 24a:	85 c0                	test   %eax,%eax
 24c:	74 4a                	je     298 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 24e:	ba 00 00 00 00       	mov    $0x0,%edx
 253:	eb 03                	jmp    258 <thread_create+0x21>
 255:	83 c2 01             	add    $0x1,%edx
 258:	83 fa 3f             	cmp    $0x3f,%edx
 25b:	7f 27                	jg     284 <thread_create+0x4d>
    if(threads[i]->flag==0){
 25d:	8b 0c 95 a0 0d 00 00 	mov    0xda0(,%edx,4),%ecx
 264:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 268:	75 eb                	jne    255 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 26a:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 26c:	8b 0c 95 a0 0d 00 00 	mov    0xda0(,%edx,4),%ecx
 273:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 276:	8b 14 95 a0 0d 00 00 	mov    0xda0(,%edx,4),%edx
 27d:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 284:	50                   	push   %eax
 285:	ff 75 10             	push   0x10(%ebp)
 288:	ff 75 0c             	push   0xc(%ebp)
 28b:	ff 75 08             	push   0x8(%ebp)
 28e:	e8 da 02 00 00       	call   56d <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 293:	83 c4 10             	add    $0x10,%esp
}
 296:	c9                   	leave  
 297:	c3                   	ret    
    return -1;
 298:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 29d:	eb f7                	jmp    296 <thread_create+0x5f>

0000029f <thread_join>:

//TODO: fix
int thread_join() {
 29f:	55                   	push   %ebp
 2a0:	89 e5                	mov    %esp,%ebp
 2a2:	56                   	push   %esi
 2a3:	53                   	push   %ebx
 2a4:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2a7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2aa:	50                   	push   %eax
 2ab:	e8 c5 02 00 00       	call   575 <join>
 2b0:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	bb 00 00 00 00       	mov    $0x0,%ebx
 2ba:	eb 03                	jmp    2bf <thread_join+0x20>
 2bc:	83 c3 01             	add    $0x1,%ebx
 2bf:	83 fb 3f             	cmp    $0x3f,%ebx
 2c2:	7f 23                	jg     2e7 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 2c4:	8b 04 9d a0 0d 00 00 	mov    0xda0(,%ebx,4),%eax
 2cb:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 2cf:	75 eb                	jne    2bc <thread_join+0x1d>
 2d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2d4:	39 50 04             	cmp    %edx,0x4(%eax)
 2d7:	75 e3                	jne    2bc <thread_join+0x1d>
      free(stk_addr);
 2d9:	83 ec 0c             	sub    $0xc,%esp
 2dc:	52                   	push   %edx
 2dd:	e8 a6 04 00 00       	call   788 <free>
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	eb d5                	jmp    2bc <thread_join+0x1d>
    }
  }
  return pid;
}
 2e7:	89 f0                	mov    %esi,%eax
 2e9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ec:	5b                   	pop    %ebx
 2ed:	5e                   	pop    %esi
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    

000002f0 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	83 ec 04             	sub    $0x4,%esp
 2f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2fa:	83 ec 08             	sub    $0x8,%esp
 2fd:	6a 01                	push   $0x1
 2ff:	53                   	push   %ebx
 300:	e8 21 ff ff ff       	call   226 <test_and_set>
 305:	83 c4 10             	add    $0x10,%esp
 308:	83 f8 01             	cmp    $0x1,%eax
 30b:	74 ed                	je     2fa <lock_acquire+0xa>
    ;
}
 30d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 310:	c9                   	leave  
 311:	c3                   	ret    

00000312 <lock_release>:

void lock_release(lock_t *lock) {
 312:	55                   	push   %ebp
 313:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 315:	8b 45 08             	mov    0x8(%ebp),%eax
 318:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 31e:	5d                   	pop    %ebp
 31f:	c3                   	ret    

00000320 <lock_init>:

void lock_init(lock_t *lock) {
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 32c:	5d                   	pop    %ebp
 32d:	c3                   	ret    

0000032e <strcpy>:

char*
strcpy(char *s, const char *t)
{
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	56                   	push   %esi
 332:	53                   	push   %ebx
 333:	8b 75 08             	mov    0x8(%ebp),%esi
 336:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 339:	89 f0                	mov    %esi,%eax
 33b:	89 d1                	mov    %edx,%ecx
 33d:	83 c2 01             	add    $0x1,%edx
 340:	89 c3                	mov    %eax,%ebx
 342:	83 c0 01             	add    $0x1,%eax
 345:	0f b6 09             	movzbl (%ecx),%ecx
 348:	88 0b                	mov    %cl,(%ebx)
 34a:	84 c9                	test   %cl,%cl
 34c:	75 ed                	jne    33b <strcpy+0xd>
    ;
  return os;
}
 34e:	89 f0                	mov    %esi,%eax
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    

00000354 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	8b 4d 08             	mov    0x8(%ebp),%ecx
 35a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 35d:	eb 06                	jmp    365 <strcmp+0x11>
    p++, q++;
 35f:	83 c1 01             	add    $0x1,%ecx
 362:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 365:	0f b6 01             	movzbl (%ecx),%eax
 368:	84 c0                	test   %al,%al
 36a:	74 04                	je     370 <strcmp+0x1c>
 36c:	3a 02                	cmp    (%edx),%al
 36e:	74 ef                	je     35f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 370:	0f b6 c0             	movzbl %al,%eax
 373:	0f b6 12             	movzbl (%edx),%edx
 376:	29 d0                	sub    %edx,%eax
}
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    

0000037a <strlen>:

uint
strlen(const char *s)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 380:	b8 00 00 00 00       	mov    $0x0,%eax
 385:	eb 03                	jmp    38a <strlen+0x10>
 387:	83 c0 01             	add    $0x1,%eax
 38a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 38e:	75 f7                	jne    387 <strlen+0xd>
    ;
  return n;
}
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <memset>:

void*
memset(void *dst, int c, uint n)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	57                   	push   %edi
 396:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 399:	89 d7                	mov    %edx,%edi
 39b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 39e:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a1:	fc                   	cld    
 3a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3a4:	89 d0                	mov    %edx,%eax
 3a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3a9:	c9                   	leave  
 3aa:	c3                   	ret    

000003ab <strchr>:

char*
strchr(const char *s, char c)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	8b 45 08             	mov    0x8(%ebp),%eax
 3b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3b5:	eb 03                	jmp    3ba <strchr+0xf>
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	0f b6 10             	movzbl (%eax),%edx
 3bd:	84 d2                	test   %dl,%dl
 3bf:	74 06                	je     3c7 <strchr+0x1c>
    if(*s == c)
 3c1:	38 ca                	cmp    %cl,%dl
 3c3:	75 f2                	jne    3b7 <strchr+0xc>
 3c5:	eb 05                	jmp    3cc <strchr+0x21>
      return (char*)s;
  return 0;
 3c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3cc:	5d                   	pop    %ebp
 3cd:	c3                   	ret    

000003ce <gets>:

char*
gets(char *buf, int max)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	57                   	push   %edi
 3d2:	56                   	push   %esi
 3d3:	53                   	push   %ebx
 3d4:	83 ec 1c             	sub    $0x1c,%esp
 3d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3da:	bb 00 00 00 00       	mov    $0x0,%ebx
 3df:	89 de                	mov    %ebx,%esi
 3e1:	83 c3 01             	add    $0x1,%ebx
 3e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e7:	7d 2e                	jge    417 <gets+0x49>
    cc = read(0, &c, 1);
 3e9:	83 ec 04             	sub    $0x4,%esp
 3ec:	6a 01                	push   $0x1
 3ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f1:	50                   	push   %eax
 3f2:	6a 00                	push   $0x0
 3f4:	e8 ec 00 00 00       	call   4e5 <read>
    if(cc < 1)
 3f9:	83 c4 10             	add    $0x10,%esp
 3fc:	85 c0                	test   %eax,%eax
 3fe:	7e 17                	jle    417 <gets+0x49>
      break;
    buf[i++] = c;
 400:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 404:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 407:	3c 0a                	cmp    $0xa,%al
 409:	0f 94 c2             	sete   %dl
 40c:	3c 0d                	cmp    $0xd,%al
 40e:	0f 94 c0             	sete   %al
 411:	08 c2                	or     %al,%dl
 413:	74 ca                	je     3df <gets+0x11>
    buf[i++] = c;
 415:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 417:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 41b:	89 f8                	mov    %edi,%eax
 41d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 420:	5b                   	pop    %ebx
 421:	5e                   	pop    %esi
 422:	5f                   	pop    %edi
 423:	5d                   	pop    %ebp
 424:	c3                   	ret    

00000425 <stat>:

int
stat(const char *n, struct stat *st)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	56                   	push   %esi
 429:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 42a:	83 ec 08             	sub    $0x8,%esp
 42d:	6a 00                	push   $0x0
 42f:	ff 75 08             	push   0x8(%ebp)
 432:	e8 d6 00 00 00       	call   50d <open>
  if(fd < 0)
 437:	83 c4 10             	add    $0x10,%esp
 43a:	85 c0                	test   %eax,%eax
 43c:	78 24                	js     462 <stat+0x3d>
 43e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 440:	83 ec 08             	sub    $0x8,%esp
 443:	ff 75 0c             	push   0xc(%ebp)
 446:	50                   	push   %eax
 447:	e8 d9 00 00 00       	call   525 <fstat>
 44c:	89 c6                	mov    %eax,%esi
  close(fd);
 44e:	89 1c 24             	mov    %ebx,(%esp)
 451:	e8 9f 00 00 00       	call   4f5 <close>
  return r;
 456:	83 c4 10             	add    $0x10,%esp
}
 459:	89 f0                	mov    %esi,%eax
 45b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    
    return -1;
 462:	be ff ff ff ff       	mov    $0xffffffff,%esi
 467:	eb f0                	jmp    459 <stat+0x34>

00000469 <atoi>:

int
atoi(const char *s)
{
 469:	55                   	push   %ebp
 46a:	89 e5                	mov    %esp,%ebp
 46c:	53                   	push   %ebx
 46d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 470:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 475:	eb 10                	jmp    487 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 477:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 47a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 47d:	83 c1 01             	add    $0x1,%ecx
 480:	0f be c0             	movsbl %al,%eax
 483:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 487:	0f b6 01             	movzbl (%ecx),%eax
 48a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 48d:	80 fb 09             	cmp    $0x9,%bl
 490:	76 e5                	jbe    477 <atoi+0xe>
  return n;
}
 492:	89 d0                	mov    %edx,%eax
 494:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	56                   	push   %esi
 49d:	53                   	push   %ebx
 49e:	8b 75 08             	mov    0x8(%ebp),%esi
 4a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4a9:	eb 0d                	jmp    4b8 <memmove+0x1f>
    *dst++ = *src++;
 4ab:	0f b6 01             	movzbl (%ecx),%eax
 4ae:	88 02                	mov    %al,(%edx)
 4b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 4b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4b6:	89 d8                	mov    %ebx,%eax
 4b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4bb:	85 c0                	test   %eax,%eax
 4bd:	7f ec                	jg     4ab <memmove+0x12>
  return vdst;
}
 4bf:	89 f0                	mov    %esi,%eax
 4c1:	5b                   	pop    %ebx
 4c2:	5e                   	pop    %esi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    

000004c5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4c5:	b8 01 00 00 00       	mov    $0x1,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <exit>:
SYSCALL(exit)
 4cd:	b8 02 00 00 00       	mov    $0x2,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <wait>:
SYSCALL(wait)
 4d5:	b8 03 00 00 00       	mov    $0x3,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <pipe>:
SYSCALL(pipe)
 4dd:	b8 04 00 00 00       	mov    $0x4,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <read>:
SYSCALL(read)
 4e5:	b8 05 00 00 00       	mov    $0x5,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <write>:
SYSCALL(write)
 4ed:	b8 10 00 00 00       	mov    $0x10,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <close>:
SYSCALL(close)
 4f5:	b8 15 00 00 00       	mov    $0x15,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <kill>:
SYSCALL(kill)
 4fd:	b8 06 00 00 00       	mov    $0x6,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <exec>:
SYSCALL(exec)
 505:	b8 07 00 00 00       	mov    $0x7,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <open>:
SYSCALL(open)
 50d:	b8 0f 00 00 00       	mov    $0xf,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <mknod>:
SYSCALL(mknod)
 515:	b8 11 00 00 00       	mov    $0x11,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <unlink>:
SYSCALL(unlink)
 51d:	b8 12 00 00 00       	mov    $0x12,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <fstat>:
SYSCALL(fstat)
 525:	b8 08 00 00 00       	mov    $0x8,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <link>:
SYSCALL(link)
 52d:	b8 13 00 00 00       	mov    $0x13,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <mkdir>:
SYSCALL(mkdir)
 535:	b8 14 00 00 00       	mov    $0x14,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <chdir>:
SYSCALL(chdir)
 53d:	b8 09 00 00 00       	mov    $0x9,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <dup>:
SYSCALL(dup)
 545:	b8 0a 00 00 00       	mov    $0xa,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <getpid>:
SYSCALL(getpid)
 54d:	b8 0b 00 00 00       	mov    $0xb,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <sbrk>:
SYSCALL(sbrk)
 555:	b8 0c 00 00 00       	mov    $0xc,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <sleep>:
SYSCALL(sleep)
 55d:	b8 0d 00 00 00       	mov    $0xd,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <uptime>:
SYSCALL(uptime)
 565:	b8 0e 00 00 00       	mov    $0xe,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <clone>:
SYSCALL(clone)
 56d:	b8 16 00 00 00       	mov    $0x16,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <join>:
 575:	b8 17 00 00 00       	mov    $0x17,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 57d:	55                   	push   %ebp
 57e:	89 e5                	mov    %esp,%ebp
 580:	83 ec 1c             	sub    $0x1c,%esp
 583:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 586:	6a 01                	push   $0x1
 588:	8d 55 f4             	lea    -0xc(%ebp),%edx
 58b:	52                   	push   %edx
 58c:	50                   	push   %eax
 58d:	e8 5b ff ff ff       	call   4ed <write>
}
 592:	83 c4 10             	add    $0x10,%esp
 595:	c9                   	leave  
 596:	c3                   	ret    

00000597 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	57                   	push   %edi
 59b:	56                   	push   %esi
 59c:	53                   	push   %ebx
 59d:	83 ec 2c             	sub    $0x2c,%esp
 5a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a3:	89 d0                	mov    %edx,%eax
 5a5:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5a7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5ab:	0f 95 c1             	setne  %cl
 5ae:	c1 ea 1f             	shr    $0x1f,%edx
 5b1:	84 d1                	test   %dl,%cl
 5b3:	74 44                	je     5f9 <printint+0x62>
    neg = 1;
    x = -xx;
 5b5:	f7 d8                	neg    %eax
 5b7:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5b9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5c0:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5c5:	89 c8                	mov    %ecx,%eax
 5c7:	ba 00 00 00 00       	mov    $0x0,%edx
 5cc:	f7 f6                	div    %esi
 5ce:	89 df                	mov    %ebx,%edi
 5d0:	83 c3 01             	add    $0x1,%ebx
 5d3:	0f b6 92 ec 09 00 00 	movzbl 0x9ec(%edx),%edx
 5da:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5de:	89 ca                	mov    %ecx,%edx
 5e0:	89 c1                	mov    %eax,%ecx
 5e2:	39 d6                	cmp    %edx,%esi
 5e4:	76 df                	jbe    5c5 <printint+0x2e>
  if(neg)
 5e6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5ea:	74 31                	je     61d <printint+0x86>
    buf[i++] = '-';
 5ec:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5f1:	8d 5f 02             	lea    0x2(%edi),%ebx
 5f4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5f7:	eb 17                	jmp    610 <printint+0x79>
    x = xx;
 5f9:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5fb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 602:	eb bc                	jmp    5c0 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 604:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 609:	89 f0                	mov    %esi,%eax
 60b:	e8 6d ff ff ff       	call   57d <putc>
  while(--i >= 0)
 610:	83 eb 01             	sub    $0x1,%ebx
 613:	79 ef                	jns    604 <printint+0x6d>
}
 615:	83 c4 2c             	add    $0x2c,%esp
 618:	5b                   	pop    %ebx
 619:	5e                   	pop    %esi
 61a:	5f                   	pop    %edi
 61b:	5d                   	pop    %ebp
 61c:	c3                   	ret    
 61d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 620:	eb ee                	jmp    610 <printint+0x79>

00000622 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 622:	55                   	push   %ebp
 623:	89 e5                	mov    %esp,%ebp
 625:	57                   	push   %edi
 626:	56                   	push   %esi
 627:	53                   	push   %ebx
 628:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 62b:	8d 45 10             	lea    0x10(%ebp),%eax
 62e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 631:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 636:	bb 00 00 00 00       	mov    $0x0,%ebx
 63b:	eb 14                	jmp    651 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 63d:	89 fa                	mov    %edi,%edx
 63f:	8b 45 08             	mov    0x8(%ebp),%eax
 642:	e8 36 ff ff ff       	call   57d <putc>
 647:	eb 05                	jmp    64e <printf+0x2c>
      }
    } else if(state == '%'){
 649:	83 fe 25             	cmp    $0x25,%esi
 64c:	74 25                	je     673 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 64e:	83 c3 01             	add    $0x1,%ebx
 651:	8b 45 0c             	mov    0xc(%ebp),%eax
 654:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 658:	84 c0                	test   %al,%al
 65a:	0f 84 20 01 00 00    	je     780 <printf+0x15e>
    c = fmt[i] & 0xff;
 660:	0f be f8             	movsbl %al,%edi
 663:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 666:	85 f6                	test   %esi,%esi
 668:	75 df                	jne    649 <printf+0x27>
      if(c == '%'){
 66a:	83 f8 25             	cmp    $0x25,%eax
 66d:	75 ce                	jne    63d <printf+0x1b>
        state = '%';
 66f:	89 c6                	mov    %eax,%esi
 671:	eb db                	jmp    64e <printf+0x2c>
      if(c == 'd'){
 673:	83 f8 25             	cmp    $0x25,%eax
 676:	0f 84 cf 00 00 00    	je     74b <printf+0x129>
 67c:	0f 8c dd 00 00 00    	jl     75f <printf+0x13d>
 682:	83 f8 78             	cmp    $0x78,%eax
 685:	0f 8f d4 00 00 00    	jg     75f <printf+0x13d>
 68b:	83 f8 63             	cmp    $0x63,%eax
 68e:	0f 8c cb 00 00 00    	jl     75f <printf+0x13d>
 694:	83 e8 63             	sub    $0x63,%eax
 697:	83 f8 15             	cmp    $0x15,%eax
 69a:	0f 87 bf 00 00 00    	ja     75f <printf+0x13d>
 6a0:	ff 24 85 94 09 00 00 	jmp    *0x994(,%eax,4)
        printint(fd, *ap, 10, 1);
 6a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6aa:	8b 17                	mov    (%edi),%edx
 6ac:	83 ec 0c             	sub    $0xc,%esp
 6af:	6a 01                	push   $0x1
 6b1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	e8 d9 fe ff ff       	call   597 <printint>
        ap++;
 6be:	83 c7 04             	add    $0x4,%edi
 6c1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6c4:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6c7:	be 00 00 00 00       	mov    $0x0,%esi
 6cc:	eb 80                	jmp    64e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d1:	8b 17                	mov    (%edi),%edx
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	6a 00                	push   $0x0
 6d8:	b9 10 00 00 00       	mov    $0x10,%ecx
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	e8 b2 fe ff ff       	call   597 <printint>
        ap++;
 6e5:	83 c7 04             	add    $0x4,%edi
 6e8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6eb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ee:	be 00 00 00 00       	mov    $0x0,%esi
 6f3:	e9 56 ff ff ff       	jmp    64e <printf+0x2c>
        s = (char*)*ap;
 6f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6fb:	8b 30                	mov    (%eax),%esi
        ap++;
 6fd:	83 c0 04             	add    $0x4,%eax
 700:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 703:	85 f6                	test   %esi,%esi
 705:	75 15                	jne    71c <printf+0xfa>
          s = "(null)";
 707:	be 8c 09 00 00       	mov    $0x98c,%esi
 70c:	eb 0e                	jmp    71c <printf+0xfa>
          putc(fd, *s);
 70e:	0f be d2             	movsbl %dl,%edx
 711:	8b 45 08             	mov    0x8(%ebp),%eax
 714:	e8 64 fe ff ff       	call   57d <putc>
          s++;
 719:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 71c:	0f b6 16             	movzbl (%esi),%edx
 71f:	84 d2                	test   %dl,%dl
 721:	75 eb                	jne    70e <printf+0xec>
      state = 0;
 723:	be 00 00 00 00       	mov    $0x0,%esi
 728:	e9 21 ff ff ff       	jmp    64e <printf+0x2c>
        putc(fd, *ap);
 72d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 730:	0f be 17             	movsbl (%edi),%edx
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	e8 42 fe ff ff       	call   57d <putc>
        ap++;
 73b:	83 c7 04             	add    $0x4,%edi
 73e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 741:	be 00 00 00 00       	mov    $0x0,%esi
 746:	e9 03 ff ff ff       	jmp    64e <printf+0x2c>
        putc(fd, c);
 74b:	89 fa                	mov    %edi,%edx
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
 750:	e8 28 fe ff ff       	call   57d <putc>
      state = 0;
 755:	be 00 00 00 00       	mov    $0x0,%esi
 75a:	e9 ef fe ff ff       	jmp    64e <printf+0x2c>
        putc(fd, '%');
 75f:	ba 25 00 00 00       	mov    $0x25,%edx
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	e8 11 fe ff ff       	call   57d <putc>
        putc(fd, c);
 76c:	89 fa                	mov    %edi,%edx
 76e:	8b 45 08             	mov    0x8(%ebp),%eax
 771:	e8 07 fe ff ff       	call   57d <putc>
      state = 0;
 776:	be 00 00 00 00       	mov    $0x0,%esi
 77b:	e9 ce fe ff ff       	jmp    64e <printf+0x2c>
    }
  }
}
 780:	8d 65 f4             	lea    -0xc(%ebp),%esp
 783:	5b                   	pop    %ebx
 784:	5e                   	pop    %esi
 785:	5f                   	pop    %edi
 786:	5d                   	pop    %ebp
 787:	c3                   	ret    

00000788 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 788:	55                   	push   %ebp
 789:	89 e5                	mov    %esp,%ebp
 78b:	57                   	push   %edi
 78c:	56                   	push   %esi
 78d:	53                   	push   %ebx
 78e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 791:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 794:	a1 a0 0e 00 00       	mov    0xea0,%eax
 799:	eb 02                	jmp    79d <free+0x15>
 79b:	89 d0                	mov    %edx,%eax
 79d:	39 c8                	cmp    %ecx,%eax
 79f:	73 04                	jae    7a5 <free+0x1d>
 7a1:	39 08                	cmp    %ecx,(%eax)
 7a3:	77 12                	ja     7b7 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a5:	8b 10                	mov    (%eax),%edx
 7a7:	39 c2                	cmp    %eax,%edx
 7a9:	77 f0                	ja     79b <free+0x13>
 7ab:	39 c8                	cmp    %ecx,%eax
 7ad:	72 08                	jb     7b7 <free+0x2f>
 7af:	39 ca                	cmp    %ecx,%edx
 7b1:	77 04                	ja     7b7 <free+0x2f>
 7b3:	89 d0                	mov    %edx,%eax
 7b5:	eb e6                	jmp    79d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ba:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7bd:	8b 10                	mov    (%eax),%edx
 7bf:	39 d7                	cmp    %edx,%edi
 7c1:	74 19                	je     7dc <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7c3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7c6:	8b 50 04             	mov    0x4(%eax),%edx
 7c9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7cc:	39 ce                	cmp    %ecx,%esi
 7ce:	74 1b                	je     7eb <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7d0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7d2:	a3 a0 0e 00 00       	mov    %eax,0xea0
}
 7d7:	5b                   	pop    %ebx
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7dc:	03 72 04             	add    0x4(%edx),%esi
 7df:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e2:	8b 10                	mov    (%eax),%edx
 7e4:	8b 12                	mov    (%edx),%edx
 7e6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7e9:	eb db                	jmp    7c6 <free+0x3e>
    p->s.size += bp->s.size;
 7eb:	03 53 fc             	add    -0x4(%ebx),%edx
 7ee:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7f4:	89 10                	mov    %edx,(%eax)
 7f6:	eb da                	jmp    7d2 <free+0x4a>

000007f8 <morecore>:

static Header*
morecore(uint nu)
{
 7f8:	55                   	push   %ebp
 7f9:	89 e5                	mov    %esp,%ebp
 7fb:	53                   	push   %ebx
 7fc:	83 ec 04             	sub    $0x4,%esp
 7ff:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 801:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 806:	77 05                	ja     80d <morecore+0x15>
    nu = 4096;
 808:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 80d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 814:	83 ec 0c             	sub    $0xc,%esp
 817:	50                   	push   %eax
 818:	e8 38 fd ff ff       	call   555 <sbrk>
  if(p == (char*)-1)
 81d:	83 c4 10             	add    $0x10,%esp
 820:	83 f8 ff             	cmp    $0xffffffff,%eax
 823:	74 1c                	je     841 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 825:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 828:	83 c0 08             	add    $0x8,%eax
 82b:	83 ec 0c             	sub    $0xc,%esp
 82e:	50                   	push   %eax
 82f:	e8 54 ff ff ff       	call   788 <free>
  return freep;
 834:	a1 a0 0e 00 00       	mov    0xea0,%eax
 839:	83 c4 10             	add    $0x10,%esp
}
 83c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 83f:	c9                   	leave  
 840:	c3                   	ret    
    return 0;
 841:	b8 00 00 00 00       	mov    $0x0,%eax
 846:	eb f4                	jmp    83c <morecore+0x44>

00000848 <malloc>:

void*
malloc(uint nbytes)
{
 848:	55                   	push   %ebp
 849:	89 e5                	mov    %esp,%ebp
 84b:	53                   	push   %ebx
 84c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 84f:	8b 45 08             	mov    0x8(%ebp),%eax
 852:	8d 58 07             	lea    0x7(%eax),%ebx
 855:	c1 eb 03             	shr    $0x3,%ebx
 858:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 85b:	8b 0d a0 0e 00 00    	mov    0xea0,%ecx
 861:	85 c9                	test   %ecx,%ecx
 863:	74 04                	je     869 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 865:	8b 01                	mov    (%ecx),%eax
 867:	eb 4a                	jmp    8b3 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 869:	c7 05 a0 0e 00 00 a4 	movl   $0xea4,0xea0
 870:	0e 00 00 
 873:	c7 05 a4 0e 00 00 a4 	movl   $0xea4,0xea4
 87a:	0e 00 00 
    base.s.size = 0;
 87d:	c7 05 a8 0e 00 00 00 	movl   $0x0,0xea8
 884:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 887:	b9 a4 0e 00 00       	mov    $0xea4,%ecx
 88c:	eb d7                	jmp    865 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 88e:	74 19                	je     8a9 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 890:	29 da                	sub    %ebx,%edx
 892:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 895:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 898:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 89b:	89 0d a0 0e 00 00    	mov    %ecx,0xea0
      return (void*)(p + 1);
 8a1:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a7:	c9                   	leave  
 8a8:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8a9:	8b 10                	mov    (%eax),%edx
 8ab:	89 11                	mov    %edx,(%ecx)
 8ad:	eb ec                	jmp    89b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8af:	89 c1                	mov    %eax,%ecx
 8b1:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8b3:	8b 50 04             	mov    0x4(%eax),%edx
 8b6:	39 da                	cmp    %ebx,%edx
 8b8:	73 d4                	jae    88e <malloc+0x46>
    if(p == freep)
 8ba:	39 05 a0 0e 00 00    	cmp    %eax,0xea0
 8c0:	75 ed                	jne    8af <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8c2:	89 d8                	mov    %ebx,%eax
 8c4:	e8 2f ff ff ff       	call   7f8 <morecore>
 8c9:	85 c0                	test   %eax,%eax
 8cb:	75 e2                	jne    8af <malloc+0x67>
 8cd:	eb d5                	jmp    8a4 <malloc+0x5c>
