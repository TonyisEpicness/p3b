
_test_4:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void worker(void *arg1, void *arg2);

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  13:	e8 0b 05 00 00       	call   523 <getpid>
   void *stack, *p = malloc(PGSIZE * 2);
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	68 00 20 00 00       	push   $0x2000
   ppid = getpid();
  20:	a3 bc 0d 00 00       	mov    %eax,0xdbc
   void *stack, *p = malloc(PGSIZE * 2);
  25:	e8 16 08 00 00       	call   840 <malloc>
   assert(p != NULL);
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	85 c0                	test   %eax,%eax
  2f:	0f 84 29 01 00 00    	je     15e <main+0x15e>
  35:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE == 0)
     stack = p + 4;
  37:	8d 40 04             	lea    0x4(%eax),%eax
  3a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
  40:	0f 45 c3             	cmovne %ebx,%eax
   else
     stack = p;

   assert(clone(worker, 0, 0, stack) == -1);
  43:	50                   	push   %eax
  44:	6a 00                	push   $0x0
  46:	6a 00                	push   $0x0
  48:	68 c0 01 00 00       	push   $0x1c0
  4d:	e8 f1 04 00 00       	call   543 <clone>
  52:	83 c4 10             	add    $0x10,%esp
  55:	83 f8 ff             	cmp    $0xffffffff,%eax
  58:	74 46                	je     a0 <main+0xa0>
  5a:	6a 21                	push   $0x21
  5c:	68 38 09 00 00       	push   $0x938
  61:	68 41 09 00 00       	push   $0x941
  66:	6a 01                	push   $0x1
  68:	e8 a3 05 00 00       	call   610 <printf>
  6d:	83 c4 0c             	add    $0xc,%esp
  70:	68 9c 09 00 00       	push   $0x99c
  75:	68 53 09 00 00       	push   $0x953
  7a:	6a 01                	push   $0x1
  7c:	e8 8f 05 00 00       	call   610 <printf>
  81:	5a                   	pop    %edx
  82:	59                   	pop    %ecx
  83:	68 67 09 00 00       	push   $0x967
  88:	6a 01                	push   $0x1
  8a:	e8 81 05 00 00       	call   610 <printf>
  8f:	5b                   	pop    %ebx
  90:	ff 35 bc 0d 00 00    	push   0xdbc
  96:	e8 38 04 00 00       	call   4d3 <kill>
  9b:	e8 03 04 00 00       	call   4a3 <exit>

   stack = sbrk(0);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	6a 00                	push   $0x0
  a5:	e8 81 04 00 00       	call   52b <sbrk>
   if((uint)stack % PGSIZE)
  aa:	83 c4 10             	add    $0x10,%esp
   stack = sbrk(0);
  ad:	89 c6                	mov    %eax,%esi
   if((uint)stack % PGSIZE)
  af:	25 ff 0f 00 00       	and    $0xfff,%eax
  b4:	75 59                	jne    10f <main+0x10f>
     stack = stack + (PGSIZE - (uint)stack % PGSIZE);
   sbrk( ((uint)stack - (uint)sbrk(0)) + PGSIZE/2 );
  b6:	83 ec 0c             	sub    $0xc,%esp
  b9:	6a 00                	push   $0x0
  bb:	e8 6b 04 00 00       	call   52b <sbrk>
  c0:	89 c2                	mov    %eax,%edx
  c2:	8d 86 00 08 00 00    	lea    0x800(%esi),%eax
  c8:	29 d0                	sub    %edx,%eax
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 59 04 00 00       	call   52b <sbrk>
  d2:	83 c4 10             	add    $0x10,%esp
   assert((uint)stack % PGSIZE == 0);
   assert((uint)sbrk(0) - (uint)stack == PGSIZE/2);
  d5:	83 ec 0c             	sub    $0xc,%esp
  d8:	6a 00                	push   $0x0
  da:	e8 4c 04 00 00       	call   52b <sbrk>
  df:	83 c4 10             	add    $0x10,%esp
  e2:	29 f0                	sub    %esi,%eax
  e4:	3d 00 08 00 00       	cmp    $0x800,%eax
  e9:	0f 84 8f 00 00 00    	je     17e <main+0x17e>
  ef:	6a 28                	push   $0x28
  f1:	68 38 09 00 00       	push   $0x938
  f6:	68 41 09 00 00       	push   $0x941
  fb:	6a 01                	push   $0x1
  fd:	e8 0e 05 00 00       	call   610 <printf>
 102:	83 c4 0c             	add    $0xc,%esp
 105:	68 c0 09 00 00       	push   $0x9c0
 10a:	e9 66 ff ff ff       	jmp    75 <main+0x75>
   sbrk( ((uint)stack - (uint)sbrk(0)) + PGSIZE/2 );
 10f:	83 ec 0c             	sub    $0xc,%esp
     stack = stack + (PGSIZE - (uint)stack % PGSIZE);
 112:	29 c6                	sub    %eax,%esi
   sbrk( ((uint)stack - (uint)sbrk(0)) + PGSIZE/2 );
 114:	6a 00                	push   $0x0
     stack = stack + (PGSIZE - (uint)stack % PGSIZE);
 116:	81 c6 00 10 00 00    	add    $0x1000,%esi
   sbrk( ((uint)stack - (uint)sbrk(0)) + PGSIZE/2 );
 11c:	e8 0a 04 00 00       	call   52b <sbrk>
 121:	89 c2                	mov    %eax,%edx
 123:	8d 86 00 08 00 00    	lea    0x800(%esi),%eax
 129:	29 d0                	sub    %edx,%eax
 12b:	89 04 24             	mov    %eax,(%esp)
 12e:	e8 f8 03 00 00       	call   52b <sbrk>
   assert((uint)stack % PGSIZE == 0);
 133:	83 c4 10             	add    $0x10,%esp
 136:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
 13c:	74 97                	je     d5 <main+0xd5>
 13e:	6a 27                	push   $0x27
 140:	68 38 09 00 00       	push   $0x938
 145:	68 41 09 00 00       	push   $0x941
 14a:	6a 01                	push   $0x1
 14c:	e8 bf 04 00 00       	call   610 <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 74 09 00 00       	push   $0x974
 159:	e9 17 ff ff ff       	jmp    75 <main+0x75>
   assert(p != NULL);
 15e:	6a 1b                	push   $0x1b
 160:	68 38 09 00 00       	push   $0x938
 165:	68 41 09 00 00       	push   $0x941
 16a:	6a 01                	push   $0x1
 16c:	e8 9f 04 00 00       	call   610 <printf>
 171:	83 c4 0c             	add    $0xc,%esp
 174:	68 49 09 00 00       	push   $0x949
 179:	e9 f7 fe ff ff       	jmp    75 <main+0x75>

   assert(clone(worker, 0, 0, stack) == -1);
 17e:	56                   	push   %esi
 17f:	6a 00                	push   $0x0
 181:	6a 00                	push   $0x0
 183:	68 c0 01 00 00       	push   $0x1c0
 188:	e8 b6 03 00 00       	call   543 <clone>
 18d:	83 c4 10             	add    $0x10,%esp
 190:	83 c0 01             	add    $0x1,%eax
 193:	74 07                	je     19c <main+0x19c>
 195:	6a 2a                	push   $0x2a
 197:	e9 c0 fe ff ff       	jmp    5c <main+0x5c>
   
   printf(1, "TEST PASSED\n");
 19c:	50                   	push   %eax
 19d:	50                   	push   %eax
 19e:	68 8e 09 00 00       	push   $0x98e
 1a3:	6a 01                	push   $0x1
 1a5:	e8 66 04 00 00       	call   610 <printf>
   free(p);
 1aa:	89 1c 24             	mov    %ebx,(%esp)
 1ad:	e8 fe 05 00 00       	call   7b0 <free>
   exit();
 1b2:	e8 ec 02 00 00       	call   4a3 <exit>
 1b7:	66 90                	xchg   %ax,%ax
 1b9:	66 90                	xchg   %ax,%ax
 1bb:	66 90                	xchg   %ax,%ax
 1bd:	66 90                	xchg   %ax,%ax
 1bf:	90                   	nop

