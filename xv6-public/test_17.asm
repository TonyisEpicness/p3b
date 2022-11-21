
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
  12:	e8 91 05 00 00       	call   5a8 <getpid>
  17:	a3 b4 0d 00 00       	mov    %eax,0xdb4
   3. join both threads
   4. Merge function
   */


    int size = 11;
  1c:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 2c                	push   $0x2c
  28:	e8 76 08 00 00       	call   8a3 <malloc>
  2d:	a3 b0 0d 00 00       	mov    %eax,0xdb0
    for(int i = 0; i < size; i++){
  32:	83 c4 10             	add    $0x10,%esp
  35:	ba 00 00 00 00       	mov    $0x0,%edx
  3a:	eb 11                	jmp    4d <main+0x4d>
        global[i] = size - i - 1;
  3c:	29 d0                	sub    %edx,%eax
  3e:	83 e8 01             	sub    $0x1,%eax
  41:	8b 0d b0 0d 00 00    	mov    0xdb0,%ecx
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
  5b:	ff 35 b0 0d 00 00    	push   0xdb0
  61:	68 a3 02 00 00       	push   $0x2a3
  66:	e8 d4 02 00 00       	call   33f <thread_create>
  6b:	89 c3                	mov    %eax,%ebx
   assert(thread_pid > 0);
  6d:	83 c4 10             	add    $0x10,%esp
  70:	85 c0                	test   %eax,%eax
  72:	7e 6e                	jle    e2 <main+0xe2>

   int join_pid = thread_join();
  74:	e8 cc 02 00 00       	call   345 <thread_join>
   assert(join_pid == thread_pid);
  79:	39 c3                	cmp    %eax,%ebx
  7b:	0f 85 aa 00 00 00    	jne    12b <main+0x12b>
   assert(global[0] == 0);
  81:	a1 b0 0d 00 00       	mov    0xdb0,%eax
  86:	83 38 00             	cmpl   $0x0,(%eax)
  89:	0f 85 e5 00 00 00    	jne    174 <main+0x174>
   assert(global[10] == 10); 
  8f:	83 78 28 0a          	cmpl   $0xa,0x28(%eax)
  93:	0f 84 24 01 00 00    	je     1bd <main+0x1bd>
  99:	6a 35                	push   $0x35
  9b:	68 2c 09 00 00       	push   $0x92c
  a0:	68 36 09 00 00       	push   $0x936
  a5:	6a 01                	push   $0x1
  a7:	e8 d1 05 00 00       	call   67d <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 94 09 00 00       	push   $0x994
  b4:	68 4d 09 00 00       	push   $0x94d
  b9:	6a 01                	push   $0x1
  bb:	e8 bd 05 00 00       	call   67d <printf>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 61 09 00 00       	push   $0x961
  c8:	6a 01                	push   $0x1
  ca:	e8 ae 05 00 00       	call   67d <printf>
  cf:	83 c4 04             	add    $0x4,%esp
  d2:	ff 35 b4 0d 00 00    	push   0xdb4
  d8:	e8 7b 04 00 00       	call   558 <kill>
  dd:	e8 46 04 00 00       	call   528 <exit>
   assert(thread_pid > 0);
  e2:	6a 30                	push   $0x30
  e4:	68 2c 09 00 00       	push   $0x92c
  e9:	68 36 09 00 00       	push   $0x936
  ee:	6a 01                	push   $0x1
  f0:	e8 88 05 00 00       	call   67d <printf>
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	68 3e 09 00 00       	push   $0x93e
  fd:	68 4d 09 00 00       	push   $0x94d
 102:	6a 01                	push   $0x1
 104:	e8 74 05 00 00       	call   67d <printf>
 109:	83 c4 08             	add    $0x8,%esp
 10c:	68 61 09 00 00       	push   $0x961
 111:	6a 01                	push   $0x1
 113:	e8 65 05 00 00       	call   67d <printf>
 118:	83 c4 04             	add    $0x4,%esp
 11b:	ff 35 b4 0d 00 00    	push   0xdb4
 121:	e8 32 04 00 00       	call   558 <kill>
 126:	e8 fd 03 00 00       	call   528 <exit>
   assert(join_pid == thread_pid);
 12b:	6a 33                	push   $0x33
 12d:	68 2c 09 00 00       	push   $0x92c
 132:	68 36 09 00 00       	push   $0x936
 137:	6a 01                	push   $0x1
 139:	e8 3f 05 00 00       	call   67d <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 6e 09 00 00       	push   $0x96e
 146:	68 4d 09 00 00       	push   $0x94d
 14b:	6a 01                	push   $0x1
 14d:	e8 2b 05 00 00       	call   67d <printf>
 152:	83 c4 08             	add    $0x8,%esp
 155:	68 61 09 00 00       	push   $0x961
 15a:	6a 01                	push   $0x1
 15c:	e8 1c 05 00 00       	call   67d <printf>
 161:	83 c4 04             	add    $0x4,%esp
 164:	ff 35 b4 0d 00 00    	push   0xdb4
 16a:	e8 e9 03 00 00       	call   558 <kill>
 16f:	e8 b4 03 00 00       	call   528 <exit>
   assert(global[0] == 0);
 174:	6a 34                	push   $0x34
 176:	68 2c 09 00 00       	push   $0x92c
 17b:	68 36 09 00 00       	push   $0x936
 180:	6a 01                	push   $0x1
 182:	e8 f6 04 00 00       	call   67d <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 85 09 00 00       	push   $0x985
 18f:	68 4d 09 00 00       	push   $0x94d
 194:	6a 01                	push   $0x1
 196:	e8 e2 04 00 00       	call   67d <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 61 09 00 00       	push   $0x961
 1a3:	6a 01                	push   $0x1
 1a5:	e8 d3 04 00 00       	call   67d <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 b4 0d 00 00    	push   0xdb4
 1b3:	e8 a0 03 00 00       	call   558 <kill>
 1b8:	e8 6b 03 00 00       	call   528 <exit>

   printf(1, "TEST PASSED\n");
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	68 a5 09 00 00       	push   $0x9a5
 1c5:	6a 01                	push   $0x1
 1c7:	e8 b1 04 00 00       	call   67d <printf>
   exit();
 1cc:	e8 57 03 00 00       	call   528 <exit>

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
 2f4:	e8 4c 00 00 00       	call   345 <thread_join>
   thread_join();
 2f9:	e8 47 00 00 00       	call   345 <thread_join>
 

//    int nested_join_pid_1 = thread_join();
//    int nested_join_pid_2 = thread_join();

   int* temp_array = malloc(size*sizeof(int));
 2fe:	c1 e3 02             	shl    $0x2,%ebx
 301:	89 1c 24             	mov    %ebx,(%esp)
 304:	e8 9a 05 00 00       	call   8a3 <malloc>
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
 31f:	e8 bf 04 00 00       	call   7e3 <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 324:	e8 ff 01 00 00       	call   528 <exit>
       exit();
 329:	e8 fa 01 00 00       	call   528 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 33f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 344:	c3                   	ret    

00000345 <thread_join>:

int thread_join() {
  return 0;
}
 345:	b8 00 00 00 00       	mov    $0x0,%eax
 34a:	c3                   	ret    

0000034b <lock_acquire>:

void lock_acquire(lock_t *lock){
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	53                   	push   %ebx
 34f:	83 ec 04             	sub    $0x4,%esp
 352:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 355:	83 ec 08             	sub    $0x8,%esp
 358:	6a 01                	push   $0x1
 35a:	53                   	push   %ebx
 35b:	e8 ce ff ff ff       	call   32e <test_and_set>
 360:	83 c4 10             	add    $0x10,%esp
 363:	83 f8 01             	cmp    $0x1,%eax
 366:	74 ed                	je     355 <lock_acquire+0xa>
    ;
}
 368:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 36b:	c9                   	leave  
 36c:	c3                   	ret    

0000036d <lock_release>:

void lock_release(lock_t *lock) {
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 370:	8b 45 08             	mov    0x8(%ebp),%eax
 373:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    

0000037b <lock_init>:

void lock_init(lock_t *lock) {
 37b:	55                   	push   %ebp
 37c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 37e:	8b 45 08             	mov    0x8(%ebp),%eax
 381:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	56                   	push   %esi
 38d:	53                   	push   %ebx
 38e:	8b 75 08             	mov    0x8(%ebp),%esi
 391:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 394:	89 f0                	mov    %esi,%eax
 396:	89 d1                	mov    %edx,%ecx
 398:	83 c2 01             	add    $0x1,%edx
 39b:	89 c3                	mov    %eax,%ebx
 39d:	83 c0 01             	add    $0x1,%eax
 3a0:	0f b6 09             	movzbl (%ecx),%ecx
 3a3:	88 0b                	mov    %cl,(%ebx)
 3a5:	84 c9                	test   %cl,%cl
 3a7:	75 ed                	jne    396 <strcpy+0xd>
    ;
  return os;
}
 3a9:	89 f0                	mov    %esi,%eax
 3ab:	5b                   	pop    %ebx
 3ac:	5e                   	pop    %esi
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    

000003af <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3b5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3b8:	eb 06                	jmp    3c0 <strcmp+0x11>
    p++, q++;
 3ba:	83 c1 01             	add    $0x1,%ecx
 3bd:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3c0:	0f b6 01             	movzbl (%ecx),%eax
 3c3:	84 c0                	test   %al,%al
 3c5:	74 04                	je     3cb <strcmp+0x1c>
 3c7:	3a 02                	cmp    (%edx),%al
 3c9:	74 ef                	je     3ba <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3cb:	0f b6 c0             	movzbl %al,%eax
 3ce:	0f b6 12             	movzbl (%edx),%edx
 3d1:	29 d0                	sub    %edx,%eax
}
 3d3:	5d                   	pop    %ebp
 3d4:	c3                   	ret    

000003d5 <strlen>:

uint
strlen(const char *s)
{
 3d5:	55                   	push   %ebp
 3d6:	89 e5                	mov    %esp,%ebp
 3d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3db:	b8 00 00 00 00       	mov    $0x0,%eax
 3e0:	eb 03                	jmp    3e5 <strlen+0x10>
 3e2:	83 c0 01             	add    $0x1,%eax
 3e5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3e9:	75 f7                	jne    3e2 <strlen+0xd>
    ;
  return n;
}
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    

000003ed <memset>:

void*
memset(void *dst, int c, uint n)
{
 3ed:	55                   	push   %ebp
 3ee:	89 e5                	mov    %esp,%ebp
 3f0:	57                   	push   %edi
 3f1:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3f4:	89 d7                	mov    %edx,%edi
 3f6:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fc:	fc                   	cld    
 3fd:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ff:	89 d0                	mov    %edx,%eax
 401:	8b 7d fc             	mov    -0x4(%ebp),%edi
 404:	c9                   	leave  
 405:	c3                   	ret    

00000406 <strchr>:

char*
strchr(const char *s, char c)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	8b 45 08             	mov    0x8(%ebp),%eax
 40c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 410:	eb 03                	jmp    415 <strchr+0xf>
 412:	83 c0 01             	add    $0x1,%eax
 415:	0f b6 10             	movzbl (%eax),%edx
 418:	84 d2                	test   %dl,%dl
 41a:	74 06                	je     422 <strchr+0x1c>
    if(*s == c)
 41c:	38 ca                	cmp    %cl,%dl
 41e:	75 f2                	jne    412 <strchr+0xc>
 420:	eb 05                	jmp    427 <strchr+0x21>
      return (char*)s;
  return 0;
 422:	b8 00 00 00 00       	mov    $0x0,%eax
}
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    

00000429 <gets>:

char*
gets(char *buf, int max)
{
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
 42c:	57                   	push   %edi
 42d:	56                   	push   %esi
 42e:	53                   	push   %ebx
 42f:	83 ec 1c             	sub    $0x1c,%esp
 432:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 435:	bb 00 00 00 00       	mov    $0x0,%ebx
 43a:	89 de                	mov    %ebx,%esi
 43c:	83 c3 01             	add    $0x1,%ebx
 43f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 442:	7d 2e                	jge    472 <gets+0x49>
    cc = read(0, &c, 1);
 444:	83 ec 04             	sub    $0x4,%esp
 447:	6a 01                	push   $0x1
 449:	8d 45 e7             	lea    -0x19(%ebp),%eax
 44c:	50                   	push   %eax
 44d:	6a 00                	push   $0x0
 44f:	e8 ec 00 00 00       	call   540 <read>
    if(cc < 1)
 454:	83 c4 10             	add    $0x10,%esp
 457:	85 c0                	test   %eax,%eax
 459:	7e 17                	jle    472 <gets+0x49>
      break;
    buf[i++] = c;
 45b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 45f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 462:	3c 0a                	cmp    $0xa,%al
 464:	0f 94 c2             	sete   %dl
 467:	3c 0d                	cmp    $0xd,%al
 469:	0f 94 c0             	sete   %al
 46c:	08 c2                	or     %al,%dl
 46e:	74 ca                	je     43a <gets+0x11>
    buf[i++] = c;
 470:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 472:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 476:	89 f8                	mov    %edi,%eax
 478:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47b:	5b                   	pop    %ebx
 47c:	5e                   	pop    %esi
 47d:	5f                   	pop    %edi
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    

00000480 <stat>:

int
stat(const char *n, struct stat *st)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	56                   	push   %esi
 484:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 485:	83 ec 08             	sub    $0x8,%esp
 488:	6a 00                	push   $0x0
 48a:	ff 75 08             	push   0x8(%ebp)
 48d:	e8 d6 00 00 00       	call   568 <open>
  if(fd < 0)
 492:	83 c4 10             	add    $0x10,%esp
 495:	85 c0                	test   %eax,%eax
 497:	78 24                	js     4bd <stat+0x3d>
 499:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 49b:	83 ec 08             	sub    $0x8,%esp
 49e:	ff 75 0c             	push   0xc(%ebp)
 4a1:	50                   	push   %eax
 4a2:	e8 d9 00 00 00       	call   580 <fstat>
 4a7:	89 c6                	mov    %eax,%esi
  close(fd);
 4a9:	89 1c 24             	mov    %ebx,(%esp)
 4ac:	e8 9f 00 00 00       	call   550 <close>
  return r;
 4b1:	83 c4 10             	add    $0x10,%esp
}
 4b4:	89 f0                	mov    %esi,%eax
 4b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4b9:	5b                   	pop    %ebx
 4ba:	5e                   	pop    %esi
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    
    return -1;
 4bd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4c2:	eb f0                	jmp    4b4 <stat+0x34>

000004c4 <atoi>:

int
atoi(const char *s)
{
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	53                   	push   %ebx
 4c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4cb:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4d0:	eb 10                	jmp    4e2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4d2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4d5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4d8:	83 c1 01             	add    $0x1,%ecx
 4db:	0f be c0             	movsbl %al,%eax
 4de:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4e2:	0f b6 01             	movzbl (%ecx),%eax
 4e5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4e8:	80 fb 09             	cmp    $0x9,%bl
 4eb:	76 e5                	jbe    4d2 <atoi+0xe>
  return n;
}
 4ed:	89 d0                	mov    %edx,%eax
 4ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4f2:	c9                   	leave  
 4f3:	c3                   	ret    

000004f4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	56                   	push   %esi
 4f8:	53                   	push   %ebx
 4f9:	8b 75 08             	mov    0x8(%ebp),%esi
 4fc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ff:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 502:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 504:	eb 0d                	jmp    513 <memmove+0x1f>
    *dst++ = *src++;
 506:	0f b6 01             	movzbl (%ecx),%eax
 509:	88 02                	mov    %al,(%edx)
 50b:	8d 49 01             	lea    0x1(%ecx),%ecx
 50e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 511:	89 d8                	mov    %ebx,%eax
 513:	8d 58 ff             	lea    -0x1(%eax),%ebx
 516:	85 c0                	test   %eax,%eax
 518:	7f ec                	jg     506 <memmove+0x12>
  return vdst;
}
 51a:	89 f0                	mov    %esi,%eax
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5d                   	pop    %ebp
 51f:	c3                   	ret    

