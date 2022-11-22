
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
<<<<<<< HEAD
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
=======
  1d:	a1 bc 0d 00 00       	mov    0xdbc,%eax
  22:	83 f8 01             	cmp    $0x1,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 38                	push   $0x38
  29:	68 38 09 00 00       	push   $0x938
  2e:	68 41 09 00 00       	push   $0x941
  33:	6a 01                	push   $0x1
  35:	e8 4e 06 00 00       	call   688 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 49 09 00 00       	push   $0x949
  42:	68 55 09 00 00       	push   $0x955
  47:	6a 01                	push   $0x1
  49:	e8 3a 06 00 00       	call   688 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 69 09 00 00       	push   $0x969
  56:	6a 01                	push   $0x1
  58:	e8 2b 06 00 00       	call   688 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 e0 0d 00 00    	push   0xde0
  66:	e8 f8 04 00 00       	call   563 <kill>
  6b:	e8 c3 04 00 00       	call   533 <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d bc 0d 00 00    	mov    %ecx,0xdbc
   exit();
  78:	e8 b6 04 00 00       	call   533 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

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
<<<<<<< HEAD
  90:	e8 35 05 00 00       	call   5ca <getpid>
=======
  90:	e8 1e 05 00 00       	call   5b3 <getpid>
>>>>>>> c59b0f9 (fixed thread_join and join)
  95:	a3 e0 0d 00 00       	mov    %eax,0xde0
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
  a2:	e8 1e 08 00 00       	call   8c5 <malloc>
=======
  a2:	e8 07 08 00 00       	call   8ae <malloc>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
  c8:	68 d8 0d 00 00       	push   $0xdd8
  cd:	68 dc 0d 00 00       	push   $0xddc
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 0e 05 00 00       	call   5ea <clone>
=======
  c8:	68 c0 0d 00 00       	push   $0xdc0
  cd:	68 c4 0d 00 00       	push   $0xdc4
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 f7 04 00 00       	call   5d3 <clone>
>>>>>>> c59b0f9 (fixed thread_join and join)
  dc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 8e b8 00 00 00    	jle    1a1 <main+0x124>
   while(global != 33);
<<<<<<< HEAD
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
=======
  e9:	a1 bc 0d 00 00       	mov    0xdbc,%eax
  ee:	83 f8 21             	cmp    $0x21,%eax
  f1:	75 f6                	jne    e9 <main+0x6c>
   assert(arg1 == 44);
  f3:	a1 c4 0d 00 00       	mov    0xdc4,%eax
  f8:	83 f8 2c             	cmp    $0x2c,%eax
  fb:	0f 85 e9 00 00 00    	jne    1ea <main+0x16d>
   assert(arg2 == 55);
 101:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 106:	83 f8 37             	cmp    $0x37,%eax
 109:	0f 84 24 01 00 00    	je     233 <main+0x1b6>
 10f:	6a 28                	push   $0x28
 111:	68 38 09 00 00       	push   $0x938
 116:	68 41 09 00 00       	push   $0x941
 11b:	6a 01                	push   $0x1
 11d:	e8 66 05 00 00       	call   688 <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 99 09 00 00       	push   $0x999
 12a:	68 55 09 00 00       	push   $0x955
 12f:	6a 01                	push   $0x1
 131:	e8 52 05 00 00       	call   688 <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 69 09 00 00       	push   $0x969
 13e:	6a 01                	push   $0x1
 140:	e8 43 05 00 00       	call   688 <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 e0 0d 00 00    	push   0xde0
 14e:	e8 10 04 00 00       	call   563 <kill>
 153:	e8 db 03 00 00       	call   533 <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 38 09 00 00       	push   $0x938
 15f:	68 41 09 00 00       	push   $0x941
 164:	6a 01                	push   $0x1
 166:	e8 1d 05 00 00       	call   688 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 76 09 00 00       	push   $0x976
 173:	68 55 09 00 00       	push   $0x955
 178:	6a 01                	push   $0x1
 17a:	e8 09 05 00 00       	call   688 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 69 09 00 00       	push   $0x969
 187:	6a 01                	push   $0x1
 189:	e8 fa 04 00 00       	call   688 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 e0 0d 00 00    	push   0xde0
 197:	e8 c7 03 00 00       	call   563 <kill>
 19c:	e8 92 03 00 00       	call   533 <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 38 09 00 00       	push   $0x938
 1a8:	68 41 09 00 00       	push   $0x941
 1ad:	6a 01                	push   $0x1
 1af:	e8 d4 04 00 00       	call   688 <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 80 09 00 00       	push   $0x980
 1bc:	68 55 09 00 00       	push   $0x955
 1c1:	6a 01                	push   $0x1
 1c3:	e8 c0 04 00 00       	call   688 <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 69 09 00 00       	push   $0x969
 1d0:	6a 01                	push   $0x1
 1d2:	e8 b1 04 00 00       	call   688 <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 e0 0d 00 00    	push   0xde0
 1e0:	e8 7e 03 00 00       	call   563 <kill>
 1e5:	e8 49 03 00 00       	call   533 <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 38 09 00 00       	push   $0x938
 1f1:	68 41 09 00 00       	push   $0x941
 1f6:	6a 01                	push   $0x1
 1f8:	e8 8b 04 00 00       	call   688 <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 8e 09 00 00       	push   $0x98e
 205:	68 55 09 00 00       	push   $0x955
 20a:	6a 01                	push   $0x1
 20c:	e8 77 04 00 00       	call   688 <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 69 09 00 00       	push   $0x969
 219:	6a 01                	push   $0x1
 21b:	e8 68 04 00 00       	call   688 <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 e0 0d 00 00    	push   0xde0
 229:	e8 35 03 00 00       	call   563 <kill>
 22e:	e8 00 03 00 00       	call   533 <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 a4 09 00 00       	push   $0x9a4
 23b:	6a 01                	push   $0x1
 23d:	e8 46 04 00 00       	call   688 <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 8e 03 00 00       	call   5db <join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
