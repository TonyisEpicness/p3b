
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
  36:	68 c4 08 00 00       	push   $0x8c4
  3b:	68 cd 08 00 00       	push   $0x8cd
  40:	6a 01                	push   $0x1
  42:	e8 cf 05 00 00       	call   616 <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 8c 09 00 00       	push   $0x98c
  4f:	68 d5 08 00 00       	push   $0x8d5
  54:	6a 01                	push   $0x1
  56:	e8 bb 05 00 00       	call   616 <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 e9 08 00 00       	push   $0x8e9
  63:	6a 01                	push   $0x1
  65:	e8 ac 05 00 00       	call   616 <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 a0 0d 00 00    	push   0xda0
  73:	e8 79 04 00 00       	call   4f1 <kill>
  78:	e8 44 04 00 00       	call   4c1 <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 c4 08 00 00       	push   $0x8c4
  84:	68 cd 08 00 00       	push   $0x8cd
  89:	6a 01                	push   $0x1
  8b:	e8 86 05 00 00       	call   616 <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 34 09 00 00       	push   $0x934
  98:	68 d5 08 00 00       	push   $0x8d5
  9d:	6a 01                	push   $0x1
  9f:	e8 72 05 00 00       	call   616 <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 e9 08 00 00       	push   $0x8e9
  ac:	6a 01                	push   $0x1
  ae:	e8 63 05 00 00       	call   616 <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 a0 0d 00 00    	push   0xda0
  bc:	e8 30 04 00 00       	call   4f1 <kill>
  c1:	e8 fb 03 00 00       	call   4c1 <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 c4 08 00 00       	push   $0x8c4
  cd:	68 cd 08 00 00       	push   $0x8cd
  d2:	6a 01                	push   $0x1
  d4:	e8 3d 05 00 00       	call   616 <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 60 09 00 00       	push   $0x960
  e1:	68 d5 08 00 00       	push   $0x8d5
  e6:	6a 01                	push   $0x1
  e8:	e8 29 05 00 00       	call   616 <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 e9 08 00 00       	push   $0x8e9
  f5:	6a 01                	push   $0x1
  f7:	e8 1a 05 00 00       	call   616 <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 a0 0d 00 00    	push   0xda0
 105:	e8 e7 03 00 00       	call   4f1 <kill>
 10a:	e8 b2 03 00 00       	call   4c1 <exit>
   global = 5;
 10f:	c7 05 9c 0d 00 00 05 	movl   $0x5,0xd9c
 116:	00 00 00 
   exit();
 119:	e8 a3 03 00 00       	call   4c1 <exit>

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
 131:	e8 0b 04 00 00       	call   541 <getpid>
 136:	a3 a0 0d 00 00       	mov    %eax,0xda0
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 f4 06 00 00       	call   83c <malloc>
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
 171:	e8 eb 03 00 00       	call   561 <clone>
 176:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 178:	83 c4 10             	add    $0x10,%esp
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 8e c1 00 00 00    	jle    244 <main+0x126>
   while(global != 5);
 183:	a1 9c 0d 00 00       	mov    0xd9c,%eax
 188:	83 f8 05             	cmp    $0x5,%eax
 18b:	75 f6                	jne    183 <main+0x65>
   printf(1, "TEST PASSED\n");
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	68 0e 09 00 00       	push   $0x90e
 195:	6a 01                	push   $0x1
 197:	e8 7a 04 00 00       	call   616 <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 c2 03 00 00       	call   569 <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 c4 08 00 00       	push   $0x8c4
 1b9:	68 cd 08 00 00       	push   $0x8cd
 1be:	6a 01                	push   $0x1
 1c0:	e8 51 04 00 00       	call   616 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 1b 09 00 00       	push   $0x91b
 1cd:	68 d5 08 00 00       	push   $0x8d5
 1d2:	6a 01                	push   $0x1
 1d4:	e8 3d 04 00 00       	call   616 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 e9 08 00 00       	push   $0x8e9
 1e1:	6a 01                	push   $0x1
 1e3:	e8 2e 04 00 00       	call   616 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 a0 0d 00 00    	push   0xda0
 1f1:	e8 fb 02 00 00       	call   4f1 <kill>
 1f6:	e8 c6 02 00 00       	call   4c1 <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 c4 08 00 00       	push   $0x8c4
 202:	68 cd 08 00 00       	push   $0x8cd
 207:	6a 01                	push   $0x1
 209:	e8 08 04 00 00       	call   616 <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 f6 08 00 00       	push   $0x8f6
 216:	68 d5 08 00 00       	push   $0x8d5
 21b:	6a 01                	push   $0x1
 21d:	e8 f4 03 00 00       	call   616 <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 e9 08 00 00       	push   $0x8e9
 22a:	6a 01                	push   $0x1
 22c:	e8 e5 03 00 00       	call   616 <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 a0 0d 00 00    	push   0xda0
 23a:	e8 b2 02 00 00       	call   4f1 <kill>
 23f:	e8 7d 02 00 00       	call   4c1 <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 c4 08 00 00       	push   $0x8c4
 24b:	68 cd 08 00 00       	push   $0x8cd
 250:	6a 01                	push   $0x1
 252:	e8 bf 03 00 00       	call   616 <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 00 09 00 00       	push   $0x900
 25f:	68 d5 08 00 00       	push   $0x8d5
 264:	6a 01                	push   $0x1
 266:	e8 ab 03 00 00       	call   616 <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 e9 08 00 00       	push   $0x8e9
 273:	6a 01                	push   $0x1
 275:	e8 9c 03 00 00       	call   616 <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 a0 0d 00 00    	push   0xda0
 283:	e8 69 02 00 00       	call   4f1 <kill>
 288:	e8 34 02 00 00       	call   4c1 <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 e6 04 00 00       	call   77c <free>
   exit();
 296:	e8 26 02 00 00       	call   4c1 <exit>

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
  void *n_stack = malloc(PGSIZE);
 2b2:	68 00 10 00 00       	push   $0x1000
 2b7:	e8 80 05 00 00       	call   83c <malloc>
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
 2cd:	e8 8f 02 00 00       	call   561 <clone>


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
  return 0;
}
 2de:	b8 00 00 00 00       	mov    $0x0,%eax
 2e3:	c3                   	ret    