00000520 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 520:	b8 01 00 00 00       	mov    $0x1,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <exit>:
SYSCALL(exit)
 528:	b8 02 00 00 00       	mov    $0x2,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <wait>:
SYSCALL(wait)
 530:	b8 03 00 00 00       	mov    $0x3,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <pipe>:
SYSCALL(pipe)
 538:	b8 04 00 00 00       	mov    $0x4,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <read>:
SYSCALL(read)
 540:	b8 05 00 00 00       	mov    $0x5,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <write>:
SYSCALL(write)
 548:	b8 10 00 00 00       	mov    $0x10,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <close>:
SYSCALL(close)
 550:	b8 15 00 00 00       	mov    $0x15,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <kill>:
SYSCALL(kill)
 558:	b8 06 00 00 00       	mov    $0x6,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <exec>:
SYSCALL(exec)
 560:	b8 07 00 00 00       	mov    $0x7,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <open>:
SYSCALL(open)
 568:	b8 0f 00 00 00       	mov    $0xf,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <mknod>:
SYSCALL(mknod)
 570:	b8 11 00 00 00       	mov    $0x11,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <unlink>:
SYSCALL(unlink)
 578:	b8 12 00 00 00       	mov    $0x12,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <fstat>:
SYSCALL(fstat)
 580:	b8 08 00 00 00       	mov    $0x8,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <link>:
SYSCALL(link)
 588:	b8 13 00 00 00       	mov    $0x13,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <mkdir>:
SYSCALL(mkdir)
 590:	b8 14 00 00 00       	mov    $0x14,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <chdir>:
SYSCALL(chdir)
 598:	b8 09 00 00 00       	mov    $0x9,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <dup>:
SYSCALL(dup)
 5a0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <getpid>:
SYSCALL(getpid)
 5a8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <sbrk>:
SYSCALL(sbrk)
 5b0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <sleep>:
SYSCALL(sleep)
 5b8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <uptime>:
SYSCALL(uptime)
 5c0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <clone>:
SYSCALL(clone)
 5c8:	b8 16 00 00 00       	mov    $0x16,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <join>:
 5d0:	b8 17 00 00 00       	mov    $0x17,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5d8:	55                   	push   %ebp
 5d9:	89 e5                	mov    %esp,%ebp
 5db:	83 ec 1c             	sub    $0x1c,%esp
 5de:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5e1:	6a 01                	push   $0x1
 5e3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5e6:	52                   	push   %edx
 5e7:	50                   	push   %eax
 5e8:	e8 5b ff ff ff       	call   548 <write>
}
 5ed:	83 c4 10             	add    $0x10,%esp
 5f0:	c9                   	leave  
 5f1:	c3                   	ret    

