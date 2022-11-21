
_test_17:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void merge_sort(void *array, void *size);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
  12:	e8 36 06 00 00       	call   64d <getpid>
  17:	a3 84 0e 00 00       	mov    %eax,0xe84
   3. join both threads
   4. Merge function
   */


    int size = 11;
  1c:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 2c                	push   $0x2c
  28:	e8 1b 09 00 00       	call   948 <malloc>
  2d:	a3 80 0e 00 00       	mov    %eax,0xe80
    for(int i = 0; i < size; i++){
  32:	83 c4 10             	add    $0x10,%esp
  35:	ba 00 00 00 00       	mov    $0x0,%edx
  3a:	eb 11                	jmp    4d <main+0x4d>
        global[i] = size - i - 1;
  3c:	29 d0                	sub    %edx,%eax
  3e:	83 e8 01             	sub    $0x1,%eax
  41:	8b 0d 80 0e 00 00    	mov    0xe80,%ecx
  47:	89 04 91             	mov    %eax,(%ecx,%edx,4)
    for(int i = 0; i < size; i++){
  4a:	83 c2 01             	add    $0x1,%edx
  4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  50:	39 d0                	cmp    %edx,%eax
  52:	7f e8                	jg     3c <main+0x3c>
    }

   int thread_pid = thread_create(merge_sort, global, &size);
  54:	83 ec 04             	sub    $0x4,%esp
  57:	8d 45 f4             	lea    -0xc(%ebp),%eax
  5a:	50                   	push   %eax
  5b:	ff 35 80 0e 00 00    	push   0xe80
  61:	68 a3 02 00 00       	push   $0x2a3
  66:	e8 d4 02 00 00       	call   33f <thread_create>
  6b:	89 c3                	mov    %eax,%ebx
   assert(thread_pid > 0);
  6d:	83 c4 10             	add    $0x10,%esp
  70:	85 c0                	test   %eax,%eax
  72:	7e 6e                	jle    e2 <main+0xe2>

   int join_pid = thread_join();
  74:	e8 26 03 00 00       	call   39f <thread_join>
   assert(join_pid == thread_pid);
  79:	39 c3                	cmp    %eax,%ebx
  7b:	0f 85 aa 00 00 00    	jne    12b <main+0x12b>
   assert(global[0] == 0);
  81:	a1 80 0e 00 00       	mov    0xe80,%eax
  86:	83 38 00             	cmpl   $0x0,(%eax)
  89:	0f 85 e5 00 00 00    	jne    174 <main+0x174>
   assert(global[10] == 10); 
  8f:	83 78 28 0a          	cmpl   $0xa,0x28(%eax)
  93:	0f 84 24 01 00 00    	je     1bd <main+0x1bd>
  99:	6a 35                	push   $0x35
  9b:	68 d0 09 00 00       	push   $0x9d0
  a0:	68 da 09 00 00       	push   $0x9da
  a5:	6a 01                	push   $0x1
  a7:	e8 76 06 00 00       	call   722 <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 38 0a 00 00       	push   $0xa38
  b4:	68 f1 09 00 00       	push   $0x9f1
  b9:	6a 01                	push   $0x1
  bb:	e8 62 06 00 00       	call   722 <printf>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 05 0a 00 00       	push   $0xa05
  c8:	6a 01                	push   $0x1
  ca:	e8 53 06 00 00       	call   722 <printf>
  cf:	83 c4 04             	add    $0x4,%esp
  d2:	ff 35 84 0e 00 00    	push   0xe84
  d8:	e8 20 05 00 00       	call   5fd <kill>
  dd:	e8 eb 04 00 00       	call   5cd <exit>
   assert(thread_pid > 0);
  e2:	6a 30                	push   $0x30
  e4:	68 d0 09 00 00       	push   $0x9d0
  e9:	68 da 09 00 00       	push   $0x9da
  ee:	6a 01                	push   $0x1
  f0:	e8 2d 06 00 00       	call   722 <printf>
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	68 e2 09 00 00       	push   $0x9e2
  fd:	68 f1 09 00 00       	push   $0x9f1
 102:	6a 01                	push   $0x1
 104:	e8 19 06 00 00       	call   722 <printf>
 109:	83 c4 08             	add    $0x8,%esp
 10c:	68 05 0a 00 00       	push   $0xa05
 111:	6a 01                	push   $0x1
 113:	e8 0a 06 00 00       	call   722 <printf>
 118:	83 c4 04             	add    $0x4,%esp
 11b:	ff 35 84 0e 00 00    	push   0xe84
 121:	e8 d7 04 00 00       	call   5fd <kill>
 126:	e8 a2 04 00 00       	call   5cd <exit>
   assert(join_pid == thread_pid);
 12b:	6a 33                	push   $0x33
 12d:	68 d0 09 00 00       	push   $0x9d0
 132:	68 da 09 00 00       	push   $0x9da
 137:	6a 01                	push   $0x1
 139:	e8 e4 05 00 00       	call   722 <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 12 0a 00 00       	push   $0xa12
 146:	68 f1 09 00 00       	push   $0x9f1
 14b:	6a 01                	push   $0x1
 14d:	e8 d0 05 00 00       	call   722 <printf>
 152:	83 c4 08             	add    $0x8,%esp
 155:	68 05 0a 00 00       	push   $0xa05
 15a:	6a 01                	push   $0x1
 15c:	e8 c1 05 00 00       	call   722 <printf>
 161:	83 c4 04             	add    $0x4,%esp
 164:	ff 35 84 0e 00 00    	push   0xe84
 16a:	e8 8e 04 00 00       	call   5fd <kill>
 16f:	e8 59 04 00 00       	call   5cd <exit>
   assert(global[0] == 0);
 174:	6a 34                	push   $0x34
 176:	68 d0 09 00 00       	push   $0x9d0
 17b:	68 da 09 00 00       	push   $0x9da
 180:	6a 01                	push   $0x1
 182:	e8 9b 05 00 00       	call   722 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 29 0a 00 00       	push   $0xa29
 18f:	68 f1 09 00 00       	push   $0x9f1
 194:	6a 01                	push   $0x1
 196:	e8 87 05 00 00       	call   722 <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 05 0a 00 00       	push   $0xa05
 1a3:	6a 01                	push   $0x1
 1a5:	e8 78 05 00 00       	call   722 <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 84 0e 00 00    	push   0xe84
 1b3:	e8 45 04 00 00       	call   5fd <kill>
 1b8:	e8 10 04 00 00       	call   5cd <exit>

   printf(1, "TEST PASSED\n");
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	68 49 0a 00 00       	push   $0xa49
 1c5:	6a 01                	push   $0x1
 1c7:	e8 56 05 00 00       	call   722 <printf>
   exit();
 1cc:	e8 fc 03 00 00       	call   5cd <exit>

000001d1 <merge>:
}

