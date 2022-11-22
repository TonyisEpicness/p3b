
_test_15:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   int i, j, tmp;
   for (i = 0; i < loops; i++) {
   7:	bb 00 00 00 00       	mov    $0x0,%ebx
   c:	eb 23                	jmp    31 <worker+0x31>
      lock_acquire(&lock);
      tmp = global;
      for(j = 0; j < 50; j++); // take some time
   e:	83 c0 01             	add    $0x1,%eax
  11:	83 f8 31             	cmp    $0x31,%eax
  14:	7e f8                	jle    e <worker+0xe>
      global = tmp + 1;
  16:	8d 42 01             	lea    0x1(%edx),%eax
<<<<<<< HEAD
  19:	a3 04 0d 00 00       	mov    %eax,0xd04
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 00 0d 00 00       	push   $0xd00
  26:	e8 81 02 00 00       	call   2ac <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d dc 0c 00 00    	cmp    %ebx,0xcdc
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 00 0d 00 00       	push   $0xd00
  41:	e8 44 02 00 00       	call   28a <lock_acquire>
      tmp = global;
  46:	8b 15 04 0d 00 00    	mov    0xd04,%edx
=======
  19:	a3 e4 0c 00 00       	mov    %eax,0xce4
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 e0 0c 00 00       	push   $0xce0
  26:	e8 6a 02 00 00       	call   295 <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d c0 0c 00 00    	cmp    %ebx,0xcc0
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 e0 0c 00 00       	push   $0xce0
  41:	e8 2d 02 00 00       	call   273 <lock_acquire>
      tmp = global;
  46:	8b 15 e4 0c 00 00    	mov    0xce4,%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
<<<<<<< HEAD
  56:	e8 0c 04 00 00       	call   467 <exit>
=======
  56:	e8 f5 03 00 00       	call   450 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000005b <main>:
{
  5b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  5f:	83 e4 f0             	and    $0xfffffff0,%esp
  62:	ff 71 fc             	push   -0x4(%ecx)
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	53                   	push   %ebx
  69:	51                   	push   %ecx
   ppid = getpid();
<<<<<<< HEAD
  6a:	e8 78 04 00 00       	call   4e7 <getpid>
  6f:	a3 08 0d 00 00       	mov    %eax,0xd08
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 00 0d 00 00       	push   $0xd00
  7c:	e8 39 02 00 00       	call   2ba <lock_init>
=======
  6a:	e8 61 04 00 00       	call   4d0 <getpid>
  6f:	a3 e8 0c 00 00       	mov    %eax,0xce8
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 e0 0c 00 00       	push   $0xce0
  7c:	e8 22 02 00 00       	call   2a3 <lock_init>
>>>>>>> c59b0f9 (fixed thread_join and join)
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
<<<<<<< HEAD
  8e:	39 1d e0 0c 00 00    	cmp    %ebx,0xce0
=======
  8e:	39 1d c4 0c 00 00    	cmp    %ebx,0xcc4
>>>>>>> c59b0f9 (fixed thread_join and join)
  94:	7e 61                	jle    f7 <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
  96:	83 ec 04             	sub    $0x4,%esp
  99:	6a 00                	push   $0x0
  9b:	6a 00                	push   $0x0
  9d:	68 00 00 00 00       	push   $0x0
  a2:	e8 32 01 00 00       	call   1d9 <thread_create>
      assert(thread_pid > 0);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	7f dd                	jg     8b <main+0x30>
  ae:	6a 25                	push   $0x25
<<<<<<< HEAD
  b0:	68 6c 08 00 00       	push   $0x86c
  b5:	68 76 08 00 00       	push   $0x876
  ba:	6a 01                	push   $0x1
  bc:	e8 fb 04 00 00       	call   5bc <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 7e 08 00 00       	push   $0x87e
  c9:	68 8d 08 00 00       	push   $0x88d
  ce:	6a 01                	push   $0x1
  d0:	e8 e7 04 00 00       	call   5bc <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 a1 08 00 00       	push   $0x8a1
  dd:	6a 01                	push   $0x1
  df:	e8 d8 04 00 00       	call   5bc <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 08 0d 00 00    	push   0xd08
  ed:	e8 a5 03 00 00       	call   497 <kill>
  f2:	e8 70 03 00 00       	call   467 <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 e0 0c 00 00       	mov    0xce0,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 2f 01 00 00       	call   239 <thread_join>
=======
  b0:	68 54 08 00 00       	push   $0x854
  b5:	68 5e 08 00 00       	push   $0x85e
  ba:	6a 01                	push   $0x1
  bc:	e8 e4 04 00 00       	call   5a5 <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 66 08 00 00       	push   $0x866
  c9:	68 75 08 00 00       	push   $0x875
  ce:	6a 01                	push   $0x1
  d0:	e8 d0 04 00 00       	call   5a5 <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 89 08 00 00       	push   $0x889
  dd:	6a 01                	push   $0x1
  df:	e8 c1 04 00 00       	call   5a5 <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 e8 0c 00 00    	push   0xce8
  ed:	e8 8e 03 00 00       	call   480 <kill>
  f2:	e8 59 03 00 00       	call   450 <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 c4 0c 00 00       	mov    0xcc4,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 45 01 00 00       	call   24f <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
      assert(join_pid > 0);
 10a:	85 c0                	test   %eax,%eax
 10c:	7e 05                	jle    113 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	eb e9                	jmp    fc <main+0xa1>
      assert(join_pid > 0);
 113:	6a 2a                	push   $0x2a
<<<<<<< HEAD
 115:	68 6c 08 00 00       	push   $0x86c
 11a:	68 76 08 00 00       	push   $0x876
 11f:	6a 01                	push   $0x1
 121:	e8 96 04 00 00       	call   5bc <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 ae 08 00 00       	push   $0x8ae
 12e:	68 8d 08 00 00       	push   $0x88d
 133:	6a 01                	push   $0x1
 135:	e8 82 04 00 00       	call   5bc <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 a1 08 00 00       	push   $0x8a1
 142:	6a 01                	push   $0x1
 144:	e8 73 04 00 00       	call   5bc <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 08 0d 00 00    	push   0xd08
 152:	e8 40 03 00 00       	call   497 <kill>
 157:	e8 0b 03 00 00       	call   467 <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 dc 0c 00 00 	imul   0xcdc,%eax
 163:	3b 05 04 0d 00 00    	cmp    0xd04,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 6c 08 00 00       	push   $0x86c
 172:	68 76 08 00 00       	push   $0x876
 177:	6a 01                	push   $0x1
 179:	e8 3e 04 00 00       	call   5bc <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 bb 08 00 00       	push   $0x8bb
 186:	68 8d 08 00 00       	push   $0x88d
 18b:	6a 01                	push   $0x1
 18d:	e8 2a 04 00 00       	call   5bc <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 a1 08 00 00       	push   $0x8a1
 19a:	6a 01                	push   $0x1
 19c:	e8 1b 04 00 00       	call   5bc <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 08 0d 00 00    	push   0xd08
 1aa:	e8 e8 02 00 00       	call   497 <kill>
 1af:	e8 b3 02 00 00       	call   467 <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 d9 08 00 00       	push   $0x8d9
 1bc:	6a 01                	push   $0x1
 1be:	e8 f9 03 00 00       	call   5bc <printf>
   exit();
 1c3:	e8 9f 02 00 00       	call   467 <exit>
=======
 115:	68 54 08 00 00       	push   $0x854
 11a:	68 5e 08 00 00       	push   $0x85e
 11f:	6a 01                	push   $0x1
 121:	e8 7f 04 00 00       	call   5a5 <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 96 08 00 00       	push   $0x896
 12e:	68 75 08 00 00       	push   $0x875
 133:	6a 01                	push   $0x1
 135:	e8 6b 04 00 00       	call   5a5 <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 89 08 00 00       	push   $0x889
 142:	6a 01                	push   $0x1
 144:	e8 5c 04 00 00       	call   5a5 <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 e8 0c 00 00    	push   0xce8
 152:	e8 29 03 00 00       	call   480 <kill>
 157:	e8 f4 02 00 00       	call   450 <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 c0 0c 00 00 	imul   0xcc0,%eax
 163:	3b 05 e4 0c 00 00    	cmp    0xce4,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 54 08 00 00       	push   $0x854
 172:	68 5e 08 00 00       	push   $0x85e
 177:	6a 01                	push   $0x1
 179:	e8 27 04 00 00       	call   5a5 <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 a3 08 00 00       	push   $0x8a3
 186:	68 75 08 00 00       	push   $0x875
 18b:	6a 01                	push   $0x1
 18d:	e8 13 04 00 00       	call   5a5 <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 89 08 00 00       	push   $0x889
 19a:	6a 01                	push   $0x1
 19c:	e8 04 04 00 00       	call   5a5 <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 e8 0c 00 00    	push   0xce8
 1aa:	e8 d1 02 00 00       	call   480 <kill>
 1af:	e8 9c 02 00 00       	call   450 <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 c1 08 00 00       	push   $0x8c1
 1bc:	6a 01                	push   $0x1
 1be:	e8 e2 03 00 00       	call   5a5 <printf>
   exit();
 1c3:	e8 88 02 00 00       	call   450 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000001c8 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 1ce:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 1d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d3:	89 08                	mov    %ecx,(%eax)
  return old;
}
 1d5:	89 d0                	mov    %edx,%eax
 1d7:	5d                   	pop    %ebp
 1d8:	c3                   	ret    

000001d9 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	53                   	push   %ebx
 1dd:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 1e0:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 1e5:	e8 f8 05 00 00       	call   7e2 <malloc>
  if(n_stack == 0){
 1ea:	83 c4 10             	add    $0x10,%esp
 1ed:	85 c0                	test   %eax,%eax
 1ef:	74 41                	je     232 <thread_create+0x59>
 1f1:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 1f3:	50                   	push   %eax
 1f4:	ff 75 10             	push   0x10(%ebp)
 1f7:	ff 75 0c             	push   0xc(%ebp)
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 05 03 00 00       	call   507 <clone>
=======
 1e5:	e8 e1 05 00 00       	call   7cb <malloc>
  if(n_stack == 0){
 1ea:	83 c4 10             	add    $0x10,%esp
 1ed:	85 c0                	test   %eax,%eax
 1ef:	74 57                	je     248 <thread_create+0x6f>
 1f1:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 1f3:	b8 00 00 00 00       	mov    $0x0,%eax
 1f8:	eb 03                	jmp    1fd <thread_create+0x24>
 1fa:	83 c0 01             	add    $0x1,%eax
 1fd:	83 f8 3f             	cmp    $0x3f,%eax
 200:	7f 2f                	jg     231 <thread_create+0x58>
    if(threads[i].flag==0){
 202:	8d 14 40             	lea    (%eax,%eax,2),%edx
 205:	83 3c 95 08 0d 00 00 	cmpl   $0x0,0xd08(,%edx,4)
 20c:	00 
 20d:	75 eb                	jne    1fa <thread_create+0x21>
      threads[i].maddr = n_stack;
 20f:	8d 14 00             	lea    (%eax,%eax,1),%edx
 212:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 215:	c1 e3 02             	shl    $0x2,%ebx
 218:	89 8b 00 0d 00 00    	mov    %ecx,0xd00(%ebx)
      threads[i].pg1addr = n_stack;
 21e:	89 8b 04 0d 00 00    	mov    %ecx,0xd04(%ebx)
      threads[i].flag = 1;
 224:	01 c2                	add    %eax,%edx
 226:	c7 04 95 08 0d 00 00 	movl   $0x1,0xd08(,%edx,4)
 22d:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 231:	51                   	push   %ecx
 232:	ff 75 10             	push   0x10(%ebp)
 235:	ff 75 0c             	push   0xc(%ebp)
 238:	ff 75 08             	push   0x8(%ebp)
 23b:	e8 b0 02 00 00       	call   4f0 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 202:	83 c4 10             	add    $0x10,%esp
 205:	ba 00 00 00 00       	mov    $0x0,%edx
 20a:	eb 03                	jmp    20f <thread_create+0x36>
 20c:	83 c2 01             	add    $0x1,%edx
 20f:	83 fa 3f             	cmp    $0x3f,%edx
 212:	7f 19                	jg     22d <thread_create+0x54>
    if(threads[i]->flag==0){
 214:	8b 0c 95 20 0d 00 00 	mov    0xd20(,%edx,4),%ecx
 21b:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 21f:	75 eb                	jne    20c <thread_create+0x33>
      threads[i]->maddr = n_stack;
 221:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 223:	8b 14 95 20 0d 00 00 	mov    0xd20(,%edx,4),%edx
 22a:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 22d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 230:	c9                   	leave  
 231:	c3                   	ret    
    return -1;
 232:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 237:	eb f4                	jmp    22d <thread_create+0x54>

00000239 <thread_join>:
=======
 240:	83 c4 10             	add    $0x10,%esp
}
 243:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 246:	c9                   	leave  
 247:	c3                   	ret    
    return -1;
 248:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 24d:	eb f4                	jmp    243 <thread_create+0x6a>

0000024f <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	56                   	push   %esi
 23d:	53                   	push   %ebx
 23e:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 241:	8d 45 f4             	lea    -0xc(%ebp),%eax
 244:	50                   	push   %eax
 245:	e8 c5 02 00 00       	call   50f <join>
 24a:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 24c:	83 c4 10             	add    $0x10,%esp
 24f:	bb 00 00 00 00       	mov    $0x0,%ebx
 254:	eb 03                	jmp    259 <thread_join+0x20>
 256:	83 c3 01             	add    $0x1,%ebx
 259:	83 fb 3f             	cmp    $0x3f,%ebx
 25c:	7f 23                	jg     281 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 25e:	8b 04 9d 20 0d 00 00 	mov    0xd20(,%ebx,4),%eax
 265:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 269:	75 eb                	jne    256 <thread_join+0x1d>
 26b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 26e:	39 50 04             	cmp    %edx,0x4(%eax)
 271:	75 e3                	jne    256 <thread_join+0x1d>
      free(stk_addr);
 273:	83 ec 0c             	sub    $0xc,%esp
 276:	52                   	push   %edx
 277:	e8 a6 04 00 00       	call   722 <free>
 27c:	83 c4 10             	add    $0x10,%esp
 27f:	eb d5                	jmp    256 <thread_join+0x1d>
    }
  }
  return pid;
}
 281:	89 f0                	mov    %esi,%eax
 283:	8d 65 f8             	lea    -0x8(%ebp),%esp
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    

0000028a <lock_acquire>:

void lock_acquire(lock_t *lock){
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	53                   	push   %ebx
 28e:	83 ec 04             	sub    $0x4,%esp
 291:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 294:	83 ec 08             	sub    $0x8,%esp
 297:	6a 01                	push   $0x1
 299:	53                   	push   %ebx
 29a:	e8 29 ff ff ff       	call   1c8 <test_and_set>
 29f:	83 c4 10             	add    $0x10,%esp
 2a2:	83 f8 01             	cmp    $0x1,%eax
 2a5:	74 ed                	je     294 <lock_acquire+0xa>
    ;
}
 2a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2aa:	c9                   	leave  
 2ab:	c3                   	ret    

000002ac <lock_release>:

void lock_release(lock_t *lock) {
 2ac:	55                   	push   %ebp
 2ad:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2af:	8b 45 08             	mov    0x8(%ebp),%eax
 2b2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2b8:	5d                   	pop    %ebp
 2b9:	c3                   	ret    

000002ba <lock_init>:

void lock_init(lock_t *lock) {
 2ba:	55                   	push   %ebp
 2bb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    

000002c8 <strcpy>:
=======
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	53                   	push   %ebx
 253:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 256:	8d 45 f4             	lea    -0xc(%ebp),%eax
 259:	50                   	push   %eax
 25a:	e8 99 02 00 00       	call   4f8 <join>
 25f:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 261:	83 c4 04             	add    $0x4,%esp
 264:	ff 75 f4             	push   -0xc(%ebp)
 267:	e8 9f 04 00 00       	call   70b <free>
  return pid;
}
 26c:	89 d8                	mov    %ebx,%eax
 26e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 271:	c9                   	leave  
 272:	c3                   	ret    

00000273 <lock_acquire>:

void lock_acquire(lock_t *lock){
 273:	55                   	push   %ebp
 274:	89 e5                	mov    %esp,%ebp
 276:	53                   	push   %ebx
 277:	83 ec 04             	sub    $0x4,%esp
 27a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 27d:	83 ec 08             	sub    $0x8,%esp
 280:	6a 01                	push   $0x1
 282:	53                   	push   %ebx
 283:	e8 40 ff ff ff       	call   1c8 <test_and_set>
 288:	83 c4 10             	add    $0x10,%esp
 28b:	83 f8 01             	cmp    $0x1,%eax
 28e:	74 ed                	je     27d <lock_acquire+0xa>
    ;
}
 290:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 293:	c9                   	leave  
 294:	c3                   	ret    

00000295 <lock_release>:

void lock_release(lock_t *lock) {
 295:	55                   	push   %ebp
 296:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    

000002a3 <lock_init>:

void lock_init(lock_t *lock) {
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2af:	5d                   	pop    %ebp
 2b0:	c3                   	ret    

000002b1 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	56                   	push   %esi
 2cc:	53                   	push   %ebx
 2cd:	8b 75 08             	mov    0x8(%ebp),%esi
 2d0:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 2b1:	55                   	push   %ebp
 2b2:	89 e5                	mov    %esp,%ebp
 2b4:	56                   	push   %esi
 2b5:	53                   	push   %ebx
 2b6:	8b 75 08             	mov    0x8(%ebp),%esi
 2b9:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 2d3:	89 f0                	mov    %esi,%eax
 2d5:	89 d1                	mov    %edx,%ecx
 2d7:	83 c2 01             	add    $0x1,%edx
 2da:	89 c3                	mov    %eax,%ebx
 2dc:	83 c0 01             	add    $0x1,%eax
 2df:	0f b6 09             	movzbl (%ecx),%ecx
 2e2:	88 0b                	mov    %cl,(%ebx)
 2e4:	84 c9                	test   %cl,%cl
 2e6:	75 ed                	jne    2d5 <strcpy+0xd>
    ;
  return os;
}
 2e8:	89 f0                	mov    %esi,%eax
 2ea:	5b                   	pop    %ebx
 2eb:	5e                   	pop    %esi
 2ec:	5d                   	pop    %ebp
 2ed:	c3                   	ret    

000002ee <strcmp>:
=======
 2bc:	89 f0                	mov    %esi,%eax
 2be:	89 d1                	mov    %edx,%ecx
 2c0:	83 c2 01             	add    $0x1,%edx
 2c3:	89 c3                	mov    %eax,%ebx
 2c5:	83 c0 01             	add    $0x1,%eax
 2c8:	0f b6 09             	movzbl (%ecx),%ecx
 2cb:	88 0b                	mov    %cl,(%ebx)
 2cd:	84 c9                	test   %cl,%cl
 2cf:	75 ed                	jne    2be <strcpy+0xd>
    ;
  return os;
}
 2d1:	89 f0                	mov    %esi,%eax
 2d3:	5b                   	pop    %ebx
 2d4:	5e                   	pop    %esi
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    

000002d7 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2f7:	eb 06                	jmp    2ff <strcmp+0x11>
    p++, q++;
 2f9:	83 c1 01             	add    $0x1,%ecx
 2fc:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2ff:	0f b6 01             	movzbl (%ecx),%eax
 302:	84 c0                	test   %al,%al
 304:	74 04                	je     30a <strcmp+0x1c>
 306:	3a 02                	cmp    (%edx),%al
 308:	74 ef                	je     2f9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 30a:	0f b6 c0             	movzbl %al,%eax
 30d:	0f b6 12             	movzbl (%edx),%edx
 310:	29 d0                	sub    %edx,%eax
}
 312:	5d                   	pop    %ebp
 313:	c3                   	ret    

00000314 <strlen>:
=======
 2d7:	55                   	push   %ebp
 2d8:	89 e5                	mov    %esp,%ebp
 2da:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2dd:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2e0:	eb 06                	jmp    2e8 <strcmp+0x11>
    p++, q++;
 2e2:	83 c1 01             	add    $0x1,%ecx
 2e5:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2e8:	0f b6 01             	movzbl (%ecx),%eax
 2eb:	84 c0                	test   %al,%al
 2ed:	74 04                	je     2f3 <strcmp+0x1c>
 2ef:	3a 02                	cmp    (%edx),%al
 2f1:	74 ef                	je     2e2 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2f3:	0f b6 c0             	movzbl %al,%eax
 2f6:	0f b6 12             	movzbl (%edx),%edx
 2f9:	29 d0                	sub    %edx,%eax
}
 2fb:	5d                   	pop    %ebp
 2fc:	c3                   	ret    

