
_test_1:     file format elf32-i386


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
   assert(global == 1);
   6:	a1 68 0c 00 00       	mov    0xc68,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 30                	push   $0x30
  12:	68 10 08 00 00       	push   $0x810
  17:	68 19 08 00 00       	push   $0x819
  1c:	6a 01                	push   $0x1
  1e:	e8 3e 05 00 00       	call   561 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 21 08 00 00       	push   $0x821
  2b:	68 2d 08 00 00       	push   $0x82d
  30:	6a 01                	push   $0x1
  32:	e8 2a 05 00 00       	call   561 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 41 08 00 00       	push   $0x841
  3f:	6a 01                	push   $0x1
  41:	e8 1b 05 00 00       	call   561 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 6c 0c 00 00    	push   0xc6c
  4f:	e8 e8 03 00 00       	call   43c <kill>
  54:	e8 b3 03 00 00       	call   40c <exit>
   global = 5;
  59:	c7 05 68 0c 00 00 05 	movl   $0x5,0xc68
  60:	00 00 00 
   exit();
  63:	e8 a4 03 00 00       	call   40c <exit>

00000068 <main>:
{
  68:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6c:	83 e4 f0             	and    $0xfffffff0,%esp
  6f:	ff 71 fc             	push   -0x4(%ecx)
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	56                   	push   %esi
  76:	53                   	push   %ebx
  77:	51                   	push   %ecx
  78:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  7b:	e8 0c 04 00 00       	call   48c <getpid>
  80:	a3 6c 0c 00 00       	mov    %eax,0xc6c
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 f5 06 00 00       	call   787 <malloc>
   assert(p != NULL);
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	0f 84 a9 00 00 00    	je     146 <main+0xde>
  9d:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  9f:	89 c2                	mov    %eax,%edx
  a1:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  a7:	74 09                	je     b2 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  a9:	b8 00 10 00 00       	mov    $0x1000,%eax
  ae:	29 d0                	sub    %edx,%eax
  b0:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, 0, 0, stack);
  b2:	50                   	push   %eax
  b3:	6a 00                	push   $0x0
  b5:	6a 00                	push   $0x0
  b7:	68 00 00 00 00       	push   $0x0
  bc:	e8 eb 03 00 00       	call   4ac <clone>
  c1:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 8e c1 00 00 00    	jle    18f <main+0x127>
   while(global != 5);
  ce:	a1 68 0c 00 00       	mov    0xc68,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	75 f6                	jne    ce <main+0x66>
   printf(1, "TEST PASSED\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 66 08 00 00       	push   $0x866
  e0:	6a 01                	push   $0x1
  e2:	e8 7a 04 00 00       	call   561 <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 c2 03 00 00       	call   4b4 <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 10 08 00 00       	push   $0x810
 104:	68 19 08 00 00       	push   $0x819
 109:	6a 01                	push   $0x1
 10b:	e8 51 04 00 00       	call   561 <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 73 08 00 00       	push   $0x873
 118:	68 2d 08 00 00       	push   $0x82d
 11d:	6a 01                	push   $0x1
 11f:	e8 3d 04 00 00       	call   561 <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 41 08 00 00       	push   $0x841
 12c:	6a 01                	push   $0x1
 12e:	e8 2e 04 00 00       	call   561 <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 6c 0c 00 00    	push   0xc6c
 13c:	e8 fb 02 00 00       	call   43c <kill>
 141:	e8 c6 02 00 00       	call   40c <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 10 08 00 00       	push   $0x810
 14d:	68 19 08 00 00       	push   $0x819
 152:	6a 01                	push   $0x1
 154:	e8 08 04 00 00       	call   561 <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 4e 08 00 00       	push   $0x84e
 161:	68 2d 08 00 00       	push   $0x82d
 166:	6a 01                	push   $0x1
 168:	e8 f4 03 00 00       	call   561 <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 41 08 00 00       	push   $0x841
 175:	6a 01                	push   $0x1
 177:	e8 e5 03 00 00       	call   561 <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 6c 0c 00 00    	push   0xc6c
 185:	e8 b2 02 00 00       	call   43c <kill>
 18a:	e8 7d 02 00 00       	call   40c <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 10 08 00 00       	push   $0x810
 196:	68 19 08 00 00       	push   $0x819
 19b:	6a 01                	push   $0x1
 19d:	e8 bf 03 00 00       	call   561 <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 58 08 00 00       	push   $0x858
 1aa:	68 2d 08 00 00       	push   $0x82d
 1af:	6a 01                	push   $0x1
 1b1:	e8 ab 03 00 00       	call   561 <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 41 08 00 00       	push   $0x841
 1be:	6a 01                	push   $0x1
 1c0:	e8 9c 03 00 00       	call   561 <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 6c 0c 00 00    	push   0xc6c
 1ce:	e8 69 02 00 00       	call   43c <kill>
 1d3:	e8 34 02 00 00       	call   40c <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 e6 04 00 00       	call   6c7 <free>
   exit();
 1e1:	e8 26 02 00 00       	call   40c <exit>

000001e6 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 1ec:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 1ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1f1:	89 08                	mov    %ecx,(%eax)
  return old;
}
 1f3:	89 d0                	mov    %edx,%eax
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    

