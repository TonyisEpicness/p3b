
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
  12:	e8 bd 05 00 00       	call   5d4 <getpid>
  17:	a3 f0 0d 00 00       	mov    %eax,0xdf0
   3. join both threads
   4. Merge function
   */


    int size = 11;
  1c:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 2c                	push   $0x2c
  28:	e8 a2 08 00 00       	call   8cf <malloc>
  2d:	a3 ec 0d 00 00       	mov    %eax,0xdec
    for(int i = 0; i < size; i++){
  32:	83 c4 10             	add    $0x10,%esp
  35:	ba 00 00 00 00       	mov    $0x0,%edx
  3a:	eb 11                	jmp    4d <main+0x4d>
        global[i] = size - i - 1;
  3c:	29 d0                	sub    %edx,%eax
  3e:	83 e8 01             	sub    $0x1,%eax
  41:	8b 0d ec 0d 00 00    	mov    0xdec,%ecx
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
  5b:	ff 35 ec 0d 00 00    	push   0xdec
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
  81:	a1 ec 0d 00 00       	mov    0xdec,%eax
  86:	83 38 00             	cmpl   $0x0,(%eax)
  89:	0f 85 e5 00 00 00    	jne    174 <main+0x174>
   assert(global[10] == 10); 
  8f:	83 78 28 0a          	cmpl   $0xa,0x28(%eax)
  93:	0f 84 24 01 00 00    	je     1bd <main+0x1bd>
  99:	6a 35                	push   $0x35
  9b:	68 58 09 00 00       	push   $0x958
  a0:	68 62 09 00 00       	push   $0x962
  a5:	6a 01                	push   $0x1
  a7:	e8 fd 05 00 00       	call   6a9 <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 c0 09 00 00       	push   $0x9c0
  b4:	68 79 09 00 00       	push   $0x979
  b9:	6a 01                	push   $0x1
  bb:	e8 e9 05 00 00       	call   6a9 <printf>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 8d 09 00 00       	push   $0x98d
  c8:	6a 01                	push   $0x1
  ca:	e8 da 05 00 00       	call   6a9 <printf>
  cf:	83 c4 04             	add    $0x4,%esp
  d2:	ff 35 f0 0d 00 00    	push   0xdf0
  d8:	e8 a7 04 00 00       	call   584 <kill>
  dd:	e8 72 04 00 00       	call   554 <exit>
   assert(thread_pid > 0);
  e2:	6a 30                	push   $0x30
  e4:	68 58 09 00 00       	push   $0x958
  e9:	68 62 09 00 00       	push   $0x962
  ee:	6a 01                	push   $0x1
  f0:	e8 b4 05 00 00       	call   6a9 <printf>
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	68 6a 09 00 00       	push   $0x96a
  fd:	68 79 09 00 00       	push   $0x979
 102:	6a 01                	push   $0x1
 104:	e8 a0 05 00 00       	call   6a9 <printf>
 109:	83 c4 08             	add    $0x8,%esp
 10c:	68 8d 09 00 00       	push   $0x98d
 111:	6a 01                	push   $0x1
 113:	e8 91 05 00 00       	call   6a9 <printf>
 118:	83 c4 04             	add    $0x4,%esp
 11b:	ff 35 f0 0d 00 00    	push   0xdf0
 121:	e8 5e 04 00 00       	call   584 <kill>
 126:	e8 29 04 00 00       	call   554 <exit>
   assert(join_pid == thread_pid);
 12b:	6a 33                	push   $0x33
 12d:	68 58 09 00 00       	push   $0x958
 132:	68 62 09 00 00       	push   $0x962
 137:	6a 01                	push   $0x1
 139:	e8 6b 05 00 00       	call   6a9 <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 9a 09 00 00       	push   $0x99a
 146:	68 79 09 00 00       	push   $0x979
 14b:	6a 01                	push   $0x1
 14d:	e8 57 05 00 00       	call   6a9 <printf>
 152:	83 c4 08             	add    $0x8,%esp
 155:	68 8d 09 00 00       	push   $0x98d
 15a:	6a 01                	push   $0x1
 15c:	e8 48 05 00 00       	call   6a9 <printf>
 161:	83 c4 04             	add    $0x4,%esp
 164:	ff 35 f0 0d 00 00    	push   0xdf0
 16a:	e8 15 04 00 00       	call   584 <kill>
 16f:	e8 e0 03 00 00       	call   554 <exit>
   assert(global[0] == 0);
 174:	6a 34                	push   $0x34
 176:	68 58 09 00 00       	push   $0x958
 17b:	68 62 09 00 00       	push   $0x962
 180:	6a 01                	push   $0x1
 182:	e8 22 05 00 00       	call   6a9 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 b1 09 00 00       	push   $0x9b1
 18f:	68 79 09 00 00       	push   $0x979
 194:	6a 01                	push   $0x1
 196:	e8 0e 05 00 00       	call   6a9 <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 8d 09 00 00       	push   $0x98d
 1a3:	6a 01                	push   $0x1
 1a5:	e8 ff 04 00 00       	call   6a9 <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 f0 0d 00 00    	push   0xdf0
 1b3:	e8 cc 03 00 00       	call   584 <kill>
 1b8:	e8 97 03 00 00       	call   554 <exit>

   printf(1, "TEST PASSED\n");
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	68 d1 09 00 00       	push   $0x9d1
 1c5:	6a 01                	push   $0x1
 1c7:	e8 dd 04 00 00       	call   6a9 <printf>
   exit();
 1cc:	e8 83 03 00 00       	call   554 <exit>

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
 304:	e8 c6 05 00 00       	call   8cf <malloc>
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
 31f:	e8 eb 04 00 00       	call   80f <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 324:	e8 2b 02 00 00       	call   554 <exit>
       exit();
 329:	e8 26 02 00 00       	call   554 <exit>

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
  void *n_stack = malloc(PGSIZE);
 345:	68 00 10 00 00       	push   $0x1000
 34a:	e8 80 05 00 00       	call   8cf <malloc>
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
 360:	e8 8f 02 00 00       	call   5f4 <clone>


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
  return 0;
}
 371:	b8 00 00 00 00       	mov    $0x0,%eax
 376:	c3                   	ret    