000002fd <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 31a:	b8 00 00 00 00       	mov    $0x0,%eax
 31f:	eb 03                	jmp    324 <strlen+0x10>
 321:	83 c0 01             	add    $0x1,%eax
 324:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 328:	75 f7                	jne    321 <strlen+0xd>
    ;
  return n;
}
 32a:	5d                   	pop    %ebp
 32b:	c3                   	ret    

0000032c <memset>:
=======
 2fd:	55                   	push   %ebp
 2fe:	89 e5                	mov    %esp,%ebp
 300:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 303:	b8 00 00 00 00       	mov    $0x0,%eax
 308:	eb 03                	jmp    30d <strlen+0x10>
 30a:	83 c0 01             	add    $0x1,%eax
 30d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 311:	75 f7                	jne    30a <strlen+0xd>
    ;
  return n;
}
 313:	5d                   	pop    %ebp
 314:	c3                   	ret    

00000315 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 32c:	55                   	push   %ebp
 32d:	89 e5                	mov    %esp,%ebp
 32f:	57                   	push   %edi
 330:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 315:	55                   	push   %ebp
 316:	89 e5                	mov    %esp,%ebp
 318:	57                   	push   %edi
 319:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 333:	89 d7                	mov    %edx,%edi
 335:	8b 4d 10             	mov    0x10(%ebp),%ecx
 338:	8b 45 0c             	mov    0xc(%ebp),%eax
 33b:	fc                   	cld    
 33c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 33e:	89 d0                	mov    %edx,%eax
 340:	8b 7d fc             	mov    -0x4(%ebp),%edi
 343:	c9                   	leave  
 344:	c3                   	ret    

