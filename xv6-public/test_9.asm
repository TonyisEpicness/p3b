
_test_9:     file format elf32-i386


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
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
   6:	8d 4d 0c             	lea    0xc(%ebp),%ecx
   9:	8b 45 08             	mov    0x8(%ebp),%eax
   c:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
  12:	39 d1                	cmp    %edx,%ecx
  14:	75 67                	jne    7d <worker+0x7d>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  16:	8d 90 f8 0f 00 00    	lea    0xff8(%eax),%edx
  1c:	8d 4d 08             	lea    0x8(%ebp),%ecx
  1f:	39 d1                	cmp    %edx,%ecx
  21:	0f 85 9f 00 00 00    	jne    c6 <worker+0xc6>
   assert(*((uint*) (arg1 + PGSIZE - 12)) == 0xffffffff);
  27:	83 b8 f4 0f 00 00 ff 	cmpl   $0xffffffff,0xff4(%eax)
  2e:	0f 84 db 00 00 00    	je     10f <worker+0x10f>
  34:	6a 32                	push   $0x32
  36:	68 d0 08 00 00       	push   $0x8d0
  3b:	68 d9 08 00 00       	push   $0x8d9
  40:	6a 01                	push   $0x1
  42:	e8 da 05 00 00       	call   621 <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 98 09 00 00       	push   $0x998
  4f:	68 e1 08 00 00       	push   $0x8e1
  54:	6a 01                	push   $0x1
  56:	e8 c6 05 00 00       	call   621 <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 f5 08 00 00       	push   $0x8f5
  63:	6a 01                	push   $0x1
  65:	e8 b7 05 00 00       	call   621 <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 b8 0d 00 00    	push   0xdb8
  73:	e8 84 04 00 00       	call   4fc <kill>
  78:	e8 4f 04 00 00       	call   4cc <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 d0 08 00 00       	push   $0x8d0
  84:	68 d9 08 00 00       	push   $0x8d9
  89:	6a 01                	push   $0x1
  8b:	e8 91 05 00 00       	call   621 <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 40 09 00 00       	push   $0x940
  98:	68 e1 08 00 00       	push   $0x8e1
  9d:	6a 01                	push   $0x1
  9f:	e8 7d 05 00 00       	call   621 <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 f5 08 00 00       	push   $0x8f5
  ac:	6a 01                	push   $0x1
  ae:	e8 6e 05 00 00       	call   621 <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 b8 0d 00 00    	push   0xdb8
  bc:	e8 3b 04 00 00       	call   4fc <kill>
  c1:	e8 06 04 00 00       	call   4cc <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 d0 08 00 00       	push   $0x8d0
  cd:	68 d9 08 00 00       	push   $0x8d9
  d2:	6a 01                	push   $0x1
  d4:	e8 48 05 00 00       	call   621 <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 6c 09 00 00       	push   $0x96c
  e1:	68 e1 08 00 00       	push   $0x8e1
  e6:	6a 01                	push   $0x1
  e8:	e8 34 05 00 00       	call   621 <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 f5 08 00 00       	push   $0x8f5
  f5:	6a 01                	push   $0x1
  f7:	e8 25 05 00 00       	call   621 <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 b8 0d 00 00    	push   0xdb8
 105:	e8 f2 03 00 00       	call   4fc <kill>
 10a:	e8 bd 03 00 00       	call   4cc <exit>
   global = 5;
 10f:	c7 05 b4 0d 00 00 05 	movl   $0x5,0xdb4
 116:	00 00 00 
   exit();
 119:	e8 ae 03 00 00       	call   4cc <exit>

