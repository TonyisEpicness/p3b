
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
  12:	e8 c8 05 00 00       	call   5df <getpid>
  17:	a3 08 0e 00 00       	mov    %eax,0xe08
   3. join both threads
   4. Merge function
   */


    int size = 11;
  1c:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 2c                	push   $0x2c
  28:	e8 ad 08 00 00       	call   8da <malloc>
  2d:	a3 04 0e 00 00       	mov    %eax,0xe04
    for(int i = 0; i < size; i++){
  32:	83 c4 10             	add    $0x10,%esp
  35:	ba 00 00 00 00       	mov    $0x0,%edx
  3a:	eb 11                	jmp    4d <main+0x4d>
        global[i] = size - i - 1;
  3c:	29 d0                	sub    %edx,%eax
  3e:	83 e8 01             	sub    $0x1,%eax
  41:	8b 0d 04 0e 00 00    	mov    0xe04,%ecx
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
  5b:	ff 35 04 0e 00 00    	push   0xe04
  61:	68 a3 02 00 00       	push   $0x2a3
  66:	e8 d4 02 00 00       	call   33f <thread_create>
  6b:	89 c3                	mov    %eax,%ebx
   assert(thread_pid > 0);
  6d:	83 c4 10             	add    $0x10,%esp
  70:	85 c0                	test   %eax,%eax
  72:	7e 6e                	jle    e2 <main+0xe2>

   int join_pid = thread_join();
  74:	e8 f8 02 00 00       	call   371 <thread_join>
   assert(join_pid == thread_pid);
  79:	39 c3                	cmp    %eax,%ebx
  7b:	0f 85 aa 00 00 00    	jne    12b <main+0x12b>
   assert(global[0] == 0);
  81:	a1 04 0e 00 00       	mov    0xe04,%eax
  86:	83 38 00             	cmpl   $0x0,(%eax)
  89:	0f 85 e5 00 00 00    	jne    174 <main+0x174>
   assert(global[10] == 10); 
  8f:	83 78 28 0a          	cmpl   $0xa,0x28(%eax)
  93:	0f 84 24 01 00 00    	je     1bd <main+0x1bd>
  99:	6a 35                	push   $0x35
  9b:	68 64 09 00 00       	push   $0x964
  a0:	68 6e 09 00 00       	push   $0x96e
  a5:	6a 01                	push   $0x1
  a7:	e8 08 06 00 00       	call   6b4 <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 cc 09 00 00       	push   $0x9cc
  b4:	68 85 09 00 00       	push   $0x985
  b9:	6a 01                	push   $0x1
  bb:	e8 f4 05 00 00       	call   6b4 <printf>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 99 09 00 00       	push   $0x999
  c8:	6a 01                	push   $0x1
  ca:	e8 e5 05 00 00       	call   6b4 <printf>
  cf:	83 c4 04             	add    $0x4,%esp
  d2:	ff 35 08 0e 00 00    	push   0xe08
  d8:	e8 b2 04 00 00       	call   58f <kill>
  dd:	e8 7d 04 00 00       	call   55f <exit>
   assert(thread_pid > 0);
  e2:	6a 30                	push   $0x30
  e4:	68 64 09 00 00       	push   $0x964
  e9:	68 6e 09 00 00       	push   $0x96e
  ee:	6a 01                	push   $0x1
  f0:	e8 bf 05 00 00       	call   6b4 <printf>
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	68 76 09 00 00       	push   $0x976
  fd:	68 85 09 00 00       	push   $0x985
 102:	6a 01                	push   $0x1
 104:	e8 ab 05 00 00       	call   6b4 <printf>
 109:	83 c4 08             	add    $0x8,%esp
 10c:	68 99 09 00 00       	push   $0x999
 111:	6a 01                	push   $0x1
 113:	e8 9c 05 00 00       	call   6b4 <printf>
 118:	83 c4 04             	add    $0x4,%esp
 11b:	ff 35 08 0e 00 00    	push   0xe08
 121:	e8 69 04 00 00       	call   58f <kill>
 126:	e8 34 04 00 00       	call   55f <exit>
   assert(join_pid == thread_pid);
 12b:	6a 33                	push   $0x33
 12d:	68 64 09 00 00       	push   $0x964
 132:	68 6e 09 00 00       	push   $0x96e
 137:	6a 01                	push   $0x1
 139:	e8 76 05 00 00       	call   6b4 <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 a6 09 00 00       	push   $0x9a6
 146:	68 85 09 00 00       	push   $0x985
 14b:	6a 01                	push   $0x1
 14d:	e8 62 05 00 00       	call   6b4 <printf>
 152:	83 c4 08             	add    $0x8,%esp
 155:	68 99 09 00 00       	push   $0x999
 15a:	6a 01                	push   $0x1
 15c:	e8 53 05 00 00       	call   6b4 <printf>
 161:	83 c4 04             	add    $0x4,%esp
 164:	ff 35 08 0e 00 00    	push   0xe08
 16a:	e8 20 04 00 00       	call   58f <kill>
 16f:	e8 eb 03 00 00       	call   55f <exit>
   assert(global[0] == 0);
 174:	6a 34                	push   $0x34
 176:	68 64 09 00 00       	push   $0x964
 17b:	68 6e 09 00 00       	push   $0x96e
 180:	6a 01                	push   $0x1
 182:	e8 2d 05 00 00       	call   6b4 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 bd 09 00 00       	push   $0x9bd
 18f:	68 85 09 00 00       	push   $0x985
 194:	6a 01                	push   $0x1
 196:	e8 19 05 00 00       	call   6b4 <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 99 09 00 00       	push   $0x999
 1a3:	6a 01                	push   $0x1
 1a5:	e8 0a 05 00 00       	call   6b4 <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 08 0e 00 00    	push   0xe08
 1b3:	e8 d7 03 00 00       	call   58f <kill>
 1b8:	e8 a2 03 00 00       	call   55f <exit>

   printf(1, "TEST PASSED\n");
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	68 dd 09 00 00       	push   $0x9dd
 1c5:	6a 01                	push   $0x1
 1c7:	e8 e8 04 00 00       	call   6b4 <printf>
   exit();
 1cc:	e8 8e 03 00 00       	call   55f <exit>

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
 2f4:	e8 78 00 00 00       	call   371 <thread_join>
   thread_join();
 2f9:	e8 73 00 00 00       	call   371 <thread_join>
 

//    int nested_join_pid_1 = thread_join();
//    int nested_join_pid_2 = thread_join();

   int* temp_array = malloc(size*sizeof(int));
 2fe:	c1 e3 02             	shl    $0x2,%ebx
 301:	89 1c 24             	mov    %ebx,(%esp)
 304:	e8 d1 05 00 00       	call   8da <malloc>
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
 31f:	e8 f6 04 00 00       	call   81a <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 324:	e8 36 02 00 00       	call   55f <exit>
       exit();
 329:	e8 31 02 00 00       	call   55f <exit>

0000032e <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

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
 342:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 345:	68 00 20 00 00       	push   $0x2000
 34a:	e8 8b 05 00 00       	call   8da <malloc>
  if(n_stack == 0){
 34f:	83 c4 10             	add    $0x10,%esp
 352:	85 c0                	test   %eax,%eax
 354:	74 14                	je     36a <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 356:	50                   	push   %eax
 357:	ff 75 10             	push   0x10(%ebp)
 35a:	ff 75 0c             	push   0xc(%ebp)
 35d:	ff 75 08             	push   0x8(%ebp)
 360:	e8 9a 02 00 00       	call   5ff <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 365:	83 c4 10             	add    $0x10,%esp
}
 368:	c9                   	leave  
 369:	c3                   	ret    
    return -1;
 36a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 36f:	eb f7                	jmp    368 <thread_create+0x29>

00000371 <thread_join>:

int thread_join() {
 371:	55                   	push   %ebp
 372:	89 e5                	mov    %esp,%ebp
 374:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 377:	8d 45 f4             	lea    -0xc(%ebp),%eax
 37a:	50                   	push   %eax
 37b:	e8 87 02 00 00       	call   607 <join>
  
  return pid;
}
 380:	c9                   	leave  
 381:	c3                   	ret    

00000382 <lock_acquire>:

void lock_acquire(lock_t *lock){
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	53                   	push   %ebx
 386:	83 ec 04             	sub    $0x4,%esp
 389:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 38c:	83 ec 08             	sub    $0x8,%esp
 38f:	6a 01                	push   $0x1
 391:	53                   	push   %ebx
 392:	e8 97 ff ff ff       	call   32e <test_and_set>
 397:	83 c4 10             	add    $0x10,%esp
 39a:	83 f8 01             	cmp    $0x1,%eax
 39d:	74 ed                	je     38c <lock_acquire+0xa>
    ;
}
 39f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a2:	c9                   	leave  
 3a3:	c3                   	ret    

000003a4 <lock_release>:

void lock_release(lock_t *lock) {
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3b0:	5d                   	pop    %ebp
 3b1:	c3                   	ret    

000003b2 <lock_init>:

void lock_init(lock_t *lock) {
 3b2:	55                   	push   %ebp
 3b3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3b5:	8b 45 08             	mov    0x8(%ebp),%eax
 3b8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3be:	5d                   	pop    %ebp
 3bf:	c3                   	ret    

000003c0 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
 3c5:	8b 75 08             	mov    0x8(%ebp),%esi
 3c8:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3cb:	89 f0                	mov    %esi,%eax
 3cd:	89 d1                	mov    %edx,%ecx
 3cf:	83 c2 01             	add    $0x1,%edx
 3d2:	89 c3                	mov    %eax,%ebx
 3d4:	83 c0 01             	add    $0x1,%eax
 3d7:	0f b6 09             	movzbl (%ecx),%ecx
 3da:	88 0b                	mov    %cl,(%ebx)
 3dc:	84 c9                	test   %cl,%cl
 3de:	75 ed                	jne    3cd <strcpy+0xd>
    ;
  return os;
}
 3e0:	89 f0                	mov    %esi,%eax
 3e2:	5b                   	pop    %ebx
 3e3:	5e                   	pop    %esi
 3e4:	5d                   	pop    %ebp
 3e5:	c3                   	ret    

000003e6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3e6:	55                   	push   %ebp
 3e7:	89 e5                	mov    %esp,%ebp
 3e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3ef:	eb 06                	jmp    3f7 <strcmp+0x11>
    p++, q++;
 3f1:	83 c1 01             	add    $0x1,%ecx
 3f4:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3f7:	0f b6 01             	movzbl (%ecx),%eax
 3fa:	84 c0                	test   %al,%al
 3fc:	74 04                	je     402 <strcmp+0x1c>
 3fe:	3a 02                	cmp    (%edx),%al
 400:	74 ef                	je     3f1 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 402:	0f b6 c0             	movzbl %al,%eax
 405:	0f b6 12             	movzbl (%edx),%edx
 408:	29 d0                	sub    %edx,%eax
}
 40a:	5d                   	pop    %ebp
 40b:	c3                   	ret    

0000040c <strlen>:

uint
strlen(const char *s)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 412:	b8 00 00 00 00       	mov    $0x0,%eax
 417:	eb 03                	jmp    41c <strlen+0x10>
 419:	83 c0 01             	add    $0x1,%eax
 41c:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 420:	75 f7                	jne    419 <strlen+0xd>
    ;
  return n;
}
 422:	5d                   	pop    %ebp
 423:	c3                   	ret    