000001c0 <worker>:
}

void
worker(void *arg1, void *arg2) {
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	83 ec 08             	sub    $0x8,%esp
   exit();
 1c6:	e8 d8 02 00 00       	call   4a3 <exit>
 1cb:	66 90                	xchg   %ax,%ax
 1cd:	66 90                	xchg   %ax,%ax
 1cf:	90                   	nop

000001d0 <test_and_set>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int test_and_set(int *old_ptr, int new_ptr) {
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  *old_ptr = new_ptr;
 1d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *old_ptr;
 1d9:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 1db:	89 08                	mov    %ecx,(%eax)
  return old;
}
 1dd:	5d                   	pop    %ebp
 1de:	89 d0                	mov    %edx,%eax
 1e0:	c3                   	ret    
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  return 0;
}
 1f0:	31 c0                	xor    %eax,%eax
 1f2:	c3                   	ret    
 1f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <thread_join>:

int thread_join() {
  return 0;
}
 200:	31 c0                	xor    %eax,%eax
 202:	c3                   	ret    
 203:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000210 <lock_acquire>:

void lock_acquire(lock_t *lock){
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 45 08             	mov    0x8(%ebp),%eax
  while(test_and_set(&lock->flag, 1) == 1)
 216:	83 38 01             	cmpl   $0x1,(%eax)
 219:	75 05                	jne    220 <lock_acquire+0x10>
 21b:	eb fe                	jmp    21b <lock_acquire+0xb>
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 226:	5d                   	pop    %ebp
 227:	c3                   	ret    
 228:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <lock_release>:

void lock_release(lock_t *lock) {
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 23c:	5d                   	pop    %ebp
 23d:	c3                   	ret    
 23e:	66 90                	xchg   %ax,%ax

00000240 <lock_init>:
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 45 08             	mov    0x8(%ebp),%eax
 246:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 24c:	5d                   	pop    %ebp
 24d:	c3                   	ret    
 24e:	66 90                	xchg   %ax,%ax

00000250 <strcpy>:
  lock->flag = 0;
}

char*
strcpy(char *s, const char *t)
{
 250:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 251:	31 c0                	xor    %eax,%eax
{
 253:	89 e5                	mov    %esp,%ebp
 255:	53                   	push   %ebx
 256:	8b 4d 08             	mov    0x8(%ebp),%ecx
 259:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 260:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 264:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 267:	83 c0 01             	add    $0x1,%eax
 26a:	84 d2                	test   %dl,%dl
 26c:	75 f2                	jne    260 <strcpy+0x10>
    ;
  return os;
}
 26e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 271:	89 c8                	mov    %ecx,%eax
 273:	c9                   	leave  
 274:	c3                   	ret    
 275:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 55 08             	mov    0x8(%ebp),%edx
 287:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 28a:	0f b6 02             	movzbl (%edx),%eax
 28d:	84 c0                	test   %al,%al
 28f:	75 17                	jne    2a8 <strcmp+0x28>
 291:	eb 3a                	jmp    2cd <strcmp+0x4d>
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 29c:	83 c2 01             	add    $0x1,%edx
 29f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 2a2:	84 c0                	test   %al,%al
 2a4:	74 1a                	je     2c0 <strcmp+0x40>
    p++, q++;
 2a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 2a8:	0f b6 19             	movzbl (%ecx),%ebx
 2ab:	38 c3                	cmp    %al,%bl
 2ad:	74 e9                	je     298 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 2af:	29 d8                	sub    %ebx,%eax
}
 2b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b4:	c9                   	leave  
 2b5:	c3                   	ret    
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 2c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 2c4:	31 c0                	xor    %eax,%eax
 2c6:	29 d8                	sub    %ebx,%eax
}
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 2cd:	0f b6 19             	movzbl (%ecx),%ebx
 2d0:	31 c0                	xor    %eax,%eax
 2d2:	eb db                	jmp    2af <strcmp+0x2f>
 2d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop

000002e0 <strlen>:

uint
strlen(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2e6:	80 3a 00             	cmpb   $0x0,(%edx)
 2e9:	74 15                	je     300 <strlen+0x20>
 2eb:	31 c0                	xor    %eax,%eax
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
 2f0:	83 c0 01             	add    $0x1,%eax
 2f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2f7:	89 c1                	mov    %eax,%ecx
 2f9:	75 f5                	jne    2f0 <strlen+0x10>
    ;
  return n;
}
 2fb:	89 c8                	mov    %ecx,%eax
 2fd:	5d                   	pop    %ebp
 2fe:	c3                   	ret    
 2ff:	90                   	nop
  for(n = 0; s[n]; n++)
 300:	31 c9                	xor    %ecx,%ecx
}
 302:	5d                   	pop    %ebp
 303:	89 c8                	mov    %ecx,%eax
 305:	c3                   	ret    
 306:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30d:	8d 76 00             	lea    0x0(%esi),%esi

00000310 <memset>:

void*
memset(void *dst, int c, uint n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 317:	8b 4d 10             	mov    0x10(%ebp),%ecx
 31a:	8b 45 0c             	mov    0xc(%ebp),%eax
 31d:	89 d7                	mov    %edx,%edi
 31f:	fc                   	cld    
 320:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 322:	8b 7d fc             	mov    -0x4(%ebp),%edi
 325:	89 d0                	mov    %edx,%eax
 327:	c9                   	leave  
 328:	c3                   	ret    
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000330 <strchr>:

char*
strchr(const char *s, char c)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 33a:	0f b6 10             	movzbl (%eax),%edx
 33d:	84 d2                	test   %dl,%dl
 33f:	75 12                	jne    353 <strchr+0x23>
 341:	eb 1d                	jmp    360 <strchr+0x30>
 343:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 347:	90                   	nop
 348:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 34c:	83 c0 01             	add    $0x1,%eax
 34f:	84 d2                	test   %dl,%dl
 351:	74 0d                	je     360 <strchr+0x30>
    if(*s == c)
 353:	38 d1                	cmp    %dl,%cl
 355:	75 f1                	jne    348 <strchr+0x18>
      return (char*)s;
  return 0;
}
 357:	5d                   	pop    %ebp
 358:	c3                   	ret    
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 360:	31 c0                	xor    %eax,%eax
}
 362:	5d                   	pop    %ebp
 363:	c3                   	ret    
 364:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <gets>:

char*
gets(char *buf, int max)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 375:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 378:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 379:	31 db                	xor    %ebx,%ebx
{
 37b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 37e:	eb 27                	jmp    3a7 <gets+0x37>
    cc = read(0, &c, 1);
 380:	83 ec 04             	sub    $0x4,%esp
 383:	6a 01                	push   $0x1
 385:	57                   	push   %edi
 386:	6a 00                	push   $0x0
 388:	e8 2e 01 00 00       	call   4bb <read>
    if(cc < 1)
 38d:	83 c4 10             	add    $0x10,%esp
 390:	85 c0                	test   %eax,%eax
 392:	7e 1d                	jle    3b1 <gets+0x41>
      break;
    buf[i++] = c;
 394:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 398:	8b 55 08             	mov    0x8(%ebp),%edx
 39b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 39f:	3c 0a                	cmp    $0xa,%al
 3a1:	74 1d                	je     3c0 <gets+0x50>
 3a3:	3c 0d                	cmp    $0xd,%al
 3a5:	74 19                	je     3c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 3a7:	89 de                	mov    %ebx,%esi
 3a9:	83 c3 01             	add    $0x1,%ebx
 3ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3af:	7c cf                	jl     380 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3b1:	8b 45 08             	mov    0x8(%ebp),%eax
 3b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bb:	5b                   	pop    %ebx
 3bc:	5e                   	pop    %esi
 3bd:	5f                   	pop    %edi
 3be:	5d                   	pop    %ebp
 3bf:	c3                   	ret    
  buf[i] = '\0';
 3c0:	8b 45 08             	mov    0x8(%ebp),%eax
 3c3:	89 de                	mov    %ebx,%esi
 3c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 3c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3cc:	5b                   	pop    %ebx
 3cd:	5e                   	pop    %esi
 3ce:	5f                   	pop    %edi
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e5:	83 ec 08             	sub    $0x8,%esp
 3e8:	6a 00                	push   $0x0
 3ea:	ff 75 08             	push   0x8(%ebp)
 3ed:	e8 f1 00 00 00       	call   4e3 <open>
  if(fd < 0)
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	85 c0                	test   %eax,%eax
 3f7:	78 27                	js     420 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3f9:	83 ec 08             	sub    $0x8,%esp
 3fc:	ff 75 0c             	push   0xc(%ebp)
 3ff:	89 c3                	mov    %eax,%ebx
 401:	50                   	push   %eax
 402:	e8 f4 00 00 00       	call   4fb <fstat>
  close(fd);
 407:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 40a:	89 c6                	mov    %eax,%esi
  close(fd);
 40c:	e8 ba 00 00 00       	call   4cb <close>
  return r;
 411:	83 c4 10             	add    $0x10,%esp
}
 414:	8d 65 f8             	lea    -0x8(%ebp),%esp
 417:	89 f0                	mov    %esi,%eax
 419:	5b                   	pop    %ebx
 41a:	5e                   	pop    %esi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
 41d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 420:	be ff ff ff ff       	mov    $0xffffffff,%esi
 425:	eb ed                	jmp    414 <stat+0x34>
 427:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42e:	66 90                	xchg   %ax,%ax

00000430 <atoi>:

int
atoi(const char *s)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	53                   	push   %ebx
 434:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 437:	0f be 02             	movsbl (%edx),%eax
 43a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 43d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 440:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 445:	77 1e                	ja     465 <atoi+0x35>
 447:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 450:	83 c2 01             	add    $0x1,%edx
 453:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 456:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 45a:	0f be 02             	movsbl (%edx),%eax
 45d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 460:	80 fb 09             	cmp    $0x9,%bl
 463:	76 eb                	jbe    450 <atoi+0x20>
  return n;
}
 465:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 468:	89 c8                	mov    %ecx,%eax
 46a:	c9                   	leave  
 46b:	c3                   	ret    
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000470 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	8b 45 10             	mov    0x10(%ebp),%eax
 477:	8b 55 08             	mov    0x8(%ebp),%edx
 47a:	56                   	push   %esi
 47b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 47e:	85 c0                	test   %eax,%eax
 480:	7e 13                	jle    495 <memmove+0x25>
 482:	01 d0                	add    %edx,%eax
  dst = vdst;
 484:	89 d7                	mov    %edx,%edi
 486:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 490:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 491:	39 f8                	cmp    %edi,%eax
 493:	75 fb                	jne    490 <memmove+0x20>
  return vdst;
}
 495:	5e                   	pop    %esi
 496:	89 d0                	mov    %edx,%eax
 498:	5f                   	pop    %edi
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    

0000049b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 49b:	b8 01 00 00 00       	mov    $0x1,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <exit>:
SYSCALL(exit)
 4a3:	b8 02 00 00 00       	mov    $0x2,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <wait>:
SYSCALL(wait)
 4ab:	b8 03 00 00 00       	mov    $0x3,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <pipe>:
SYSCALL(pipe)
 4b3:	b8 04 00 00 00       	mov    $0x4,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <read>:
SYSCALL(read)
 4bb:	b8 05 00 00 00       	mov    $0x5,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <write>:
SYSCALL(write)
 4c3:	b8 10 00 00 00       	mov    $0x10,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <close>:
SYSCALL(close)
 4cb:	b8 15 00 00 00       	mov    $0x15,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <kill>:
SYSCALL(kill)
 4d3:	b8 06 00 00 00       	mov    $0x6,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <exec>:
SYSCALL(exec)
 4db:	b8 07 00 00 00       	mov    $0x7,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <open>:
SYSCALL(open)
 4e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <mknod>:
SYSCALL(mknod)
 4eb:	b8 11 00 00 00       	mov    $0x11,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <unlink>:
SYSCALL(unlink)
 4f3:	b8 12 00 00 00       	mov    $0x12,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <fstat>:
SYSCALL(fstat)
 4fb:	b8 08 00 00 00       	mov    $0x8,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <link>:
SYSCALL(link)
 503:	b8 13 00 00 00       	mov    $0x13,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <mkdir>:
SYSCALL(mkdir)
 50b:	b8 14 00 00 00       	mov    $0x14,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <chdir>:
SYSCALL(chdir)
 513:	b8 09 00 00 00       	mov    $0x9,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <dup>:
SYSCALL(dup)
 51b:	b8 0a 00 00 00       	mov    $0xa,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <getpid>:
SYSCALL(getpid)
 523:	b8 0b 00 00 00       	mov    $0xb,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <sbrk>:
SYSCALL(sbrk)
 52b:	b8 0c 00 00 00       	mov    $0xc,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <sleep>:
SYSCALL(sleep)
 533:	b8 0d 00 00 00       	mov    $0xd,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <uptime>:
SYSCALL(uptime)
 53b:	b8 0e 00 00 00       	mov    $0xe,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <clone>:
SYSCALL(clone)
 543:	b8 16 00 00 00       	mov    $0x16,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <join>:
 54b:	b8 17 00 00 00       	mov    $0x17,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    
 553:	66 90                	xchg   %ax,%ax
 555:	66 90                	xchg   %ax,%ax
 557:	66 90                	xchg   %ax,%ax
 559:	66 90                	xchg   %ax,%ax
 55b:	66 90                	xchg   %ax,%ax
 55d:	66 90                	xchg   %ax,%ax
 55f:	90                   	nop