0000011e <main>:
{
 11e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 122:	83 e4 f0             	and    $0xfffffff0,%esp
 125:	ff 71 fc             	push   -0x4(%ecx)
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	56                   	push   %esi
 12c:	53                   	push   %ebx
 12d:	51                   	push   %ecx
 12e:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
 131:	e8 16 04 00 00       	call   54c <getpid>
 136:	a3 b8 0d 00 00       	mov    %eax,0xdb8
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 ff 06 00 00       	call   847 <malloc>
   assert(p != NULL);
 148:	83 c4 10             	add    $0x10,%esp
 14b:	85 c0                	test   %eax,%eax
 14d:	0f 84 a8 00 00 00    	je     1fb <main+0xdd>
 153:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 155:	89 c2                	mov    %eax,%edx
 157:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 15d:	74 09                	je     168 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 15f:	b8 00 10 00 00       	mov    $0x1000,%eax
 164:	29 d0                	sub    %edx,%eax
 166:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, stack, 0, stack);
 168:	50                   	push   %eax
 169:	6a 00                	push   $0x0
 16b:	50                   	push   %eax
 16c:	68 00 00 00 00       	push   $0x0
 171:	e8 f6 03 00 00       	call   56c <clone>
 176:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 178:	83 c4 10             	add    $0x10,%esp
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 8e c1 00 00 00    	jle    244 <main+0x126>
   while(global != 5);
 183:	a1 b4 0d 00 00       	mov    0xdb4,%eax
 188:	83 f8 05             	cmp    $0x5,%eax
 18b:	75 f6                	jne    183 <main+0x65>
   printf(1, "TEST PASSED\n");
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	68 1a 09 00 00       	push   $0x91a
 195:	6a 01                	push   $0x1
 197:	e8 85 04 00 00       	call   621 <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 cd 03 00 00       	call   574 <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 d0 08 00 00       	push   $0x8d0
 1b9:	68 d9 08 00 00       	push   $0x8d9
 1be:	6a 01                	push   $0x1
 1c0:	e8 5c 04 00 00       	call   621 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 27 09 00 00       	push   $0x927
 1cd:	68 e1 08 00 00       	push   $0x8e1
 1d2:	6a 01                	push   $0x1
 1d4:	e8 48 04 00 00       	call   621 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 f5 08 00 00       	push   $0x8f5
 1e1:	6a 01                	push   $0x1
 1e3:	e8 39 04 00 00       	call   621 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 b8 0d 00 00    	push   0xdb8
 1f1:	e8 06 03 00 00       	call   4fc <kill>
 1f6:	e8 d1 02 00 00       	call   4cc <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 d0 08 00 00       	push   $0x8d0
 202:	68 d9 08 00 00       	push   $0x8d9
 207:	6a 01                	push   $0x1
 209:	e8 13 04 00 00       	call   621 <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 02 09 00 00       	push   $0x902
 216:	68 e1 08 00 00       	push   $0x8e1
 21b:	6a 01                	push   $0x1
 21d:	e8 ff 03 00 00       	call   621 <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 f5 08 00 00       	push   $0x8f5
 22a:	6a 01                	push   $0x1
 22c:	e8 f0 03 00 00       	call   621 <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 b8 0d 00 00    	push   0xdb8
 23a:	e8 bd 02 00 00       	call   4fc <kill>
 23f:	e8 88 02 00 00       	call   4cc <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 d0 08 00 00       	push   $0x8d0
 24b:	68 d9 08 00 00       	push   $0x8d9
 250:	6a 01                	push   $0x1
 252:	e8 ca 03 00 00       	call   621 <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 0c 09 00 00       	push   $0x90c
 25f:	68 e1 08 00 00       	push   $0x8e1
 264:	6a 01                	push   $0x1
 266:	e8 b6 03 00 00       	call   621 <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 f5 08 00 00       	push   $0x8f5
 273:	6a 01                	push   $0x1
 275:	e8 a7 03 00 00       	call   621 <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 b8 0d 00 00    	push   0xdb8
 283:	e8 74 02 00 00       	call   4fc <kill>
 288:	e8 3f 02 00 00       	call   4cc <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 f1 04 00 00       	call   787 <free>
   exit();
 296:	e8 31 02 00 00       	call   4cc <exit>

0000029b <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2a1:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2a6:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2a8:	89 d0                	mov    %edx,%eax
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    

000002ac <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2ac:	55                   	push   %ebp
 2ad:	89 e5                	mov    %esp,%ebp
 2af:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2b2:	68 00 20 00 00       	push   $0x2000
 2b7:	e8 8b 05 00 00       	call   847 <malloc>
  if(n_stack == 0){
 2bc:	83 c4 10             	add    $0x10,%esp
 2bf:	85 c0                	test   %eax,%eax
 2c1:	74 14                	je     2d7 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2c3:	50                   	push   %eax
 2c4:	ff 75 10             	push   0x10(%ebp)
 2c7:	ff 75 0c             	push   0xc(%ebp)
 2ca:	ff 75 08             	push   0x8(%ebp)
 2cd:	e8 9a 02 00 00       	call   56c <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 2d2:	83 c4 10             	add    $0x10,%esp
}
 2d5:	c9                   	leave  
 2d6:	c3                   	ret    
    return -1;
 2d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2dc:	eb f7                	jmp    2d5 <thread_create+0x29>

000002de <thread_join>:

int thread_join() {
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2e7:	50                   	push   %eax
 2e8:	e8 87 02 00 00       	call   574 <join>
  
  return pid;
}
 2ed:	c9                   	leave  
 2ee:	c3                   	ret    