00000424 <memset>:

void*
memset(void *dst, int c, uint n)
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	57                   	push   %edi
 428:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 42b:	89 d7                	mov    %edx,%edi
 42d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 430:	8b 45 0c             	mov    0xc(%ebp),%eax
 433:	fc                   	cld    
 434:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 436:	89 d0                	mov    %edx,%eax
 438:	8b 7d fc             	mov    -0x4(%ebp),%edi
 43b:	c9                   	leave  
 43c:	c3                   	ret    

0000043d <strchr>:

char*
strchr(const char *s, char c)
{
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	8b 45 08             	mov    0x8(%ebp),%eax
 443:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 447:	eb 03                	jmp    44c <strchr+0xf>
 449:	83 c0 01             	add    $0x1,%eax
 44c:	0f b6 10             	movzbl (%eax),%edx
 44f:	84 d2                	test   %dl,%dl
 451:	74 06                	je     459 <strchr+0x1c>
    if(*s == c)
 453:	38 ca                	cmp    %cl,%dl
 455:	75 f2                	jne    449 <strchr+0xc>
 457:	eb 05                	jmp    45e <strchr+0x21>
      return (char*)s;
  return 0;
 459:	b8 00 00 00 00       	mov    $0x0,%eax
}
 45e:	5d                   	pop    %ebp
 45f:	c3                   	ret    

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 1c             	sub    $0x1c,%esp
 469:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 46c:	bb 00 00 00 00       	mov    $0x0,%ebx
 471:	89 de                	mov    %ebx,%esi
 473:	83 c3 01             	add    $0x1,%ebx
 476:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 479:	7d 2e                	jge    4a9 <gets+0x49>
    cc = read(0, &c, 1);
 47b:	83 ec 04             	sub    $0x4,%esp
 47e:	6a 01                	push   $0x1
 480:	8d 45 e7             	lea    -0x19(%ebp),%eax
 483:	50                   	push   %eax
 484:	6a 00                	push   $0x0
 486:	e8 ec 00 00 00       	call   577 <read>
    if(cc < 1)
 48b:	83 c4 10             	add    $0x10,%esp
 48e:	85 c0                	test   %eax,%eax
 490:	7e 17                	jle    4a9 <gets+0x49>
      break;
    buf[i++] = c;
 492:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 496:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 499:	3c 0a                	cmp    $0xa,%al
 49b:	0f 94 c2             	sete   %dl
 49e:	3c 0d                	cmp    $0xd,%al
 4a0:	0f 94 c0             	sete   %al
 4a3:	08 c2                	or     %al,%dl
 4a5:	74 ca                	je     471 <gets+0x11>
    buf[i++] = c;
 4a7:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4ad:	89 f8                	mov    %edi,%eax
 4af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b2:	5b                   	pop    %ebx
 4b3:	5e                   	pop    %esi
 4b4:	5f                   	pop    %edi
 4b5:	5d                   	pop    %ebp
 4b6:	c3                   	ret    

