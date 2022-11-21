
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
  1c:	a1 ac 0e 00 00       	mov    0xeac,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 39                	push   $0x39
  2c:	68 e4 09 00 00       	push   $0x9e4
  31:	68 ed 09 00 00       	push   $0x9ed
  36:	6a 01                	push   $0x1
  38:	e8 f8 06 00 00       	call   735 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 2c 0a 00 00       	push   $0xa2c
  45:	68 00 0a 00 00       	push   $0xa00
  4a:	6a 01                	push   $0x1
  4c:	e8 e4 06 00 00       	call   735 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 14 0a 00 00       	push   $0xa14
  59:	6a 01                	push   $0x1
  5b:	e8 d5 06 00 00       	call   735 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 b0 0e 00 00    	push   0xeb0
  69:	e8 a2 05 00 00       	call   610 <kill>
  6e:	e8 6d 05 00 00       	call   5e0 <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 e4 09 00 00       	push   $0x9e4
  7a:	68 ed 09 00 00       	push   $0x9ed
  7f:	6a 01                	push   $0x1
  81:	e8 af 06 00 00       	call   735 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 f5 09 00 00       	push   $0x9f5
  8e:	68 00 0a 00 00       	push   $0xa00
  93:	6a 01                	push   $0x1
  95:	e8 9b 06 00 00       	call   735 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 14 0a 00 00       	push   $0xa14
  a2:	6a 01                	push   $0x1
  a4:	e8 8c 06 00 00       	call   735 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 b0 0e 00 00    	push   0xeb0
  b2:	e8 59 05 00 00       	call   610 <kill>
  b7:	e8 24 05 00 00       	call   5e0 <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 e4 09 00 00       	push   $0x9e4
  c3:	68 ed 09 00 00       	push   $0x9ed
  c8:	6a 01                	push   $0x1
  ca:	e8 66 06 00 00       	call   735 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 21 0a 00 00       	push   $0xa21
  d7:	68 00 0a 00 00       	push   $0xa00
  dc:	6a 01                	push   $0x1
  de:	e8 52 06 00 00       	call   735 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 14 0a 00 00       	push   $0xa14
  eb:	6a 01                	push   $0x1
  ed:	e8 43 06 00 00       	call   735 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 b0 0e 00 00    	push   0xeb0
  fb:	e8 10 05 00 00       	call   610 <kill>
 100:	e8 db 04 00 00       	call   5e0 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 ac 0e 00 00       	mov    %eax,0xeac
   exit();
 10d:	e8 ce 04 00 00       	call   5e0 <exit>

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
 126:	e8 35 05 00 00       	call   660 <getpid>
 12b:	a3 b0 0e 00 00       	mov    %eax,0xeb0
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 1e 08 00 00       	call   95b <malloc>
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
 15a:	68 e4 09 00 00       	push   $0x9e4
 15f:	68 ed 09 00 00       	push   $0x9ed
 164:	6a 01                	push   $0x1
 166:	e8 ca 05 00 00       	call   735 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 38 0a 00 00       	push   $0xa38
 173:	68 00 0a 00 00       	push   $0xa00
 178:	6a 01                	push   $0x1
 17a:	e8 b6 05 00 00       	call   735 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 14 0a 00 00       	push   $0xa14
 187:	6a 01                	push   $0x1
 189:	e8 a7 05 00 00       	call   735 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 b0 0e 00 00    	push   0xeb0
 197:	e8 74 04 00 00       	call   610 <kill>
 19c:	e8 3f 04 00 00       	call   5e0 <exit>
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
 1bf:	e8 bc 04 00 00       	call   680 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 8a 04 00 00       	call   668 <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 7e 04 00 00       	call   668 <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 8a 04 00 00       	call   688 <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 e4 09 00 00       	push   $0x9e4
 211:	68 ed 09 00 00       	push   $0x9ed
 216:	6a 01                	push   $0x1
 218:	e8 18 05 00 00       	call   735 <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 9c 0a 00 00       	push   $0xa9c
 225:	68 00 0a 00 00       	push   $0xa00
 22a:	6a 01                	push   $0x1
 22c:	e8 04 05 00 00       	call   735 <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 14 0a 00 00       	push   $0xa14
 239:	6a 01                	push   $0x1
 23b:	e8 f5 04 00 00       	call   735 <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 b0 0e 00 00    	push   0xeb0
 249:	e8 c2 03 00 00       	call   610 <kill>
 24e:	e8 8d 03 00 00       	call   5e0 <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 e4 09 00 00       	push   $0x9e4
 25a:	68 ed 09 00 00       	push   $0x9ed
 25f:	6a 01                	push   $0x1
 261:	e8 cf 04 00 00       	call   735 <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 42 0a 00 00       	push   $0xa42
 26e:	68 00 0a 00 00       	push   $0xa00
 273:	6a 01                	push   $0x1
 275:	e8 bb 04 00 00       	call   735 <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 14 0a 00 00       	push   $0xa14
 282:	6a 01                	push   $0x1
 284:	e8 ac 04 00 00       	call   735 <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 b0 0e 00 00    	push   0xeb0
 292:	e8 79 03 00 00       	call   610 <kill>
 297:	e8 44 03 00 00       	call   5e0 <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 e1 03 00 00       	call   688 <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 e4 09 00 00       	push   $0x9e4
 2c1:	68 ed 09 00 00       	push   $0x9ed
 2c6:	6a 01                	push   $0x1
 2c8:	e8 68 04 00 00       	call   735 <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 6e 0a 00 00       	push   $0xa6e
 2d5:	68 00 0a 00 00       	push   $0xa00
 2da:	6a 01                	push   $0x1
 2dc:	e8 54 04 00 00       	call   735 <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 14 0a 00 00       	push   $0xa14
 2e9:	6a 01                	push   $0x1
 2eb:	e8 45 04 00 00       	call   735 <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 b0 0e 00 00    	push   0xeb0
 2f9:	e8 12 03 00 00       	call   610 <kill>
 2fe:	e8 dd 02 00 00       	call   5e0 <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 e4 09 00 00       	push   $0x9e4
 30a:	68 ed 09 00 00       	push   $0x9ed
 30f:	6a 01                	push   $0x1
 311:	e8 1f 04 00 00       	call   735 <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 50 0a 00 00       	push   $0xa50
 31e:	68 00 0a 00 00       	push   $0xa00
 323:	6a 01                	push   $0x1
 325:	e8 0b 04 00 00       	call   735 <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 14 0a 00 00       	push   $0xa14
 332:	6a 01                	push   $0x1
 334:	e8 fc 03 00 00       	call   735 <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 b0 0e 00 00    	push   0xeb0
 342:	e8 c9 02 00 00       	call   610 <kill>
 347:	e8 94 02 00 00       	call   5e0 <exit>
   assert(global == 2);
 34c:	83 3d ac 0e 00 00 02 	cmpl   $0x2,0xeac
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 e4 09 00 00       	push   $0x9e4
 35c:	68 ed 09 00 00       	push   $0x9ed
 361:	6a 01                	push   $0x1
 363:	e8 cd 03 00 00       	call   735 <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 83 0a 00 00       	push   $0xa83
 370:	68 00 0a 00 00       	push   $0xa00
 375:	6a 01                	push   $0x1
 377:	e8 b9 03 00 00       	call   735 <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 14 0a 00 00       	push   $0xa14
 384:	6a 01                	push   $0x1
 386:	e8 aa 03 00 00       	call   735 <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 b0 0e 00 00    	push   0xeb0
 394:	e8 77 02 00 00       	call   610 <kill>
 399:	e8 42 02 00 00       	call   5e0 <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 8f 0a 00 00       	push   $0xa8f
 3a6:	6a 01                	push   $0x1
 3a8:	e8 88 03 00 00       	call   735 <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 e6 04 00 00       	call   89b <free>
   exit();
 3b5:	e8 26 02 00 00       	call   5e0 <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3cb:	55                   	push   %ebp
 3cc:	89 e5                	mov    %esp,%ebp
 3ce:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 3d1:	68 00 10 00 00       	push   $0x1000
 3d6:	e8 80 05 00 00       	call   95b <malloc>
  if(n_stack == 0){
 3db:	83 c4 10             	add    $0x10,%esp
 3de:	85 c0                	test   %eax,%eax
 3e0:	74 14                	je     3f6 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 3e2:	50                   	push   %eax
 3e3:	ff 75 10             	push   0x10(%ebp)
 3e6:	ff 75 0c             	push   0xc(%ebp)
 3e9:	ff 75 08             	push   0x8(%ebp)
 3ec:	e8 8f 02 00 00       	call   680 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 3f1:	83 c4 10             	add    $0x10,%esp
}
 3f4:	c9                   	leave  
 3f5:	c3                   	ret    
    return -1;
 3f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3fb:	eb f7                	jmp    3f4 <thread_create+0x29>