000002e4 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	53                   	push   %ebx
 2e8:	83 ec 04             	sub    $0x4,%esp
 2eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2ee:	83 ec 08             	sub    $0x8,%esp
 2f1:	6a 01                	push   $0x1
 2f3:	53                   	push   %ebx
 2f4:	e8 a2 ff ff ff       	call   29b <test_and_set>
 2f9:	83 c4 10             	add    $0x10,%esp
 2fc:	83 f8 01             	cmp    $0x1,%eax
 2ff:	74 ed                	je     2ee <lock_acquire+0xa>
    ;
}
 301:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 304:	c9                   	leave  
 305:	c3                   	ret    

00000306 <lock_release>:

void lock_release(lock_t *lock) {
 306:	55                   	push   %ebp
 307:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 309:	8b 45 08             	mov    0x8(%ebp),%eax
 30c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 312:	5d                   	pop    %ebp
 313:	c3                   	ret    

00000314 <lock_init>:

void lock_init(lock_t *lock) {
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 320:	5d                   	pop    %ebp
 321:	c3                   	ret    

00000322 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 322:	55                   	push   %ebp
 323:	89 e5                	mov    %esp,%ebp
 325:	56                   	push   %esi
 326:	53                   	push   %ebx
 327:	8b 75 08             	mov    0x8(%ebp),%esi
 32a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 32d:	89 f0                	mov    %esi,%eax
 32f:	89 d1                	mov    %edx,%ecx
 331:	83 c2 01             	add    $0x1,%edx
 334:	89 c3                	mov    %eax,%ebx
 336:	83 c0 01             	add    $0x1,%eax
 339:	0f b6 09             	movzbl (%ecx),%ecx
 33c:	88 0b                	mov    %cl,(%ebx)
 33e:	84 c9                	test   %cl,%cl
 340:	75 ed                	jne    32f <strcpy+0xd>
    ;
  return os;
}
 342:	89 f0                	mov    %esi,%eax
 344:	5b                   	pop    %ebx
 345:	5e                   	pop    %esi
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    

00000348 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 351:	eb 06                	jmp    359 <strcmp+0x11>
    p++, q++;
 353:	83 c1 01             	add    $0x1,%ecx
 356:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 359:	0f b6 01             	movzbl (%ecx),%eax
 35c:	84 c0                	test   %al,%al
 35e:	74 04                	je     364 <strcmp+0x1c>
 360:	3a 02                	cmp    (%edx),%al
 362:	74 ef                	je     353 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 364:	0f b6 c0             	movzbl %al,%eax
 367:	0f b6 12             	movzbl (%edx),%edx
 36a:	29 d0                	sub    %edx,%eax
}
 36c:	5d                   	pop    %ebp
 36d:	c3                   	ret    