00000377 <lock_acquire>:

void lock_acquire(lock_t *lock){
 377:	55                   	push   %ebp
 378:	89 e5                	mov    %esp,%ebp
 37a:	53                   	push   %ebx
 37b:	83 ec 04             	sub    $0x4,%esp
 37e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 381:	83 ec 08             	sub    $0x8,%esp
 384:	6a 01                	push   $0x1
 386:	53                   	push   %ebx
 387:	e8 a2 ff ff ff       	call   32e <test_and_set>
 38c:	83 c4 10             	add    $0x10,%esp
 38f:	83 f8 01             	cmp    $0x1,%eax
 392:	74 ed                	je     381 <lock_acquire+0xa>
    ;
}
 394:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 397:	c9                   	leave  
 398:	c3                   	ret    

00000399 <lock_release>:

void lock_release(lock_t *lock) {
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
 39f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3a5:	5d                   	pop    %ebp
 3a6:	c3                   	ret    

000003a7 <lock_init>:

void lock_init(lock_t *lock) {
 3a7:	55                   	push   %ebp
 3a8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3aa:	8b 45 08             	mov    0x8(%ebp),%eax
 3ad:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3b3:	5d                   	pop    %ebp
 3b4:	c3                   	ret    

000003b5 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
 3b8:	56                   	push   %esi
 3b9:	53                   	push   %ebx
 3ba:	8b 75 08             	mov    0x8(%ebp),%esi
 3bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3c0:	89 f0                	mov    %esi,%eax
 3c2:	89 d1                	mov    %edx,%ecx
 3c4:	83 c2 01             	add    $0x1,%edx
 3c7:	89 c3                	mov    %eax,%ebx
 3c9:	83 c0 01             	add    $0x1,%eax
 3cc:	0f b6 09             	movzbl (%ecx),%ecx
 3cf:	88 0b                	mov    %cl,(%ebx)
 3d1:	84 c9                	test   %cl,%cl
 3d3:	75 ed                	jne    3c2 <strcpy+0xd>
    ;
  return os;
}
 3d5:	89 f0                	mov    %esi,%eax
 3d7:	5b                   	pop    %ebx
 3d8:	5e                   	pop    %esi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e1:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3e4:	eb 06                	jmp    3ec <strcmp+0x11>
    p++, q++;
 3e6:	83 c1 01             	add    $0x1,%ecx
 3e9:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3ec:	0f b6 01             	movzbl (%ecx),%eax
 3ef:	84 c0                	test   %al,%al
 3f1:	74 04                	je     3f7 <strcmp+0x1c>
 3f3:	3a 02                	cmp    (%edx),%al
 3f5:	74 ef                	je     3e6 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3f7:	0f b6 c0             	movzbl %al,%eax
 3fa:	0f b6 12             	movzbl (%edx),%edx
 3fd:	29 d0                	sub    %edx,%eax
}
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    