000005f2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5f2:	55                   	push   %ebp
 5f3:	89 e5                	mov    %esp,%ebp
 5f5:	57                   	push   %edi
 5f6:	56                   	push   %esi
 5f7:	53                   	push   %ebx
 5f8:	83 ec 2c             	sub    $0x2c,%esp
 5fb:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5fe:	89 d0                	mov    %edx,%eax
 600:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 602:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 606:	0f 95 c1             	setne  %cl
 609:	c1 ea 1f             	shr    $0x1f,%edx
 60c:	84 d1                	test   %dl,%cl
 60e:	74 44                	je     654 <printint+0x62>
    neg = 1;
    x = -xx;
 610:	f7 d8                	neg    %eax
 612:	89 c1                	mov    %eax,%ecx
    neg = 1;
 614:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 61b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 620:	89 c8                	mov    %ecx,%eax
 622:	ba 00 00 00 00       	mov    $0x0,%edx
 627:	f7 f6                	div    %esi
 629:	89 df                	mov    %ebx,%edi
 62b:	83 c3 01             	add    $0x1,%ebx
 62e:	0f b6 92 14 0a 00 00 	movzbl 0xa14(%edx),%edx
 635:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 639:	89 ca                	mov    %ecx,%edx
 63b:	89 c1                	mov    %eax,%ecx
 63d:	39 d6                	cmp    %edx,%esi
 63f:	76 df                	jbe    620 <printint+0x2e>
  if(neg)
 641:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 645:	74 31                	je     678 <printint+0x86>
    buf[i++] = '-';
 647:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 64c:	8d 5f 02             	lea    0x2(%edi),%ebx
 64f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 652:	eb 17                	jmp    66b <printint+0x79>
    x = xx;
 654:	89 c1                	mov    %eax,%ecx
  neg = 0;
 656:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 65d:	eb bc                	jmp    61b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 65f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 664:	89 f0                	mov    %esi,%eax
 666:	e8 6d ff ff ff       	call   5d8 <putc>
  while(--i >= 0)
 66b:	83 eb 01             	sub    $0x1,%ebx
 66e:	79 ef                	jns    65f <printint+0x6d>
}
 670:	83 c4 2c             	add    $0x2c,%esp
 673:	5b                   	pop    %ebx
 674:	5e                   	pop    %esi
 675:	5f                   	pop    %edi
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    
 678:	8b 75 d0             	mov    -0x30(%ebp),%esi
 67b:	eb ee                	jmp    66b <printint+0x79>