0000036e <strlen>:

uint
strlen(const char *s)
{
 36e:	55                   	push   %ebp
 36f:	89 e5                	mov    %esp,%ebp
 371:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 374:	b8 00 00 00 00       	mov    $0x0,%eax
 379:	eb 03                	jmp    37e <strlen+0x10>
 37b:	83 c0 01             	add    $0x1,%eax
 37e:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 382:	75 f7                	jne    37b <strlen+0xd>
    ;
  return n;
}
 384:	5d                   	pop    %ebp
 385:	c3                   	ret    

00000386 <memset>:

void*
memset(void *dst, int c, uint n)
{
 386:	55                   	push   %ebp
 387:	89 e5                	mov    %esp,%ebp
 389:	57                   	push   %edi
 38a:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 38d:	89 d7                	mov    %edx,%edi
 38f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 392:	8b 45 0c             	mov    0xc(%ebp),%eax
 395:	fc                   	cld    
 396:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 398:	89 d0                	mov    %edx,%eax
 39a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 39d:	c9                   	leave  
 39e:	c3                   	ret    

0000039f <strchr>:

char*
strchr(const char *s, char c)
{
 39f:	55                   	push   %ebp
 3a0:	89 e5                	mov    %esp,%ebp
 3a2:	8b 45 08             	mov    0x8(%ebp),%eax
 3a5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3a9:	eb 03                	jmp    3ae <strchr+0xf>
 3ab:	83 c0 01             	add    $0x1,%eax
 3ae:	0f b6 10             	movzbl (%eax),%edx
 3b1:	84 d2                	test   %dl,%dl
 3b3:	74 06                	je     3bb <strchr+0x1c>
    if(*s == c)
 3b5:	38 ca                	cmp    %cl,%dl
 3b7:	75 f2                	jne    3ab <strchr+0xc>
 3b9:	eb 05                	jmp    3c0 <strchr+0x21>
      return (char*)s;
  return 0;
 3bb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3c0:	5d                   	pop    %ebp
 3c1:	c3                   	ret    

000003c2 <gets>:

char*
gets(char *buf, int max)
{
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	57                   	push   %edi
 3c6:	56                   	push   %esi
 3c7:	53                   	push   %ebx
 3c8:	83 ec 1c             	sub    $0x1c,%esp
 3cb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3ce:	bb 00 00 00 00       	mov    $0x0,%ebx
 3d3:	89 de                	mov    %ebx,%esi
 3d5:	83 c3 01             	add    $0x1,%ebx
 3d8:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3db:	7d 2e                	jge    40b <gets+0x49>
    cc = read(0, &c, 1);
 3dd:	83 ec 04             	sub    $0x4,%esp
 3e0:	6a 01                	push   $0x1
 3e2:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3e5:	50                   	push   %eax
 3e6:	6a 00                	push   $0x0
 3e8:	e8 ec 00 00 00       	call   4d9 <read>
    if(cc < 1)
 3ed:	83 c4 10             	add    $0x10,%esp
 3f0:	85 c0                	test   %eax,%eax
 3f2:	7e 17                	jle    40b <gets+0x49>
      break;
    buf[i++] = c;
 3f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3f8:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3fb:	3c 0a                	cmp    $0xa,%al
 3fd:	0f 94 c2             	sete   %dl
 400:	3c 0d                	cmp    $0xd,%al
 402:	0f 94 c0             	sete   %al
 405:	08 c2                	or     %al,%dl
 407:	74 ca                	je     3d3 <gets+0x11>
    buf[i++] = c;
 409:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 40b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 40f:	89 f8                	mov    %edi,%eax
 411:	8d 65 f4             	lea    -0xc(%ebp),%esp
 414:	5b                   	pop    %ebx
 415:	5e                   	pop    %esi
 416:	5f                   	pop    %edi
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    

00000419 <stat>:

int
stat(const char *n, struct stat *st)
{
 419:	55                   	push   %ebp
 41a:	89 e5                	mov    %esp,%ebp
 41c:	56                   	push   %esi
 41d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 41e:	83 ec 08             	sub    $0x8,%esp
 421:	6a 00                	push   $0x0
 423:	ff 75 08             	push   0x8(%ebp)
 426:	e8 d6 00 00 00       	call   501 <open>
  if(fd < 0)
 42b:	83 c4 10             	add    $0x10,%esp
 42e:	85 c0                	test   %eax,%eax
 430:	78 24                	js     456 <stat+0x3d>
 432:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 434:	83 ec 08             	sub    $0x8,%esp
 437:	ff 75 0c             	push   0xc(%ebp)
 43a:	50                   	push   %eax
 43b:	e8 d9 00 00 00       	call   519 <fstat>
 440:	89 c6                	mov    %eax,%esi
  close(fd);
 442:	89 1c 24             	mov    %ebx,(%esp)
 445:	e8 9f 00 00 00       	call   4e9 <close>
  return r;
 44a:	83 c4 10             	add    $0x10,%esp
}
 44d:	89 f0                	mov    %esi,%eax
 44f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 452:	5b                   	pop    %ebx
 453:	5e                   	pop    %esi
 454:	5d                   	pop    %ebp
 455:	c3                   	ret    
    return -1;
 456:	be ff ff ff ff       	mov    $0xffffffff,%esi
 45b:	eb f0                	jmp    44d <stat+0x34>

0000045d <atoi>:

int
atoi(const char *s)
{
 45d:	55                   	push   %ebp
 45e:	89 e5                	mov    %esp,%ebp
 460:	53                   	push   %ebx
 461:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 464:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 469:	eb 10                	jmp    47b <atoi+0x1e>
    n = n*10 + *s++ - '0';
 46b:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 46e:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 471:	83 c1 01             	add    $0x1,%ecx
 474:	0f be c0             	movsbl %al,%eax
 477:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 47b:	0f b6 01             	movzbl (%ecx),%eax
 47e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 481:	80 fb 09             	cmp    $0x9,%bl
 484:	76 e5                	jbe    46b <atoi+0xe>
  return n;
}
 486:	89 d0                	mov    %edx,%eax
 488:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 48b:	c9                   	leave  
 48c:	c3                   	ret    

0000048d <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 48d:	55                   	push   %ebp
 48e:	89 e5                	mov    %esp,%ebp
 490:	56                   	push   %esi
 491:	53                   	push   %ebx
 492:	8b 75 08             	mov    0x8(%ebp),%esi
 495:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 498:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 49b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 49d:	eb 0d                	jmp    4ac <memmove+0x1f>
    *dst++ = *src++;
 49f:	0f b6 01             	movzbl (%ecx),%eax
 4a2:	88 02                	mov    %al,(%edx)
 4a4:	8d 49 01             	lea    0x1(%ecx),%ecx
 4a7:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4aa:	89 d8                	mov    %ebx,%eax
 4ac:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4af:	85 c0                	test   %eax,%eax
 4b1:	7f ec                	jg     49f <memmove+0x12>
  return vdst;
}
 4b3:	89 f0                	mov    %esi,%eax
 4b5:	5b                   	pop    %ebx
 4b6:	5e                   	pop    %esi
 4b7:	5d                   	pop    %ebp
 4b8:	c3                   	ret    

000004b9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4b9:	b8 01 00 00 00       	mov    $0x1,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <exit>:
SYSCALL(exit)
 4c1:	b8 02 00 00 00       	mov    $0x2,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <wait>:
SYSCALL(wait)
 4c9:	b8 03 00 00 00       	mov    $0x3,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <pipe>:
SYSCALL(pipe)
 4d1:	b8 04 00 00 00       	mov    $0x4,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <read>:
SYSCALL(read)
 4d9:	b8 05 00 00 00       	mov    $0x5,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <write>:
SYSCALL(write)
 4e1:	b8 10 00 00 00       	mov    $0x10,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <close>:
SYSCALL(close)
 4e9:	b8 15 00 00 00       	mov    $0x15,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <kill>:
SYSCALL(kill)
 4f1:	b8 06 00 00 00       	mov    $0x6,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <exec>:
SYSCALL(exec)
 4f9:	b8 07 00 00 00       	mov    $0x7,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <open>:
SYSCALL(open)
 501:	b8 0f 00 00 00       	mov    $0xf,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <mknod>:
SYSCALL(mknod)
 509:	b8 11 00 00 00       	mov    $0x11,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <unlink>:
SYSCALL(unlink)
 511:	b8 12 00 00 00       	mov    $0x12,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <fstat>:
SYSCALL(fstat)
 519:	b8 08 00 00 00       	mov    $0x8,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <link>:
SYSCALL(link)
 521:	b8 13 00 00 00       	mov    $0x13,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <mkdir>:
SYSCALL(mkdir)
 529:	b8 14 00 00 00       	mov    $0x14,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <chdir>:
SYSCALL(chdir)
 531:	b8 09 00 00 00       	mov    $0x9,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <dup>:
SYSCALL(dup)
 539:	b8 0a 00 00 00       	mov    $0xa,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <getpid>:
SYSCALL(getpid)
 541:	b8 0b 00 00 00       	mov    $0xb,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    

00000549 <sbrk>:
SYSCALL(sbrk)
 549:	b8 0c 00 00 00       	mov    $0xc,%eax
 54e:	cd 40                	int    $0x40
 550:	c3                   	ret    

00000551 <sleep>:
SYSCALL(sleep)
 551:	b8 0d 00 00 00       	mov    $0xd,%eax
 556:	cd 40                	int    $0x40
 558:	c3                   	ret    

00000559 <uptime>:
SYSCALL(uptime)
 559:	b8 0e 00 00 00       	mov    $0xe,%eax
 55e:	cd 40                	int    $0x40
 560:	c3                   	ret    

00000561 <clone>:
SYSCALL(clone)
 561:	b8 16 00 00 00       	mov    $0x16,%eax
 566:	cd 40                	int    $0x40
 568:	c3                   	ret    

00000569 <join>:
 569:	b8 17 00 00 00       	mov    $0x17,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 571:	55                   	push   %ebp
 572:	89 e5                	mov    %esp,%ebp
 574:	83 ec 1c             	sub    $0x1c,%esp
 577:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 57a:	6a 01                	push   $0x1
 57c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 57f:	52                   	push   %edx
 580:	50                   	push   %eax
 581:	e8 5b ff ff ff       	call   4e1 <write>
}
 586:	83 c4 10             	add    $0x10,%esp
 589:	c9                   	leave  
 58a:	c3                   	ret    

0000058b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 58b:	55                   	push   %ebp
 58c:	89 e5                	mov    %esp,%ebp
 58e:	57                   	push   %edi
 58f:	56                   	push   %esi
 590:	53                   	push   %ebx
 591:	83 ec 2c             	sub    $0x2c,%esp
 594:	89 45 d0             	mov    %eax,-0x30(%ebp)
 597:	89 d0                	mov    %edx,%eax
 599:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 59b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 59f:	0f 95 c1             	setne  %cl
 5a2:	c1 ea 1f             	shr    $0x1f,%edx
 5a5:	84 d1                	test   %dl,%cl
 5a7:	74 44                	je     5ed <printint+0x62>
    neg = 1;
    x = -xx;
 5a9:	f7 d8                	neg    %eax
 5ab:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5ad:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5b4:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5b9:	89 c8                	mov    %ecx,%eax
 5bb:	ba 00 00 00 00       	mov    $0x0,%edx
 5c0:	f7 f6                	div    %esi
 5c2:	89 df                	mov    %ebx,%edi
 5c4:	83 c3 01             	add    $0x1,%ebx
 5c7:	0f b6 92 1c 0a 00 00 	movzbl 0xa1c(%edx),%edx
 5ce:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5d2:	89 ca                	mov    %ecx,%edx
 5d4:	89 c1                	mov    %eax,%ecx
 5d6:	39 d6                	cmp    %edx,%esi
 5d8:	76 df                	jbe    5b9 <printint+0x2e>
  if(neg)
 5da:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5de:	74 31                	je     611 <printint+0x86>
    buf[i++] = '-';
 5e0:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5e5:	8d 5f 02             	lea    0x2(%edi),%ebx
 5e8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5eb:	eb 17                	jmp    604 <printint+0x79>
    x = xx;
 5ed:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5ef:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5f6:	eb bc                	jmp    5b4 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5f8:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5fd:	89 f0                	mov    %esi,%eax
 5ff:	e8 6d ff ff ff       	call   571 <putc>
  while(--i >= 0)
 604:	83 eb 01             	sub    $0x1,%ebx
 607:	79 ef                	jns    5f8 <printint+0x6d>
}
 609:	83 c4 2c             	add    $0x2c,%esp
 60c:	5b                   	pop    %ebx
 60d:	5e                   	pop    %esi
 60e:	5f                   	pop    %edi
 60f:	5d                   	pop    %ebp
 610:	c3                   	ret    
 611:	8b 75 d0             	mov    -0x30(%ebp),%esi
 614:	eb ee                	jmp    604 <printint+0x79>