00000401 <strlen>:

uint
strlen(const char *s)
{
 401:	55                   	push   %ebp
 402:	89 e5                	mov    %esp,%ebp
 404:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 407:	b8 00 00 00 00       	mov    $0x0,%eax
 40c:	eb 03                	jmp    411 <strlen+0x10>
 40e:	83 c0 01             	add    $0x1,%eax
 411:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 415:	75 f7                	jne    40e <strlen+0xd>
    ;
  return n;
}
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    

00000419 <memset>:

void*
memset(void *dst, int c, uint n)
{
 419:	55                   	push   %ebp
 41a:	89 e5                	mov    %esp,%ebp
 41c:	57                   	push   %edi
 41d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 420:	89 d7                	mov    %edx,%edi
 422:	8b 4d 10             	mov    0x10(%ebp),%ecx
 425:	8b 45 0c             	mov    0xc(%ebp),%eax
 428:	fc                   	cld    
 429:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 42b:	89 d0                	mov    %edx,%eax
 42d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 430:	c9                   	leave  
 431:	c3                   	ret    

00000432 <strchr>:

char*
strchr(const char *s, char c)
{
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	8b 45 08             	mov    0x8(%ebp),%eax
 438:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 43c:	eb 03                	jmp    441 <strchr+0xf>
 43e:	83 c0 01             	add    $0x1,%eax
 441:	0f b6 10             	movzbl (%eax),%edx
 444:	84 d2                	test   %dl,%dl
 446:	74 06                	je     44e <strchr+0x1c>
    if(*s == c)
 448:	38 ca                	cmp    %cl,%dl
 44a:	75 f2                	jne    43e <strchr+0xc>
 44c:	eb 05                	jmp    453 <strchr+0x21>
      return (char*)s;
  return 0;
 44e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 453:	5d                   	pop    %ebp
 454:	c3                   	ret    

00000455 <gets>:

char*
gets(char *buf, int max)
{
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
 458:	57                   	push   %edi
 459:	56                   	push   %esi
 45a:	53                   	push   %ebx
 45b:	83 ec 1c             	sub    $0x1c,%esp
 45e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 461:	bb 00 00 00 00       	mov    $0x0,%ebx
 466:	89 de                	mov    %ebx,%esi
 468:	83 c3 01             	add    $0x1,%ebx
 46b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 46e:	7d 2e                	jge    49e <gets+0x49>
    cc = read(0, &c, 1);
 470:	83 ec 04             	sub    $0x4,%esp
 473:	6a 01                	push   $0x1
 475:	8d 45 e7             	lea    -0x19(%ebp),%eax
 478:	50                   	push   %eax
 479:	6a 00                	push   $0x0
 47b:	e8 ec 00 00 00       	call   56c <read>
    if(cc < 1)
 480:	83 c4 10             	add    $0x10,%esp
 483:	85 c0                	test   %eax,%eax
 485:	7e 17                	jle    49e <gets+0x49>
      break;
    buf[i++] = c;
 487:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 48b:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 48e:	3c 0a                	cmp    $0xa,%al
 490:	0f 94 c2             	sete   %dl
 493:	3c 0d                	cmp    $0xd,%al
 495:	0f 94 c0             	sete   %al
 498:	08 c2                	or     %al,%dl
 49a:	74 ca                	je     466 <gets+0x11>
    buf[i++] = c;
 49c:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 49e:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4a2:	89 f8                	mov    %edi,%eax
 4a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a7:	5b                   	pop    %ebx
 4a8:	5e                   	pop    %esi
 4a9:	5f                   	pop    %edi
 4aa:	5d                   	pop    %ebp
 4ab:	c3                   	ret    

000004ac <stat>:

int
stat(const char *n, struct stat *st)
{
 4ac:	55                   	push   %ebp
 4ad:	89 e5                	mov    %esp,%ebp
 4af:	56                   	push   %esi
 4b0:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b1:	83 ec 08             	sub    $0x8,%esp
 4b4:	6a 00                	push   $0x0
 4b6:	ff 75 08             	push   0x8(%ebp)
 4b9:	e8 d6 00 00 00       	call   594 <open>
  if(fd < 0)
 4be:	83 c4 10             	add    $0x10,%esp
 4c1:	85 c0                	test   %eax,%eax
 4c3:	78 24                	js     4e9 <stat+0x3d>
 4c5:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4c7:	83 ec 08             	sub    $0x8,%esp
 4ca:	ff 75 0c             	push   0xc(%ebp)
 4cd:	50                   	push   %eax
 4ce:	e8 d9 00 00 00       	call   5ac <fstat>
 4d3:	89 c6                	mov    %eax,%esi
  close(fd);
 4d5:	89 1c 24             	mov    %ebx,(%esp)
 4d8:	e8 9f 00 00 00       	call   57c <close>
  return r;
 4dd:	83 c4 10             	add    $0x10,%esp
}
 4e0:	89 f0                	mov    %esi,%eax
 4e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e5:	5b                   	pop    %ebx
 4e6:	5e                   	pop    %esi
 4e7:	5d                   	pop    %ebp
 4e8:	c3                   	ret    
    return -1;
 4e9:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4ee:	eb f0                	jmp    4e0 <stat+0x34>

000004f0 <atoi>:

int
atoi(const char *s)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	53                   	push   %ebx
 4f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4f7:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4fc:	eb 10                	jmp    50e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4fe:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 501:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 504:	83 c1 01             	add    $0x1,%ecx
 507:	0f be c0             	movsbl %al,%eax
 50a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 50e:	0f b6 01             	movzbl (%ecx),%eax
 511:	8d 58 d0             	lea    -0x30(%eax),%ebx
 514:	80 fb 09             	cmp    $0x9,%bl
 517:	76 e5                	jbe    4fe <atoi+0xe>
  return n;
}
 519:	89 d0                	mov    %edx,%eax
 51b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 51e:	c9                   	leave  
 51f:	c3                   	ret    

00000520 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	56                   	push   %esi
 524:	53                   	push   %ebx
 525:	8b 75 08             	mov    0x8(%ebp),%esi
 528:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 52b:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 52e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 530:	eb 0d                	jmp    53f <memmove+0x1f>
    *dst++ = *src++;
 532:	0f b6 01             	movzbl (%ecx),%eax
 535:	88 02                	mov    %al,(%edx)
 537:	8d 49 01             	lea    0x1(%ecx),%ecx
 53a:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 53d:	89 d8                	mov    %ebx,%eax
 53f:	8d 58 ff             	lea    -0x1(%eax),%ebx
 542:	85 c0                	test   %eax,%eax
 544:	7f ec                	jg     532 <memmove+0x12>
  return vdst;
}
 546:	89 f0                	mov    %esi,%eax
 548:	5b                   	pop    %ebx
 549:	5e                   	pop    %esi
 54a:	5d                   	pop    %ebp
 54b:	c3                   	ret    

0000054c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 54c:	b8 01 00 00 00       	mov    $0x1,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <exit>:
SYSCALL(exit)
 554:	b8 02 00 00 00       	mov    $0x2,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <wait>:
SYSCALL(wait)
 55c:	b8 03 00 00 00       	mov    $0x3,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <pipe>:
SYSCALL(pipe)
 564:	b8 04 00 00 00       	mov    $0x4,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <read>:
SYSCALL(read)
 56c:	b8 05 00 00 00       	mov    $0x5,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <write>:
SYSCALL(write)
 574:	b8 10 00 00 00       	mov    $0x10,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <close>:
SYSCALL(close)
 57c:	b8 15 00 00 00       	mov    $0x15,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <kill>:
SYSCALL(kill)
 584:	b8 06 00 00 00       	mov    $0x6,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <exec>:
SYSCALL(exec)
 58c:	b8 07 00 00 00       	mov    $0x7,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <open>:
SYSCALL(open)
 594:	b8 0f 00 00 00       	mov    $0xf,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <mknod>:
SYSCALL(mknod)
 59c:	b8 11 00 00 00       	mov    $0x11,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <unlink>:
SYSCALL(unlink)
 5a4:	b8 12 00 00 00       	mov    $0x12,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <fstat>:
SYSCALL(fstat)
 5ac:	b8 08 00 00 00       	mov    $0x8,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <link>:
SYSCALL(link)
 5b4:	b8 13 00 00 00       	mov    $0x13,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <mkdir>:
SYSCALL(mkdir)
 5bc:	b8 14 00 00 00       	mov    $0x14,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <chdir>:
SYSCALL(chdir)
 5c4:	b8 09 00 00 00       	mov    $0x9,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <dup>:
SYSCALL(dup)
 5cc:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <getpid>:
SYSCALL(getpid)
 5d4:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <sbrk>:
SYSCALL(sbrk)
 5dc:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <sleep>:
SYSCALL(sleep)
 5e4:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <uptime>:
SYSCALL(uptime)
 5ec:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <clone>:
SYSCALL(clone)
 5f4:	b8 16 00 00 00       	mov    $0x16,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <join>:
 5fc:	b8 17 00 00 00       	mov    $0x17,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	83 ec 1c             	sub    $0x1c,%esp
 60a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 60d:	6a 01                	push   $0x1
 60f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 612:	52                   	push   %edx
 613:	50                   	push   %eax
 614:	e8 5b ff ff ff       	call   574 <write>
}
 619:	83 c4 10             	add    $0x10,%esp
 61c:	c9                   	leave  
 61d:	c3                   	ret    

