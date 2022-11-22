
_test_10:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 23             	cmpl   $0x23,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
<<<<<<< HEAD
  1c:	a1 94 0d 00 00       	mov    0xd94,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 2f                	push   $0x2f
  2c:	68 04 09 00 00       	push   $0x904
  31:	68 0e 09 00 00       	push   $0x90e
  36:	6a 01                	push   $0x1
  38:	e8 1a 06 00 00       	call   657 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 55 09 00 00       	push   $0x955
  45:	68 25 09 00 00       	push   $0x925
  4a:	6a 01                	push   $0x1
  4c:	e8 06 06 00 00       	call   657 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 39 09 00 00       	push   $0x939
  59:	6a 01                	push   $0x1
  5b:	e8 f7 05 00 00       	call   657 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 a0 0d 00 00    	push   0xda0
  69:	e8 c4 04 00 00       	call   532 <kill>
  6e:	e8 8f 04 00 00       	call   502 <exit>
   assert(arg1_int == 35);
  73:	6a 2d                	push   $0x2d
  75:	68 04 09 00 00       	push   $0x904
  7a:	68 0e 09 00 00       	push   $0x90e
  7f:	6a 01                	push   $0x1
  81:	e8 d1 05 00 00       	call   657 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 16 09 00 00       	push   $0x916
  8e:	68 25 09 00 00       	push   $0x925
  93:	6a 01                	push   $0x1
  95:	e8 bd 05 00 00       	call   657 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 39 09 00 00       	push   $0x939
  a2:	6a 01                	push   $0x1
  a4:	e8 ae 05 00 00       	call   657 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 a0 0d 00 00    	push   0xda0
  b2:	e8 7b 04 00 00       	call   532 <kill>
  b7:	e8 46 04 00 00       	call   502 <exit>
   assert(arg2_int == 42);
  bc:	6a 2e                	push   $0x2e
  be:	68 04 09 00 00       	push   $0x904
  c3:	68 0e 09 00 00       	push   $0x90e
  c8:	6a 01                	push   $0x1
  ca:	e8 88 05 00 00       	call   657 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 46 09 00 00       	push   $0x946
  d7:	68 25 09 00 00       	push   $0x925
  dc:	6a 01                	push   $0x1
  de:	e8 74 05 00 00       	call   657 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 39 09 00 00       	push   $0x939
  eb:	6a 01                	push   $0x1
  ed:	e8 65 05 00 00       	call   657 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 a0 0d 00 00    	push   0xda0
  fb:	e8 32 04 00 00       	call   532 <kill>
 100:	e8 fd 03 00 00       	call   502 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 94 0d 00 00       	mov    %eax,0xd94
   exit();
 10d:	e8 f0 03 00 00       	call   502 <exit>
=======
  1c:	a1 7c 0d 00 00       	mov    0xd7c,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 2f                	push   $0x2f
  2c:	68 f0 08 00 00       	push   $0x8f0
  31:	68 fa 08 00 00       	push   $0x8fa
  36:	6a 01                	push   $0x1
  38:	e8 03 06 00 00       	call   640 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 41 09 00 00       	push   $0x941
  45:	68 11 09 00 00       	push   $0x911
  4a:	6a 01                	push   $0x1
  4c:	e8 ef 05 00 00       	call   640 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 25 09 00 00       	push   $0x925
  59:	6a 01                	push   $0x1
  5b:	e8 e0 05 00 00       	call   640 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 80 0d 00 00    	push   0xd80
  69:	e8 ad 04 00 00       	call   51b <kill>
  6e:	e8 78 04 00 00       	call   4eb <exit>
   assert(arg1_int == 35);
  73:	6a 2d                	push   $0x2d
  75:	68 f0 08 00 00       	push   $0x8f0
  7a:	68 fa 08 00 00       	push   $0x8fa
  7f:	6a 01                	push   $0x1
  81:	e8 ba 05 00 00       	call   640 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 02 09 00 00       	push   $0x902
  8e:	68 11 09 00 00       	push   $0x911
  93:	6a 01                	push   $0x1
  95:	e8 a6 05 00 00       	call   640 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 25 09 00 00       	push   $0x925
  a2:	6a 01                	push   $0x1
  a4:	e8 97 05 00 00       	call   640 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 80 0d 00 00    	push   0xd80
  b2:	e8 64 04 00 00       	call   51b <kill>
  b7:	e8 2f 04 00 00       	call   4eb <exit>
   assert(arg2_int == 42);
  bc:	6a 2e                	push   $0x2e
  be:	68 f0 08 00 00       	push   $0x8f0
  c3:	68 fa 08 00 00       	push   $0x8fa
  c8:	6a 01                	push   $0x1
  ca:	e8 71 05 00 00       	call   640 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 32 09 00 00       	push   $0x932
  d7:	68 11 09 00 00       	push   $0x911
  dc:	6a 01                	push   $0x1
  de:	e8 5d 05 00 00       	call   640 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 25 09 00 00       	push   $0x925
  eb:	6a 01                	push   $0x1
  ed:	e8 4e 05 00 00       	call   640 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 80 0d 00 00    	push   0xd80
  fb:	e8 1b 04 00 00       	call   51b <kill>
 100:	e8 e6 03 00 00       	call   4eb <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 7c 0d 00 00       	mov    %eax,0xd7c
   exit();
 10d:	e8 d9 03 00 00       	call   4eb <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	53                   	push   %ebx
 120:	51                   	push   %ecx
 121:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
<<<<<<< HEAD
 124:	e8 59 04 00 00       	call   582 <getpid>
 129:	a3 a0 0d 00 00       	mov    %eax,0xda0
=======
 124:	e8 42 04 00 00       	call   56b <getpid>
 129:	a3 80 0d 00 00       	mov    %eax,0xd80
>>>>>>> c59b0f9 (fixed thread_join and join)
   int arg1 = 35;
 12e:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 135:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	8d 45 f0             	lea    -0x10(%ebp),%eax
 142:	50                   	push   %eax
 143:	8d 45 f4             	lea    -0xc(%ebp),%eax
 146:	50                   	push   %eax
 147:	68 00 00 00 00       	push   $0x0
 14c:	e8 23 01 00 00       	call   274 <thread_create>
   assert(thread_pid > 0);
 151:	83 c4 10             	add    $0x10,%esp
 154:	85 c0                	test   %eax,%eax
 156:	7e 65                	jle    1bd <main+0xab>
 158:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
<<<<<<< HEAD
 15a:	e8 75 01 00 00       	call   2d4 <thread_join>
=======
 15a:	e8 8b 01 00 00       	call   2ea <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(join_pid == thread_pid);
 15f:	39 c3                	cmp    %eax,%ebx
 161:	0f 85 9f 00 00 00    	jne    206 <main+0xf4>
   assert(global == 2);
<<<<<<< HEAD
 167:	83 3d 94 0d 00 00 02 	cmpl   $0x2,0xd94
 16e:	0f 84 db 00 00 00    	je     24f <main+0x13d>
 174:	6a 23                	push   $0x23
 176:	68 04 09 00 00       	push   $0x904
 17b:	68 0e 09 00 00       	push   $0x90e
 180:	6a 01                	push   $0x1
 182:	e8 d0 04 00 00       	call   657 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 87 09 00 00       	push   $0x987
 18f:	68 25 09 00 00       	push   $0x925
 194:	6a 01                	push   $0x1
 196:	e8 bc 04 00 00       	call   657 <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 39 09 00 00       	push   $0x939
 1a3:	6a 01                	push   $0x1
 1a5:	e8 ad 04 00 00       	call   657 <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 a0 0d 00 00    	push   0xda0
 1b3:	e8 7a 03 00 00       	call   532 <kill>
 1b8:	e8 45 03 00 00       	call   502 <exit>
   assert(thread_pid > 0);
 1bd:	6a 1f                	push   $0x1f
 1bf:	68 04 09 00 00       	push   $0x904
 1c4:	68 0e 09 00 00       	push   $0x90e
 1c9:	6a 01                	push   $0x1
 1cb:	e8 87 04 00 00       	call   657 <printf>
 1d0:	83 c4 0c             	add    $0xc,%esp
 1d3:	68 61 09 00 00       	push   $0x961
 1d8:	68 25 09 00 00       	push   $0x925
 1dd:	6a 01                	push   $0x1
 1df:	e8 73 04 00 00       	call   657 <printf>
 1e4:	83 c4 08             	add    $0x8,%esp
 1e7:	68 39 09 00 00       	push   $0x939
 1ec:	6a 01                	push   $0x1
 1ee:	e8 64 04 00 00       	call   657 <printf>
 1f3:	83 c4 04             	add    $0x4,%esp
 1f6:	ff 35 a0 0d 00 00    	push   0xda0
 1fc:	e8 31 03 00 00       	call   532 <kill>
 201:	e8 fc 02 00 00       	call   502 <exit>
   assert(join_pid == thread_pid);
 206:	6a 22                	push   $0x22
 208:	68 04 09 00 00       	push   $0x904
 20d:	68 0e 09 00 00       	push   $0x90e
 212:	6a 01                	push   $0x1
 214:	e8 3e 04 00 00       	call   657 <printf>
 219:	83 c4 0c             	add    $0xc,%esp
 21c:	68 70 09 00 00       	push   $0x970
 221:	68 25 09 00 00       	push   $0x925
 226:	6a 01                	push   $0x1
 228:	e8 2a 04 00 00       	call   657 <printf>
 22d:	83 c4 08             	add    $0x8,%esp
 230:	68 39 09 00 00       	push   $0x939
 235:	6a 01                	push   $0x1
 237:	e8 1b 04 00 00       	call   657 <printf>
 23c:	83 c4 04             	add    $0x4,%esp
 23f:	ff 35 a0 0d 00 00    	push   0xda0
 245:	e8 e8 02 00 00       	call   532 <kill>
 24a:	e8 b3 02 00 00       	call   502 <exit>
   printf(1, "TEST PASSED\n");
 24f:	83 ec 08             	sub    $0x8,%esp
 252:	68 93 09 00 00       	push   $0x993
 257:	6a 01                	push   $0x1
 259:	e8 f9 03 00 00       	call   657 <printf>
   exit();
 25e:	e8 9f 02 00 00       	call   502 <exit>
