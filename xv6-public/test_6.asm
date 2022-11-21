
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
  1c:	a1 c4 0e 00 00       	mov    0xec4,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 39                	push   $0x39
  2c:	68 f0 09 00 00       	push   $0x9f0
  31:	68 f9 09 00 00       	push   $0x9f9
  36:	6a 01                	push   $0x1
  38:	e8 03 07 00 00       	call   740 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 38 0a 00 00       	push   $0xa38
  45:	68 0c 0a 00 00       	push   $0xa0c
  4a:	6a 01                	push   $0x1
  4c:	e8 ef 06 00 00       	call   740 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 20 0a 00 00       	push   $0xa20
  59:	6a 01                	push   $0x1
  5b:	e8 e0 06 00 00       	call   740 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 c8 0e 00 00    	push   0xec8
  69:	e8 ad 05 00 00       	call   61b <kill>
  6e:	e8 78 05 00 00       	call   5eb <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 f0 09 00 00       	push   $0x9f0
  7a:	68 f9 09 00 00       	push   $0x9f9
  7f:	6a 01                	push   $0x1
  81:	e8 ba 06 00 00       	call   740 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 01 0a 00 00       	push   $0xa01
  8e:	68 0c 0a 00 00       	push   $0xa0c
  93:	6a 01                	push   $0x1
  95:	e8 a6 06 00 00       	call   740 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 20 0a 00 00       	push   $0xa20
  a2:	6a 01                	push   $0x1
  a4:	e8 97 06 00 00       	call   740 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 c8 0e 00 00    	push   0xec8
  b2:	e8 64 05 00 00       	call   61b <kill>
  b7:	e8 2f 05 00 00       	call   5eb <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 f0 09 00 00       	push   $0x9f0
  c3:	68 f9 09 00 00       	push   $0x9f9
  c8:	6a 01                	push   $0x1
  ca:	e8 71 06 00 00       	call   740 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 2d 0a 00 00       	push   $0xa2d
  d7:	68 0c 0a 00 00       	push   $0xa0c
  dc:	6a 01                	push   $0x1
  de:	e8 5d 06 00 00       	call   740 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 20 0a 00 00       	push   $0xa20
  eb:	6a 01                	push   $0x1
  ed:	e8 4e 06 00 00       	call   740 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 c8 0e 00 00    	push   0xec8
  fb:	e8 1b 05 00 00       	call   61b <kill>
 100:	e8 e6 04 00 00       	call   5eb <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 c4 0e 00 00       	mov    %eax,0xec4
   exit();
 10d:	e8 d9 04 00 00       	call   5eb <exit>

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
 126:	e8 40 05 00 00       	call   66b <getpid>
 12b:	a3 c8 0e 00 00       	mov    %eax,0xec8
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 29 08 00 00       	call   966 <malloc>
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
 15a:	68 f0 09 00 00       	push   $0x9f0
 15f:	68 f9 09 00 00       	push   $0x9f9
 164:	6a 01                	push   $0x1
 166:	e8 d5 05 00 00       	call   740 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 44 0a 00 00       	push   $0xa44
 173:	68 0c 0a 00 00       	push   $0xa0c
 178:	6a 01                	push   $0x1
 17a:	e8 c1 05 00 00       	call   740 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 20 0a 00 00       	push   $0xa20
 187:	6a 01                	push   $0x1
 189:	e8 b2 05 00 00       	call   740 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 c8 0e 00 00    	push   0xec8
 197:	e8 7f 04 00 00       	call   61b <kill>
 19c:	e8 4a 04 00 00       	call   5eb <exit>
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
 1bf:	e8 c7 04 00 00       	call   68b <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 95 04 00 00       	call   673 <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 89 04 00 00       	call   673 <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 95 04 00 00       	call   693 <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 f0 09 00 00       	push   $0x9f0
 211:	68 f9 09 00 00       	push   $0x9f9
 216:	6a 01                	push   $0x1
 218:	e8 23 05 00 00       	call   740 <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 a8 0a 00 00       	push   $0xaa8
 225:	68 0c 0a 00 00       	push   $0xa0c
 22a:	6a 01                	push   $0x1
 22c:	e8 0f 05 00 00       	call   740 <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 20 0a 00 00       	push   $0xa20
 239:	6a 01                	push   $0x1
 23b:	e8 00 05 00 00       	call   740 <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 c8 0e 00 00    	push   0xec8
 249:	e8 cd 03 00 00       	call   61b <kill>
 24e:	e8 98 03 00 00       	call   5eb <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 f0 09 00 00       	push   $0x9f0
 25a:	68 f9 09 00 00       	push   $0x9f9
 25f:	6a 01                	push   $0x1
 261:	e8 da 04 00 00       	call   740 <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 4e 0a 00 00       	push   $0xa4e
 26e:	68 0c 0a 00 00       	push   $0xa0c
 273:	6a 01                	push   $0x1
 275:	e8 c6 04 00 00       	call   740 <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 20 0a 00 00       	push   $0xa20
 282:	6a 01                	push   $0x1
 284:	e8 b7 04 00 00       	call   740 <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 c8 0e 00 00    	push   0xec8
 292:	e8 84 03 00 00       	call   61b <kill>
 297:	e8 4f 03 00 00       	call   5eb <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 ec 03 00 00       	call   693 <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 f0 09 00 00       	push   $0x9f0
 2c1:	68 f9 09 00 00       	push   $0x9f9
 2c6:	6a 01                	push   $0x1
 2c8:	e8 73 04 00 00       	call   740 <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 7a 0a 00 00       	push   $0xa7a
 2d5:	68 0c 0a 00 00       	push   $0xa0c
 2da:	6a 01                	push   $0x1
 2dc:	e8 5f 04 00 00       	call   740 <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 20 0a 00 00       	push   $0xa20
 2e9:	6a 01                	push   $0x1
 2eb:	e8 50 04 00 00       	call   740 <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 c8 0e 00 00    	push   0xec8
 2f9:	e8 1d 03 00 00       	call   61b <kill>
 2fe:	e8 e8 02 00 00       	call   5eb <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 f0 09 00 00       	push   $0x9f0
 30a:	68 f9 09 00 00       	push   $0x9f9
 30f:	6a 01                	push   $0x1
 311:	e8 2a 04 00 00       	call   740 <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 5c 0a 00 00       	push   $0xa5c
 31e:	68 0c 0a 00 00       	push   $0xa0c
 323:	6a 01                	push   $0x1
 325:	e8 16 04 00 00       	call   740 <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 20 0a 00 00       	push   $0xa20
 332:	6a 01                	push   $0x1
 334:	e8 07 04 00 00       	call   740 <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 c8 0e 00 00    	push   0xec8
 342:	e8 d4 02 00 00       	call   61b <kill>
 347:	e8 9f 02 00 00       	call   5eb <exit>
   assert(global == 2);
 34c:	83 3d c4 0e 00 00 02 	cmpl   $0x2,0xec4
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 f0 09 00 00       	push   $0x9f0
 35c:	68 f9 09 00 00       	push   $0x9f9
 361:	6a 01                	push   $0x1
 363:	e8 d8 03 00 00       	call   740 <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 8f 0a 00 00       	push   $0xa8f
 370:	68 0c 0a 00 00       	push   $0xa0c
 375:	6a 01                	push   $0x1
 377:	e8 c4 03 00 00       	call   740 <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 20 0a 00 00       	push   $0xa20
 384:	6a 01                	push   $0x1
 386:	e8 b5 03 00 00       	call   740 <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 c8 0e 00 00    	push   0xec8
 394:	e8 82 02 00 00       	call   61b <kill>
 399:	e8 4d 02 00 00       	call   5eb <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 9b 0a 00 00       	push   $0xa9b
 3a6:	6a 01                	push   $0x1
 3a8:	e8 93 03 00 00       	call   740 <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 f1 04 00 00       	call   8a6 <free>
   exit();
 3b5:	e8 31 02 00 00       	call   5eb <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 3d1:	68 00 20 00 00       	push   $0x2000
 3d6:	e8 8b 05 00 00       	call   966 <malloc>
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
 3ec:	e8 9a 02 00 00       	call   68b <clone>


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
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 403:	8d 45 f4             	lea    -0xc(%ebp),%eax
 406:	50                   	push   %eax
 407:	e8 87 02 00 00       	call   693 <join>
  
  return pid;
}
 40c:	c9                   	leave  
 40d:	c3                   	ret    