00000616 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 616:	55                   	push   %ebp
 617:	89 e5                	mov    %esp,%ebp
 619:	57                   	push   %edi
 61a:	56                   	push   %esi
 61b:	53                   	push   %ebx
 61c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 61f:	8d 45 10             	lea    0x10(%ebp),%eax
 622:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 625:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 62a:	bb 00 00 00 00       	mov    $0x0,%ebx
 62f:	eb 14                	jmp    645 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 631:	89 fa                	mov    %edi,%edx
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	e8 36 ff ff ff       	call   571 <putc>
 63b:	eb 05                	jmp    642 <printf+0x2c>
      }
    } else if(state == '%'){
 63d:	83 fe 25             	cmp    $0x25,%esi
 640:	74 25                	je     667 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 642:	83 c3 01             	add    $0x1,%ebx
 645:	8b 45 0c             	mov    0xc(%ebp),%eax
 648:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 64c:	84 c0                	test   %al,%al
 64e:	0f 84 20 01 00 00    	je     774 <printf+0x15e>
    c = fmt[i] & 0xff;
 654:	0f be f8             	movsbl %al,%edi
 657:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 65a:	85 f6                	test   %esi,%esi
 65c:	75 df                	jne    63d <printf+0x27>
      if(c == '%'){
 65e:	83 f8 25             	cmp    $0x25,%eax
 661:	75 ce                	jne    631 <printf+0x1b>
        state = '%';
 663:	89 c6                	mov    %eax,%esi
 665:	eb db                	jmp    642 <printf+0x2c>
      if(c == 'd'){
 667:	83 f8 25             	cmp    $0x25,%eax
 66a:	0f 84 cf 00 00 00    	je     73f <printf+0x129>
 670:	0f 8c dd 00 00 00    	jl     753 <printf+0x13d>
 676:	83 f8 78             	cmp    $0x78,%eax
 679:	0f 8f d4 00 00 00    	jg     753 <printf+0x13d>
 67f:	83 f8 63             	cmp    $0x63,%eax
 682:	0f 8c cb 00 00 00    	jl     753 <printf+0x13d>
 688:	83 e8 63             	sub    $0x63,%eax
 68b:	83 f8 15             	cmp    $0x15,%eax
 68e:	0f 87 bf 00 00 00    	ja     753 <printf+0x13d>
 694:	ff 24 85 c4 09 00 00 	jmp    *0x9c4(,%eax,4)
        printint(fd, *ap, 10, 1);
 69b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 69e:	8b 17                	mov    (%edi),%edx
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	6a 01                	push   $0x1
 6a5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	e8 d9 fe ff ff       	call   58b <printint>
        ap++;
 6b2:	83 c7 04             	add    $0x4,%edi
 6b5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6b8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6bb:	be 00 00 00 00       	mov    $0x0,%esi
 6c0:	eb 80                	jmp    642 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6c2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c5:	8b 17                	mov    (%edi),%edx
 6c7:	83 ec 0c             	sub    $0xc,%esp
 6ca:	6a 00                	push   $0x0
 6cc:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d1:	8b 45 08             	mov    0x8(%ebp),%eax
 6d4:	e8 b2 fe ff ff       	call   58b <printint>
        ap++;
 6d9:	83 c7 04             	add    $0x4,%edi
 6dc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6df:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6e2:	be 00 00 00 00       	mov    $0x0,%esi
 6e7:	e9 56 ff ff ff       	jmp    642 <printf+0x2c>
        s = (char*)*ap;
 6ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ef:	8b 30                	mov    (%eax),%esi
        ap++;
 6f1:	83 c0 04             	add    $0x4,%eax
 6f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6f7:	85 f6                	test   %esi,%esi
 6f9:	75 15                	jne    710 <printf+0xfa>
          s = "(null)";
 6fb:	be ba 09 00 00       	mov    $0x9ba,%esi
 700:	eb 0e                	jmp    710 <printf+0xfa>
          putc(fd, *s);
 702:	0f be d2             	movsbl %dl,%edx
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	e8 64 fe ff ff       	call   571 <putc>
          s++;
 70d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 710:	0f b6 16             	movzbl (%esi),%edx
 713:	84 d2                	test   %dl,%dl
 715:	75 eb                	jne    702 <printf+0xec>
      state = 0;
 717:	be 00 00 00 00       	mov    $0x0,%esi
 71c:	e9 21 ff ff ff       	jmp    642 <printf+0x2c>
        putc(fd, *ap);
 721:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 724:	0f be 17             	movsbl (%edi),%edx
 727:	8b 45 08             	mov    0x8(%ebp),%eax
 72a:	e8 42 fe ff ff       	call   571 <putc>
        ap++;
 72f:	83 c7 04             	add    $0x4,%edi
 732:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 735:	be 00 00 00 00       	mov    $0x0,%esi
 73a:	e9 03 ff ff ff       	jmp    642 <printf+0x2c>
        putc(fd, c);
 73f:	89 fa                	mov    %edi,%edx
 741:	8b 45 08             	mov    0x8(%ebp),%eax
 744:	e8 28 fe ff ff       	call   571 <putc>
      state = 0;
 749:	be 00 00 00 00       	mov    $0x0,%esi
 74e:	e9 ef fe ff ff       	jmp    642 <printf+0x2c>
        putc(fd, '%');
 753:	ba 25 00 00 00       	mov    $0x25,%edx
 758:	8b 45 08             	mov    0x8(%ebp),%eax
 75b:	e8 11 fe ff ff       	call   571 <putc>
        putc(fd, c);
 760:	89 fa                	mov    %edi,%edx
 762:	8b 45 08             	mov    0x8(%ebp),%eax
 765:	e8 07 fe ff ff       	call   571 <putc>
      state = 0;
 76a:	be 00 00 00 00       	mov    $0x0,%esi
 76f:	e9 ce fe ff ff       	jmp    642 <printf+0x2c>
    }
  }
}
 774:	8d 65 f4             	lea    -0xc(%ebp),%esp
 777:	5b                   	pop    %ebx
 778:	5e                   	pop    %esi
 779:	5f                   	pop    %edi
 77a:	5d                   	pop    %ebp
 77b:	c3                   	ret    

