
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
   6:	a1 80 0c 00 00       	mov    0xc80,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 30                	push   $0x30
  12:	68 1c 08 00 00       	push   $0x81c
  17:	68 25 08 00 00       	push   $0x825
  1c:	6a 01                	push   $0x1
  1e:	e8 49 05 00 00       	call   56c <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 2d 08 00 00       	push   $0x82d
  2b:	68 39 08 00 00       	push   $0x839
  30:	6a 01                	push   $0x1
  32:	e8 35 05 00 00       	call   56c <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 4d 08 00 00       	push   $0x84d
  3f:	6a 01                	push   $0x1
  41:	e8 26 05 00 00       	call   56c <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 84 0c 00 00    	push   0xc84
  4f:	e8 f3 03 00 00       	call   447 <kill>
  54:	e8 be 03 00 00       	call   417 <exit>
   global = 5;
  59:	c7 05 80 0c 00 00 05 	movl   $0x5,0xc80
  60:	00 00 00 
   exit();
  63:	e8 af 03 00 00       	call   417 <exit>

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
  7b:	e8 17 04 00 00       	call   497 <getpid>
  80:	a3 84 0c 00 00       	mov    %eax,0xc84
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 00 07 00 00       	call   792 <malloc>
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
  bc:	e8 f6 03 00 00       	call   4b7 <clone>
  c1:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 8e c1 00 00 00    	jle    18f <main+0x127>
   while(global != 5);
  ce:	a1 80 0c 00 00       	mov    0xc80,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	75 f6                	jne    ce <main+0x66>
   printf(1, "TEST PASSED\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 72 08 00 00       	push   $0x872
  e0:	6a 01                	push   $0x1
  e2:	e8 85 04 00 00       	call   56c <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 cd 03 00 00       	call   4bf <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 1c 08 00 00       	push   $0x81c
 104:	68 25 08 00 00       	push   $0x825
 109:	6a 01                	push   $0x1
 10b:	e8 5c 04 00 00       	call   56c <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 7f 08 00 00       	push   $0x87f
 118:	68 39 08 00 00       	push   $0x839
 11d:	6a 01                	push   $0x1
 11f:	e8 48 04 00 00       	call   56c <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 4d 08 00 00       	push   $0x84d
 12c:	6a 01                	push   $0x1
 12e:	e8 39 04 00 00       	call   56c <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 84 0c 00 00    	push   0xc84
 13c:	e8 06 03 00 00       	call   447 <kill>
 141:	e8 d1 02 00 00       	call   417 <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 1c 08 00 00       	push   $0x81c
 14d:	68 25 08 00 00       	push   $0x825
 152:	6a 01                	push   $0x1
 154:	e8 13 04 00 00       	call   56c <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 5a 08 00 00       	push   $0x85a
 161:	68 39 08 00 00       	push   $0x839
 166:	6a 01                	push   $0x1
 168:	e8 ff 03 00 00       	call   56c <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 4d 08 00 00       	push   $0x84d
 175:	6a 01                	push   $0x1
 177:	e8 f0 03 00 00       	call   56c <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 84 0c 00 00    	push   0xc84
 185:	e8 bd 02 00 00       	call   447 <kill>
 18a:	e8 88 02 00 00       	call   417 <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 1c 08 00 00       	push   $0x81c
 196:	68 25 08 00 00       	push   $0x825
 19b:	6a 01                	push   $0x1
 19d:	e8 ca 03 00 00       	call   56c <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 64 08 00 00       	push   $0x864
 1aa:	68 39 08 00 00       	push   $0x839
 1af:	6a 01                	push   $0x1
 1b1:	e8 b6 03 00 00       	call   56c <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 4d 08 00 00       	push   $0x84d
 1be:	6a 01                	push   $0x1
 1c0:	e8 a7 03 00 00       	call   56c <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 84 0c 00 00    	push   0xc84
 1ce:	e8 74 02 00 00       	call   447 <kill>
 1d3:	e8 3f 02 00 00       	call   417 <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 f1 04 00 00       	call   6d2 <free>
   exit();
 1e1:	e8 31 02 00 00       	call   417 <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 1fd:	68 00 20 00 00       	push   $0x2000
 202:	e8 8b 05 00 00       	call   792 <malloc>
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
 218:	e8 9a 02 00 00       	call   4b7 <clone>


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
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
 22c:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 22f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 232:	50                   	push   %eax
 233:	e8 87 02 00 00       	call   4bf <join>
  
  return pid;
}
 238:	c9                   	leave  
 239:	c3                   	ret    

