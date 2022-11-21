
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   7:	8b 55 08             	mov    0x8(%ebp),%edx
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   int tmp1 = *(int*)arg1;
   d:	8b 0a                	mov    (%edx),%ecx
   int tmp2 = *(int*)arg2;
   f:	8b 18                	mov    (%eax),%ebx
   *(int*)arg1 = 44;
  11:	c7 02 2c 00 00 00    	movl   $0x2c,(%edx)
   *(int*)arg2 = 55;
  17:	c7 00 37 00 00 00    	movl   $0x37,(%eax)
   assert(global == 1);
  1d:	a1 d4 0d 00 00       	mov    0xdd4,%eax
  22:	83 f8 01             	cmp    $0x1,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 38                	push   $0x38
  29:	68 4c 09 00 00       	push   $0x94c
  2e:	68 55 09 00 00       	push   $0x955
  33:	6a 01                	push   $0x1
  35:	e8 65 06 00 00       	call   69f <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 5d 09 00 00       	push   $0x95d
  42:	68 69 09 00 00       	push   $0x969
  47:	6a 01                	push   $0x1
  49:	e8 51 06 00 00       	call   69f <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 7d 09 00 00       	push   $0x97d
  56:	6a 01                	push   $0x1
  58:	e8 42 06 00 00       	call   69f <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 e0 0d 00 00    	push   0xde0
  66:	e8 0f 05 00 00       	call   57a <kill>
  6b:	e8 da 04 00 00       	call   54a <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d d4 0d 00 00    	mov    %ecx,0xdd4
   exit();
  78:	e8 cd 04 00 00       	call   54a <exit>

0000007d <main>:
{
  7d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  81:	83 e4 f0             	and    $0xfffffff0,%esp
  84:	ff 71 fc             	push   -0x4(%ecx)
  87:	55                   	push   %ebp
  88:	89 e5                	mov    %esp,%ebp
  8a:	56                   	push   %esi
  8b:	53                   	push   %ebx
  8c:	51                   	push   %ecx
  8d:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  90:	e8 35 05 00 00       	call   5ca <getpid>
  95:	a3 e0 0d 00 00       	mov    %eax,0xde0
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
  a2:	e8 1e 08 00 00       	call   8c5 <malloc>
   assert(p != NULL);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	0f 84 a6 00 00 00    	je     158 <main+0xdb>
  b2:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b4:	89 c2                	mov    %eax,%edx
  b6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  bc:	74 09                	je     c7 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  be:	b8 00 10 00 00       	mov    $0x1000,%eax
  c3:	29 d0                	sub    %edx,%eax
  c5:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, (void*)&arg1, (void*)&arg2, stack);
  c7:	50                   	push   %eax
  c8:	68 d8 0d 00 00       	push   $0xdd8
  cd:	68 dc 0d 00 00       	push   $0xddc
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 0e 05 00 00       	call   5ea <clone>
  dc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 8e b8 00 00 00    	jle    1a1 <main+0x124>
   while(global != 33);
  e9:	a1 d4 0d 00 00       	mov    0xdd4,%eax
  ee:	83 f8 21             	cmp    $0x21,%eax
  f1:	75 f6                	jne    e9 <main+0x6c>
   assert(arg1 == 44);
  f3:	a1 dc 0d 00 00       	mov    0xddc,%eax
  f8:	83 f8 2c             	cmp    $0x2c,%eax
  fb:	0f 85 e9 00 00 00    	jne    1ea <main+0x16d>
   assert(arg2 == 55);
 101:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 106:	83 f8 37             	cmp    $0x37,%eax
 109:	0f 84 24 01 00 00    	je     233 <main+0x1b6>
 10f:	6a 28                	push   $0x28
 111:	68 4c 09 00 00       	push   $0x94c
 116:	68 55 09 00 00       	push   $0x955
 11b:	6a 01                	push   $0x1
 11d:	e8 7d 05 00 00       	call   69f <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 ad 09 00 00       	push   $0x9ad
 12a:	68 69 09 00 00       	push   $0x969
 12f:	6a 01                	push   $0x1
 131:	e8 69 05 00 00       	call   69f <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 7d 09 00 00       	push   $0x97d
 13e:	6a 01                	push   $0x1
 140:	e8 5a 05 00 00       	call   69f <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 e0 0d 00 00    	push   0xde0
 14e:	e8 27 04 00 00       	call   57a <kill>
 153:	e8 f2 03 00 00       	call   54a <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 4c 09 00 00       	push   $0x94c
 15f:	68 55 09 00 00       	push   $0x955
 164:	6a 01                	push   $0x1
 166:	e8 34 05 00 00       	call   69f <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 8a 09 00 00       	push   $0x98a
 173:	68 69 09 00 00       	push   $0x969
 178:	6a 01                	push   $0x1
 17a:	e8 20 05 00 00       	call   69f <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 7d 09 00 00       	push   $0x97d
 187:	6a 01                	push   $0x1
 189:	e8 11 05 00 00       	call   69f <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 e0 0d 00 00    	push   0xde0
 197:	e8 de 03 00 00       	call   57a <kill>
 19c:	e8 a9 03 00 00       	call   54a <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 4c 09 00 00       	push   $0x94c
 1a8:	68 55 09 00 00       	push   $0x955
 1ad:	6a 01                	push   $0x1
 1af:	e8 eb 04 00 00       	call   69f <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 94 09 00 00       	push   $0x994
 1bc:	68 69 09 00 00       	push   $0x969
 1c1:	6a 01                	push   $0x1
 1c3:	e8 d7 04 00 00       	call   69f <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 7d 09 00 00       	push   $0x97d
 1d0:	6a 01                	push   $0x1
 1d2:	e8 c8 04 00 00       	call   69f <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 e0 0d 00 00    	push   0xde0
 1e0:	e8 95 03 00 00       	call   57a <kill>
 1e5:	e8 60 03 00 00       	call   54a <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 4c 09 00 00       	push   $0x94c
 1f1:	68 55 09 00 00       	push   $0x955
 1f6:	6a 01                	push   $0x1
 1f8:	e8 a2 04 00 00       	call   69f <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 a2 09 00 00       	push   $0x9a2
 205:	68 69 09 00 00       	push   $0x969
 20a:	6a 01                	push   $0x1
 20c:	e8 8e 04 00 00       	call   69f <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 7d 09 00 00       	push   $0x97d
 219:	6a 01                	push   $0x1
 21b:	e8 7f 04 00 00       	call   69f <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 e0 0d 00 00    	push   0xde0
 229:	e8 4c 03 00 00       	call   57a <kill>
 22e:	e8 17 03 00 00       	call   54a <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 b8 09 00 00       	push   $0x9b8
 23b:	6a 01                	push   $0x1
 23d:	e8 5d 04 00 00       	call   69f <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 a5 03 00 00       	call   5f2 <join>
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
 256:	68 4c 09 00 00       	push   $0x94c
 25b:	68 55 09 00 00       	push   $0x955
 260:	6a 01                	push   $0x1
 262:	e8 38 04 00 00       	call   69f <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 c5 09 00 00       	push   $0x9c5
 26f:	68 69 09 00 00       	push   $0x969
 274:	6a 01                	push   $0x1
 276:	e8 24 04 00 00       	call   69f <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 7d 09 00 00       	push   $0x97d
 283:	6a 01                	push   $0x1
 285:	e8 15 04 00 00       	call   69f <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 e0 0d 00 00    	push   0xde0
 293:	e8 e2 02 00 00       	call   57a <kill>
 298:	e8 ad 02 00 00       	call   54a <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 5f 05 00 00       	call   805 <free>
   exit();
 2a6:	e8 9f 02 00 00       	call   54a <exit>