000003fd <thread_join>:

int thread_join() {
  return 0;
}
 3fd:	b8 00 00 00 00       	mov    $0x0,%eax
 402:	c3                   	ret    

00000403 <lock_acquire>:

void lock_acquire(lock_t *lock){
 403:	55                   	push   %ebp
 404:	89 e5                	mov    %esp,%ebp
 406:	53                   	push   %ebx
 407:	83 ec 04             	sub    $0x4,%esp
 40a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 40d:	83 ec 08             	sub    $0x8,%esp
 410:	6a 01                	push   $0x1
 412:	53                   	push   %ebx
 413:	e8 a2 ff ff ff       	call   3ba <test_and_set>
 418:	83 c4 10             	add    $0x10,%esp
 41b:	83 f8 01             	cmp    $0x1,%eax
 41e:	74 ed                	je     40d <lock_acquire+0xa>
    ;
}
 420:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 423:	c9                   	leave  
 424:	c3                   	ret    

00000425 <lock_release>:

void lock_release(lock_t *lock) {
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 428:	8b 45 08             	mov    0x8(%ebp),%eax
 42b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 431:	5d                   	pop    %ebp
 432:	c3                   	ret    

00000433 <lock_init>:

void lock_init(lock_t *lock) {
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 436:	8b 45 08             	mov    0x8(%ebp),%eax
 439:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 43f:	5d                   	pop    %ebp
 440:	c3                   	ret    

00000441 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 441:	55                   	push   %ebp
 442:	89 e5                	mov    %esp,%ebp
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	8b 75 08             	mov    0x8(%ebp),%esi
 449:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 44c:	89 f0                	mov    %esi,%eax
 44e:	89 d1                	mov    %edx,%ecx
 450:	83 c2 01             	add    $0x1,%edx
 453:	89 c3                	mov    %eax,%ebx
 455:	83 c0 01             	add    $0x1,%eax
 458:	0f b6 09             	movzbl (%ecx),%ecx
 45b:	88 0b                	mov    %cl,(%ebx)
 45d:	84 c9                	test   %cl,%cl
 45f:	75 ed                	jne    44e <strcpy+0xd>
    ;
  return os;
}
 461:	89 f0                	mov    %esi,%eax
 463:	5b                   	pop    %ebx
 464:	5e                   	pop    %esi
 465:	5d                   	pop    %ebp
 466:	c3                   	ret    

00000467 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 46d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 470:	eb 06                	jmp    478 <strcmp+0x11>
    p++, q++;
 472:	83 c1 01             	add    $0x1,%ecx
 475:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 478:	0f b6 01             	movzbl (%ecx),%eax
 47b:	84 c0                	test   %al,%al
 47d:	74 04                	je     483 <strcmp+0x1c>
 47f:	3a 02                	cmp    (%edx),%al
 481:	74 ef                	je     472 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 483:	0f b6 c0             	movzbl %al,%eax
 486:	0f b6 12             	movzbl (%edx),%edx
 489:	29 d0                	sub    %edx,%eax
}
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    