0000040e <lock_acquire>:

void lock_acquire(lock_t *lock){
 40e:	55                   	push   %ebp
 40f:	89 e5                	mov    %esp,%ebp
 411:	53                   	push   %ebx
 412:	83 ec 04             	sub    $0x4,%esp
 415:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	6a 01                	push   $0x1
 41d:	53                   	push   %ebx
 41e:	e8 97 ff ff ff       	call   3ba <test_and_set>
 423:	83 c4 10             	add    $0x10,%esp
 426:	83 f8 01             	cmp    $0x1,%eax
 429:	74 ed                	je     418 <lock_acquire+0xa>
    ;
}
 42b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 42e:	c9                   	leave  
 42f:	c3                   	ret    

00000430 <lock_release>:

void lock_release(lock_t *lock) {
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 43c:	5d                   	pop    %ebp
 43d:	c3                   	ret    

0000043e <lock_init>:

void lock_init(lock_t *lock) {
 43e:	55                   	push   %ebp
 43f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 441:	8b 45 08             	mov    0x8(%ebp),%eax
 444:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 44a:	5d                   	pop    %ebp
 44b:	c3                   	ret    

0000044c <strcpy>:

char*
strcpy(char *s, const char *t)
{
 44c:	55                   	push   %ebp
 44d:	89 e5                	mov    %esp,%ebp
 44f:	56                   	push   %esi
 450:	53                   	push   %ebx
 451:	8b 75 08             	mov    0x8(%ebp),%esi
 454:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 457:	89 f0                	mov    %esi,%eax
 459:	89 d1                	mov    %edx,%ecx
 45b:	83 c2 01             	add    $0x1,%edx
 45e:	89 c3                	mov    %eax,%ebx
 460:	83 c0 01             	add    $0x1,%eax
 463:	0f b6 09             	movzbl (%ecx),%ecx
 466:	88 0b                	mov    %cl,(%ebx)
 468:	84 c9                	test   %cl,%cl
 46a:	75 ed                	jne    459 <strcpy+0xd>
    ;
  return os;
}
 46c:	89 f0                	mov    %esi,%eax
 46e:	5b                   	pop    %ebx
 46f:	5e                   	pop    %esi
 470:	5d                   	pop    %ebp
 471:	c3                   	ret    

00000472 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	8b 4d 08             	mov    0x8(%ebp),%ecx
 478:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 47b:	eb 06                	jmp    483 <strcmp+0x11>
    p++, q++;
 47d:	83 c1 01             	add    $0x1,%ecx
 480:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 483:	0f b6 01             	movzbl (%ecx),%eax
 486:	84 c0                	test   %al,%al
 488:	74 04                	je     48e <strcmp+0x1c>
 48a:	3a 02                	cmp    (%edx),%al
 48c:	74 ef                	je     47d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 48e:	0f b6 c0             	movzbl %al,%eax
 491:	0f b6 12             	movzbl (%edx),%edx
 494:	29 d0                	sub    %edx,%eax
}
 496:	5d                   	pop    %ebp
 497:	c3                   	ret    

00000498 <strlen>:

uint
strlen(const char *s)
{
 498:	55                   	push   %ebp
 499:	89 e5                	mov    %esp,%ebp
 49b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 49e:	b8 00 00 00 00       	mov    $0x0,%eax
 4a3:	eb 03                	jmp    4a8 <strlen+0x10>
 4a5:	83 c0 01             	add    $0x1,%eax
 4a8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4ac:	75 f7                	jne    4a5 <strlen+0xd>
    ;
  return n;
}
 4ae:	5d                   	pop    %ebp
 4af:	c3                   	ret    

000004b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4b7:	89 d7                	mov    %edx,%edi
 4b9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bf:	fc                   	cld    
 4c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4c2:	89 d0                	mov    %edx,%eax
 4c4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4c7:	c9                   	leave  
 4c8:	c3                   	ret    

000004c9 <strchr>:

char*
strchr(const char *s, char c)
{
 4c9:	55                   	push   %ebp
 4ca:	89 e5                	mov    %esp,%ebp
 4cc:	8b 45 08             	mov    0x8(%ebp),%eax
 4cf:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4d3:	eb 03                	jmp    4d8 <strchr+0xf>
 4d5:	83 c0 01             	add    $0x1,%eax
 4d8:	0f b6 10             	movzbl (%eax),%edx
 4db:	84 d2                	test   %dl,%dl
 4dd:	74 06                	je     4e5 <strchr+0x1c>
    if(*s == c)
 4df:	38 ca                	cmp    %cl,%dl
 4e1:	75 f2                	jne    4d5 <strchr+0xc>
 4e3:	eb 05                	jmp    4ea <strchr+0x21>
      return (char*)s;
  return 0;
 4e5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4ea:	5d                   	pop    %ebp
 4eb:	c3                   	ret    

000004ec <gets>:

char*
gets(char *buf, int max)
{
 4ec:	55                   	push   %ebp
 4ed:	89 e5                	mov    %esp,%ebp
 4ef:	57                   	push   %edi
 4f0:	56                   	push   %esi
 4f1:	53                   	push   %ebx
 4f2:	83 ec 1c             	sub    $0x1c,%esp
 4f5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4f8:	bb 00 00 00 00       	mov    $0x0,%ebx
 4fd:	89 de                	mov    %ebx,%esi
 4ff:	83 c3 01             	add    $0x1,%ebx
 502:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 505:	7d 2e                	jge    535 <gets+0x49>
    cc = read(0, &c, 1);
 507:	83 ec 04             	sub    $0x4,%esp
 50a:	6a 01                	push   $0x1
 50c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 50f:	50                   	push   %eax
 510:	6a 00                	push   $0x0
 512:	e8 ec 00 00 00       	call   603 <read>
    if(cc < 1)
 517:	83 c4 10             	add    $0x10,%esp
 51a:	85 c0                	test   %eax,%eax
 51c:	7e 17                	jle    535 <gets+0x49>
      break;
    buf[i++] = c;
 51e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 522:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 525:	3c 0a                	cmp    $0xa,%al
 527:	0f 94 c2             	sete   %dl
 52a:	3c 0d                	cmp    $0xd,%al
 52c:	0f 94 c0             	sete   %al
 52f:	08 c2                	or     %al,%dl
 531:	74 ca                	je     4fd <gets+0x11>
    buf[i++] = c;
 533:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 535:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 539:	89 f8                	mov    %edi,%eax
 53b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53e:	5b                   	pop    %ebx
 53f:	5e                   	pop    %esi
 540:	5f                   	pop    %edi
 541:	5d                   	pop    %ebp
 542:	c3                   	ret    

00000543 <stat>:

int
stat(const char *n, struct stat *st)
{
 543:	55                   	push   %ebp
 544:	89 e5                	mov    %esp,%ebp
 546:	56                   	push   %esi
 547:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 548:	83 ec 08             	sub    $0x8,%esp
 54b:	6a 00                	push   $0x0
 54d:	ff 75 08             	push   0x8(%ebp)
 550:	e8 d6 00 00 00       	call   62b <open>
  if(fd < 0)
 555:	83 c4 10             	add    $0x10,%esp
 558:	85 c0                	test   %eax,%eax
 55a:	78 24                	js     580 <stat+0x3d>
 55c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 55e:	83 ec 08             	sub    $0x8,%esp
 561:	ff 75 0c             	push   0xc(%ebp)
 564:	50                   	push   %eax
 565:	e8 d9 00 00 00       	call   643 <fstat>
 56a:	89 c6                	mov    %eax,%esi
  close(fd);
 56c:	89 1c 24             	mov    %ebx,(%esp)
 56f:	e8 9f 00 00 00       	call   613 <close>
  return r;
 574:	83 c4 10             	add    $0x10,%esp
}
 577:	89 f0                	mov    %esi,%eax
 579:	8d 65 f8             	lea    -0x8(%ebp),%esp
 57c:	5b                   	pop    %ebx
 57d:	5e                   	pop    %esi
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    
    return -1;
 580:	be ff ff ff ff       	mov    $0xffffffff,%esi
 585:	eb f0                	jmp    577 <stat+0x34>

00000587 <atoi>:

int
atoi(const char *s)
{
 587:	55                   	push   %ebp
 588:	89 e5                	mov    %esp,%ebp
 58a:	53                   	push   %ebx
 58b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 58e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 593:	eb 10                	jmp    5a5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 595:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 598:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 59b:	83 c1 01             	add    $0x1,%ecx
 59e:	0f be c0             	movsbl %al,%eax
 5a1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5a5:	0f b6 01             	movzbl (%ecx),%eax
 5a8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5ab:	80 fb 09             	cmp    $0x9,%bl
 5ae:	76 e5                	jbe    595 <atoi+0xe>
  return n;
}
 5b0:	89 d0                	mov    %edx,%eax
 5b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5b5:	c9                   	leave  
 5b6:	c3                   	ret    

000005b7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5b7:	55                   	push   %ebp
 5b8:	89 e5                	mov    %esp,%ebp
 5ba:	56                   	push   %esi
 5bb:	53                   	push   %ebx
 5bc:	8b 75 08             	mov    0x8(%ebp),%esi
 5bf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5c2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5c5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5c7:	eb 0d                	jmp    5d6 <memmove+0x1f>
    *dst++ = *src++;
 5c9:	0f b6 01             	movzbl (%ecx),%eax
 5cc:	88 02                	mov    %al,(%edx)
 5ce:	8d 49 01             	lea    0x1(%ecx),%ecx
 5d1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5d4:	89 d8                	mov    %ebx,%eax
 5d6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5d9:	85 c0                	test   %eax,%eax
 5db:	7f ec                	jg     5c9 <memmove+0x12>
  return vdst;
}
 5dd:	89 f0                	mov    %esi,%eax
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5d                   	pop    %ebp
 5e2:	c3                   	ret    

000005e3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5e3:	b8 01 00 00 00       	mov    $0x1,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <exit>:
SYSCALL(exit)
 5eb:	b8 02 00 00 00       	mov    $0x2,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <wait>:
SYSCALL(wait)
 5f3:	b8 03 00 00 00       	mov    $0x3,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <pipe>:
SYSCALL(pipe)
 5fb:	b8 04 00 00 00       	mov    $0x4,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <read>:
SYSCALL(read)
 603:	b8 05 00 00 00       	mov    $0x5,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <write>:
SYSCALL(write)
 60b:	b8 10 00 00 00       	mov    $0x10,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <close>:
SYSCALL(close)
 613:	b8 15 00 00 00       	mov    $0x15,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <kill>:
SYSCALL(kill)
 61b:	b8 06 00 00 00       	mov    $0x6,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <exec>:
SYSCALL(exec)
 623:	b8 07 00 00 00       	mov    $0x7,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <open>:
SYSCALL(open)
 62b:	b8 0f 00 00 00       	mov    $0xf,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <mknod>:
SYSCALL(mknod)
 633:	b8 11 00 00 00       	mov    $0x11,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <unlink>:
SYSCALL(unlink)
 63b:	b8 12 00 00 00       	mov    $0x12,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <fstat>:
SYSCALL(fstat)
 643:	b8 08 00 00 00       	mov    $0x8,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <link>:
SYSCALL(link)
 64b:	b8 13 00 00 00       	mov    $0x13,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <mkdir>:
SYSCALL(mkdir)
 653:	b8 14 00 00 00       	mov    $0x14,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <chdir>:
SYSCALL(chdir)
 65b:	b8 09 00 00 00       	mov    $0x9,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <dup>:
SYSCALL(dup)
 663:	b8 0a 00 00 00       	mov    $0xa,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <getpid>:
SYSCALL(getpid)
 66b:	b8 0b 00 00 00       	mov    $0xb,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <sbrk>:
SYSCALL(sbrk)
 673:	b8 0c 00 00 00       	mov    $0xc,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <sleep>:
SYSCALL(sleep)
 67b:	b8 0d 00 00 00       	mov    $0xd,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <uptime>:
SYSCALL(uptime)
 683:	b8 0e 00 00 00       	mov    $0xe,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <clone>:
SYSCALL(clone)
 68b:	b8 16 00 00 00       	mov    $0x16,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <join>:
 693:	b8 17 00 00 00       	mov    $0x17,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 69b:	55                   	push   %ebp
 69c:	89 e5                	mov    %esp,%ebp
 69e:	83 ec 1c             	sub    $0x1c,%esp
 6a1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6a4:	6a 01                	push   $0x1
 6a6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6a9:	52                   	push   %edx
 6aa:	50                   	push   %eax
 6ab:	e8 5b ff ff ff       	call   60b <write>
}
 6b0:	83 c4 10             	add    $0x10,%esp
 6b3:	c9                   	leave  
 6b4:	c3                   	ret    

000006b5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6b5:	55                   	push   %ebp
 6b6:	89 e5                	mov    %esp,%ebp
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	53                   	push   %ebx
 6bb:	83 ec 2c             	sub    $0x2c,%esp
 6be:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c1:	89 d0                	mov    %edx,%eax
 6c3:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6c5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6c9:	0f 95 c1             	setne  %cl
 6cc:	c1 ea 1f             	shr    $0x1f,%edx
 6cf:	84 d1                	test   %dl,%cl
 6d1:	74 44                	je     717 <printint+0x62>
    neg = 1;
    x = -xx;
 6d3:	f7 d8                	neg    %eax
 6d5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6d7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6de:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6e3:	89 c8                	mov    %ecx,%eax
 6e5:	ba 00 00 00 00       	mov    $0x0,%edx
 6ea:	f7 f6                	div    %esi
 6ec:	89 df                	mov    %ebx,%edi
 6ee:	83 c3 01             	add    $0x1,%ebx
 6f1:	0f b6 92 34 0b 00 00 	movzbl 0xb34(%edx),%edx
 6f8:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6fc:	89 ca                	mov    %ecx,%edx
 6fe:	89 c1                	mov    %eax,%ecx
 700:	39 d6                	cmp    %edx,%esi
 702:	76 df                	jbe    6e3 <printint+0x2e>
  if(neg)
 704:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 708:	74 31                	je     73b <printint+0x86>
    buf[i++] = '-';
 70a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 70f:	8d 5f 02             	lea    0x2(%edi),%ebx
 712:	8b 75 d0             	mov    -0x30(%ebp),%esi
 715:	eb 17                	jmp    72e <printint+0x79>
    x = xx;
 717:	89 c1                	mov    %eax,%ecx
  neg = 0;
 719:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 720:	eb bc                	jmp    6de <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 722:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 727:	89 f0                	mov    %esi,%eax
 729:	e8 6d ff ff ff       	call   69b <putc>
  while(--i >= 0)
 72e:	83 eb 01             	sub    $0x1,%ebx
 731:	79 ef                	jns    722 <printint+0x6d>
}
 733:	83 c4 2c             	add    $0x2c,%esp
 736:	5b                   	pop    %ebx
 737:	5e                   	pop    %esi
 738:	5f                   	pop    %edi
 739:	5d                   	pop    %ebp
 73a:	c3                   	ret    
 73b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 73e:	eb ee                	jmp    72e <printint+0x79>