<<<<<<< HEAD
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
=======
 256:	68 38 09 00 00       	push   $0x938
 25b:	68 41 09 00 00       	push   $0x941
 260:	6a 01                	push   $0x1
 262:	e8 21 04 00 00       	call   688 <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 b1 09 00 00       	push   $0x9b1
 26f:	68 55 09 00 00       	push   $0x955
 274:	6a 01                	push   $0x1
 276:	e8 0d 04 00 00       	call   688 <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 69 09 00 00       	push   $0x969
 283:	6a 01                	push   $0x1
 285:	e8 fe 03 00 00       	call   688 <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 e0 0d 00 00    	push   0xde0
 293:	e8 cb 02 00 00       	call   563 <kill>
 298:	e8 96 02 00 00       	call   533 <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 48 05 00 00       	call   7ee <free>
   exit();
 2a6:	e8 88 02 00 00       	call   533 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000002ab <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

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
<<<<<<< HEAD
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
=======
 2c8:	e8 e1 05 00 00       	call   8ae <malloc>
  if(n_stack == 0){
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	74 57                	je     32b <thread_create+0x6f>
 2d4:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 2d6:	b8 00 00 00 00       	mov    $0x0,%eax
 2db:	eb 03                	jmp    2e0 <thread_create+0x24>
 2dd:	83 c0 01             	add    $0x1,%eax
 2e0:	83 f8 3f             	cmp    $0x3f,%eax
 2e3:	7f 2f                	jg     314 <thread_create+0x58>
    if(threads[i].flag==0){
 2e5:	8d 14 40             	lea    (%eax,%eax,2),%edx
 2e8:	83 3c 95 08 0e 00 00 	cmpl   $0x0,0xe08(,%edx,4)
 2ef:	00 
 2f0:	75 eb                	jne    2dd <thread_create+0x21>
      threads[i].maddr = n_stack;
 2f2:	8d 14 00             	lea    (%eax,%eax,1),%edx
 2f5:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 2f8:	c1 e3 02             	shl    $0x2,%ebx
 2fb:	89 8b 00 0e 00 00    	mov    %ecx,0xe00(%ebx)
      threads[i].pg1addr = n_stack;
 301:	89 8b 04 0e 00 00    	mov    %ecx,0xe04(%ebx)
      threads[i].flag = 1;
 307:	01 c2                	add    %eax,%edx
 309:	c7 04 95 08 0e 00 00 	movl   $0x1,0xe08(,%edx,4)
 310:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 314:	51                   	push   %ecx
 315:	ff 75 10             	push   0x10(%ebp)
 318:	ff 75 0c             	push   0xc(%ebp)
 31b:	ff 75 08             	push   0x8(%ebp)
 31e:	e8 b0 02 00 00       	call   5d3 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

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
<<<<<<< HEAD
}
 310:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 313:	c9                   	leave  
 314:	c3                   	ret    
    return -1;
 315:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 31a:	eb f4                	jmp    310 <thread_create+0x54>

0000031c <thread_join>:
=======
 323:	83 c4 10             	add    $0x10,%esp
}
 326:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 329:	c9                   	leave  
 32a:	c3                   	ret    
    return -1;
 32b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 330:	eb f4                	jmp    326 <thread_create+0x6a>

00000332 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
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
=======
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	53                   	push   %ebx
 336:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 339:	8d 45 f4             	lea    -0xc(%ebp),%eax
 33c:	50                   	push   %eax
 33d:	e8 99 02 00 00       	call   5db <join>
 342:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 344:	83 c4 04             	add    $0x4,%esp
 347:	ff 75 f4             	push   -0xc(%ebp)
 34a:	e8 9f 04 00 00       	call   7ee <free>
  return pid;
}
 34f:	89 d8                	mov    %ebx,%eax
 351:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 354:	c9                   	leave  
 355:	c3                   	ret    

00000356 <lock_acquire>:

void lock_acquire(lock_t *lock){
 356:	55                   	push   %ebp
 357:	89 e5                	mov    %esp,%ebp
 359:	53                   	push   %ebx
 35a:	83 ec 04             	sub    $0x4,%esp
 35d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 360:	83 ec 08             	sub    $0x8,%esp
 363:	6a 01                	push   $0x1
 365:	53                   	push   %ebx
 366:	e8 40 ff ff ff       	call   2ab <test_and_set>
 36b:	83 c4 10             	add    $0x10,%esp
 36e:	83 f8 01             	cmp    $0x1,%eax
 371:	74 ed                	je     360 <lock_acquire+0xa>
    ;
}
 373:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 376:	c9                   	leave  
 377:	c3                   	ret    

00000378 <lock_release>:

void lock_release(lock_t *lock) {
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 384:	5d                   	pop    %ebp
 385:	c3                   	ret    

00000386 <lock_init>:

void lock_init(lock_t *lock) {
 386:	55                   	push   %ebp
 387:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 389:	8b 45 08             	mov    0x8(%ebp),%eax
 38c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 392:	5d                   	pop    %ebp
 393:	c3                   	ret    

00000394 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	56                   	push   %esi
 3af:	53                   	push   %ebx
 3b0:	8b 75 08             	mov    0x8(%ebp),%esi
 3b3:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	56                   	push   %esi
 398:	53                   	push   %ebx
 399:	8b 75 08             	mov    0x8(%ebp),%esi
 39c:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
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
=======
 39f:	89 f0                	mov    %esi,%eax
 3a1:	89 d1                	mov    %edx,%ecx
 3a3:	83 c2 01             	add    $0x1,%edx
 3a6:	89 c3                	mov    %eax,%ebx
 3a8:	83 c0 01             	add    $0x1,%eax
 3ab:	0f b6 09             	movzbl (%ecx),%ecx
 3ae:	88 0b                	mov    %cl,(%ebx)
 3b0:	84 c9                	test   %cl,%cl
 3b2:	75 ed                	jne    3a1 <strcpy+0xd>
    ;
  return os;
}
 3b4:	89 f0                	mov    %esi,%eax
 3b6:	5b                   	pop    %ebx
 3b7:	5e                   	pop    %esi
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    

000003ba <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
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
=======
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c0:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3c3:	eb 06                	jmp    3cb <strcmp+0x11>
    p++, q++;
 3c5:	83 c1 01             	add    $0x1,%ecx
 3c8:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3cb:	0f b6 01             	movzbl (%ecx),%eax
 3ce:	84 c0                	test   %al,%al
 3d0:	74 04                	je     3d6 <strcmp+0x1c>
 3d2:	3a 02                	cmp    (%edx),%al
 3d4:	74 ef                	je     3c5 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3d6:	0f b6 c0             	movzbl %al,%eax
 3d9:	0f b6 12             	movzbl (%edx),%edx
 3dc:	29 d0                	sub    %edx,%eax
}
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
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
=======
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3e6:	b8 00 00 00 00       	mov    $0x0,%eax
 3eb:	eb 03                	jmp    3f0 <strlen+0x10>
 3ed:	83 c0 01             	add    $0x1,%eax
 3f0:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3f4:	75 f7                	jne    3ed <strlen+0xd>
    ;
  return n;
}
 3f6:	5d                   	pop    %ebp
 3f7:	c3                   	ret    

000003f8 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 40f:	55                   	push   %ebp
 410:	89 e5                	mov    %esp,%ebp
 412:	57                   	push   %edi
 413:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 3f8:	55                   	push   %ebp
 3f9:	89 e5                	mov    %esp,%ebp
 3fb:	57                   	push   %edi
 3fc:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
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
=======
 3ff:	89 d7                	mov    %edx,%edi
 401:	8b 4d 10             	mov    0x10(%ebp),%ecx
 404:	8b 45 0c             	mov    0xc(%ebp),%eax
 407:	fc                   	cld    
 408:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 40a:	89 d0                	mov    %edx,%eax
 40c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 40f:	c9                   	leave  
 410:	c3                   	ret    

00000411 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
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
=======
 411:	55                   	push   %ebp
 412:	89 e5                	mov    %esp,%ebp
 414:	8b 45 08             	mov    0x8(%ebp),%eax
 417:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 41b:	eb 03                	jmp    420 <strchr+0xf>
 41d:	83 c0 01             	add    $0x1,%eax
 420:	0f b6 10             	movzbl (%eax),%edx
 423:	84 d2                	test   %dl,%dl
 425:	74 06                	je     42d <strchr+0x1c>
    if(*s == c)
 427:	38 ca                	cmp    %cl,%dl
 429:	75 f2                	jne    41d <strchr+0xc>
 42b:	eb 05                	jmp    432 <strchr+0x21>
      return (char*)s;
  return 0;
 42d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 432:	5d                   	pop    %ebp
 433:	c3                   	ret    