0000048d <strlen>:

uint
strlen(const char *s)
{
 48d:	55                   	push   %ebp
 48e:	89 e5                	mov    %esp,%ebp
 490:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 493:	b8 00 00 00 00       	mov    $0x0,%eax
 498:	eb 03                	jmp    49d <strlen+0x10>
 49a:	83 c0 01             	add    $0x1,%eax
 49d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4a1:	75 f7                	jne    49a <strlen+0xd>
    ;
  return n;
}
 4a3:	5d                   	pop    %ebp
 4a4:	c3                   	ret    

000004a5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4a5:	55                   	push   %ebp
 4a6:	89 e5                	mov    %esp,%ebp
 4a8:	57                   	push   %edi
 4a9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4ac:	89 d7                	mov    %edx,%edi
 4ae:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b4:	fc                   	cld    
 4b5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4b7:	89 d0                	mov    %edx,%eax
 4b9:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4bc:	c9                   	leave  
 4bd:	c3                   	ret    

000004be <strchr>:

char*
strchr(const char *s, char c)
{
 4be:	55                   	push   %ebp
 4bf:	89 e5                	mov    %esp,%ebp
 4c1:	8b 45 08             	mov    0x8(%ebp),%eax
 4c4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4c8:	eb 03                	jmp    4cd <strchr+0xf>
 4ca:	83 c0 01             	add    $0x1,%eax
 4cd:	0f b6 10             	movzbl (%eax),%edx
 4d0:	84 d2                	test   %dl,%dl
 4d2:	74 06                	je     4da <strchr+0x1c>
    if(*s == c)
 4d4:	38 ca                	cmp    %cl,%dl
 4d6:	75 f2                	jne    4ca <strchr+0xc>
 4d8:	eb 05                	jmp    4df <strchr+0x21>
      return (char*)s;
  return 0;
 4da:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret    

000004e1 <gets>:

char*
gets(char *buf, int max)
{
 4e1:	55                   	push   %ebp
 4e2:	89 e5                	mov    %esp,%ebp
 4e4:	57                   	push   %edi
 4e5:	56                   	push   %esi
 4e6:	53                   	push   %ebx
 4e7:	83 ec 1c             	sub    $0x1c,%esp
 4ea:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4ed:	bb 00 00 00 00       	mov    $0x0,%ebx
 4f2:	89 de                	mov    %ebx,%esi
 4f4:	83 c3 01             	add    $0x1,%ebx
 4f7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4fa:	7d 2e                	jge    52a <gets+0x49>
    cc = read(0, &c, 1);
 4fc:	83 ec 04             	sub    $0x4,%esp
 4ff:	6a 01                	push   $0x1
 501:	8d 45 e7             	lea    -0x19(%ebp),%eax
 504:	50                   	push   %eax
 505:	6a 00                	push   $0x0
 507:	e8 ec 00 00 00       	call   5f8 <read>
    if(cc < 1)
 50c:	83 c4 10             	add    $0x10,%esp
 50f:	85 c0                	test   %eax,%eax
 511:	7e 17                	jle    52a <gets+0x49>
      break;
    buf[i++] = c;
 513:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 517:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 51a:	3c 0a                	cmp    $0xa,%al
 51c:	0f 94 c2             	sete   %dl
 51f:	3c 0d                	cmp    $0xd,%al
 521:	0f 94 c0             	sete   %al
 524:	08 c2                	or     %al,%dl
 526:	74 ca                	je     4f2 <gets+0x11>
    buf[i++] = c;
 528:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 52a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 52e:	89 f8                	mov    %edi,%eax
 530:	8d 65 f4             	lea    -0xc(%ebp),%esp
 533:	5b                   	pop    %ebx
 534:	5e                   	pop    %esi
 535:	5f                   	pop    %edi
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    

00000538 <stat>:

int
stat(const char *n, struct stat *st)
{
 538:	55                   	push   %ebp
 539:	89 e5                	mov    %esp,%ebp
 53b:	56                   	push   %esi
 53c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 53d:	83 ec 08             	sub    $0x8,%esp
 540:	6a 00                	push   $0x0
 542:	ff 75 08             	push   0x8(%ebp)
 545:	e8 d6 00 00 00       	call   620 <open>
  if(fd < 0)
 54a:	83 c4 10             	add    $0x10,%esp
 54d:	85 c0                	test   %eax,%eax
 54f:	78 24                	js     575 <stat+0x3d>
 551:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 553:	83 ec 08             	sub    $0x8,%esp
 556:	ff 75 0c             	push   0xc(%ebp)
 559:	50                   	push   %eax
 55a:	e8 d9 00 00 00       	call   638 <fstat>
 55f:	89 c6                	mov    %eax,%esi
  close(fd);
 561:	89 1c 24             	mov    %ebx,(%esp)
 564:	e8 9f 00 00 00       	call   608 <close>
  return r;
 569:	83 c4 10             	add    $0x10,%esp
}
 56c:	89 f0                	mov    %esi,%eax
 56e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 571:	5b                   	pop    %ebx
 572:	5e                   	pop    %esi
 573:	5d                   	pop    %ebp
 574:	c3                   	ret    
    return -1;
 575:	be ff ff ff ff       	mov    $0xffffffff,%esi
 57a:	eb f0                	jmp    56c <stat+0x34>

0000057c <atoi>:

int
atoi(const char *s)
{
 57c:	55                   	push   %ebp
 57d:	89 e5                	mov    %esp,%ebp
 57f:	53                   	push   %ebx
 580:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 583:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 588:	eb 10                	jmp    59a <atoi+0x1e>
    n = n*10 + *s++ - '0';
 58a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 58d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 590:	83 c1 01             	add    $0x1,%ecx
 593:	0f be c0             	movsbl %al,%eax
 596:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 59a:	0f b6 01             	movzbl (%ecx),%eax
 59d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5a0:	80 fb 09             	cmp    $0x9,%bl
 5a3:	76 e5                	jbe    58a <atoi+0xe>
  return n;
}
 5a5:	89 d0                	mov    %edx,%eax
 5a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5aa:	c9                   	leave  
 5ab:	c3                   	ret    

000005ac <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5ac:	55                   	push   %ebp
 5ad:	89 e5                	mov    %esp,%ebp
 5af:	56                   	push   %esi
 5b0:	53                   	push   %ebx
 5b1:	8b 75 08             	mov    0x8(%ebp),%esi
 5b4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5b7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5ba:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5bc:	eb 0d                	jmp    5cb <memmove+0x1f>
    *dst++ = *src++;
 5be:	0f b6 01             	movzbl (%ecx),%eax
 5c1:	88 02                	mov    %al,(%edx)
 5c3:	8d 49 01             	lea    0x1(%ecx),%ecx
 5c6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5c9:	89 d8                	mov    %ebx,%eax
 5cb:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5ce:	85 c0                	test   %eax,%eax
 5d0:	7f ec                	jg     5be <memmove+0x12>
  return vdst;
}
 5d2:	89 f0                	mov    %esi,%eax
 5d4:	5b                   	pop    %ebx
 5d5:	5e                   	pop    %esi
 5d6:	5d                   	pop    %ebp
 5d7:	c3                   	ret    

000005d8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5d8:	b8 01 00 00 00       	mov    $0x1,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <exit>:
SYSCALL(exit)
 5e0:	b8 02 00 00 00       	mov    $0x2,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <wait>:
SYSCALL(wait)
 5e8:	b8 03 00 00 00       	mov    $0x3,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <pipe>:
SYSCALL(pipe)
 5f0:	b8 04 00 00 00       	mov    $0x4,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <read>:
SYSCALL(read)
 5f8:	b8 05 00 00 00       	mov    $0x5,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <write>:
SYSCALL(write)
 600:	b8 10 00 00 00       	mov    $0x10,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <close>:
SYSCALL(close)
 608:	b8 15 00 00 00       	mov    $0x15,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <kill>:
SYSCALL(kill)
 610:	b8 06 00 00 00       	mov    $0x6,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <exec>:
SYSCALL(exec)
 618:	b8 07 00 00 00       	mov    $0x7,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <open>:
SYSCALL(open)
 620:	b8 0f 00 00 00       	mov    $0xf,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <mknod>:
SYSCALL(mknod)
 628:	b8 11 00 00 00       	mov    $0x11,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <unlink>:
SYSCALL(unlink)
 630:	b8 12 00 00 00       	mov    $0x12,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <fstat>:
SYSCALL(fstat)
 638:	b8 08 00 00 00       	mov    $0x8,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <link>:
SYSCALL(link)
 640:	b8 13 00 00 00       	mov    $0x13,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <mkdir>:
SYSCALL(mkdir)
 648:	b8 14 00 00 00       	mov    $0x14,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <chdir>:
SYSCALL(chdir)
 650:	b8 09 00 00 00       	mov    $0x9,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <dup>:
SYSCALL(dup)
 658:	b8 0a 00 00 00       	mov    $0xa,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <getpid>:
SYSCALL(getpid)
 660:	b8 0b 00 00 00       	mov    $0xb,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <sbrk>:
SYSCALL(sbrk)
 668:	b8 0c 00 00 00       	mov    $0xc,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <sleep>:
SYSCALL(sleep)
 670:	b8 0d 00 00 00       	mov    $0xd,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <uptime>:
SYSCALL(uptime)
 678:	b8 0e 00 00 00       	mov    $0xe,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <clone>:
SYSCALL(clone)
 680:	b8 16 00 00 00       	mov    $0x16,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <join>:
 688:	b8 17 00 00 00       	mov    $0x17,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	83 ec 1c             	sub    $0x1c,%esp
 696:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 699:	6a 01                	push   $0x1
 69b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 69e:	52                   	push   %edx
 69f:	50                   	push   %eax
 6a0:	e8 5b ff ff ff       	call   600 <write>
}
 6a5:	83 c4 10             	add    $0x10,%esp
 6a8:	c9                   	leave  
 6a9:	c3                   	ret    

