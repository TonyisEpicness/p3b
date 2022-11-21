
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
  36:	68 98 08 00 00       	push   $0x898
  3b:	68 a1 08 00 00       	push   $0x8a1
  40:	6a 01                	push   $0x1
  42:	e8 a3 05 00 00       	call   5ea <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 60 09 00 00       	push   $0x960
  4f:	68 a9 08 00 00       	push   $0x8a9
  54:	6a 01                	push   $0x1
  56:	e8 8f 05 00 00       	call   5ea <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 bd 08 00 00       	push   $0x8bd
  63:	6a 01                	push   $0x1
  65:	e8 80 05 00 00       	call   5ea <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 64 0d 00 00    	push   0xd64
  73:	e8 4d 04 00 00       	call   4c5 <kill>
  78:	e8 18 04 00 00       	call   495 <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 98 08 00 00       	push   $0x898
  84:	68 a1 08 00 00       	push   $0x8a1
  89:	6a 01                	push   $0x1
  8b:	e8 5a 05 00 00       	call   5ea <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 08 09 00 00       	push   $0x908
  98:	68 a9 08 00 00       	push   $0x8a9
  9d:	6a 01                	push   $0x1
  9f:	e8 46 05 00 00       	call   5ea <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 bd 08 00 00       	push   $0x8bd
  ac:	6a 01                	push   $0x1
  ae:	e8 37 05 00 00       	call   5ea <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 64 0d 00 00    	push   0xd64
  bc:	e8 04 04 00 00       	call   4c5 <kill>
  c1:	e8 cf 03 00 00       	call   495 <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 98 08 00 00       	push   $0x898
  cd:	68 a1 08 00 00       	push   $0x8a1
  d2:	6a 01                	push   $0x1
  d4:	e8 11 05 00 00       	call   5ea <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 34 09 00 00       	push   $0x934
  e1:	68 a9 08 00 00       	push   $0x8a9
  e6:	6a 01                	push   $0x1
  e8:	e8 fd 04 00 00       	call   5ea <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 bd 08 00 00       	push   $0x8bd
  f5:	6a 01                	push   $0x1
  f7:	e8 ee 04 00 00       	call   5ea <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 64 0d 00 00    	push   0xd64
 105:	e8 bb 03 00 00       	call   4c5 <kill>
 10a:	e8 86 03 00 00       	call   495 <exit>
   global = 5;
 10f:	c7 05 60 0d 00 00 05 	movl   $0x5,0xd60
 116:	00 00 00 
   exit();
 119:	e8 77 03 00 00       	call   495 <exit>

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
 131:	e8 df 03 00 00       	call   515 <getpid>
 136:	a3 64 0d 00 00       	mov    %eax,0xd64
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 c8 06 00 00       	call   810 <malloc>
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
 171:	e8 bf 03 00 00       	call   535 <clone>
 176:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 178:	83 c4 10             	add    $0x10,%esp
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 8e c1 00 00 00    	jle    244 <main+0x126>
   while(global != 5);
 183:	a1 60 0d 00 00       	mov    0xd60,%eax
 188:	83 f8 05             	cmp    $0x5,%eax
 18b:	75 f6                	jne    183 <main+0x65>
   printf(1, "TEST PASSED\n");
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	68 e2 08 00 00       	push   $0x8e2
 195:	6a 01                	push   $0x1
 197:	e8 4e 04 00 00       	call   5ea <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 96 03 00 00       	call   53d <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 98 08 00 00       	push   $0x898
 1b9:	68 a1 08 00 00       	push   $0x8a1
 1be:	6a 01                	push   $0x1
 1c0:	e8 25 04 00 00       	call   5ea <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 ef 08 00 00       	push   $0x8ef
 1cd:	68 a9 08 00 00       	push   $0x8a9
 1d2:	6a 01                	push   $0x1
 1d4:	e8 11 04 00 00       	call   5ea <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 bd 08 00 00       	push   $0x8bd
 1e1:	6a 01                	push   $0x1
 1e3:	e8 02 04 00 00       	call   5ea <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 64 0d 00 00    	push   0xd64
 1f1:	e8 cf 02 00 00       	call   4c5 <kill>
 1f6:	e8 9a 02 00 00       	call   495 <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 98 08 00 00       	push   $0x898
 202:	68 a1 08 00 00       	push   $0x8a1
 207:	6a 01                	push   $0x1
 209:	e8 dc 03 00 00       	call   5ea <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 ca 08 00 00       	push   $0x8ca
 216:	68 a9 08 00 00       	push   $0x8a9
 21b:	6a 01                	push   $0x1
 21d:	e8 c8 03 00 00       	call   5ea <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 bd 08 00 00       	push   $0x8bd
 22a:	6a 01                	push   $0x1
 22c:	e8 b9 03 00 00       	call   5ea <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 64 0d 00 00    	push   0xd64
 23a:	e8 86 02 00 00       	call   4c5 <kill>
 23f:	e8 51 02 00 00       	call   495 <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 98 08 00 00       	push   $0x898
 24b:	68 a1 08 00 00       	push   $0x8a1
 250:	6a 01                	push   $0x1
 252:	e8 93 03 00 00       	call   5ea <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 d4 08 00 00       	push   $0x8d4
 25f:	68 a9 08 00 00       	push   $0x8a9
 264:	6a 01                	push   $0x1
 266:	e8 7f 03 00 00       	call   5ea <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 bd 08 00 00       	push   $0x8bd
 273:	6a 01                	push   $0x1
 275:	e8 70 03 00 00       	call   5ea <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 64 0d 00 00    	push   0xd64
 283:	e8 3d 02 00 00       	call   4c5 <kill>
 288:	e8 08 02 00 00       	call   495 <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 ba 04 00 00       	call   750 <free>
   exit();
 296:	e8 fa 01 00 00       	call   495 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 2ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2b1:	c3                   	ret    