00000434 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 44b:	55                   	push   %ebp
 44c:	89 e5                	mov    %esp,%ebp
 44e:	57                   	push   %edi
 44f:	56                   	push   %esi
 450:	53                   	push   %ebx
 451:	83 ec 1c             	sub    $0x1c,%esp
 454:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	57                   	push   %edi
 438:	56                   	push   %esi
 439:	53                   	push   %ebx
 43a:	83 ec 1c             	sub    $0x1c,%esp
 43d:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
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
=======
 440:	bb 00 00 00 00       	mov    $0x0,%ebx
 445:	89 de                	mov    %ebx,%esi
 447:	83 c3 01             	add    $0x1,%ebx
 44a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 44d:	7d 2e                	jge    47d <gets+0x49>
    cc = read(0, &c, 1);
 44f:	83 ec 04             	sub    $0x4,%esp
 452:	6a 01                	push   $0x1
 454:	8d 45 e7             	lea    -0x19(%ebp),%eax
 457:	50                   	push   %eax
 458:	6a 00                	push   $0x0
 45a:	e8 ec 00 00 00       	call   54b <read>
    if(cc < 1)
 45f:	83 c4 10             	add    $0x10,%esp
 462:	85 c0                	test   %eax,%eax
 464:	7e 17                	jle    47d <gets+0x49>
      break;
    buf[i++] = c;
 466:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 46a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 46d:	3c 0a                	cmp    $0xa,%al
 46f:	0f 94 c2             	sete   %dl
 472:	3c 0d                	cmp    $0xd,%al
 474:	0f 94 c0             	sete   %al
 477:	08 c2                	or     %al,%dl
 479:	74 ca                	je     445 <gets+0x11>
    buf[i++] = c;
 47b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 47d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 481:	89 f8                	mov    %edi,%eax
 483:	8d 65 f4             	lea    -0xc(%ebp),%esp
 486:	5b                   	pop    %ebx
 487:	5e                   	pop    %esi
 488:	5f                   	pop    %edi
 489:	5d                   	pop    %ebp
 48a:	c3                   	ret    

0000048b <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 4a2:	55                   	push   %ebp
 4a3:	89 e5                	mov    %esp,%ebp
 4a5:	56                   	push   %esi
 4a6:	53                   	push   %ebx
=======
 48b:	55                   	push   %ebp
 48c:	89 e5                	mov    %esp,%ebp
 48e:	56                   	push   %esi
 48f:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
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
=======
 490:	83 ec 08             	sub    $0x8,%esp
 493:	6a 00                	push   $0x0
 495:	ff 75 08             	push   0x8(%ebp)
 498:	e8 d6 00 00 00       	call   573 <open>
  if(fd < 0)
 49d:	83 c4 10             	add    $0x10,%esp
 4a0:	85 c0                	test   %eax,%eax
 4a2:	78 24                	js     4c8 <stat+0x3d>
 4a4:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4a6:	83 ec 08             	sub    $0x8,%esp
 4a9:	ff 75 0c             	push   0xc(%ebp)
 4ac:	50                   	push   %eax
 4ad:	e8 d9 00 00 00       	call   58b <fstat>
 4b2:	89 c6                	mov    %eax,%esi
  close(fd);
 4b4:	89 1c 24             	mov    %ebx,(%esp)
 4b7:	e8 9f 00 00 00       	call   55b <close>
  return r;
 4bc:	83 c4 10             	add    $0x10,%esp
}
 4bf:	89 f0                	mov    %esi,%eax
 4c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4c4:	5b                   	pop    %ebx
 4c5:	5e                   	pop    %esi
 4c6:	5d                   	pop    %ebp
 4c7:	c3                   	ret    
    return -1;
 4c8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4cd:	eb f0                	jmp    4bf <stat+0x34>

000004cf <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
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
=======
 4cf:	55                   	push   %ebp
 4d0:	89 e5                	mov    %esp,%ebp
 4d2:	53                   	push   %ebx
 4d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4d6:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4db:	eb 10                	jmp    4ed <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4dd:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4e0:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4e3:	83 c1 01             	add    $0x1,%ecx
 4e6:	0f be c0             	movsbl %al,%eax
 4e9:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4ed:	0f b6 01             	movzbl (%ecx),%eax
 4f0:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4f3:	80 fb 09             	cmp    $0x9,%bl
 4f6:	76 e5                	jbe    4dd <atoi+0xe>
  return n;
}
 4f8:	89 d0                	mov    %edx,%eax
 4fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4fd:	c9                   	leave  
 4fe:	c3                   	ret    

000004ff <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	56                   	push   %esi
 51a:	53                   	push   %ebx
 51b:	8b 75 08             	mov    0x8(%ebp),%esi
 51e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 521:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 4ff:	55                   	push   %ebp
 500:	89 e5                	mov    %esp,%ebp
 502:	56                   	push   %esi
 503:	53                   	push   %ebx
 504:	8b 75 08             	mov    0x8(%ebp),%esi
 507:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 50a:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
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
=======
 50d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 50f:	eb 0d                	jmp    51e <memmove+0x1f>
    *dst++ = *src++;
 511:	0f b6 01             	movzbl (%ecx),%eax
 514:	88 02                	mov    %al,(%edx)
 516:	8d 49 01             	lea    0x1(%ecx),%ecx
 519:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 51c:	89 d8                	mov    %ebx,%eax
 51e:	8d 58 ff             	lea    -0x1(%eax),%ebx
 521:	85 c0                	test   %eax,%eax
 523:	7f ec                	jg     511 <memmove+0x12>
  return vdst;
}
 525:	89 f0                	mov    %esi,%eax
 527:	5b                   	pop    %ebx
 528:	5e                   	pop    %esi
 529:	5d                   	pop    %ebp
 52a:	c3                   	ret    