000006aa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6aa:	55                   	push   %ebp
 6ab:	89 e5                	mov    %esp,%ebp
 6ad:	57                   	push   %edi
 6ae:	56                   	push   %esi
 6af:	53                   	push   %ebx
 6b0:	83 ec 2c             	sub    $0x2c,%esp
 6b3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6b6:	89 d0                	mov    %edx,%eax
 6b8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6ba:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6be:	0f 95 c1             	setne  %cl
 6c1:	c1 ea 1f             	shr    $0x1f,%edx
 6c4:	84 d1                	test   %dl,%cl
 6c6:	74 44                	je     70c <printint+0x62>
    neg = 1;
    x = -xx;
 6c8:	f7 d8                	neg    %eax
 6ca:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6cc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6d3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6d8:	89 c8                	mov    %ecx,%eax
 6da:	ba 00 00 00 00       	mov    $0x0,%edx
 6df:	f7 f6                	div    %esi
 6e1:	89 df                	mov    %ebx,%edi
 6e3:	83 c3 01             	add    $0x1,%ebx
 6e6:	0f b6 92 28 0b 00 00 	movzbl 0xb28(%edx),%edx
 6ed:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6f1:	89 ca                	mov    %ecx,%edx
 6f3:	89 c1                	mov    %eax,%ecx
 6f5:	39 d6                	cmp    %edx,%esi
 6f7:	76 df                	jbe    6d8 <printint+0x2e>
  if(neg)
 6f9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6fd:	74 31                	je     730 <printint+0x86>
    buf[i++] = '-';
 6ff:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 704:	8d 5f 02             	lea    0x2(%edi),%ebx
 707:	8b 75 d0             	mov    -0x30(%ebp),%esi
 70a:	eb 17                	jmp    723 <printint+0x79>
    x = xx;
 70c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 70e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 715:	eb bc                	jmp    6d3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 717:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 71c:	89 f0                	mov    %esi,%eax
 71e:	e8 6d ff ff ff       	call   690 <putc>
  while(--i >= 0)
 723:	83 eb 01             	sub    $0x1,%ebx
 726:	79 ef                	jns    717 <printint+0x6d>
}
 728:	83 c4 2c             	add    $0x2c,%esp
 72b:	5b                   	pop    %ebx
 72c:	5e                   	pop    %esi
 72d:	5f                   	pop    %edi
 72e:	5d                   	pop    %ebp
 72f:	c3                   	ret    
 730:	8b 75 d0             	mov    -0x30(%ebp),%esi
 733:	eb ee                	jmp    723 <printint+0x79>