0000023a <lock_acquire>:

void lock_acquire(lock_t *lock){
 23a:	55                   	push   %ebp
 23b:	89 e5                	mov    %esp,%ebp
 23d:	53                   	push   %ebx
 23e:	83 ec 04             	sub    $0x4,%esp
 241:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 244:	83 ec 08             	sub    $0x8,%esp
 247:	6a 01                	push   $0x1
 249:	53                   	push   %ebx
 24a:	e8 97 ff ff ff       	call   1e6 <test_and_set>
 24f:	83 c4 10             	add    $0x10,%esp
 252:	83 f8 01             	cmp    $0x1,%eax
 255:	74 ed                	je     244 <lock_acquire+0xa>
    ;
}
 257:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 25a:	c9                   	leave  
 25b:	c3                   	ret    

0000025c <lock_release>:

void lock_release(lock_t *lock) {
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    

0000026a <lock_init>:

void lock_init(lock_t *lock) {
 26a:	55                   	push   %ebp
 26b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    

00000278 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 278:	55                   	push   %ebp
 279:	89 e5                	mov    %esp,%ebp
 27b:	56                   	push   %esi
 27c:	53                   	push   %ebx
 27d:	8b 75 08             	mov    0x8(%ebp),%esi
 280:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 283:	89 f0                	mov    %esi,%eax
 285:	89 d1                	mov    %edx,%ecx
 287:	83 c2 01             	add    $0x1,%edx
 28a:	89 c3                	mov    %eax,%ebx
 28c:	83 c0 01             	add    $0x1,%eax
 28f:	0f b6 09             	movzbl (%ecx),%ecx
 292:	88 0b                	mov    %cl,(%ebx)
 294:	84 c9                	test   %cl,%cl
 296:	75 ed                	jne    285 <strcpy+0xd>
    ;
  return os;
}
 298:	89 f0                	mov    %esi,%eax
 29a:	5b                   	pop    %ebx
 29b:	5e                   	pop    %esi
 29c:	5d                   	pop    %ebp
 29d:	c3                   	ret    

0000029e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 29e:	55                   	push   %ebp
 29f:	89 e5                	mov    %esp,%ebp
 2a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2a4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2a7:	eb 06                	jmp    2af <strcmp+0x11>
    p++, q++;
 2a9:	83 c1 01             	add    $0x1,%ecx
 2ac:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2af:	0f b6 01             	movzbl (%ecx),%eax
 2b2:	84 c0                	test   %al,%al
 2b4:	74 04                	je     2ba <strcmp+0x1c>
 2b6:	3a 02                	cmp    (%edx),%al
 2b8:	74 ef                	je     2a9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2ba:	0f b6 c0             	movzbl %al,%eax
 2bd:	0f b6 12             	movzbl (%edx),%edx
 2c0:	29 d0                	sub    %edx,%eax
}
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    

000002c4 <strlen>:

uint
strlen(const char *s)
{
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ca:	b8 00 00 00 00       	mov    $0x0,%eax
 2cf:	eb 03                	jmp    2d4 <strlen+0x10>
 2d1:	83 c0 01             	add    $0x1,%eax
 2d4:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2d8:	75 f7                	jne    2d1 <strlen+0xd>
    ;
  return n;
}
 2da:	5d                   	pop    %ebp
 2db:	c3                   	ret    

000002dc <memset>:

void*
memset(void *dst, int c, uint n)
{
 2dc:	55                   	push   %ebp
 2dd:	89 e5                	mov    %esp,%ebp
 2df:	57                   	push   %edi
 2e0:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2e3:	89 d7                	mov    %edx,%edi
 2e5:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2eb:	fc                   	cld    
 2ec:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2ee:	89 d0                	mov    %edx,%eax
 2f0:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2f3:	c9                   	leave  
 2f4:	c3                   	ret    

000002f5 <strchr>:

char*
strchr(const char *s, char c)
{
 2f5:	55                   	push   %ebp
 2f6:	89 e5                	mov    %esp,%ebp
 2f8:	8b 45 08             	mov    0x8(%ebp),%eax
 2fb:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ff:	eb 03                	jmp    304 <strchr+0xf>
 301:	83 c0 01             	add    $0x1,%eax
 304:	0f b6 10             	movzbl (%eax),%edx
 307:	84 d2                	test   %dl,%dl
 309:	74 06                	je     311 <strchr+0x1c>
    if(*s == c)
 30b:	38 ca                	cmp    %cl,%dl
 30d:	75 f2                	jne    301 <strchr+0xc>
 30f:	eb 05                	jmp    316 <strchr+0x21>
      return (char*)s;
  return 0;
 311:	b8 00 00 00 00       	mov    $0x0,%eax
}
 316:	5d                   	pop    %ebp
 317:	c3                   	ret    

00000318 <gets>:

char*
gets(char *buf, int max)
{
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	57                   	push   %edi
 31c:	56                   	push   %esi
 31d:	53                   	push   %ebx
 31e:	83 ec 1c             	sub    $0x1c,%esp
 321:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 324:	bb 00 00 00 00       	mov    $0x0,%ebx
 329:	89 de                	mov    %ebx,%esi
 32b:	83 c3 01             	add    $0x1,%ebx
 32e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 331:	7d 2e                	jge    361 <gets+0x49>
    cc = read(0, &c, 1);
 333:	83 ec 04             	sub    $0x4,%esp
 336:	6a 01                	push   $0x1
 338:	8d 45 e7             	lea    -0x19(%ebp),%eax
 33b:	50                   	push   %eax
 33c:	6a 00                	push   $0x0
 33e:	e8 ec 00 00 00       	call   42f <read>
    if(cc < 1)
 343:	83 c4 10             	add    $0x10,%esp
 346:	85 c0                	test   %eax,%eax
 348:	7e 17                	jle    361 <gets+0x49>
      break;
    buf[i++] = c;
 34a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 34e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 351:	3c 0a                	cmp    $0xa,%al
 353:	0f 94 c2             	sete   %dl
 356:	3c 0d                	cmp    $0xd,%al
 358:	0f 94 c0             	sete   %al
 35b:	08 c2                	or     %al,%dl
 35d:	74 ca                	je     329 <gets+0x11>
    buf[i++] = c;
 35f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 361:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 365:	89 f8                	mov    %edi,%eax
 367:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36a:	5b                   	pop    %ebx
 36b:	5e                   	pop    %esi
 36c:	5f                   	pop    %edi
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    

0000036f <stat>:

int
stat(const char *n, struct stat *st)
{
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	56                   	push   %esi
 373:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 374:	83 ec 08             	sub    $0x8,%esp
 377:	6a 00                	push   $0x0
 379:	ff 75 08             	push   0x8(%ebp)
 37c:	e8 d6 00 00 00       	call   457 <open>
  if(fd < 0)
 381:	83 c4 10             	add    $0x10,%esp
 384:	85 c0                	test   %eax,%eax
 386:	78 24                	js     3ac <stat+0x3d>
 388:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 38a:	83 ec 08             	sub    $0x8,%esp
 38d:	ff 75 0c             	push   0xc(%ebp)
 390:	50                   	push   %eax
 391:	e8 d9 00 00 00       	call   46f <fstat>
 396:	89 c6                	mov    %eax,%esi
  close(fd);
 398:	89 1c 24             	mov    %ebx,(%esp)
 39b:	e8 9f 00 00 00       	call   43f <close>
  return r;
 3a0:	83 c4 10             	add    $0x10,%esp
}
 3a3:	89 f0                	mov    %esi,%eax
 3a5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a8:	5b                   	pop    %ebx
 3a9:	5e                   	pop    %esi
 3aa:	5d                   	pop    %ebp
 3ab:	c3                   	ret    
    return -1;
 3ac:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3b1:	eb f0                	jmp    3a3 <stat+0x34>

000003b3 <atoi>:

int
atoi(const char *s)
{
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	53                   	push   %ebx
 3b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3ba:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3bf:	eb 10                	jmp    3d1 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3c1:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3c4:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3c7:	83 c1 01             	add    $0x1,%ecx
 3ca:	0f be c0             	movsbl %al,%eax
 3cd:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3d1:	0f b6 01             	movzbl (%ecx),%eax
 3d4:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3d7:	80 fb 09             	cmp    $0x9,%bl
 3da:	76 e5                	jbe    3c1 <atoi+0xe>
  return n;
}
 3dc:	89 d0                	mov    %edx,%eax
 3de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e1:	c9                   	leave  
 3e2:	c3                   	ret    

000003e3 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e3:	55                   	push   %ebp
 3e4:	89 e5                	mov    %esp,%ebp
 3e6:	56                   	push   %esi
 3e7:	53                   	push   %ebx
 3e8:	8b 75 08             	mov    0x8(%ebp),%esi
 3eb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3ee:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3f1:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3f3:	eb 0d                	jmp    402 <memmove+0x1f>
    *dst++ = *src++;
 3f5:	0f b6 01             	movzbl (%ecx),%eax
 3f8:	88 02                	mov    %al,(%edx)
 3fa:	8d 49 01             	lea    0x1(%ecx),%ecx
 3fd:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 400:	89 d8                	mov    %ebx,%eax
 402:	8d 58 ff             	lea    -0x1(%eax),%ebx
 405:	85 c0                	test   %eax,%eax
 407:	7f ec                	jg     3f5 <memmove+0x12>
  return vdst;
}
 409:	89 f0                	mov    %esi,%eax
 40b:	5b                   	pop    %ebx
 40c:	5e                   	pop    %esi
 40d:	5d                   	pop    %ebp
 40e:	c3                   	ret    

0000040f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40f:	b8 01 00 00 00       	mov    $0x1,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <exit>:
SYSCALL(exit)
 417:	b8 02 00 00 00       	mov    $0x2,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <wait>:
SYSCALL(wait)
 41f:	b8 03 00 00 00       	mov    $0x3,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <pipe>:
SYSCALL(pipe)
 427:	b8 04 00 00 00       	mov    $0x4,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <read>:
SYSCALL(read)
 42f:	b8 05 00 00 00       	mov    $0x5,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <write>:
SYSCALL(write)
 437:	b8 10 00 00 00       	mov    $0x10,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <close>:
SYSCALL(close)
 43f:	b8 15 00 00 00       	mov    $0x15,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <kill>:
SYSCALL(kill)
 447:	b8 06 00 00 00       	mov    $0x6,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <exec>:
SYSCALL(exec)
 44f:	b8 07 00 00 00       	mov    $0x7,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <open>:
SYSCALL(open)
 457:	b8 0f 00 00 00       	mov    $0xf,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <mknod>:
SYSCALL(mknod)
 45f:	b8 11 00 00 00       	mov    $0x11,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <unlink>:
SYSCALL(unlink)
 467:	b8 12 00 00 00       	mov    $0x12,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <fstat>:
SYSCALL(fstat)
 46f:	b8 08 00 00 00       	mov    $0x8,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <link>:
SYSCALL(link)
 477:	b8 13 00 00 00       	mov    $0x13,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <mkdir>:
SYSCALL(mkdir)
 47f:	b8 14 00 00 00       	mov    $0x14,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <chdir>:
SYSCALL(chdir)
 487:	b8 09 00 00 00       	mov    $0x9,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <dup>:
SYSCALL(dup)
 48f:	b8 0a 00 00 00       	mov    $0xa,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <getpid>:
SYSCALL(getpid)
 497:	b8 0b 00 00 00       	mov    $0xb,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <sbrk>:
SYSCALL(sbrk)
 49f:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <sleep>:
SYSCALL(sleep)
 4a7:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <uptime>:
SYSCALL(uptime)
 4af:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <clone>:
SYSCALL(clone)
 4b7:	b8 16 00 00 00       	mov    $0x16,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <join>:
 4bf:	b8 17 00 00 00       	mov    $0x17,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4c7:	55                   	push   %ebp
 4c8:	89 e5                	mov    %esp,%ebp
 4ca:	83 ec 1c             	sub    $0x1c,%esp
 4cd:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4d0:	6a 01                	push   $0x1
 4d2:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4d5:	52                   	push   %edx
 4d6:	50                   	push   %eax
 4d7:	e8 5b ff ff ff       	call   437 <write>
}
 4dc:	83 c4 10             	add    $0x10,%esp
 4df:	c9                   	leave  
 4e0:	c3                   	ret    