000002ab <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 2ab:	55                   	push   %ebp
 2ac:	89 e5                	mov    %esp,%ebp
 2ae:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2b1:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2b3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b6:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2b8:	89 d0                	mov    %edx,%eax
 2ba:	5d                   	pop    %ebp
 2bb:	c3                   	ret    

000002bc <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	53                   	push   %ebx
 2c0:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2c3:	68 00 20 00 00       	push   $0x2000
 2c8:	e8 f8 05 00 00       	call   8c5 <malloc>
  if(n_stack == 0){
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	74 41                	je     315 <thread_create+0x59>
 2d4:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 2d6:	50                   	push   %eax
 2d7:	ff 75 10             	push   0x10(%ebp)
 2da:	ff 75 0c             	push   0xc(%ebp)
 2dd:	ff 75 08             	push   0x8(%ebp)
 2e0:	e8 05 03 00 00       	call   5ea <clone>

  for(int i=0; i<64; i++){
 2e5:	83 c4 10             	add    $0x10,%esp
 2e8:	ba 00 00 00 00       	mov    $0x0,%edx
 2ed:	eb 03                	jmp    2f2 <thread_create+0x36>
 2ef:	83 c2 01             	add    $0x1,%edx
 2f2:	83 fa 3f             	cmp    $0x3f,%edx
 2f5:	7f 19                	jg     310 <thread_create+0x54>
    if(threads[i]->flag==0){
 2f7:	8b 0c 95 00 0e 00 00 	mov    0xe00(,%edx,4),%ecx
 2fe:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 302:	75 eb                	jne    2ef <thread_create+0x33>
      threads[i]->maddr = n_stack;
 304:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 306:	8b 14 95 00 0e 00 00 	mov    0xe00(,%edx,4),%edx
 30d:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 310:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 313:	c9                   	leave  
 314:	c3                   	ret    
    return -1;
 315:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 31a:	eb f4                	jmp    310 <thread_create+0x54>

0000031c <thread_join>:

//TODO: fix
int thread_join() {
 31c:	55                   	push   %ebp
 31d:	89 e5                	mov    %esp,%ebp
 31f:	56                   	push   %esi
 320:	53                   	push   %ebx
 321:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 324:	8d 45 f4             	lea    -0xc(%ebp),%eax
 327:	50                   	push   %eax
 328:	e8 c5 02 00 00       	call   5f2 <join>
 32d:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 32f:	83 c4 10             	add    $0x10,%esp
 332:	bb 00 00 00 00       	mov    $0x0,%ebx
 337:	eb 03                	jmp    33c <thread_join+0x20>
 339:	83 c3 01             	add    $0x1,%ebx
 33c:	83 fb 3f             	cmp    $0x3f,%ebx
 33f:	7f 23                	jg     364 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 341:	8b 04 9d 00 0e 00 00 	mov    0xe00(,%ebx,4),%eax
 348:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 34c:	75 eb                	jne    339 <thread_join+0x1d>
 34e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 351:	39 50 04             	cmp    %edx,0x4(%eax)
 354:	75 e3                	jne    339 <thread_join+0x1d>
      free(stk_addr);
 356:	83 ec 0c             	sub    $0xc,%esp
 359:	52                   	push   %edx
 35a:	e8 a6 04 00 00       	call   805 <free>
 35f:	83 c4 10             	add    $0x10,%esp
 362:	eb d5                	jmp    339 <thread_join+0x1d>
    }
  }
  return pid;
}
 364:	89 f0                	mov    %esi,%eax
 366:	8d 65 f8             	lea    -0x8(%ebp),%esp
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    

0000036d <lock_acquire>:

void lock_acquire(lock_t *lock){
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
 370:	53                   	push   %ebx
 371:	83 ec 04             	sub    $0x4,%esp
 374:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 377:	83 ec 08             	sub    $0x8,%esp
 37a:	6a 01                	push   $0x1
 37c:	53                   	push   %ebx
 37d:	e8 29 ff ff ff       	call   2ab <test_and_set>
 382:	83 c4 10             	add    $0x10,%esp
 385:	83 f8 01             	cmp    $0x1,%eax
 388:	74 ed                	je     377 <lock_acquire+0xa>
    ;
}
 38a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38d:	c9                   	leave  
 38e:	c3                   	ret    

0000038f <lock_release>:

void lock_release(lock_t *lock) {
 38f:	55                   	push   %ebp
 390:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 392:	8b 45 08             	mov    0x8(%ebp),%eax
 395:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    

0000039d <lock_init>:

void lock_init(lock_t *lock) {
 39d:	55                   	push   %ebp
 39e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3a0:	8b 45 08             	mov    0x8(%ebp),%eax
 3a3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    

000003ab <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	56                   	push   %esi
 3af:	53                   	push   %ebx
 3b0:	8b 75 08             	mov    0x8(%ebp),%esi
 3b3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3b6:	89 f0                	mov    %esi,%eax
 3b8:	89 d1                	mov    %edx,%ecx
 3ba:	83 c2 01             	add    $0x1,%edx
 3bd:	89 c3                	mov    %eax,%ebx
 3bf:	83 c0 01             	add    $0x1,%eax
 3c2:	0f b6 09             	movzbl (%ecx),%ecx
 3c5:	88 0b                	mov    %cl,(%ebx)
 3c7:	84 c9                	test   %cl,%cl
 3c9:	75 ed                	jne    3b8 <strcpy+0xd>
    ;
  return os;
}
 3cb:	89 f0                	mov    %esi,%eax
 3cd:	5b                   	pop    %ebx
 3ce:	5e                   	pop    %esi
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    

000003d1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d1:	55                   	push   %ebp
 3d2:	89 e5                	mov    %esp,%ebp
 3d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3da:	eb 06                	jmp    3e2 <strcmp+0x11>
    p++, q++;
 3dc:	83 c1 01             	add    $0x1,%ecx
 3df:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3e2:	0f b6 01             	movzbl (%ecx),%eax
 3e5:	84 c0                	test   %al,%al
 3e7:	74 04                	je     3ed <strcmp+0x1c>
 3e9:	3a 02                	cmp    (%edx),%al
 3eb:	74 ef                	je     3dc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3ed:	0f b6 c0             	movzbl %al,%eax
 3f0:	0f b6 12             	movzbl (%edx),%edx
 3f3:	29 d0                	sub    %edx,%eax
}
 3f5:	5d                   	pop    %ebp
 3f6:	c3                   	ret    

000003f7 <strlen>:

uint
strlen(const char *s)
{
 3f7:	55                   	push   %ebp
 3f8:	89 e5                	mov    %esp,%ebp
 3fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3fd:	b8 00 00 00 00       	mov    $0x0,%eax
 402:	eb 03                	jmp    407 <strlen+0x10>
 404:	83 c0 01             	add    $0x1,%eax
 407:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 40b:	75 f7                	jne    404 <strlen+0xd>
    ;
  return n;
}
 40d:	5d                   	pop    %ebp
 40e:	c3                   	ret    

0000040f <memset>:

void*
memset(void *dst, int c, uint n)
{
 40f:	55                   	push   %ebp
 410:	89 e5                	mov    %esp,%ebp
 412:	57                   	push   %edi
 413:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 416:	89 d7                	mov    %edx,%edi
 418:	8b 4d 10             	mov    0x10(%ebp),%ecx
 41b:	8b 45 0c             	mov    0xc(%ebp),%eax
 41e:	fc                   	cld    
 41f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 421:	89 d0                	mov    %edx,%eax
 423:	8b 7d fc             	mov    -0x4(%ebp),%edi
 426:	c9                   	leave  
 427:	c3                   	ret    

00000428 <strchr>:

char*
strchr(const char *s, char c)
{
 428:	55                   	push   %ebp
 429:	89 e5                	mov    %esp,%ebp
 42b:	8b 45 08             	mov    0x8(%ebp),%eax
 42e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 432:	eb 03                	jmp    437 <strchr+0xf>
 434:	83 c0 01             	add    $0x1,%eax
 437:	0f b6 10             	movzbl (%eax),%edx
 43a:	84 d2                	test   %dl,%dl
 43c:	74 06                	je     444 <strchr+0x1c>
    if(*s == c)
 43e:	38 ca                	cmp    %cl,%dl
 440:	75 f2                	jne    434 <strchr+0xc>
 442:	eb 05                	jmp    449 <strchr+0x21>
      return (char*)s;
  return 0;
 444:	b8 00 00 00 00       	mov    $0x0,%eax
}
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret    

0000044b <gets>:

char*
gets(char *buf, int max)
{
 44b:	55                   	push   %ebp
 44c:	89 e5                	mov    %esp,%ebp
 44e:	57                   	push   %edi
 44f:	56                   	push   %esi
 450:	53                   	push   %ebx
 451:	83 ec 1c             	sub    $0x1c,%esp
 454:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 457:	bb 00 00 00 00       	mov    $0x0,%ebx
 45c:	89 de                	mov    %ebx,%esi
 45e:	83 c3 01             	add    $0x1,%ebx
 461:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 464:	7d 2e                	jge    494 <gets+0x49>
    cc = read(0, &c, 1);
 466:	83 ec 04             	sub    $0x4,%esp
 469:	6a 01                	push   $0x1
 46b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 46e:	50                   	push   %eax
 46f:	6a 00                	push   $0x0
 471:	e8 ec 00 00 00       	call   562 <read>
    if(cc < 1)
 476:	83 c4 10             	add    $0x10,%esp
 479:	85 c0                	test   %eax,%eax
 47b:	7e 17                	jle    494 <gets+0x49>
      break;
    buf[i++] = c;
 47d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 481:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 484:	3c 0a                	cmp    $0xa,%al
 486:	0f 94 c2             	sete   %dl
 489:	3c 0d                	cmp    $0xd,%al
 48b:	0f 94 c0             	sete   %al
 48e:	08 c2                	or     %al,%dl
 490:	74 ca                	je     45c <gets+0x11>
    buf[i++] = c;
 492:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 494:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 498:	89 f8                	mov    %edi,%eax
 49a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49d:	5b                   	pop    %ebx
 49e:	5e                   	pop    %esi
 49f:	5f                   	pop    %edi
 4a0:	5d                   	pop    %ebp
 4a1:	c3                   	ret    

000004a2 <stat>:

int
stat(const char *n, struct stat *st)
{
 4a2:	55                   	push   %ebp
 4a3:	89 e5                	mov    %esp,%ebp
 4a5:	56                   	push   %esi
 4a6:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4a7:	83 ec 08             	sub    $0x8,%esp
 4aa:	6a 00                	push   $0x0
 4ac:	ff 75 08             	push   0x8(%ebp)
 4af:	e8 d6 00 00 00       	call   58a <open>
  if(fd < 0)
 4b4:	83 c4 10             	add    $0x10,%esp
 4b7:	85 c0                	test   %eax,%eax
 4b9:	78 24                	js     4df <stat+0x3d>
 4bb:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4bd:	83 ec 08             	sub    $0x8,%esp
 4c0:	ff 75 0c             	push   0xc(%ebp)
 4c3:	50                   	push   %eax
 4c4:	e8 d9 00 00 00       	call   5a2 <fstat>
 4c9:	89 c6                	mov    %eax,%esi
  close(fd);
 4cb:	89 1c 24             	mov    %ebx,(%esp)
 4ce:	e8 9f 00 00 00       	call   572 <close>
  return r;
 4d3:	83 c4 10             	add    $0x10,%esp
}
 4d6:	89 f0                	mov    %esi,%eax
 4d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4db:	5b                   	pop    %ebx
 4dc:	5e                   	pop    %esi
 4dd:	5d                   	pop    %ebp
 4de:	c3                   	ret    
    return -1;
 4df:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4e4:	eb f0                	jmp    4d6 <stat+0x34>

000004e6 <atoi>:

int
atoi(const char *s)
{
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	53                   	push   %ebx
 4ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4ed:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4f2:	eb 10                	jmp    504 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4f4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4f7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4fa:	83 c1 01             	add    $0x1,%ecx
 4fd:	0f be c0             	movsbl %al,%eax
 500:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 504:	0f b6 01             	movzbl (%ecx),%eax
 507:	8d 58 d0             	lea    -0x30(%eax),%ebx
 50a:	80 fb 09             	cmp    $0x9,%bl
 50d:	76 e5                	jbe    4f4 <atoi+0xe>
  return n;
}
 50f:	89 d0                	mov    %edx,%eax
 511:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 514:	c9                   	leave  
 515:	c3                   	ret    

00000516 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	56                   	push   %esi
 51a:	53                   	push   %ebx
 51b:	8b 75 08             	mov    0x8(%ebp),%esi
 51e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 521:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 524:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 526:	eb 0d                	jmp    535 <memmove+0x1f>
    *dst++ = *src++;
 528:	0f b6 01             	movzbl (%ecx),%eax
 52b:	88 02                	mov    %al,(%edx)
 52d:	8d 49 01             	lea    0x1(%ecx),%ecx
 530:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 533:	89 d8                	mov    %ebx,%eax
 535:	8d 58 ff             	lea    -0x1(%eax),%ebx
 538:	85 c0                	test   %eax,%eax
 53a:	7f ec                	jg     528 <memmove+0x12>
  return vdst;
}
 53c:	89 f0                	mov    %esi,%eax
 53e:	5b                   	pop    %ebx
 53f:	5e                   	pop    %esi
 540:	5d                   	pop    %ebp
 541:	c3                   	ret    

00000542 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 542:	b8 01 00 00 00       	mov    $0x1,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <exit>:
SYSCALL(exit)
 54a:	b8 02 00 00 00       	mov    $0x2,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <wait>:
SYSCALL(wait)
 552:	b8 03 00 00 00       	mov    $0x3,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <pipe>:
SYSCALL(pipe)
 55a:	b8 04 00 00 00       	mov    $0x4,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <read>:
SYSCALL(read)
 562:	b8 05 00 00 00       	mov    $0x5,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <write>:
SYSCALL(write)
 56a:	b8 10 00 00 00       	mov    $0x10,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <close>:
SYSCALL(close)
 572:	b8 15 00 00 00       	mov    $0x15,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <kill>:
SYSCALL(kill)
 57a:	b8 06 00 00 00       	mov    $0x6,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <exec>:
SYSCALL(exec)
 582:	b8 07 00 00 00       	mov    $0x7,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <open>:
SYSCALL(open)
 58a:	b8 0f 00 00 00       	mov    $0xf,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <mknod>:
SYSCALL(mknod)
 592:	b8 11 00 00 00       	mov    $0x11,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <unlink>:
SYSCALL(unlink)
 59a:	b8 12 00 00 00       	mov    $0x12,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <fstat>:
SYSCALL(fstat)
 5a2:	b8 08 00 00 00       	mov    $0x8,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <link>:
SYSCALL(link)
 5aa:	b8 13 00 00 00       	mov    $0x13,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <mkdir>:
SYSCALL(mkdir)
 5b2:	b8 14 00 00 00       	mov    $0x14,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <chdir>:
SYSCALL(chdir)
 5ba:	b8 09 00 00 00       	mov    $0x9,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <dup>:
SYSCALL(dup)
 5c2:	b8 0a 00 00 00       	mov    $0xa,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <getpid>:
SYSCALL(getpid)
 5ca:	b8 0b 00 00 00       	mov    $0xb,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <sbrk>:
SYSCALL(sbrk)
 5d2:	b8 0c 00 00 00       	mov    $0xc,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <sleep>:
SYSCALL(sleep)
 5da:	b8 0d 00 00 00       	mov    $0xd,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <uptime>:
SYSCALL(uptime)
 5e2:	b8 0e 00 00 00       	mov    $0xe,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <clone>:
SYSCALL(clone)
 5ea:	b8 16 00 00 00       	mov    $0x16,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <join>:
 5f2:	b8 17 00 00 00       	mov    $0x17,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5fa:	55                   	push   %ebp
 5fb:	89 e5                	mov    %esp,%ebp
 5fd:	83 ec 1c             	sub    $0x1c,%esp
 600:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 603:	6a 01                	push   $0x1
 605:	8d 55 f4             	lea    -0xc(%ebp),%edx
 608:	52                   	push   %edx
 609:	50                   	push   %eax
 60a:	e8 5b ff ff ff       	call   56a <write>
}
 60f:	83 c4 10             	add    $0x10,%esp
 612:	c9                   	leave  
 613:	c3                   	ret    

00000614 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	57                   	push   %edi
 618:	56                   	push   %esi
 619:	53                   	push   %ebx
 61a:	83 ec 2c             	sub    $0x2c,%esp
 61d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 620:	89 d0                	mov    %edx,%eax
 622:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 624:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 628:	0f 95 c1             	setne  %cl
 62b:	c1 ea 1f             	shr    $0x1f,%edx
 62e:	84 d1                	test   %dl,%cl
 630:	74 44                	je     676 <printint+0x62>
    neg = 1;
    x = -xx;
 632:	f7 d8                	neg    %eax
 634:	89 c1                	mov    %eax,%ecx
    neg = 1;
 636:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 63d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 642:	89 c8                	mov    %ecx,%eax
 644:	ba 00 00 00 00       	mov    $0x0,%edx
 649:	f7 f6                	div    %esi
 64b:	89 df                	mov    %ebx,%edi
 64d:	83 c3 01             	add    $0x1,%ebx
 650:	0f b6 92 3c 0a 00 00 	movzbl 0xa3c(%edx),%edx
 657:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 65b:	89 ca                	mov    %ecx,%edx
 65d:	89 c1                	mov    %eax,%ecx
 65f:	39 d6                	cmp    %edx,%esi
 661:	76 df                	jbe    642 <printint+0x2e>
  if(neg)
 663:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 667:	74 31                	je     69a <printint+0x86>
    buf[i++] = '-';
 669:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 66e:	8d 5f 02             	lea    0x2(%edi),%ebx
 671:	8b 75 d0             	mov    -0x30(%ebp),%esi
 674:	eb 17                	jmp    68d <printint+0x79>
    x = xx;
 676:	89 c1                	mov    %eax,%ecx
  neg = 0;
 678:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 67f:	eb bc                	jmp    63d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 681:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 686:	89 f0                	mov    %esi,%eax
 688:	e8 6d ff ff ff       	call   5fa <putc>
  while(--i >= 0)
 68d:	83 eb 01             	sub    $0x1,%ebx
 690:	79 ef                	jns    681 <printint+0x6d>
}
 692:	83 c4 2c             	add    $0x2c,%esp
 695:	5b                   	pop    %ebx
 696:	5e                   	pop    %esi
 697:	5f                   	pop    %edi
 698:	5d                   	pop    %ebp
 699:	c3                   	ret    
 69a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 69d:	eb ee                	jmp    68d <printint+0x79>