=======
 167:	83 3d 7c 0d 00 00 02 	cmpl   $0x2,0xd7c
 16e:	0f 84 db 00 00 00    	je     24f <main+0x13d>
 174:	6a 23                	push   $0x23
 176:	68 f0 08 00 00       	push   $0x8f0
 17b:	68 fa 08 00 00       	push   $0x8fa
 180:	6a 01                	push   $0x1
 182:	e8 b9 04 00 00       	call   640 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 73 09 00 00       	push   $0x973
 18f:	68 11 09 00 00       	push   $0x911
 194:	6a 01                	push   $0x1
 196:	e8 a5 04 00 00       	call   640 <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 25 09 00 00       	push   $0x925
 1a3:	6a 01                	push   $0x1
 1a5:	e8 96 04 00 00       	call   640 <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 80 0d 00 00    	push   0xd80
 1b3:	e8 63 03 00 00       	call   51b <kill>
 1b8:	e8 2e 03 00 00       	call   4eb <exit>
   assert(thread_pid > 0);
 1bd:	6a 1f                	push   $0x1f
 1bf:	68 f0 08 00 00       	push   $0x8f0
 1c4:	68 fa 08 00 00       	push   $0x8fa
 1c9:	6a 01                	push   $0x1
 1cb:	e8 70 04 00 00       	call   640 <printf>
 1d0:	83 c4 0c             	add    $0xc,%esp
 1d3:	68 4d 09 00 00       	push   $0x94d
 1d8:	68 11 09 00 00       	push   $0x911
 1dd:	6a 01                	push   $0x1
 1df:	e8 5c 04 00 00       	call   640 <printf>
 1e4:	83 c4 08             	add    $0x8,%esp
 1e7:	68 25 09 00 00       	push   $0x925
 1ec:	6a 01                	push   $0x1
 1ee:	e8 4d 04 00 00       	call   640 <printf>
 1f3:	83 c4 04             	add    $0x4,%esp
 1f6:	ff 35 80 0d 00 00    	push   0xd80
 1fc:	e8 1a 03 00 00       	call   51b <kill>
 201:	e8 e5 02 00 00       	call   4eb <exit>
   assert(join_pid == thread_pid);
 206:	6a 22                	push   $0x22
 208:	68 f0 08 00 00       	push   $0x8f0
 20d:	68 fa 08 00 00       	push   $0x8fa
 212:	6a 01                	push   $0x1
 214:	e8 27 04 00 00       	call   640 <printf>
 219:	83 c4 0c             	add    $0xc,%esp
 21c:	68 5c 09 00 00       	push   $0x95c
 221:	68 11 09 00 00       	push   $0x911
 226:	6a 01                	push   $0x1
 228:	e8 13 04 00 00       	call   640 <printf>
 22d:	83 c4 08             	add    $0x8,%esp
 230:	68 25 09 00 00       	push   $0x925
 235:	6a 01                	push   $0x1
 237:	e8 04 04 00 00       	call   640 <printf>
 23c:	83 c4 04             	add    $0x4,%esp
 23f:	ff 35 80 0d 00 00    	push   0xd80
 245:	e8 d1 02 00 00       	call   51b <kill>
 24a:	e8 9c 02 00 00       	call   4eb <exit>
   printf(1, "TEST PASSED\n");
 24f:	83 ec 08             	sub    $0x8,%esp
 252:	68 7f 09 00 00       	push   $0x97f
 257:	6a 01                	push   $0x1
 259:	e8 e2 03 00 00       	call   640 <printf>
   exit();
 25e:	e8 88 02 00 00       	call   4eb <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000263 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 269:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 26b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 26e:	89 08                	mov    %ecx,(%eax)
  return old;
}
 270:	89 d0                	mov    %edx,%eax
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    

00000274 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	53                   	push   %ebx
 278:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 27b:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 280:	e8 f8 05 00 00       	call   87d <malloc>
  if(n_stack == 0){
 285:	83 c4 10             	add    $0x10,%esp
 288:	85 c0                	test   %eax,%eax
 28a:	74 41                	je     2cd <thread_create+0x59>
 28c:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 28e:	50                   	push   %eax
 28f:	ff 75 10             	push   0x10(%ebp)
 292:	ff 75 0c             	push   0xc(%ebp)
 295:	ff 75 08             	push   0x8(%ebp)
 298:	e8 05 03 00 00       	call   5a2 <clone>
=======
 280:	e8 e1 05 00 00       	call   866 <malloc>
  if(n_stack == 0){
 285:	83 c4 10             	add    $0x10,%esp
 288:	85 c0                	test   %eax,%eax
 28a:	74 57                	je     2e3 <thread_create+0x6f>
 28c:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 28e:	b8 00 00 00 00       	mov    $0x0,%eax
 293:	eb 03                	jmp    298 <thread_create+0x24>
 295:	83 c0 01             	add    $0x1,%eax
 298:	83 f8 3f             	cmp    $0x3f,%eax
 29b:	7f 2f                	jg     2cc <thread_create+0x58>
    if(threads[i].flag==0){
 29d:	8d 14 40             	lea    (%eax,%eax,2),%edx
 2a0:	83 3c 95 a8 0d 00 00 	cmpl   $0x0,0xda8(,%edx,4)
 2a7:	00 
 2a8:	75 eb                	jne    295 <thread_create+0x21>
      threads[i].maddr = n_stack;
 2aa:	8d 14 00             	lea    (%eax,%eax,1),%edx
 2ad:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 2b0:	c1 e3 02             	shl    $0x2,%ebx
 2b3:	89 8b a0 0d 00 00    	mov    %ecx,0xda0(%ebx)
      threads[i].pg1addr = n_stack;
 2b9:	89 8b a4 0d 00 00    	mov    %ecx,0xda4(%ebx)
      threads[i].flag = 1;
 2bf:	01 c2                	add    %eax,%edx
 2c1:	c7 04 95 a8 0d 00 00 	movl   $0x1,0xda8(,%edx,4)
 2c8:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2cc:	51                   	push   %ecx
 2cd:	ff 75 10             	push   0x10(%ebp)
 2d0:	ff 75 0c             	push   0xc(%ebp)
 2d3:	ff 75 08             	push   0x8(%ebp)
 2d6:	e8 b0 02 00 00       	call   58b <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 29d:	83 c4 10             	add    $0x10,%esp
 2a0:	ba 00 00 00 00       	mov    $0x0,%edx
 2a5:	eb 03                	jmp    2aa <thread_create+0x36>
 2a7:	83 c2 01             	add    $0x1,%edx
 2aa:	83 fa 3f             	cmp    $0x3f,%edx
 2ad:	7f 19                	jg     2c8 <thread_create+0x54>
    if(threads[i]->flag==0){
 2af:	8b 0c 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%ecx
 2b6:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2ba:	75 eb                	jne    2a7 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 2bc:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 2be:	8b 14 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%edx
 2c5:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    
    return -1;
 2cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2d2:	eb f4                	jmp    2c8 <thread_create+0x54>

000002d4 <thread_join>:
=======
 2db:	83 c4 10             	add    $0x10,%esp
}
 2de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e1:	c9                   	leave  
 2e2:	c3                   	ret    
    return -1;
 2e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e8:	eb f4                	jmp    2de <thread_create+0x6a>

000002ea <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	56                   	push   %esi
 2d8:	53                   	push   %ebx
 2d9:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2dc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2df:	50                   	push   %eax
 2e0:	e8 c5 02 00 00       	call   5aa <join>
 2e5:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 2e7:	83 c4 10             	add    $0x10,%esp
 2ea:	bb 00 00 00 00       	mov    $0x0,%ebx
 2ef:	eb 03                	jmp    2f4 <thread_join+0x20>
 2f1:	83 c3 01             	add    $0x1,%ebx
 2f4:	83 fb 3f             	cmp    $0x3f,%ebx
 2f7:	7f 23                	jg     31c <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 2f9:	8b 04 9d c0 0d 00 00 	mov    0xdc0(,%ebx,4),%eax
 300:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 304:	75 eb                	jne    2f1 <thread_join+0x1d>
 306:	8b 55 f4             	mov    -0xc(%ebp),%edx
 309:	39 50 04             	cmp    %edx,0x4(%eax)
 30c:	75 e3                	jne    2f1 <thread_join+0x1d>
      free(stk_addr);
 30e:	83 ec 0c             	sub    $0xc,%esp
 311:	52                   	push   %edx
 312:	e8 a6 04 00 00       	call   7bd <free>
 317:	83 c4 10             	add    $0x10,%esp
 31a:	eb d5                	jmp    2f1 <thread_join+0x1d>
    }
  }
  return pid;
}
 31c:	89 f0                	mov    %esi,%eax
 31e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 321:	5b                   	pop    %ebx
 322:	5e                   	pop    %esi
 323:	5d                   	pop    %ebp
 324:	c3                   	ret    