000004e1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4e1:	55                   	push   %ebp
 4e2:	89 e5                	mov    %esp,%ebp
 4e4:	57                   	push   %edi
 4e5:	56                   	push   %esi
 4e6:	53                   	push   %ebx
 4e7:	83 ec 2c             	sub    $0x2c,%esp
 4ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4ed:	89 d0                	mov    %edx,%eax
 4ef:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4f1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4f5:	0f 95 c1             	setne  %cl
 4f8:	c1 ea 1f             	shr    $0x1f,%edx
 4fb:	84 d1                	test   %dl,%cl
 4fd:	74 44                	je     543 <printint+0x62>
    neg = 1;
    x = -xx;
 4ff:	f7 d8                	neg    %eax
 501:	89 c1                	mov    %eax,%ecx
    neg = 1;
 503:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 50a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 50f:	89 c8                	mov    %ecx,%eax
 511:	ba 00 00 00 00       	mov    $0x0,%edx
 516:	f7 f6                	div    %esi
 518:	89 df                	mov    %ebx,%edi
 51a:	83 c3 01             	add    $0x1,%ebx
 51d:	0f b6 92 f4 08 00 00 	movzbl 0x8f4(%edx),%edx
 524:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 528:	89 ca                	mov    %ecx,%edx
 52a:	89 c1                	mov    %eax,%ecx
 52c:	39 d6                	cmp    %edx,%esi
 52e:	76 df                	jbe    50f <printint+0x2e>
  if(neg)
 530:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 534:	74 31                	je     567 <printint+0x86>
    buf[i++] = '-';
 536:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 53b:	8d 5f 02             	lea    0x2(%edi),%ebx
 53e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 541:	eb 17                	jmp    55a <printint+0x79>
    x = xx;
 543:	89 c1                	mov    %eax,%ecx
  neg = 0;
 545:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 54c:	eb bc                	jmp    50a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 54e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 553:	89 f0                	mov    %esi,%eax
 555:	e8 6d ff ff ff       	call   4c7 <putc>
  while(--i >= 0)
 55a:	83 eb 01             	sub    $0x1,%ebx
 55d:	79 ef                	jns    54e <printint+0x6d>
}
 55f:	83 c4 2c             	add    $0x2c,%esp
 562:	5b                   	pop    %ebx
 563:	5e                   	pop    %esi
 564:	5f                   	pop    %edi
 565:	5d                   	pop    %ebp
 566:	c3                   	ret    
 567:	8b 75 d0             	mov    -0x30(%ebp),%esi
 56a:	eb ee                	jmp    55a <printint+0x79>