000004b7 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b7:	55                   	push   %ebp
 4b8:	89 e5                	mov    %esp,%ebp
 4ba:	56                   	push   %esi
 4bb:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4bc:	83 ec 08             	sub    $0x8,%esp
 4bf:	6a 00                	push   $0x0
 4c1:	ff 75 08             	push   0x8(%ebp)
 4c4:	e8 d6 00 00 00       	call   59f <open>
  if(fd < 0)
 4c9:	83 c4 10             	add    $0x10,%esp
 4cc:	85 c0                	test   %eax,%eax
 4ce:	78 24                	js     4f4 <stat+0x3d>
 4d0:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4d2:	83 ec 08             	sub    $0x8,%esp
 4d5:	ff 75 0c             	push   0xc(%ebp)
 4d8:	50                   	push   %eax
 4d9:	e8 d9 00 00 00       	call   5b7 <fstat>
 4de:	89 c6                	mov    %eax,%esi
  close(fd);
 4e0:	89 1c 24             	mov    %ebx,(%esp)
 4e3:	e8 9f 00 00 00       	call   587 <close>
  return r;
 4e8:	83 c4 10             	add    $0x10,%esp
}
 4eb:	89 f0                	mov    %esi,%eax
 4ed:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f0:	5b                   	pop    %ebx
 4f1:	5e                   	pop    %esi
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    
    return -1;
 4f4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f9:	eb f0                	jmp    4eb <stat+0x34>