00000740 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 749:	8d 45 10             	lea    0x10(%ebp),%eax
 74c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 74f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 754:	bb 00 00 00 00       	mov    $0x0,%ebx
 759:	eb 14                	jmp    76f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 75b:	89 fa                	mov    %edi,%edx
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	e8 36 ff ff ff       	call   69b <putc>
 765:	eb 05                	jmp    76c <printf+0x2c>
      }
    } else if(state == '%'){
 767:	83 fe 25             	cmp    $0x25,%esi
 76a:	74 25                	je     791 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 76c:	83 c3 01             	add    $0x1,%ebx
 76f:	8b 45 0c             	mov    0xc(%ebp),%eax
 772:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 776:	84 c0                	test   %al,%al
 778:	0f 84 20 01 00 00    	je     89e <printf+0x15e>
    c = fmt[i] & 0xff;
 77e:	0f be f8             	movsbl %al,%edi
 781:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 784:	85 f6                	test   %esi,%esi
 786:	75 df                	jne    767 <printf+0x27>
      if(c == '%'){
 788:	83 f8 25             	cmp    $0x25,%eax
 78b:	75 ce                	jne    75b <printf+0x1b>
        state = '%';
 78d:	89 c6                	mov    %eax,%esi
 78f:	eb db                	jmp    76c <printf+0x2c>
      if(c == 'd'){
 791:	83 f8 25             	cmp    $0x25,%eax
 794:	0f 84 cf 00 00 00    	je     869 <printf+0x129>
 79a:	0f 8c dd 00 00 00    	jl     87d <printf+0x13d>
 7a0:	83 f8 78             	cmp    $0x78,%eax
 7a3:	0f 8f d4 00 00 00    	jg     87d <printf+0x13d>
 7a9:	83 f8 63             	cmp    $0x63,%eax
 7ac:	0f 8c cb 00 00 00    	jl     87d <printf+0x13d>
 7b2:	83 e8 63             	sub    $0x63,%eax
 7b5:	83 f8 15             	cmp    $0x15,%eax
 7b8:	0f 87 bf 00 00 00    	ja     87d <printf+0x13d>
 7be:	ff 24 85 dc 0a 00 00 	jmp    *0xadc(,%eax,4)
        printint(fd, *ap, 10, 1);
 7c5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c8:	8b 17                	mov    (%edi),%edx
 7ca:	83 ec 0c             	sub    $0xc,%esp
 7cd:	6a 01                	push   $0x1
 7cf:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7d4:	8b 45 08             	mov    0x8(%ebp),%eax
 7d7:	e8 d9 fe ff ff       	call   6b5 <printint>
        ap++;
 7dc:	83 c7 04             	add    $0x4,%edi
 7df:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7e2:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7e5:	be 00 00 00 00       	mov    $0x0,%esi
 7ea:	eb 80                	jmp    76c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7ec:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ef:	8b 17                	mov    (%edi),%edx
 7f1:	83 ec 0c             	sub    $0xc,%esp
 7f4:	6a 00                	push   $0x0
 7f6:	b9 10 00 00 00       	mov    $0x10,%ecx
 7fb:	8b 45 08             	mov    0x8(%ebp),%eax
 7fe:	e8 b2 fe ff ff       	call   6b5 <printint>
        ap++;
 803:	83 c7 04             	add    $0x4,%edi
 806:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 809:	83 c4 10             	add    $0x10,%esp
      state = 0;
 80c:	be 00 00 00 00       	mov    $0x0,%esi
 811:	e9 56 ff ff ff       	jmp    76c <printf+0x2c>
        s = (char*)*ap;
 816:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 819:	8b 30                	mov    (%eax),%esi
        ap++;
 81b:	83 c0 04             	add    $0x4,%eax
 81e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 821:	85 f6                	test   %esi,%esi
 823:	75 15                	jne    83a <printf+0xfa>
          s = "(null)";
 825:	be d3 0a 00 00       	mov    $0xad3,%esi
 82a:	eb 0e                	jmp    83a <printf+0xfa>
          putc(fd, *s);
 82c:	0f be d2             	movsbl %dl,%edx
 82f:	8b 45 08             	mov    0x8(%ebp),%eax
 832:	e8 64 fe ff ff       	call   69b <putc>
          s++;
 837:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 83a:	0f b6 16             	movzbl (%esi),%edx
 83d:	84 d2                	test   %dl,%dl
 83f:	75 eb                	jne    82c <printf+0xec>
      state = 0;
 841:	be 00 00 00 00       	mov    $0x0,%esi
 846:	e9 21 ff ff ff       	jmp    76c <printf+0x2c>
        putc(fd, *ap);
 84b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 84e:	0f be 17             	movsbl (%edi),%edx
 851:	8b 45 08             	mov    0x8(%ebp),%eax
 854:	e8 42 fe ff ff       	call   69b <putc>
        ap++;
 859:	83 c7 04             	add    $0x4,%edi
 85c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 85f:	be 00 00 00 00       	mov    $0x0,%esi
 864:	e9 03 ff ff ff       	jmp    76c <printf+0x2c>
        putc(fd, c);
 869:	89 fa                	mov    %edi,%edx
 86b:	8b 45 08             	mov    0x8(%ebp),%eax
 86e:	e8 28 fe ff ff       	call   69b <putc>
      state = 0;
 873:	be 00 00 00 00       	mov    $0x0,%esi
 878:	e9 ef fe ff ff       	jmp    76c <printf+0x2c>
        putc(fd, '%');
 87d:	ba 25 00 00 00       	mov    $0x25,%edx
 882:	8b 45 08             	mov    0x8(%ebp),%eax
 885:	e8 11 fe ff ff       	call   69b <putc>
        putc(fd, c);
 88a:	89 fa                	mov    %edi,%edx
 88c:	8b 45 08             	mov    0x8(%ebp),%eax
 88f:	e8 07 fe ff ff       	call   69b <putc>
      state = 0;
 894:	be 00 00 00 00       	mov    $0x0,%esi
 899:	e9 ce fe ff ff       	jmp    76c <printf+0x2c>
    }
  }
}
 89e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8a1:	5b                   	pop    %ebx
 8a2:	5e                   	pop    %esi
 8a3:	5f                   	pop    %edi
 8a4:	5d                   	pop    %ebp
 8a5:	c3                   	ret    