00000345 <strchr>:
=======
 31c:	89 d7                	mov    %edx,%edi
 31e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 321:	8b 45 0c             	mov    0xc(%ebp),%eax
 324:	fc                   	cld    
 325:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 327:	89 d0                	mov    %edx,%eax
 329:	8b 7d fc             	mov    -0x4(%ebp),%edi
 32c:	c9                   	leave  
 32d:	c3                   	ret    

0000032e <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 345:	55                   	push   %ebp
 346:	89 e5                	mov    %esp,%ebp
 348:	8b 45 08             	mov    0x8(%ebp),%eax
 34b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 34f:	eb 03                	jmp    354 <strchr+0xf>
 351:	83 c0 01             	add    $0x1,%eax
 354:	0f b6 10             	movzbl (%eax),%edx
 357:	84 d2                	test   %dl,%dl
 359:	74 06                	je     361 <strchr+0x1c>
    if(*s == c)
 35b:	38 ca                	cmp    %cl,%dl
 35d:	75 f2                	jne    351 <strchr+0xc>
 35f:	eb 05                	jmp    366 <strchr+0x21>
      return (char*)s;
  return 0;
 361:	b8 00 00 00 00       	mov    $0x0,%eax
}
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    

00000368 <gets>:
=======
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	8b 45 08             	mov    0x8(%ebp),%eax
 334:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 338:	eb 03                	jmp    33d <strchr+0xf>
 33a:	83 c0 01             	add    $0x1,%eax
 33d:	0f b6 10             	movzbl (%eax),%edx
 340:	84 d2                	test   %dl,%dl
 342:	74 06                	je     34a <strchr+0x1c>
    if(*s == c)
 344:	38 ca                	cmp    %cl,%dl
 346:	75 f2                	jne    33a <strchr+0xc>
 348:	eb 05                	jmp    34f <strchr+0x21>
      return (char*)s;
  return 0;
 34a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    

00000351 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 368:	55                   	push   %ebp
 369:	89 e5                	mov    %esp,%ebp
 36b:	57                   	push   %edi
 36c:	56                   	push   %esi
 36d:	53                   	push   %ebx
 36e:	83 ec 1c             	sub    $0x1c,%esp
 371:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 351:	55                   	push   %ebp
 352:	89 e5                	mov    %esp,%ebp
 354:	57                   	push   %edi
 355:	56                   	push   %esi
 356:	53                   	push   %ebx
 357:	83 ec 1c             	sub    $0x1c,%esp
 35a:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 374:	bb 00 00 00 00       	mov    $0x0,%ebx
 379:	89 de                	mov    %ebx,%esi
 37b:	83 c3 01             	add    $0x1,%ebx
 37e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 381:	7d 2e                	jge    3b1 <gets+0x49>
    cc = read(0, &c, 1);
 383:	83 ec 04             	sub    $0x4,%esp
 386:	6a 01                	push   $0x1
 388:	8d 45 e7             	lea    -0x19(%ebp),%eax
 38b:	50                   	push   %eax
 38c:	6a 00                	push   $0x0
 38e:	e8 ec 00 00 00       	call   47f <read>
    if(cc < 1)
 393:	83 c4 10             	add    $0x10,%esp
 396:	85 c0                	test   %eax,%eax
 398:	7e 17                	jle    3b1 <gets+0x49>
      break;
    buf[i++] = c;
 39a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 39e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3a1:	3c 0a                	cmp    $0xa,%al
 3a3:	0f 94 c2             	sete   %dl
 3a6:	3c 0d                	cmp    $0xd,%al
 3a8:	0f 94 c0             	sete   %al
 3ab:	08 c2                	or     %al,%dl
 3ad:	74 ca                	je     379 <gets+0x11>
    buf[i++] = c;
 3af:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3b1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3b5:	89 f8                	mov    %edi,%eax
 3b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ba:	5b                   	pop    %ebx
 3bb:	5e                   	pop    %esi
 3bc:	5f                   	pop    %edi
 3bd:	5d                   	pop    %ebp
 3be:	c3                   	ret    

