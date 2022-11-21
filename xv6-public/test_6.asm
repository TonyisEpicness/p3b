
_test_6:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 70 0e 00 00       	mov    0xe70,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 39                	push   $0x39
  2c:	68 b8 09 00 00       	push   $0x9b8
  31:	68 c1 09 00 00       	push   $0x9c1
  36:	6a 01                	push   $0x1
  38:	e8 cc 06 00 00       	call   709 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 00 0a 00 00       	push   $0xa00
  45:	68 d4 09 00 00       	push   $0x9d4
  4a:	6a 01                	push   $0x1
  4c:	e8 b8 06 00 00       	call   709 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 e8 09 00 00       	push   $0x9e8
  59:	6a 01                	push   $0x1
  5b:	e8 a9 06 00 00       	call   709 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 74 0e 00 00    	push   0xe74
  69:	e8 76 05 00 00       	call   5e4 <kill>
  6e:	e8 41 05 00 00       	call   5b4 <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 b8 09 00 00       	push   $0x9b8
  7a:	68 c1 09 00 00       	push   $0x9c1
  7f:	6a 01                	push   $0x1
  81:	e8 83 06 00 00       	call   709 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 c9 09 00 00       	push   $0x9c9
  8e:	68 d4 09 00 00       	push   $0x9d4
  93:	6a 01                	push   $0x1
  95:	e8 6f 06 00 00       	call   709 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 e8 09 00 00       	push   $0x9e8
  a2:	6a 01                	push   $0x1
  a4:	e8 60 06 00 00       	call   709 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 74 0e 00 00    	push   0xe74
  b2:	e8 2d 05 00 00       	call   5e4 <kill>
  b7:	e8 f8 04 00 00       	call   5b4 <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 b8 09 00 00       	push   $0x9b8
  c3:	68 c1 09 00 00       	push   $0x9c1
  c8:	6a 01                	push   $0x1
  ca:	e8 3a 06 00 00       	call   709 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 f5 09 00 00       	push   $0x9f5
  d7:	68 d4 09 00 00       	push   $0x9d4
  dc:	6a 01                	push   $0x1
  de:	e8 26 06 00 00       	call   709 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 e8 09 00 00       	push   $0x9e8
  eb:	6a 01                	push   $0x1
  ed:	e8 17 06 00 00       	call   709 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 74 0e 00 00    	push   0xe74
  fb:	e8 e4 04 00 00       	call   5e4 <kill>
 100:	e8 af 04 00 00       	call   5b4 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 70 0e 00 00       	mov    %eax,0xe70
   exit();
 10d:	e8 a2 04 00 00       	call   5b4 <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 28             	sub    $0x28,%esp
   ppid = getpid();
 126:	e8 09 05 00 00       	call   634 <getpid>
 12b:	a3 74 0e 00 00       	mov    %eax,0xe74
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 f2 07 00 00       	call   92f <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 b8 09 00 00       	push   $0x9b8
 15f:	68 c1 09 00 00       	push   $0x9c1
 164:	6a 01                	push   $0x1
 166:	e8 9e 05 00 00       	call   709 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 0c 0a 00 00       	push   $0xa0c
 173:	68 d4 09 00 00       	push   $0x9d4
 178:	6a 01                	push   $0x1
 17a:	e8 8a 05 00 00       	call   709 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 e8 09 00 00       	push   $0x9e8
 187:	6a 01                	push   $0x1
 189:	e8 7b 05 00 00       	call   709 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 74 0e 00 00    	push   0xe74
 197:	e8 48 04 00 00       	call   5e4 <kill>
 19c:	e8 13 04 00 00       	call   5b4 <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 90 04 00 00       	call   654 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 5e 04 00 00       	call   63c <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 52 04 00 00       	call   63c <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 5e 04 00 00       	call   65c <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 b8 09 00 00       	push   $0x9b8
 211:	68 c1 09 00 00       	push   $0x9c1
 216:	6a 01                	push   $0x1
 218:	e8 ec 04 00 00       	call   709 <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 70 0a 00 00       	push   $0xa70
 225:	68 d4 09 00 00       	push   $0x9d4
 22a:	6a 01                	push   $0x1
 22c:	e8 d8 04 00 00       	call   709 <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 e8 09 00 00       	push   $0x9e8
 239:	6a 01                	push   $0x1
 23b:	e8 c9 04 00 00       	call   709 <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 74 0e 00 00    	push   0xe74
 249:	e8 96 03 00 00       	call   5e4 <kill>
 24e:	e8 61 03 00 00       	call   5b4 <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 b8 09 00 00       	push   $0x9b8
 25a:	68 c1 09 00 00       	push   $0x9c1
 25f:	6a 01                	push   $0x1
 261:	e8 a3 04 00 00       	call   709 <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 16 0a 00 00       	push   $0xa16
 26e:	68 d4 09 00 00       	push   $0x9d4
 273:	6a 01                	push   $0x1
 275:	e8 8f 04 00 00       	call   709 <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 e8 09 00 00       	push   $0x9e8
 282:	6a 01                	push   $0x1
 284:	e8 80 04 00 00       	call   709 <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 74 0e 00 00    	push   0xe74
 292:	e8 4d 03 00 00       	call   5e4 <kill>
 297:	e8 18 03 00 00       	call   5b4 <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 b5 03 00 00       	call   65c <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 b8 09 00 00       	push   $0x9b8
 2c1:	68 c1 09 00 00       	push   $0x9c1
 2c6:	6a 01                	push   $0x1
 2c8:	e8 3c 04 00 00       	call   709 <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 42 0a 00 00       	push   $0xa42
 2d5:	68 d4 09 00 00       	push   $0x9d4
 2da:	6a 01                	push   $0x1
 2dc:	e8 28 04 00 00       	call   709 <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 e8 09 00 00       	push   $0x9e8
 2e9:	6a 01                	push   $0x1
 2eb:	e8 19 04 00 00       	call   709 <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 74 0e 00 00    	push   0xe74
 2f9:	e8 e6 02 00 00       	call   5e4 <kill>
 2fe:	e8 b1 02 00 00       	call   5b4 <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 b8 09 00 00       	push   $0x9b8
 30a:	68 c1 09 00 00       	push   $0x9c1
 30f:	6a 01                	push   $0x1
 311:	e8 f3 03 00 00       	call   709 <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 24 0a 00 00       	push   $0xa24
 31e:	68 d4 09 00 00       	push   $0x9d4
 323:	6a 01                	push   $0x1
 325:	e8 df 03 00 00       	call   709 <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 e8 09 00 00       	push   $0x9e8
 332:	6a 01                	push   $0x1
 334:	e8 d0 03 00 00       	call   709 <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 74 0e 00 00    	push   0xe74
 342:	e8 9d 02 00 00       	call   5e4 <kill>
 347:	e8 68 02 00 00       	call   5b4 <exit>
   assert(global == 2);
 34c:	83 3d 70 0e 00 00 02 	cmpl   $0x2,0xe70
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 b8 09 00 00       	push   $0x9b8
 35c:	68 c1 09 00 00       	push   $0x9c1
 361:	6a 01                	push   $0x1
 363:	e8 a1 03 00 00       	call   709 <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 57 0a 00 00       	push   $0xa57
 370:	68 d4 09 00 00       	push   $0x9d4
 375:	6a 01                	push   $0x1
 377:	e8 8d 03 00 00       	call   709 <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 e8 09 00 00       	push   $0x9e8
 384:	6a 01                	push   $0x1
 386:	e8 7e 03 00 00       	call   709 <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 74 0e 00 00    	push   0xe74
 394:	e8 4b 02 00 00       	call   5e4 <kill>
 399:	e8 16 02 00 00       	call   5b4 <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 63 0a 00 00       	push   $0xa63
 3a6:	6a 01                	push   $0x1
 3a8:	e8 5c 03 00 00       	call   709 <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 ba 04 00 00       	call   86f <free>
   exit();
 3b5:	e8 fa 01 00 00       	call   5b4 <exit>