00000325 <lock_acquire>:

void lock_acquire(lock_t *lock){
 325:	55                   	push   %ebp
 326:	89 e5                	mov    %esp,%ebp
 328:	53                   	push   %ebx
 329:	83 ec 04             	sub    $0x4,%esp
 32c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 32f:	83 ec 08             	sub    $0x8,%esp
 332:	6a 01                	push   $0x1
 334:	53                   	push   %ebx
 335:	e8 29 ff ff ff       	call   263 <test_and_set>
 33a:	83 c4 10             	add    $0x10,%esp
 33d:	83 f8 01             	cmp    $0x1,%eax
 340:	74 ed                	je     32f <lock_acquire+0xa>
    ;
}
 342:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 345:	c9                   	leave  
 346:	c3                   	ret    

00000347 <lock_release>:

void lock_release(lock_t *lock) {
 347:	55                   	push   %ebp
 348:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 34a:	8b 45 08             	mov    0x8(%ebp),%eax
 34d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 353:	5d                   	pop    %ebp
 354:	c3                   	ret    

00000355 <lock_init>:

void lock_init(lock_t *lock) {
 355:	55                   	push   %ebp
 356:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 358:	8b 45 08             	mov    0x8(%ebp),%eax
 35b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    

00000363 <strcpy>:
=======
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
 2ed:	53                   	push   %ebx
 2ee:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2f1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2f4:	50                   	push   %eax
 2f5:	e8 99 02 00 00       	call   593 <join>
 2fa:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 2fc:	83 c4 04             	add    $0x4,%esp
 2ff:	ff 75 f4             	push   -0xc(%ebp)
 302:	e8 9f 04 00 00       	call   7a6 <free>
  return pid;
}
 307:	89 d8                	mov    %ebx,%eax
 309:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 30c:	c9                   	leave  
 30d:	c3                   	ret    

0000030e <lock_acquire>:

void lock_acquire(lock_t *lock){
 30e:	55                   	push   %ebp
 30f:	89 e5                	mov    %esp,%ebp
 311:	53                   	push   %ebx
 312:	83 ec 04             	sub    $0x4,%esp
 315:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 318:	83 ec 08             	sub    $0x8,%esp
 31b:	6a 01                	push   $0x1
 31d:	53                   	push   %ebx
 31e:	e8 40 ff ff ff       	call   263 <test_and_set>
 323:	83 c4 10             	add    $0x10,%esp
 326:	83 f8 01             	cmp    $0x1,%eax
 329:	74 ed                	je     318 <lock_acquire+0xa>
    ;
}
 32b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 32e:	c9                   	leave  
 32f:	c3                   	ret    

00000330 <lock_release>:

void lock_release(lock_t *lock) {
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 33c:	5d                   	pop    %ebp
 33d:	c3                   	ret    

0000033e <lock_init>:

void lock_init(lock_t *lock) {
 33e:	55                   	push   %ebp
 33f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 341:	8b 45 08             	mov    0x8(%ebp),%eax
 344:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 34a:	5d                   	pop    %ebp
 34b:	c3                   	ret    

0000034c <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	56                   	push   %esi
 367:	53                   	push   %ebx
 368:	8b 75 08             	mov    0x8(%ebp),%esi
 36b:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 34c:	55                   	push   %ebp
 34d:	89 e5                	mov    %esp,%ebp
 34f:	56                   	push   %esi
 350:	53                   	push   %ebx
 351:	8b 75 08             	mov    0x8(%ebp),%esi
 354:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 36e:	89 f0                	mov    %esi,%eax
 370:	89 d1                	mov    %edx,%ecx
 372:	83 c2 01             	add    $0x1,%edx
 375:	89 c3                	mov    %eax,%ebx
 377:	83 c0 01             	add    $0x1,%eax
 37a:	0f b6 09             	movzbl (%ecx),%ecx
 37d:	88 0b                	mov    %cl,(%ebx)
 37f:	84 c9                	test   %cl,%cl
 381:	75 ed                	jne    370 <strcpy+0xd>
    ;
  return os;
}
 383:	89 f0                	mov    %esi,%eax
 385:	5b                   	pop    %ebx
 386:	5e                   	pop    %esi
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <strcmp>:
=======
 357:	89 f0                	mov    %esi,%eax
 359:	89 d1                	mov    %edx,%ecx
 35b:	83 c2 01             	add    $0x1,%edx
 35e:	89 c3                	mov    %eax,%ebx
 360:	83 c0 01             	add    $0x1,%eax
 363:	0f b6 09             	movzbl (%ecx),%ecx
 366:	88 0b                	mov    %cl,(%ebx)
 368:	84 c9                	test   %cl,%cl
 36a:	75 ed                	jne    359 <strcpy+0xd>
    ;
  return os;
}
 36c:	89 f0                	mov    %esi,%eax
 36e:	5b                   	pop    %ebx
 36f:	5e                   	pop    %esi
 370:	5d                   	pop    %ebp
 371:	c3                   	ret    

00000372 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 38f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 392:	eb 06                	jmp    39a <strcmp+0x11>
    p++, q++;
 394:	83 c1 01             	add    $0x1,%ecx
 397:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 39a:	0f b6 01             	movzbl (%ecx),%eax
 39d:	84 c0                	test   %al,%al
 39f:	74 04                	je     3a5 <strcmp+0x1c>
 3a1:	3a 02                	cmp    (%edx),%al
 3a3:	74 ef                	je     394 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3a5:	0f b6 c0             	movzbl %al,%eax
 3a8:	0f b6 12             	movzbl (%edx),%edx
 3ab:	29 d0                	sub    %edx,%eax
}
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    

000003af <strlen>:
=======
 372:	55                   	push   %ebp
 373:	89 e5                	mov    %esp,%ebp
 375:	8b 4d 08             	mov    0x8(%ebp),%ecx
 378:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 37b:	eb 06                	jmp    383 <strcmp+0x11>
    p++, q++;
 37d:	83 c1 01             	add    $0x1,%ecx
 380:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 383:	0f b6 01             	movzbl (%ecx),%eax
 386:	84 c0                	test   %al,%al
 388:	74 04                	je     38e <strcmp+0x1c>
 38a:	3a 02                	cmp    (%edx),%al
 38c:	74 ef                	je     37d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 38e:	0f b6 c0             	movzbl %al,%eax
 391:	0f b6 12             	movzbl (%edx),%edx
 394:	29 d0                	sub    %edx,%eax
}
 396:	5d                   	pop    %ebp
 397:	c3                   	ret    

00000398 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3b5:	b8 00 00 00 00       	mov    $0x0,%eax
 3ba:	eb 03                	jmp    3bf <strlen+0x10>
 3bc:	83 c0 01             	add    $0x1,%eax
 3bf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3c3:	75 f7                	jne    3bc <strlen+0xd>
    ;
  return n;
}
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    

000003c7 <memset>:
=======
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 39e:	b8 00 00 00 00       	mov    $0x0,%eax
 3a3:	eb 03                	jmp    3a8 <strlen+0x10>
 3a5:	83 c0 01             	add    $0x1,%eax
 3a8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3ac:	75 f7                	jne    3a5 <strlen+0xd>
    ;
  return n;
}
 3ae:	5d                   	pop    %ebp
 3af:	c3                   	ret    

000003b0 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	57                   	push   %edi
 3cb:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 3ce:	89 d7                	mov    %edx,%edi
 3d0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d6:	fc                   	cld    
 3d7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3d9:	89 d0                	mov    %edx,%eax
 3db:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3de:	c9                   	leave  
 3df:	c3                   	ret    

000003e0 <strchr>:
=======
 3b7:	89 d7                	mov    %edx,%edi
 3b9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bf:	fc                   	cld    
 3c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3c2:	89 d0                	mov    %edx,%eax
 3c4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3c7:	c9                   	leave  
 3c8:	c3                   	ret    

000003c9 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3ea:	eb 03                	jmp    3ef <strchr+0xf>
 3ec:	83 c0 01             	add    $0x1,%eax
 3ef:	0f b6 10             	movzbl (%eax),%edx
 3f2:	84 d2                	test   %dl,%dl
 3f4:	74 06                	je     3fc <strchr+0x1c>
    if(*s == c)
 3f6:	38 ca                	cmp    %cl,%dl
 3f8:	75 f2                	jne    3ec <strchr+0xc>
 3fa:	eb 05                	jmp    401 <strchr+0x21>
      return (char*)s;
  return 0;
 3fc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 401:	5d                   	pop    %ebp
 402:	c3                   	ret    