000003bf <stat>:
=======
 35d:	bb 00 00 00 00       	mov    $0x0,%ebx
 362:	89 de                	mov    %ebx,%esi
 364:	83 c3 01             	add    $0x1,%ebx
 367:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 36a:	7d 2e                	jge    39a <gets+0x49>
    cc = read(0, &c, 1);
 36c:	83 ec 04             	sub    $0x4,%esp
 36f:	6a 01                	push   $0x1
 371:	8d 45 e7             	lea    -0x19(%ebp),%eax
 374:	50                   	push   %eax
 375:	6a 00                	push   $0x0
 377:	e8 ec 00 00 00       	call   468 <read>
    if(cc < 1)
 37c:	83 c4 10             	add    $0x10,%esp
 37f:	85 c0                	test   %eax,%eax
 381:	7e 17                	jle    39a <gets+0x49>
      break;
    buf[i++] = c;
 383:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 387:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 38a:	3c 0a                	cmp    $0xa,%al
 38c:	0f 94 c2             	sete   %dl
 38f:	3c 0d                	cmp    $0xd,%al
 391:	0f 94 c0             	sete   %al
 394:	08 c2                	or     %al,%dl
 396:	74 ca                	je     362 <gets+0x11>
    buf[i++] = c;
 398:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 39a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 39e:	89 f8                	mov    %edi,%eax
 3a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3a3:	5b                   	pop    %ebx
 3a4:	5e                   	pop    %esi
 3a5:	5f                   	pop    %edi
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    

000003a8 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	56                   	push   %esi
 3c3:	53                   	push   %ebx
=======
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
 3ab:	56                   	push   %esi
 3ac:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 3c4:	83 ec 08             	sub    $0x8,%esp
 3c7:	6a 00                	push   $0x0
 3c9:	ff 75 08             	push   0x8(%ebp)
 3cc:	e8 d6 00 00 00       	call   4a7 <open>
  if(fd < 0)
 3d1:	83 c4 10             	add    $0x10,%esp
 3d4:	85 c0                	test   %eax,%eax
 3d6:	78 24                	js     3fc <stat+0x3d>
 3d8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3da:	83 ec 08             	sub    $0x8,%esp
 3dd:	ff 75 0c             	push   0xc(%ebp)
 3e0:	50                   	push   %eax
 3e1:	e8 d9 00 00 00       	call   4bf <fstat>
 3e6:	89 c6                	mov    %eax,%esi
  close(fd);
 3e8:	89 1c 24             	mov    %ebx,(%esp)
 3eb:	e8 9f 00 00 00       	call   48f <close>
  return r;
 3f0:	83 c4 10             	add    $0x10,%esp
}
 3f3:	89 f0                	mov    %esi,%eax
 3f5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3f8:	5b                   	pop    %ebx
 3f9:	5e                   	pop    %esi
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    
    return -1;
 3fc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 401:	eb f0                	jmp    3f3 <stat+0x34>

00000403 <atoi>:
=======
 3ad:	83 ec 08             	sub    $0x8,%esp
 3b0:	6a 00                	push   $0x0
 3b2:	ff 75 08             	push   0x8(%ebp)
 3b5:	e8 d6 00 00 00       	call   490 <open>
  if(fd < 0)
 3ba:	83 c4 10             	add    $0x10,%esp
 3bd:	85 c0                	test   %eax,%eax
 3bf:	78 24                	js     3e5 <stat+0x3d>
 3c1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3c3:	83 ec 08             	sub    $0x8,%esp
 3c6:	ff 75 0c             	push   0xc(%ebp)
 3c9:	50                   	push   %eax
 3ca:	e8 d9 00 00 00       	call   4a8 <fstat>
 3cf:	89 c6                	mov    %eax,%esi
  close(fd);
 3d1:	89 1c 24             	mov    %ebx,(%esp)
 3d4:	e8 9f 00 00 00       	call   478 <close>
  return r;
 3d9:	83 c4 10             	add    $0x10,%esp
}
 3dc:	89 f0                	mov    %esi,%eax
 3de:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3e1:	5b                   	pop    %ebx
 3e2:	5e                   	pop    %esi
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    
    return -1;
 3e5:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3ea:	eb f0                	jmp    3dc <stat+0x34>

000003ec <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 403:	55                   	push   %ebp
 404:	89 e5                	mov    %esp,%ebp
 406:	53                   	push   %ebx
 407:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 40a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 40f:	eb 10                	jmp    421 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 411:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 414:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 417:	83 c1 01             	add    $0x1,%ecx
 41a:	0f be c0             	movsbl %al,%eax
 41d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 421:	0f b6 01             	movzbl (%ecx),%eax
 424:	8d 58 d0             	lea    -0x30(%eax),%ebx
 427:	80 fb 09             	cmp    $0x9,%bl
 42a:	76 e5                	jbe    411 <atoi+0xe>
  return n;
}
 42c:	89 d0                	mov    %edx,%eax
 42e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 431:	c9                   	leave  
 432:	c3                   	ret    

00000433 <memmove>:
=======
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	53                   	push   %ebx
 3f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3f3:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3f8:	eb 10                	jmp    40a <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3fa:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3fd:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 400:	83 c1 01             	add    $0x1,%ecx
 403:	0f be c0             	movsbl %al,%eax
 406:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 40a:	0f b6 01             	movzbl (%ecx),%eax
 40d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 410:	80 fb 09             	cmp    $0x9,%bl
 413:	76 e5                	jbe    3fa <atoi+0xe>
  return n;
}
 415:	89 d0                	mov    %edx,%eax
 417:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 41a:	c9                   	leave  
 41b:	c3                   	ret    

0000041c <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
 436:	56                   	push   %esi
 437:	53                   	push   %ebx
 438:	8b 75 08             	mov    0x8(%ebp),%esi
 43b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 43e:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 41c:	55                   	push   %ebp
 41d:	89 e5                	mov    %esp,%ebp
 41f:	56                   	push   %esi
 420:	53                   	push   %ebx
 421:	8b 75 08             	mov    0x8(%ebp),%esi
 424:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 427:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 441:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 443:	eb 0d                	jmp    452 <memmove+0x1f>
    *dst++ = *src++;
 445:	0f b6 01             	movzbl (%ecx),%eax
 448:	88 02                	mov    %al,(%edx)
 44a:	8d 49 01             	lea    0x1(%ecx),%ecx
 44d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 450:	89 d8                	mov    %ebx,%eax
 452:	8d 58 ff             	lea    -0x1(%eax),%ebx
 455:	85 c0                	test   %eax,%eax
 457:	7f ec                	jg     445 <memmove+0x12>
  return vdst;
}
 459:	89 f0                	mov    %esi,%eax
 45b:	5b                   	pop    %ebx
 45c:	5e                   	pop    %esi
 45d:	5d                   	pop    %ebp
 45e:	c3                   	ret    

0000045f <fork>:
=======
 42a:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 42c:	eb 0d                	jmp    43b <memmove+0x1f>
    *dst++ = *src++;
 42e:	0f b6 01             	movzbl (%ecx),%eax
 431:	88 02                	mov    %al,(%edx)
 433:	8d 49 01             	lea    0x1(%ecx),%ecx
 436:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 439:	89 d8                	mov    %ebx,%eax
 43b:	8d 58 ff             	lea    -0x1(%eax),%ebx
 43e:	85 c0                	test   %eax,%eax
 440:	7f ec                	jg     42e <memmove+0x12>
  return vdst;
}
 442:	89 f0                	mov    %esi,%eax
 444:	5b                   	pop    %ebx
 445:	5e                   	pop    %esi
 446:	5d                   	pop    %ebp
 447:	c3                   	ret    

00000448 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 45f:	b8 01 00 00 00       	mov    $0x1,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <exit>:
SYSCALL(exit)
 467:	b8 02 00 00 00       	mov    $0x2,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <wait>:
SYSCALL(wait)
 46f:	b8 03 00 00 00       	mov    $0x3,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <pipe>:
SYSCALL(pipe)
 477:	b8 04 00 00 00       	mov    $0x4,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <read>:
SYSCALL(read)
 47f:	b8 05 00 00 00       	mov    $0x5,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <write>:
SYSCALL(write)
 487:	b8 10 00 00 00       	mov    $0x10,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <close>:
SYSCALL(close)
 48f:	b8 15 00 00 00       	mov    $0x15,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <kill>:
SYSCALL(kill)
 497:	b8 06 00 00 00       	mov    $0x6,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <exec>:
SYSCALL(exec)
 49f:	b8 07 00 00 00       	mov    $0x7,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <open>:
SYSCALL(open)
 4a7:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <mknod>:
SYSCALL(mknod)
 4af:	b8 11 00 00 00       	mov    $0x11,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <unlink>:
SYSCALL(unlink)
 4b7:	b8 12 00 00 00       	mov    $0x12,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <fstat>:
SYSCALL(fstat)
 4bf:	b8 08 00 00 00       	mov    $0x8,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <link>:
SYSCALL(link)
 4c7:	b8 13 00 00 00       	mov    $0x13,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <mkdir>:
SYSCALL(mkdir)
 4cf:	b8 14 00 00 00       	mov    $0x14,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <chdir>:
SYSCALL(chdir)
 4d7:	b8 09 00 00 00       	mov    $0x9,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <dup>:
SYSCALL(dup)
 4df:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <getpid>:
SYSCALL(getpid)
 4e7:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <sbrk>:
SYSCALL(sbrk)
 4ef:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <sleep>:
SYSCALL(sleep)
 4f7:	b8 0d 00 00 00       	mov    $0xd,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <uptime>:
SYSCALL(uptime)
 4ff:	b8 0e 00 00 00       	mov    $0xe,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <clone>:
SYSCALL(clone)
 507:	b8 16 00 00 00       	mov    $0x16,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <join>:
 50f:	b8 17 00 00 00       	mov    $0x17,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <putc>:
=======
 448:	b8 01 00 00 00       	mov    $0x1,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <exit>:
SYSCALL(exit)
 450:	b8 02 00 00 00       	mov    $0x2,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <wait>:
SYSCALL(wait)
 458:	b8 03 00 00 00       	mov    $0x3,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <pipe>:
SYSCALL(pipe)
 460:	b8 04 00 00 00       	mov    $0x4,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <read>:
SYSCALL(read)
 468:	b8 05 00 00 00       	mov    $0x5,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <write>:
SYSCALL(write)
 470:	b8 10 00 00 00       	mov    $0x10,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <close>:
SYSCALL(close)
 478:	b8 15 00 00 00       	mov    $0x15,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <kill>:
SYSCALL(kill)
 480:	b8 06 00 00 00       	mov    $0x6,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <exec>:
SYSCALL(exec)
 488:	b8 07 00 00 00       	mov    $0x7,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <open>:
SYSCALL(open)
 490:	b8 0f 00 00 00       	mov    $0xf,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <mknod>:
SYSCALL(mknod)
 498:	b8 11 00 00 00       	mov    $0x11,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <unlink>:
SYSCALL(unlink)
 4a0:	b8 12 00 00 00       	mov    $0x12,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <fstat>:
SYSCALL(fstat)
 4a8:	b8 08 00 00 00       	mov    $0x8,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <link>:
SYSCALL(link)
 4b0:	b8 13 00 00 00       	mov    $0x13,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <mkdir>:
SYSCALL(mkdir)
 4b8:	b8 14 00 00 00       	mov    $0x14,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <chdir>:
SYSCALL(chdir)
 4c0:	b8 09 00 00 00       	mov    $0x9,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <dup>:
SYSCALL(dup)
 4c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <getpid>:
SYSCALL(getpid)
 4d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <sbrk>:
SYSCALL(sbrk)
 4d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <sleep>:
SYSCALL(sleep)
 4e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <uptime>:
SYSCALL(uptime)
 4e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <clone>:
SYSCALL(clone)
 4f0:	b8 16 00 00 00       	mov    $0x16,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <join>:
 4f8:	b8 17 00 00 00       	mov    $0x17,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	83 ec 1c             	sub    $0x1c,%esp
 51d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 520:	6a 01                	push   $0x1
 522:	8d 55 f4             	lea    -0xc(%ebp),%edx
 525:	52                   	push   %edx
 526:	50                   	push   %eax
 527:	e8 5b ff ff ff       	call   487 <write>
}
 52c:	83 c4 10             	add    $0x10,%esp
 52f:	c9                   	leave  
 530:	c3                   	ret    

00000531 <printint>:
=======
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	83 ec 1c             	sub    $0x1c,%esp
 506:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 509:	6a 01                	push   $0x1
 50b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 50e:	52                   	push   %edx
 50f:	50                   	push   %eax
 510:	e8 5b ff ff ff       	call   470 <write>
}
 515:	83 c4 10             	add    $0x10,%esp
 518:	c9                   	leave  
 519:	c3                   	ret    

0000051a <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	57                   	push   %edi
 535:	56                   	push   %esi
 536:	53                   	push   %ebx
 537:	83 ec 2c             	sub    $0x2c,%esp
 53a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 53d:	89 d0                	mov    %edx,%eax
 53f:	89 ce                	mov    %ecx,%esi
=======
 51a:	55                   	push   %ebp
 51b:	89 e5                	mov    %esp,%ebp
 51d:	57                   	push   %edi
 51e:	56                   	push   %esi
 51f:	53                   	push   %ebx
 520:	83 ec 2c             	sub    $0x2c,%esp
 523:	89 45 d0             	mov    %eax,-0x30(%ebp)
 526:	89 d0                	mov    %edx,%eax
 528:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 541:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 545:	0f 95 c1             	setne  %cl
 548:	c1 ea 1f             	shr    $0x1f,%edx
 54b:	84 d1                	test   %dl,%cl
 54d:	74 44                	je     593 <printint+0x62>
    neg = 1;
    x = -xx;
 54f:	f7 d8                	neg    %eax
 551:	89 c1                	mov    %eax,%ecx
    neg = 1;
 553:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 52a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 52e:	0f 95 c1             	setne  %cl
 531:	c1 ea 1f             	shr    $0x1f,%edx
 534:	84 d1                	test   %dl,%cl
 536:	74 44                	je     57c <printint+0x62>
    neg = 1;
    x = -xx;
 538:	f7 d8                	neg    %eax
 53a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 53c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 55a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 55f:	89 c8                	mov    %ecx,%eax
 561:	ba 00 00 00 00       	mov    $0x0,%edx
 566:	f7 f6                	div    %esi
 568:	89 df                	mov    %ebx,%edi
 56a:	83 c3 01             	add    $0x1,%ebx
 56d:	0f b6 92 48 09 00 00 	movzbl 0x948(%edx),%edx
 574:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 578:	89 ca                	mov    %ecx,%edx
 57a:	89 c1                	mov    %eax,%ecx
 57c:	39 d6                	cmp    %edx,%esi
 57e:	76 df                	jbe    55f <printint+0x2e>
  if(neg)
 580:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 584:	74 31                	je     5b7 <printint+0x86>
    buf[i++] = '-';
 586:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 58b:	8d 5f 02             	lea    0x2(%edi),%ebx
 58e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 591:	eb 17                	jmp    5aa <printint+0x79>
    x = xx;
 593:	89 c1                	mov    %eax,%ecx
  neg = 0;
 595:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 59c:	eb bc                	jmp    55a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 59e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5a3:	89 f0                	mov    %esi,%eax
 5a5:	e8 6d ff ff ff       	call   517 <putc>
  while(--i >= 0)
 5aa:	83 eb 01             	sub    $0x1,%ebx
 5ad:	79 ef                	jns    59e <printint+0x6d>
}
 5af:	83 c4 2c             	add    $0x2c,%esp
 5b2:	5b                   	pop    %ebx
 5b3:	5e                   	pop    %esi
 5b4:	5f                   	pop    %edi
 5b5:	5d                   	pop    %ebp
 5b6:	c3                   	ret    
 5b7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5ba:	eb ee                	jmp    5aa <printint+0x79>