0000061e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 61e:	55                   	push   %ebp
 61f:	89 e5                	mov    %esp,%ebp
 621:	57                   	push   %edi
 622:	56                   	push   %esi
 623:	53                   	push   %ebx
 624:	83 ec 2c             	sub    $0x2c,%esp
 627:	89 45 d0             	mov    %eax,-0x30(%ebp)
 62a:	89 d0                	mov    %edx,%eax
 62c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 62e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 632:	0f 95 c1             	setne  %cl
 635:	c1 ea 1f             	shr    $0x1f,%edx
 638:	84 d1                	test   %dl,%cl
 63a:	74 44                	je     680 <printint+0x62>
    neg = 1;
    x = -xx;
 63c:	f7 d8                	neg    %eax
 63e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 640:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 647:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 64c:	89 c8                	mov    %ecx,%eax
 64e:	ba 00 00 00 00       	mov    $0x0,%edx
 653:	f7 f6                	div    %esi
 655:	89 df                	mov    %ebx,%edi
 657:	83 c3 01             	add    $0x1,%ebx
 65a:	0f b6 92 40 0a 00 00 	movzbl 0xa40(%edx),%edx
 661:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 665:	89 ca                	mov    %ecx,%edx
 667:	89 c1                	mov    %eax,%ecx
 669:	39 d6                	cmp    %edx,%esi
 66b:	76 df                	jbe    64c <printint+0x2e>
  if(neg)
 66d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 671:	74 31                	je     6a4 <printint+0x86>
    buf[i++] = '-';
 673:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 678:	8d 5f 02             	lea    0x2(%edi),%ebx
 67b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 67e:	eb 17                	jmp    697 <printint+0x79>
    x = xx;
 680:	89 c1                	mov    %eax,%ecx
  neg = 0;
 682:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 689:	eb bc                	jmp    647 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 68b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 690:	89 f0                	mov    %esi,%eax
 692:	e8 6d ff ff ff       	call   604 <putc>
  while(--i >= 0)
 697:	83 eb 01             	sub    $0x1,%ebx
 69a:	79 ef                	jns    68b <printint+0x6d>
}
 69c:	83 c4 2c             	add    $0x2c,%esp
 69f:	5b                   	pop    %ebx
 6a0:	5e                   	pop    %esi
 6a1:	5f                   	pop    %edi
 6a2:	5d                   	pop    %ebp
 6a3:	c3                   	ret    
 6a4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6a7:	eb ee                	jmp    697 <printint+0x79>