000001f7 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 1fd:	68 00 10 00 00       	push   $0x1000
 202:	e8 80 05 00 00       	call   787 <malloc>
  if(n_stack == 0){
 207:	83 c4 10             	add    $0x10,%esp
 20a:	85 c0                	test   %eax,%eax
 20c:	74 14                	je     222 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 20e:	50                   	push   %eax
 20f:	ff 75 10             	push   0x10(%ebp)
 212:	ff 75 0c             	push   0xc(%ebp)
 215:	ff 75 08             	push   0x8(%ebp)
 218:	e8 8f 02 00 00       	call   4ac <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 21d:	83 c4 10             	add    $0x10,%esp
}
 220:	c9                   	leave  
 221:	c3                   	ret    
    return -1;
 222:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 227:	eb f7                	jmp    220 <thread_create+0x29>

00000229 <thread_join>:

int thread_join() {
  return 0;
}
 229:	b8 00 00 00 00       	mov    $0x0,%eax
 22e:	c3                   	ret    

0000022f <lock_acquire>:

void lock_acquire(lock_t *lock){
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	53                   	push   %ebx
 233:	83 ec 04             	sub    $0x4,%esp
 236:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 239:	83 ec 08             	sub    $0x8,%esp
 23c:	6a 01                	push   $0x1
 23e:	53                   	push   %ebx
 23f:	e8 a2 ff ff ff       	call   1e6 <test_and_set>
 244:	83 c4 10             	add    $0x10,%esp
 247:	83 f8 01             	cmp    $0x1,%eax
 24a:	74 ed                	je     239 <lock_acquire+0xa>
    ;
}
 24c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24f:	c9                   	leave  
 250:	c3                   	ret    

00000251 <lock_release>:

void lock_release(lock_t *lock) {
 251:	55                   	push   %ebp
 252:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 25d:	5d                   	pop    %ebp
 25e:	c3                   	ret    

0000025f <lock_init>:

void lock_init(lock_t *lock) {
 25f:	55                   	push   %ebp
 260:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strcpy>:

char*
strcpy(char *s, const char *t)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	56                   	push   %esi
 271:	53                   	push   %ebx
 272:	8b 75 08             	mov    0x8(%ebp),%esi
 275:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 278:	89 f0                	mov    %esi,%eax
 27a:	89 d1                	mov    %edx,%ecx
 27c:	83 c2 01             	add    $0x1,%edx
 27f:	89 c3                	mov    %eax,%ebx
 281:	83 c0 01             	add    $0x1,%eax
 284:	0f b6 09             	movzbl (%ecx),%ecx
 287:	88 0b                	mov    %cl,(%ebx)
 289:	84 c9                	test   %cl,%cl
 28b:	75 ed                	jne    27a <strcpy+0xd>
    ;
  return os;
}
 28d:	89 f0                	mov    %esi,%eax
 28f:	5b                   	pop    %ebx
 290:	5e                   	pop    %esi
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    

00000293 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 293:	55                   	push   %ebp
 294:	89 e5                	mov    %esp,%ebp
 296:	8b 4d 08             	mov    0x8(%ebp),%ecx
 299:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 29c:	eb 06                	jmp    2a4 <strcmp+0x11>
    p++, q++;
 29e:	83 c1 01             	add    $0x1,%ecx
 2a1:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2a4:	0f b6 01             	movzbl (%ecx),%eax
 2a7:	84 c0                	test   %al,%al
 2a9:	74 04                	je     2af <strcmp+0x1c>
 2ab:	3a 02                	cmp    (%edx),%al
 2ad:	74 ef                	je     29e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2af:	0f b6 c0             	movzbl %al,%eax
 2b2:	0f b6 12             	movzbl (%edx),%edx
 2b5:	29 d0                	sub    %edx,%eax
}
 2b7:	5d                   	pop    %ebp
 2b8:	c3                   	ret    

