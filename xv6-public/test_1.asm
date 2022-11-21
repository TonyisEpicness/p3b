
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
   6:	a1 2c 0c 00 00       	mov    0xc2c,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 30                	push   $0x30
  12:	68 e4 07 00 00       	push   $0x7e4
  17:	68 ed 07 00 00       	push   $0x7ed
  1c:	6a 01                	push   $0x1
  1e:	e8 12 05 00 00       	call   535 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 f5 07 00 00       	push   $0x7f5
  2b:	68 01 08 00 00       	push   $0x801
  30:	6a 01                	push   $0x1
  32:	e8 fe 04 00 00       	call   535 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 15 08 00 00       	push   $0x815
  3f:	6a 01                	push   $0x1
  41:	e8 ef 04 00 00       	call   535 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 30 0c 00 00    	push   0xc30
  4f:	e8 bc 03 00 00       	call   410 <kill>
  54:	e8 87 03 00 00       	call   3e0 <exit>
   global = 5;
  59:	c7 05 2c 0c 00 00 05 	movl   $0x5,0xc2c
  60:	00 00 00 
   exit();
  63:	e8 78 03 00 00       	call   3e0 <exit>

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
  7b:	e8 e0 03 00 00       	call   460 <getpid>
  80:	a3 30 0c 00 00       	mov    %eax,0xc30
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 c9 06 00 00       	call   75b <malloc>
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
  bc:	e8 bf 03 00 00       	call   480 <clone>
  c1:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 8e c1 00 00 00    	jle    18f <main+0x127>
   while(global != 5);
  ce:	a1 2c 0c 00 00       	mov    0xc2c,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	75 f6                	jne    ce <main+0x66>
   printf(1, "TEST PASSED\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 3a 08 00 00       	push   $0x83a
  e0:	6a 01                	push   $0x1
  e2:	e8 4e 04 00 00       	call   535 <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 96 03 00 00       	call   488 <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 e4 07 00 00       	push   $0x7e4
 104:	68 ed 07 00 00       	push   $0x7ed
 109:	6a 01                	push   $0x1
 10b:	e8 25 04 00 00       	call   535 <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 47 08 00 00       	push   $0x847
 118:	68 01 08 00 00       	push   $0x801
 11d:	6a 01                	push   $0x1
 11f:	e8 11 04 00 00       	call   535 <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 15 08 00 00       	push   $0x815
 12c:	6a 01                	push   $0x1
 12e:	e8 02 04 00 00       	call   535 <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 30 0c 00 00    	push   0xc30
 13c:	e8 cf 02 00 00       	call   410 <kill>
 141:	e8 9a 02 00 00       	call   3e0 <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 e4 07 00 00       	push   $0x7e4
 14d:	68 ed 07 00 00       	push   $0x7ed
 152:	6a 01                	push   $0x1
 154:	e8 dc 03 00 00       	call   535 <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 22 08 00 00       	push   $0x822
 161:	68 01 08 00 00       	push   $0x801
 166:	6a 01                	push   $0x1
 168:	e8 c8 03 00 00       	call   535 <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 15 08 00 00       	push   $0x815
 175:	6a 01                	push   $0x1
 177:	e8 b9 03 00 00       	call   535 <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 30 0c 00 00    	push   0xc30
 185:	e8 86 02 00 00       	call   410 <kill>
 18a:	e8 51 02 00 00       	call   3e0 <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 e4 07 00 00       	push   $0x7e4
 196:	68 ed 07 00 00       	push   $0x7ed
 19b:	6a 01                	push   $0x1
 19d:	e8 93 03 00 00       	call   535 <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 2c 08 00 00       	push   $0x82c
 1aa:	68 01 08 00 00       	push   $0x801
 1af:	6a 01                	push   $0x1
 1b1:	e8 7f 03 00 00       	call   535 <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 15 08 00 00       	push   $0x815
 1be:	6a 01                	push   $0x1
 1c0:	e8 70 03 00 00       	call   535 <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 30 0c 00 00    	push   0xc30
 1ce:	e8 3d 02 00 00       	call   410 <kill>
 1d3:	e8 08 02 00 00       	call   3e0 <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 ba 04 00 00       	call   69b <free>
   exit();
 1e1:	e8 fa 01 00 00       	call   3e0 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 1f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1fc:	c3                   	ret    

000001fd <thread_join>:

int thread_join() {
  return 0;
}
 1fd:	b8 00 00 00 00       	mov    $0x0,%eax
 202:	c3                   	ret    

00000203 <lock_acquire>:

void lock_acquire(lock_t *lock){
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	53                   	push   %ebx
 207:	83 ec 04             	sub    $0x4,%esp
 20a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 20d:	83 ec 08             	sub    $0x8,%esp
 210:	6a 01                	push   $0x1
 212:	53                   	push   %ebx
 213:	e8 ce ff ff ff       	call   1e6 <test_and_set>
 218:	83 c4 10             	add    $0x10,%esp
 21b:	83 f8 01             	cmp    $0x1,%eax
 21e:	74 ed                	je     20d <lock_acquire+0xa>
    ;
}
 220:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 223:	c9                   	leave  
 224:	c3                   	ret    

00000225 <lock_release>:

void lock_release(lock_t *lock) {
 225:	55                   	push   %ebp
 226:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    

00000233 <lock_init>:

void lock_init(lock_t *lock) {
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    

00000241 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 241:	55                   	push   %ebp
 242:	89 e5                	mov    %esp,%ebp
 244:	56                   	push   %esi
 245:	53                   	push   %ebx
 246:	8b 75 08             	mov    0x8(%ebp),%esi
 249:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 24c:	89 f0                	mov    %esi,%eax
 24e:	89 d1                	mov    %edx,%ecx
 250:	83 c2 01             	add    $0x1,%edx
 253:	89 c3                	mov    %eax,%ebx
 255:	83 c0 01             	add    $0x1,%eax
 258:	0f b6 09             	movzbl (%ecx),%ecx
 25b:	88 0b                	mov    %cl,(%ebx)
 25d:	84 c9                	test   %cl,%cl
 25f:	75 ed                	jne    24e <strcpy+0xd>
    ;
  return os;
}
 261:	89 f0                	mov    %esi,%eax
 263:	5b                   	pop    %ebx
 264:	5e                   	pop    %esi
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    

00000267 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 267:	55                   	push   %ebp
 268:	89 e5                	mov    %esp,%ebp
 26a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 26d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 270:	eb 06                	jmp    278 <strcmp+0x11>
    p++, q++;
 272:	83 c1 01             	add    $0x1,%ecx
 275:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 278:	0f b6 01             	movzbl (%ecx),%eax
 27b:	84 c0                	test   %al,%al
 27d:	74 04                	je     283 <strcmp+0x1c>
 27f:	3a 02                	cmp    (%edx),%al
 281:	74 ef                	je     272 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 283:	0f b6 c0             	movzbl %al,%eax
 286:	0f b6 12             	movzbl (%edx),%edx
 289:	29 d0                	sub    %edx,%eax
}
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    

0000028d <strlen>:

uint
strlen(const char *s)
{
 28d:	55                   	push   %ebp
 28e:	89 e5                	mov    %esp,%ebp
 290:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 293:	b8 00 00 00 00       	mov    $0x0,%eax
 298:	eb 03                	jmp    29d <strlen+0x10>
 29a:	83 c0 01             	add    $0x1,%eax
 29d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2a1:	75 f7                	jne    29a <strlen+0xd>
    ;
  return n;
}
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    

000002a5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a5:	55                   	push   %ebp
 2a6:	89 e5                	mov    %esp,%ebp
 2a8:	57                   	push   %edi
 2a9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2ac:	89 d7                	mov    %edx,%edi
 2ae:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b4:	fc                   	cld    
 2b5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b7:	89 d0                	mov    %edx,%eax
 2b9:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2bc:	c9                   	leave  
 2bd:	c3                   	ret    

000002be <strchr>:

char*
strchr(const char *s, char c)
{
 2be:	55                   	push   %ebp
 2bf:	89 e5                	mov    %esp,%ebp
 2c1:	8b 45 08             	mov    0x8(%ebp),%eax
 2c4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2c8:	eb 03                	jmp    2cd <strchr+0xf>
 2ca:	83 c0 01             	add    $0x1,%eax
 2cd:	0f b6 10             	movzbl (%eax),%edx
 2d0:	84 d2                	test   %dl,%dl
 2d2:	74 06                	je     2da <strchr+0x1c>
    if(*s == c)
 2d4:	38 ca                	cmp    %cl,%dl
 2d6:	75 f2                	jne    2ca <strchr+0xc>
 2d8:	eb 05                	jmp    2df <strchr+0x21>
      return (char*)s;
  return 0;
 2da:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2df:	5d                   	pop    %ebp
 2e0:	c3                   	ret    

000002e1 <gets>:

char*
gets(char *buf, int max)
{
 2e1:	55                   	push   %ebp
 2e2:	89 e5                	mov    %esp,%ebp
 2e4:	57                   	push   %edi
 2e5:	56                   	push   %esi
 2e6:	53                   	push   %ebx
 2e7:	83 ec 1c             	sub    $0x1c,%esp
 2ea:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ed:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f2:	89 de                	mov    %ebx,%esi
 2f4:	83 c3 01             	add    $0x1,%ebx
 2f7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2fa:	7d 2e                	jge    32a <gets+0x49>
    cc = read(0, &c, 1);
 2fc:	83 ec 04             	sub    $0x4,%esp
 2ff:	6a 01                	push   $0x1
 301:	8d 45 e7             	lea    -0x19(%ebp),%eax
 304:	50                   	push   %eax
 305:	6a 00                	push   $0x0
 307:	e8 ec 00 00 00       	call   3f8 <read>
    if(cc < 1)
 30c:	83 c4 10             	add    $0x10,%esp
 30f:	85 c0                	test   %eax,%eax
 311:	7e 17                	jle    32a <gets+0x49>
      break;
    buf[i++] = c;
 313:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 317:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 31a:	3c 0a                	cmp    $0xa,%al
 31c:	0f 94 c2             	sete   %dl
 31f:	3c 0d                	cmp    $0xd,%al
 321:	0f 94 c0             	sete   %al
 324:	08 c2                	or     %al,%dl
 326:	74 ca                	je     2f2 <gets+0x11>
    buf[i++] = c;
 328:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 32a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 32e:	89 f8                	mov    %edi,%eax
 330:	8d 65 f4             	lea    -0xc(%ebp),%esp
 333:	5b                   	pop    %ebx
 334:	5e                   	pop    %esi
 335:	5f                   	pop    %edi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    

00000338 <stat>:

int
stat(const char *n, struct stat *st)
{
 338:	55                   	push   %ebp
 339:	89 e5                	mov    %esp,%ebp
 33b:	56                   	push   %esi
 33c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 33d:	83 ec 08             	sub    $0x8,%esp
 340:	6a 00                	push   $0x0
 342:	ff 75 08             	push   0x8(%ebp)
 345:	e8 d6 00 00 00       	call   420 <open>
  if(fd < 0)
 34a:	83 c4 10             	add    $0x10,%esp
 34d:	85 c0                	test   %eax,%eax
 34f:	78 24                	js     375 <stat+0x3d>
 351:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 353:	83 ec 08             	sub    $0x8,%esp
 356:	ff 75 0c             	push   0xc(%ebp)
 359:	50                   	push   %eax
 35a:	e8 d9 00 00 00       	call   438 <fstat>
 35f:	89 c6                	mov    %eax,%esi
  close(fd);
 361:	89 1c 24             	mov    %ebx,(%esp)
 364:	e8 9f 00 00 00       	call   408 <close>
  return r;
 369:	83 c4 10             	add    $0x10,%esp
}
 36c:	89 f0                	mov    %esi,%eax
 36e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 371:	5b                   	pop    %ebx
 372:	5e                   	pop    %esi
 373:	5d                   	pop    %ebp
 374:	c3                   	ret    
    return -1;
 375:	be ff ff ff ff       	mov    $0xffffffff,%esi
 37a:	eb f0                	jmp    36c <stat+0x34>

0000037c <atoi>:

int
atoi(const char *s)
{
 37c:	55                   	push   %ebp
 37d:	89 e5                	mov    %esp,%ebp
 37f:	53                   	push   %ebx
 380:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 383:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 388:	eb 10                	jmp    39a <atoi+0x1e>
    n = n*10 + *s++ - '0';
 38a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 38d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 390:	83 c1 01             	add    $0x1,%ecx
 393:	0f be c0             	movsbl %al,%eax
 396:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 39a:	0f b6 01             	movzbl (%ecx),%eax
 39d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3a0:	80 fb 09             	cmp    $0x9,%bl
 3a3:	76 e5                	jbe    38a <atoi+0xe>
  return n;
}
 3a5:	89 d0                	mov    %edx,%eax
 3a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    

000003ac <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ac:	55                   	push   %ebp
 3ad:	89 e5                	mov    %esp,%ebp
 3af:	56                   	push   %esi
 3b0:	53                   	push   %ebx
 3b1:	8b 75 08             	mov    0x8(%ebp),%esi
 3b4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3b7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3ba:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3bc:	eb 0d                	jmp    3cb <memmove+0x1f>
    *dst++ = *src++;
 3be:	0f b6 01             	movzbl (%ecx),%eax
 3c1:	88 02                	mov    %al,(%edx)
 3c3:	8d 49 01             	lea    0x1(%ecx),%ecx
 3c6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3c9:	89 d8                	mov    %ebx,%eax
 3cb:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3ce:	85 c0                	test   %eax,%eax
 3d0:	7f ec                	jg     3be <memmove+0x12>
  return vdst;
}
 3d2:	89 f0                	mov    %esi,%eax
 3d4:	5b                   	pop    %ebx
 3d5:	5e                   	pop    %esi
 3d6:	5d                   	pop    %ebp
 3d7:	c3                   	ret    

000003d8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3d8:	b8 01 00 00 00       	mov    $0x1,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <exit>:
SYSCALL(exit)
 3e0:	b8 02 00 00 00       	mov    $0x2,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <wait>:
SYSCALL(wait)
 3e8:	b8 03 00 00 00       	mov    $0x3,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <pipe>:
SYSCALL(pipe)
 3f0:	b8 04 00 00 00       	mov    $0x4,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <read>:
SYSCALL(read)
 3f8:	b8 05 00 00 00       	mov    $0x5,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <write>:
SYSCALL(write)
 400:	b8 10 00 00 00       	mov    $0x10,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <close>:
SYSCALL(close)
 408:	b8 15 00 00 00       	mov    $0x15,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <kill>:
SYSCALL(kill)
 410:	b8 06 00 00 00       	mov    $0x6,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <exec>:
SYSCALL(exec)
 418:	b8 07 00 00 00       	mov    $0x7,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <open>:
SYSCALL(open)
 420:	b8 0f 00 00 00       	mov    $0xf,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <mknod>:
SYSCALL(mknod)
 428:	b8 11 00 00 00       	mov    $0x11,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <unlink>:
SYSCALL(unlink)
 430:	b8 12 00 00 00       	mov    $0x12,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <fstat>:
SYSCALL(fstat)
 438:	b8 08 00 00 00       	mov    $0x8,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <link>:
SYSCALL(link)
 440:	b8 13 00 00 00       	mov    $0x13,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <mkdir>:
SYSCALL(mkdir)
 448:	b8 14 00 00 00       	mov    $0x14,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <chdir>:
SYSCALL(chdir)
 450:	b8 09 00 00 00       	mov    $0x9,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <dup>:
SYSCALL(dup)
 458:	b8 0a 00 00 00       	mov    $0xa,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <getpid>:
SYSCALL(getpid)
 460:	b8 0b 00 00 00       	mov    $0xb,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <sbrk>:
SYSCALL(sbrk)
 468:	b8 0c 00 00 00       	mov    $0xc,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <sleep>:
SYSCALL(sleep)
 470:	b8 0d 00 00 00       	mov    $0xd,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <uptime>:
SYSCALL(uptime)
 478:	b8 0e 00 00 00       	mov    $0xe,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <clone>:
SYSCALL(clone)
 480:	b8 16 00 00 00       	mov    $0x16,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <join>:
 488:	b8 17 00 00 00       	mov    $0x17,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	83 ec 1c             	sub    $0x1c,%esp
 496:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 499:	6a 01                	push   $0x1
 49b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 49e:	52                   	push   %edx
 49f:	50                   	push   %eax
 4a0:	e8 5b ff ff ff       	call   400 <write>
}
 4a5:	83 c4 10             	add    $0x10,%esp
 4a8:	c9                   	leave  
 4a9:	c3                   	ret    

000004aa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4aa:	55                   	push   %ebp
 4ab:	89 e5                	mov    %esp,%ebp
 4ad:	57                   	push   %edi
 4ae:	56                   	push   %esi
 4af:	53                   	push   %ebx
 4b0:	83 ec 2c             	sub    $0x2c,%esp
 4b3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4b6:	89 d0                	mov    %edx,%eax
 4b8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ba:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4be:	0f 95 c1             	setne  %cl
 4c1:	c1 ea 1f             	shr    $0x1f,%edx
 4c4:	84 d1                	test   %dl,%cl
 4c6:	74 44                	je     50c <printint+0x62>
    neg = 1;
    x = -xx;
 4c8:	f7 d8                	neg    %eax
 4ca:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4cc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4d3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4d8:	89 c8                	mov    %ecx,%eax
 4da:	ba 00 00 00 00       	mov    $0x0,%edx
 4df:	f7 f6                	div    %esi
 4e1:	89 df                	mov    %ebx,%edi
 4e3:	83 c3 01             	add    $0x1,%ebx
 4e6:	0f b6 92 bc 08 00 00 	movzbl 0x8bc(%edx),%edx
 4ed:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4f1:	89 ca                	mov    %ecx,%edx
 4f3:	89 c1                	mov    %eax,%ecx
 4f5:	39 d6                	cmp    %edx,%esi
 4f7:	76 df                	jbe    4d8 <printint+0x2e>
  if(neg)
 4f9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4fd:	74 31                	je     530 <printint+0x86>
    buf[i++] = '-';
 4ff:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 504:	8d 5f 02             	lea    0x2(%edi),%ebx
 507:	8b 75 d0             	mov    -0x30(%ebp),%esi
 50a:	eb 17                	jmp    523 <printint+0x79>
    x = xx;
 50c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 50e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 515:	eb bc                	jmp    4d3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 517:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 51c:	89 f0                	mov    %esi,%eax
 51e:	e8 6d ff ff ff       	call   490 <putc>
  while(--i >= 0)
 523:	83 eb 01             	sub    $0x1,%ebx
 526:	79 ef                	jns    517 <printint+0x6d>
}
 528:	83 c4 2c             	add    $0x2c,%esp
 52b:	5b                   	pop    %ebx
 52c:	5e                   	pop    %esi
 52d:	5f                   	pop    %edi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    
 530:	8b 75 d0             	mov    -0x30(%ebp),%esi
 533:	eb ee                	jmp    523 <printint+0x79>