000006a9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6a9:	55                   	push   %ebp
 6aa:	89 e5                	mov    %esp,%ebp
 6ac:	57                   	push   %edi
 6ad:	56                   	push   %esi
 6ae:	53                   	push   %ebx
 6af:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6b2:	8d 45 10             	lea    0x10(%ebp),%eax
 6b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6b8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6bd:	bb 00 00 00 00       	mov    $0x0,%ebx
 6c2:	eb 14                	jmp    6d8 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6c4:	89 fa                	mov    %edi,%edx
 6c6:	8b 45 08             	mov    0x8(%ebp),%eax
 6c9:	e8 36 ff ff ff       	call   604 <putc>
 6ce:	eb 05                	jmp    6d5 <printf+0x2c>
      }
    } else if(state == '%'){
 6d0:	83 fe 25             	cmp    $0x25,%esi
 6d3:	74 25                	je     6fa <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6d5:	83 c3 01             	add    $0x1,%ebx
 6d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 6db:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6df:	84 c0                	test   %al,%al
 6e1:	0f 84 20 01 00 00    	je     807 <printf+0x15e>
    c = fmt[i] & 0xff;
 6e7:	0f be f8             	movsbl %al,%edi
 6ea:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ed:	85 f6                	test   %esi,%esi
 6ef:	75 df                	jne    6d0 <printf+0x27>
      if(c == '%'){
 6f1:	83 f8 25             	cmp    $0x25,%eax
 6f4:	75 ce                	jne    6c4 <printf+0x1b>
        state = '%';
 6f6:	89 c6                	mov    %eax,%esi
 6f8:	eb db                	jmp    6d5 <printf+0x2c>
      if(c == 'd'){
 6fa:	83 f8 25             	cmp    $0x25,%eax
 6fd:	0f 84 cf 00 00 00    	je     7d2 <printf+0x129>
 703:	0f 8c dd 00 00 00    	jl     7e6 <printf+0x13d>
 709:	83 f8 78             	cmp    $0x78,%eax
 70c:	0f 8f d4 00 00 00    	jg     7e6 <printf+0x13d>
 712:	83 f8 63             	cmp    $0x63,%eax
 715:	0f 8c cb 00 00 00    	jl     7e6 <printf+0x13d>
 71b:	83 e8 63             	sub    $0x63,%eax
 71e:	83 f8 15             	cmp    $0x15,%eax
 721:	0f 87 bf 00 00 00    	ja     7e6 <printf+0x13d>
 727:	ff 24 85 e8 09 00 00 	jmp    *0x9e8(,%eax,4)
        printint(fd, *ap, 10, 1);
 72e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 731:	8b 17                	mov    (%edi),%edx
 733:	83 ec 0c             	sub    $0xc,%esp
 736:	6a 01                	push   $0x1
 738:	b9 0a 00 00 00       	mov    $0xa,%ecx
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	e8 d9 fe ff ff       	call   61e <printint>
        ap++;
 745:	83 c7 04             	add    $0x4,%edi
 748:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 74b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 74e:	be 00 00 00 00       	mov    $0x0,%esi
 753:	eb 80                	jmp    6d5 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 755:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 758:	8b 17                	mov    (%edi),%edx
 75a:	83 ec 0c             	sub    $0xc,%esp
 75d:	6a 00                	push   $0x0
 75f:	b9 10 00 00 00       	mov    $0x10,%ecx
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	e8 b2 fe ff ff       	call   61e <printint>
        ap++;
 76c:	83 c7 04             	add    $0x4,%edi
 76f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 772:	83 c4 10             	add    $0x10,%esp
      state = 0;
 775:	be 00 00 00 00       	mov    $0x0,%esi
 77a:	e9 56 ff ff ff       	jmp    6d5 <printf+0x2c>
        s = (char*)*ap;
 77f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 782:	8b 30                	mov    (%eax),%esi
        ap++;
 784:	83 c0 04             	add    $0x4,%eax
 787:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 78a:	85 f6                	test   %esi,%esi
 78c:	75 15                	jne    7a3 <printf+0xfa>
          s = "(null)";
 78e:	be de 09 00 00       	mov    $0x9de,%esi
 793:	eb 0e                	jmp    7a3 <printf+0xfa>
          putc(fd, *s);
 795:	0f be d2             	movsbl %dl,%edx
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	e8 64 fe ff ff       	call   604 <putc>
          s++;
 7a0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7a3:	0f b6 16             	movzbl (%esi),%edx
 7a6:	84 d2                	test   %dl,%dl
 7a8:	75 eb                	jne    795 <printf+0xec>
      state = 0;
 7aa:	be 00 00 00 00       	mov    $0x0,%esi
 7af:	e9 21 ff ff ff       	jmp    6d5 <printf+0x2c>
        putc(fd, *ap);
 7b4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7b7:	0f be 17             	movsbl (%edi),%edx
 7ba:	8b 45 08             	mov    0x8(%ebp),%eax
 7bd:	e8 42 fe ff ff       	call   604 <putc>
        ap++;
 7c2:	83 c7 04             	add    $0x4,%edi
 7c5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7c8:	be 00 00 00 00       	mov    $0x0,%esi
 7cd:	e9 03 ff ff ff       	jmp    6d5 <printf+0x2c>
        putc(fd, c);
 7d2:	89 fa                	mov    %edi,%edx
 7d4:	8b 45 08             	mov    0x8(%ebp),%eax
 7d7:	e8 28 fe ff ff       	call   604 <putc>
      state = 0;
 7dc:	be 00 00 00 00       	mov    $0x0,%esi
 7e1:	e9 ef fe ff ff       	jmp    6d5 <printf+0x2c>
        putc(fd, '%');
 7e6:	ba 25 00 00 00       	mov    $0x25,%edx
 7eb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ee:	e8 11 fe ff ff       	call   604 <putc>
        putc(fd, c);
 7f3:	89 fa                	mov    %edi,%edx
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	e8 07 fe ff ff       	call   604 <putc>
      state = 0;
 7fd:	be 00 00 00 00       	mov    $0x0,%esi
 802:	e9 ce fe ff ff       	jmp    6d5 <printf+0x2c>
    }
  }
}
 807:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80a:	5b                   	pop    %ebx
 80b:	5e                   	pop    %esi
 80c:	5f                   	pop    %edi
 80d:	5d                   	pop    %ebp
 80e:	c3                   	ret    