void merge(int* array, int* array_right,int size_left, int size_right,int*temp_array){
 1d1:	55                   	push   %ebp
 1d2:	89 e5                	mov    %esp,%ebp
 1d4:	57                   	push   %edi
 1d5:	56                   	push   %esi
 1d6:	53                   	push   %ebx
 1d7:	83 ec 04             	sub    $0x4,%esp
    int i = 0;
    int j = 0;
    int k = 0;
 1da:	b8 00 00 00 00       	mov    $0x0,%eax
    int j = 0;
 1df:	ba 00 00 00 00       	mov    $0x0,%edx
    int i = 0;
 1e4:	b9 00 00 00 00       	mov    $0x0,%ecx
    while(i < size_left && j < size_right){
 1e9:	eb 0c                	jmp    1f7 <merge+0x26>
        if(array[i] < array_right[j]){
            temp_array[k] = array[i];
            i++;
        }
        else{
            temp_array[k] = array_right[j];
 1eb:	8b 7d 18             	mov    0x18(%ebp),%edi
 1ee:	89 34 87             	mov    %esi,(%edi,%eax,4)
            j++;
 1f1:	83 c2 01             	add    $0x1,%edx
        }
        k++;
 1f4:	83 c0 01             	add    $0x1,%eax
    while(i < size_left && j < size_right){
 1f7:	3b 4d 10             	cmp    0x10(%ebp),%ecx
 1fa:	0f 9c c3             	setl   %bl
 1fd:	89 de                	mov    %ebx,%esi
 1ff:	3b 55 14             	cmp    0x14(%ebp),%edx
 202:	0f 9c c3             	setl   %bl
 205:	89 df                	mov    %ebx,%edi
 207:	89 f3                	mov    %esi,%ebx
 209:	84 db                	test   %bl,%bl
 20b:	74 50                	je     25d <merge+0x8c>
 20d:	89 fb                	mov    %edi,%ebx
 20f:	84 db                	test   %bl,%bl
 211:	74 1b                	je     22e <merge+0x5d>
        if(array[i] < array_right[j]){
 213:	8b 7d 08             	mov    0x8(%ebp),%edi
 216:	8b 3c 8f             	mov    (%edi,%ecx,4),%edi
 219:	8b 75 0c             	mov    0xc(%ebp),%esi
 21c:	8b 34 96             	mov    (%esi,%edx,4),%esi
 21f:	39 f7                	cmp    %esi,%edi
 221:	7d c8                	jge    1eb <merge+0x1a>
            temp_array[k] = array[i];
 223:	8b 75 18             	mov    0x18(%ebp),%esi
 226:	89 3c 86             	mov    %edi,(%esi,%eax,4)
            i++;
 229:	83 c1 01             	add    $0x1,%ecx
 22c:	eb c6                	jmp    1f4 <merge+0x23>
 22e:	8b 7d 08             	mov    0x8(%ebp),%edi
 231:	8b 5d 18             	mov    0x18(%ebp),%ebx
 234:	89 55 f0             	mov    %edx,-0x10(%ebp)
 237:	8b 75 10             	mov    0x10(%ebp),%esi
 23a:	eb 0c                	jmp    248 <merge+0x77>
    }
    while(i < size_left){
        temp_array[k] = array[i];
 23c:	8b 14 8f             	mov    (%edi,%ecx,4),%edx
 23f:	89 14 83             	mov    %edx,(%ebx,%eax,4)
        i++;
 242:	83 c1 01             	add    $0x1,%ecx
        k++;
 245:	83 c0 01             	add    $0x1,%eax
    while(i < size_left){
 248:	39 f1                	cmp    %esi,%ecx
 24a:	7c f0                	jl     23c <merge+0x6b>
 24c:	8b 55 f0             	mov    -0x10(%ebp),%edx
 24f:	89 75 10             	mov    %esi,0x10(%ebp)
 252:	89 7d 08             	mov    %edi,0x8(%ebp)
 255:	8b 75 0c             	mov    0xc(%ebp),%esi
 258:	8b 4d 14             	mov    0x14(%ebp),%ecx
 25b:	eb 1a                	jmp    277 <merge+0xa6>
 25d:	89 55 f0             	mov    %edx,-0x10(%ebp)
 260:	8b 7d 08             	mov    0x8(%ebp),%edi
 263:	8b 75 10             	mov    0x10(%ebp),%esi
 266:	8b 5d 18             	mov    0x18(%ebp),%ebx
 269:	eb dd                	jmp    248 <merge+0x77>
    }
    while(j < size_right){
        temp_array[k] = array_right[j];
 26b:	8b 3c 96             	mov    (%esi,%edx,4),%edi
 26e:	89 3c 83             	mov    %edi,(%ebx,%eax,4)
        j++;
 271:	83 c2 01             	add    $0x1,%edx
        k++;
 274:	83 c0 01             	add    $0x1,%eax
    while(j < size_right){
 277:	39 ca                	cmp    %ecx,%edx
 279:	7c f0                	jl     26b <merge+0x9a>
    }
    for(int i = 0; i < size_left + size_right; i++){
 27b:	8b 7d 08             	mov    0x8(%ebp),%edi
 27e:	b8 00 00 00 00       	mov    $0x0,%eax
 283:	8b 4d 10             	mov    0x10(%ebp),%ecx
 286:	8b 75 14             	mov    0x14(%ebp),%esi
 289:	eb 09                	jmp    294 <merge+0xc3>
        array[i] = temp_array[i];
 28b:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 28e:	89 14 87             	mov    %edx,(%edi,%eax,4)
    for(int i = 0; i < size_left + size_right; i++){
 291:	83 c0 01             	add    $0x1,%eax
 294:	8d 14 31             	lea    (%ecx,%esi,1),%edx
 297:	39 c2                	cmp    %eax,%edx
 299:	7f f0                	jg     28b <merge+0xba>
    }
   
}
 29b:	83 c4 04             	add    $0x4,%esp
 29e:	5b                   	pop    %ebx
 29f:	5e                   	pop    %esi
 2a0:	5f                   	pop    %edi
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    

000002a3 <merge_sort>:

void merge_sort(void *arg1, void *arg2) {
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	57                   	push   %edi
 2a7:	56                   	push   %esi
 2a8:	53                   	push   %ebx
 2a9:	83 ec 1c             	sub    $0x1c,%esp
 2ac:	8b 75 08             	mov    0x8(%ebp),%esi
   int *array = (int*)arg1;
   int size = *(int*)arg2;
 2af:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b2:	8b 18                	mov    (%eax),%ebx

   if (size==1){
 2b4:	83 fb 01             	cmp    $0x1,%ebx
 2b7:	74 70                	je     329 <merge_sort+0x86>
       exit();
   }

   
   int size_left = size/2;
 2b9:	b9 02 00 00 00       	mov    $0x2,%ecx
 2be:	89 d8                	mov    %ebx,%eax
 2c0:	99                   	cltd   
 2c1:	f7 f9                	idiv   %ecx
 2c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   int size_right = size-size/2;
 2c6:	89 da                	mov    %ebx,%edx
 2c8:	29 c2                	sub    %eax,%edx
 2ca:	89 55 e0             	mov    %edx,-0x20(%ebp)

   int* array_right = (int*)(array + size_left);
 2cd:	8d 3c 86             	lea    (%esi,%eax,4),%edi
//    merge_sort(array_right, size_right);

//    int nested_thread_pid_l = thread_create(merge_sort, array, &size_left);
//    int nested_thread_pid_r = thread_create(merge_sort, array_right, &size_right);
   
   thread_create(merge_sort, array, &size_left);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 2d6:	50                   	push   %eax
 2d7:	56                   	push   %esi
 2d8:	68 a3 02 00 00       	push   $0x2a3
 2dd:	e8 5d 00 00 00       	call   33f <thread_create>
   thread_create(merge_sort, array_right, &size_right);
 2e2:	83 c4 0c             	add    $0xc,%esp
 2e5:	8d 45 e0             	lea    -0x20(%ebp),%eax
 2e8:	50                   	push   %eax
 2e9:	57                   	push   %edi
 2ea:	68 a3 02 00 00       	push   $0x2a3
 2ef:	e8 4b 00 00 00       	call   33f <thread_create>

   thread_join();
 2f4:	e8 a6 00 00 00       	call   39f <thread_join>
   thread_join();
 2f9:	e8 a1 00 00 00       	call   39f <thread_join>
 

//    int nested_join_pid_1 = thread_join();
//    int nested_join_pid_2 = thread_join();

   int* temp_array = malloc(size*sizeof(int));
 2fe:	c1 e3 02             	shl    $0x2,%ebx
 301:	89 1c 24             	mov    %ebx,(%esp)
 304:	e8 3f 06 00 00       	call   948 <malloc>
 309:	89 c3                	mov    %eax,%ebx

   merge(array,array_right,size_left,size_right,temp_array);
 30b:	89 04 24             	mov    %eax,(%esp)
 30e:	ff 75 e0             	push   -0x20(%ebp)
 311:	ff 75 e4             	push   -0x1c(%ebp)
 314:	57                   	push   %edi
 315:	56                   	push   %esi
 316:	e8 b6 fe ff ff       	call   1d1 <merge>

   free(temp_array);
 31b:	83 c4 14             	add    $0x14,%esp
 31e:	53                   	push   %ebx
 31f:	e8 64 05 00 00       	call   888 <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 324:	e8 a4 02 00 00       	call   5cd <exit>
       exit();
 329:	e8 9f 02 00 00       	call   5cd <exit>

0000032e <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 334:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 336:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 339:	89 08                	mov    %ecx,(%eax)
  return old;
}
 33b:	89 d0                	mov    %edx,%eax
 33d:	5d                   	pop    %ebp
 33e:	c3                   	ret    

0000033f <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 33f:	55                   	push   %ebp
 340:	89 e5                	mov    %esp,%ebp
 342:	53                   	push   %ebx
 343:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 346:	68 00 20 00 00       	push   $0x2000
 34b:	e8 f8 05 00 00       	call   948 <malloc>
  if(n_stack == 0){
 350:	83 c4 10             	add    $0x10,%esp
 353:	85 c0                	test   %eax,%eax
 355:	74 41                	je     398 <thread_create+0x59>
 357:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 359:	50                   	push   %eax
 35a:	ff 75 10             	push   0x10(%ebp)
 35d:	ff 75 0c             	push   0xc(%ebp)
 360:	ff 75 08             	push   0x8(%ebp)
 363:	e8 05 03 00 00       	call   66d <clone>

  for(int i=0; i<64; i++){
 368:	83 c4 10             	add    $0x10,%esp
 36b:	ba 00 00 00 00       	mov    $0x0,%edx
 370:	eb 03                	jmp    375 <thread_create+0x36>
 372:	83 c2 01             	add    $0x1,%edx
 375:	83 fa 3f             	cmp    $0x3f,%edx
 378:	7f 19                	jg     393 <thread_create+0x54>
    if(threads[i]->flag==0){
 37a:	8b 0c 95 a0 0e 00 00 	mov    0xea0(,%edx,4),%ecx
 381:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 385:	75 eb                	jne    372 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 387:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 389:	8b 14 95 a0 0e 00 00 	mov    0xea0(,%edx,4),%edx
 390:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 393:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 396:	c9                   	leave  
 397:	c3                   	ret    
    return -1;
 398:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 39d:	eb f4                	jmp    393 <thread_create+0x54>

0000039f <thread_join>:

//TODO: fix
int thread_join() {
 39f:	55                   	push   %ebp
 3a0:	89 e5                	mov    %esp,%ebp
 3a2:	56                   	push   %esi
 3a3:	53                   	push   %ebx
 3a4:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 3a7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3aa:	50                   	push   %eax
 3ab:	e8 c5 02 00 00       	call   675 <join>
 3b0:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 3b2:	83 c4 10             	add    $0x10,%esp
 3b5:	bb 00 00 00 00       	mov    $0x0,%ebx
 3ba:	eb 03                	jmp    3bf <thread_join+0x20>
 3bc:	83 c3 01             	add    $0x1,%ebx
 3bf:	83 fb 3f             	cmp    $0x3f,%ebx
 3c2:	7f 23                	jg     3e7 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 3c4:	8b 04 9d a0 0e 00 00 	mov    0xea0(,%ebx,4),%eax
 3cb:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 3cf:	75 eb                	jne    3bc <thread_join+0x1d>
 3d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3d4:	39 50 04             	cmp    %edx,0x4(%eax)
 3d7:	75 e3                	jne    3bc <thread_join+0x1d>
      free(stk_addr);
 3d9:	83 ec 0c             	sub    $0xc,%esp
 3dc:	52                   	push   %edx
 3dd:	e8 a6 04 00 00       	call   888 <free>
 3e2:	83 c4 10             	add    $0x10,%esp
 3e5:	eb d5                	jmp    3bc <thread_join+0x1d>
    }
  }
  return pid;
}
 3e7:	89 f0                	mov    %esi,%eax
 3e9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3ec:	5b                   	pop    %ebx
 3ed:	5e                   	pop    %esi
 3ee:	5d                   	pop    %ebp
 3ef:	c3                   	ret    

000003f0 <lock_acquire>:

void lock_acquire(lock_t *lock){
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	83 ec 04             	sub    $0x4,%esp
 3f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3fa:	83 ec 08             	sub    $0x8,%esp
 3fd:	6a 01                	push   $0x1
 3ff:	53                   	push   %ebx
 400:	e8 29 ff ff ff       	call   32e <test_and_set>
 405:	83 c4 10             	add    $0x10,%esp
 408:	83 f8 01             	cmp    $0x1,%eax
 40b:	74 ed                	je     3fa <lock_acquire+0xa>
    ;
}
 40d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 410:	c9                   	leave  
 411:	c3                   	ret    

00000412 <lock_release>:

void lock_release(lock_t *lock) {
 412:	55                   	push   %ebp
 413:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 415:	8b 45 08             	mov    0x8(%ebp),%eax
 418:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 41e:	5d                   	pop    %ebp
 41f:	c3                   	ret    

00000420 <lock_init>:

void lock_init(lock_t *lock) {
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 42c:	5d                   	pop    %ebp
 42d:	c3                   	ret    

0000042e <strcpy>:

char*
strcpy(char *s, const char *t)
{
 42e:	55                   	push   %ebp
 42f:	89 e5                	mov    %esp,%ebp
 431:	56                   	push   %esi
 432:	53                   	push   %ebx
 433:	8b 75 08             	mov    0x8(%ebp),%esi
 436:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 439:	89 f0                	mov    %esi,%eax
 43b:	89 d1                	mov    %edx,%ecx
 43d:	83 c2 01             	add    $0x1,%edx
 440:	89 c3                	mov    %eax,%ebx
 442:	83 c0 01             	add    $0x1,%eax
 445:	0f b6 09             	movzbl (%ecx),%ecx
 448:	88 0b                	mov    %cl,(%ebx)
 44a:	84 c9                	test   %cl,%cl
 44c:	75 ed                	jne    43b <strcpy+0xd>
    ;
  return os;
}
 44e:	89 f0                	mov    %esi,%eax
 450:	5b                   	pop    %ebx
 451:	5e                   	pop    %esi
 452:	5d                   	pop    %ebp
 453:	c3                   	ret    

00000454 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	8b 4d 08             	mov    0x8(%ebp),%ecx
 45a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 45d:	eb 06                	jmp    465 <strcmp+0x11>
    p++, q++;
 45f:	83 c1 01             	add    $0x1,%ecx
 462:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 465:	0f b6 01             	movzbl (%ecx),%eax
 468:	84 c0                	test   %al,%al
 46a:	74 04                	je     470 <strcmp+0x1c>
 46c:	3a 02                	cmp    (%edx),%al
 46e:	74 ef                	je     45f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 470:	0f b6 c0             	movzbl %al,%eax
 473:	0f b6 12             	movzbl (%edx),%edx
 476:	29 d0                	sub    %edx,%eax
}
 478:	5d                   	pop    %ebp
 479:	c3                   	ret    

0000047a <strlen>:

uint
strlen(const char *s)
{
 47a:	55                   	push   %ebp
 47b:	89 e5                	mov    %esp,%ebp
 47d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 480:	b8 00 00 00 00       	mov    $0x0,%eax
 485:	eb 03                	jmp    48a <strlen+0x10>
 487:	83 c0 01             	add    $0x1,%eax
 48a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 48e:	75 f7                	jne    487 <strlen+0xd>
    ;
  return n;
}
 490:	5d                   	pop    %ebp
 491:	c3                   	ret    

00000492 <memset>:

void*
memset(void *dst, int c, uint n)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	57                   	push   %edi
 496:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 499:	89 d7                	mov    %edx,%edi
 49b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 49e:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a1:	fc                   	cld    
 4a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4a4:	89 d0                	mov    %edx,%eax
 4a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4a9:	c9                   	leave  
 4aa:	c3                   	ret    

000004ab <strchr>:

char*
strchr(const char *s, char c)
{
 4ab:	55                   	push   %ebp
 4ac:	89 e5                	mov    %esp,%ebp
 4ae:	8b 45 08             	mov    0x8(%ebp),%eax
 4b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4b5:	eb 03                	jmp    4ba <strchr+0xf>
 4b7:	83 c0 01             	add    $0x1,%eax
 4ba:	0f b6 10             	movzbl (%eax),%edx
 4bd:	84 d2                	test   %dl,%dl
 4bf:	74 06                	je     4c7 <strchr+0x1c>
    if(*s == c)
 4c1:	38 ca                	cmp    %cl,%dl
 4c3:	75 f2                	jne    4b7 <strchr+0xc>
 4c5:	eb 05                	jmp    4cc <strchr+0x21>
      return (char*)s;
  return 0;
 4c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4cc:	5d                   	pop    %ebp
 4cd:	c3                   	ret    

000004ce <gets>:

char*
gets(char *buf, int max)
{
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	57                   	push   %edi
 4d2:	56                   	push   %esi
 4d3:	53                   	push   %ebx
 4d4:	83 ec 1c             	sub    $0x1c,%esp
 4d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4da:	bb 00 00 00 00       	mov    $0x0,%ebx
 4df:	89 de                	mov    %ebx,%esi
 4e1:	83 c3 01             	add    $0x1,%ebx
 4e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4e7:	7d 2e                	jge    517 <gets+0x49>
    cc = read(0, &c, 1);
 4e9:	83 ec 04             	sub    $0x4,%esp
 4ec:	6a 01                	push   $0x1
 4ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4f1:	50                   	push   %eax
 4f2:	6a 00                	push   $0x0
 4f4:	e8 ec 00 00 00       	call   5e5 <read>
    if(cc < 1)
 4f9:	83 c4 10             	add    $0x10,%esp
 4fc:	85 c0                	test   %eax,%eax
 4fe:	7e 17                	jle    517 <gets+0x49>
      break;
    buf[i++] = c;
 500:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 504:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 507:	3c 0a                	cmp    $0xa,%al
 509:	0f 94 c2             	sete   %dl
 50c:	3c 0d                	cmp    $0xd,%al
 50e:	0f 94 c0             	sete   %al
 511:	08 c2                	or     %al,%dl
 513:	74 ca                	je     4df <gets+0x11>
    buf[i++] = c;
 515:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 517:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 51b:	89 f8                	mov    %edi,%eax
 51d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 520:	5b                   	pop    %ebx
 521:	5e                   	pop    %esi
 522:	5f                   	pop    %edi
 523:	5d                   	pop    %ebp
 524:	c3                   	ret    

00000525 <stat>:

int
stat(const char *n, struct stat *st)
{
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	56                   	push   %esi
 529:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 52a:	83 ec 08             	sub    $0x8,%esp
 52d:	6a 00                	push   $0x0
 52f:	ff 75 08             	push   0x8(%ebp)
 532:	e8 d6 00 00 00       	call   60d <open>
  if(fd < 0)
 537:	83 c4 10             	add    $0x10,%esp
 53a:	85 c0                	test   %eax,%eax
 53c:	78 24                	js     562 <stat+0x3d>
 53e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 540:	83 ec 08             	sub    $0x8,%esp
 543:	ff 75 0c             	push   0xc(%ebp)
 546:	50                   	push   %eax
 547:	e8 d9 00 00 00       	call   625 <fstat>
 54c:	89 c6                	mov    %eax,%esi
  close(fd);
 54e:	89 1c 24             	mov    %ebx,(%esp)
 551:	e8 9f 00 00 00       	call   5f5 <close>
  return r;
 556:	83 c4 10             	add    $0x10,%esp
}
 559:	89 f0                	mov    %esi,%eax
 55b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 55e:	5b                   	pop    %ebx
 55f:	5e                   	pop    %esi
 560:	5d                   	pop    %ebp
 561:	c3                   	ret    
    return -1;
 562:	be ff ff ff ff       	mov    $0xffffffff,%esi
 567:	eb f0                	jmp    559 <stat+0x34>

00000569 <atoi>:

int
atoi(const char *s)
{
 569:	55                   	push   %ebp
 56a:	89 e5                	mov    %esp,%ebp
 56c:	53                   	push   %ebx
 56d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 570:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 575:	eb 10                	jmp    587 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 577:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 57a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 57d:	83 c1 01             	add    $0x1,%ecx
 580:	0f be c0             	movsbl %al,%eax
 583:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 587:	0f b6 01             	movzbl (%ecx),%eax
 58a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 58d:	80 fb 09             	cmp    $0x9,%bl
 590:	76 e5                	jbe    577 <atoi+0xe>
  return n;
}
 592:	89 d0                	mov    %edx,%eax
 594:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 597:	c9                   	leave  
 598:	c3                   	ret    

00000599 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 599:	55                   	push   %ebp
 59a:	89 e5                	mov    %esp,%ebp
 59c:	56                   	push   %esi
 59d:	53                   	push   %ebx
 59e:	8b 75 08             	mov    0x8(%ebp),%esi
 5a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5a9:	eb 0d                	jmp    5b8 <memmove+0x1f>
    *dst++ = *src++;
 5ab:	0f b6 01             	movzbl (%ecx),%eax
 5ae:	88 02                	mov    %al,(%edx)
 5b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 5b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5b6:	89 d8                	mov    %ebx,%eax
 5b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5bb:	85 c0                	test   %eax,%eax
 5bd:	7f ec                	jg     5ab <memmove+0x12>
  return vdst;
}
 5bf:	89 f0                	mov    %esi,%eax
 5c1:	5b                   	pop    %ebx
 5c2:	5e                   	pop    %esi
 5c3:	5d                   	pop    %ebp
 5c4:	c3                   	ret    

000005c5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c5:	b8 01 00 00 00       	mov    $0x1,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <exit>:
SYSCALL(exit)
 5cd:	b8 02 00 00 00       	mov    $0x2,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <wait>:
SYSCALL(wait)
 5d5:	b8 03 00 00 00       	mov    $0x3,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <pipe>:
SYSCALL(pipe)
 5dd:	b8 04 00 00 00       	mov    $0x4,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <read>:
SYSCALL(read)
 5e5:	b8 05 00 00 00       	mov    $0x5,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <write>:
SYSCALL(write)
 5ed:	b8 10 00 00 00       	mov    $0x10,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <close>:
SYSCALL(close)
 5f5:	b8 15 00 00 00       	mov    $0x15,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <kill>:
SYSCALL(kill)
 5fd:	b8 06 00 00 00       	mov    $0x6,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <exec>:
SYSCALL(exec)
 605:	b8 07 00 00 00       	mov    $0x7,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <open>:
SYSCALL(open)
 60d:	b8 0f 00 00 00       	mov    $0xf,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <mknod>:
SYSCALL(mknod)
 615:	b8 11 00 00 00       	mov    $0x11,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <unlink>:
SYSCALL(unlink)
 61d:	b8 12 00 00 00       	mov    $0x12,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <fstat>:
SYSCALL(fstat)
 625:	b8 08 00 00 00       	mov    $0x8,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <link>:
SYSCALL(link)
 62d:	b8 13 00 00 00       	mov    $0x13,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <mkdir>:
SYSCALL(mkdir)
 635:	b8 14 00 00 00       	mov    $0x14,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <chdir>:
SYSCALL(chdir)
 63d:	b8 09 00 00 00       	mov    $0x9,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <dup>:
SYSCALL(dup)
 645:	b8 0a 00 00 00       	mov    $0xa,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <getpid>:
SYSCALL(getpid)
 64d:	b8 0b 00 00 00       	mov    $0xb,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <sbrk>:
SYSCALL(sbrk)
 655:	b8 0c 00 00 00       	mov    $0xc,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <sleep>:
SYSCALL(sleep)
 65d:	b8 0d 00 00 00       	mov    $0xd,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <uptime>:
SYSCALL(uptime)
 665:	b8 0e 00 00 00       	mov    $0xe,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <clone>:
SYSCALL(clone)
 66d:	b8 16 00 00 00       	mov    $0x16,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <join>:
 675:	b8 17 00 00 00       	mov    $0x17,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 67d:	55                   	push   %ebp
 67e:	89 e5                	mov    %esp,%ebp
 680:	83 ec 1c             	sub    $0x1c,%esp
 683:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 686:	6a 01                	push   $0x1
 688:	8d 55 f4             	lea    -0xc(%ebp),%edx
 68b:	52                   	push   %edx
 68c:	50                   	push   %eax
 68d:	e8 5b ff ff ff       	call   5ed <write>
}
 692:	83 c4 10             	add    $0x10,%esp
 695:	c9                   	leave  
 696:	c3                   	ret    

00000697 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 697:	55                   	push   %ebp
 698:	89 e5                	mov    %esp,%ebp
 69a:	57                   	push   %edi
 69b:	56                   	push   %esi
 69c:	53                   	push   %ebx
 69d:	83 ec 2c             	sub    $0x2c,%esp
 6a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6a3:	89 d0                	mov    %edx,%eax
 6a5:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6a7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6ab:	0f 95 c1             	setne  %cl
 6ae:	c1 ea 1f             	shr    $0x1f,%edx
 6b1:	84 d1                	test   %dl,%cl
 6b3:	74 44                	je     6f9 <printint+0x62>
    neg = 1;
    x = -xx;
 6b5:	f7 d8                	neg    %eax
 6b7:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6b9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6c0:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6c5:	89 c8                	mov    %ecx,%eax
 6c7:	ba 00 00 00 00       	mov    $0x0,%edx
 6cc:	f7 f6                	div    %esi
 6ce:	89 df                	mov    %ebx,%edi
 6d0:	83 c3 01             	add    $0x1,%ebx
 6d3:	0f b6 92 b8 0a 00 00 	movzbl 0xab8(%edx),%edx
 6da:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6de:	89 ca                	mov    %ecx,%edx
 6e0:	89 c1                	mov    %eax,%ecx
 6e2:	39 d6                	cmp    %edx,%esi
 6e4:	76 df                	jbe    6c5 <printint+0x2e>
  if(neg)
 6e6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6ea:	74 31                	je     71d <printint+0x86>
    buf[i++] = '-';
 6ec:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6f1:	8d 5f 02             	lea    0x2(%edi),%ebx
 6f4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6f7:	eb 17                	jmp    710 <printint+0x79>
    x = xx;
 6f9:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6fb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 702:	eb bc                	jmp    6c0 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 704:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 709:	89 f0                	mov    %esi,%eax
 70b:	e8 6d ff ff ff       	call   67d <putc>
  while(--i >= 0)
 710:	83 eb 01             	sub    $0x1,%ebx
 713:	79 ef                	jns    704 <printint+0x6d>
}
 715:	83 c4 2c             	add    $0x2c,%esp
 718:	5b                   	pop    %ebx
 719:	5e                   	pop    %esi
 71a:	5f                   	pop    %edi
 71b:	5d                   	pop    %ebp
 71c:	c3                   	ret    
 71d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 720:	eb ee                	jmp    710 <printint+0x79>

00000722 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 722:	55                   	push   %ebp
 723:	89 e5                	mov    %esp,%ebp
 725:	57                   	push   %edi
 726:	56                   	push   %esi
 727:	53                   	push   %ebx
 728:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 72b:	8d 45 10             	lea    0x10(%ebp),%eax
 72e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 731:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 736:	bb 00 00 00 00       	mov    $0x0,%ebx
 73b:	eb 14                	jmp    751 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 73d:	89 fa                	mov    %edi,%edx
 73f:	8b 45 08             	mov    0x8(%ebp),%eax
 742:	e8 36 ff ff ff       	call   67d <putc>
 747:	eb 05                	jmp    74e <printf+0x2c>
      }
    } else if(state == '%'){
 749:	83 fe 25             	cmp    $0x25,%esi
 74c:	74 25                	je     773 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 74e:	83 c3 01             	add    $0x1,%ebx
 751:	8b 45 0c             	mov    0xc(%ebp),%eax
 754:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 758:	84 c0                	test   %al,%al
 75a:	0f 84 20 01 00 00    	je     880 <printf+0x15e>
    c = fmt[i] & 0xff;
 760:	0f be f8             	movsbl %al,%edi
 763:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 766:	85 f6                	test   %esi,%esi
 768:	75 df                	jne    749 <printf+0x27>
      if(c == '%'){
 76a:	83 f8 25             	cmp    $0x25,%eax
 76d:	75 ce                	jne    73d <printf+0x1b>
        state = '%';
 76f:	89 c6                	mov    %eax,%esi
 771:	eb db                	jmp    74e <printf+0x2c>
      if(c == 'd'){
 773:	83 f8 25             	cmp    $0x25,%eax
 776:	0f 84 cf 00 00 00    	je     84b <printf+0x129>
 77c:	0f 8c dd 00 00 00    	jl     85f <printf+0x13d>
 782:	83 f8 78             	cmp    $0x78,%eax
 785:	0f 8f d4 00 00 00    	jg     85f <printf+0x13d>
 78b:	83 f8 63             	cmp    $0x63,%eax
 78e:	0f 8c cb 00 00 00    	jl     85f <printf+0x13d>
 794:	83 e8 63             	sub    $0x63,%eax
 797:	83 f8 15             	cmp    $0x15,%eax
 79a:	0f 87 bf 00 00 00    	ja     85f <printf+0x13d>
 7a0:	ff 24 85 60 0a 00 00 	jmp    *0xa60(,%eax,4)
        printint(fd, *ap, 10, 1);
 7a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7aa:	8b 17                	mov    (%edi),%edx
 7ac:	83 ec 0c             	sub    $0xc,%esp
 7af:	6a 01                	push   $0x1
 7b1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7b6:	8b 45 08             	mov    0x8(%ebp),%eax
 7b9:	e8 d9 fe ff ff       	call   697 <printint>
        ap++;
 7be:	83 c7 04             	add    $0x4,%edi
 7c1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7c4:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7c7:	be 00 00 00 00       	mov    $0x0,%esi
 7cc:	eb 80                	jmp    74e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7d1:	8b 17                	mov    (%edi),%edx
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	6a 00                	push   $0x0
 7d8:	b9 10 00 00 00       	mov    $0x10,%ecx
 7dd:	8b 45 08             	mov    0x8(%ebp),%eax
 7e0:	e8 b2 fe ff ff       	call   697 <printint>
        ap++;
 7e5:	83 c7 04             	add    $0x4,%edi
 7e8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7eb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ee:	be 00 00 00 00       	mov    $0x0,%esi
 7f3:	e9 56 ff ff ff       	jmp    74e <printf+0x2c>
        s = (char*)*ap;
 7f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7fb:	8b 30                	mov    (%eax),%esi
        ap++;
 7fd:	83 c0 04             	add    $0x4,%eax
 800:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 803:	85 f6                	test   %esi,%esi
 805:	75 15                	jne    81c <printf+0xfa>
          s = "(null)";
 807:	be 56 0a 00 00       	mov    $0xa56,%esi
 80c:	eb 0e                	jmp    81c <printf+0xfa>
          putc(fd, *s);
 80e:	0f be d2             	movsbl %dl,%edx
 811:	8b 45 08             	mov    0x8(%ebp),%eax
 814:	e8 64 fe ff ff       	call   67d <putc>
          s++;
 819:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 81c:	0f b6 16             	movzbl (%esi),%edx
 81f:	84 d2                	test   %dl,%dl
 821:	75 eb                	jne    80e <printf+0xec>
      state = 0;
 823:	be 00 00 00 00       	mov    $0x0,%esi
 828:	e9 21 ff ff ff       	jmp    74e <printf+0x2c>
        putc(fd, *ap);
 82d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 830:	0f be 17             	movsbl (%edi),%edx
 833:	8b 45 08             	mov    0x8(%ebp),%eax
 836:	e8 42 fe ff ff       	call   67d <putc>
        ap++;
 83b:	83 c7 04             	add    $0x4,%edi
 83e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 841:	be 00 00 00 00       	mov    $0x0,%esi
 846:	e9 03 ff ff ff       	jmp    74e <printf+0x2c>
        putc(fd, c);
 84b:	89 fa                	mov    %edi,%edx
 84d:	8b 45 08             	mov    0x8(%ebp),%eax
 850:	e8 28 fe ff ff       	call   67d <putc>
      state = 0;
 855:	be 00 00 00 00       	mov    $0x0,%esi
 85a:	e9 ef fe ff ff       	jmp    74e <printf+0x2c>
        putc(fd, '%');
 85f:	ba 25 00 00 00       	mov    $0x25,%edx
 864:	8b 45 08             	mov    0x8(%ebp),%eax
 867:	e8 11 fe ff ff       	call   67d <putc>
        putc(fd, c);
 86c:	89 fa                	mov    %edi,%edx
 86e:	8b 45 08             	mov    0x8(%ebp),%eax
 871:	e8 07 fe ff ff       	call   67d <putc>
      state = 0;
 876:	be 00 00 00 00       	mov    $0x0,%esi
 87b:	e9 ce fe ff ff       	jmp    74e <printf+0x2c>
    }
  }
}
 880:	8d 65 f4             	lea    -0xc(%ebp),%esp
 883:	5b                   	pop    %ebx
 884:	5e                   	pop    %esi
 885:	5f                   	pop    %edi
 886:	5d                   	pop    %ebp
 887:	c3                   	ret    

00000888 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 888:	55                   	push   %ebp
 889:	89 e5                	mov    %esp,%ebp
 88b:	57                   	push   %edi
 88c:	56                   	push   %esi
 88d:	53                   	push   %ebx
 88e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 891:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 894:	a1 a0 0f 00 00       	mov    0xfa0,%eax
 899:	eb 02                	jmp    89d <free+0x15>
 89b:	89 d0                	mov    %edx,%eax
 89d:	39 c8                	cmp    %ecx,%eax
 89f:	73 04                	jae    8a5 <free+0x1d>
 8a1:	39 08                	cmp    %ecx,(%eax)
 8a3:	77 12                	ja     8b7 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a5:	8b 10                	mov    (%eax),%edx
 8a7:	39 c2                	cmp    %eax,%edx
 8a9:	77 f0                	ja     89b <free+0x13>
 8ab:	39 c8                	cmp    %ecx,%eax
 8ad:	72 08                	jb     8b7 <free+0x2f>
 8af:	39 ca                	cmp    %ecx,%edx
 8b1:	77 04                	ja     8b7 <free+0x2f>
 8b3:	89 d0                	mov    %edx,%eax
 8b5:	eb e6                	jmp    89d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8ba:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8bd:	8b 10                	mov    (%eax),%edx
 8bf:	39 d7                	cmp    %edx,%edi
 8c1:	74 19                	je     8dc <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8c3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8c6:	8b 50 04             	mov    0x4(%eax),%edx
 8c9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8cc:	39 ce                	cmp    %ecx,%esi
 8ce:	74 1b                	je     8eb <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8d0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8d2:	a3 a0 0f 00 00       	mov    %eax,0xfa0
}
 8d7:	5b                   	pop    %ebx
 8d8:	5e                   	pop    %esi
 8d9:	5f                   	pop    %edi
 8da:	5d                   	pop    %ebp
 8db:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8dc:	03 72 04             	add    0x4(%edx),%esi
 8df:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e2:	8b 10                	mov    (%eax),%edx
 8e4:	8b 12                	mov    (%edx),%edx
 8e6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8e9:	eb db                	jmp    8c6 <free+0x3e>
    p->s.size += bp->s.size;
 8eb:	03 53 fc             	add    -0x4(%ebx),%edx
 8ee:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8f4:	89 10                	mov    %edx,(%eax)
 8f6:	eb da                	jmp    8d2 <free+0x4a>

000008f8 <morecore>:

static Header*
morecore(uint nu)
{
 8f8:	55                   	push   %ebp
 8f9:	89 e5                	mov    %esp,%ebp
 8fb:	53                   	push   %ebx
 8fc:	83 ec 04             	sub    $0x4,%esp
 8ff:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 901:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 906:	77 05                	ja     90d <morecore+0x15>
    nu = 4096;
 908:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 90d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 914:	83 ec 0c             	sub    $0xc,%esp
 917:	50                   	push   %eax
 918:	e8 38 fd ff ff       	call   655 <sbrk>
  if(p == (char*)-1)
 91d:	83 c4 10             	add    $0x10,%esp
 920:	83 f8 ff             	cmp    $0xffffffff,%eax
 923:	74 1c                	je     941 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 925:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 928:	83 c0 08             	add    $0x8,%eax
 92b:	83 ec 0c             	sub    $0xc,%esp
 92e:	50                   	push   %eax
 92f:	e8 54 ff ff ff       	call   888 <free>
  return freep;
 934:	a1 a0 0f 00 00       	mov    0xfa0,%eax
 939:	83 c4 10             	add    $0x10,%esp
}
 93c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 93f:	c9                   	leave  
 940:	c3                   	ret    
    return 0;
 941:	b8 00 00 00 00       	mov    $0x0,%eax
 946:	eb f4                	jmp    93c <morecore+0x44>

00000948 <malloc>:

void*
malloc(uint nbytes)
{
 948:	55                   	push   %ebp
 949:	89 e5                	mov    %esp,%ebp
 94b:	53                   	push   %ebx
 94c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 94f:	8b 45 08             	mov    0x8(%ebp),%eax
 952:	8d 58 07             	lea    0x7(%eax),%ebx
 955:	c1 eb 03             	shr    $0x3,%ebx
 958:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 95b:	8b 0d a0 0f 00 00    	mov    0xfa0,%ecx
 961:	85 c9                	test   %ecx,%ecx
 963:	74 04                	je     969 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 965:	8b 01                	mov    (%ecx),%eax
 967:	eb 4a                	jmp    9b3 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 969:	c7 05 a0 0f 00 00 a4 	movl   $0xfa4,0xfa0
 970:	0f 00 00 
 973:	c7 05 a4 0f 00 00 a4 	movl   $0xfa4,0xfa4
 97a:	0f 00 00 
    base.s.size = 0;
 97d:	c7 05 a8 0f 00 00 00 	movl   $0x0,0xfa8
 984:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 987:	b9 a4 0f 00 00       	mov    $0xfa4,%ecx
 98c:	eb d7                	jmp    965 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 98e:	74 19                	je     9a9 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 990:	29 da                	sub    %ebx,%edx
 992:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 995:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 998:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 99b:	89 0d a0 0f 00 00    	mov    %ecx,0xfa0
      return (void*)(p + 1);
 9a1:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9a7:	c9                   	leave  
 9a8:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9a9:	8b 10                	mov    (%eax),%edx
 9ab:	89 11                	mov    %edx,(%ecx)
 9ad:	eb ec                	jmp    99b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9af:	89 c1                	mov    %eax,%ecx
 9b1:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9b3:	8b 50 04             	mov    0x4(%eax),%edx
 9b6:	39 da                	cmp    %ebx,%edx
 9b8:	73 d4                	jae    98e <malloc+0x46>
    if(p == freep)
 9ba:	39 05 a0 0f 00 00    	cmp    %eax,0xfa0
 9c0:	75 ed                	jne    9af <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9c2:	89 d8                	mov    %ebx,%eax
 9c4:	e8 2f ff ff ff       	call   8f8 <morecore>
 9c9:	85 c0                	test   %eax,%eax
 9cb:	75 e2                	jne    9af <malloc+0x67>
 9cd:	eb d5                	jmp    9a4 <malloc+0x5c>