000002b2 <thread_join>:

int thread_join() {
  return 0;
}
 2b2:	b8 00 00 00 00       	mov    $0x0,%eax
 2b7:	c3                   	ret    

000002b8 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	53                   	push   %ebx
 2bc:	83 ec 04             	sub    $0x4,%esp
 2bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2c2:	83 ec 08             	sub    $0x8,%esp
 2c5:	6a 01                	push   $0x1
 2c7:	53                   	push   %ebx
 2c8:	e8 ce ff ff ff       	call   29b <test_and_set>
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	83 f8 01             	cmp    $0x1,%eax
 2d3:	74 ed                	je     2c2 <lock_acquire+0xa>
    ;
}
 2d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d8:	c9                   	leave  
 2d9:	c3                   	ret    

000002da <lock_release>:

void lock_release(lock_t *lock) {
 2da:	55                   	push   %ebp
 2db:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
 2e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    

000002e8 <lock_init>:

void lock_init(lock_t *lock) {
 2e8:	55                   	push   %ebp
 2e9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2eb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ee:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret    

000002f6 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2f6:	55                   	push   %ebp
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	56                   	push   %esi
 2fa:	53                   	push   %ebx
 2fb:	8b 75 08             	mov    0x8(%ebp),%esi
 2fe:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 301:	89 f0                	mov    %esi,%eax
 303:	89 d1                	mov    %edx,%ecx
 305:	83 c2 01             	add    $0x1,%edx
 308:	89 c3                	mov    %eax,%ebx
 30a:	83 c0 01             	add    $0x1,%eax
 30d:	0f b6 09             	movzbl (%ecx),%ecx
 310:	88 0b                	mov    %cl,(%ebx)
 312:	84 c9                	test   %cl,%cl
 314:	75 ed                	jne    303 <strcpy+0xd>
    ;
  return os;
}
 316:	89 f0                	mov    %esi,%eax
 318:	5b                   	pop    %ebx
 319:	5e                   	pop    %esi
 31a:	5d                   	pop    %ebp
 31b:	c3                   	ret    

0000031c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 31c:	55                   	push   %ebp
 31d:	89 e5                	mov    %esp,%ebp
 31f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 322:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 325:	eb 06                	jmp    32d <strcmp+0x11>
    p++, q++;
 327:	83 c1 01             	add    $0x1,%ecx
 32a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 32d:	0f b6 01             	movzbl (%ecx),%eax
 330:	84 c0                	test   %al,%al
 332:	74 04                	je     338 <strcmp+0x1c>
 334:	3a 02                	cmp    (%edx),%al
 336:	74 ef                	je     327 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 338:	0f b6 c0             	movzbl %al,%eax
 33b:	0f b6 12             	movzbl (%edx),%edx
 33e:	29 d0                	sub    %edx,%eax
}
 340:	5d                   	pop    %ebp
 341:	c3                   	ret    