00000535 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 535:	55                   	push   %ebp
 536:	89 e5                	mov    %esp,%ebp
 538:	57                   	push   %edi
 539:	56                   	push   %esi
 53a:	53                   	push   %ebx
 53b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 53e:	8d 45 10             	lea    0x10(%ebp),%eax
 541:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 544:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 549:	bb 00 00 00 00       	mov    $0x0,%ebx
 54e:	eb 14                	jmp    564 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 550:	89 fa                	mov    %edi,%edx
 552:	8b 45 08             	mov    0x8(%ebp),%eax
 555:	e8 36 ff ff ff       	call   490 <putc>
 55a:	eb 05                	jmp    561 <printf+0x2c>
      }
    } else if(state == '%'){
 55c:	83 fe 25             	cmp    $0x25,%esi
 55f:	74 25                	je     586 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 561:	83 c3 01             	add    $0x1,%ebx
 564:	8b 45 0c             	mov    0xc(%ebp),%eax
 567:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 56b:	84 c0                	test   %al,%al
 56d:	0f 84 20 01 00 00    	je     693 <printf+0x15e>
    c = fmt[i] & 0xff;
 573:	0f be f8             	movsbl %al,%edi
 576:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 579:	85 f6                	test   %esi,%esi
 57b:	75 df                	jne    55c <printf+0x27>
      if(c == '%'){
 57d:	83 f8 25             	cmp    $0x25,%eax
 580:	75 ce                	jne    550 <printf+0x1b>
        state = '%';
 582:	89 c6                	mov    %eax,%esi
 584:	eb db                	jmp    561 <printf+0x2c>
      if(c == 'd'){
 586:	83 f8 25             	cmp    $0x25,%eax
 589:	0f 84 cf 00 00 00    	je     65e <printf+0x129>
 58f:	0f 8c dd 00 00 00    	jl     672 <printf+0x13d>
 595:	83 f8 78             	cmp    $0x78,%eax
 598:	0f 8f d4 00 00 00    	jg     672 <printf+0x13d>
 59e:	83 f8 63             	cmp    $0x63,%eax
 5a1:	0f 8c cb 00 00 00    	jl     672 <printf+0x13d>
 5a7:	83 e8 63             	sub    $0x63,%eax
 5aa:	83 f8 15             	cmp    $0x15,%eax
 5ad:	0f 87 bf 00 00 00    	ja     672 <printf+0x13d>
 5b3:	ff 24 85 64 08 00 00 	jmp    *0x864(,%eax,4)
        printint(fd, *ap, 10, 1);
 5ba:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5bd:	8b 17                	mov    (%edi),%edx
 5bf:	83 ec 0c             	sub    $0xc,%esp
 5c2:	6a 01                	push   $0x1
 5c4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5c9:	8b 45 08             	mov    0x8(%ebp),%eax
 5cc:	e8 d9 fe ff ff       	call   4aa <printint>
        ap++;
 5d1:	83 c7 04             	add    $0x4,%edi
 5d4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5d7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5da:	be 00 00 00 00       	mov    $0x0,%esi
 5df:	eb 80                	jmp    561 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5e1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5e4:	8b 17                	mov    (%edi),%edx
 5e6:	83 ec 0c             	sub    $0xc,%esp
 5e9:	6a 00                	push   $0x0
 5eb:	b9 10 00 00 00       	mov    $0x10,%ecx
 5f0:	8b 45 08             	mov    0x8(%ebp),%eax
 5f3:	e8 b2 fe ff ff       	call   4aa <printint>
        ap++;
 5f8:	83 c7 04             	add    $0x4,%edi
 5fb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5fe:	83 c4 10             	add    $0x10,%esp
      state = 0;
 601:	be 00 00 00 00       	mov    $0x0,%esi
 606:	e9 56 ff ff ff       	jmp    561 <printf+0x2c>
        s = (char*)*ap;
 60b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 60e:	8b 30                	mov    (%eax),%esi
        ap++;
 610:	83 c0 04             	add    $0x4,%eax
 613:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 616:	85 f6                	test   %esi,%esi
 618:	75 15                	jne    62f <printf+0xfa>
          s = "(null)";
 61a:	be 5d 08 00 00       	mov    $0x85d,%esi
 61f:	eb 0e                	jmp    62f <printf+0xfa>
          putc(fd, *s);
 621:	0f be d2             	movsbl %dl,%edx
 624:	8b 45 08             	mov    0x8(%ebp),%eax
 627:	e8 64 fe ff ff       	call   490 <putc>
          s++;
 62c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 62f:	0f b6 16             	movzbl (%esi),%edx
 632:	84 d2                	test   %dl,%dl
 634:	75 eb                	jne    621 <printf+0xec>
      state = 0;
 636:	be 00 00 00 00       	mov    $0x0,%esi
 63b:	e9 21 ff ff ff       	jmp    561 <printf+0x2c>
        putc(fd, *ap);
 640:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 643:	0f be 17             	movsbl (%edi),%edx
 646:	8b 45 08             	mov    0x8(%ebp),%eax
 649:	e8 42 fe ff ff       	call   490 <putc>
        ap++;
 64e:	83 c7 04             	add    $0x4,%edi
 651:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 654:	be 00 00 00 00       	mov    $0x0,%esi
 659:	e9 03 ff ff ff       	jmp    561 <printf+0x2c>
        putc(fd, c);
 65e:	89 fa                	mov    %edi,%edx
 660:	8b 45 08             	mov    0x8(%ebp),%eax
 663:	e8 28 fe ff ff       	call   490 <putc>
      state = 0;
 668:	be 00 00 00 00       	mov    $0x0,%esi
 66d:	e9 ef fe ff ff       	jmp    561 <printf+0x2c>
        putc(fd, '%');
 672:	ba 25 00 00 00       	mov    $0x25,%edx
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	e8 11 fe ff ff       	call   490 <putc>
        putc(fd, c);
 67f:	89 fa                	mov    %edi,%edx
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	e8 07 fe ff ff       	call   490 <putc>
      state = 0;
 689:	be 00 00 00 00       	mov    $0x0,%esi
 68e:	e9 ce fe ff ff       	jmp    561 <printf+0x2c>
    }
  }
}
 693:	8d 65 f4             	lea    -0xc(%ebp),%esp
 696:	5b                   	pop    %ebx
 697:	5e                   	pop    %esi
 698:	5f                   	pop    %edi
 699:	5d                   	pop    %ebp
 69a:	c3                   	ret    