000002b9 <strlen>:

uint
strlen(const char *s)
{
 2b9:	55                   	push   %ebp
 2ba:	89 e5                	mov    %esp,%ebp
 2bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
 2c4:	eb 03                	jmp    2c9 <strlen+0x10>
 2c6:	83 c0 01             	add    $0x1,%eax
 2c9:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2cd:	75 f7                	jne    2c6 <strlen+0xd>
    ;
  return n;
}
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    

000002d1 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d1:	55                   	push   %ebp
 2d2:	89 e5                	mov    %esp,%ebp
 2d4:	57                   	push   %edi
 2d5:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2d8:	89 d7                	mov    %edx,%edi
 2da:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e0:	fc                   	cld    
 2e1:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e3:	89 d0                	mov    %edx,%eax
 2e5:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2e8:	c9                   	leave  
 2e9:	c3                   	ret    

000002ea <strchr>:

char*
strchr(const char *s, char c)
{
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
 2ed:	8b 45 08             	mov    0x8(%ebp),%eax
 2f0:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2f4:	eb 03                	jmp    2f9 <strchr+0xf>
 2f6:	83 c0 01             	add    $0x1,%eax
 2f9:	0f b6 10             	movzbl (%eax),%edx
 2fc:	84 d2                	test   %dl,%dl
 2fe:	74 06                	je     306 <strchr+0x1c>
    if(*s == c)
 300:	38 ca                	cmp    %cl,%dl
 302:	75 f2                	jne    2f6 <strchr+0xc>
 304:	eb 05                	jmp    30b <strchr+0x21>
      return (char*)s;
  return 0;
 306:	b8 00 00 00 00       	mov    $0x0,%eax
}
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    

0000030d <gets>:

char*
gets(char *buf, int max)
{
 30d:	55                   	push   %ebp
 30e:	89 e5                	mov    %esp,%ebp
 310:	57                   	push   %edi
 311:	56                   	push   %esi
 312:	53                   	push   %ebx
 313:	83 ec 1c             	sub    $0x1c,%esp
 316:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 319:	bb 00 00 00 00       	mov    $0x0,%ebx
 31e:	89 de                	mov    %ebx,%esi
 320:	83 c3 01             	add    $0x1,%ebx
 323:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 326:	7d 2e                	jge    356 <gets+0x49>
    cc = read(0, &c, 1);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	6a 01                	push   $0x1
 32d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 330:	50                   	push   %eax
 331:	6a 00                	push   $0x0
 333:	e8 ec 00 00 00       	call   424 <read>
    if(cc < 1)
 338:	83 c4 10             	add    $0x10,%esp
 33b:	85 c0                	test   %eax,%eax
 33d:	7e 17                	jle    356 <gets+0x49>
      break;
    buf[i++] = c;
 33f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 343:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 346:	3c 0a                	cmp    $0xa,%al
 348:	0f 94 c2             	sete   %dl
 34b:	3c 0d                	cmp    $0xd,%al
 34d:	0f 94 c0             	sete   %al
 350:	08 c2                	or     %al,%dl
 352:	74 ca                	je     31e <gets+0x11>
    buf[i++] = c;
 354:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 356:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 35a:	89 f8                	mov    %edi,%eax
 35c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35f:	5b                   	pop    %ebx
 360:	5e                   	pop    %esi
 361:	5f                   	pop    %edi
 362:	5d                   	pop    %ebp
 363:	c3                   	ret    

00000364 <stat>:

int
stat(const char *n, struct stat *st)
{
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	56                   	push   %esi
 368:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 369:	83 ec 08             	sub    $0x8,%esp
 36c:	6a 00                	push   $0x0
 36e:	ff 75 08             	push   0x8(%ebp)
 371:	e8 d6 00 00 00       	call   44c <open>
  if(fd < 0)
 376:	83 c4 10             	add    $0x10,%esp
 379:	85 c0                	test   %eax,%eax
 37b:	78 24                	js     3a1 <stat+0x3d>
 37d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 37f:	83 ec 08             	sub    $0x8,%esp
 382:	ff 75 0c             	push   0xc(%ebp)
 385:	50                   	push   %eax
 386:	e8 d9 00 00 00       	call   464 <fstat>
 38b:	89 c6                	mov    %eax,%esi
  close(fd);
 38d:	89 1c 24             	mov    %ebx,(%esp)
 390:	e8 9f 00 00 00       	call   434 <close>
  return r;
 395:	83 c4 10             	add    $0x10,%esp
}
 398:	89 f0                	mov    %esi,%eax
 39a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 39d:	5b                   	pop    %ebx
 39e:	5e                   	pop    %esi
 39f:	5d                   	pop    %ebp
 3a0:	c3                   	ret    
    return -1;
 3a1:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a6:	eb f0                	jmp    398 <stat+0x34>

000003a8 <atoi>:

int
atoi(const char *s)
{
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
 3ab:	53                   	push   %ebx
 3ac:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3af:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3b4:	eb 10                	jmp    3c6 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3b6:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3b9:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3bc:	83 c1 01             	add    $0x1,%ecx
 3bf:	0f be c0             	movsbl %al,%eax
 3c2:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3c6:	0f b6 01             	movzbl (%ecx),%eax
 3c9:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3cc:	80 fb 09             	cmp    $0x9,%bl
 3cf:	76 e5                	jbe    3b6 <atoi+0xe>
  return n;
}
 3d1:	89 d0                	mov    %edx,%eax
 3d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d6:	c9                   	leave  
 3d7:	c3                   	ret    

000003d8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d8:	55                   	push   %ebp
 3d9:	89 e5                	mov    %esp,%ebp
 3db:	56                   	push   %esi
 3dc:	53                   	push   %ebx
 3dd:	8b 75 08             	mov    0x8(%ebp),%esi
 3e0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3e3:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3e6:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3e8:	eb 0d                	jmp    3f7 <memmove+0x1f>
    *dst++ = *src++;
 3ea:	0f b6 01             	movzbl (%ecx),%eax
 3ed:	88 02                	mov    %al,(%edx)
 3ef:	8d 49 01             	lea    0x1(%ecx),%ecx
 3f2:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3f5:	89 d8                	mov    %ebx,%eax
 3f7:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3fa:	85 c0                	test   %eax,%eax
 3fc:	7f ec                	jg     3ea <memmove+0x12>
  return vdst;
}
 3fe:	89 f0                	mov    %esi,%eax
 400:	5b                   	pop    %ebx
 401:	5e                   	pop    %esi
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    

00000404 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 404:	b8 01 00 00 00       	mov    $0x1,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <exit>:
SYSCALL(exit)
 40c:	b8 02 00 00 00       	mov    $0x2,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <wait>:
SYSCALL(wait)
 414:	b8 03 00 00 00       	mov    $0x3,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <pipe>:
SYSCALL(pipe)
 41c:	b8 04 00 00 00       	mov    $0x4,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <read>:
SYSCALL(read)
 424:	b8 05 00 00 00       	mov    $0x5,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <write>:
SYSCALL(write)
 42c:	b8 10 00 00 00       	mov    $0x10,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <close>:
SYSCALL(close)
 434:	b8 15 00 00 00       	mov    $0x15,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <kill>:
SYSCALL(kill)
 43c:	b8 06 00 00 00       	mov    $0x6,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <exec>:
SYSCALL(exec)
 444:	b8 07 00 00 00       	mov    $0x7,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <open>:
SYSCALL(open)
 44c:	b8 0f 00 00 00       	mov    $0xf,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <mknod>:
SYSCALL(mknod)
 454:	b8 11 00 00 00       	mov    $0x11,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <unlink>:
SYSCALL(unlink)
 45c:	b8 12 00 00 00       	mov    $0x12,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <fstat>:
SYSCALL(fstat)
 464:	b8 08 00 00 00       	mov    $0x8,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <link>:
SYSCALL(link)
 46c:	b8 13 00 00 00       	mov    $0x13,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <mkdir>:
SYSCALL(mkdir)
 474:	b8 14 00 00 00       	mov    $0x14,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <chdir>:
SYSCALL(chdir)
 47c:	b8 09 00 00 00       	mov    $0x9,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <dup>:
SYSCALL(dup)
 484:	b8 0a 00 00 00       	mov    $0xa,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <getpid>:
SYSCALL(getpid)
 48c:	b8 0b 00 00 00       	mov    $0xb,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <sbrk>:
SYSCALL(sbrk)
 494:	b8 0c 00 00 00       	mov    $0xc,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <sleep>:
SYSCALL(sleep)
 49c:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <uptime>:
SYSCALL(uptime)
 4a4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <clone>:
SYSCALL(clone)
 4ac:	b8 16 00 00 00       	mov    $0x16,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <join>:
 4b4:	b8 17 00 00 00       	mov    $0x17,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4bc:	55                   	push   %ebp
 4bd:	89 e5                	mov    %esp,%ebp
 4bf:	83 ec 1c             	sub    $0x1c,%esp
 4c2:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4c5:	6a 01                	push   $0x1
 4c7:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4ca:	52                   	push   %edx
 4cb:	50                   	push   %eax
 4cc:	e8 5b ff ff ff       	call   42c <write>
}
 4d1:	83 c4 10             	add    $0x10,%esp
 4d4:	c9                   	leave  
 4d5:	c3                   	ret    

000004d6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
 4d9:	57                   	push   %edi
 4da:	56                   	push   %esi
 4db:	53                   	push   %ebx
 4dc:	83 ec 2c             	sub    $0x2c,%esp
 4df:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e2:	89 d0                	mov    %edx,%eax
 4e4:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4e6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4ea:	0f 95 c1             	setne  %cl
 4ed:	c1 ea 1f             	shr    $0x1f,%edx
 4f0:	84 d1                	test   %dl,%cl
 4f2:	74 44                	je     538 <printint+0x62>
    neg = 1;
    x = -xx;
 4f4:	f7 d8                	neg    %eax
 4f6:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4f8:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4ff:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 504:	89 c8                	mov    %ecx,%eax
 506:	ba 00 00 00 00       	mov    $0x0,%edx
 50b:	f7 f6                	div    %esi
 50d:	89 df                	mov    %ebx,%edi
 50f:	83 c3 01             	add    $0x1,%ebx
 512:	0f b6 92 e8 08 00 00 	movzbl 0x8e8(%edx),%edx
 519:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 51d:	89 ca                	mov    %ecx,%edx
 51f:	89 c1                	mov    %eax,%ecx
 521:	39 d6                	cmp    %edx,%esi
 523:	76 df                	jbe    504 <printint+0x2e>
  if(neg)
 525:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 529:	74 31                	je     55c <printint+0x86>
    buf[i++] = '-';
 52b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 530:	8d 5f 02             	lea    0x2(%edi),%ebx
 533:	8b 75 d0             	mov    -0x30(%ebp),%esi
 536:	eb 17                	jmp    54f <printint+0x79>
    x = xx;
 538:	89 c1                	mov    %eax,%ecx
  neg = 0;
 53a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 541:	eb bc                	jmp    4ff <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 543:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 548:	89 f0                	mov    %esi,%eax
 54a:	e8 6d ff ff ff       	call   4bc <putc>
  while(--i >= 0)
 54f:	83 eb 01             	sub    $0x1,%ebx
 552:	79 ef                	jns    543 <printint+0x6d>
}
 554:	83 c4 2c             	add    $0x2c,%esp
 557:	5b                   	pop    %ebx
 558:	5e                   	pop    %esi
 559:	5f                   	pop    %edi
 55a:	5d                   	pop    %ebp
 55b:	c3                   	ret    
 55c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 55f:	eb ee                	jmp    54f <printint+0x79>