000005bc <printf>:
=======
 543:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 548:	89 c8                	mov    %ecx,%eax
 54a:	ba 00 00 00 00       	mov    $0x0,%edx
 54f:	f7 f6                	div    %esi
 551:	89 df                	mov    %ebx,%edi
 553:	83 c3 01             	add    $0x1,%ebx
 556:	0f b6 92 30 09 00 00 	movzbl 0x930(%edx),%edx
 55d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 561:	89 ca                	mov    %ecx,%edx
 563:	89 c1                	mov    %eax,%ecx
 565:	39 d6                	cmp    %edx,%esi
 567:	76 df                	jbe    548 <printint+0x2e>
  if(neg)
 569:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 56d:	74 31                	je     5a0 <printint+0x86>
    buf[i++] = '-';
 56f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 574:	8d 5f 02             	lea    0x2(%edi),%ebx
 577:	8b 75 d0             	mov    -0x30(%ebp),%esi
 57a:	eb 17                	jmp    593 <printint+0x79>
    x = xx;
 57c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 57e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 585:	eb bc                	jmp    543 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 587:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 58c:	89 f0                	mov    %esi,%eax
 58e:	e8 6d ff ff ff       	call   500 <putc>
  while(--i >= 0)
 593:	83 eb 01             	sub    $0x1,%ebx
 596:	79 ef                	jns    587 <printint+0x6d>
}
 598:	83 c4 2c             	add    $0x2c,%esp
 59b:	5b                   	pop    %ebx
 59c:	5e                   	pop    %esi
 59d:	5f                   	pop    %edi
 59e:	5d                   	pop    %ebp
 59f:	c3                   	ret    
 5a0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5a3:	eb ee                	jmp    593 <printint+0x79>

000005a5 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 5bc:	55                   	push   %ebp
 5bd:	89 e5                	mov    %esp,%ebp
 5bf:	57                   	push   %edi
 5c0:	56                   	push   %esi
 5c1:	53                   	push   %ebx
 5c2:	83 ec 1c             	sub    $0x1c,%esp
=======
 5a5:	55                   	push   %ebp
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	53                   	push   %ebx
 5ab:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 5c5:	8d 45 10             	lea    0x10(%ebp),%eax
 5c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5cb:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5d0:	bb 00 00 00 00       	mov    $0x0,%ebx
 5d5:	eb 14                	jmp    5eb <printf+0x2f>
=======
 5ae:	8d 45 10             	lea    0x10(%ebp),%eax
 5b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5b4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5b9:	bb 00 00 00 00       	mov    $0x0,%ebx
 5be:	eb 14                	jmp    5d4 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 5d7:	89 fa                	mov    %edi,%edx
 5d9:	8b 45 08             	mov    0x8(%ebp),%eax
 5dc:	e8 36 ff ff ff       	call   517 <putc>
 5e1:	eb 05                	jmp    5e8 <printf+0x2c>
      }
    } else if(state == '%'){
 5e3:	83 fe 25             	cmp    $0x25,%esi
 5e6:	74 25                	je     60d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5e8:	83 c3 01             	add    $0x1,%ebx
 5eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ee:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5f2:	84 c0                	test   %al,%al
 5f4:	0f 84 20 01 00 00    	je     71a <printf+0x15e>
    c = fmt[i] & 0xff;
 5fa:	0f be f8             	movsbl %al,%edi
 5fd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 600:	85 f6                	test   %esi,%esi
 602:	75 df                	jne    5e3 <printf+0x27>
      if(c == '%'){
 604:	83 f8 25             	cmp    $0x25,%eax
 607:	75 ce                	jne    5d7 <printf+0x1b>
        state = '%';
 609:	89 c6                	mov    %eax,%esi
 60b:	eb db                	jmp    5e8 <printf+0x2c>
      if(c == 'd'){
 60d:	83 f8 25             	cmp    $0x25,%eax
 610:	0f 84 cf 00 00 00    	je     6e5 <printf+0x129>
 616:	0f 8c dd 00 00 00    	jl     6f9 <printf+0x13d>
 61c:	83 f8 78             	cmp    $0x78,%eax
 61f:	0f 8f d4 00 00 00    	jg     6f9 <printf+0x13d>
 625:	83 f8 63             	cmp    $0x63,%eax
 628:	0f 8c cb 00 00 00    	jl     6f9 <printf+0x13d>
 62e:	83 e8 63             	sub    $0x63,%eax
 631:	83 f8 15             	cmp    $0x15,%eax
 634:	0f 87 bf 00 00 00    	ja     6f9 <printf+0x13d>
 63a:	ff 24 85 f0 08 00 00 	jmp    *0x8f0(,%eax,4)
        printint(fd, *ap, 10, 1);
 641:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 644:	8b 17                	mov    (%edi),%edx
 646:	83 ec 0c             	sub    $0xc,%esp
 649:	6a 01                	push   $0x1
 64b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 650:	8b 45 08             	mov    0x8(%ebp),%eax
 653:	e8 d9 fe ff ff       	call   531 <printint>
        ap++;
 658:	83 c7 04             	add    $0x4,%edi
 65b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 65e:	83 c4 10             	add    $0x10,%esp
=======
 5c0:	89 fa                	mov    %edi,%edx
 5c2:	8b 45 08             	mov    0x8(%ebp),%eax
 5c5:	e8 36 ff ff ff       	call   500 <putc>
 5ca:	eb 05                	jmp    5d1 <printf+0x2c>
      }
    } else if(state == '%'){
 5cc:	83 fe 25             	cmp    $0x25,%esi
 5cf:	74 25                	je     5f6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5d1:	83 c3 01             	add    $0x1,%ebx
 5d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5db:	84 c0                	test   %al,%al
 5dd:	0f 84 20 01 00 00    	je     703 <printf+0x15e>
    c = fmt[i] & 0xff;
 5e3:	0f be f8             	movsbl %al,%edi
 5e6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5e9:	85 f6                	test   %esi,%esi
 5eb:	75 df                	jne    5cc <printf+0x27>
      if(c == '%'){
 5ed:	83 f8 25             	cmp    $0x25,%eax
 5f0:	75 ce                	jne    5c0 <printf+0x1b>
        state = '%';
 5f2:	89 c6                	mov    %eax,%esi
 5f4:	eb db                	jmp    5d1 <printf+0x2c>
      if(c == 'd'){
 5f6:	83 f8 25             	cmp    $0x25,%eax
 5f9:	0f 84 cf 00 00 00    	je     6ce <printf+0x129>
 5ff:	0f 8c dd 00 00 00    	jl     6e2 <printf+0x13d>
 605:	83 f8 78             	cmp    $0x78,%eax
 608:	0f 8f d4 00 00 00    	jg     6e2 <printf+0x13d>
 60e:	83 f8 63             	cmp    $0x63,%eax
 611:	0f 8c cb 00 00 00    	jl     6e2 <printf+0x13d>
 617:	83 e8 63             	sub    $0x63,%eax
 61a:	83 f8 15             	cmp    $0x15,%eax
 61d:	0f 87 bf 00 00 00    	ja     6e2 <printf+0x13d>
 623:	ff 24 85 d8 08 00 00 	jmp    *0x8d8(,%eax,4)
        printint(fd, *ap, 10, 1);
 62a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 62d:	8b 17                	mov    (%edi),%edx
 62f:	83 ec 0c             	sub    $0xc,%esp
 632:	6a 01                	push   $0x1
 634:	b9 0a 00 00 00       	mov    $0xa,%ecx
 639:	8b 45 08             	mov    0x8(%ebp),%eax
 63c:	e8 d9 fe ff ff       	call   51a <printint>
        ap++;
 641:	83 c7 04             	add    $0x4,%edi
 644:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 647:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 661:	be 00 00 00 00       	mov    $0x0,%esi
 666:	eb 80                	jmp    5e8 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 668:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 66b:	8b 17                	mov    (%edi),%edx
 66d:	83 ec 0c             	sub    $0xc,%esp
 670:	6a 00                	push   $0x0
 672:	b9 10 00 00 00       	mov    $0x10,%ecx
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	e8 b2 fe ff ff       	call   531 <printint>
        ap++;
 67f:	83 c7 04             	add    $0x4,%edi
 682:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 685:	83 c4 10             	add    $0x10,%esp
      state = 0;
 688:	be 00 00 00 00       	mov    $0x0,%esi
 68d:	e9 56 ff ff ff       	jmp    5e8 <printf+0x2c>
        s = (char*)*ap;
 692:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 695:	8b 30                	mov    (%eax),%esi
        ap++;
 697:	83 c0 04             	add    $0x4,%eax
 69a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 69d:	85 f6                	test   %esi,%esi
 69f:	75 15                	jne    6b6 <printf+0xfa>
          s = "(null)";
 6a1:	be e6 08 00 00       	mov    $0x8e6,%esi
 6a6:	eb 0e                	jmp    6b6 <printf+0xfa>
          putc(fd, *s);
 6a8:	0f be d2             	movsbl %dl,%edx
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	e8 64 fe ff ff       	call   517 <putc>
          s++;
 6b3:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6b6:	0f b6 16             	movzbl (%esi),%edx
 6b9:	84 d2                	test   %dl,%dl
 6bb:	75 eb                	jne    6a8 <printf+0xec>
      state = 0;
 6bd:	be 00 00 00 00       	mov    $0x0,%esi
 6c2:	e9 21 ff ff ff       	jmp    5e8 <printf+0x2c>
        putc(fd, *ap);
 6c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ca:	0f be 17             	movsbl (%edi),%edx
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	e8 42 fe ff ff       	call   517 <putc>
        ap++;
 6d5:	83 c7 04             	add    $0x4,%edi
 6d8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6db:	be 00 00 00 00       	mov    $0x0,%esi
 6e0:	e9 03 ff ff ff       	jmp    5e8 <printf+0x2c>
        putc(fd, c);
 6e5:	89 fa                	mov    %edi,%edx
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	e8 28 fe ff ff       	call   517 <putc>
      state = 0;
 6ef:	be 00 00 00 00       	mov    $0x0,%esi
 6f4:	e9 ef fe ff ff       	jmp    5e8 <printf+0x2c>
        putc(fd, '%');
 6f9:	ba 25 00 00 00       	mov    $0x25,%edx
 6fe:	8b 45 08             	mov    0x8(%ebp),%eax
 701:	e8 11 fe ff ff       	call   517 <putc>
        putc(fd, c);
 706:	89 fa                	mov    %edi,%edx
 708:	8b 45 08             	mov    0x8(%ebp),%eax
 70b:	e8 07 fe ff ff       	call   517 <putc>
      state = 0;
 710:	be 00 00 00 00       	mov    $0x0,%esi
 715:	e9 ce fe ff ff       	jmp    5e8 <printf+0x2c>
    }
  }
}
 71a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 71d:	5b                   	pop    %ebx
 71e:	5e                   	pop    %esi
 71f:	5f                   	pop    %edi
 720:	5d                   	pop    %ebp
 721:	c3                   	ret    

00000722 <free>:
=======
 64a:	be 00 00 00 00       	mov    $0x0,%esi
 64f:	eb 80                	jmp    5d1 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 651:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 654:	8b 17                	mov    (%edi),%edx
 656:	83 ec 0c             	sub    $0xc,%esp
 659:	6a 00                	push   $0x0
 65b:	b9 10 00 00 00       	mov    $0x10,%ecx
 660:	8b 45 08             	mov    0x8(%ebp),%eax
 663:	e8 b2 fe ff ff       	call   51a <printint>
        ap++;
 668:	83 c7 04             	add    $0x4,%edi
 66b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 66e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 671:	be 00 00 00 00       	mov    $0x0,%esi
 676:	e9 56 ff ff ff       	jmp    5d1 <printf+0x2c>
        s = (char*)*ap;
 67b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67e:	8b 30                	mov    (%eax),%esi
        ap++;
 680:	83 c0 04             	add    $0x4,%eax
 683:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 686:	85 f6                	test   %esi,%esi
 688:	75 15                	jne    69f <printf+0xfa>
          s = "(null)";
 68a:	be ce 08 00 00       	mov    $0x8ce,%esi
 68f:	eb 0e                	jmp    69f <printf+0xfa>
          putc(fd, *s);
 691:	0f be d2             	movsbl %dl,%edx
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	e8 64 fe ff ff       	call   500 <putc>
          s++;
 69c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 69f:	0f b6 16             	movzbl (%esi),%edx
 6a2:	84 d2                	test   %dl,%dl
 6a4:	75 eb                	jne    691 <printf+0xec>
      state = 0;
 6a6:	be 00 00 00 00       	mov    $0x0,%esi
 6ab:	e9 21 ff ff ff       	jmp    5d1 <printf+0x2c>
        putc(fd, *ap);
 6b0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b3:	0f be 17             	movsbl (%edi),%edx
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	e8 42 fe ff ff       	call   500 <putc>
        ap++;
 6be:	83 c7 04             	add    $0x4,%edi
 6c1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6c4:	be 00 00 00 00       	mov    $0x0,%esi
 6c9:	e9 03 ff ff ff       	jmp    5d1 <printf+0x2c>
        putc(fd, c);
 6ce:	89 fa                	mov    %edi,%edx
 6d0:	8b 45 08             	mov    0x8(%ebp),%eax
 6d3:	e8 28 fe ff ff       	call   500 <putc>
      state = 0;
 6d8:	be 00 00 00 00       	mov    $0x0,%esi
 6dd:	e9 ef fe ff ff       	jmp    5d1 <printf+0x2c>
        putc(fd, '%');
 6e2:	ba 25 00 00 00       	mov    $0x25,%edx
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	e8 11 fe ff ff       	call   500 <putc>
        putc(fd, c);
 6ef:	89 fa                	mov    %edi,%edx
 6f1:	8b 45 08             	mov    0x8(%ebp),%eax
 6f4:	e8 07 fe ff ff       	call   500 <putc>
      state = 0;
 6f9:	be 00 00 00 00       	mov    $0x0,%esi
 6fe:	e9 ce fe ff ff       	jmp    5d1 <printf+0x2c>
    }
  }
}
 703:	8d 65 f4             	lea    -0xc(%ebp),%esp
 706:	5b                   	pop    %ebx
 707:	5e                   	pop    %esi
 708:	5f                   	pop    %edi
 709:	5d                   	pop    %ebp
 70a:	c3                   	ret    