0000080f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 80f:	55                   	push   %ebp
 810:	89 e5                	mov    %esp,%ebp
 812:	57                   	push   %edi
 813:	56                   	push   %esi
 814:	53                   	push   %ebx
 815:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 818:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 81b:	a1 f4 0d 00 00       	mov    0xdf4,%eax
 820:	eb 02                	jmp    824 <free+0x15>
 822:	89 d0                	mov    %edx,%eax
 824:	39 c8                	cmp    %ecx,%eax
 826:	73 04                	jae    82c <free+0x1d>
 828:	39 08                	cmp    %ecx,(%eax)
 82a:	77 12                	ja     83e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 82c:	8b 10                	mov    (%eax),%edx
 82e:	39 c2                	cmp    %eax,%edx
 830:	77 f0                	ja     822 <free+0x13>
 832:	39 c8                	cmp    %ecx,%eax
 834:	72 08                	jb     83e <free+0x2f>
 836:	39 ca                	cmp    %ecx,%edx
 838:	77 04                	ja     83e <free+0x2f>
 83a:	89 d0                	mov    %edx,%eax
 83c:	eb e6                	jmp    824 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 83e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 841:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 844:	8b 10                	mov    (%eax),%edx
 846:	39 d7                	cmp    %edx,%edi
 848:	74 19                	je     863 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 84a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 84d:	8b 50 04             	mov    0x4(%eax),%edx
 850:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 853:	39 ce                	cmp    %ecx,%esi
 855:	74 1b                	je     872 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 857:	89 08                	mov    %ecx,(%eax)
  freep = p;
 859:	a3 f4 0d 00 00       	mov    %eax,0xdf4
}
 85e:	5b                   	pop    %ebx
 85f:	5e                   	pop    %esi
 860:	5f                   	pop    %edi
 861:	5d                   	pop    %ebp
 862:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 863:	03 72 04             	add    0x4(%edx),%esi
 866:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 869:	8b 10                	mov    (%eax),%edx
 86b:	8b 12                	mov    (%edx),%edx
 86d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 870:	eb db                	jmp    84d <free+0x3e>
    p->s.size += bp->s.size;
 872:	03 53 fc             	add    -0x4(%ebx),%edx
 875:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 878:	8b 53 f8             	mov    -0x8(%ebx),%edx
 87b:	89 10                	mov    %edx,(%eax)
 87d:	eb da                	jmp    859 <free+0x4a>