000008a6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a6:	55                   	push   %ebp
 8a7:	89 e5                	mov    %esp,%ebp
 8a9:	57                   	push   %edi
 8aa:	56                   	push   %esi
 8ab:	53                   	push   %ebx
 8ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8af:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b2:	a1 cc 0e 00 00       	mov    0xecc,%eax
 8b7:	eb 02                	jmp    8bb <free+0x15>
 8b9:	89 d0                	mov    %edx,%eax
 8bb:	39 c8                	cmp    %ecx,%eax
 8bd:	73 04                	jae    8c3 <free+0x1d>
 8bf:	39 08                	cmp    %ecx,(%eax)
 8c1:	77 12                	ja     8d5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c3:	8b 10                	mov    (%eax),%edx
 8c5:	39 c2                	cmp    %eax,%edx
 8c7:	77 f0                	ja     8b9 <free+0x13>
 8c9:	39 c8                	cmp    %ecx,%eax
 8cb:	72 08                	jb     8d5 <free+0x2f>
 8cd:	39 ca                	cmp    %ecx,%edx
 8cf:	77 04                	ja     8d5 <free+0x2f>
 8d1:	89 d0                	mov    %edx,%eax
 8d3:	eb e6                	jmp    8bb <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8d5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8d8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8db:	8b 10                	mov    (%eax),%edx
 8dd:	39 d7                	cmp    %edx,%edi
 8df:	74 19                	je     8fa <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8e1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8e4:	8b 50 04             	mov    0x4(%eax),%edx
 8e7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8ea:	39 ce                	cmp    %ecx,%esi
 8ec:	74 1b                	je     909 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8ee:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8f0:	a3 cc 0e 00 00       	mov    %eax,0xecc
}
 8f5:	5b                   	pop    %ebx
 8f6:	5e                   	pop    %esi
 8f7:	5f                   	pop    %edi
 8f8:	5d                   	pop    %ebp
 8f9:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8fa:	03 72 04             	add    0x4(%edx),%esi
 8fd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 900:	8b 10                	mov    (%eax),%edx
 902:	8b 12                	mov    (%edx),%edx
 904:	89 53 f8             	mov    %edx,-0x8(%ebx)
 907:	eb db                	jmp    8e4 <free+0x3e>
    p->s.size += bp->s.size;
 909:	03 53 fc             	add    -0x4(%ebx),%edx
 90c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 90f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 912:	89 10                	mov    %edx,(%eax)
 914:	eb da                	jmp    8f0 <free+0x4a>