0000070b <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 722:	55                   	push   %ebp
 723:	89 e5                	mov    %esp,%ebp
 725:	57                   	push   %edi
 726:	56                   	push   %esi
 727:	53                   	push   %ebx
 728:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 72b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72e:	a1 20 0e 00 00       	mov    0xe20,%eax
 733:	eb 02                	jmp    737 <free+0x15>
 735:	89 d0                	mov    %edx,%eax
 737:	39 c8                	cmp    %ecx,%eax
 739:	73 04                	jae    73f <free+0x1d>
 73b:	39 08                	cmp    %ecx,(%eax)
 73d:	77 12                	ja     751 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73f:	8b 10                	mov    (%eax),%edx
 741:	39 c2                	cmp    %eax,%edx
 743:	77 f0                	ja     735 <free+0x13>
 745:	39 c8                	cmp    %ecx,%eax
 747:	72 08                	jb     751 <free+0x2f>
 749:	39 ca                	cmp    %ecx,%edx
 74b:	77 04                	ja     751 <free+0x2f>
 74d:	89 d0                	mov    %edx,%eax
 74f:	eb e6                	jmp    737 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 751:	8b 73 fc             	mov    -0x4(%ebx),%esi
 754:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 757:	8b 10                	mov    (%eax),%edx
 759:	39 d7                	cmp    %edx,%edi
 75b:	74 19                	je     776 <free+0x54>
=======
 70b:	55                   	push   %ebp
 70c:	89 e5                	mov    %esp,%ebp
 70e:	57                   	push   %edi
 70f:	56                   	push   %esi
 710:	53                   	push   %ebx
 711:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 714:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 717:	a1 00 10 00 00       	mov    0x1000,%eax
 71c:	eb 02                	jmp    720 <free+0x15>
 71e:	89 d0                	mov    %edx,%eax
 720:	39 c8                	cmp    %ecx,%eax
 722:	73 04                	jae    728 <free+0x1d>
 724:	39 08                	cmp    %ecx,(%eax)
 726:	77 12                	ja     73a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 728:	8b 10                	mov    (%eax),%edx
 72a:	39 c2                	cmp    %eax,%edx
 72c:	77 f0                	ja     71e <free+0x13>
 72e:	39 c8                	cmp    %ecx,%eax
 730:	72 08                	jb     73a <free+0x2f>
 732:	39 ca                	cmp    %ecx,%edx
 734:	77 04                	ja     73a <free+0x2f>
 736:	89 d0                	mov    %edx,%eax
 738:	eb e6                	jmp    720 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 73a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 740:	8b 10                	mov    (%eax),%edx
 742:	39 d7                	cmp    %edx,%edi
 744:	74 19                	je     75f <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 75d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 760:	8b 50 04             	mov    0x4(%eax),%edx
 763:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 766:	39 ce                	cmp    %ecx,%esi
 768:	74 1b                	je     785 <free+0x63>
=======
 746:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 749:	8b 50 04             	mov    0x4(%eax),%edx
 74c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 74f:	39 ce                	cmp    %ecx,%esi
 751:	74 1b                	je     76e <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 76a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 76c:	a3 20 0e 00 00       	mov    %eax,0xe20
}
 771:	5b                   	pop    %ebx
 772:	5e                   	pop    %esi
 773:	5f                   	pop    %edi
 774:	5d                   	pop    %ebp
 775:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 776:	03 72 04             	add    0x4(%edx),%esi
 779:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 77c:	8b 10                	mov    (%eax),%edx
 77e:	8b 12                	mov    (%edx),%edx
 780:	89 53 f8             	mov    %edx,-0x8(%ebx)
 783:	eb db                	jmp    760 <free+0x3e>
    p->s.size += bp->s.size;
 785:	03 53 fc             	add    -0x4(%ebx),%edx
 788:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 78b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 78e:	89 10                	mov    %edx,(%eax)
 790:	eb da                	jmp    76c <free+0x4a>