000002ef <lock_acquire>:

void lock_acquire(lock_t *lock){
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	53                   	push   %ebx
 2f3:	83 ec 04             	sub    $0x4,%esp
 2f6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	6a 01                	push   $0x1
 2fe:	53                   	push   %ebx
 2ff:	e8 97 ff ff ff       	call   29b <test_and_set>
 304:	83 c4 10             	add    $0x10,%esp
 307:	83 f8 01             	cmp    $0x1,%eax
 30a:	74 ed                	je     2f9 <lock_acquire+0xa>
    ;
}
 30c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <lock_release>:

void lock_release(lock_t *lock) {
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 314:	8b 45 08             	mov    0x8(%ebp),%eax
 317:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret    

0000031f <lock_init>:

void lock_init(lock_t *lock) {
 31f:	55                   	push   %ebp
 320:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 322:	8b 45 08             	mov    0x8(%ebp),%eax
 325:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    

0000032d <strcpy>:

char*
strcpy(char *s, const char *t)
{
 32d:	55                   	push   %ebp
 32e:	89 e5                	mov    %esp,%ebp
 330:	56                   	push   %esi
 331:	53                   	push   %ebx
 332:	8b 75 08             	mov    0x8(%ebp),%esi
 335:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 338:	89 f0                	mov    %esi,%eax
 33a:	89 d1                	mov    %edx,%ecx
 33c:	83 c2 01             	add    $0x1,%edx
 33f:	89 c3                	mov    %eax,%ebx
 341:	83 c0 01             	add    $0x1,%eax
 344:	0f b6 09             	movzbl (%ecx),%ecx
 347:	88 0b                	mov    %cl,(%ebx)
 349:	84 c9                	test   %cl,%cl
 34b:	75 ed                	jne    33a <strcpy+0xd>
    ;
  return os;
}
 34d:	89 f0                	mov    %esi,%eax
 34f:	5b                   	pop    %ebx
 350:	5e                   	pop    %esi
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    

00000353 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	8b 4d 08             	mov    0x8(%ebp),%ecx
 359:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 35c:	eb 06                	jmp    364 <strcmp+0x11>
    p++, q++;
 35e:	83 c1 01             	add    $0x1,%ecx
 361:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 364:	0f b6 01             	movzbl (%ecx),%eax
 367:	84 c0                	test   %al,%al
 369:	74 04                	je     36f <strcmp+0x1c>
 36b:	3a 02                	cmp    (%edx),%al
 36d:	74 ef                	je     35e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 36f:	0f b6 c0             	movzbl %al,%eax
 372:	0f b6 12             	movzbl (%edx),%edx
 375:	29 d0                	sub    %edx,%eax
}
 377:	5d                   	pop    %ebp
 378:	c3                   	ret    

00000379 <strlen>:

uint
strlen(const char *s)
{
 379:	55                   	push   %ebp
 37a:	89 e5                	mov    %esp,%ebp
 37c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 37f:	b8 00 00 00 00       	mov    $0x0,%eax
 384:	eb 03                	jmp    389 <strlen+0x10>
 386:	83 c0 01             	add    $0x1,%eax
 389:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 38d:	75 f7                	jne    386 <strlen+0xd>
    ;
  return n;
}
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    

00000391 <memset>:

void*
memset(void *dst, int c, uint n)
{
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	57                   	push   %edi
 395:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 398:	89 d7                	mov    %edx,%edi
 39a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 39d:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a0:	fc                   	cld    
 3a1:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3a3:	89 d0                	mov    %edx,%eax
 3a5:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3a8:	c9                   	leave  
 3a9:	c3                   	ret    

000003aa <strchr>:

char*
strchr(const char *s, char c)
{
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
 3ad:	8b 45 08             	mov    0x8(%ebp),%eax
 3b0:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3b4:	eb 03                	jmp    3b9 <strchr+0xf>
 3b6:	83 c0 01             	add    $0x1,%eax
 3b9:	0f b6 10             	movzbl (%eax),%edx
 3bc:	84 d2                	test   %dl,%dl
 3be:	74 06                	je     3c6 <strchr+0x1c>
    if(*s == c)
 3c0:	38 ca                	cmp    %cl,%dl
 3c2:	75 f2                	jne    3b6 <strchr+0xc>
 3c4:	eb 05                	jmp    3cb <strchr+0x21>
      return (char*)s;
  return 0;
 3c6:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    

000003cd <gets>:

char*
gets(char *buf, int max)
{
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
 3d0:	57                   	push   %edi
 3d1:	56                   	push   %esi
 3d2:	53                   	push   %ebx
 3d3:	83 ec 1c             	sub    $0x1c,%esp
 3d6:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d9:	bb 00 00 00 00       	mov    $0x0,%ebx
 3de:	89 de                	mov    %ebx,%esi
 3e0:	83 c3 01             	add    $0x1,%ebx
 3e3:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e6:	7d 2e                	jge    416 <gets+0x49>
    cc = read(0, &c, 1);
 3e8:	83 ec 04             	sub    $0x4,%esp
 3eb:	6a 01                	push   $0x1
 3ed:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f0:	50                   	push   %eax
 3f1:	6a 00                	push   $0x0
 3f3:	e8 ec 00 00 00       	call   4e4 <read>
    if(cc < 1)
 3f8:	83 c4 10             	add    $0x10,%esp
 3fb:	85 c0                	test   %eax,%eax
 3fd:	7e 17                	jle    416 <gets+0x49>
      break;
    buf[i++] = c;
 3ff:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 403:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 406:	3c 0a                	cmp    $0xa,%al
 408:	0f 94 c2             	sete   %dl
 40b:	3c 0d                	cmp    $0xd,%al
 40d:	0f 94 c0             	sete   %al
 410:	08 c2                	or     %al,%dl
 412:	74 ca                	je     3de <gets+0x11>
    buf[i++] = c;
 414:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 416:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 41a:	89 f8                	mov    %edi,%eax
 41c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41f:	5b                   	pop    %ebx
 420:	5e                   	pop    %esi
 421:	5f                   	pop    %edi
 422:	5d                   	pop    %ebp
 423:	c3                   	ret    

00000424 <stat>:

int
stat(const char *n, struct stat *st)
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	56                   	push   %esi
 428:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 429:	83 ec 08             	sub    $0x8,%esp
 42c:	6a 00                	push   $0x0
 42e:	ff 75 08             	push   0x8(%ebp)
 431:	e8 d6 00 00 00       	call   50c <open>
  if(fd < 0)
 436:	83 c4 10             	add    $0x10,%esp
 439:	85 c0                	test   %eax,%eax
 43b:	78 24                	js     461 <stat+0x3d>
 43d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 43f:	83 ec 08             	sub    $0x8,%esp
 442:	ff 75 0c             	push   0xc(%ebp)
 445:	50                   	push   %eax
 446:	e8 d9 00 00 00       	call   524 <fstat>
 44b:	89 c6                	mov    %eax,%esi
  close(fd);
 44d:	89 1c 24             	mov    %ebx,(%esp)
 450:	e8 9f 00 00 00       	call   4f4 <close>
  return r;
 455:	83 c4 10             	add    $0x10,%esp
}
 458:	89 f0                	mov    %esi,%eax
 45a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 45d:	5b                   	pop    %ebx
 45e:	5e                   	pop    %esi
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    
    return -1;
 461:	be ff ff ff ff       	mov    $0xffffffff,%esi
 466:	eb f0                	jmp    458 <stat+0x34>

00000468 <atoi>:

int
atoi(const char *s)
{
 468:	55                   	push   %ebp
 469:	89 e5                	mov    %esp,%ebp
 46b:	53                   	push   %ebx
 46c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 46f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 474:	eb 10                	jmp    486 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 476:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 479:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 47c:	83 c1 01             	add    $0x1,%ecx
 47f:	0f be c0             	movsbl %al,%eax
 482:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 486:	0f b6 01             	movzbl (%ecx),%eax
 489:	8d 58 d0             	lea    -0x30(%eax),%ebx
 48c:	80 fb 09             	cmp    $0x9,%bl
 48f:	76 e5                	jbe    476 <atoi+0xe>
  return n;
}
 491:	89 d0                	mov    %edx,%eax
 493:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 496:	c9                   	leave  
 497:	c3                   	ret    

00000498 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 498:	55                   	push   %ebp
 499:	89 e5                	mov    %esp,%ebp
 49b:	56                   	push   %esi
 49c:	53                   	push   %ebx
 49d:	8b 75 08             	mov    0x8(%ebp),%esi
 4a0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4a3:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4a6:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4a8:	eb 0d                	jmp    4b7 <memmove+0x1f>
    *dst++ = *src++;
 4aa:	0f b6 01             	movzbl (%ecx),%eax
 4ad:	88 02                	mov    %al,(%edx)
 4af:	8d 49 01             	lea    0x1(%ecx),%ecx
 4b2:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4b5:	89 d8                	mov    %ebx,%eax
 4b7:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4ba:	85 c0                	test   %eax,%eax
 4bc:	7f ec                	jg     4aa <memmove+0x12>
  return vdst;
}
 4be:	89 f0                	mov    %esi,%eax
 4c0:	5b                   	pop    %ebx
 4c1:	5e                   	pop    %esi
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    

000004c4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4c4:	b8 01 00 00 00       	mov    $0x1,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <exit>:
SYSCALL(exit)
 4cc:	b8 02 00 00 00       	mov    $0x2,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <wait>:
SYSCALL(wait)
 4d4:	b8 03 00 00 00       	mov    $0x3,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <pipe>:
SYSCALL(pipe)
 4dc:	b8 04 00 00 00       	mov    $0x4,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <read>:
SYSCALL(read)
 4e4:	b8 05 00 00 00       	mov    $0x5,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <write>:
SYSCALL(write)
 4ec:	b8 10 00 00 00       	mov    $0x10,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <close>:
SYSCALL(close)
 4f4:	b8 15 00 00 00       	mov    $0x15,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <kill>:
SYSCALL(kill)
 4fc:	b8 06 00 00 00       	mov    $0x6,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <exec>:
SYSCALL(exec)
 504:	b8 07 00 00 00       	mov    $0x7,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <open>:
SYSCALL(open)
 50c:	b8 0f 00 00 00       	mov    $0xf,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <mknod>:
SYSCALL(mknod)
 514:	b8 11 00 00 00       	mov    $0x11,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <unlink>:
SYSCALL(unlink)
 51c:	b8 12 00 00 00       	mov    $0x12,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <fstat>:
SYSCALL(fstat)
 524:	b8 08 00 00 00       	mov    $0x8,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <link>:
SYSCALL(link)
 52c:	b8 13 00 00 00       	mov    $0x13,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <mkdir>:
SYSCALL(mkdir)
 534:	b8 14 00 00 00       	mov    $0x14,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <chdir>:
SYSCALL(chdir)
 53c:	b8 09 00 00 00       	mov    $0x9,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <dup>:
SYSCALL(dup)
 544:	b8 0a 00 00 00       	mov    $0xa,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <getpid>:
SYSCALL(getpid)
 54c:	b8 0b 00 00 00       	mov    $0xb,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <sbrk>:
SYSCALL(sbrk)
 554:	b8 0c 00 00 00       	mov    $0xc,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <sleep>:
SYSCALL(sleep)
 55c:	b8 0d 00 00 00       	mov    $0xd,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <uptime>:
SYSCALL(uptime)
 564:	b8 0e 00 00 00       	mov    $0xe,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <clone>:
SYSCALL(clone)
 56c:	b8 16 00 00 00       	mov    $0x16,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <join>:
 574:	b8 17 00 00 00       	mov    $0x17,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 57c:	55                   	push   %ebp
 57d:	89 e5                	mov    %esp,%ebp
 57f:	83 ec 1c             	sub    $0x1c,%esp
 582:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 585:	6a 01                	push   $0x1
 587:	8d 55 f4             	lea    -0xc(%ebp),%edx
 58a:	52                   	push   %edx
 58b:	50                   	push   %eax
 58c:	e8 5b ff ff ff       	call   4ec <write>
}
 591:	83 c4 10             	add    $0x10,%esp
 594:	c9                   	leave  
 595:	c3                   	ret    

00000596 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 596:	55                   	push   %ebp
 597:	89 e5                	mov    %esp,%ebp
 599:	57                   	push   %edi
 59a:	56                   	push   %esi
 59b:	53                   	push   %ebx
 59c:	83 ec 2c             	sub    $0x2c,%esp
 59f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a2:	89 d0                	mov    %edx,%eax
 5a4:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5a6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5aa:	0f 95 c1             	setne  %cl
 5ad:	c1 ea 1f             	shr    $0x1f,%edx
 5b0:	84 d1                	test   %dl,%cl
 5b2:	74 44                	je     5f8 <printint+0x62>
    neg = 1;
    x = -xx;
 5b4:	f7 d8                	neg    %eax
 5b6:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5b8:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5bf:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5c4:	89 c8                	mov    %ecx,%eax
 5c6:	ba 00 00 00 00       	mov    $0x0,%edx
 5cb:	f7 f6                	div    %esi
 5cd:	89 df                	mov    %ebx,%edi
 5cf:	83 c3 01             	add    $0x1,%ebx
 5d2:	0f b6 92 28 0a 00 00 	movzbl 0xa28(%edx),%edx
 5d9:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5dd:	89 ca                	mov    %ecx,%edx
 5df:	89 c1                	mov    %eax,%ecx
 5e1:	39 d6                	cmp    %edx,%esi
 5e3:	76 df                	jbe    5c4 <printint+0x2e>
  if(neg)
 5e5:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5e9:	74 31                	je     61c <printint+0x86>
    buf[i++] = '-';
 5eb:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5f0:	8d 5f 02             	lea    0x2(%edi),%ebx
 5f3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5f6:	eb 17                	jmp    60f <printint+0x79>
    x = xx;
 5f8:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5fa:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 601:	eb bc                	jmp    5bf <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 603:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 608:	89 f0                	mov    %esi,%eax
 60a:	e8 6d ff ff ff       	call   57c <putc>
  while(--i >= 0)
 60f:	83 eb 01             	sub    $0x1,%ebx
 612:	79 ef                	jns    603 <printint+0x6d>
}
 614:	83 c4 2c             	add    $0x2c,%esp
 617:	5b                   	pop    %ebx
 618:	5e                   	pop    %esi
 619:	5f                   	pop    %edi
 61a:	5d                   	pop    %ebp
 61b:	c3                   	ret    
 61c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 61f:	eb ee                	jmp    60f <printint+0x79>