0000067d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 67d:	55                   	push   %ebp
 67e:	89 e5                	mov    %esp,%ebp
 680:	57                   	push   %edi
 681:	56                   	push   %esi
 682:	53                   	push   %ebx
 683:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 686:	8d 45 10             	lea    0x10(%ebp),%eax
 689:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 68c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 691:	bb 00 00 00 00       	mov    $0x0,%ebx
 696:	eb 14                	jmp    6ac <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 698:	89 fa                	mov    %edi,%edx
 69a:	8b 45 08             	mov    0x8(%ebp),%eax
 69d:	e8 36 ff ff ff       	call   5d8 <putc>
 6a2:	eb 05                	jmp    6a9 <printf+0x2c>
      }
    } else if(state == '%'){
 6a4:	83 fe 25             	cmp    $0x25,%esi
 6a7:	74 25                	je     6ce <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6a9:	83 c3 01             	add    $0x1,%ebx
 6ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 6af:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6b3:	84 c0                	test   %al,%al
 6b5:	0f 84 20 01 00 00    	je     7db <printf+0x15e>
    c = fmt[i] & 0xff;
 6bb:	0f be f8             	movsbl %al,%edi
 6be:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6c1:	85 f6                	test   %esi,%esi
 6c3:	75 df                	jne    6a4 <printf+0x27>
      if(c == '%'){
 6c5:	83 f8 25             	cmp    $0x25,%eax
 6c8:	75 ce                	jne    698 <printf+0x1b>
        state = '%';
 6ca:	89 c6                	mov    %eax,%esi
 6cc:	eb db                	jmp    6a9 <printf+0x2c>
      if(c == 'd'){
 6ce:	83 f8 25             	cmp    $0x25,%eax
 6d1:	0f 84 cf 00 00 00    	je     7a6 <printf+0x129>
 6d7:	0f 8c dd 00 00 00    	jl     7ba <printf+0x13d>
 6dd:	83 f8 78             	cmp    $0x78,%eax
 6e0:	0f 8f d4 00 00 00    	jg     7ba <printf+0x13d>
 6e6:	83 f8 63             	cmp    $0x63,%eax
 6e9:	0f 8c cb 00 00 00    	jl     7ba <printf+0x13d>
 6ef:	83 e8 63             	sub    $0x63,%eax
 6f2:	83 f8 15             	cmp    $0x15,%eax
 6f5:	0f 87 bf 00 00 00    	ja     7ba <printf+0x13d>
 6fb:	ff 24 85 bc 09 00 00 	jmp    *0x9bc(,%eax,4)
        printint(fd, *ap, 10, 1);
 702:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 705:	8b 17                	mov    (%edi),%edx
 707:	83 ec 0c             	sub    $0xc,%esp
 70a:	6a 01                	push   $0x1
 70c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 711:	8b 45 08             	mov    0x8(%ebp),%eax
 714:	e8 d9 fe ff ff       	call   5f2 <printint>
        ap++;
 719:	83 c7 04             	add    $0x4,%edi
 71c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 71f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 722:	be 00 00 00 00       	mov    $0x0,%esi
 727:	eb 80                	jmp    6a9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 729:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 72c:	8b 17                	mov    (%edi),%edx
 72e:	83 ec 0c             	sub    $0xc,%esp
 731:	6a 00                	push   $0x0
 733:	b9 10 00 00 00       	mov    $0x10,%ecx
 738:	8b 45 08             	mov    0x8(%ebp),%eax
 73b:	e8 b2 fe ff ff       	call   5f2 <printint>
        ap++;
 740:	83 c7 04             	add    $0x4,%edi
 743:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 746:	83 c4 10             	add    $0x10,%esp
      state = 0;
 749:	be 00 00 00 00       	mov    $0x0,%esi
 74e:	e9 56 ff ff ff       	jmp    6a9 <printf+0x2c>
        s = (char*)*ap;
 753:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 756:	8b 30                	mov    (%eax),%esi
        ap++;
 758:	83 c0 04             	add    $0x4,%eax
 75b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 75e:	85 f6                	test   %esi,%esi
 760:	75 15                	jne    777 <printf+0xfa>
          s = "(null)";
 762:	be b2 09 00 00       	mov    $0x9b2,%esi
 767:	eb 0e                	jmp    777 <printf+0xfa>
          putc(fd, *s);
 769:	0f be d2             	movsbl %dl,%edx
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	e8 64 fe ff ff       	call   5d8 <putc>
          s++;
 774:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 777:	0f b6 16             	movzbl (%esi),%edx
 77a:	84 d2                	test   %dl,%dl
 77c:	75 eb                	jne    769 <printf+0xec>
      state = 0;
 77e:	be 00 00 00 00       	mov    $0x0,%esi
 783:	e9 21 ff ff ff       	jmp    6a9 <printf+0x2c>
        putc(fd, *ap);
 788:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 78b:	0f be 17             	movsbl (%edi),%edx
 78e:	8b 45 08             	mov    0x8(%ebp),%eax
 791:	e8 42 fe ff ff       	call   5d8 <putc>
        ap++;
 796:	83 c7 04             	add    $0x4,%edi
 799:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 79c:	be 00 00 00 00       	mov    $0x0,%esi
 7a1:	e9 03 ff ff ff       	jmp    6a9 <printf+0x2c>
        putc(fd, c);
 7a6:	89 fa                	mov    %edi,%edx
 7a8:	8b 45 08             	mov    0x8(%ebp),%eax
 7ab:	e8 28 fe ff ff       	call   5d8 <putc>
      state = 0;
 7b0:	be 00 00 00 00       	mov    $0x0,%esi
 7b5:	e9 ef fe ff ff       	jmp    6a9 <printf+0x2c>
        putc(fd, '%');
 7ba:	ba 25 00 00 00       	mov    $0x25,%edx
 7bf:	8b 45 08             	mov    0x8(%ebp),%eax
 7c2:	e8 11 fe ff ff       	call   5d8 <putc>
        putc(fd, c);
 7c7:	89 fa                	mov    %edi,%edx
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
 7cc:	e8 07 fe ff ff       	call   5d8 <putc>
      state = 0;
 7d1:	be 00 00 00 00       	mov    $0x0,%esi
 7d6:	e9 ce fe ff ff       	jmp    6a9 <printf+0x2c>
    }
  }
}
 7db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7de:	5b                   	pop    %ebx
 7df:	5e                   	pop    %esi
 7e0:	5f                   	pop    %edi
 7e1:	5d                   	pop    %ebp
 7e2:	c3                   	ret    