00000403 <gets>:
=======
 3c9:	55                   	push   %ebp
 3ca:	89 e5                	mov    %esp,%ebp
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3d3:	eb 03                	jmp    3d8 <strchr+0xf>
 3d5:	83 c0 01             	add    $0x1,%eax
 3d8:	0f b6 10             	movzbl (%eax),%edx
 3db:	84 d2                	test   %dl,%dl
 3dd:	74 06                	je     3e5 <strchr+0x1c>
    if(*s == c)
 3df:	38 ca                	cmp    %cl,%dl
 3e1:	75 f2                	jne    3d5 <strchr+0xc>
 3e3:	eb 05                	jmp    3ea <strchr+0x21>
      return (char*)s;
  return 0;
 3e5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    

000003ec <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 403:	55                   	push   %ebp
 404:	89 e5                	mov    %esp,%ebp
 406:	57                   	push   %edi
 407:	56                   	push   %esi
 408:	53                   	push   %ebx
 409:	83 ec 1c             	sub    $0x1c,%esp
 40c:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	57                   	push   %edi
 3f0:	56                   	push   %esi
 3f1:	53                   	push   %ebx
 3f2:	83 ec 1c             	sub    $0x1c,%esp
 3f5:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 40f:	bb 00 00 00 00       	mov    $0x0,%ebx
 414:	89 de                	mov    %ebx,%esi
 416:	83 c3 01             	add    $0x1,%ebx
 419:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 41c:	7d 2e                	jge    44c <gets+0x49>
    cc = read(0, &c, 1);
 41e:	83 ec 04             	sub    $0x4,%esp
 421:	6a 01                	push   $0x1
 423:	8d 45 e7             	lea    -0x19(%ebp),%eax
 426:	50                   	push   %eax
 427:	6a 00                	push   $0x0
 429:	e8 ec 00 00 00       	call   51a <read>
    if(cc < 1)
 42e:	83 c4 10             	add    $0x10,%esp
 431:	85 c0                	test   %eax,%eax
 433:	7e 17                	jle    44c <gets+0x49>
      break;
    buf[i++] = c;
 435:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 439:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 43c:	3c 0a                	cmp    $0xa,%al
 43e:	0f 94 c2             	sete   %dl
 441:	3c 0d                	cmp    $0xd,%al
 443:	0f 94 c0             	sete   %al
 446:	08 c2                	or     %al,%dl
 448:	74 ca                	je     414 <gets+0x11>
    buf[i++] = c;
 44a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 44c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 450:	89 f8                	mov    %edi,%eax
 452:	8d 65 f4             	lea    -0xc(%ebp),%esp
 455:	5b                   	pop    %ebx
 456:	5e                   	pop    %esi
 457:	5f                   	pop    %edi
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <stat>:
=======
 3f8:	bb 00 00 00 00       	mov    $0x0,%ebx
 3fd:	89 de                	mov    %ebx,%esi
 3ff:	83 c3 01             	add    $0x1,%ebx
 402:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 405:	7d 2e                	jge    435 <gets+0x49>
    cc = read(0, &c, 1);
 407:	83 ec 04             	sub    $0x4,%esp
 40a:	6a 01                	push   $0x1
 40c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 40f:	50                   	push   %eax
 410:	6a 00                	push   $0x0
 412:	e8 ec 00 00 00       	call   503 <read>
    if(cc < 1)
 417:	83 c4 10             	add    $0x10,%esp
 41a:	85 c0                	test   %eax,%eax
 41c:	7e 17                	jle    435 <gets+0x49>
      break;
    buf[i++] = c;
 41e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 422:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 425:	3c 0a                	cmp    $0xa,%al
 427:	0f 94 c2             	sete   %dl
 42a:	3c 0d                	cmp    $0xd,%al
 42c:	0f 94 c0             	sete   %al
 42f:	08 c2                	or     %al,%dl
 431:	74 ca                	je     3fd <gets+0x11>
    buf[i++] = c;
 433:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 435:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 439:	89 f8                	mov    %edi,%eax
 43b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43e:	5b                   	pop    %ebx
 43f:	5e                   	pop    %esi
 440:	5f                   	pop    %edi
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    

00000443 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	56                   	push   %esi
 45e:	53                   	push   %ebx
=======
 443:	55                   	push   %ebp
 444:	89 e5                	mov    %esp,%ebp
 446:	56                   	push   %esi
 447:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 45f:	83 ec 08             	sub    $0x8,%esp
 462:	6a 00                	push   $0x0
 464:	ff 75 08             	push   0x8(%ebp)
 467:	e8 d6 00 00 00       	call   542 <open>
  if(fd < 0)
 46c:	83 c4 10             	add    $0x10,%esp
 46f:	85 c0                	test   %eax,%eax
 471:	78 24                	js     497 <stat+0x3d>
 473:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 475:	83 ec 08             	sub    $0x8,%esp
 478:	ff 75 0c             	push   0xc(%ebp)
 47b:	50                   	push   %eax
 47c:	e8 d9 00 00 00       	call   55a <fstat>
 481:	89 c6                	mov    %eax,%esi
  close(fd);
 483:	89 1c 24             	mov    %ebx,(%esp)
 486:	e8 9f 00 00 00       	call   52a <close>
  return r;
 48b:	83 c4 10             	add    $0x10,%esp
}
 48e:	89 f0                	mov    %esi,%eax
 490:	8d 65 f8             	lea    -0x8(%ebp),%esp
 493:	5b                   	pop    %ebx
 494:	5e                   	pop    %esi
 495:	5d                   	pop    %ebp
 496:	c3                   	ret    
    return -1;
 497:	be ff ff ff ff       	mov    $0xffffffff,%esi
 49c:	eb f0                	jmp    48e <stat+0x34>

0000049e <atoi>:
=======
 448:	83 ec 08             	sub    $0x8,%esp
 44b:	6a 00                	push   $0x0
 44d:	ff 75 08             	push   0x8(%ebp)
 450:	e8 d6 00 00 00       	call   52b <open>
  if(fd < 0)
 455:	83 c4 10             	add    $0x10,%esp
 458:	85 c0                	test   %eax,%eax
 45a:	78 24                	js     480 <stat+0x3d>
 45c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 45e:	83 ec 08             	sub    $0x8,%esp
 461:	ff 75 0c             	push   0xc(%ebp)
 464:	50                   	push   %eax
 465:	e8 d9 00 00 00       	call   543 <fstat>
 46a:	89 c6                	mov    %eax,%esi
  close(fd);
 46c:	89 1c 24             	mov    %ebx,(%esp)
 46f:	e8 9f 00 00 00       	call   513 <close>
  return r;
 474:	83 c4 10             	add    $0x10,%esp
}
 477:	89 f0                	mov    %esi,%eax
 479:	8d 65 f8             	lea    -0x8(%ebp),%esp
 47c:	5b                   	pop    %ebx
 47d:	5e                   	pop    %esi
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    
    return -1;
 480:	be ff ff ff ff       	mov    $0xffffffff,%esi
 485:	eb f0                	jmp    477 <stat+0x34>

00000487 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 49e:	55                   	push   %ebp
 49f:	89 e5                	mov    %esp,%ebp
 4a1:	53                   	push   %ebx
 4a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4a5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4aa:	eb 10                	jmp    4bc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4ac:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4af:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4b2:	83 c1 01             	add    $0x1,%ecx
 4b5:	0f be c0             	movsbl %al,%eax
 4b8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4bc:	0f b6 01             	movzbl (%ecx),%eax
 4bf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4c2:	80 fb 09             	cmp    $0x9,%bl
 4c5:	76 e5                	jbe    4ac <atoi+0xe>
  return n;
}
 4c7:	89 d0                	mov    %edx,%eax
 4c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4cc:	c9                   	leave  
 4cd:	c3                   	ret    

000004ce <memmove>:
=======
 487:	55                   	push   %ebp
 488:	89 e5                	mov    %esp,%ebp
 48a:	53                   	push   %ebx
 48b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 48e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 493:	eb 10                	jmp    4a5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 495:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 498:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 49b:	83 c1 01             	add    $0x1,%ecx
 49e:	0f be c0             	movsbl %al,%eax
 4a1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4a5:	0f b6 01             	movzbl (%ecx),%eax
 4a8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4ab:	80 fb 09             	cmp    $0x9,%bl
 4ae:	76 e5                	jbe    495 <atoi+0xe>
  return n;
}
 4b0:	89 d0                	mov    %edx,%eax
 4b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4b5:	c9                   	leave  
 4b6:	c3                   	ret    

000004b7 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	56                   	push   %esi
 4d2:	53                   	push   %ebx
 4d3:	8b 75 08             	mov    0x8(%ebp),%esi
 4d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4d9:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 4b7:	55                   	push   %ebp
 4b8:	89 e5                	mov    %esp,%ebp
 4ba:	56                   	push   %esi
 4bb:	53                   	push   %ebx
 4bc:	8b 75 08             	mov    0x8(%ebp),%esi
 4bf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4c2:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 4dc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4de:	eb 0d                	jmp    4ed <memmove+0x1f>
    *dst++ = *src++;
 4e0:	0f b6 01             	movzbl (%ecx),%eax
 4e3:	88 02                	mov    %al,(%edx)
 4e5:	8d 49 01             	lea    0x1(%ecx),%ecx
 4e8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4eb:	89 d8                	mov    %ebx,%eax
 4ed:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4f0:	85 c0                	test   %eax,%eax
 4f2:	7f ec                	jg     4e0 <memmove+0x12>
  return vdst;
}
 4f4:	89 f0                	mov    %esi,%eax
 4f6:	5b                   	pop    %ebx
 4f7:	5e                   	pop    %esi
 4f8:	5d                   	pop    %ebp
 4f9:	c3                   	ret    