0000077c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 77c:	55                   	push   %ebp
 77d:	89 e5                	mov    %esp,%ebp
 77f:	57                   	push   %edi
 780:	56                   	push   %esi
 781:	53                   	push   %ebx
 782:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 785:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 788:	a1 a4 0d 00 00       	mov    0xda4,%eax
 78d:	eb 02                	jmp    791 <free+0x15>
 78f:	89 d0                	mov    %edx,%eax
 791:	39 c8                	cmp    %ecx,%eax
 793:	73 04                	jae    799 <free+0x1d>
 795:	39 08                	cmp    %ecx,(%eax)
 797:	77 12                	ja     7ab <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 799:	8b 10                	mov    (%eax),%edx
 79b:	39 c2                	cmp    %eax,%edx
 79d:	77 f0                	ja     78f <free+0x13>
 79f:	39 c8                	cmp    %ecx,%eax
 7a1:	72 08                	jb     7ab <free+0x2f>
 7a3:	39 ca                	cmp    %ecx,%edx
 7a5:	77 04                	ja     7ab <free+0x2f>
 7a7:	89 d0                	mov    %edx,%eax
 7a9:	eb e6                	jmp    791 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ab:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ae:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7b1:	8b 10                	mov    (%eax),%edx
 7b3:	39 d7                	cmp    %edx,%edi
 7b5:	74 19                	je     7d0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7b7:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ba:	8b 50 04             	mov    0x4(%eax),%edx
 7bd:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c0:	39 ce                	cmp    %ecx,%esi
 7c2:	74 1b                	je     7df <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7c4:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7c6:	a3 a4 0d 00 00       	mov    %eax,0xda4
}
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7d0:	03 72 04             	add    0x4(%edx),%esi
 7d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d6:	8b 10                	mov    (%eax),%edx
 7d8:	8b 12                	mov    (%edx),%edx
 7da:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7dd:	eb db                	jmp    7ba <free+0x3e>
    p->s.size += bp->s.size;
 7df:	03 53 fc             	add    -0x4(%ebx),%edx
 7e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7e8:	89 10                	mov    %edx,(%eax)
 7ea:	eb da                	jmp    7c6 <free+0x4a>