00000561 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 561:	55                   	push   %ebp
 562:	89 e5                	mov    %esp,%ebp
 564:	57                   	push   %edi
 565:	56                   	push   %esi
 566:	53                   	push   %ebx
 567:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 56a:	8d 45 10             	lea    0x10(%ebp),%eax
 56d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 570:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 575:	bb 00 00 00 00       	mov    $0x0,%ebx
 57a:	eb 14                	jmp    590 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 57c:	89 fa                	mov    %edi,%edx
 57e:	8b 45 08             	mov    0x8(%ebp),%eax
 581:	e8 36 ff ff ff       	call   4bc <putc>
 586:	eb 05                	jmp    58d <printf+0x2c>
      }
    } else if(state == '%'){
 588:	83 fe 25             	cmp    $0x25,%esi
 58b:	74 25                	je     5b2 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 58d:	83 c3 01             	add    $0x1,%ebx
 590:	8b 45 0c             	mov    0xc(%ebp),%eax
 593:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 597:	84 c0                	test   %al,%al
 599:	0f 84 20 01 00 00    	je     6bf <printf+0x15e>
    c = fmt[i] & 0xff;
 59f:	0f be f8             	movsbl %al,%edi
 5a2:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5a5:	85 f6                	test   %esi,%esi
 5a7:	75 df                	jne    588 <printf+0x27>
      if(c == '%'){
 5a9:	83 f8 25             	cmp    $0x25,%eax
 5ac:	75 ce                	jne    57c <printf+0x1b>
        state = '%';
 5ae:	89 c6                	mov    %eax,%esi
 5b0:	eb db                	jmp    58d <printf+0x2c>
      if(c == 'd'){
 5b2:	83 f8 25             	cmp    $0x25,%eax
 5b5:	0f 84 cf 00 00 00    	je     68a <printf+0x129>
 5bb:	0f 8c dd 00 00 00    	jl     69e <printf+0x13d>
 5c1:	83 f8 78             	cmp    $0x78,%eax
 5c4:	0f 8f d4 00 00 00    	jg     69e <printf+0x13d>
 5ca:	83 f8 63             	cmp    $0x63,%eax
 5cd:	0f 8c cb 00 00 00    	jl     69e <printf+0x13d>
 5d3:	83 e8 63             	sub    $0x63,%eax
 5d6:	83 f8 15             	cmp    $0x15,%eax
 5d9:	0f 87 bf 00 00 00    	ja     69e <printf+0x13d>
 5df:	ff 24 85 90 08 00 00 	jmp    *0x890(,%eax,4)
        printint(fd, *ap, 10, 1);
 5e6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5e9:	8b 17                	mov    (%edi),%edx
 5eb:	83 ec 0c             	sub    $0xc,%esp
 5ee:	6a 01                	push   $0x1
 5f0:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f5:	8b 45 08             	mov    0x8(%ebp),%eax
 5f8:	e8 d9 fe ff ff       	call   4d6 <printint>
        ap++;
 5fd:	83 c7 04             	add    $0x4,%edi
 600:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 603:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 606:	be 00 00 00 00       	mov    $0x0,%esi
 60b:	eb 80                	jmp    58d <printf+0x2c>
        printint(fd, *ap, 16, 0);
 60d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 610:	8b 17                	mov    (%edi),%edx
 612:	83 ec 0c             	sub    $0xc,%esp
 615:	6a 00                	push   $0x0
 617:	b9 10 00 00 00       	mov    $0x10,%ecx
 61c:	8b 45 08             	mov    0x8(%ebp),%eax
 61f:	e8 b2 fe ff ff       	call   4d6 <printint>
        ap++;
 624:	83 c7 04             	add    $0x4,%edi
 627:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 62a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62d:	be 00 00 00 00       	mov    $0x0,%esi
 632:	e9 56 ff ff ff       	jmp    58d <printf+0x2c>
        s = (char*)*ap;
 637:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63a:	8b 30                	mov    (%eax),%esi
        ap++;
 63c:	83 c0 04             	add    $0x4,%eax
 63f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 642:	85 f6                	test   %esi,%esi
 644:	75 15                	jne    65b <printf+0xfa>
          s = "(null)";
 646:	be 89 08 00 00       	mov    $0x889,%esi
 64b:	eb 0e                	jmp    65b <printf+0xfa>
          putc(fd, *s);
 64d:	0f be d2             	movsbl %dl,%edx
 650:	8b 45 08             	mov    0x8(%ebp),%eax
 653:	e8 64 fe ff ff       	call   4bc <putc>
          s++;
 658:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 65b:	0f b6 16             	movzbl (%esi),%edx
 65e:	84 d2                	test   %dl,%dl
 660:	75 eb                	jne    64d <printf+0xec>
      state = 0;
 662:	be 00 00 00 00       	mov    $0x0,%esi
 667:	e9 21 ff ff ff       	jmp    58d <printf+0x2c>
        putc(fd, *ap);
 66c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 66f:	0f be 17             	movsbl (%edi),%edx
 672:	8b 45 08             	mov    0x8(%ebp),%eax
 675:	e8 42 fe ff ff       	call   4bc <putc>
        ap++;
 67a:	83 c7 04             	add    $0x4,%edi
 67d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 680:	be 00 00 00 00       	mov    $0x0,%esi
 685:	e9 03 ff ff ff       	jmp    58d <printf+0x2c>
        putc(fd, c);
 68a:	89 fa                	mov    %edi,%edx
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	e8 28 fe ff ff       	call   4bc <putc>
      state = 0;
 694:	be 00 00 00 00       	mov    $0x0,%esi
 699:	e9 ef fe ff ff       	jmp    58d <printf+0x2c>
        putc(fd, '%');
 69e:	ba 25 00 00 00       	mov    $0x25,%edx
 6a3:	8b 45 08             	mov    0x8(%ebp),%eax
 6a6:	e8 11 fe ff ff       	call   4bc <putc>
        putc(fd, c);
 6ab:	89 fa                	mov    %edi,%edx
 6ad:	8b 45 08             	mov    0x8(%ebp),%eax
 6b0:	e8 07 fe ff ff       	call   4bc <putc>
      state = 0;
 6b5:	be 00 00 00 00       	mov    $0x0,%esi
 6ba:	e9 ce fe ff ff       	jmp    58d <printf+0x2c>
    }
  }
}
 6bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c2:	5b                   	pop    %ebx
 6c3:	5e                   	pop    %esi
 6c4:	5f                   	pop    %edi
 6c5:	5d                   	pop    %ebp
 6c6:	c3                   	ret    