00000792 <morecore>:
=======
 753:	89 08                	mov    %ecx,(%eax)
  freep = p;
 755:	a3 00 10 00 00       	mov    %eax,0x1000
}
 75a:	5b                   	pop    %ebx
 75b:	5e                   	pop    %esi
 75c:	5f                   	pop    %edi
 75d:	5d                   	pop    %ebp
 75e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 75f:	03 72 04             	add    0x4(%edx),%esi
 762:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 765:	8b 10                	mov    (%eax),%edx
 767:	8b 12                	mov    (%edx),%edx
 769:	89 53 f8             	mov    %edx,-0x8(%ebx)
 76c:	eb db                	jmp    749 <free+0x3e>
    p->s.size += bp->s.size;
 76e:	03 53 fc             	add    -0x4(%ebx),%edx
 771:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 774:	8b 53 f8             	mov    -0x8(%ebx),%edx
 777:	89 10                	mov    %edx,(%eax)
 779:	eb da                	jmp    755 <free+0x4a>

0000077b <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 792:	55                   	push   %ebp
 793:	89 e5                	mov    %esp,%ebp
 795:	53                   	push   %ebx
 796:	83 ec 04             	sub    $0x4,%esp
 799:	89 c3                	mov    %eax,%ebx
=======
 77b:	55                   	push   %ebp
 77c:	89 e5                	mov    %esp,%ebp
 77e:	53                   	push   %ebx
 77f:	83 ec 04             	sub    $0x4,%esp
 782:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 79b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7a0:	77 05                	ja     7a7 <morecore+0x15>
    nu = 4096;
 7a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7a7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ae:	83 ec 0c             	sub    $0xc,%esp
 7b1:	50                   	push   %eax
 7b2:	e8 38 fd ff ff       	call   4ef <sbrk>
  if(p == (char*)-1)
 7b7:	83 c4 10             	add    $0x10,%esp
 7ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 7bd:	74 1c                	je     7db <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7bf:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7c2:	83 c0 08             	add    $0x8,%eax
 7c5:	83 ec 0c             	sub    $0xc,%esp
 7c8:	50                   	push   %eax
 7c9:	e8 54 ff ff ff       	call   722 <free>
  return freep;
 7ce:	a1 20 0e 00 00       	mov    0xe20,%eax
 7d3:	83 c4 10             	add    $0x10,%esp
}
 7d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7d9:	c9                   	leave  
 7da:	c3                   	ret    
    return 0;
 7db:	b8 00 00 00 00       	mov    $0x0,%eax
 7e0:	eb f4                	jmp    7d6 <morecore+0x44>

000007e2 <malloc>:
=======
 784:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 789:	77 05                	ja     790 <morecore+0x15>
    nu = 4096;
 78b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 790:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 797:	83 ec 0c             	sub    $0xc,%esp
 79a:	50                   	push   %eax
 79b:	e8 38 fd ff ff       	call   4d8 <sbrk>
  if(p == (char*)-1)
 7a0:	83 c4 10             	add    $0x10,%esp
 7a3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7a6:	74 1c                	je     7c4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7a8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7ab:	83 c0 08             	add    $0x8,%eax
 7ae:	83 ec 0c             	sub    $0xc,%esp
 7b1:	50                   	push   %eax
 7b2:	e8 54 ff ff ff       	call   70b <free>
  return freep;
 7b7:	a1 00 10 00 00       	mov    0x1000,%eax
 7bc:	83 c4 10             	add    $0x10,%esp
}
 7bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7c2:	c9                   	leave  
 7c3:	c3                   	ret    
    return 0;
 7c4:	b8 00 00 00 00       	mov    $0x0,%eax
 7c9:	eb f4                	jmp    7bf <morecore+0x44>

000007cb <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 7e2:	55                   	push   %ebp
 7e3:	89 e5                	mov    %esp,%ebp
 7e5:	53                   	push   %ebx
 7e6:	83 ec 04             	sub    $0x4,%esp
=======
 7cb:	55                   	push   %ebp
 7cc:	89 e5                	mov    %esp,%ebp
 7ce:	53                   	push   %ebx
 7cf:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ec:	8d 58 07             	lea    0x7(%eax),%ebx
 7ef:	c1 eb 03             	shr    $0x3,%ebx
 7f2:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7f5:	8b 0d 20 0e 00 00    	mov    0xe20,%ecx
 7fb:	85 c9                	test   %ecx,%ecx
 7fd:	74 04                	je     803 <malloc+0x21>
=======
 7d2:	8b 45 08             	mov    0x8(%ebp),%eax
 7d5:	8d 58 07             	lea    0x7(%eax),%ebx
 7d8:	c1 eb 03             	shr    $0x3,%ebx
 7db:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7de:	8b 0d 00 10 00 00    	mov    0x1000,%ecx
 7e4:	85 c9                	test   %ecx,%ecx
 7e6:	74 04                	je     7ec <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 7ff:	8b 01                	mov    (%ecx),%eax
 801:	eb 4a                	jmp    84d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 803:	c7 05 20 0e 00 00 24 	movl   $0xe24,0xe20
 80a:	0e 00 00 
 80d:	c7 05 24 0e 00 00 24 	movl   $0xe24,0xe24
 814:	0e 00 00 
    base.s.size = 0;
 817:	c7 05 28 0e 00 00 00 	movl   $0x0,0xe28
 81e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 821:	b9 24 0e 00 00       	mov    $0xe24,%ecx
 826:	eb d7                	jmp    7ff <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 828:	74 19                	je     843 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 82a:	29 da                	sub    %ebx,%edx
 82c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 82f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 832:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 835:	89 0d 20 0e 00 00    	mov    %ecx,0xe20
      return (void*)(p + 1);
 83b:	83 c0 08             	add    $0x8,%eax
=======
 7e8:	8b 01                	mov    (%ecx),%eax
 7ea:	eb 4a                	jmp    836 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7ec:	c7 05 00 10 00 00 04 	movl   $0x1004,0x1000
 7f3:	10 00 00 
 7f6:	c7 05 04 10 00 00 04 	movl   $0x1004,0x1004
 7fd:	10 00 00 
    base.s.size = 0;
 800:	c7 05 08 10 00 00 00 	movl   $0x0,0x1008
 807:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 80a:	b9 04 10 00 00       	mov    $0x1004,%ecx
 80f:	eb d7                	jmp    7e8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 811:	74 19                	je     82c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 813:	29 da                	sub    %ebx,%edx
 815:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 818:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 81b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 81e:	89 0d 00 10 00 00    	mov    %ecx,0x1000
      return (void*)(p + 1);
 824:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 83e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 841:	c9                   	leave  
 842:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 843:	8b 10                	mov    (%eax),%edx
 845:	89 11                	mov    %edx,(%ecx)
 847:	eb ec                	jmp    835 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	89 c1                	mov    %eax,%ecx
 84b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 84d:	8b 50 04             	mov    0x4(%eax),%edx
 850:	39 da                	cmp    %ebx,%edx
 852:	73 d4                	jae    828 <malloc+0x46>
    if(p == freep)
 854:	39 05 20 0e 00 00    	cmp    %eax,0xe20
 85a:	75 ed                	jne    849 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 85c:	89 d8                	mov    %ebx,%eax
 85e:	e8 2f ff ff ff       	call   792 <morecore>
 863:	85 c0                	test   %eax,%eax
 865:	75 e2                	jne    849 <malloc+0x67>
 867:	eb d5                	jmp    83e <malloc+0x5c>
=======
 827:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 82a:	c9                   	leave  
 82b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 82c:	8b 10                	mov    (%eax),%edx
 82e:	89 11                	mov    %edx,(%ecx)
 830:	eb ec                	jmp    81e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 832:	89 c1                	mov    %eax,%ecx
 834:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 836:	8b 50 04             	mov    0x4(%eax),%edx
 839:	39 da                	cmp    %ebx,%edx
 83b:	73 d4                	jae    811 <malloc+0x46>
    if(p == freep)
 83d:	39 05 00 10 00 00    	cmp    %eax,0x1000
 843:	75 ed                	jne    832 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 845:	89 d8                	mov    %ebx,%eax
 847:	e8 2f ff ff ff       	call   77b <morecore>
 84c:	85 c0                	test   %eax,%eax
 84e:	75 e2                	jne    832 <malloc+0x67>
 850:	eb d5                	jmp    827 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