00000342 <strlen>:

uint
strlen(const char *s)
{
 342:	55                   	push   %ebp
 343:	89 e5                	mov    %esp,%ebp
 345:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 348:	b8 00 00 00 00       	mov    $0x0,%eax
 34d:	eb 03                	jmp    352 <strlen+0x10>
 34f:	83 c0 01             	add    $0x1,%eax
 352:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 356:	75 f7                	jne    34f <strlen+0xd>
    ;
  return n;
}
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <memset>:

void*
memset(void *dst, int c, uint n)
{
 35a:	55                   	push   %ebp
 35b:	89 e5                	mov    %esp,%ebp
 35d:	57                   	push   %edi
 35e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 361:	89 d7                	mov    %edx,%edi
 363:	8b 4d 10             	mov    0x10(%ebp),%ecx
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	fc                   	cld    
 36a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 36c:	89 d0                	mov    %edx,%eax
 36e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 371:	c9                   	leave  
 372:	c3                   	ret    

00000373 <strchr>:

char*
strchr(const char *s, char c)
{
 373:	55                   	push   %ebp
 374:	89 e5                	mov    %esp,%ebp
 376:	8b 45 08             	mov    0x8(%ebp),%eax
 379:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 37d:	eb 03                	jmp    382 <strchr+0xf>
 37f:	83 c0 01             	add    $0x1,%eax
 382:	0f b6 10             	movzbl (%eax),%edx
 385:	84 d2                	test   %dl,%dl
 387:	74 06                	je     38f <strchr+0x1c>
    if(*s == c)
 389:	38 ca                	cmp    %cl,%dl
 38b:	75 f2                	jne    37f <strchr+0xc>
 38d:	eb 05                	jmp    394 <strchr+0x21>
      return (char*)s;
  return 0;
 38f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 394:	5d                   	pop    %ebp
 395:	c3                   	ret    

00000396 <gets>:

char*
gets(char *buf, int max)
{
 396:	55                   	push   %ebp
 397:	89 e5                	mov    %esp,%ebp
 399:	57                   	push   %edi
 39a:	56                   	push   %esi
 39b:	53                   	push   %ebx
 39c:	83 ec 1c             	sub    $0x1c,%esp
 39f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a2:	bb 00 00 00 00       	mov    $0x0,%ebx
 3a7:	89 de                	mov    %ebx,%esi
 3a9:	83 c3 01             	add    $0x1,%ebx
 3ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3af:	7d 2e                	jge    3df <gets+0x49>
    cc = read(0, &c, 1);
 3b1:	83 ec 04             	sub    $0x4,%esp
 3b4:	6a 01                	push   $0x1
 3b6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3b9:	50                   	push   %eax
 3ba:	6a 00                	push   $0x0
 3bc:	e8 ec 00 00 00       	call   4ad <read>
    if(cc < 1)
 3c1:	83 c4 10             	add    $0x10,%esp
 3c4:	85 c0                	test   %eax,%eax
 3c6:	7e 17                	jle    3df <gets+0x49>
      break;
    buf[i++] = c;
 3c8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3cc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3cf:	3c 0a                	cmp    $0xa,%al
 3d1:	0f 94 c2             	sete   %dl
 3d4:	3c 0d                	cmp    $0xd,%al
 3d6:	0f 94 c0             	sete   %al
 3d9:	08 c2                	or     %al,%dl
 3db:	74 ca                	je     3a7 <gets+0x11>
    buf[i++] = c;
 3dd:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3df:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3e3:	89 f8                	mov    %edi,%eax
 3e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e8:	5b                   	pop    %ebx
 3e9:	5e                   	pop    %esi
 3ea:	5f                   	pop    %edi
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    

000003ed <stat>:

int
stat(const char *n, struct stat *st)
{
 3ed:	55                   	push   %ebp
 3ee:	89 e5                	mov    %esp,%ebp
 3f0:	56                   	push   %esi
 3f1:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3f2:	83 ec 08             	sub    $0x8,%esp
 3f5:	6a 00                	push   $0x0
 3f7:	ff 75 08             	push   0x8(%ebp)
 3fa:	e8 d6 00 00 00       	call   4d5 <open>
  if(fd < 0)
 3ff:	83 c4 10             	add    $0x10,%esp
 402:	85 c0                	test   %eax,%eax
 404:	78 24                	js     42a <stat+0x3d>
 406:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 408:	83 ec 08             	sub    $0x8,%esp
 40b:	ff 75 0c             	push   0xc(%ebp)
 40e:	50                   	push   %eax
 40f:	e8 d9 00 00 00       	call   4ed <fstat>
 414:	89 c6                	mov    %eax,%esi
  close(fd);
 416:	89 1c 24             	mov    %ebx,(%esp)
 419:	e8 9f 00 00 00       	call   4bd <close>
  return r;
 41e:	83 c4 10             	add    $0x10,%esp
}
 421:	89 f0                	mov    %esi,%eax
 423:	8d 65 f8             	lea    -0x8(%ebp),%esp
 426:	5b                   	pop    %ebx
 427:	5e                   	pop    %esi
 428:	5d                   	pop    %ebp
 429:	c3                   	ret    
    return -1;
 42a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 42f:	eb f0                	jmp    421 <stat+0x34>

00000431 <atoi>:

int
atoi(const char *s)
{
 431:	55                   	push   %ebp
 432:	89 e5                	mov    %esp,%ebp
 434:	53                   	push   %ebx
 435:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 438:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 43d:	eb 10                	jmp    44f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 43f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 442:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 445:	83 c1 01             	add    $0x1,%ecx
 448:	0f be c0             	movsbl %al,%eax
 44b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 44f:	0f b6 01             	movzbl (%ecx),%eax
 452:	8d 58 d0             	lea    -0x30(%eax),%ebx
 455:	80 fb 09             	cmp    $0x9,%bl
 458:	76 e5                	jbe    43f <atoi+0xe>
  return n;
}
 45a:	89 d0                	mov    %edx,%eax
 45c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 45f:	c9                   	leave  
 460:	c3                   	ret    

00000461 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	8b 75 08             	mov    0x8(%ebp),%esi
 469:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 46c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 46f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 471:	eb 0d                	jmp    480 <memmove+0x1f>
    *dst++ = *src++;
 473:	0f b6 01             	movzbl (%ecx),%eax
 476:	88 02                	mov    %al,(%edx)
 478:	8d 49 01             	lea    0x1(%ecx),%ecx
 47b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 47e:	89 d8                	mov    %ebx,%eax
 480:	8d 58 ff             	lea    -0x1(%eax),%ebx
 483:	85 c0                	test   %eax,%eax
 485:	7f ec                	jg     473 <memmove+0x12>
  return vdst;
}
 487:	89 f0                	mov    %esi,%eax
 489:	5b                   	pop    %ebx
 48a:	5e                   	pop    %esi
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    

0000048d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 48d:	b8 01 00 00 00       	mov    $0x1,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <exit>:
SYSCALL(exit)
 495:	b8 02 00 00 00       	mov    $0x2,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <wait>:
SYSCALL(wait)
 49d:	b8 03 00 00 00       	mov    $0x3,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <pipe>:
SYSCALL(pipe)
 4a5:	b8 04 00 00 00       	mov    $0x4,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <read>:
SYSCALL(read)
 4ad:	b8 05 00 00 00       	mov    $0x5,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <write>:
SYSCALL(write)
 4b5:	b8 10 00 00 00       	mov    $0x10,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <close>:
SYSCALL(close)
 4bd:	b8 15 00 00 00       	mov    $0x15,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <kill>:
SYSCALL(kill)
 4c5:	b8 06 00 00 00       	mov    $0x6,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <exec>:
SYSCALL(exec)
 4cd:	b8 07 00 00 00       	mov    $0x7,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <open>:
SYSCALL(open)
 4d5:	b8 0f 00 00 00       	mov    $0xf,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <mknod>:
SYSCALL(mknod)
 4dd:	b8 11 00 00 00       	mov    $0x11,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <unlink>:
SYSCALL(unlink)
 4e5:	b8 12 00 00 00       	mov    $0x12,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <fstat>:
SYSCALL(fstat)
 4ed:	b8 08 00 00 00       	mov    $0x8,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <link>:
SYSCALL(link)
 4f5:	b8 13 00 00 00       	mov    $0x13,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <mkdir>:
SYSCALL(mkdir)
 4fd:	b8 14 00 00 00       	mov    $0x14,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <chdir>:
SYSCALL(chdir)
 505:	b8 09 00 00 00       	mov    $0x9,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <dup>:
SYSCALL(dup)
 50d:	b8 0a 00 00 00       	mov    $0xa,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <getpid>:
SYSCALL(getpid)
 515:	b8 0b 00 00 00       	mov    $0xb,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <sbrk>:
SYSCALL(sbrk)
 51d:	b8 0c 00 00 00       	mov    $0xc,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <sleep>:
SYSCALL(sleep)
 525:	b8 0d 00 00 00       	mov    $0xd,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <uptime>:
SYSCALL(uptime)
 52d:	b8 0e 00 00 00       	mov    $0xe,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <clone>:
SYSCALL(clone)
 535:	b8 16 00 00 00       	mov    $0x16,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <join>:
 53d:	b8 17 00 00 00       	mov    $0x17,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 545:	55                   	push   %ebp
 546:	89 e5                	mov    %esp,%ebp
 548:	83 ec 1c             	sub    $0x1c,%esp
 54b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 54e:	6a 01                	push   $0x1
 550:	8d 55 f4             	lea    -0xc(%ebp),%edx
 553:	52                   	push   %edx
 554:	50                   	push   %eax
 555:	e8 5b ff ff ff       	call   4b5 <write>
}
 55a:	83 c4 10             	add    $0x10,%esp
 55d:	c9                   	leave  
 55e:	c3                   	ret    

0000055f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 55f:	55                   	push   %ebp
 560:	89 e5                	mov    %esp,%ebp
 562:	57                   	push   %edi
 563:	56                   	push   %esi
 564:	53                   	push   %ebx
 565:	83 ec 2c             	sub    $0x2c,%esp
 568:	89 45 d0             	mov    %eax,-0x30(%ebp)
 56b:	89 d0                	mov    %edx,%eax
 56d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 56f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 573:	0f 95 c1             	setne  %cl
 576:	c1 ea 1f             	shr    $0x1f,%edx
 579:	84 d1                	test   %dl,%cl
 57b:	74 44                	je     5c1 <printint+0x62>
    neg = 1;
    x = -xx;
 57d:	f7 d8                	neg    %eax
 57f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 581:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 588:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 58d:	89 c8                	mov    %ecx,%eax
 58f:	ba 00 00 00 00       	mov    $0x0,%edx
 594:	f7 f6                	div    %esi
 596:	89 df                	mov    %ebx,%edi
 598:	83 c3 01             	add    $0x1,%ebx
 59b:	0f b6 92 f0 09 00 00 	movzbl 0x9f0(%edx),%edx
 5a2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5a6:	89 ca                	mov    %ecx,%edx
 5a8:	89 c1                	mov    %eax,%ecx
 5aa:	39 d6                	cmp    %edx,%esi
 5ac:	76 df                	jbe    58d <printint+0x2e>
  if(neg)
 5ae:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5b2:	74 31                	je     5e5 <printint+0x86>
    buf[i++] = '-';
 5b4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5b9:	8d 5f 02             	lea    0x2(%edi),%ebx
 5bc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5bf:	eb 17                	jmp    5d8 <printint+0x79>
    x = xx;
 5c1:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5c3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5ca:	eb bc                	jmp    588 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5cc:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5d1:	89 f0                	mov    %esi,%eax
 5d3:	e8 6d ff ff ff       	call   545 <putc>
  while(--i >= 0)
 5d8:	83 eb 01             	sub    $0x1,%ebx
 5db:	79 ef                	jns    5cc <printint+0x6d>
}
 5dd:	83 c4 2c             	add    $0x2c,%esp
 5e0:	5b                   	pop    %ebx
 5e1:	5e                   	pop    %esi
 5e2:	5f                   	pop    %edi
 5e3:	5d                   	pop    %ebp
 5e4:	c3                   	ret    
 5e5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5e8:	eb ee                	jmp    5d8 <printint+0x79>