000007ec <morecore>:

static Header*
morecore(uint nu)
{
 7ec:	55                   	push   %ebp
 7ed:	89 e5                	mov    %esp,%ebp
 7ef:	53                   	push   %ebx
 7f0:	83 ec 04             	sub    $0x4,%esp
 7f3:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7f5:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7fa:	77 05                	ja     801 <morecore+0x15>
    nu = 4096;
 7fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 801:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 808:	83 ec 0c             	sub    $0xc,%esp
 80b:	50                   	push   %eax
 80c:	e8 38 fd ff ff       	call   549 <sbrk>
  if(p == (char*)-1)
 811:	83 c4 10             	add    $0x10,%esp
 814:	83 f8 ff             	cmp    $0xffffffff,%eax
 817:	74 1c                	je     835 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 819:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 81c:	83 c0 08             	add    $0x8,%eax
 81f:	83 ec 0c             	sub    $0xc,%esp
 822:	50                   	push   %eax
 823:	e8 54 ff ff ff       	call   77c <free>
  return freep;
 828:	a1 a4 0d 00 00       	mov    0xda4,%eax
 82d:	83 c4 10             	add    $0x10,%esp
}
 830:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 833:	c9                   	leave  
 834:	c3                   	ret    
    return 0;
 835:	b8 00 00 00 00       	mov    $0x0,%eax
 83a:	eb f4                	jmp    830 <morecore+0x44>