00000916 <morecore>:

static Header*
morecore(uint nu)
{
 916:	55                   	push   %ebp
 917:	89 e5                	mov    %esp,%ebp
 919:	53                   	push   %ebx
 91a:	83 ec 04             	sub    $0x4,%esp
 91d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 91f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 924:	77 05                	ja     92b <morecore+0x15>
    nu = 4096;
 926:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 92b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 932:	83 ec 0c             	sub    $0xc,%esp
 935:	50                   	push   %eax
 936:	e8 38 fd ff ff       	call   673 <sbrk>
  if(p == (char*)-1)
 93b:	83 c4 10             	add    $0x10,%esp
 93e:	83 f8 ff             	cmp    $0xffffffff,%eax
 941:	74 1c                	je     95f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 943:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 946:	83 c0 08             	add    $0x8,%eax
 949:	83 ec 0c             	sub    $0xc,%esp
 94c:	50                   	push   %eax
 94d:	e8 54 ff ff ff       	call   8a6 <free>
  return freep;
 952:	a1 cc 0e 00 00       	mov    0xecc,%eax
 957:	83 c4 10             	add    $0x10,%esp
}
 95a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 95d:	c9                   	leave  
 95e:	c3                   	ret    
    return 0;
 95f:	b8 00 00 00 00       	mov    $0x0,%eax
 964:	eb f4                	jmp    95a <morecore+0x44>