000007e3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e3:	55                   	push   %ebp
 7e4:	89 e5                	mov    %esp,%ebp
 7e6:	57                   	push   %edi
 7e7:	56                   	push   %esi
 7e8:	53                   	push   %ebx
 7e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ec:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ef:	a1 b8 0d 00 00       	mov    0xdb8,%eax
 7f4:	eb 02                	jmp    7f8 <free+0x15>
 7f6:	89 d0                	mov    %edx,%eax
 7f8:	39 c8                	cmp    %ecx,%eax
 7fa:	73 04                	jae    800 <free+0x1d>
 7fc:	39 08                	cmp    %ecx,(%eax)
 7fe:	77 12                	ja     812 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 800:	8b 10                	mov    (%eax),%edx
 802:	39 c2                	cmp    %eax,%edx
 804:	77 f0                	ja     7f6 <free+0x13>
 806:	39 c8                	cmp    %ecx,%eax
 808:	72 08                	jb     812 <free+0x2f>
 80a:	39 ca                	cmp    %ecx,%edx
 80c:	77 04                	ja     812 <free+0x2f>
 80e:	89 d0                	mov    %edx,%eax
 810:	eb e6                	jmp    7f8 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 812:	8b 73 fc             	mov    -0x4(%ebx),%esi
 815:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 818:	8b 10                	mov    (%eax),%edx
 81a:	39 d7                	cmp    %edx,%edi
 81c:	74 19                	je     837 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 81e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 821:	8b 50 04             	mov    0x4(%eax),%edx
 824:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 827:	39 ce                	cmp    %ecx,%esi
 829:	74 1b                	je     846 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 82b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 82d:	a3 b8 0d 00 00       	mov    %eax,0xdb8
}
 832:	5b                   	pop    %ebx
 833:	5e                   	pop    %esi
 834:	5f                   	pop    %edi
 835:	5d                   	pop    %ebp
 836:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 837:	03 72 04             	add    0x4(%edx),%esi
 83a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 83d:	8b 10                	mov    (%eax),%edx
 83f:	8b 12                	mov    (%edx),%edx
 841:	89 53 f8             	mov    %edx,-0x8(%ebx)
 844:	eb db                	jmp    821 <free+0x3e>
    p->s.size += bp->s.size;
 846:	03 53 fc             	add    -0x4(%ebx),%edx
 849:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 84c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 84f:	89 10                	mov    %edx,(%eax)
 851:	eb da                	jmp    82d <free+0x4a>