0000069f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 69f:	55                   	push   %ebp
 6a0:	89 e5                	mov    %esp,%ebp
 6a2:	57                   	push   %edi
 6a3:	56                   	push   %esi
 6a4:	53                   	push   %ebx
 6a5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6a8:	8d 45 10             	lea    0x10(%ebp),%eax
 6ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6ae:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6b3:	bb 00 00 00 00       	mov    $0x0,%ebx
 6b8:	eb 14                	jmp    6ce <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6ba:	89 fa                	mov    %edi,%edx
 6bc:	8b 45 08             	mov    0x8(%ebp),%eax
 6bf:	e8 36 ff ff ff       	call   5fa <putc>
 6c4:	eb 05                	jmp    6cb <printf+0x2c>
      }
    } else if(state == '%'){
 6c6:	83 fe 25             	cmp    $0x25,%esi
 6c9:	74 25                	je     6f0 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6cb:	83 c3 01             	add    $0x1,%ebx
 6ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d1:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6d5:	84 c0                	test   %al,%al
 6d7:	0f 84 20 01 00 00    	je     7fd <printf+0x15e>
    c = fmt[i] & 0xff;
 6dd:	0f be f8             	movsbl %al,%edi
 6e0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6e3:	85 f6                	test   %esi,%esi
 6e5:	75 df                	jne    6c6 <printf+0x27>
      if(c == '%'){
 6e7:	83 f8 25             	cmp    $0x25,%eax
 6ea:	75 ce                	jne    6ba <printf+0x1b>
        state = '%';
 6ec:	89 c6                	mov    %eax,%esi
 6ee:	eb db                	jmp    6cb <printf+0x2c>
      if(c == 'd'){
 6f0:	83 f8 25             	cmp    $0x25,%eax
 6f3:	0f 84 cf 00 00 00    	je     7c8 <printf+0x129>
 6f9:	0f 8c dd 00 00 00    	jl     7dc <printf+0x13d>
 6ff:	83 f8 78             	cmp    $0x78,%eax
 702:	0f 8f d4 00 00 00    	jg     7dc <printf+0x13d>
 708:	83 f8 63             	cmp    $0x63,%eax
 70b:	0f 8c cb 00 00 00    	jl     7dc <printf+0x13d>
 711:	83 e8 63             	sub    $0x63,%eax
 714:	83 f8 15             	cmp    $0x15,%eax
 717:	0f 87 bf 00 00 00    	ja     7dc <printf+0x13d>
 71d:	ff 24 85 e4 09 00 00 	jmp    *0x9e4(,%eax,4)
        printint(fd, *ap, 10, 1);
 724:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 727:	8b 17                	mov    (%edi),%edx
 729:	83 ec 0c             	sub    $0xc,%esp
 72c:	6a 01                	push   $0x1
 72e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	e8 d9 fe ff ff       	call   614 <printint>
        ap++;
 73b:	83 c7 04             	add    $0x4,%edi
 73e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 741:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 744:	be 00 00 00 00       	mov    $0x0,%esi
 749:	eb 80                	jmp    6cb <printf+0x2c>
        printint(fd, *ap, 16, 0);
 74b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 74e:	8b 17                	mov    (%edi),%edx
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	6a 00                	push   $0x0
 755:	b9 10 00 00 00       	mov    $0x10,%ecx
 75a:	8b 45 08             	mov    0x8(%ebp),%eax
 75d:	e8 b2 fe ff ff       	call   614 <printint>
        ap++;
 762:	83 c7 04             	add    $0x4,%edi
 765:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 768:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76b:	be 00 00 00 00       	mov    $0x0,%esi
 770:	e9 56 ff ff ff       	jmp    6cb <printf+0x2c>
        s = (char*)*ap;
 775:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 778:	8b 30                	mov    (%eax),%esi
        ap++;
 77a:	83 c0 04             	add    $0x4,%eax
 77d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 780:	85 f6                	test   %esi,%esi
 782:	75 15                	jne    799 <printf+0xfa>
          s = "(null)";
 784:	be db 09 00 00       	mov    $0x9db,%esi
 789:	eb 0e                	jmp    799 <printf+0xfa>
          putc(fd, *s);
 78b:	0f be d2             	movsbl %dl,%edx
 78e:	8b 45 08             	mov    0x8(%ebp),%eax
 791:	e8 64 fe ff ff       	call   5fa <putc>
          s++;
 796:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 799:	0f b6 16             	movzbl (%esi),%edx
 79c:	84 d2                	test   %dl,%dl
 79e:	75 eb                	jne    78b <printf+0xec>
      state = 0;
 7a0:	be 00 00 00 00       	mov    $0x0,%esi
 7a5:	e9 21 ff ff ff       	jmp    6cb <printf+0x2c>
        putc(fd, *ap);
 7aa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ad:	0f be 17             	movsbl (%edi),%edx
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	e8 42 fe ff ff       	call   5fa <putc>
        ap++;
 7b8:	83 c7 04             	add    $0x4,%edi
 7bb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7be:	be 00 00 00 00       	mov    $0x0,%esi
 7c3:	e9 03 ff ff ff       	jmp    6cb <printf+0x2c>
        putc(fd, c);
 7c8:	89 fa                	mov    %edi,%edx
 7ca:	8b 45 08             	mov    0x8(%ebp),%eax
 7cd:	e8 28 fe ff ff       	call   5fa <putc>
      state = 0;
 7d2:	be 00 00 00 00       	mov    $0x0,%esi
 7d7:	e9 ef fe ff ff       	jmp    6cb <printf+0x2c>
        putc(fd, '%');
 7dc:	ba 25 00 00 00       	mov    $0x25,%edx
 7e1:	8b 45 08             	mov    0x8(%ebp),%eax
 7e4:	e8 11 fe ff ff       	call   5fa <putc>
        putc(fd, c);
 7e9:	89 fa                	mov    %edi,%edx
 7eb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ee:	e8 07 fe ff ff       	call   5fa <putc>
      state = 0;
 7f3:	be 00 00 00 00       	mov    $0x0,%esi
 7f8:	e9 ce fe ff ff       	jmp    6cb <printf+0x2c>
    }
  }
}
 7fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 800:	5b                   	pop    %ebx
 801:	5e                   	pop    %esi
 802:	5f                   	pop    %edi
 803:	5d                   	pop    %ebp
 804:	c3                   	ret    