0000056c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 56c:	55                   	push   %ebp
 56d:	89 e5                	mov    %esp,%ebp
 56f:	57                   	push   %edi
 570:	56                   	push   %esi
 571:	53                   	push   %ebx
 572:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 575:	8d 45 10             	lea    0x10(%ebp),%eax
 578:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 57b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 580:	bb 00 00 00 00       	mov    $0x0,%ebx
 585:	eb 14                	jmp    59b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 587:	89 fa                	mov    %edi,%edx
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	e8 36 ff ff ff       	call   4c7 <putc>
 591:	eb 05                	jmp    598 <printf+0x2c>
      }
    } else if(state == '%'){
 593:	83 fe 25             	cmp    $0x25,%esi
 596:	74 25                	je     5bd <printf+0x51>
  for(i = 0; fmt[i]; i++){
 598:	83 c3 01             	add    $0x1,%ebx
 59b:	8b 45 0c             	mov    0xc(%ebp),%eax
 59e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5a2:	84 c0                	test   %al,%al
 5a4:	0f 84 20 01 00 00    	je     6ca <printf+0x15e>
    c = fmt[i] & 0xff;
 5aa:	0f be f8             	movsbl %al,%edi
 5ad:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5b0:	85 f6                	test   %esi,%esi
 5b2:	75 df                	jne    593 <printf+0x27>
      if(c == '%'){
 5b4:	83 f8 25             	cmp    $0x25,%eax
 5b7:	75 ce                	jne    587 <printf+0x1b>
        state = '%';
 5b9:	89 c6                	mov    %eax,%esi
 5bb:	eb db                	jmp    598 <printf+0x2c>
      if(c == 'd'){
 5bd:	83 f8 25             	cmp    $0x25,%eax
 5c0:	0f 84 cf 00 00 00    	je     695 <printf+0x129>
 5c6:	0f 8c dd 00 00 00    	jl     6a9 <printf+0x13d>
 5cc:	83 f8 78             	cmp    $0x78,%eax
 5cf:	0f 8f d4 00 00 00    	jg     6a9 <printf+0x13d>
 5d5:	83 f8 63             	cmp    $0x63,%eax
 5d8:	0f 8c cb 00 00 00    	jl     6a9 <printf+0x13d>
 5de:	83 e8 63             	sub    $0x63,%eax
 5e1:	83 f8 15             	cmp    $0x15,%eax
 5e4:	0f 87 bf 00 00 00    	ja     6a9 <printf+0x13d>
 5ea:	ff 24 85 9c 08 00 00 	jmp    *0x89c(,%eax,4)
        printint(fd, *ap, 10, 1);
 5f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f4:	8b 17                	mov    (%edi),%edx
 5f6:	83 ec 0c             	sub    $0xc,%esp
 5f9:	6a 01                	push   $0x1
 5fb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	e8 d9 fe ff ff       	call   4e1 <printint>
        ap++;
 608:	83 c7 04             	add    $0x4,%edi
 60b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 60e:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 611:	be 00 00 00 00       	mov    $0x0,%esi
 616:	eb 80                	jmp    598 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 618:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 61b:	8b 17                	mov    (%edi),%edx
 61d:	83 ec 0c             	sub    $0xc,%esp
 620:	6a 00                	push   $0x0
 622:	b9 10 00 00 00       	mov    $0x10,%ecx
 627:	8b 45 08             	mov    0x8(%ebp),%eax
 62a:	e8 b2 fe ff ff       	call   4e1 <printint>
        ap++;
 62f:	83 c7 04             	add    $0x4,%edi
 632:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 635:	83 c4 10             	add    $0x10,%esp
      state = 0;
 638:	be 00 00 00 00       	mov    $0x0,%esi
 63d:	e9 56 ff ff ff       	jmp    598 <printf+0x2c>
        s = (char*)*ap;
 642:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 645:	8b 30                	mov    (%eax),%esi
        ap++;
 647:	83 c0 04             	add    $0x4,%eax
 64a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 64d:	85 f6                	test   %esi,%esi
 64f:	75 15                	jne    666 <printf+0xfa>
          s = "(null)";
 651:	be 95 08 00 00       	mov    $0x895,%esi
 656:	eb 0e                	jmp    666 <printf+0xfa>
          putc(fd, *s);
 658:	0f be d2             	movsbl %dl,%edx
 65b:	8b 45 08             	mov    0x8(%ebp),%eax
 65e:	e8 64 fe ff ff       	call   4c7 <putc>
          s++;
 663:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 666:	0f b6 16             	movzbl (%esi),%edx
 669:	84 d2                	test   %dl,%dl
 66b:	75 eb                	jne    658 <printf+0xec>
      state = 0;
 66d:	be 00 00 00 00       	mov    $0x0,%esi
 672:	e9 21 ff ff ff       	jmp    598 <printf+0x2c>
        putc(fd, *ap);
 677:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 67a:	0f be 17             	movsbl (%edi),%edx
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	e8 42 fe ff ff       	call   4c7 <putc>
        ap++;
 685:	83 c7 04             	add    $0x4,%edi
 688:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 68b:	be 00 00 00 00       	mov    $0x0,%esi
 690:	e9 03 ff ff ff       	jmp    598 <printf+0x2c>
        putc(fd, c);
 695:	89 fa                	mov    %edi,%edx
 697:	8b 45 08             	mov    0x8(%ebp),%eax
 69a:	e8 28 fe ff ff       	call   4c7 <putc>
      state = 0;
 69f:	be 00 00 00 00       	mov    $0x0,%esi
 6a4:	e9 ef fe ff ff       	jmp    598 <printf+0x2c>
        putc(fd, '%');
 6a9:	ba 25 00 00 00       	mov    $0x25,%edx
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	e8 11 fe ff ff       	call   4c7 <putc>
        putc(fd, c);
 6b6:	89 fa                	mov    %edi,%edx
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 6bb:	e8 07 fe ff ff       	call   4c7 <putc>
      state = 0;
 6c0:	be 00 00 00 00       	mov    $0x0,%esi
 6c5:	e9 ce fe ff ff       	jmp    598 <printf+0x2c>
    }
  }
}
 6ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cd:	5b                   	pop    %ebx
 6ce:	5e                   	pop    %esi
 6cf:	5f                   	pop    %edi
 6d0:	5d                   	pop    %ebp
 6d1:	c3                   	ret    

000006d2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d2:	55                   	push   %ebp
 6d3:	89 e5                	mov    %esp,%ebp
 6d5:	57                   	push   %edi
 6d6:	56                   	push   %esi
 6d7:	53                   	push   %ebx
 6d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6db:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6de:	a1 88 0c 00 00       	mov    0xc88,%eax
 6e3:	eb 02                	jmp    6e7 <free+0x15>
 6e5:	89 d0                	mov    %edx,%eax
 6e7:	39 c8                	cmp    %ecx,%eax
 6e9:	73 04                	jae    6ef <free+0x1d>
 6eb:	39 08                	cmp    %ecx,(%eax)
 6ed:	77 12                	ja     701 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ef:	8b 10                	mov    (%eax),%edx
 6f1:	39 c2                	cmp    %eax,%edx
 6f3:	77 f0                	ja     6e5 <free+0x13>
 6f5:	39 c8                	cmp    %ecx,%eax
 6f7:	72 08                	jb     701 <free+0x2f>
 6f9:	39 ca                	cmp    %ecx,%edx
 6fb:	77 04                	ja     701 <free+0x2f>
 6fd:	89 d0                	mov    %edx,%eax
 6ff:	eb e6                	jmp    6e7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 701:	8b 73 fc             	mov    -0x4(%ebx),%esi
 704:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 707:	8b 10                	mov    (%eax),%edx
 709:	39 d7                	cmp    %edx,%edi
 70b:	74 19                	je     726 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 70d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 710:	8b 50 04             	mov    0x4(%eax),%edx
 713:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 716:	39 ce                	cmp    %ecx,%esi
 718:	74 1b                	je     735 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 71a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 71c:	a3 88 0c 00 00       	mov    %eax,0xc88
}
 721:	5b                   	pop    %ebx
 722:	5e                   	pop    %esi
 723:	5f                   	pop    %edi
 724:	5d                   	pop    %ebp
 725:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 726:	03 72 04             	add    0x4(%edx),%esi
 729:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 72c:	8b 10                	mov    (%eax),%edx
 72e:	8b 12                	mov    (%edx),%edx
 730:	89 53 f8             	mov    %edx,-0x8(%ebx)
 733:	eb db                	jmp    710 <free+0x3e>
    p->s.size += bp->s.size;
 735:	03 53 fc             	add    -0x4(%ebx),%edx
 738:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 73b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 73e:	89 10                	mov    %edx,(%eax)
 740:	eb da                	jmp    71c <free+0x4a>