0000087f <morecore>:

static Header*
morecore(uint nu)
{
 87f:	55                   	push   %ebp
 880:	89 e5                	mov    %esp,%ebp
 882:	53                   	push   %ebx
 883:	83 ec 04             	sub    $0x4,%esp
 886:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 888:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 88d:	77 05                	ja     894 <morecore+0x15>
    nu = 4096;
 88f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 894:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 89b:	83 ec 0c             	sub    $0xc,%esp
 89e:	50                   	push   %eax
 89f:	e8 38 fd ff ff       	call   5dc <sbrk>
  if(p == (char*)-1)
 8a4:	83 c4 10             	add    $0x10,%esp
 8a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 8aa:	74 1c                	je     8c8 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8af:	83 c0 08             	add    $0x8,%eax
 8b2:	83 ec 0c             	sub    $0xc,%esp
 8b5:	50                   	push   %eax
 8b6:	e8 54 ff ff ff       	call   80f <free>
  return freep;
 8bb:	a1 f4 0d 00 00       	mov    0xdf4,%eax
 8c0:	83 c4 10             	add    $0x10,%esp
}
 8c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c6:	c9                   	leave  
 8c7:	c3                   	ret    
    return 0;
 8c8:	b8 00 00 00 00       	mov    $0x0,%eax
 8cd:	eb f4                	jmp    8c3 <morecore+0x44>