000006c7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c7:	55                   	push   %ebp
 6c8:	89 e5                	mov    %esp,%ebp
 6ca:	57                   	push   %edi
 6cb:	56                   	push   %esi
 6cc:	53                   	push   %ebx
 6cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d3:	a1 70 0c 00 00       	mov    0xc70,%eax
 6d8:	eb 02                	jmp    6dc <free+0x15>
 6da:	89 d0                	mov    %edx,%eax
 6dc:	39 c8                	cmp    %ecx,%eax
 6de:	73 04                	jae    6e4 <free+0x1d>
 6e0:	39 08                	cmp    %ecx,(%eax)
 6e2:	77 12                	ja     6f6 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e4:	8b 10                	mov    (%eax),%edx
 6e6:	39 c2                	cmp    %eax,%edx
 6e8:	77 f0                	ja     6da <free+0x13>
 6ea:	39 c8                	cmp    %ecx,%eax
 6ec:	72 08                	jb     6f6 <free+0x2f>
 6ee:	39 ca                	cmp    %ecx,%edx
 6f0:	77 04                	ja     6f6 <free+0x2f>
 6f2:	89 d0                	mov    %edx,%eax
 6f4:	eb e6                	jmp    6dc <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6fc:	8b 10                	mov    (%eax),%edx
 6fe:	39 d7                	cmp    %edx,%edi
 700:	74 19                	je     71b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 702:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 705:	8b 50 04             	mov    0x4(%eax),%edx
 708:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 70b:	39 ce                	cmp    %ecx,%esi
 70d:	74 1b                	je     72a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 70f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 711:	a3 70 0c 00 00       	mov    %eax,0xc70
}
 716:	5b                   	pop    %ebx
 717:	5e                   	pop    %esi
 718:	5f                   	pop    %edi
 719:	5d                   	pop    %ebp
 71a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 71b:	03 72 04             	add    0x4(%edx),%esi
 71e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 721:	8b 10                	mov    (%eax),%edx
 723:	8b 12                	mov    (%edx),%edx
 725:	89 53 f8             	mov    %edx,-0x8(%ebx)
 728:	eb db                	jmp    705 <free+0x3e>
    p->s.size += bp->s.size;
 72a:	03 53 fc             	add    -0x4(%ebx),%edx
 72d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 730:	8b 53 f8             	mov    -0x8(%ebx),%edx
 733:	89 10                	mov    %edx,(%eax)
 735:	eb da                	jmp    711 <free+0x4a>