00000805 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 805:	55                   	push   %ebp
 806:	89 e5                	mov    %esp,%ebp
 808:	57                   	push   %edi
 809:	56                   	push   %esi
 80a:	53                   	push   %ebx
 80b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 80e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 00 0f 00 00       	mov    0xf00,%eax
 816:	eb 02                	jmp    81a <free+0x15>
 818:	89 d0                	mov    %edx,%eax
 81a:	39 c8                	cmp    %ecx,%eax
 81c:	73 04                	jae    822 <free+0x1d>
 81e:	39 08                	cmp    %ecx,(%eax)
 820:	77 12                	ja     834 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 822:	8b 10                	mov    (%eax),%edx
 824:	39 c2                	cmp    %eax,%edx
 826:	77 f0                	ja     818 <free+0x13>
 828:	39 c8                	cmp    %ecx,%eax
 82a:	72 08                	jb     834 <free+0x2f>
 82c:	39 ca                	cmp    %ecx,%edx
 82e:	77 04                	ja     834 <free+0x2f>
 830:	89 d0                	mov    %edx,%eax
 832:	eb e6                	jmp    81a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 834:	8b 73 fc             	mov    -0x4(%ebx),%esi
 837:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 83a:	8b 10                	mov    (%eax),%edx
 83c:	39 d7                	cmp    %edx,%edi
 83e:	74 19                	je     859 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 840:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 843:	8b 50 04             	mov    0x4(%eax),%edx
 846:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 849:	39 ce                	cmp    %ecx,%esi
 84b:	74 1b                	je     868 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 84d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 84f:	a3 00 0f 00 00       	mov    %eax,0xf00
}
 854:	5b                   	pop    %ebx
 855:	5e                   	pop    %esi
 856:	5f                   	pop    %edi
 857:	5d                   	pop    %ebp
 858:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 859:	03 72 04             	add    0x4(%edx),%esi
 85c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 85f:	8b 10                	mov    (%eax),%edx
 861:	8b 12                	mov    (%edx),%edx
 863:	89 53 f8             	mov    %edx,-0x8(%ebx)
 866:	eb db                	jmp    843 <free+0x3e>
    p->s.size += bp->s.size;
 868:	03 53 fc             	add    -0x4(%ebx),%edx
 86b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 86e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 871:	89 10                	mov    %edx,(%eax)
 873:	eb da                	jmp    84f <free+0x4a>