0000052b <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
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
=======
 52b:	b8 01 00 00 00       	mov    $0x1,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <exit>:
SYSCALL(exit)
 533:	b8 02 00 00 00       	mov    $0x2,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <wait>:
SYSCALL(wait)
 53b:	b8 03 00 00 00       	mov    $0x3,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <pipe>:
SYSCALL(pipe)
 543:	b8 04 00 00 00       	mov    $0x4,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <read>:
SYSCALL(read)
 54b:	b8 05 00 00 00       	mov    $0x5,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <write>:
SYSCALL(write)
 553:	b8 10 00 00 00       	mov    $0x10,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <close>:
SYSCALL(close)
 55b:	b8 15 00 00 00       	mov    $0x15,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <kill>:
SYSCALL(kill)
 563:	b8 06 00 00 00       	mov    $0x6,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <exec>:
SYSCALL(exec)
 56b:	b8 07 00 00 00       	mov    $0x7,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <open>:
SYSCALL(open)
 573:	b8 0f 00 00 00       	mov    $0xf,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <mknod>:
SYSCALL(mknod)
 57b:	b8 11 00 00 00       	mov    $0x11,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <unlink>:
SYSCALL(unlink)
 583:	b8 12 00 00 00       	mov    $0x12,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <fstat>:
SYSCALL(fstat)
 58b:	b8 08 00 00 00       	mov    $0x8,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <link>:
SYSCALL(link)
 593:	b8 13 00 00 00       	mov    $0x13,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <mkdir>:
SYSCALL(mkdir)
 59b:	b8 14 00 00 00       	mov    $0x14,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <chdir>:
SYSCALL(chdir)
 5a3:	b8 09 00 00 00       	mov    $0x9,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <dup>:
SYSCALL(dup)
 5ab:	b8 0a 00 00 00       	mov    $0xa,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <getpid>:
SYSCALL(getpid)
 5b3:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <sbrk>:
SYSCALL(sbrk)
 5bb:	b8 0c 00 00 00       	mov    $0xc,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <sleep>:
SYSCALL(sleep)
 5c3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <uptime>:
SYSCALL(uptime)
 5cb:	b8 0e 00 00 00       	mov    $0xe,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <clone>:
SYSCALL(clone)
 5d3:	b8 16 00 00 00       	mov    $0x16,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <join>:
 5db:	b8 17 00 00 00       	mov    $0x17,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
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
=======
 5e3:	55                   	push   %ebp
 5e4:	89 e5                	mov    %esp,%ebp
 5e6:	83 ec 1c             	sub    $0x1c,%esp
 5e9:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5ec:	6a 01                	push   $0x1
 5ee:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5f1:	52                   	push   %edx
 5f2:	50                   	push   %eax
 5f3:	e8 5b ff ff ff       	call   553 <write>
}
 5f8:	83 c4 10             	add    $0x10,%esp
 5fb:	c9                   	leave  
 5fc:	c3                   	ret    

000005fd <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	57                   	push   %edi
 618:	56                   	push   %esi
 619:	53                   	push   %ebx
 61a:	83 ec 2c             	sub    $0x2c,%esp
 61d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 620:	89 d0                	mov    %edx,%eax
 622:	89 ce                	mov    %ecx,%esi
=======
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	57                   	push   %edi
 601:	56                   	push   %esi
 602:	53                   	push   %ebx
 603:	83 ec 2c             	sub    $0x2c,%esp
 606:	89 45 d0             	mov    %eax,-0x30(%ebp)
 609:	89 d0                	mov    %edx,%eax
 60b:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
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
=======
 60d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 611:	0f 95 c1             	setne  %cl
 614:	c1 ea 1f             	shr    $0x1f,%edx
 617:	84 d1                	test   %dl,%cl
 619:	74 44                	je     65f <printint+0x62>
    neg = 1;
    x = -xx;
 61b:	f7 d8                	neg    %eax
 61d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 61f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
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
=======
 626:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 62b:	89 c8                	mov    %ecx,%eax
 62d:	ba 00 00 00 00       	mov    $0x0,%edx
 632:	f7 f6                	div    %esi
 634:	89 df                	mov    %ebx,%edi
 636:	83 c3 01             	add    $0x1,%ebx
 639:	0f b6 92 28 0a 00 00 	movzbl 0xa28(%edx),%edx
 640:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 644:	89 ca                	mov    %ecx,%edx
 646:	89 c1                	mov    %eax,%ecx
 648:	39 d6                	cmp    %edx,%esi
 64a:	76 df                	jbe    62b <printint+0x2e>
  if(neg)
 64c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 650:	74 31                	je     683 <printint+0x86>
    buf[i++] = '-';
 652:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 657:	8d 5f 02             	lea    0x2(%edi),%ebx
 65a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 65d:	eb 17                	jmp    676 <printint+0x79>
    x = xx;
 65f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 661:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 668:	eb bc                	jmp    626 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 66a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 66f:	89 f0                	mov    %esi,%eax
 671:	e8 6d ff ff ff       	call   5e3 <putc>
  while(--i >= 0)
 676:	83 eb 01             	sub    $0x1,%ebx
 679:	79 ef                	jns    66a <printint+0x6d>
}
 67b:	83 c4 2c             	add    $0x2c,%esp
 67e:	5b                   	pop    %ebx
 67f:	5e                   	pop    %esi
 680:	5f                   	pop    %edi
 681:	5d                   	pop    %ebp
 682:	c3                   	ret    
 683:	8b 75 d0             	mov    -0x30(%ebp),%esi
 686:	eb ee                	jmp    676 <printint+0x79>