00000621 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 621:	55                   	push   %ebp
 622:	89 e5                	mov    %esp,%ebp
 624:	57                   	push   %edi
 625:	56                   	push   %esi
 626:	53                   	push   %ebx
 627:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 62a:	8d 45 10             	lea    0x10(%ebp),%eax
 62d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 630:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 635:	bb 00 00 00 00       	mov    $0x0,%ebx
 63a:	eb 14                	jmp    650 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 63c:	89 fa                	mov    %edi,%edx
 63e:	8b 45 08             	mov    0x8(%ebp),%eax
 641:	e8 36 ff ff ff       	call   57c <putc>
 646:	eb 05                	jmp    64d <printf+0x2c>
      }
    } else if(state == '%'){
 648:	83 fe 25             	cmp    $0x25,%esi
 64b:	74 25                	je     672 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 64d:	83 c3 01             	add    $0x1,%ebx
 650:	8b 45 0c             	mov    0xc(%ebp),%eax
 653:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 657:	84 c0                	test   %al,%al
 659:	0f 84 20 01 00 00    	je     77f <printf+0x15e>
    c = fmt[i] & 0xff;
 65f:	0f be f8             	movsbl %al,%edi
 662:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 665:	85 f6                	test   %esi,%esi
 667:	75 df                	jne    648 <printf+0x27>
      if(c == '%'){
 669:	83 f8 25             	cmp    $0x25,%eax
 66c:	75 ce                	jne    63c <printf+0x1b>
        state = '%';
 66e:	89 c6                	mov    %eax,%esi
 670:	eb db                	jmp    64d <printf+0x2c>
      if(c == 'd'){
 672:	83 f8 25             	cmp    $0x25,%eax
 675:	0f 84 cf 00 00 00    	je     74a <printf+0x129>
 67b:	0f 8c dd 00 00 00    	jl     75e <printf+0x13d>
 681:	83 f8 78             	cmp    $0x78,%eax
 684:	0f 8f d4 00 00 00    	jg     75e <printf+0x13d>
 68a:	83 f8 63             	cmp    $0x63,%eax
 68d:	0f 8c cb 00 00 00    	jl     75e <printf+0x13d>
 693:	83 e8 63             	sub    $0x63,%eax
 696:	83 f8 15             	cmp    $0x15,%eax
 699:	0f 87 bf 00 00 00    	ja     75e <printf+0x13d>
 69f:	ff 24 85 d0 09 00 00 	jmp    *0x9d0(,%eax,4)
        printint(fd, *ap, 10, 1);
 6a6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6a9:	8b 17                	mov    (%edi),%edx
 6ab:	83 ec 0c             	sub    $0xc,%esp
 6ae:	6a 01                	push   $0x1
 6b0:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	e8 d9 fe ff ff       	call   596 <printint>
        ap++;
 6bd:	83 c7 04             	add    $0x4,%edi
 6c0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6c3:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6c6:	be 00 00 00 00       	mov    $0x0,%esi
 6cb:	eb 80                	jmp    64d <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6cd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d0:	8b 17                	mov    (%edi),%edx
 6d2:	83 ec 0c             	sub    $0xc,%esp
 6d5:	6a 00                	push   $0x0
 6d7:	b9 10 00 00 00       	mov    $0x10,%ecx
 6dc:	8b 45 08             	mov    0x8(%ebp),%eax
 6df:	e8 b2 fe ff ff       	call   596 <printint>
        ap++;
 6e4:	83 c7 04             	add    $0x4,%edi
 6e7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ed:	be 00 00 00 00       	mov    $0x0,%esi
 6f2:	e9 56 ff ff ff       	jmp    64d <printf+0x2c>
        s = (char*)*ap;
 6f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6fa:	8b 30                	mov    (%eax),%esi
        ap++;
 6fc:	83 c0 04             	add    $0x4,%eax
 6ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 702:	85 f6                	test   %esi,%esi
 704:	75 15                	jne    71b <printf+0xfa>
          s = "(null)";
 706:	be c6 09 00 00       	mov    $0x9c6,%esi
 70b:	eb 0e                	jmp    71b <printf+0xfa>
          putc(fd, *s);
 70d:	0f be d2             	movsbl %dl,%edx
 710:	8b 45 08             	mov    0x8(%ebp),%eax
 713:	e8 64 fe ff ff       	call   57c <putc>
          s++;
 718:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 71b:	0f b6 16             	movzbl (%esi),%edx
 71e:	84 d2                	test   %dl,%dl
 720:	75 eb                	jne    70d <printf+0xec>
      state = 0;
 722:	be 00 00 00 00       	mov    $0x0,%esi
 727:	e9 21 ff ff ff       	jmp    64d <printf+0x2c>
        putc(fd, *ap);
 72c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 72f:	0f be 17             	movsbl (%edi),%edx
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	e8 42 fe ff ff       	call   57c <putc>
        ap++;
 73a:	83 c7 04             	add    $0x4,%edi
 73d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 740:	be 00 00 00 00       	mov    $0x0,%esi
 745:	e9 03 ff ff ff       	jmp    64d <printf+0x2c>
        putc(fd, c);
 74a:	89 fa                	mov    %edi,%edx
 74c:	8b 45 08             	mov    0x8(%ebp),%eax
 74f:	e8 28 fe ff ff       	call   57c <putc>
      state = 0;
 754:	be 00 00 00 00       	mov    $0x0,%esi
 759:	e9 ef fe ff ff       	jmp    64d <printf+0x2c>
        putc(fd, '%');
 75e:	ba 25 00 00 00       	mov    $0x25,%edx
 763:	8b 45 08             	mov    0x8(%ebp),%eax
 766:	e8 11 fe ff ff       	call   57c <putc>
        putc(fd, c);
 76b:	89 fa                	mov    %edi,%edx
 76d:	8b 45 08             	mov    0x8(%ebp),%eax
 770:	e8 07 fe ff ff       	call   57c <putc>
      state = 0;
 775:	be 00 00 00 00       	mov    $0x0,%esi
 77a:	e9 ce fe ff ff       	jmp    64d <printf+0x2c>
    }
  }
}
 77f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 782:	5b                   	pop    %ebx
 783:	5e                   	pop    %esi
 784:	5f                   	pop    %edi
 785:	5d                   	pop    %ebp
 786:	c3                   	ret    