00000735 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 735:	55                   	push   %ebp
 736:	89 e5                	mov    %esp,%ebp
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	53                   	push   %ebx
 73b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 73e:	8d 45 10             	lea    0x10(%ebp),%eax
 741:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 744:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 749:	bb 00 00 00 00       	mov    $0x0,%ebx
 74e:	eb 14                	jmp    764 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 750:	89 fa                	mov    %edi,%edx
 752:	8b 45 08             	mov    0x8(%ebp),%eax
 755:	e8 36 ff ff ff       	call   690 <putc>
 75a:	eb 05                	jmp    761 <printf+0x2c>
      }
    } else if(state == '%'){
 75c:	83 fe 25             	cmp    $0x25,%esi
 75f:	74 25                	je     786 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 761:	83 c3 01             	add    $0x1,%ebx
 764:	8b 45 0c             	mov    0xc(%ebp),%eax
 767:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 76b:	84 c0                	test   %al,%al
 76d:	0f 84 20 01 00 00    	je     893 <printf+0x15e>
    c = fmt[i] & 0xff;
 773:	0f be f8             	movsbl %al,%edi
 776:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 779:	85 f6                	test   %esi,%esi
 77b:	75 df                	jne    75c <printf+0x27>
      if(c == '%'){
 77d:	83 f8 25             	cmp    $0x25,%eax
 780:	75 ce                	jne    750 <printf+0x1b>
        state = '%';
 782:	89 c6                	mov    %eax,%esi
 784:	eb db                	jmp    761 <printf+0x2c>
      if(c == 'd'){
 786:	83 f8 25             	cmp    $0x25,%eax
 789:	0f 84 cf 00 00 00    	je     85e <printf+0x129>
 78f:	0f 8c dd 00 00 00    	jl     872 <printf+0x13d>
 795:	83 f8 78             	cmp    $0x78,%eax
 798:	0f 8f d4 00 00 00    	jg     872 <printf+0x13d>
 79e:	83 f8 63             	cmp    $0x63,%eax
 7a1:	0f 8c cb 00 00 00    	jl     872 <printf+0x13d>
 7a7:	83 e8 63             	sub    $0x63,%eax
 7aa:	83 f8 15             	cmp    $0x15,%eax
 7ad:	0f 87 bf 00 00 00    	ja     872 <printf+0x13d>
 7b3:	ff 24 85 d0 0a 00 00 	jmp    *0xad0(,%eax,4)
        printint(fd, *ap, 10, 1);
 7ba:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7bd:	8b 17                	mov    (%edi),%edx
 7bf:	83 ec 0c             	sub    $0xc,%esp
 7c2:	6a 01                	push   $0x1
 7c4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
 7cc:	e8 d9 fe ff ff       	call   6aa <printint>
        ap++;
 7d1:	83 c7 04             	add    $0x4,%edi
 7d4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7d7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7da:	be 00 00 00 00       	mov    $0x0,%esi
 7df:	eb 80                	jmp    761 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7e1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e4:	8b 17                	mov    (%edi),%edx
 7e6:	83 ec 0c             	sub    $0xc,%esp
 7e9:	6a 00                	push   $0x0
 7eb:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f0:	8b 45 08             	mov    0x8(%ebp),%eax
 7f3:	e8 b2 fe ff ff       	call   6aa <printint>
        ap++;
 7f8:	83 c7 04             	add    $0x4,%edi
 7fb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7fe:	83 c4 10             	add    $0x10,%esp
      state = 0;
 801:	be 00 00 00 00       	mov    $0x0,%esi
 806:	e9 56 ff ff ff       	jmp    761 <printf+0x2c>
        s = (char*)*ap;
 80b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80e:	8b 30                	mov    (%eax),%esi
        ap++;
 810:	83 c0 04             	add    $0x4,%eax
 813:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 816:	85 f6                	test   %esi,%esi
 818:	75 15                	jne    82f <printf+0xfa>
          s = "(null)";
 81a:	be c7 0a 00 00       	mov    $0xac7,%esi
 81f:	eb 0e                	jmp    82f <printf+0xfa>
          putc(fd, *s);
 821:	0f be d2             	movsbl %dl,%edx
 824:	8b 45 08             	mov    0x8(%ebp),%eax
 827:	e8 64 fe ff ff       	call   690 <putc>
          s++;
 82c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 82f:	0f b6 16             	movzbl (%esi),%edx
 832:	84 d2                	test   %dl,%dl
 834:	75 eb                	jne    821 <printf+0xec>
      state = 0;
 836:	be 00 00 00 00       	mov    $0x0,%esi
 83b:	e9 21 ff ff ff       	jmp    761 <printf+0x2c>
        putc(fd, *ap);
 840:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 843:	0f be 17             	movsbl (%edi),%edx
 846:	8b 45 08             	mov    0x8(%ebp),%eax
 849:	e8 42 fe ff ff       	call   690 <putc>
        ap++;
 84e:	83 c7 04             	add    $0x4,%edi
 851:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 854:	be 00 00 00 00       	mov    $0x0,%esi
 859:	e9 03 ff ff ff       	jmp    761 <printf+0x2c>
        putc(fd, c);
 85e:	89 fa                	mov    %edi,%edx
 860:	8b 45 08             	mov    0x8(%ebp),%eax
 863:	e8 28 fe ff ff       	call   690 <putc>
      state = 0;
 868:	be 00 00 00 00       	mov    $0x0,%esi
 86d:	e9 ef fe ff ff       	jmp    761 <printf+0x2c>
        putc(fd, '%');
 872:	ba 25 00 00 00       	mov    $0x25,%edx
 877:	8b 45 08             	mov    0x8(%ebp),%eax
 87a:	e8 11 fe ff ff       	call   690 <putc>
        putc(fd, c);
 87f:	89 fa                	mov    %edi,%edx
 881:	8b 45 08             	mov    0x8(%ebp),%eax
 884:	e8 07 fe ff ff       	call   690 <putc>
      state = 0;
 889:	be 00 00 00 00       	mov    $0x0,%esi
 88e:	e9 ce fe ff ff       	jmp    761 <printf+0x2c>
    }
  }
}
 893:	8d 65 f4             	lea    -0xc(%ebp),%esp
 896:	5b                   	pop    %ebx
 897:	5e                   	pop    %esi
 898:	5f                   	pop    %edi
 899:	5d                   	pop    %ebp
 89a:	c3                   	ret    