0000069b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 69b:	55                   	push   %ebp
 69c:	89 e5                	mov    %esp,%ebp
 69e:	57                   	push   %edi
 69f:	56                   	push   %esi
 6a0:	53                   	push   %ebx
 6a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6a4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a7:	a1 34 0c 00 00       	mov    0xc34,%eax
 6ac:	eb 02                	jmp    6b0 <free+0x15>
 6ae:	89 d0                	mov    %edx,%eax
 6b0:	39 c8                	cmp    %ecx,%eax
 6b2:	73 04                	jae    6b8 <free+0x1d>
 6b4:	39 08                	cmp    %ecx,(%eax)
 6b6:	77 12                	ja     6ca <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b8:	8b 10                	mov    (%eax),%edx
 6ba:	39 c2                	cmp    %eax,%edx
 6bc:	77 f0                	ja     6ae <free+0x13>
 6be:	39 c8                	cmp    %ecx,%eax
 6c0:	72 08                	jb     6ca <free+0x2f>
 6c2:	39 ca                	cmp    %ecx,%edx
 6c4:	77 04                	ja     6ca <free+0x2f>
 6c6:	89 d0                	mov    %edx,%eax
 6c8:	eb e6                	jmp    6b0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ca:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6cd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6d0:	8b 10                	mov    (%eax),%edx
 6d2:	39 d7                	cmp    %edx,%edi
 6d4:	74 19                	je     6ef <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6d6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6d9:	8b 50 04             	mov    0x4(%eax),%edx
 6dc:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6df:	39 ce                	cmp    %ecx,%esi
 6e1:	74 1b                	je     6fe <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6e3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6e5:	a3 34 0c 00 00       	mov    %eax,0xc34
}
 6ea:	5b                   	pop    %ebx
 6eb:	5e                   	pop    %esi
 6ec:	5f                   	pop    %edi
 6ed:	5d                   	pop    %ebp
 6ee:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6ef:	03 72 04             	add    0x4(%edx),%esi
 6f2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6f5:	8b 10                	mov    (%eax),%edx
 6f7:	8b 12                	mov    (%edx),%edx
 6f9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6fc:	eb db                	jmp    6d9 <free+0x3e>
    p->s.size += bp->s.size;
 6fe:	03 53 fc             	add    -0x4(%ebx),%edx
 701:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 704:	8b 53 f8             	mov    -0x8(%ebx),%edx
 707:	89 10                	mov    %edx,(%eax)
 709:	eb da                	jmp    6e5 <free+0x4a>