000003ba <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 3c0:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3c2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3c5:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    

000003cb <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 3cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d0:	c3                   	ret    

000003d1 <thread_join>:

int thread_join() {
  return 0;
}
 3d1:	b8 00 00 00 00       	mov    $0x0,%eax
 3d6:	c3                   	ret    

000003d7 <lock_acquire>:

void lock_acquire(lock_t *lock){
 3d7:	55                   	push   %ebp
 3d8:	89 e5                	mov    %esp,%ebp
 3da:	53                   	push   %ebx
 3db:	83 ec 04             	sub    $0x4,%esp
 3de:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3e1:	83 ec 08             	sub    $0x8,%esp
 3e4:	6a 01                	push   $0x1
 3e6:	53                   	push   %ebx
 3e7:	e8 ce ff ff ff       	call   3ba <test_and_set>
 3ec:	83 c4 10             	add    $0x10,%esp
 3ef:	83 f8 01             	cmp    $0x1,%eax
 3f2:	74 ed                	je     3e1 <lock_acquire+0xa>
    ;
}
 3f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3f7:	c9                   	leave  
 3f8:	c3                   	ret    

000003f9 <lock_release>:

void lock_release(lock_t *lock) {
 3f9:	55                   	push   %ebp
 3fa:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3fc:	8b 45 08             	mov    0x8(%ebp),%eax
 3ff:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    

00000407 <lock_init>:

void lock_init(lock_t *lock) {
 407:	55                   	push   %ebp
 408:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 40a:	8b 45 08             	mov    0x8(%ebp),%eax
 40d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 413:	5d                   	pop    %ebp
 414:	c3                   	ret    

00000415 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 415:	55                   	push   %ebp
 416:	89 e5                	mov    %esp,%ebp
 418:	56                   	push   %esi
 419:	53                   	push   %ebx
 41a:	8b 75 08             	mov    0x8(%ebp),%esi
 41d:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 420:	89 f0                	mov    %esi,%eax
 422:	89 d1                	mov    %edx,%ecx
 424:	83 c2 01             	add    $0x1,%edx
 427:	89 c3                	mov    %eax,%ebx
 429:	83 c0 01             	add    $0x1,%eax
 42c:	0f b6 09             	movzbl (%ecx),%ecx
 42f:	88 0b                	mov    %cl,(%ebx)
 431:	84 c9                	test   %cl,%cl
 433:	75 ed                	jne    422 <strcpy+0xd>
    ;
  return os;
}
 435:	89 f0                	mov    %esi,%eax
 437:	5b                   	pop    %ebx
 438:	5e                   	pop    %esi
 439:	5d                   	pop    %ebp
 43a:	c3                   	ret    

0000043b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 43b:	55                   	push   %ebp
 43c:	89 e5                	mov    %esp,%ebp
 43e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 441:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 444:	eb 06                	jmp    44c <strcmp+0x11>
    p++, q++;
 446:	83 c1 01             	add    $0x1,%ecx
 449:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 44c:	0f b6 01             	movzbl (%ecx),%eax
 44f:	84 c0                	test   %al,%al
 451:	74 04                	je     457 <strcmp+0x1c>
 453:	3a 02                	cmp    (%edx),%al
 455:	74 ef                	je     446 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 457:	0f b6 c0             	movzbl %al,%eax
 45a:	0f b6 12             	movzbl (%edx),%edx
 45d:	29 d0                	sub    %edx,%eax
}
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    