0000089b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 89b:	55                   	push   %ebp
 89c:	89 e5                	mov    %esp,%ebp
 89e:	57                   	push   %edi
 89f:	56                   	push   %esi
 8a0:	53                   	push   %ebx
 8a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a7:	a1 b4 0e 00 00       	mov    0xeb4,%eax
 8ac:	eb 02                	jmp    8b0 <free+0x15>
 8ae:	89 d0                	mov    %edx,%eax
 8b0:	39 c8                	cmp    %ecx,%eax
 8b2:	73 04                	jae    8b8 <free+0x1d>
 8b4:	39 08                	cmp    %ecx,(%eax)
 8b6:	77 12                	ja     8ca <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b8:	8b 10                	mov    (%eax),%edx
 8ba:	39 c2                	cmp    %eax,%edx
 8bc:	77 f0                	ja     8ae <free+0x13>
 8be:	39 c8                	cmp    %ecx,%eax
 8c0:	72 08                	jb     8ca <free+0x2f>
 8c2:	39 ca                	cmp    %ecx,%edx
 8c4:	77 04                	ja     8ca <free+0x2f>
 8c6:	89 d0                	mov    %edx,%eax
 8c8:	eb e6                	jmp    8b0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8ca:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8cd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8d0:	8b 10                	mov    (%eax),%edx
 8d2:	39 d7                	cmp    %edx,%edi
 8d4:	74 19                	je     8ef <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8d6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8d9:	8b 50 04             	mov    0x4(%eax),%edx
 8dc:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8df:	39 ce                	cmp    %ecx,%esi
 8e1:	74 1b                	je     8fe <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8e3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8e5:	a3 b4 0e 00 00       	mov    %eax,0xeb4
}
 8ea:	5b                   	pop    %ebx
 8eb:	5e                   	pop    %esi
 8ec:	5f                   	pop    %edi
 8ed:	5d                   	pop    %ebp
 8ee:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8ef:	03 72 04             	add    0x4(%edx),%esi
 8f2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f5:	8b 10                	mov    (%eax),%edx
 8f7:	8b 12                	mov    (%edx),%edx
 8f9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8fc:	eb db                	jmp    8d9 <free+0x3e>
    p->s.size += bp->s.size;
 8fe:	03 53 fc             	add    -0x4(%ebx),%edx
 901:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 904:	8b 53 f8             	mov    -0x8(%ebx),%edx
 907:	89 10                	mov    %edx,(%eax)
 909:	eb da                	jmp    8e5 <free+0x4a>