000004fb <atoi>:

int
atoi(const char *s)
{
 4fb:	55                   	push   %ebp
 4fc:	89 e5                	mov    %esp,%ebp
 4fe:	53                   	push   %ebx
 4ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 502:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 507:	eb 10                	jmp    519 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 509:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 50c:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 50f:	83 c1 01             	add    $0x1,%ecx
 512:	0f be c0             	movsbl %al,%eax
 515:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 519:	0f b6 01             	movzbl (%ecx),%eax
 51c:	8d 58 d0             	lea    -0x30(%eax),%ebx
 51f:	80 fb 09             	cmp    $0x9,%bl
 522:	76 e5                	jbe    509 <atoi+0xe>
  return n;
}
 524:	89 d0                	mov    %edx,%eax
 526:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 529:	c9                   	leave  
 52a:	c3                   	ret    

0000052b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 52b:	55                   	push   %ebp
 52c:	89 e5                	mov    %esp,%ebp
 52e:	56                   	push   %esi
 52f:	53                   	push   %ebx
 530:	8b 75 08             	mov    0x8(%ebp),%esi
 533:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 536:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 539:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 53b:	eb 0d                	jmp    54a <memmove+0x1f>
    *dst++ = *src++;
 53d:	0f b6 01             	movzbl (%ecx),%eax
 540:	88 02                	mov    %al,(%edx)
 542:	8d 49 01             	lea    0x1(%ecx),%ecx
 545:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 548:	89 d8                	mov    %ebx,%eax
 54a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 54d:	85 c0                	test   %eax,%eax
 54f:	7f ec                	jg     53d <memmove+0x12>
  return vdst;
}
 551:	89 f0                	mov    %esi,%eax
 553:	5b                   	pop    %ebx
 554:	5e                   	pop    %esi
 555:	5d                   	pop    %ebp
 556:	c3                   	ret    

00000557 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 557:	b8 01 00 00 00       	mov    $0x1,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <exit>:
SYSCALL(exit)
 55f:	b8 02 00 00 00       	mov    $0x2,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <wait>:
SYSCALL(wait)
 567:	b8 03 00 00 00       	mov    $0x3,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <pipe>:
SYSCALL(pipe)
 56f:	b8 04 00 00 00       	mov    $0x4,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <read>:
SYSCALL(read)
 577:	b8 05 00 00 00       	mov    $0x5,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <write>:
SYSCALL(write)
 57f:	b8 10 00 00 00       	mov    $0x10,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <close>:
SYSCALL(close)
 587:	b8 15 00 00 00       	mov    $0x15,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <kill>:
SYSCALL(kill)
 58f:	b8 06 00 00 00       	mov    $0x6,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <exec>:
SYSCALL(exec)
 597:	b8 07 00 00 00       	mov    $0x7,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <open>:
SYSCALL(open)
 59f:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <mknod>:
SYSCALL(mknod)
 5a7:	b8 11 00 00 00       	mov    $0x11,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <unlink>:
SYSCALL(unlink)
 5af:	b8 12 00 00 00       	mov    $0x12,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <fstat>:
SYSCALL(fstat)
 5b7:	b8 08 00 00 00       	mov    $0x8,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <link>:
SYSCALL(link)
 5bf:	b8 13 00 00 00       	mov    $0x13,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <mkdir>:
SYSCALL(mkdir)
 5c7:	b8 14 00 00 00       	mov    $0x14,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <chdir>:
SYSCALL(chdir)
 5cf:	b8 09 00 00 00       	mov    $0x9,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <dup>:
SYSCALL(dup)
 5d7:	b8 0a 00 00 00       	mov    $0xa,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <getpid>:
SYSCALL(getpid)
 5df:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret    

000005e7 <sbrk>:
SYSCALL(sbrk)
 5e7:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ec:	cd 40                	int    $0x40
 5ee:	c3                   	ret    

000005ef <sleep>:
SYSCALL(sleep)
 5ef:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret    

000005f7 <uptime>:
SYSCALL(uptime)
 5f7:	b8 0e 00 00 00       	mov    $0xe,%eax
 5fc:	cd 40                	int    $0x40
 5fe:	c3                   	ret    

000005ff <clone>:
SYSCALL(clone)
 5ff:	b8 16 00 00 00       	mov    $0x16,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret    

00000607 <join>:
 607:	b8 17 00 00 00       	mov    $0x17,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret    

0000060f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 60f:	55                   	push   %ebp
 610:	89 e5                	mov    %esp,%ebp
 612:	83 ec 1c             	sub    $0x1c,%esp
 615:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 618:	6a 01                	push   $0x1
 61a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 61d:	52                   	push   %edx
 61e:	50                   	push   %eax
 61f:	e8 5b ff ff ff       	call   57f <write>
}
 624:	83 c4 10             	add    $0x10,%esp
 627:	c9                   	leave  
 628:	c3                   	ret    

00000629 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 629:	55                   	push   %ebp
 62a:	89 e5                	mov    %esp,%ebp
 62c:	57                   	push   %edi
 62d:	56                   	push   %esi
 62e:	53                   	push   %ebx
 62f:	83 ec 2c             	sub    $0x2c,%esp
 632:	89 45 d0             	mov    %eax,-0x30(%ebp)
 635:	89 d0                	mov    %edx,%eax
 637:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 639:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 63d:	0f 95 c1             	setne  %cl
 640:	c1 ea 1f             	shr    $0x1f,%edx
 643:	84 d1                	test   %dl,%cl
 645:	74 44                	je     68b <printint+0x62>
    neg = 1;
    x = -xx;
 647:	f7 d8                	neg    %eax
 649:	89 c1                	mov    %eax,%ecx
    neg = 1;
 64b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 652:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 657:	89 c8                	mov    %ecx,%eax
 659:	ba 00 00 00 00       	mov    $0x0,%edx
 65e:	f7 f6                	div    %esi
 660:	89 df                	mov    %ebx,%edi
 662:	83 c3 01             	add    $0x1,%ebx
 665:	0f b6 92 4c 0a 00 00 	movzbl 0xa4c(%edx),%edx
 66c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 670:	89 ca                	mov    %ecx,%edx
 672:	89 c1                	mov    %eax,%ecx
 674:	39 d6                	cmp    %edx,%esi
 676:	76 df                	jbe    657 <printint+0x2e>
  if(neg)
 678:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 67c:	74 31                	je     6af <printint+0x86>
    buf[i++] = '-';
 67e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 683:	8d 5f 02             	lea    0x2(%edi),%ebx
 686:	8b 75 d0             	mov    -0x30(%ebp),%esi
 689:	eb 17                	jmp    6a2 <printint+0x79>
    x = xx;
 68b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 68d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 694:	eb bc                	jmp    652 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 696:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 69b:	89 f0                	mov    %esi,%eax
 69d:	e8 6d ff ff ff       	call   60f <putc>
  while(--i >= 0)
 6a2:	83 eb 01             	sub    $0x1,%ebx
 6a5:	79 ef                	jns    696 <printint+0x6d>
}
 6a7:	83 c4 2c             	add    $0x2c,%esp
 6aa:	5b                   	pop    %ebx
 6ab:	5e                   	pop    %esi
 6ac:	5f                   	pop    %edi
 6ad:	5d                   	pop    %ebp
 6ae:	c3                   	ret    
 6af:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6b2:	eb ee                	jmp    6a2 <printint+0x79>