00000742 <morecore>:

static Header*
morecore(uint nu)
{
 742:	55                   	push   %ebp
 743:	89 e5                	mov    %esp,%ebp
 745:	53                   	push   %ebx
 746:	83 ec 04             	sub    $0x4,%esp
 749:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 74b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 750:	77 05                	ja     757 <morecore+0x15>
    nu = 4096;
 752:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 757:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 75e:	83 ec 0c             	sub    $0xc,%esp
 761:	50                   	push   %eax
 762:	e8 38 fd ff ff       	call   49f <sbrk>
  if(p == (char*)-1)
 767:	83 c4 10             	add    $0x10,%esp
 76a:	83 f8 ff             	cmp    $0xffffffff,%eax
 76d:	74 1c                	je     78b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 76f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 772:	83 c0 08             	add    $0x8,%eax
 775:	83 ec 0c             	sub    $0xc,%esp
 778:	50                   	push   %eax
 779:	e8 54 ff ff ff       	call   6d2 <free>
  return freep;
 77e:	a1 88 0c 00 00       	mov    0xc88,%eax
 783:	83 c4 10             	add    $0x10,%esp
}
 786:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 789:	c9                   	leave  
 78a:	c3                   	ret    
    return 0;
 78b:	b8 00 00 00 00       	mov    $0x0,%eax
 790:	eb f4                	jmp    786 <morecore+0x44>