00000461 <strlen>:

uint
strlen(const char *s)
{
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 467:	b8 00 00 00 00       	mov    $0x0,%eax
 46c:	eb 03                	jmp    471 <strlen+0x10>
 46e:	83 c0 01             	add    $0x1,%eax
 471:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 475:	75 f7                	jne    46e <strlen+0xd>
    ;
  return n;
}
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    

00000479 <memset>:

void*
memset(void *dst, int c, uint n)
{
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
 47c:	57                   	push   %edi
 47d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 480:	89 d7                	mov    %edx,%edi
 482:	8b 4d 10             	mov    0x10(%ebp),%ecx
 485:	8b 45 0c             	mov    0xc(%ebp),%eax
 488:	fc                   	cld    
 489:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 48b:	89 d0                	mov    %edx,%eax
 48d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 490:	c9                   	leave  
 491:	c3                   	ret    

00000492 <strchr>:

char*
strchr(const char *s, char c)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	8b 45 08             	mov    0x8(%ebp),%eax
 498:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 49c:	eb 03                	jmp    4a1 <strchr+0xf>
 49e:	83 c0 01             	add    $0x1,%eax
 4a1:	0f b6 10             	movzbl (%eax),%edx
 4a4:	84 d2                	test   %dl,%dl
 4a6:	74 06                	je     4ae <strchr+0x1c>
    if(*s == c)
 4a8:	38 ca                	cmp    %cl,%dl
 4aa:	75 f2                	jne    49e <strchr+0xc>
 4ac:	eb 05                	jmp    4b3 <strchr+0x21>
      return (char*)s;
  return 0;
 4ae:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4b3:	5d                   	pop    %ebp
 4b4:	c3                   	ret    

000004b5 <gets>:

char*
gets(char *buf, int max)
{
 4b5:	55                   	push   %ebp
 4b6:	89 e5                	mov    %esp,%ebp
 4b8:	57                   	push   %edi
 4b9:	56                   	push   %esi
 4ba:	53                   	push   %ebx
 4bb:	83 ec 1c             	sub    $0x1c,%esp
 4be:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4c1:	bb 00 00 00 00       	mov    $0x0,%ebx
 4c6:	89 de                	mov    %ebx,%esi
 4c8:	83 c3 01             	add    $0x1,%ebx
 4cb:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4ce:	7d 2e                	jge    4fe <gets+0x49>
    cc = read(0, &c, 1);
 4d0:	83 ec 04             	sub    $0x4,%esp
 4d3:	6a 01                	push   $0x1
 4d5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4d8:	50                   	push   %eax
 4d9:	6a 00                	push   $0x0
 4db:	e8 ec 00 00 00       	call   5cc <read>
    if(cc < 1)
 4e0:	83 c4 10             	add    $0x10,%esp
 4e3:	85 c0                	test   %eax,%eax
 4e5:	7e 17                	jle    4fe <gets+0x49>
      break;
    buf[i++] = c;
 4e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4eb:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4ee:	3c 0a                	cmp    $0xa,%al
 4f0:	0f 94 c2             	sete   %dl
 4f3:	3c 0d                	cmp    $0xd,%al
 4f5:	0f 94 c0             	sete   %al
 4f8:	08 c2                	or     %al,%dl
 4fa:	74 ca                	je     4c6 <gets+0x11>
    buf[i++] = c;
 4fc:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4fe:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 502:	89 f8                	mov    %edi,%eax
 504:	8d 65 f4             	lea    -0xc(%ebp),%esp
 507:	5b                   	pop    %ebx
 508:	5e                   	pop    %esi
 509:	5f                   	pop    %edi
 50a:	5d                   	pop    %ebp
 50b:	c3                   	ret    

0000050c <stat>:

int
stat(const char *n, struct stat *st)
{
 50c:	55                   	push   %ebp
 50d:	89 e5                	mov    %esp,%ebp
 50f:	56                   	push   %esi
 510:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 511:	83 ec 08             	sub    $0x8,%esp
 514:	6a 00                	push   $0x0
 516:	ff 75 08             	push   0x8(%ebp)
 519:	e8 d6 00 00 00       	call   5f4 <open>
  if(fd < 0)
 51e:	83 c4 10             	add    $0x10,%esp
 521:	85 c0                	test   %eax,%eax
 523:	78 24                	js     549 <stat+0x3d>
 525:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 527:	83 ec 08             	sub    $0x8,%esp
 52a:	ff 75 0c             	push   0xc(%ebp)
 52d:	50                   	push   %eax
 52e:	e8 d9 00 00 00       	call   60c <fstat>
 533:	89 c6                	mov    %eax,%esi
  close(fd);
 535:	89 1c 24             	mov    %ebx,(%esp)
 538:	e8 9f 00 00 00       	call   5dc <close>
  return r;
 53d:	83 c4 10             	add    $0x10,%esp
}
 540:	89 f0                	mov    %esi,%eax
 542:	8d 65 f8             	lea    -0x8(%ebp),%esp
 545:	5b                   	pop    %ebx
 546:	5e                   	pop    %esi
 547:	5d                   	pop    %ebp
 548:	c3                   	ret    
    return -1;
 549:	be ff ff ff ff       	mov    $0xffffffff,%esi
 54e:	eb f0                	jmp    540 <stat+0x34>

00000550 <atoi>:

int
atoi(const char *s)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	53                   	push   %ebx
 554:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 557:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 55c:	eb 10                	jmp    56e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 55e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 561:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 564:	83 c1 01             	add    $0x1,%ecx
 567:	0f be c0             	movsbl %al,%eax
 56a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 56e:	0f b6 01             	movzbl (%ecx),%eax
 571:	8d 58 d0             	lea    -0x30(%eax),%ebx
 574:	80 fb 09             	cmp    $0x9,%bl
 577:	76 e5                	jbe    55e <atoi+0xe>
  return n;
}
 579:	89 d0                	mov    %edx,%eax
 57b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 57e:	c9                   	leave  
 57f:	c3                   	ret    

00000580 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	56                   	push   %esi
 584:	53                   	push   %ebx
 585:	8b 75 08             	mov    0x8(%ebp),%esi
 588:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 58b:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 58e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 590:	eb 0d                	jmp    59f <memmove+0x1f>
    *dst++ = *src++;
 592:	0f b6 01             	movzbl (%ecx),%eax
 595:	88 02                	mov    %al,(%edx)
 597:	8d 49 01             	lea    0x1(%ecx),%ecx
 59a:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 59d:	89 d8                	mov    %ebx,%eax
 59f:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5a2:	85 c0                	test   %eax,%eax
 5a4:	7f ec                	jg     592 <memmove+0x12>
  return vdst;
}
 5a6:	89 f0                	mov    %esi,%eax
 5a8:	5b                   	pop    %ebx
 5a9:	5e                   	pop    %esi
 5aa:	5d                   	pop    %ebp
 5ab:	c3                   	ret    