000006b4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	57                   	push   %edi
 6b8:	56                   	push   %esi
 6b9:	53                   	push   %ebx
 6ba:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6bd:	8d 45 10             	lea    0x10(%ebp),%eax
 6c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6c3:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6c8:	bb 00 00 00 00       	mov    $0x0,%ebx
 6cd:	eb 14                	jmp    6e3 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6cf:	89 fa                	mov    %edi,%edx
 6d1:	8b 45 08             	mov    0x8(%ebp),%eax
 6d4:	e8 36 ff ff ff       	call   60f <putc>
 6d9:	eb 05                	jmp    6e0 <printf+0x2c>
      }
    } else if(state == '%'){
 6db:	83 fe 25             	cmp    $0x25,%esi
 6de:	74 25                	je     705 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6e0:	83 c3 01             	add    $0x1,%ebx
 6e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e6:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6ea:	84 c0                	test   %al,%al
 6ec:	0f 84 20 01 00 00    	je     812 <printf+0x15e>
    c = fmt[i] & 0xff;
 6f2:	0f be f8             	movsbl %al,%edi
 6f5:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6f8:	85 f6                	test   %esi,%esi
 6fa:	75 df                	jne    6db <printf+0x27>
      if(c == '%'){
 6fc:	83 f8 25             	cmp    $0x25,%eax
 6ff:	75 ce                	jne    6cf <printf+0x1b>
        state = '%';
 701:	89 c6                	mov    %eax,%esi
 703:	eb db                	jmp    6e0 <printf+0x2c>
      if(c == 'd'){
 705:	83 f8 25             	cmp    $0x25,%eax
 708:	0f 84 cf 00 00 00    	je     7dd <printf+0x129>
 70e:	0f 8c dd 00 00 00    	jl     7f1 <printf+0x13d>
 714:	83 f8 78             	cmp    $0x78,%eax
 717:	0f 8f d4 00 00 00    	jg     7f1 <printf+0x13d>
 71d:	83 f8 63             	cmp    $0x63,%eax
 720:	0f 8c cb 00 00 00    	jl     7f1 <printf+0x13d>
 726:	83 e8 63             	sub    $0x63,%eax
 729:	83 f8 15             	cmp    $0x15,%eax
 72c:	0f 87 bf 00 00 00    	ja     7f1 <printf+0x13d>
 732:	ff 24 85 f4 09 00 00 	jmp    *0x9f4(,%eax,4)
        printint(fd, *ap, 10, 1);
 739:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 73c:	8b 17                	mov    (%edi),%edx
 73e:	83 ec 0c             	sub    $0xc,%esp
 741:	6a 01                	push   $0x1
 743:	b9 0a 00 00 00       	mov    $0xa,%ecx
 748:	8b 45 08             	mov    0x8(%ebp),%eax
 74b:	e8 d9 fe ff ff       	call   629 <printint>
        ap++;
 750:	83 c7 04             	add    $0x4,%edi
 753:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 756:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 759:	be 00 00 00 00       	mov    $0x0,%esi
 75e:	eb 80                	jmp    6e0 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 760:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 763:	8b 17                	mov    (%edi),%edx
 765:	83 ec 0c             	sub    $0xc,%esp
 768:	6a 00                	push   $0x0
 76a:	b9 10 00 00 00       	mov    $0x10,%ecx
 76f:	8b 45 08             	mov    0x8(%ebp),%eax
 772:	e8 b2 fe ff ff       	call   629 <printint>
        ap++;
 777:	83 c7 04             	add    $0x4,%edi
 77a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 77d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 780:	be 00 00 00 00       	mov    $0x0,%esi
 785:	e9 56 ff ff ff       	jmp    6e0 <printf+0x2c>
        s = (char*)*ap;
 78a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 78d:	8b 30                	mov    (%eax),%esi
        ap++;
 78f:	83 c0 04             	add    $0x4,%eax
 792:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 795:	85 f6                	test   %esi,%esi
 797:	75 15                	jne    7ae <printf+0xfa>
          s = "(null)";
 799:	be ea 09 00 00       	mov    $0x9ea,%esi
 79e:	eb 0e                	jmp    7ae <printf+0xfa>
          putc(fd, *s);
 7a0:	0f be d2             	movsbl %dl,%edx
 7a3:	8b 45 08             	mov    0x8(%ebp),%eax
 7a6:	e8 64 fe ff ff       	call   60f <putc>
          s++;
 7ab:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7ae:	0f b6 16             	movzbl (%esi),%edx
 7b1:	84 d2                	test   %dl,%dl
 7b3:	75 eb                	jne    7a0 <printf+0xec>
      state = 0;
 7b5:	be 00 00 00 00       	mov    $0x0,%esi
 7ba:	e9 21 ff ff ff       	jmp    6e0 <printf+0x2c>
        putc(fd, *ap);
 7bf:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c2:	0f be 17             	movsbl (%edi),%edx
 7c5:	8b 45 08             	mov    0x8(%ebp),%eax
 7c8:	e8 42 fe ff ff       	call   60f <putc>
        ap++;
 7cd:	83 c7 04             	add    $0x4,%edi
 7d0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7d3:	be 00 00 00 00       	mov    $0x0,%esi
 7d8:	e9 03 ff ff ff       	jmp    6e0 <printf+0x2c>
        putc(fd, c);
 7dd:	89 fa                	mov    %edi,%edx
 7df:	8b 45 08             	mov    0x8(%ebp),%eax
 7e2:	e8 28 fe ff ff       	call   60f <putc>
      state = 0;
 7e7:	be 00 00 00 00       	mov    $0x0,%esi
 7ec:	e9 ef fe ff ff       	jmp    6e0 <printf+0x2c>
        putc(fd, '%');
 7f1:	ba 25 00 00 00       	mov    $0x25,%edx
 7f6:	8b 45 08             	mov    0x8(%ebp),%eax
 7f9:	e8 11 fe ff ff       	call   60f <putc>
        putc(fd, c);
 7fe:	89 fa                	mov    %edi,%edx
 800:	8b 45 08             	mov    0x8(%ebp),%eax
 803:	e8 07 fe ff ff       	call   60f <putc>
      state = 0;
 808:	be 00 00 00 00       	mov    $0x0,%esi
 80d:	e9 ce fe ff ff       	jmp    6e0 <printf+0x2c>
    }
  }
}
 812:	8d 65 f4             	lea    -0xc(%ebp),%esp
 815:	5b                   	pop    %ebx
 816:	5e                   	pop    %esi
 817:	5f                   	pop    %edi
 818:	5d                   	pop    %ebp
 819:	c3                   	ret    