0000070b <morecore>:

static Header*
morecore(uint nu)
{
 70b:	55                   	push   %ebp
 70c:	89 e5                	mov    %esp,%ebp
 70e:	53                   	push   %ebx
 70f:	83 ec 04             	sub    $0x4,%esp
 712:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 714:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 719:	77 05                	ja     720 <morecore+0x15>
    nu = 4096;
 71b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 720:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 727:	83 ec 0c             	sub    $0xc,%esp
 72a:	50                   	push   %eax
 72b:	e8 38 fd ff ff       	call   468 <sbrk>
  if(p == (char*)-1)
 730:	83 c4 10             	add    $0x10,%esp
 733:	83 f8 ff             	cmp    $0xffffffff,%eax
 736:	74 1c                	je     754 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 738:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 73b:	83 c0 08             	add    $0x8,%eax
 73e:	83 ec 0c             	sub    $0xc,%esp
 741:	50                   	push   %eax
 742:	e8 54 ff ff ff       	call   69b <free>
  return freep;
 747:	a1 34 0c 00 00       	mov    0xc34,%eax
 74c:	83 c4 10             	add    $0x10,%esp
}
 74f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 752:	c9                   	leave  
 753:	c3                   	ret    
    return 0;
 754:	b8 00 00 00 00       	mov    $0x0,%eax
 759:	eb f4                	jmp    74f <morecore+0x44>