000005ea <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5ea:	55                   	push   %ebp
 5eb:	89 e5                	mov    %esp,%ebp
 5ed:	57                   	push   %edi
 5ee:	56                   	push   %esi
 5ef:	53                   	push   %ebx
 5f0:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5f3:	8d 45 10             	lea    0x10(%ebp),%eax
 5f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5f9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5fe:	bb 00 00 00 00       	mov    $0x0,%ebx
 603:	eb 14                	jmp    619 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 605:	89 fa                	mov    %edi,%edx
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	e8 36 ff ff ff       	call   545 <putc>
 60f:	eb 05                	jmp    616 <printf+0x2c>
      }
    } else if(state == '%'){
 611:	83 fe 25             	cmp    $0x25,%esi
 614:	74 25                	je     63b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 616:	83 c3 01             	add    $0x1,%ebx
 619:	8b 45 0c             	mov    0xc(%ebp),%eax
 61c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 620:	84 c0                	test   %al,%al
 622:	0f 84 20 01 00 00    	je     748 <printf+0x15e>
    c = fmt[i] & 0xff;
 628:	0f be f8             	movsbl %al,%edi
 62b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 62e:	85 f6                	test   %esi,%esi
 630:	75 df                	jne    611 <printf+0x27>
      if(c == '%'){
 632:	83 f8 25             	cmp    $0x25,%eax
 635:	75 ce                	jne    605 <printf+0x1b>
        state = '%';
 637:	89 c6                	mov    %eax,%esi
 639:	eb db                	jmp    616 <printf+0x2c>
      if(c == 'd'){
 63b:	83 f8 25             	cmp    $0x25,%eax
 63e:	0f 84 cf 00 00 00    	je     713 <printf+0x129>
 644:	0f 8c dd 00 00 00    	jl     727 <printf+0x13d>
 64a:	83 f8 78             	cmp    $0x78,%eax
 64d:	0f 8f d4 00 00 00    	jg     727 <printf+0x13d>
 653:	83 f8 63             	cmp    $0x63,%eax
 656:	0f 8c cb 00 00 00    	jl     727 <printf+0x13d>
 65c:	83 e8 63             	sub    $0x63,%eax
 65f:	83 f8 15             	cmp    $0x15,%eax
 662:	0f 87 bf 00 00 00    	ja     727 <printf+0x13d>
 668:	ff 24 85 98 09 00 00 	jmp    *0x998(,%eax,4)
        printint(fd, *ap, 10, 1);
 66f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 672:	8b 17                	mov    (%edi),%edx
 674:	83 ec 0c             	sub    $0xc,%esp
 677:	6a 01                	push   $0x1
 679:	b9 0a 00 00 00       	mov    $0xa,%ecx
 67e:	8b 45 08             	mov    0x8(%ebp),%eax
 681:	e8 d9 fe ff ff       	call   55f <printint>
        ap++;
 686:	83 c7 04             	add    $0x4,%edi
 689:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 68c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 68f:	be 00 00 00 00       	mov    $0x0,%esi
 694:	eb 80                	jmp    616 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 696:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 699:	8b 17                	mov    (%edi),%edx
 69b:	83 ec 0c             	sub    $0xc,%esp
 69e:	6a 00                	push   $0x0
 6a0:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a5:	8b 45 08             	mov    0x8(%ebp),%eax
 6a8:	e8 b2 fe ff ff       	call   55f <printint>
        ap++;
 6ad:	83 c7 04             	add    $0x4,%edi
 6b0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6b3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b6:	be 00 00 00 00       	mov    $0x0,%esi
 6bb:	e9 56 ff ff ff       	jmp    616 <printf+0x2c>
        s = (char*)*ap;
 6c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c3:	8b 30                	mov    (%eax),%esi
        ap++;
 6c5:	83 c0 04             	add    $0x4,%eax
 6c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6cb:	85 f6                	test   %esi,%esi
 6cd:	75 15                	jne    6e4 <printf+0xfa>
          s = "(null)";
 6cf:	be 8e 09 00 00       	mov    $0x98e,%esi
 6d4:	eb 0e                	jmp    6e4 <printf+0xfa>
          putc(fd, *s);
 6d6:	0f be d2             	movsbl %dl,%edx
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	e8 64 fe ff ff       	call   545 <putc>
          s++;
 6e1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6e4:	0f b6 16             	movzbl (%esi),%edx
 6e7:	84 d2                	test   %dl,%dl
 6e9:	75 eb                	jne    6d6 <printf+0xec>
      state = 0;
 6eb:	be 00 00 00 00       	mov    $0x0,%esi
 6f0:	e9 21 ff ff ff       	jmp    616 <printf+0x2c>
        putc(fd, *ap);
 6f5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f8:	0f be 17             	movsbl (%edi),%edx
 6fb:	8b 45 08             	mov    0x8(%ebp),%eax
 6fe:	e8 42 fe ff ff       	call   545 <putc>
        ap++;
 703:	83 c7 04             	add    $0x4,%edi
 706:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 709:	be 00 00 00 00       	mov    $0x0,%esi
 70e:	e9 03 ff ff ff       	jmp    616 <printf+0x2c>
        putc(fd, c);
 713:	89 fa                	mov    %edi,%edx
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	e8 28 fe ff ff       	call   545 <putc>
      state = 0;
 71d:	be 00 00 00 00       	mov    $0x0,%esi
 722:	e9 ef fe ff ff       	jmp    616 <printf+0x2c>
        putc(fd, '%');
 727:	ba 25 00 00 00       	mov    $0x25,%edx
 72c:	8b 45 08             	mov    0x8(%ebp),%eax
 72f:	e8 11 fe ff ff       	call   545 <putc>
        putc(fd, c);
 734:	89 fa                	mov    %edi,%edx
 736:	8b 45 08             	mov    0x8(%ebp),%eax
 739:	e8 07 fe ff ff       	call   545 <putc>
      state = 0;
 73e:	be 00 00 00 00       	mov    $0x0,%esi
 743:	e9 ce fe ff ff       	jmp    616 <printf+0x2c>
    }
  }
}
 748:	8d 65 f4             	lea    -0xc(%ebp),%esp
 74b:	5b                   	pop    %ebx
 74c:	5e                   	pop    %esi
 74d:	5f                   	pop    %edi
 74e:	5d                   	pop    %ebp
 74f:	c3                   	ret    