0000081a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 81a:	55                   	push   %ebp
 81b:	89 e5                	mov    %esp,%ebp
 81d:	57                   	push   %edi
 81e:	56                   	push   %esi
 81f:	53                   	push   %ebx
 820:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 823:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 826:	a1 0c 0e 00 00       	mov    0xe0c,%eax
 82b:	eb 02                	jmp    82f <free+0x15>
 82d:	89 d0                	mov    %edx,%eax
 82f:	39 c8                	cmp    %ecx,%eax
 831:	73 04                	jae    837 <free+0x1d>
 833:	39 08                	cmp    %ecx,(%eax)
 835:	77 12                	ja     849 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 837:	8b 10                	mov    (%eax),%edx
 839:	39 c2                	cmp    %eax,%edx
 83b:	77 f0                	ja     82d <free+0x13>
 83d:	39 c8                	cmp    %ecx,%eax
 83f:	72 08                	jb     849 <free+0x2f>
 841:	39 ca                	cmp    %ecx,%edx
 843:	77 04                	ja     849 <free+0x2f>
 845:	89 d0                	mov    %edx,%eax
 847:	eb e6                	jmp    82f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 849:	8b 73 fc             	mov    -0x4(%ebx),%esi
 84c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84f:	8b 10                	mov    (%eax),%edx
 851:	39 d7                	cmp    %edx,%edi
 853:	74 19                	je     86e <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 855:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 858:	8b 50 04             	mov    0x4(%eax),%edx
 85b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 85e:	39 ce                	cmp    %ecx,%esi
 860:	74 1b                	je     87d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 862:	89 08                	mov    %ecx,(%eax)
  freep = p;
 864:	a3 0c 0e 00 00       	mov    %eax,0xe0c
}
 869:	5b                   	pop    %ebx
 86a:	5e                   	pop    %esi
 86b:	5f                   	pop    %edi
 86c:	5d                   	pop    %ebp
 86d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 86e:	03 72 04             	add    0x4(%edx),%esi
 871:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 874:	8b 10                	mov    (%eax),%edx
 876:	8b 12                	mov    (%edx),%edx
 878:	89 53 f8             	mov    %edx,-0x8(%ebx)
 87b:	eb db                	jmp    858 <free+0x3e>
    p->s.size += bp->s.size;
 87d:	03 53 fc             	add    -0x4(%ebx),%edx
 880:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 883:	8b 53 f8             	mov    -0x8(%ebx),%edx
 886:	89 10                	mov    %edx,(%eax)
 888:	eb da                	jmp    864 <free+0x4a>