00000737 <morecore>:

static Header*
morecore(uint nu)
{
 737:	55                   	push   %ebp
 738:	89 e5                	mov    %esp,%ebp
 73a:	53                   	push   %ebx
 73b:	83 ec 04             	sub    $0x4,%esp
 73e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 740:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 745:	77 05                	ja     74c <morecore+0x15>
    nu = 4096;
 747:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 74c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 753:	83 ec 0c             	sub    $0xc,%esp
 756:	50                   	push   %eax
 757:	e8 38 fd ff ff       	call   494 <sbrk>
  if(p == (char*)-1)
 75c:	83 c4 10             	add    $0x10,%esp
 75f:	83 f8 ff             	cmp    $0xffffffff,%eax
 762:	74 1c                	je     780 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 764:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 767:	83 c0 08             	add    $0x8,%eax
 76a:	83 ec 0c             	sub    $0xc,%esp
 76d:	50                   	push   %eax
 76e:	e8 54 ff ff ff       	call   6c7 <free>
  return freep;
 773:	a1 70 0c 00 00       	mov    0xc70,%eax
 778:	83 c4 10             	add    $0x10,%esp
}
 77b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 77e:	c9                   	leave  
 77f:	c3                   	ret    
    return 0;
 780:	b8 00 00 00 00       	mov    $0x0,%eax
 785:	eb f4                	jmp    77b <morecore+0x44>

00000787 <malloc>:

void*
malloc(uint nbytes)
{
 787:	55                   	push   %ebp
 788:	89 e5                	mov    %esp,%ebp
 78a:	53                   	push   %ebx
 78b:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 78e:	8b 45 08             	mov    0x8(%ebp),%eax
 791:	8d 58 07             	lea    0x7(%eax),%ebx
 794:	c1 eb 03             	shr    $0x3,%ebx
 797:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 79a:	8b 0d 70 0c 00 00    	mov    0xc70,%ecx
 7a0:	85 c9                	test   %ecx,%ecx
 7a2:	74 04                	je     7a8 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a4:	8b 01                	mov    (%ecx),%eax
 7a6:	eb 4a                	jmp    7f2 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7a8:	c7 05 70 0c 00 00 74 	movl   $0xc74,0xc70
 7af:	0c 00 00 
 7b2:	c7 05 74 0c 00 00 74 	movl   $0xc74,0xc74
 7b9:	0c 00 00 
    base.s.size = 0;
 7bc:	c7 05 78 0c 00 00 00 	movl   $0x0,0xc78
 7c3:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7c6:	b9 74 0c 00 00       	mov    $0xc74,%ecx
 7cb:	eb d7                	jmp    7a4 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7cd:	74 19                	je     7e8 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7cf:	29 da                	sub    %ebx,%edx
 7d1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7d7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7da:	89 0d 70 0c 00 00    	mov    %ecx,0xc70
      return (void*)(p + 1);
 7e0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7e6:	c9                   	leave  
 7e7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7e8:	8b 10                	mov    (%eax),%edx
 7ea:	89 11                	mov    %edx,(%ecx)
 7ec:	eb ec                	jmp    7da <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ee:	89 c1                	mov    %eax,%ecx
 7f0:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7f2:	8b 50 04             	mov    0x4(%eax),%edx
 7f5:	39 da                	cmp    %ebx,%edx
 7f7:	73 d4                	jae    7cd <malloc+0x46>
    if(p == freep)
 7f9:	39 05 70 0c 00 00    	cmp    %eax,0xc70
 7ff:	75 ed                	jne    7ee <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 801:	89 d8                	mov    %ebx,%eax
 803:	e8 2f ff ff ff       	call   737 <morecore>
 808:	85 c0                	test   %eax,%eax
 80a:	75 e2                	jne    7ee <malloc+0x67>
 80c:	eb d5                	jmp    7e3 <malloc+0x5c>