000005ac <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ac:	b8 01 00 00 00       	mov    $0x1,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <exit>:
SYSCALL(exit)
 5b4:	b8 02 00 00 00       	mov    $0x2,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <wait>:
SYSCALL(wait)
 5bc:	b8 03 00 00 00       	mov    $0x3,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <pipe>:
SYSCALL(pipe)
 5c4:	b8 04 00 00 00       	mov    $0x4,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <read>:
SYSCALL(read)
 5cc:	b8 05 00 00 00       	mov    $0x5,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <write>:
SYSCALL(write)
 5d4:	b8 10 00 00 00       	mov    $0x10,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <close>:
SYSCALL(close)
 5dc:	b8 15 00 00 00       	mov    $0x15,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <kill>:
SYSCALL(kill)
 5e4:	b8 06 00 00 00       	mov    $0x6,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <exec>:
SYSCALL(exec)
 5ec:	b8 07 00 00 00       	mov    $0x7,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <open>:
SYSCALL(open)
 5f4:	b8 0f 00 00 00       	mov    $0xf,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <mknod>:
SYSCALL(mknod)
 5fc:	b8 11 00 00 00       	mov    $0x11,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <unlink>:
SYSCALL(unlink)
 604:	b8 12 00 00 00       	mov    $0x12,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <fstat>:
SYSCALL(fstat)
 60c:	b8 08 00 00 00       	mov    $0x8,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <link>:
SYSCALL(link)
 614:	b8 13 00 00 00       	mov    $0x13,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <mkdir>:
SYSCALL(mkdir)
 61c:	b8 14 00 00 00       	mov    $0x14,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <chdir>:
SYSCALL(chdir)
 624:	b8 09 00 00 00       	mov    $0x9,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <dup>:
SYSCALL(dup)
 62c:	b8 0a 00 00 00       	mov    $0xa,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <getpid>:
SYSCALL(getpid)
 634:	b8 0b 00 00 00       	mov    $0xb,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <sbrk>:
SYSCALL(sbrk)
 63c:	b8 0c 00 00 00       	mov    $0xc,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <sleep>:
SYSCALL(sleep)
 644:	b8 0d 00 00 00       	mov    $0xd,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <uptime>:
SYSCALL(uptime)
 64c:	b8 0e 00 00 00       	mov    $0xe,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <clone>:
SYSCALL(clone)
 654:	b8 16 00 00 00       	mov    $0x16,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <join>:
 65c:	b8 17 00 00 00       	mov    $0x17,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 664:	55                   	push   %ebp
 665:	89 e5                	mov    %esp,%ebp
 667:	83 ec 1c             	sub    $0x1c,%esp
 66a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 66d:	6a 01                	push   $0x1
 66f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 672:	52                   	push   %edx
 673:	50                   	push   %eax
 674:	e8 5b ff ff ff       	call   5d4 <write>
}
 679:	83 c4 10             	add    $0x10,%esp
 67c:	c9                   	leave  
 67d:	c3                   	ret    

0000067e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 67e:	55                   	push   %ebp
 67f:	89 e5                	mov    %esp,%ebp
 681:	57                   	push   %edi
 682:	56                   	push   %esi
 683:	53                   	push   %ebx
 684:	83 ec 2c             	sub    $0x2c,%esp
 687:	89 45 d0             	mov    %eax,-0x30(%ebp)
 68a:	89 d0                	mov    %edx,%eax
 68c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 68e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 692:	0f 95 c1             	setne  %cl
 695:	c1 ea 1f             	shr    $0x1f,%edx
 698:	84 d1                	test   %dl,%cl
 69a:	74 44                	je     6e0 <printint+0x62>
    neg = 1;
    x = -xx;
 69c:	f7 d8                	neg    %eax
 69e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6a0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6a7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6ac:	89 c8                	mov    %ecx,%eax
 6ae:	ba 00 00 00 00       	mov    $0x0,%edx
 6b3:	f7 f6                	div    %esi
 6b5:	89 df                	mov    %ebx,%edi
 6b7:	83 c3 01             	add    $0x1,%ebx
 6ba:	0f b6 92 fc 0a 00 00 	movzbl 0xafc(%edx),%edx
 6c1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6c5:	89 ca                	mov    %ecx,%edx
 6c7:	89 c1                	mov    %eax,%ecx
 6c9:	39 d6                	cmp    %edx,%esi
 6cb:	76 df                	jbe    6ac <printint+0x2e>
  if(neg)
 6cd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6d1:	74 31                	je     704 <printint+0x86>
    buf[i++] = '-';
 6d3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6d8:	8d 5f 02             	lea    0x2(%edi),%ebx
 6db:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6de:	eb 17                	jmp    6f7 <printint+0x79>
    x = xx;
 6e0:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6e2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6e9:	eb bc                	jmp    6a7 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6eb:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6f0:	89 f0                	mov    %esi,%eax
 6f2:	e8 6d ff ff ff       	call   664 <putc>
  while(--i >= 0)
 6f7:	83 eb 01             	sub    $0x1,%ebx
 6fa:	79 ef                	jns    6eb <printint+0x6d>
}
 6fc:	83 c4 2c             	add    $0x2c,%esp
 6ff:	5b                   	pop    %ebx
 700:	5e                   	pop    %esi
 701:	5f                   	pop    %edi
 702:	5d                   	pop    %ebp
 703:	c3                   	ret    
 704:	8b 75 d0             	mov    -0x30(%ebp),%esi
 707:	eb ee                	jmp    6f7 <printint+0x79>