00000787 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 787:	55                   	push   %ebp
 788:	89 e5                	mov    %esp,%ebp
 78a:	57                   	push   %edi
 78b:	56                   	push   %esi
 78c:	53                   	push   %ebx
 78d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 790:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 793:	a1 bc 0d 00 00       	mov    0xdbc,%eax
 798:	eb 02                	jmp    79c <free+0x15>
 79a:	89 d0                	mov    %edx,%eax
 79c:	39 c8                	cmp    %ecx,%eax
 79e:	73 04                	jae    7a4 <free+0x1d>
 7a0:	39 08                	cmp    %ecx,(%eax)
 7a2:	77 12                	ja     7b6 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a4:	8b 10                	mov    (%eax),%edx
 7a6:	39 c2                	cmp    %eax,%edx
 7a8:	77 f0                	ja     79a <free+0x13>
 7aa:	39 c8                	cmp    %ecx,%eax
 7ac:	72 08                	jb     7b6 <free+0x2f>
 7ae:	39 ca                	cmp    %ecx,%edx
 7b0:	77 04                	ja     7b6 <free+0x2f>
 7b2:	89 d0                	mov    %edx,%eax
 7b4:	eb e6                	jmp    79c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7bc:	8b 10                	mov    (%eax),%edx
 7be:	39 d7                	cmp    %edx,%edi
 7c0:	74 19                	je     7db <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7c5:	8b 50 04             	mov    0x4(%eax),%edx
 7c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7cb:	39 ce                	cmp    %ecx,%esi
 7cd:	74 1b                	je     7ea <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7d1:	a3 bc 0d 00 00       	mov    %eax,0xdbc
}
 7d6:	5b                   	pop    %ebx
 7d7:	5e                   	pop    %esi
 7d8:	5f                   	pop    %edi
 7d9:	5d                   	pop    %ebp
 7da:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7db:	03 72 04             	add    0x4(%edx),%esi
 7de:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e1:	8b 10                	mov    (%eax),%edx
 7e3:	8b 12                	mov    (%edx),%edx
 7e5:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7e8:	eb db                	jmp    7c5 <free+0x3e>
    p->s.size += bp->s.size;
 7ea:	03 53 fc             	add    -0x4(%ebx),%edx
 7ed:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f0:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7f3:	89 10                	mov    %edx,(%eax)
 7f5:	eb da                	jmp    7d1 <free+0x4a>