000004fa <fork>:
=======
 4c5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4c7:	eb 0d                	jmp    4d6 <memmove+0x1f>
    *dst++ = *src++;
 4c9:	0f b6 01             	movzbl (%ecx),%eax
 4cc:	88 02                	mov    %al,(%edx)
 4ce:	8d 49 01             	lea    0x1(%ecx),%ecx
 4d1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4d4:	89 d8                	mov    %ebx,%eax
 4d6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4d9:	85 c0                	test   %eax,%eax
 4db:	7f ec                	jg     4c9 <memmove+0x12>
  return vdst;
}
 4dd:	89 f0                	mov    %esi,%eax
 4df:	5b                   	pop    %ebx
 4e0:	5e                   	pop    %esi
 4e1:	5d                   	pop    %ebp
 4e2:	c3                   	ret    

000004e3 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 4fa:	b8 01 00 00 00       	mov    $0x1,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <exit>:
SYSCALL(exit)
 502:	b8 02 00 00 00       	mov    $0x2,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <wait>:
SYSCALL(wait)
 50a:	b8 03 00 00 00       	mov    $0x3,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <pipe>:
SYSCALL(pipe)
 512:	b8 04 00 00 00       	mov    $0x4,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <read>:
SYSCALL(read)
 51a:	b8 05 00 00 00       	mov    $0x5,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <write>:
SYSCALL(write)
 522:	b8 10 00 00 00       	mov    $0x10,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <close>:
SYSCALL(close)
 52a:	b8 15 00 00 00       	mov    $0x15,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <kill>:
SYSCALL(kill)
 532:	b8 06 00 00 00       	mov    $0x6,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <exec>:
SYSCALL(exec)
 53a:	b8 07 00 00 00       	mov    $0x7,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <open>:
SYSCALL(open)
 542:	b8 0f 00 00 00       	mov    $0xf,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <mknod>:
SYSCALL(mknod)
 54a:	b8 11 00 00 00       	mov    $0x11,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <unlink>:
SYSCALL(unlink)
 552:	b8 12 00 00 00       	mov    $0x12,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <fstat>:
SYSCALL(fstat)
 55a:	b8 08 00 00 00       	mov    $0x8,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <link>:
SYSCALL(link)
 562:	b8 13 00 00 00       	mov    $0x13,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <mkdir>:
SYSCALL(mkdir)
 56a:	b8 14 00 00 00       	mov    $0x14,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <chdir>:
SYSCALL(chdir)
 572:	b8 09 00 00 00       	mov    $0x9,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <dup>:
SYSCALL(dup)
 57a:	b8 0a 00 00 00       	mov    $0xa,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <getpid>:
SYSCALL(getpid)
 582:	b8 0b 00 00 00       	mov    $0xb,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <sbrk>:
SYSCALL(sbrk)
 58a:	b8 0c 00 00 00       	mov    $0xc,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <sleep>:
SYSCALL(sleep)
 592:	b8 0d 00 00 00       	mov    $0xd,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <uptime>:
SYSCALL(uptime)
 59a:	b8 0e 00 00 00       	mov    $0xe,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <clone>:
SYSCALL(clone)
 5a2:	b8 16 00 00 00       	mov    $0x16,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <join>:
 5aa:	b8 17 00 00 00       	mov    $0x17,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <putc>:
=======
 4e3:	b8 01 00 00 00       	mov    $0x1,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <exit>:
SYSCALL(exit)
 4eb:	b8 02 00 00 00       	mov    $0x2,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <wait>:
SYSCALL(wait)
 4f3:	b8 03 00 00 00       	mov    $0x3,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <pipe>:
SYSCALL(pipe)
 4fb:	b8 04 00 00 00       	mov    $0x4,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <read>:
SYSCALL(read)
 503:	b8 05 00 00 00       	mov    $0x5,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <write>:
SYSCALL(write)
 50b:	b8 10 00 00 00       	mov    $0x10,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <close>:
SYSCALL(close)
 513:	b8 15 00 00 00       	mov    $0x15,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <kill>:
SYSCALL(kill)
 51b:	b8 06 00 00 00       	mov    $0x6,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <exec>:
SYSCALL(exec)
 523:	b8 07 00 00 00       	mov    $0x7,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <open>:
SYSCALL(open)
 52b:	b8 0f 00 00 00       	mov    $0xf,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <mknod>:
SYSCALL(mknod)
 533:	b8 11 00 00 00       	mov    $0x11,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <unlink>:
SYSCALL(unlink)
 53b:	b8 12 00 00 00       	mov    $0x12,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <fstat>:
SYSCALL(fstat)
 543:	b8 08 00 00 00       	mov    $0x8,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <link>:
SYSCALL(link)
 54b:	b8 13 00 00 00       	mov    $0x13,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <mkdir>:
SYSCALL(mkdir)
 553:	b8 14 00 00 00       	mov    $0x14,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <chdir>:
SYSCALL(chdir)
 55b:	b8 09 00 00 00       	mov    $0x9,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <dup>:
SYSCALL(dup)
 563:	b8 0a 00 00 00       	mov    $0xa,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <getpid>:
SYSCALL(getpid)
 56b:	b8 0b 00 00 00       	mov    $0xb,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <sbrk>:
SYSCALL(sbrk)
 573:	b8 0c 00 00 00       	mov    $0xc,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <sleep>:
SYSCALL(sleep)
 57b:	b8 0d 00 00 00       	mov    $0xd,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <uptime>:
SYSCALL(uptime)
 583:	b8 0e 00 00 00       	mov    $0xe,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <clone>:
SYSCALL(clone)
 58b:	b8 16 00 00 00       	mov    $0x16,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <join>:
 593:	b8 17 00 00 00       	mov    $0x17,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 5b2:	55                   	push   %ebp
 5b3:	89 e5                	mov    %esp,%ebp
 5b5:	83 ec 1c             	sub    $0x1c,%esp
 5b8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5bb:	6a 01                	push   $0x1
 5bd:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5c0:	52                   	push   %edx
 5c1:	50                   	push   %eax
 5c2:	e8 5b ff ff ff       	call   522 <write>
}
 5c7:	83 c4 10             	add    $0x10,%esp
 5ca:	c9                   	leave  
 5cb:	c3                   	ret    

000005cc <printint>:
=======
 59b:	55                   	push   %ebp
 59c:	89 e5                	mov    %esp,%ebp
 59e:	83 ec 1c             	sub    $0x1c,%esp
 5a1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5a4:	6a 01                	push   $0x1
 5a6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5a9:	52                   	push   %edx
 5aa:	50                   	push   %eax
 5ab:	e8 5b ff ff ff       	call   50b <write>
}
 5b0:	83 c4 10             	add    $0x10,%esp
 5b3:	c9                   	leave  
 5b4:	c3                   	ret    

000005b5 <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 5cc:	55                   	push   %ebp
 5cd:	89 e5                	mov    %esp,%ebp
 5cf:	57                   	push   %edi
 5d0:	56                   	push   %esi
 5d1:	53                   	push   %ebx
 5d2:	83 ec 2c             	sub    $0x2c,%esp
 5d5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d8:	89 d0                	mov    %edx,%eax
 5da:	89 ce                	mov    %ecx,%esi
=======
 5b5:	55                   	push   %ebp
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	57                   	push   %edi
 5b9:	56                   	push   %esi
 5ba:	53                   	push   %ebx
 5bb:	83 ec 2c             	sub    $0x2c,%esp
 5be:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c1:	89 d0                	mov    %edx,%eax
 5c3:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 5dc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5e0:	0f 95 c1             	setne  %cl
 5e3:	c1 ea 1f             	shr    $0x1f,%edx
 5e6:	84 d1                	test   %dl,%cl
 5e8:	74 44                	je     62e <printint+0x62>
    neg = 1;
    x = -xx;
 5ea:	f7 d8                	neg    %eax
 5ec:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5ee:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 5c5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5c9:	0f 95 c1             	setne  %cl
 5cc:	c1 ea 1f             	shr    $0x1f,%edx
 5cf:	84 d1                	test   %dl,%cl
 5d1:	74 44                	je     617 <printint+0x62>
    neg = 1;
    x = -xx;
 5d3:	f7 d8                	neg    %eax
 5d5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5d7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 5f5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5fa:	89 c8                	mov    %ecx,%eax
 5fc:	ba 00 00 00 00       	mov    $0x0,%edx
 601:	f7 f6                	div    %esi
 603:	89 df                	mov    %ebx,%edi
 605:	83 c3 01             	add    $0x1,%ebx
 608:	0f b6 92 00 0a 00 00 	movzbl 0xa00(%edx),%edx
 60f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 613:	89 ca                	mov    %ecx,%edx
 615:	89 c1                	mov    %eax,%ecx
 617:	39 d6                	cmp    %edx,%esi
 619:	76 df                	jbe    5fa <printint+0x2e>
  if(neg)
 61b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 61f:	74 31                	je     652 <printint+0x86>
    buf[i++] = '-';
 621:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 626:	8d 5f 02             	lea    0x2(%edi),%ebx
 629:	8b 75 d0             	mov    -0x30(%ebp),%esi
 62c:	eb 17                	jmp    645 <printint+0x79>
    x = xx;
 62e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 630:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 637:	eb bc                	jmp    5f5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 639:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 63e:	89 f0                	mov    %esi,%eax
 640:	e8 6d ff ff ff       	call   5b2 <putc>
  while(--i >= 0)
 645:	83 eb 01             	sub    $0x1,%ebx
 648:	79 ef                	jns    639 <printint+0x6d>
}
 64a:	83 c4 2c             	add    $0x2c,%esp
 64d:	5b                   	pop    %ebx
 64e:	5e                   	pop    %esi
 64f:	5f                   	pop    %edi
 650:	5d                   	pop    %ebp
 651:	c3                   	ret    
 652:	8b 75 d0             	mov    -0x30(%ebp),%esi
 655:	eb ee                	jmp    645 <printint+0x79>