00000853 <morecore>:

static Header*
morecore(uint nu)
{
 853:	55                   	push   %ebp
 854:	89 e5                	mov    %esp,%ebp
 856:	53                   	push   %ebx
 857:	83 ec 04             	sub    $0x4,%esp
 85a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 85c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 861:	77 05                	ja     868 <morecore+0x15>
    nu = 4096;
 863:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 868:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 86f:	83 ec 0c             	sub    $0xc,%esp
 872:	50                   	push   %eax
 873:	e8 38 fd ff ff       	call   5b0 <sbrk>
  if(p == (char*)-1)
 878:	83 c4 10             	add    $0x10,%esp
 87b:	83 f8 ff             	cmp    $0xffffffff,%eax
 87e:	74 1c                	je     89c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 880:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 883:	83 c0 08             	add    $0x8,%eax
 886:	83 ec 0c             	sub    $0xc,%esp
 889:	50                   	push   %eax
 88a:	e8 54 ff ff ff       	call   7e3 <free>
  return freep;
 88f:	a1 b8 0d 00 00       	mov    0xdb8,%eax
 894:	83 c4 10             	add    $0x10,%esp
}
 897:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 89a:	c9                   	leave  
 89b:	c3                   	ret    
    return 0;
 89c:	b8 00 00 00 00       	mov    $0x0,%eax
 8a1:	eb f4                	jmp    897 <morecore+0x44>