000007f7 <morecore>:

static Header*
morecore(uint nu)
{
 7f7:	55                   	push   %ebp
 7f8:	89 e5                	mov    %esp,%ebp
 7fa:	53                   	push   %ebx
 7fb:	83 ec 04             	sub    $0x4,%esp
 7fe:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 800:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 805:	77 05                	ja     80c <morecore+0x15>
    nu = 4096;
 807:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 80c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 813:	83 ec 0c             	sub    $0xc,%esp
 816:	50                   	push   %eax
 817:	e8 38 fd ff ff       	call   554 <sbrk>
  if(p == (char*)-1)
 81c:	83 c4 10             	add    $0x10,%esp
 81f:	83 f8 ff             	cmp    $0xffffffff,%eax
 822:	74 1c                	je     840 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 824:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 827:	83 c0 08             	add    $0x8,%eax
 82a:	83 ec 0c             	sub    $0xc,%esp
 82d:	50                   	push   %eax
 82e:	e8 54 ff ff ff       	call   787 <free>
  return freep;
 833:	a1 bc 0d 00 00       	mov    0xdbc,%eax
 838:	83 c4 10             	add    $0x10,%esp
}
 83b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 83e:	c9                   	leave  
 83f:	c3                   	ret    
    return 0;
 840:	b8 00 00 00 00       	mov    $0x0,%eax
 845:	eb f4                	jmp    83b <morecore+0x44>