00000657 <printf>:
=======
 5de:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5e3:	89 c8                	mov    %ecx,%eax
 5e5:	ba 00 00 00 00       	mov    $0x0,%edx
 5ea:	f7 f6                	div    %esi
 5ec:	89 df                	mov    %ebx,%edi
 5ee:	83 c3 01             	add    $0x1,%ebx
 5f1:	0f b6 92 ec 09 00 00 	movzbl 0x9ec(%edx),%edx
 5f8:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5fc:	89 ca                	mov    %ecx,%edx
 5fe:	89 c1                	mov    %eax,%ecx
 600:	39 d6                	cmp    %edx,%esi
 602:	76 df                	jbe    5e3 <printint+0x2e>
  if(neg)
 604:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 608:	74 31                	je     63b <printint+0x86>
    buf[i++] = '-';
 60a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 60f:	8d 5f 02             	lea    0x2(%edi),%ebx
 612:	8b 75 d0             	mov    -0x30(%ebp),%esi
 615:	eb 17                	jmp    62e <printint+0x79>
    x = xx;
 617:	89 c1                	mov    %eax,%ecx
  neg = 0;
 619:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 620:	eb bc                	jmp    5de <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 622:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 627:	89 f0                	mov    %esi,%eax
 629:	e8 6d ff ff ff       	call   59b <putc>
  while(--i >= 0)
 62e:	83 eb 01             	sub    $0x1,%ebx
 631:	79 ef                	jns    622 <printint+0x6d>
}
 633:	83 c4 2c             	add    $0x2c,%esp
 636:	5b                   	pop    %ebx
 637:	5e                   	pop    %esi
 638:	5f                   	pop    %edi
 639:	5d                   	pop    %ebp
 63a:	c3                   	ret    
 63b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 63e:	eb ee                	jmp    62e <printint+0x79>

00000640 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 657:	55                   	push   %ebp
 658:	89 e5                	mov    %esp,%ebp
 65a:	57                   	push   %edi
 65b:	56                   	push   %esi
 65c:	53                   	push   %ebx
 65d:	83 ec 1c             	sub    $0x1c,%esp
=======
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 660:	8d 45 10             	lea    0x10(%ebp),%eax
 663:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 666:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 66b:	bb 00 00 00 00       	mov    $0x0,%ebx
 670:	eb 14                	jmp    686 <printf+0x2f>
=======
 649:	8d 45 10             	lea    0x10(%ebp),%eax
 64c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 64f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 654:	bb 00 00 00 00       	mov    $0x0,%ebx
 659:	eb 14                	jmp    66f <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 672:	89 fa                	mov    %edi,%edx
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	e8 36 ff ff ff       	call   5b2 <putc>
 67c:	eb 05                	jmp    683 <printf+0x2c>
      }
    } else if(state == '%'){
 67e:	83 fe 25             	cmp    $0x25,%esi
 681:	74 25                	je     6a8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 683:	83 c3 01             	add    $0x1,%ebx
 686:	8b 45 0c             	mov    0xc(%ebp),%eax
 689:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 68d:	84 c0                	test   %al,%al
 68f:	0f 84 20 01 00 00    	je     7b5 <printf+0x15e>
    c = fmt[i] & 0xff;
 695:	0f be f8             	movsbl %al,%edi
 698:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 69b:	85 f6                	test   %esi,%esi
 69d:	75 df                	jne    67e <printf+0x27>
      if(c == '%'){
 69f:	83 f8 25             	cmp    $0x25,%eax
 6a2:	75 ce                	jne    672 <printf+0x1b>
        state = '%';
 6a4:	89 c6                	mov    %eax,%esi
 6a6:	eb db                	jmp    683 <printf+0x2c>
      if(c == 'd'){
 6a8:	83 f8 25             	cmp    $0x25,%eax
 6ab:	0f 84 cf 00 00 00    	je     780 <printf+0x129>
 6b1:	0f 8c dd 00 00 00    	jl     794 <printf+0x13d>
 6b7:	83 f8 78             	cmp    $0x78,%eax
 6ba:	0f 8f d4 00 00 00    	jg     794 <printf+0x13d>
 6c0:	83 f8 63             	cmp    $0x63,%eax
 6c3:	0f 8c cb 00 00 00    	jl     794 <printf+0x13d>
 6c9:	83 e8 63             	sub    $0x63,%eax
 6cc:	83 f8 15             	cmp    $0x15,%eax
 6cf:	0f 87 bf 00 00 00    	ja     794 <printf+0x13d>
 6d5:	ff 24 85 a8 09 00 00 	jmp    *0x9a8(,%eax,4)
        printint(fd, *ap, 10, 1);
 6dc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6df:	8b 17                	mov    (%edi),%edx
 6e1:	83 ec 0c             	sub    $0xc,%esp
 6e4:	6a 01                	push   $0x1
 6e6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6eb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ee:	e8 d9 fe ff ff       	call   5cc <printint>
        ap++;
 6f3:	83 c7 04             	add    $0x4,%edi
 6f6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f9:	83 c4 10             	add    $0x10,%esp
=======
 65b:	89 fa                	mov    %edi,%edx
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
 660:	e8 36 ff ff ff       	call   59b <putc>
 665:	eb 05                	jmp    66c <printf+0x2c>
      }
    } else if(state == '%'){
 667:	83 fe 25             	cmp    $0x25,%esi
 66a:	74 25                	je     691 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 66c:	83 c3 01             	add    $0x1,%ebx
 66f:	8b 45 0c             	mov    0xc(%ebp),%eax
 672:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 676:	84 c0                	test   %al,%al
 678:	0f 84 20 01 00 00    	je     79e <printf+0x15e>
    c = fmt[i] & 0xff;
 67e:	0f be f8             	movsbl %al,%edi
 681:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 684:	85 f6                	test   %esi,%esi
 686:	75 df                	jne    667 <printf+0x27>
      if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	75 ce                	jne    65b <printf+0x1b>
        state = '%';
 68d:	89 c6                	mov    %eax,%esi
 68f:	eb db                	jmp    66c <printf+0x2c>
      if(c == 'd'){
 691:	83 f8 25             	cmp    $0x25,%eax
 694:	0f 84 cf 00 00 00    	je     769 <printf+0x129>
 69a:	0f 8c dd 00 00 00    	jl     77d <printf+0x13d>
 6a0:	83 f8 78             	cmp    $0x78,%eax
 6a3:	0f 8f d4 00 00 00    	jg     77d <printf+0x13d>
 6a9:	83 f8 63             	cmp    $0x63,%eax
 6ac:	0f 8c cb 00 00 00    	jl     77d <printf+0x13d>
 6b2:	83 e8 63             	sub    $0x63,%eax
 6b5:	83 f8 15             	cmp    $0x15,%eax
 6b8:	0f 87 bf 00 00 00    	ja     77d <printf+0x13d>
 6be:	ff 24 85 94 09 00 00 	jmp    *0x994(,%eax,4)
        printint(fd, *ap, 10, 1);
 6c5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c8:	8b 17                	mov    (%edi),%edx
 6ca:	83 ec 0c             	sub    $0xc,%esp
 6cd:	6a 01                	push   $0x1
 6cf:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d4:	8b 45 08             	mov    0x8(%ebp),%eax
 6d7:	e8 d9 fe ff ff       	call   5b5 <printint>
        ap++;
 6dc:	83 c7 04             	add    $0x4,%edi
 6df:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6e2:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 6fc:	be 00 00 00 00       	mov    $0x0,%esi
 701:	eb 80                	jmp    683 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 703:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 706:	8b 17                	mov    (%edi),%edx
 708:	83 ec 0c             	sub    $0xc,%esp
 70b:	6a 00                	push   $0x0
 70d:	b9 10 00 00 00       	mov    $0x10,%ecx
 712:	8b 45 08             	mov    0x8(%ebp),%eax
 715:	e8 b2 fe ff ff       	call   5cc <printint>
        ap++;
 71a:	83 c7 04             	add    $0x4,%edi
 71d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 720:	83 c4 10             	add    $0x10,%esp
      state = 0;
 723:	be 00 00 00 00       	mov    $0x0,%esi
 728:	e9 56 ff ff ff       	jmp    683 <printf+0x2c>
        s = (char*)*ap;
 72d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 730:	8b 30                	mov    (%eax),%esi
        ap++;
 732:	83 c0 04             	add    $0x4,%eax
 735:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 738:	85 f6                	test   %esi,%esi
 73a:	75 15                	jne    751 <printf+0xfa>
          s = "(null)";
 73c:	be a0 09 00 00       	mov    $0x9a0,%esi
 741:	eb 0e                	jmp    751 <printf+0xfa>
          putc(fd, *s);
 743:	0f be d2             	movsbl %dl,%edx
 746:	8b 45 08             	mov    0x8(%ebp),%eax
 749:	e8 64 fe ff ff       	call   5b2 <putc>
          s++;
 74e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 751:	0f b6 16             	movzbl (%esi),%edx
 754:	84 d2                	test   %dl,%dl
 756:	75 eb                	jne    743 <printf+0xec>
      state = 0;
 758:	be 00 00 00 00       	mov    $0x0,%esi
 75d:	e9 21 ff ff ff       	jmp    683 <printf+0x2c>
        putc(fd, *ap);
 762:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 765:	0f be 17             	movsbl (%edi),%edx
 768:	8b 45 08             	mov    0x8(%ebp),%eax
 76b:	e8 42 fe ff ff       	call   5b2 <putc>
        ap++;
 770:	83 c7 04             	add    $0x4,%edi
 773:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 776:	be 00 00 00 00       	mov    $0x0,%esi
 77b:	e9 03 ff ff ff       	jmp    683 <printf+0x2c>
        putc(fd, c);
 780:	89 fa                	mov    %edi,%edx
 782:	8b 45 08             	mov    0x8(%ebp),%eax
 785:	e8 28 fe ff ff       	call   5b2 <putc>
      state = 0;
 78a:	be 00 00 00 00       	mov    $0x0,%esi
 78f:	e9 ef fe ff ff       	jmp    683 <printf+0x2c>
        putc(fd, '%');
 794:	ba 25 00 00 00       	mov    $0x25,%edx
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	e8 11 fe ff ff       	call   5b2 <putc>
        putc(fd, c);
 7a1:	89 fa                	mov    %edi,%edx
 7a3:	8b 45 08             	mov    0x8(%ebp),%eax
 7a6:	e8 07 fe ff ff       	call   5b2 <putc>
      state = 0;
 7ab:	be 00 00 00 00       	mov    $0x0,%esi
 7b0:	e9 ce fe ff ff       	jmp    683 <printf+0x2c>
    }
  }
}
 7b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b8:	5b                   	pop    %ebx
 7b9:	5e                   	pop    %esi
 7ba:	5f                   	pop    %edi
 7bb:	5d                   	pop    %ebp
 7bc:	c3                   	ret    