000008a3 <malloc>:

void*
malloc(uint nbytes)
{
 8a3:	55                   	push   %ebp
 8a4:	89 e5                	mov    %esp,%ebp
 8a6:	53                   	push   %ebx
 8a7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8aa:	8b 45 08             	mov    0x8(%ebp),%eax
 8ad:	8d 58 07             	lea    0x7(%eax),%ebx
 8b0:	c1 eb 03             	shr    $0x3,%ebx
 8b3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8b6:	8b 0d b8 0d 00 00    	mov    0xdb8,%ecx
 8bc:	85 c9                	test   %ecx,%ecx
 8be:	74 04                	je     8c4 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	8b 01                	mov    (%ecx),%eax
 8c2:	eb 4a                	jmp    90e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8c4:	c7 05 b8 0d 00 00 bc 	movl   $0xdbc,0xdb8
 8cb:	0d 00 00 
 8ce:	c7 05 bc 0d 00 00 bc 	movl   $0xdbc,0xdbc
 8d5:	0d 00 00 
    base.s.size = 0;
 8d8:	c7 05 c0 0d 00 00 00 	movl   $0x0,0xdc0
 8df:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8e2:	b9 bc 0d 00 00       	mov    $0xdbc,%ecx
 8e7:	eb d7                	jmp    8c0 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8e9:	74 19                	je     904 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8eb:	29 da                	sub    %ebx,%edx
 8ed:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8f3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8f6:	89 0d b8 0d 00 00    	mov    %ecx,0xdb8
      return (void*)(p + 1);
 8fc:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 902:	c9                   	leave  
 903:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 904:	8b 10                	mov    (%eax),%edx
 906:	89 11                	mov    %edx,(%ecx)
 908:	eb ec                	jmp    8f6 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 90a:	89 c1                	mov    %eax,%ecx
 90c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 90e:	8b 50 04             	mov    0x4(%eax),%edx
 911:	39 da                	cmp    %ebx,%edx
 913:	73 d4                	jae    8e9 <malloc+0x46>
    if(p == freep)
 915:	39 05 b8 0d 00 00    	cmp    %eax,0xdb8
 91b:	75 ed                	jne    90a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 91d:	89 d8                	mov    %ebx,%eax
 91f:	e8 2f ff ff ff       	call   853 <morecore>
 924:	85 c0                	test   %eax,%eax
 926:	75 e2                	jne    90a <malloc+0x67>
 928:	eb d5                	jmp    8ff <malloc+0x5c>