00000875 <morecore>:

static Header*
morecore(uint nu)
{
 875:	55                   	push   %ebp
 876:	89 e5                	mov    %esp,%ebp
 878:	53                   	push   %ebx
 879:	83 ec 04             	sub    $0x4,%esp
 87c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 87e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 883:	77 05                	ja     88a <morecore+0x15>
    nu = 4096;
 885:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 88a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 891:	83 ec 0c             	sub    $0xc,%esp
 894:	50                   	push   %eax
 895:	e8 38 fd ff ff       	call   5d2 <sbrk>
  if(p == (char*)-1)
 89a:	83 c4 10             	add    $0x10,%esp
 89d:	83 f8 ff             	cmp    $0xffffffff,%eax
 8a0:	74 1c                	je     8be <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8a2:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8a5:	83 c0 08             	add    $0x8,%eax
 8a8:	83 ec 0c             	sub    $0xc,%esp
 8ab:	50                   	push   %eax
 8ac:	e8 54 ff ff ff       	call   805 <free>
  return freep;
 8b1:	a1 00 0f 00 00       	mov    0xf00,%eax
 8b6:	83 c4 10             	add    $0x10,%esp
}
 8b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8bc:	c9                   	leave  
 8bd:	c3                   	ret    
    return 0;
 8be:	b8 00 00 00 00       	mov    $0x0,%eax
 8c3:	eb f4                	jmp    8b9 <morecore+0x44>