000007bd <free>:
=======
 6e5:	be 00 00 00 00       	mov    $0x0,%esi
 6ea:	eb 80                	jmp    66c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6ec:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ef:	8b 17                	mov    (%edi),%edx
 6f1:	83 ec 0c             	sub    $0xc,%esp
 6f4:	6a 00                	push   $0x0
 6f6:	b9 10 00 00 00       	mov    $0x10,%ecx
 6fb:	8b 45 08             	mov    0x8(%ebp),%eax
 6fe:	e8 b2 fe ff ff       	call   5b5 <printint>
        ap++;
 703:	83 c7 04             	add    $0x4,%edi
 706:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 709:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70c:	be 00 00 00 00       	mov    $0x0,%esi
 711:	e9 56 ff ff ff       	jmp    66c <printf+0x2c>
        s = (char*)*ap;
 716:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 719:	8b 30                	mov    (%eax),%esi
        ap++;
 71b:	83 c0 04             	add    $0x4,%eax
 71e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 721:	85 f6                	test   %esi,%esi
 723:	75 15                	jne    73a <printf+0xfa>
          s = "(null)";
 725:	be 8c 09 00 00       	mov    $0x98c,%esi
 72a:	eb 0e                	jmp    73a <printf+0xfa>
          putc(fd, *s);
 72c:	0f be d2             	movsbl %dl,%edx
 72f:	8b 45 08             	mov    0x8(%ebp),%eax
 732:	e8 64 fe ff ff       	call   59b <putc>
          s++;
 737:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 73a:	0f b6 16             	movzbl (%esi),%edx
 73d:	84 d2                	test   %dl,%dl
 73f:	75 eb                	jne    72c <printf+0xec>
      state = 0;
 741:	be 00 00 00 00       	mov    $0x0,%esi
 746:	e9 21 ff ff ff       	jmp    66c <printf+0x2c>
        putc(fd, *ap);
 74b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 74e:	0f be 17             	movsbl (%edi),%edx
 751:	8b 45 08             	mov    0x8(%ebp),%eax
 754:	e8 42 fe ff ff       	call   59b <putc>
        ap++;
 759:	83 c7 04             	add    $0x4,%edi
 75c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 75f:	be 00 00 00 00       	mov    $0x0,%esi
 764:	e9 03 ff ff ff       	jmp    66c <printf+0x2c>
        putc(fd, c);
 769:	89 fa                	mov    %edi,%edx
 76b:	8b 45 08             	mov    0x8(%ebp),%eax
 76e:	e8 28 fe ff ff       	call   59b <putc>
      state = 0;
 773:	be 00 00 00 00       	mov    $0x0,%esi
 778:	e9 ef fe ff ff       	jmp    66c <printf+0x2c>
        putc(fd, '%');
 77d:	ba 25 00 00 00       	mov    $0x25,%edx
 782:	8b 45 08             	mov    0x8(%ebp),%eax
 785:	e8 11 fe ff ff       	call   59b <putc>
        putc(fd, c);
 78a:	89 fa                	mov    %edi,%edx
 78c:	8b 45 08             	mov    0x8(%ebp),%eax
 78f:	e8 07 fe ff ff       	call   59b <putc>
      state = 0;
 794:	be 00 00 00 00       	mov    $0x0,%esi
 799:	e9 ce fe ff ff       	jmp    66c <printf+0x2c>
    }
  }
}
 79e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7a1:	5b                   	pop    %ebx
 7a2:	5e                   	pop    %esi
 7a3:	5f                   	pop    %edi
 7a4:	5d                   	pop    %ebp
 7a5:	c3                   	ret    

000007a6 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 7bd:	55                   	push   %ebp
 7be:	89 e5                	mov    %esp,%ebp
 7c0:	57                   	push   %edi
 7c1:	56                   	push   %esi
 7c2:	53                   	push   %ebx
 7c3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c9:	a1 c0 0e 00 00       	mov    0xec0,%eax
 7ce:	eb 02                	jmp    7d2 <free+0x15>
 7d0:	89 d0                	mov    %edx,%eax
 7d2:	39 c8                	cmp    %ecx,%eax
 7d4:	73 04                	jae    7da <free+0x1d>
 7d6:	39 08                	cmp    %ecx,(%eax)
 7d8:	77 12                	ja     7ec <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7da:	8b 10                	mov    (%eax),%edx
 7dc:	39 c2                	cmp    %eax,%edx
 7de:	77 f0                	ja     7d0 <free+0x13>
 7e0:	39 c8                	cmp    %ecx,%eax
 7e2:	72 08                	jb     7ec <free+0x2f>
 7e4:	39 ca                	cmp    %ecx,%edx
 7e6:	77 04                	ja     7ec <free+0x2f>
 7e8:	89 d0                	mov    %edx,%eax
 7ea:	eb e6                	jmp    7d2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ec:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ef:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7f2:	8b 10                	mov    (%eax),%edx
 7f4:	39 d7                	cmp    %edx,%edi
 7f6:	74 19                	je     811 <free+0x54>
=======
 7a6:	55                   	push   %ebp
 7a7:	89 e5                	mov    %esp,%ebp
 7a9:	57                   	push   %edi
 7aa:	56                   	push   %esi
 7ab:	53                   	push   %ebx
 7ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7af:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b2:	a1 a0 10 00 00       	mov    0x10a0,%eax
 7b7:	eb 02                	jmp    7bb <free+0x15>
 7b9:	89 d0                	mov    %edx,%eax
 7bb:	39 c8                	cmp    %ecx,%eax
 7bd:	73 04                	jae    7c3 <free+0x1d>
 7bf:	39 08                	cmp    %ecx,(%eax)
 7c1:	77 12                	ja     7d5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c3:	8b 10                	mov    (%eax),%edx
 7c5:	39 c2                	cmp    %eax,%edx
 7c7:	77 f0                	ja     7b9 <free+0x13>
 7c9:	39 c8                	cmp    %ecx,%eax
 7cb:	72 08                	jb     7d5 <free+0x2f>
 7cd:	39 ca                	cmp    %ecx,%edx
 7cf:	77 04                	ja     7d5 <free+0x2f>
 7d1:	89 d0                	mov    %edx,%eax
 7d3:	eb e6                	jmp    7bb <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7d8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7db:	8b 10                	mov    (%eax),%edx
 7dd:	39 d7                	cmp    %edx,%edi
 7df:	74 19                	je     7fa <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 7f8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fb:	8b 50 04             	mov    0x4(%eax),%edx
 7fe:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 801:	39 ce                	cmp    %ecx,%esi
 803:	74 1b                	je     820 <free+0x63>