00000688 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 69f:	55                   	push   %ebp
 6a0:	89 e5                	mov    %esp,%ebp
 6a2:	57                   	push   %edi
 6a3:	56                   	push   %esi
 6a4:	53                   	push   %ebx
 6a5:	83 ec 1c             	sub    $0x1c,%esp
=======
 688:	55                   	push   %ebp
 689:	89 e5                	mov    %esp,%ebp
 68b:	57                   	push   %edi
 68c:	56                   	push   %esi
 68d:	53                   	push   %ebx
 68e:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 6a8:	8d 45 10             	lea    0x10(%ebp),%eax
 6ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6ae:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6b3:	bb 00 00 00 00       	mov    $0x0,%ebx
 6b8:	eb 14                	jmp    6ce <printf+0x2f>
=======
 691:	8d 45 10             	lea    0x10(%ebp),%eax
 694:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 697:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 69c:	bb 00 00 00 00       	mov    $0x0,%ebx
 6a1:	eb 14                	jmp    6b7 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
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
=======
 6a3:	89 fa                	mov    %edi,%edx
 6a5:	8b 45 08             	mov    0x8(%ebp),%eax
 6a8:	e8 36 ff ff ff       	call   5e3 <putc>
 6ad:	eb 05                	jmp    6b4 <printf+0x2c>
      }
    } else if(state == '%'){
 6af:	83 fe 25             	cmp    $0x25,%esi
 6b2:	74 25                	je     6d9 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6b4:	83 c3 01             	add    $0x1,%ebx
 6b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ba:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6be:	84 c0                	test   %al,%al
 6c0:	0f 84 20 01 00 00    	je     7e6 <printf+0x15e>
    c = fmt[i] & 0xff;
 6c6:	0f be f8             	movsbl %al,%edi
 6c9:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6cc:	85 f6                	test   %esi,%esi
 6ce:	75 df                	jne    6af <printf+0x27>
      if(c == '%'){
 6d0:	83 f8 25             	cmp    $0x25,%eax
 6d3:	75 ce                	jne    6a3 <printf+0x1b>
        state = '%';
 6d5:	89 c6                	mov    %eax,%esi
 6d7:	eb db                	jmp    6b4 <printf+0x2c>
      if(c == 'd'){
 6d9:	83 f8 25             	cmp    $0x25,%eax
 6dc:	0f 84 cf 00 00 00    	je     7b1 <printf+0x129>
 6e2:	0f 8c dd 00 00 00    	jl     7c5 <printf+0x13d>
 6e8:	83 f8 78             	cmp    $0x78,%eax
 6eb:	0f 8f d4 00 00 00    	jg     7c5 <printf+0x13d>
 6f1:	83 f8 63             	cmp    $0x63,%eax
 6f4:	0f 8c cb 00 00 00    	jl     7c5 <printf+0x13d>
 6fa:	83 e8 63             	sub    $0x63,%eax
 6fd:	83 f8 15             	cmp    $0x15,%eax
 700:	0f 87 bf 00 00 00    	ja     7c5 <printf+0x13d>
 706:	ff 24 85 d0 09 00 00 	jmp    *0x9d0(,%eax,4)
        printint(fd, *ap, 10, 1);
 70d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 710:	8b 17                	mov    (%edi),%edx
 712:	83 ec 0c             	sub    $0xc,%esp
 715:	6a 01                	push   $0x1
 717:	b9 0a 00 00 00       	mov    $0xa,%ecx
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	e8 d9 fe ff ff       	call   5fd <printint>
        ap++;
 724:	83 c7 04             	add    $0x4,%edi
 727:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 72a:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
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
=======
 72d:	be 00 00 00 00       	mov    $0x0,%esi
 732:	eb 80                	jmp    6b4 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 734:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 737:	8b 17                	mov    (%edi),%edx
 739:	83 ec 0c             	sub    $0xc,%esp
 73c:	6a 00                	push   $0x0
 73e:	b9 10 00 00 00       	mov    $0x10,%ecx
 743:	8b 45 08             	mov    0x8(%ebp),%eax
 746:	e8 b2 fe ff ff       	call   5fd <printint>
        ap++;
 74b:	83 c7 04             	add    $0x4,%edi
 74e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 751:	83 c4 10             	add    $0x10,%esp
      state = 0;
 754:	be 00 00 00 00       	mov    $0x0,%esi
 759:	e9 56 ff ff ff       	jmp    6b4 <printf+0x2c>
        s = (char*)*ap;
 75e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 761:	8b 30                	mov    (%eax),%esi
        ap++;
 763:	83 c0 04             	add    $0x4,%eax
 766:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 769:	85 f6                	test   %esi,%esi
 76b:	75 15                	jne    782 <printf+0xfa>
          s = "(null)";
 76d:	be c7 09 00 00       	mov    $0x9c7,%esi
 772:	eb 0e                	jmp    782 <printf+0xfa>
          putc(fd, *s);
 774:	0f be d2             	movsbl %dl,%edx
 777:	8b 45 08             	mov    0x8(%ebp),%eax
 77a:	e8 64 fe ff ff       	call   5e3 <putc>
          s++;
 77f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 782:	0f b6 16             	movzbl (%esi),%edx
 785:	84 d2                	test   %dl,%dl
 787:	75 eb                	jne    774 <printf+0xec>
      state = 0;
 789:	be 00 00 00 00       	mov    $0x0,%esi
 78e:	e9 21 ff ff ff       	jmp    6b4 <printf+0x2c>
        putc(fd, *ap);
 793:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 796:	0f be 17             	movsbl (%edi),%edx
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	e8 42 fe ff ff       	call   5e3 <putc>
        ap++;
 7a1:	83 c7 04             	add    $0x4,%edi
 7a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7a7:	be 00 00 00 00       	mov    $0x0,%esi
 7ac:	e9 03 ff ff ff       	jmp    6b4 <printf+0x2c>
        putc(fd, c);
 7b1:	89 fa                	mov    %edi,%edx
 7b3:	8b 45 08             	mov    0x8(%ebp),%eax
 7b6:	e8 28 fe ff ff       	call   5e3 <putc>
      state = 0;
 7bb:	be 00 00 00 00       	mov    $0x0,%esi
 7c0:	e9 ef fe ff ff       	jmp    6b4 <printf+0x2c>
        putc(fd, '%');
 7c5:	ba 25 00 00 00       	mov    $0x25,%edx
 7ca:	8b 45 08             	mov    0x8(%ebp),%eax
 7cd:	e8 11 fe ff ff       	call   5e3 <putc>
        putc(fd, c);
 7d2:	89 fa                	mov    %edi,%edx
 7d4:	8b 45 08             	mov    0x8(%ebp),%eax
 7d7:	e8 07 fe ff ff       	call   5e3 <putc>
      state = 0;
 7dc:	be 00 00 00 00       	mov    $0x0,%esi
 7e1:	e9 ce fe ff ff       	jmp    6b4 <printf+0x2c>
    }
  }
}
 7e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7e9:	5b                   	pop    %ebx
 7ea:	5e                   	pop    %esi
 7eb:	5f                   	pop    %edi
 7ec:	5d                   	pop    %ebp
 7ed:	c3                   	ret    