00000792 <malloc>:

void*
malloc(uint nbytes)
{
 792:	55                   	push   %ebp
 793:	89 e5                	mov    %esp,%ebp
 795:	53                   	push   %ebx
 796:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	8d 58 07             	lea    0x7(%eax),%ebx
 79f:	c1 eb 03             	shr    $0x3,%ebx
 7a2:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7a5:	8b 0d 88 0c 00 00    	mov    0xc88,%ecx
 7ab:	85 c9                	test   %ecx,%ecx
 7ad:	74 04                	je     7b3 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7af:	8b 01                	mov    (%ecx),%eax
 7b1:	eb 4a                	jmp    7fd <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7b3:	c7 05 88 0c 00 00 8c 	movl   $0xc8c,0xc88
 7ba:	0c 00 00 
 7bd:	c7 05 8c 0c 00 00 8c 	movl   $0xc8c,0xc8c
 7c4:	0c 00 00 
    base.s.size = 0;
 7c7:	c7 05 90 0c 00 00 00 	movl   $0x0,0xc90
 7ce:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7d1:	b9 8c 0c 00 00       	mov    $0xc8c,%ecx
 7d6:	eb d7                	jmp    7af <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7d8:	74 19                	je     7f3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7da:	29 da                	sub    %ebx,%edx
 7dc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7df:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7e2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7e5:	89 0d 88 0c 00 00    	mov    %ecx,0xc88
      return (void*)(p + 1);
 7eb:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7f1:	c9                   	leave  
 7f2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7f3:	8b 10                	mov    (%eax),%edx
 7f5:	89 11                	mov    %edx,(%ecx)
 7f7:	eb ec                	jmp    7e5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f9:	89 c1                	mov    %eax,%ecx
 7fb:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7fd:	8b 50 04             	mov    0x4(%eax),%edx
 800:	39 da                	cmp    %ebx,%edx
 802:	73 d4                	jae    7d8 <malloc+0x46>
    if(p == freep)
 804:	39 05 88 0c 00 00    	cmp    %eax,0xc88
 80a:	75 ed                	jne    7f9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 80c:	89 d8                	mov    %ebx,%eax
 80e:	e8 2f ff ff ff       	call   742 <morecore>
 813:	85 c0                	test   %eax,%eax
 815:	75 e2                	jne    7f9 <malloc+0x67>
 817:	eb d5                	jmp    7ee <malloc+0x5c>