00000709 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 709:	55                   	push   %ebp
 70a:	89 e5                	mov    %esp,%ebp
 70c:	57                   	push   %edi
 70d:	56                   	push   %esi
 70e:	53                   	push   %ebx
 70f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 712:	8d 45 10             	lea    0x10(%ebp),%eax
 715:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 718:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 71d:	bb 00 00 00 00       	mov    $0x0,%ebx
 722:	eb 14                	jmp    738 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 724:	89 fa                	mov    %edi,%edx
 726:	8b 45 08             	mov    0x8(%ebp),%eax
 729:	e8 36 ff ff ff       	call   664 <putc>
 72e:	eb 05                	jmp    735 <printf+0x2c>
      }
    } else if(state == '%'){
 730:	83 fe 25             	cmp    $0x25,%esi
 733:	74 25                	je     75a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 735:	83 c3 01             	add    $0x1,%ebx
 738:	8b 45 0c             	mov    0xc(%ebp),%eax
 73b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 73f:	84 c0                	test   %al,%al
 741:	0f 84 20 01 00 00    	je     867 <printf+0x15e>
    c = fmt[i] & 0xff;
 747:	0f be f8             	movsbl %al,%edi
 74a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 74d:	85 f6                	test   %esi,%esi
 74f:	75 df                	jne    730 <printf+0x27>
      if(c == '%'){
 751:	83 f8 25             	cmp    $0x25,%eax
 754:	75 ce                	jne    724 <printf+0x1b>
        state = '%';
 756:	89 c6                	mov    %eax,%esi
 758:	eb db                	jmp    735 <printf+0x2c>
      if(c == 'd'){
 75a:	83 f8 25             	cmp    $0x25,%eax
 75d:	0f 84 cf 00 00 00    	je     832 <printf+0x129>
 763:	0f 8c dd 00 00 00    	jl     846 <printf+0x13d>
 769:	83 f8 78             	cmp    $0x78,%eax
 76c:	0f 8f d4 00 00 00    	jg     846 <printf+0x13d>
 772:	83 f8 63             	cmp    $0x63,%eax
 775:	0f 8c cb 00 00 00    	jl     846 <printf+0x13d>
 77b:	83 e8 63             	sub    $0x63,%eax
 77e:	83 f8 15             	cmp    $0x15,%eax
 781:	0f 87 bf 00 00 00    	ja     846 <printf+0x13d>
 787:	ff 24 85 a4 0a 00 00 	jmp    *0xaa4(,%eax,4)
        printint(fd, *ap, 10, 1);
 78e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 791:	8b 17                	mov    (%edi),%edx
 793:	83 ec 0c             	sub    $0xc,%esp
 796:	6a 01                	push   $0x1
 798:	b9 0a 00 00 00       	mov    $0xa,%ecx
 79d:	8b 45 08             	mov    0x8(%ebp),%eax
 7a0:	e8 d9 fe ff ff       	call   67e <printint>
        ap++;
 7a5:	83 c7 04             	add    $0x4,%edi
 7a8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7ab:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7ae:	be 00 00 00 00       	mov    $0x0,%esi
 7b3:	eb 80                	jmp    735 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7b5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7b8:	8b 17                	mov    (%edi),%edx
 7ba:	83 ec 0c             	sub    $0xc,%esp
 7bd:	6a 00                	push   $0x0
 7bf:	b9 10 00 00 00       	mov    $0x10,%ecx
 7c4:	8b 45 08             	mov    0x8(%ebp),%eax
 7c7:	e8 b2 fe ff ff       	call   67e <printint>
        ap++;
 7cc:	83 c7 04             	add    $0x4,%edi
 7cf:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7d2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7d5:	be 00 00 00 00       	mov    $0x0,%esi
 7da:	e9 56 ff ff ff       	jmp    735 <printf+0x2c>
        s = (char*)*ap;
 7df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7e2:	8b 30                	mov    (%eax),%esi
        ap++;
 7e4:	83 c0 04             	add    $0x4,%eax
 7e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7ea:	85 f6                	test   %esi,%esi
 7ec:	75 15                	jne    803 <printf+0xfa>
          s = "(null)";
 7ee:	be 9b 0a 00 00       	mov    $0xa9b,%esi
 7f3:	eb 0e                	jmp    803 <printf+0xfa>
          putc(fd, *s);
 7f5:	0f be d2             	movsbl %dl,%edx
 7f8:	8b 45 08             	mov    0x8(%ebp),%eax
 7fb:	e8 64 fe ff ff       	call   664 <putc>
          s++;
 800:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 803:	0f b6 16             	movzbl (%esi),%edx
 806:	84 d2                	test   %dl,%dl
 808:	75 eb                	jne    7f5 <printf+0xec>
      state = 0;
 80a:	be 00 00 00 00       	mov    $0x0,%esi
 80f:	e9 21 ff ff ff       	jmp    735 <printf+0x2c>
        putc(fd, *ap);
 814:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 817:	0f be 17             	movsbl (%edi),%edx
 81a:	8b 45 08             	mov    0x8(%ebp),%eax
 81d:	e8 42 fe ff ff       	call   664 <putc>
        ap++;
 822:	83 c7 04             	add    $0x4,%edi
 825:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 828:	be 00 00 00 00       	mov    $0x0,%esi
 82d:	e9 03 ff ff ff       	jmp    735 <printf+0x2c>
        putc(fd, c);
 832:	89 fa                	mov    %edi,%edx
 834:	8b 45 08             	mov    0x8(%ebp),%eax
 837:	e8 28 fe ff ff       	call   664 <putc>
      state = 0;
 83c:	be 00 00 00 00       	mov    $0x0,%esi
 841:	e9 ef fe ff ff       	jmp    735 <printf+0x2c>
        putc(fd, '%');
 846:	ba 25 00 00 00       	mov    $0x25,%edx
 84b:	8b 45 08             	mov    0x8(%ebp),%eax
 84e:	e8 11 fe ff ff       	call   664 <putc>
        putc(fd, c);
 853:	89 fa                	mov    %edi,%edx
 855:	8b 45 08             	mov    0x8(%ebp),%eax
 858:	e8 07 fe ff ff       	call   664 <putc>
      state = 0;
 85d:	be 00 00 00 00       	mov    $0x0,%esi
 862:	e9 ce fe ff ff       	jmp    735 <printf+0x2c>
    }
  }
}
 867:	8d 65 f4             	lea    -0xc(%ebp),%esp
 86a:	5b                   	pop    %ebx
 86b:	5e                   	pop    %esi
 86c:	5f                   	pop    %edi
 86d:	5d                   	pop    %ebp
 86e:	c3                   	ret    