000007ee <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
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
=======
 7ee:	55                   	push   %ebp
 7ef:	89 e5                	mov    %esp,%ebp
 7f1:	57                   	push   %edi
 7f2:	56                   	push   %esi
 7f3:	53                   	push   %ebx
 7f4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7f7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7fa:	a1 00 11 00 00       	mov    0x1100,%eax
 7ff:	eb 02                	jmp    803 <free+0x15>
 801:	89 d0                	mov    %edx,%eax
 803:	39 c8                	cmp    %ecx,%eax
 805:	73 04                	jae    80b <free+0x1d>
 807:	39 08                	cmp    %ecx,(%eax)
 809:	77 12                	ja     81d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80b:	8b 10                	mov    (%eax),%edx
 80d:	39 c2                	cmp    %eax,%edx
 80f:	77 f0                	ja     801 <free+0x13>
 811:	39 c8                	cmp    %ecx,%eax
 813:	72 08                	jb     81d <free+0x2f>
 815:	39 ca                	cmp    %ecx,%edx
 817:	77 04                	ja     81d <free+0x2f>
 819:	89 d0                	mov    %edx,%eax
 81b:	eb e6                	jmp    803 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 81d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 820:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 823:	8b 10                	mov    (%eax),%edx
 825:	39 d7                	cmp    %edx,%edi
 827:	74 19                	je     842 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 840:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 843:	8b 50 04             	mov    0x4(%eax),%edx
 846:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 849:	39 ce                	cmp    %ecx,%esi
 84b:	74 1b                	je     868 <free+0x63>
=======
 829:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 82c:	8b 50 04             	mov    0x4(%eax),%edx
 82f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 832:	39 ce                	cmp    %ecx,%esi
 834:	74 1b                	je     851 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
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
=======
 836:	89 08                	mov    %ecx,(%eax)
  freep = p;
 838:	a3 00 11 00 00       	mov    %eax,0x1100
}
 83d:	5b                   	pop    %ebx
 83e:	5e                   	pop    %esi
 83f:	5f                   	pop    %edi
 840:	5d                   	pop    %ebp
 841:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 842:	03 72 04             	add    0x4(%edx),%esi
 845:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 848:	8b 10                	mov    (%eax),%edx
 84a:	8b 12                	mov    (%edx),%edx
 84c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 84f:	eb db                	jmp    82c <free+0x3e>
    p->s.size += bp->s.size;
 851:	03 53 fc             	add    -0x4(%ebx),%edx
 854:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 857:	8b 53 f8             	mov    -0x8(%ebx),%edx
 85a:	89 10                	mov    %edx,(%eax)
 85c:	eb da                	jmp    838 <free+0x4a>