0000090b <morecore>:

static Header*
morecore(uint nu)
{
 90b:	55                   	push   %ebp
 90c:	89 e5                	mov    %esp,%ebp
 90e:	53                   	push   %ebx
 90f:	83 ec 04             	sub    $0x4,%esp
 912:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 914:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 919:	77 05                	ja     920 <morecore+0x15>
    nu = 4096;
 91b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 920:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 927:	83 ec 0c             	sub    $0xc,%esp
 92a:	50                   	push   %eax
 92b:	e8 38 fd ff ff       	call   668 <sbrk>
  if(p == (char*)-1)
 930:	83 c4 10             	add    $0x10,%esp
 933:	83 f8 ff             	cmp    $0xffffffff,%eax
 936:	74 1c                	je     954 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 938:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 93b:	83 c0 08             	add    $0x8,%eax
 93e:	83 ec 0c             	sub    $0xc,%esp
 941:	50                   	push   %eax
 942:	e8 54 ff ff ff       	call   89b <free>
  return freep;
 947:	a1 b4 0e 00 00       	mov    0xeb4,%eax
 94c:	83 c4 10             	add    $0x10,%esp
}
 94f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 952:	c9                   	leave  
 953:	c3                   	ret    
    return 0;
 954:	b8 00 00 00 00       	mov    $0x0,%eax
 959:	eb f4                	jmp    94f <morecore+0x44>