=======
 7e1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7e4:	8b 50 04             	mov    0x4(%eax),%edx
 7e7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7ea:	39 ce                	cmp    %ecx,%esi
 7ec:	74 1b                	je     809 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 805:	89 08                	mov    %ecx,(%eax)
  freep = p;
 807:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 80c:	5b                   	pop    %ebx
 80d:	5e                   	pop    %esi
 80e:	5f                   	pop    %edi
 80f:	5d                   	pop    %ebp
 810:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 811:	03 72 04             	add    0x4(%edx),%esi
 814:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 817:	8b 10                	mov    (%eax),%edx
 819:	8b 12                	mov    (%edx),%edx
 81b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 81e:	eb db                	jmp    7fb <free+0x3e>
    p->s.size += bp->s.size;
 820:	03 53 fc             	add    -0x4(%ebx),%edx
 823:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 826:	8b 53 f8             	mov    -0x8(%ebx),%edx
 829:	89 10                	mov    %edx,(%eax)
 82b:	eb da                	jmp    807 <free+0x4a>

0000082d <morecore>:
=======
 7ee:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7f0:	a3 a0 10 00 00       	mov    %eax,0x10a0
}
 7f5:	5b                   	pop    %ebx
 7f6:	5e                   	pop    %esi
 7f7:	5f                   	pop    %edi
 7f8:	5d                   	pop    %ebp
 7f9:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7fa:	03 72 04             	add    0x4(%edx),%esi
 7fd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 800:	8b 10                	mov    (%eax),%edx
 802:	8b 12                	mov    (%edx),%edx
 804:	89 53 f8             	mov    %edx,-0x8(%ebx)
 807:	eb db                	jmp    7e4 <free+0x3e>
    p->s.size += bp->s.size;
 809:	03 53 fc             	add    -0x4(%ebx),%edx
 80c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 80f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 812:	89 10                	mov    %edx,(%eax)
 814:	eb da                	jmp    7f0 <free+0x4a>

00000816 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 82d:	55                   	push   %ebp
 82e:	89 e5                	mov    %esp,%ebp
 830:	53                   	push   %ebx
 831:	83 ec 04             	sub    $0x4,%esp
 834:	89 c3                	mov    %eax,%ebx
=======
 816:	55                   	push   %ebp
 817:	89 e5                	mov    %esp,%ebp
 819:	53                   	push   %ebx
 81a:	83 ec 04             	sub    $0x4,%esp
 81d:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 836:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 83b:	77 05                	ja     842 <morecore+0x15>
    nu = 4096;
 83d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 842:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 849:	83 ec 0c             	sub    $0xc,%esp
 84c:	50                   	push   %eax
 84d:	e8 38 fd ff ff       	call   58a <sbrk>
  if(p == (char*)-1)
 852:	83 c4 10             	add    $0x10,%esp
 855:	83 f8 ff             	cmp    $0xffffffff,%eax
 858:	74 1c                	je     876 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 85a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85d:	83 c0 08             	add    $0x8,%eax
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	50                   	push   %eax
 864:	e8 54 ff ff ff       	call   7bd <free>
  return freep;
 869:	a1 c0 0e 00 00       	mov    0xec0,%eax
 86e:	83 c4 10             	add    $0x10,%esp
}
 871:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 874:	c9                   	leave  
 875:	c3                   	ret    
    return 0;
 876:	b8 00 00 00 00       	mov    $0x0,%eax
 87b:	eb f4                	jmp    871 <morecore+0x44>

0000087d <malloc>:
=======
 81f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 824:	77 05                	ja     82b <morecore+0x15>
    nu = 4096;
 826:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 82b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 832:	83 ec 0c             	sub    $0xc,%esp
 835:	50                   	push   %eax
 836:	e8 38 fd ff ff       	call   573 <sbrk>
  if(p == (char*)-1)
 83b:	83 c4 10             	add    $0x10,%esp
 83e:	83 f8 ff             	cmp    $0xffffffff,%eax
 841:	74 1c                	je     85f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 843:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 846:	83 c0 08             	add    $0x8,%eax
 849:	83 ec 0c             	sub    $0xc,%esp
 84c:	50                   	push   %eax
 84d:	e8 54 ff ff ff       	call   7a6 <free>
  return freep;
 852:	a1 a0 10 00 00       	mov    0x10a0,%eax
 857:	83 c4 10             	add    $0x10,%esp
}
 85a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 85d:	c9                   	leave  
 85e:	c3                   	ret    
    return 0;
 85f:	b8 00 00 00 00       	mov    $0x0,%eax
 864:	eb f4                	jmp    85a <morecore+0x44>

00000866 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 87d:	55                   	push   %ebp
 87e:	89 e5                	mov    %esp,%ebp
 880:	53                   	push   %ebx
 881:	83 ec 04             	sub    $0x4,%esp
=======
 866:	55                   	push   %ebp
 867:	89 e5                	mov    %esp,%ebp
 869:	53                   	push   %ebx
 86a:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 884:	8b 45 08             	mov    0x8(%ebp),%eax
 887:	8d 58 07             	lea    0x7(%eax),%ebx
 88a:	c1 eb 03             	shr    $0x3,%ebx
 88d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 890:	8b 0d c0 0e 00 00    	mov    0xec0,%ecx
 896:	85 c9                	test   %ecx,%ecx
 898:	74 04                	je     89e <malloc+0x21>
=======
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
 870:	8d 58 07             	lea    0x7(%eax),%ebx
 873:	c1 eb 03             	shr    $0x3,%ebx
 876:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 879:	8b 0d a0 10 00 00    	mov    0x10a0,%ecx
 87f:	85 c9                	test   %ecx,%ecx
 881:	74 04                	je     887 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 89a:	8b 01                	mov    (%ecx),%eax
 89c:	eb 4a                	jmp    8e8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 89e:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 8a5:	0e 00 00 
 8a8:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 8af:	0e 00 00 
    base.s.size = 0;
 8b2:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 8b9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8bc:	b9 c4 0e 00 00       	mov    $0xec4,%ecx
 8c1:	eb d7                	jmp    89a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8c3:	74 19                	je     8de <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8c5:	29 da                	sub    %ebx,%edx
 8c7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ca:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8cd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8d0:	89 0d c0 0e 00 00    	mov    %ecx,0xec0
      return (void*)(p + 1);
 8d6:	83 c0 08             	add    $0x8,%eax
=======
 883:	8b 01                	mov    (%ecx),%eax
 885:	eb 4a                	jmp    8d1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 887:	c7 05 a0 10 00 00 a4 	movl   $0x10a4,0x10a0
 88e:	10 00 00 
 891:	c7 05 a4 10 00 00 a4 	movl   $0x10a4,0x10a4
 898:	10 00 00 
    base.s.size = 0;
 89b:	c7 05 a8 10 00 00 00 	movl   $0x0,0x10a8
 8a2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8a5:	b9 a4 10 00 00       	mov    $0x10a4,%ecx
 8aa:	eb d7                	jmp    883 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8ac:	74 19                	je     8c7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8ae:	29 da                	sub    %ebx,%edx
 8b0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8b3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8b6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8b9:	89 0d a0 10 00 00    	mov    %ecx,0x10a0
      return (void*)(p + 1);
 8bf:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 8d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8dc:	c9                   	leave  
 8dd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8de:	8b 10                	mov    (%eax),%edx
 8e0:	89 11                	mov    %edx,(%ecx)
 8e2:	eb ec                	jmp    8d0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e4:	89 c1                	mov    %eax,%ecx
 8e6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8e8:	8b 50 04             	mov    0x4(%eax),%edx
 8eb:	39 da                	cmp    %ebx,%edx
 8ed:	73 d4                	jae    8c3 <malloc+0x46>
    if(p == freep)
 8ef:	39 05 c0 0e 00 00    	cmp    %eax,0xec0
 8f5:	75 ed                	jne    8e4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8f7:	89 d8                	mov    %ebx,%eax
 8f9:	e8 2f ff ff ff       	call   82d <morecore>
 8fe:	85 c0                	test   %eax,%eax
 900:	75 e2                	jne    8e4 <malloc+0x67>
 902:	eb d5                	jmp    8d9 <malloc+0x5c>
=======
 8c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c5:	c9                   	leave  
 8c6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8c7:	8b 10                	mov    (%eax),%edx
 8c9:	89 11                	mov    %edx,(%ecx)
 8cb:	eb ec                	jmp    8b9 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8cd:	89 c1                	mov    %eax,%ecx
 8cf:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8d1:	8b 50 04             	mov    0x4(%eax),%edx
 8d4:	39 da                	cmp    %ebx,%edx
 8d6:	73 d4                	jae    8ac <malloc+0x46>
    if(p == freep)
 8d8:	39 05 a0 10 00 00    	cmp    %eax,0x10a0
 8de:	75 ed                	jne    8cd <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8e0:	89 d8                	mov    %ebx,%eax
 8e2:	e8 2f ff ff ff       	call   816 <morecore>
 8e7:	85 c0                	test   %eax,%eax
 8e9:	75 e2                	jne    8cd <malloc+0x67>
 8eb:	eb d5                	jmp    8c2 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