00000560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 3c             	sub    $0x3c,%esp
 569:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 56c:	89 d1                	mov    %edx,%ecx
{
 56e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 571:	85 d2                	test   %edx,%edx
 573:	0f 89 7f 00 00 00    	jns    5f8 <printint+0x98>
 579:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 57d:	74 79                	je     5f8 <printint+0x98>
    neg = 1;
 57f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 586:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 588:	31 db                	xor    %ebx,%ebx
 58a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 590:	89 c8                	mov    %ecx,%eax
 592:	31 d2                	xor    %edx,%edx
 594:	89 cf                	mov    %ecx,%edi
 596:	f7 75 c4             	divl   -0x3c(%ebp)
 599:	0f b6 92 48 0a 00 00 	movzbl 0xa48(%edx),%edx
 5a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5a3:	89 d8                	mov    %ebx,%eax
 5a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5b1:	76 dd                	jbe    590 <printint+0x30>
  if(neg)
 5b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5b6:	85 c9                	test   %ecx,%ecx
 5b8:	74 0c                	je     5c6 <printint+0x66>
    buf[i++] = '-';
 5ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5cd:	eb 07                	jmp    5d6 <printint+0x76>
 5cf:	90                   	nop
    putc(fd, buf[i]);
 5d0:	0f b6 13             	movzbl (%ebx),%edx
 5d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5d6:	83 ec 04             	sub    $0x4,%esp
 5d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5dc:	6a 01                	push   $0x1
 5de:	56                   	push   %esi
 5df:	57                   	push   %edi
 5e0:	e8 de fe ff ff       	call   4c3 <write>
  while(--i >= 0)
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	39 de                	cmp    %ebx,%esi
 5ea:	75 e4                	jne    5d0 <printint+0x70>
}
 5ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ef:	5b                   	pop    %ebx
 5f0:	5e                   	pop    %esi
 5f1:	5f                   	pop    %edi
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5ff:	eb 87                	jmp    588 <printint+0x28>
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop

00000610 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 619:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 61c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 61f:	0f b6 13             	movzbl (%ebx),%edx
 622:	84 d2                	test   %dl,%dl
 624:	74 6a                	je     690 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 626:	8d 45 10             	lea    0x10(%ebp),%eax
 629:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 62c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 62f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 631:	89 45 d0             	mov    %eax,-0x30(%ebp)
 634:	eb 36                	jmp    66c <printf+0x5c>
 636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63d:	8d 76 00             	lea    0x0(%esi),%esi
 640:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 643:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 648:	83 f8 25             	cmp    $0x25,%eax
 64b:	74 15                	je     662 <printf+0x52>
  write(fd, &c, 1);
 64d:	83 ec 04             	sub    $0x4,%esp
 650:	88 55 e7             	mov    %dl,-0x19(%ebp)
 653:	6a 01                	push   $0x1
 655:	57                   	push   %edi
 656:	56                   	push   %esi
 657:	e8 67 fe ff ff       	call   4c3 <write>
 65c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 65f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 662:	0f b6 13             	movzbl (%ebx),%edx
 665:	83 c3 01             	add    $0x1,%ebx
 668:	84 d2                	test   %dl,%dl
 66a:	74 24                	je     690 <printf+0x80>
    c = fmt[i] & 0xff;
 66c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 66f:	85 c9                	test   %ecx,%ecx
 671:	74 cd                	je     640 <printf+0x30>
      }
    } else if(state == '%'){
 673:	83 f9 25             	cmp    $0x25,%ecx
 676:	75 ea                	jne    662 <printf+0x52>
      if(c == 'd'){
 678:	83 f8 25             	cmp    $0x25,%eax
 67b:	0f 84 07 01 00 00    	je     788 <printf+0x178>
 681:	83 e8 63             	sub    $0x63,%eax
 684:	83 f8 15             	cmp    $0x15,%eax
 687:	77 17                	ja     6a0 <printf+0x90>
 689:	ff 24 85 f0 09 00 00 	jmp    *0x9f0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 690:	8d 65 f4             	lea    -0xc(%ebp),%esp
 693:	5b                   	pop    %ebx
 694:	5e                   	pop    %esi
 695:	5f                   	pop    %edi
 696:	5d                   	pop    %ebp
 697:	c3                   	ret    
 698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 6a6:	6a 01                	push   $0x1
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6ae:	e8 10 fe ff ff       	call   4c3 <write>
        putc(fd, c);
 6b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6b7:	83 c4 0c             	add    $0xc,%esp
 6ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6bd:	6a 01                	push   $0x1
 6bf:	57                   	push   %edi
 6c0:	56                   	push   %esi
 6c1:	e8 fd fd ff ff       	call   4c3 <write>
        putc(fd, c);
 6c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6c9:	31 c9                	xor    %ecx,%ecx
 6cb:	eb 95                	jmp    662 <printf+0x52>
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6d0:	83 ec 0c             	sub    $0xc,%esp
 6d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d8:	6a 00                	push   $0x0
 6da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6dd:	8b 10                	mov    (%eax),%edx
 6df:	89 f0                	mov    %esi,%eax
 6e1:	e8 7a fe ff ff       	call   560 <printint>
        ap++;
 6e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ed:	31 c9                	xor    %ecx,%ecx
 6ef:	e9 6e ff ff ff       	jmp    662 <printf+0x52>
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6fb:	8b 10                	mov    (%eax),%edx
        ap++;
 6fd:	83 c0 04             	add    $0x4,%eax
 700:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 703:	85 d2                	test   %edx,%edx
 705:	0f 84 8d 00 00 00    	je     798 <printf+0x188>
        while(*s != 0){
 70b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 70e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 710:	84 c0                	test   %al,%al
 712:	0f 84 4a ff ff ff    	je     662 <printf+0x52>
 718:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 71b:	89 d3                	mov    %edx,%ebx
 71d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 720:	83 ec 04             	sub    $0x4,%esp
          s++;
 723:	83 c3 01             	add    $0x1,%ebx
 726:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 729:	6a 01                	push   $0x1
 72b:	57                   	push   %edi
 72c:	56                   	push   %esi
 72d:	e8 91 fd ff ff       	call   4c3 <write>
        while(*s != 0){
 732:	0f b6 03             	movzbl (%ebx),%eax
 735:	83 c4 10             	add    $0x10,%esp
 738:	84 c0                	test   %al,%al
 73a:	75 e4                	jne    720 <printf+0x110>
      state = 0;
 73c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 73f:	31 c9                	xor    %ecx,%ecx
 741:	e9 1c ff ff ff       	jmp    662 <printf+0x52>
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 0a 00 00 00       	mov    $0xa,%ecx
 758:	6a 01                	push   $0x1
 75a:	e9 7b ff ff ff       	jmp    6da <printf+0xca>
 75f:	90                   	nop
        putc(fd, *ap);
 760:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 763:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 766:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 768:	6a 01                	push   $0x1
 76a:	57                   	push   %edi
 76b:	56                   	push   %esi
        putc(fd, *ap);
 76c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 76f:	e8 4f fd ff ff       	call   4c3 <write>
        ap++;
 774:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 778:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77b:	31 c9                	xor    %ecx,%ecx
 77d:	e9 e0 fe ff ff       	jmp    662 <printf+0x52>
 782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 788:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 78b:	83 ec 04             	sub    $0x4,%esp
 78e:	e9 2a ff ff ff       	jmp    6bd <printf+0xad>
 793:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 797:	90                   	nop
          s = "(null)";
 798:	ba e8 09 00 00       	mov    $0x9e8,%edx
        while(*s != 0){
 79d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7a0:	b8 28 00 00 00       	mov    $0x28,%eax
 7a5:	89 d3                	mov    %edx,%ebx
 7a7:	e9 74 ff ff ff       	jmp    720 <printf+0x110>
 7ac:	66 90                	xchg   %ax,%ax
 7ae:	66 90                	xchg   %ax,%ax

000007b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b1:	a1 c0 0d 00 00       	mov    0xdc0,%eax
{
 7b6:	89 e5                	mov    %esp,%ebp
 7b8:	57                   	push   %edi
 7b9:	56                   	push   %esi
 7ba:	53                   	push   %ebx
 7bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7c8:	89 c2                	mov    %eax,%edx
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	39 ca                	cmp    %ecx,%edx
 7ce:	73 30                	jae    800 <free+0x50>
 7d0:	39 c1                	cmp    %eax,%ecx
 7d2:	72 04                	jb     7d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d4:	39 c2                	cmp    %eax,%edx
 7d6:	72 f0                	jb     7c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7de:	39 f8                	cmp    %edi,%eax
 7e0:	74 30                	je     812 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7e5:	8b 42 04             	mov    0x4(%edx),%eax
 7e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7eb:	39 f1                	cmp    %esi,%ecx
 7ed:	74 3a                	je     829 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7f1:	5b                   	pop    %ebx
  freep = p;
 7f2:	89 15 c0 0d 00 00    	mov    %edx,0xdc0
}
 7f8:	5e                   	pop    %esi
 7f9:	5f                   	pop    %edi
 7fa:	5d                   	pop    %ebp
 7fb:	c3                   	ret    
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 800:	39 c2                	cmp    %eax,%edx
 802:	72 c4                	jb     7c8 <free+0x18>
 804:	39 c1                	cmp    %eax,%ecx
 806:	73 c0                	jae    7c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 808:	8b 73 fc             	mov    -0x4(%ebx),%esi
 80b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 80e:	39 f8                	cmp    %edi,%eax
 810:	75 d0                	jne    7e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 812:	03 70 04             	add    0x4(%eax),%esi
 815:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 818:	8b 02                	mov    (%edx),%eax
 81a:	8b 00                	mov    (%eax),%eax
 81c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 81f:	8b 42 04             	mov    0x4(%edx),%eax
 822:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 825:	39 f1                	cmp    %esi,%ecx
 827:	75 c6                	jne    7ef <free+0x3f>
    p->s.size += bp->s.size;
 829:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 82c:	89 15 c0 0d 00 00    	mov    %edx,0xdc0
    p->s.size += bp->s.size;
 832:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 835:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 838:	89 0a                	mov    %ecx,(%edx)
}
 83a:	5b                   	pop    %ebx
 83b:	5e                   	pop    %esi
 83c:	5f                   	pop    %edi
 83d:	5d                   	pop    %ebp
 83e:	c3                   	ret    
 83f:	90                   	nop

00000840 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	57                   	push   %edi
 844:	56                   	push   %esi
 845:	53                   	push   %ebx
 846:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 849:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 84c:	8b 3d c0 0d 00 00    	mov    0xdc0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 852:	8d 70 07             	lea    0x7(%eax),%esi
 855:	c1 ee 03             	shr    $0x3,%esi
 858:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 85b:	85 ff                	test   %edi,%edi
 85d:	0f 84 9d 00 00 00    	je     900 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 863:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 865:	8b 4a 04             	mov    0x4(%edx),%ecx
 868:	39 f1                	cmp    %esi,%ecx
 86a:	73 6a                	jae    8d6 <malloc+0x96>
 86c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 871:	39 de                	cmp    %ebx,%esi
 873:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 876:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 87d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 880:	eb 17                	jmp    899 <malloc+0x59>
 882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 888:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 88a:	8b 48 04             	mov    0x4(%eax),%ecx
 88d:	39 f1                	cmp    %esi,%ecx
 88f:	73 4f                	jae    8e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 891:	8b 3d c0 0d 00 00    	mov    0xdc0,%edi
 897:	89 c2                	mov    %eax,%edx
 899:	39 d7                	cmp    %edx,%edi
 89b:	75 eb                	jne    888 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 89d:	83 ec 0c             	sub    $0xc,%esp
 8a0:	ff 75 e4             	push   -0x1c(%ebp)
 8a3:	e8 83 fc ff ff       	call   52b <sbrk>
  if(p == (char*)-1)
 8a8:	83 c4 10             	add    $0x10,%esp
 8ab:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ae:	74 1c                	je     8cc <malloc+0x8c>
  hp->s.size = nu;
 8b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8b3:	83 ec 0c             	sub    $0xc,%esp
 8b6:	83 c0 08             	add    $0x8,%eax
 8b9:	50                   	push   %eax
 8ba:	e8 f1 fe ff ff       	call   7b0 <free>
  return freep;
 8bf:	8b 15 c0 0d 00 00    	mov    0xdc0,%edx
      if((p = morecore(nunits)) == 0)
 8c5:	83 c4 10             	add    $0x10,%esp
 8c8:	85 d2                	test   %edx,%edx
 8ca:	75 bc                	jne    888 <malloc+0x48>
        return 0;
  }
}
 8cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8cf:	31 c0                	xor    %eax,%eax
}
 8d1:	5b                   	pop    %ebx
 8d2:	5e                   	pop    %esi
 8d3:	5f                   	pop    %edi
 8d4:	5d                   	pop    %ebp
 8d5:	c3                   	ret    
    if(p->s.size >= nunits){
 8d6:	89 d0                	mov    %edx,%eax
 8d8:	89 fa                	mov    %edi,%edx
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8e0:	39 ce                	cmp    %ecx,%esi
 8e2:	74 4c                	je     930 <malloc+0xf0>
        p->s.size -= nunits;
 8e4:	29 f1                	sub    %esi,%ecx
 8e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8ec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8ef:	89 15 c0 0d 00 00    	mov    %edx,0xdc0
}
 8f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8f8:	83 c0 08             	add    $0x8,%eax
}
 8fb:	5b                   	pop    %ebx
 8fc:	5e                   	pop    %esi
 8fd:	5f                   	pop    %edi
 8fe:	5d                   	pop    %ebp
 8ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 900:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 907:	0d 00 00 
    base.s.size = 0;
 90a:	bf c4 0d 00 00       	mov    $0xdc4,%edi
    base.s.ptr = freep = prevp = &base;
 90f:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 916:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 919:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 91b:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 922:	00 00 00 
    if(p->s.size >= nunits){
 925:	e9 42 ff ff ff       	jmp    86c <malloc+0x2c>
 92a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 930:	8b 08                	mov    (%eax),%ecx
 932:	89 0a                	mov    %ecx,(%edx)
 934:	eb b9                	jmp    8ef <malloc+0xaf>