0000086f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 86f:	55                   	push   %ebp
 870:	89 e5                	mov    %esp,%ebp
 872:	57                   	push   %edi
 873:	56                   	push   %esi
 874:	53                   	push   %ebx
 875:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 878:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 87b:	a1 78 0e 00 00       	mov    0xe78,%eax
 880:	eb 02                	jmp    884 <free+0x15>
 882:	89 d0                	mov    %edx,%eax
 884:	39 c8                	cmp    %ecx,%eax
 886:	73 04                	jae    88c <free+0x1d>
 888:	39 08                	cmp    %ecx,(%eax)
 88a:	77 12                	ja     89e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 88c:	8b 10                	mov    (%eax),%edx
 88e:	39 c2                	cmp    %eax,%edx
 890:	77 f0                	ja     882 <free+0x13>
 892:	39 c8                	cmp    %ecx,%eax
 894:	72 08                	jb     89e <free+0x2f>
 896:	39 ca                	cmp    %ecx,%edx
 898:	77 04                	ja     89e <free+0x2f>
 89a:	89 d0                	mov    %edx,%eax
 89c:	eb e6                	jmp    884 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 89e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8a1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8a4:	8b 10                	mov    (%eax),%edx
 8a6:	39 d7                	cmp    %edx,%edi
 8a8:	74 19                	je     8c3 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ad:	8b 50 04             	mov    0x4(%eax),%edx
 8b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8b3:	39 ce                	cmp    %ecx,%esi
 8b5:	74 1b                	je     8d2 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8b9:	a3 78 0e 00 00       	mov    %eax,0xe78
}
 8be:	5b                   	pop    %ebx
 8bf:	5e                   	pop    %esi
 8c0:	5f                   	pop    %edi
 8c1:	5d                   	pop    %ebp
 8c2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8c3:	03 72 04             	add    0x4(%edx),%esi
 8c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8c9:	8b 10                	mov    (%eax),%edx
 8cb:	8b 12                	mov    (%edx),%edx
 8cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8d0:	eb db                	jmp    8ad <free+0x3e>
    p->s.size += bp->s.size;
 8d2:	03 53 fc             	add    -0x4(%ebx),%edx
 8d5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8d8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8db:	89 10                	mov    %edx,(%eax)
 8dd:	eb da                	jmp    8b9 <free+0x4a>