0000083c <malloc>:

void*
malloc(uint nbytes)
{
 83c:	55                   	push   %ebp
 83d:	89 e5                	mov    %esp,%ebp
 83f:	53                   	push   %ebx
 840:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 843:	8b 45 08             	mov    0x8(%ebp),%eax
 846:	8d 58 07             	lea    0x7(%eax),%ebx
 849:	c1 eb 03             	shr    $0x3,%ebx
 84c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 84f:	8b 0d a4 0d 00 00    	mov    0xda4,%ecx
 855:	85 c9                	test   %ecx,%ecx
 857:	74 04                	je     85d <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 859:	8b 01                	mov    (%ecx),%eax
 85b:	eb 4a                	jmp    8a7 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 85d:	c7 05 a4 0d 00 00 a8 	movl   $0xda8,0xda4
 864:	0d 00 00 
 867:	c7 05 a8 0d 00 00 a8 	movl   $0xda8,0xda8
 86e:	0d 00 00 
    base.s.size = 0;
 871:	c7 05 ac 0d 00 00 00 	movl   $0x0,0xdac
 878:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 87b:	b9 a8 0d 00 00       	mov    $0xda8,%ecx
 880:	eb d7                	jmp    859 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 882:	74 19                	je     89d <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 884:	29 da                	sub    %ebx,%edx
 886:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 889:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 88c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 88f:	89 0d a4 0d 00 00    	mov    %ecx,0xda4
      return (void*)(p + 1);
 895:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 898:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 89b:	c9                   	leave  
 89c:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 89d:	8b 10                	mov    (%eax),%edx
 89f:	89 11                	mov    %edx,(%ecx)
 8a1:	eb ec                	jmp    88f <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a3:	89 c1                	mov    %eax,%ecx
 8a5:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8a7:	8b 50 04             	mov    0x4(%eax),%edx
 8aa:	39 da                	cmp    %ebx,%edx
 8ac:	73 d4                	jae    882 <malloc+0x46>
    if(p == freep)
 8ae:	39 05 a4 0d 00 00    	cmp    %eax,0xda4
 8b4:	75 ed                	jne    8a3 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8b6:	89 d8                	mov    %ebx,%eax
 8b8:	e8 2f ff ff ff       	call   7ec <morecore>
 8bd:	85 c0                	test   %eax,%eax
 8bf:	75 e2                	jne    8a3 <malloc+0x67>
 8c1:	eb d5                	jmp    898 <malloc+0x5c>