00000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 759:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75c:	a1 68 0d 00 00       	mov    0xd68,%eax
 761:	eb 02                	jmp    765 <free+0x15>
 763:	89 d0                	mov    %edx,%eax
 765:	39 c8                	cmp    %ecx,%eax
 767:	73 04                	jae    76d <free+0x1d>
 769:	39 08                	cmp    %ecx,(%eax)
 76b:	77 12                	ja     77f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76d:	8b 10                	mov    (%eax),%edx
 76f:	39 c2                	cmp    %eax,%edx
 771:	77 f0                	ja     763 <free+0x13>
 773:	39 c8                	cmp    %ecx,%eax
 775:	72 08                	jb     77f <free+0x2f>
 777:	39 ca                	cmp    %ecx,%edx
 779:	77 04                	ja     77f <free+0x2f>
 77b:	89 d0                	mov    %edx,%eax
 77d:	eb e6                	jmp    765 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 77f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 782:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 785:	8b 10                	mov    (%eax),%edx
 787:	39 d7                	cmp    %edx,%edi
 789:	74 19                	je     7a4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 78b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 78e:	8b 50 04             	mov    0x4(%eax),%edx
 791:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 794:	39 ce                	cmp    %ecx,%esi
 796:	74 1b                	je     7b3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 798:	89 08                	mov    %ecx,(%eax)
  freep = p;
 79a:	a3 68 0d 00 00       	mov    %eax,0xd68
}
 79f:	5b                   	pop    %ebx
 7a0:	5e                   	pop    %esi
 7a1:	5f                   	pop    %edi
 7a2:	5d                   	pop    %ebp
 7a3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7a4:	03 72 04             	add    0x4(%edx),%esi
 7a7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7aa:	8b 10                	mov    (%eax),%edx
 7ac:	8b 12                	mov    (%edx),%edx
 7ae:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7b1:	eb db                	jmp    78e <free+0x3e>
    p->s.size += bp->s.size;
 7b3:	03 53 fc             	add    -0x4(%ebx),%edx
 7b6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7bc:	89 10                	mov    %edx,(%eax)
 7be:	eb da                	jmp    79a <free+0x4a>