000008df <morecore>:

static Header*
morecore(uint nu)
{
 8df:	55                   	push   %ebp
 8e0:	89 e5                	mov    %esp,%ebp
 8e2:	53                   	push   %ebx
 8e3:	83 ec 04             	sub    $0x4,%esp
 8e6:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8e8:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8ed:	77 05                	ja     8f4 <morecore+0x15>
    nu = 4096;
 8ef:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8f4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8fb:	83 ec 0c             	sub    $0xc,%esp
 8fe:	50                   	push   %eax
 8ff:	e8 38 fd ff ff       	call   63c <sbrk>
  if(p == (char*)-1)
 904:	83 c4 10             	add    $0x10,%esp
 907:	83 f8 ff             	cmp    $0xffffffff,%eax
 90a:	74 1c                	je     928 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 90c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 90f:	83 c0 08             	add    $0x8,%eax
 912:	83 ec 0c             	sub    $0xc,%esp
 915:	50                   	push   %eax
 916:	e8 54 ff ff ff       	call   86f <free>
  return freep;
 91b:	a1 78 0e 00 00       	mov    0xe78,%eax
 920:	83 c4 10             	add    $0x10,%esp
}
 923:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 926:	c9                   	leave  
 927:	c3                   	ret    
    return 0;
 928:	b8 00 00 00 00       	mov    $0x0,%eax
 92d:	eb f4                	jmp    923 <morecore+0x44>

0000092f <malloc>:

void*
malloc(uint nbytes)
{
 92f:	55                   	push   %ebp
 930:	89 e5                	mov    %esp,%ebp
 932:	53                   	push   %ebx
 933:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 936:	8b 45 08             	mov    0x8(%ebp),%eax
 939:	8d 58 07             	lea    0x7(%eax),%ebx
 93c:	c1 eb 03             	shr    $0x3,%ebx
 93f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 942:	8b 0d 78 0e 00 00    	mov    0xe78,%ecx
 948:	85 c9                	test   %ecx,%ecx
 94a:	74 04                	je     950 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 94c:	8b 01                	mov    (%ecx),%eax
 94e:	eb 4a                	jmp    99a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 950:	c7 05 78 0e 00 00 7c 	movl   $0xe7c,0xe78
 957:	0e 00 00 
 95a:	c7 05 7c 0e 00 00 7c 	movl   $0xe7c,0xe7c
 961:	0e 00 00 
    base.s.size = 0;
 964:	c7 05 80 0e 00 00 00 	movl   $0x0,0xe80
 96b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 96e:	b9 7c 0e 00 00       	mov    $0xe7c,%ecx
 973:	eb d7                	jmp    94c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 975:	74 19                	je     990 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 977:	29 da                	sub    %ebx,%edx
 979:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 97c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 97f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 982:	89 0d 78 0e 00 00    	mov    %ecx,0xe78
      return (void*)(p + 1);
 988:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 98b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 98e:	c9                   	leave  
 98f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 990:	8b 10                	mov    (%eax),%edx
 992:	89 11                	mov    %edx,(%ecx)
 994:	eb ec                	jmp    982 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 996:	89 c1                	mov    %eax,%ecx
 998:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 99a:	8b 50 04             	mov    0x4(%eax),%edx
 99d:	39 da                	cmp    %ebx,%edx
 99f:	73 d4                	jae    975 <malloc+0x46>
    if(p == freep)
 9a1:	39 05 78 0e 00 00    	cmp    %eax,0xe78
 9a7:	75 ed                	jne    996 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9a9:	89 d8                	mov    %ebx,%eax
 9ab:	e8 2f ff ff ff       	call   8df <morecore>
 9b0:	85 c0                	test   %eax,%eax
 9b2:	75 e2                	jne    996 <malloc+0x67>
 9b4:	eb d5                	jmp    98b <malloc+0x5c>