0000075b <malloc>:

void*
malloc(uint nbytes)
{
 75b:	55                   	push   %ebp
 75c:	89 e5                	mov    %esp,%ebp
 75e:	53                   	push   %ebx
 75f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 762:	8b 45 08             	mov    0x8(%ebp),%eax
 765:	8d 58 07             	lea    0x7(%eax),%ebx
 768:	c1 eb 03             	shr    $0x3,%ebx
 76b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 76e:	8b 0d 34 0c 00 00    	mov    0xc34,%ecx
 774:	85 c9                	test   %ecx,%ecx
 776:	74 04                	je     77c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 778:	8b 01                	mov    (%ecx),%eax
 77a:	eb 4a                	jmp    7c6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 77c:	c7 05 34 0c 00 00 38 	movl   $0xc38,0xc34
 783:	0c 00 00 
 786:	c7 05 38 0c 00 00 38 	movl   $0xc38,0xc38
 78d:	0c 00 00 
    base.s.size = 0;
 790:	c7 05 3c 0c 00 00 00 	movl   $0x0,0xc3c
 797:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 79a:	b9 38 0c 00 00       	mov    $0xc38,%ecx
 79f:	eb d7                	jmp    778 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7a1:	74 19                	je     7bc <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7a3:	29 da                	sub    %ebx,%edx
 7a5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7a8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7ab:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7ae:	89 0d 34 0c 00 00    	mov    %ecx,0xc34
      return (void*)(p + 1);
 7b4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7ba:	c9                   	leave  
 7bb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7bc:	8b 10                	mov    (%eax),%edx
 7be:	89 11                	mov    %edx,(%ecx)
 7c0:	eb ec                	jmp    7ae <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c2:	89 c1                	mov    %eax,%ecx
 7c4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7c6:	8b 50 04             	mov    0x4(%eax),%edx
 7c9:	39 da                	cmp    %ebx,%edx
 7cb:	73 d4                	jae    7a1 <malloc+0x46>
    if(p == freep)
 7cd:	39 05 34 0c 00 00    	cmp    %eax,0xc34
 7d3:	75 ed                	jne    7c2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7d5:	89 d8                	mov    %ebx,%eax
 7d7:	e8 2f ff ff ff       	call   70b <morecore>
 7dc:	85 c0                	test   %eax,%eax
 7de:	75 e2                	jne    7c2 <malloc+0x67>
 7e0:	eb d5                	jmp    7b7 <malloc+0x5c>