000007c0 <morecore>:

static Header*
morecore(uint nu)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	53                   	push   %ebx
 7c4:	83 ec 04             	sub    $0x4,%esp
 7c7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7c9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7ce:	77 05                	ja     7d5 <morecore+0x15>
    nu = 4096;
 7d0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7d5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7dc:	83 ec 0c             	sub    $0xc,%esp
 7df:	50                   	push   %eax
 7e0:	e8 38 fd ff ff       	call   51d <sbrk>
  if(p == (char*)-1)
 7e5:	83 c4 10             	add    $0x10,%esp
 7e8:	83 f8 ff             	cmp    $0xffffffff,%eax
 7eb:	74 1c                	je     809 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7ed:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7f0:	83 c0 08             	add    $0x8,%eax
 7f3:	83 ec 0c             	sub    $0xc,%esp
 7f6:	50                   	push   %eax
 7f7:	e8 54 ff ff ff       	call   750 <free>
  return freep;
 7fc:	a1 68 0d 00 00       	mov    0xd68,%eax
 801:	83 c4 10             	add    $0x10,%esp
}
 804:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 807:	c9                   	leave  
 808:	c3                   	ret    
    return 0;
 809:	b8 00 00 00 00       	mov    $0x0,%eax
 80e:	eb f4                	jmp    804 <morecore+0x44>