00000966 <malloc>:

void*
malloc(uint nbytes)
{
 966:	55                   	push   %ebp
 967:	89 e5                	mov    %esp,%ebp
 969:	53                   	push   %ebx
 96a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 96d:	8b 45 08             	mov    0x8(%ebp),%eax
 970:	8d 58 07             	lea    0x7(%eax),%ebx
 973:	c1 eb 03             	shr    $0x3,%ebx
 976:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 979:	8b 0d cc 0e 00 00    	mov    0xecc,%ecx
 97f:	85 c9                	test   %ecx,%ecx
 981:	74 04                	je     987 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 983:	8b 01                	mov    (%ecx),%eax
 985:	eb 4a                	jmp    9d1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 987:	c7 05 cc 0e 00 00 d0 	movl   $0xed0,0xecc
 98e:	0e 00 00 
 991:	c7 05 d0 0e 00 00 d0 	movl   $0xed0,0xed0
 998:	0e 00 00 
    base.s.size = 0;
 99b:	c7 05 d4 0e 00 00 00 	movl   $0x0,0xed4
 9a2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9a5:	b9 d0 0e 00 00       	mov    $0xed0,%ecx
 9aa:	eb d7                	jmp    983 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9ac:	74 19                	je     9c7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9ae:	29 da                	sub    %ebx,%edx
 9b0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9b3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9b6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9b9:	89 0d cc 0e 00 00    	mov    %ecx,0xecc
      return (void*)(p + 1);
 9bf:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9c5:	c9                   	leave  
 9c6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9c7:	8b 10                	mov    (%eax),%edx
 9c9:	89 11                	mov    %edx,(%ecx)
 9cb:	eb ec                	jmp    9b9 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9cd:	89 c1                	mov    %eax,%ecx
 9cf:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9d1:	8b 50 04             	mov    0x4(%eax),%edx
 9d4:	39 da                	cmp    %ebx,%edx
 9d6:	73 d4                	jae    9ac <malloc+0x46>
    if(p == freep)
 9d8:	39 05 cc 0e 00 00    	cmp    %eax,0xecc
 9de:	75 ed                	jne    9cd <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9e0:	89 d8                	mov    %ebx,%eax
 9e2:	e8 2f ff ff ff       	call   916 <morecore>
 9e7:	85 c0                	test   %eax,%eax
 9e9:	75 e2                	jne    9cd <malloc+0x67>
 9eb:	eb d5                	jmp    9c2 <malloc+0x5c>