0000088a <morecore>:

static Header*
morecore(uint nu)
{
 88a:	55                   	push   %ebp
 88b:	89 e5                	mov    %esp,%ebp
 88d:	53                   	push   %ebx
 88e:	83 ec 04             	sub    $0x4,%esp
 891:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 893:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 898:	77 05                	ja     89f <morecore+0x15>
    nu = 4096;
 89a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 89f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8a6:	83 ec 0c             	sub    $0xc,%esp
 8a9:	50                   	push   %eax
 8aa:	e8 38 fd ff ff       	call   5e7 <sbrk>
  if(p == (char*)-1)
 8af:	83 c4 10             	add    $0x10,%esp
 8b2:	83 f8 ff             	cmp    $0xffffffff,%eax
 8b5:	74 1c                	je     8d3 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8b7:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8ba:	83 c0 08             	add    $0x8,%eax
 8bd:	83 ec 0c             	sub    $0xc,%esp
 8c0:	50                   	push   %eax
 8c1:	e8 54 ff ff ff       	call   81a <free>
  return freep;
 8c6:	a1 0c 0e 00 00       	mov    0xe0c,%eax
 8cb:	83 c4 10             	add    $0x10,%esp
}
 8ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d1:	c9                   	leave  
 8d2:	c3                   	ret    
    return 0;
 8d3:	b8 00 00 00 00       	mov    $0x0,%eax
 8d8:	eb f4                	jmp    8ce <morecore+0x44>

000008da <malloc>:

void*
malloc(uint nbytes)
{
 8da:	55                   	push   %ebp
 8db:	89 e5                	mov    %esp,%ebp
 8dd:	53                   	push   %ebx
 8de:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e1:	8b 45 08             	mov    0x8(%ebp),%eax
 8e4:	8d 58 07             	lea    0x7(%eax),%ebx
 8e7:	c1 eb 03             	shr    $0x3,%ebx
 8ea:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8ed:	8b 0d 0c 0e 00 00    	mov    0xe0c,%ecx
 8f3:	85 c9                	test   %ecx,%ecx
 8f5:	74 04                	je     8fb <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f7:	8b 01                	mov    (%ecx),%eax
 8f9:	eb 4a                	jmp    945 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8fb:	c7 05 0c 0e 00 00 10 	movl   $0xe10,0xe0c
 902:	0e 00 00 
 905:	c7 05 10 0e 00 00 10 	movl   $0xe10,0xe10
 90c:	0e 00 00 
    base.s.size = 0;
 90f:	c7 05 14 0e 00 00 00 	movl   $0x0,0xe14
 916:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 919:	b9 10 0e 00 00       	mov    $0xe10,%ecx
 91e:	eb d7                	jmp    8f7 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 920:	74 19                	je     93b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 922:	29 da                	sub    %ebx,%edx
 924:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 927:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 92a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 92d:	89 0d 0c 0e 00 00    	mov    %ecx,0xe0c
      return (void*)(p + 1);
 933:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 939:	c9                   	leave  
 93a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 93b:	8b 10                	mov    (%eax),%edx
 93d:	89 11                	mov    %edx,(%ecx)
 93f:	eb ec                	jmp    92d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 941:	89 c1                	mov    %eax,%ecx
 943:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 945:	8b 50 04             	mov    0x4(%eax),%edx
 948:	39 da                	cmp    %ebx,%edx
 94a:	73 d4                	jae    920 <malloc+0x46>
    if(p == freep)
 94c:	39 05 0c 0e 00 00    	cmp    %eax,0xe0c
 952:	75 ed                	jne    941 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 954:	89 d8                	mov    %ebx,%eax
 956:	e8 2f ff ff ff       	call   88a <morecore>
 95b:	85 c0                	test   %eax,%eax
 95d:	75 e2                	jne    941 <malloc+0x67>
 95f:	eb d5                	jmp    936 <malloc+0x5c>