00000847 <malloc>:

void*
malloc(uint nbytes)
{
 847:	55                   	push   %ebp
 848:	89 e5                	mov    %esp,%ebp
 84a:	53                   	push   %ebx
 84b:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 84e:	8b 45 08             	mov    0x8(%ebp),%eax
 851:	8d 58 07             	lea    0x7(%eax),%ebx
 854:	c1 eb 03             	shr    $0x3,%ebx
 857:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 85a:	8b 0d bc 0d 00 00    	mov    0xdbc,%ecx
 860:	85 c9                	test   %ecx,%ecx
 862:	74 04                	je     868 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 864:	8b 01                	mov    (%ecx),%eax
 866:	eb 4a                	jmp    8b2 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 868:	c7 05 bc 0d 00 00 c0 	movl   $0xdc0,0xdbc
 86f:	0d 00 00 
 872:	c7 05 c0 0d 00 00 c0 	movl   $0xdc0,0xdc0
 879:	0d 00 00 
    base.s.size = 0;
 87c:	c7 05 c4 0d 00 00 00 	movl   $0x0,0xdc4
 883:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 886:	b9 c0 0d 00 00       	mov    $0xdc0,%ecx
 88b:	eb d7                	jmp    864 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 88d:	74 19                	je     8a8 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 88f:	29 da                	sub    %ebx,%edx
 891:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 894:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 897:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 89a:	89 0d bc 0d 00 00    	mov    %ecx,0xdbc
      return (void*)(p + 1);
 8a0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a6:	c9                   	leave  
 8a7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8a8:	8b 10                	mov    (%eax),%edx
 8aa:	89 11                	mov    %edx,(%ecx)
 8ac:	eb ec                	jmp    89a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ae:	89 c1                	mov    %eax,%ecx
 8b0:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8b2:	8b 50 04             	mov    0x4(%eax),%edx
 8b5:	39 da                	cmp    %ebx,%edx
 8b7:	73 d4                	jae    88d <malloc+0x46>
    if(p == freep)
 8b9:	39 05 bc 0d 00 00    	cmp    %eax,0xdbc
 8bf:	75 ed                	jne    8ae <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8c1:	89 d8                	mov    %ebx,%eax
 8c3:	e8 2f ff ff ff       	call   7f7 <morecore>
 8c8:	85 c0                	test   %eax,%eax
 8ca:	75 e2                	jne    8ae <malloc+0x67>
 8cc:	eb d5                	jmp    8a3 <malloc+0x5c>