0000095b <malloc>:

void*
malloc(uint nbytes)
{
 95b:	55                   	push   %ebp
 95c:	89 e5                	mov    %esp,%ebp
 95e:	53                   	push   %ebx
 95f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 962:	8b 45 08             	mov    0x8(%ebp),%eax
 965:	8d 58 07             	lea    0x7(%eax),%ebx
 968:	c1 eb 03             	shr    $0x3,%ebx
 96b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 96e:	8b 0d b4 0e 00 00    	mov    0xeb4,%ecx
 974:	85 c9                	test   %ecx,%ecx
 976:	74 04                	je     97c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 978:	8b 01                	mov    (%ecx),%eax
 97a:	eb 4a                	jmp    9c6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 97c:	c7 05 b4 0e 00 00 b8 	movl   $0xeb8,0xeb4
 983:	0e 00 00 
 986:	c7 05 b8 0e 00 00 b8 	movl   $0xeb8,0xeb8
 98d:	0e 00 00 
    base.s.size = 0;
 990:	c7 05 bc 0e 00 00 00 	movl   $0x0,0xebc
 997:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 99a:	b9 b8 0e 00 00       	mov    $0xeb8,%ecx
 99f:	eb d7                	jmp    978 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9a1:	74 19                	je     9bc <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9a3:	29 da                	sub    %ebx,%edx
 9a5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9a8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9ab:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9ae:	89 0d b4 0e 00 00    	mov    %ecx,0xeb4
      return (void*)(p + 1);
 9b4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9ba:	c9                   	leave  
 9bb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9bc:	8b 10                	mov    (%eax),%edx
 9be:	89 11                	mov    %edx,(%ecx)
 9c0:	eb ec                	jmp    9ae <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c2:	89 c1                	mov    %eax,%ecx
 9c4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9c6:	8b 50 04             	mov    0x4(%eax),%edx
 9c9:	39 da                	cmp    %ebx,%edx
 9cb:	73 d4                	jae    9a1 <malloc+0x46>
    if(p == freep)
 9cd:	39 05 b4 0e 00 00    	cmp    %eax,0xeb4
 9d3:	75 ed                	jne    9c2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9d5:	89 d8                	mov    %ebx,%eax
 9d7:	e8 2f ff ff ff       	call   90b <morecore>
 9dc:	85 c0                	test   %eax,%eax
 9de:	75 e2                	jne    9c2 <malloc+0x67>
 9e0:	eb d5                	jmp    9b7 <malloc+0x5c>