000008c5 <malloc>:

void*
malloc(uint nbytes)
{
 8c5:	55                   	push   %ebp
 8c6:	89 e5                	mov    %esp,%ebp
 8c8:	53                   	push   %ebx
 8c9:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8cc:	8b 45 08             	mov    0x8(%ebp),%eax
 8cf:	8d 58 07             	lea    0x7(%eax),%ebx
 8d2:	c1 eb 03             	shr    $0x3,%ebx
 8d5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8d8:	8b 0d 00 0f 00 00    	mov    0xf00,%ecx
 8de:	85 c9                	test   %ecx,%ecx
 8e0:	74 04                	je     8e6 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e2:	8b 01                	mov    (%ecx),%eax
 8e4:	eb 4a                	jmp    930 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8e6:	c7 05 00 0f 00 00 04 	movl   $0xf04,0xf00
 8ed:	0f 00 00 
 8f0:	c7 05 04 0f 00 00 04 	movl   $0xf04,0xf04
 8f7:	0f 00 00 
    base.s.size = 0;
 8fa:	c7 05 08 0f 00 00 00 	movl   $0x0,0xf08
 901:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 904:	b9 04 0f 00 00       	mov    $0xf04,%ecx
 909:	eb d7                	jmp    8e2 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 90b:	74 19                	je     926 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 90d:	29 da                	sub    %ebx,%edx
 90f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 912:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 915:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 918:	89 0d 00 0f 00 00    	mov    %ecx,0xf00
      return (void*)(p + 1);
 91e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 921:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 924:	c9                   	leave  
 925:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 926:	8b 10                	mov    (%eax),%edx
 928:	89 11                	mov    %edx,(%ecx)
 92a:	eb ec                	jmp    918 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92c:	89 c1                	mov    %eax,%ecx
 92e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 930:	8b 50 04             	mov    0x4(%eax),%edx
 933:	39 da                	cmp    %ebx,%edx
 935:	73 d4                	jae    90b <malloc+0x46>
    if(p == freep)
 937:	39 05 00 0f 00 00    	cmp    %eax,0xf00
 93d:	75 ed                	jne    92c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 93f:	89 d8                	mov    %ebx,%eax
 941:	e8 2f ff ff ff       	call   875 <morecore>
 946:	85 c0                	test   %eax,%eax
 948:	75 e2                	jne    92c <malloc+0x67>
 94a:	eb d5                	jmp    921 <malloc+0x5c>