000008cf <malloc>:

void*
malloc(uint nbytes)
{
 8cf:	55                   	push   %ebp
 8d0:	89 e5                	mov    %esp,%ebp
 8d2:	53                   	push   %ebx
 8d3:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d6:	8b 45 08             	mov    0x8(%ebp),%eax
 8d9:	8d 58 07             	lea    0x7(%eax),%ebx
 8dc:	c1 eb 03             	shr    $0x3,%ebx
 8df:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8e2:	8b 0d f4 0d 00 00    	mov    0xdf4,%ecx
 8e8:	85 c9                	test   %ecx,%ecx
 8ea:	74 04                	je     8f0 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ec:	8b 01                	mov    (%ecx),%eax
 8ee:	eb 4a                	jmp    93a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8f0:	c7 05 f4 0d 00 00 f8 	movl   $0xdf8,0xdf4
 8f7:	0d 00 00 
 8fa:	c7 05 f8 0d 00 00 f8 	movl   $0xdf8,0xdf8
 901:	0d 00 00 
    base.s.size = 0;
 904:	c7 05 fc 0d 00 00 00 	movl   $0x0,0xdfc
 90b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 90e:	b9 f8 0d 00 00       	mov    $0xdf8,%ecx
 913:	eb d7                	jmp    8ec <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 915:	74 19                	je     930 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 917:	29 da                	sub    %ebx,%edx
 919:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 91c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 91f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 922:	89 0d f4 0d 00 00    	mov    %ecx,0xdf4
      return (void*)(p + 1);
 928:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 92b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 92e:	c9                   	leave  
 92f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 930:	8b 10                	mov    (%eax),%edx
 932:	89 11                	mov    %edx,(%ecx)
 934:	eb ec                	jmp    922 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 936:	89 c1                	mov    %eax,%ecx
 938:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 93a:	8b 50 04             	mov    0x4(%eax),%edx
 93d:	39 da                	cmp    %ebx,%edx
 93f:	73 d4                	jae    915 <malloc+0x46>
    if(p == freep)
 941:	39 05 f4 0d 00 00    	cmp    %eax,0xdf4
 947:	75 ed                	jne    936 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 949:	89 d8                	mov    %ebx,%eax
 94b:	e8 2f ff ff ff       	call   87f <morecore>
 950:	85 c0                	test   %eax,%eax
 952:	75 e2                	jne    936 <malloc+0x67>
 954:	eb d5                	jmp    92b <malloc+0x5c>