00000810 <malloc>:

void*
malloc(uint nbytes)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	53                   	push   %ebx
 814:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 817:	8b 45 08             	mov    0x8(%ebp),%eax
 81a:	8d 58 07             	lea    0x7(%eax),%ebx
 81d:	c1 eb 03             	shr    $0x3,%ebx
 820:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 823:	8b 0d 68 0d 00 00    	mov    0xd68,%ecx
 829:	85 c9                	test   %ecx,%ecx
 82b:	74 04                	je     831 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82d:	8b 01                	mov    (%ecx),%eax
 82f:	eb 4a                	jmp    87b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 831:	c7 05 68 0d 00 00 6c 	movl   $0xd6c,0xd68
 838:	0d 00 00 
 83b:	c7 05 6c 0d 00 00 6c 	movl   $0xd6c,0xd6c
 842:	0d 00 00 
    base.s.size = 0;
 845:	c7 05 70 0d 00 00 00 	movl   $0x0,0xd70
 84c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 84f:	b9 6c 0d 00 00       	mov    $0xd6c,%ecx
 854:	eb d7                	jmp    82d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 856:	74 19                	je     871 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 858:	29 da                	sub    %ebx,%edx
 85a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 85d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 860:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 863:	89 0d 68 0d 00 00    	mov    %ecx,0xd68
      return (void*)(p + 1);
 869:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 86c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 86f:	c9                   	leave  
 870:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 871:	8b 10                	mov    (%eax),%edx
 873:	89 11                	mov    %edx,(%ecx)
 875:	eb ec                	jmp    863 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 877:	89 c1                	mov    %eax,%ecx
 879:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 87b:	8b 50 04             	mov    0x4(%eax),%edx
 87e:	39 da                	cmp    %ebx,%edx
 880:	73 d4                	jae    856 <malloc+0x46>
    if(p == freep)
 882:	39 05 68 0d 00 00    	cmp    %eax,0xd68
 888:	75 ed                	jne    877 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 88a:	89 d8                	mov    %ebx,%eax
 88c:	e8 2f ff ff ff       	call   7c0 <morecore>
 891:	85 c0                	test   %eax,%eax
 893:	75 e2                	jne    877 <malloc+0x67>
 895:	eb d5                	jmp    86c <malloc+0x5c>