0000085e <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 875:	55                   	push   %ebp
 876:	89 e5                	mov    %esp,%ebp
 878:	53                   	push   %ebx
 879:	83 ec 04             	sub    $0x4,%esp
 87c:	89 c3                	mov    %eax,%ebx
=======
 85e:	55                   	push   %ebp
 85f:	89 e5                	mov    %esp,%ebp
 861:	53                   	push   %ebx
 862:	83 ec 04             	sub    $0x4,%esp
 865:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
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
=======
 867:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 86c:	77 05                	ja     873 <morecore+0x15>
    nu = 4096;
 86e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 873:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 87a:	83 ec 0c             	sub    $0xc,%esp
 87d:	50                   	push   %eax
 87e:	e8 38 fd ff ff       	call   5bb <sbrk>
  if(p == (char*)-1)
 883:	83 c4 10             	add    $0x10,%esp
 886:	83 f8 ff             	cmp    $0xffffffff,%eax
 889:	74 1c                	je     8a7 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 88b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 88e:	83 c0 08             	add    $0x8,%eax
 891:	83 ec 0c             	sub    $0xc,%esp
 894:	50                   	push   %eax
 895:	e8 54 ff ff ff       	call   7ee <free>
  return freep;
 89a:	a1 00 11 00 00       	mov    0x1100,%eax
 89f:	83 c4 10             	add    $0x10,%esp
}
 8a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a5:	c9                   	leave  
 8a6:	c3                   	ret    
    return 0;
 8a7:	b8 00 00 00 00       	mov    $0x0,%eax
 8ac:	eb f4                	jmp    8a2 <morecore+0x44>

000008ae <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 8c5:	55                   	push   %ebp
 8c6:	89 e5                	mov    %esp,%ebp
 8c8:	53                   	push   %ebx
 8c9:	83 ec 04             	sub    $0x4,%esp
=======
 8ae:	55                   	push   %ebp
 8af:	89 e5                	mov    %esp,%ebp
 8b1:	53                   	push   %ebx
 8b2:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 8cc:	8b 45 08             	mov    0x8(%ebp),%eax
 8cf:	8d 58 07             	lea    0x7(%eax),%ebx
 8d2:	c1 eb 03             	shr    $0x3,%ebx
 8d5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8d8:	8b 0d 00 0f 00 00    	mov    0xf00,%ecx
 8de:	85 c9                	test   %ecx,%ecx
 8e0:	74 04                	je     8e6 <malloc+0x21>
=======
 8b5:	8b 45 08             	mov    0x8(%ebp),%eax
 8b8:	8d 58 07             	lea    0x7(%eax),%ebx
 8bb:	c1 eb 03             	shr    $0x3,%ebx
 8be:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8c1:	8b 0d 00 11 00 00    	mov    0x1100,%ecx
 8c7:	85 c9                	test   %ecx,%ecx
 8c9:	74 04                	je     8cf <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
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
=======
 8cb:	8b 01                	mov    (%ecx),%eax
 8cd:	eb 4a                	jmp    919 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8cf:	c7 05 00 11 00 00 04 	movl   $0x1104,0x1100
 8d6:	11 00 00 
 8d9:	c7 05 04 11 00 00 04 	movl   $0x1104,0x1104
 8e0:	11 00 00 
    base.s.size = 0;
 8e3:	c7 05 08 11 00 00 00 	movl   $0x0,0x1108
 8ea:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8ed:	b9 04 11 00 00       	mov    $0x1104,%ecx
 8f2:	eb d7                	jmp    8cb <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8f4:	74 19                	je     90f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8f6:	29 da                	sub    %ebx,%edx
 8f8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8fb:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8fe:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 901:	89 0d 00 11 00 00    	mov    %ecx,0x1100
      return (void*)(p + 1);
 907:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
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
=======
 90a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 90d:	c9                   	leave  
 90e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 90f:	8b 10                	mov    (%eax),%edx
 911:	89 11                	mov    %edx,(%ecx)
 913:	eb ec                	jmp    901 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 915:	89 c1                	mov    %eax,%ecx
 917:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 919:	8b 50 04             	mov    0x4(%eax),%edx
 91c:	39 da                	cmp    %ebx,%edx
 91e:	73 d4                	jae    8f4 <malloc+0x46>
    if(p == freep)
 920:	39 05 00 11 00 00    	cmp    %eax,0x1100
 926:	75 ed                	jne    915 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 928:	89 d8                	mov    %ebx,%eax
 92a:	e8 2f ff ff ff       	call   85e <morecore>
 92f:	85 c0                	test   %eax,%eax
 931:	75 e2                	jne    915 <malloc+0x67>
 933:	eb d5                	jmp    90a <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
