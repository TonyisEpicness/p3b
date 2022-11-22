
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	eb 1a                	jmp    3a <main+0x3a>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
<<<<<<< HEAD
  20:	ba f6 06 00 00       	mov    $0x6f6,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 f8 06 00 00       	push   $0x6f8
  2e:	6a 01                	push   $0x1
  30:	e8 10 04 00 00       	call   445 <printf>
=======
  20:	ba de 06 00 00       	mov    $0x6de,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 e0 06 00 00       	push   $0x6e0
  2e:	6a 01                	push   $0x1
  30:	e8 f9 03 00 00       	call   42e <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
  35:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
<<<<<<< HEAD
  45:	ba f4 06 00 00       	mov    $0x6f4,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 9f 02 00 00       	call   2f0 <exit>
=======
  45:	ba dc 06 00 00       	mov    $0x6dc,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 88 02 00 00       	call   2d9 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000051 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  57:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  59:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  5c:	89 08                	mov    %ecx,(%eax)
  return old;
}
  5e:	89 d0                	mov    %edx,%eax
  60:	5d                   	pop    %ebp
  61:	c3                   	ret    

00000062 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  62:	55                   	push   %ebp
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  69:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
  6e:	e8 f8 05 00 00       	call   66b <malloc>
  if(n_stack == 0){
  73:	83 c4 10             	add    $0x10,%esp
  76:	85 c0                	test   %eax,%eax
  78:	74 41                	je     bb <thread_create+0x59>
  7a:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
  7c:	50                   	push   %eax
  7d:	ff 75 10             	push   0x10(%ebp)
  80:	ff 75 0c             	push   0xc(%ebp)
  83:	ff 75 08             	push   0x8(%ebp)
  86:	e8 05 03 00 00       	call   390 <clone>
=======
  6e:	e8 e1 05 00 00       	call   654 <malloc>
  if(n_stack == 0){
  73:	83 c4 10             	add    $0x10,%esp
  76:	85 c0                	test   %eax,%eax
  78:	74 57                	je     d1 <thread_create+0x6f>
  7a:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
  7c:	b8 00 00 00 00       	mov    $0x0,%eax
  81:	eb 03                	jmp    86 <thread_create+0x24>
  83:	83 c0 01             	add    $0x1,%eax
  86:	83 f8 3f             	cmp    $0x3f,%eax
  89:	7f 2f                	jg     ba <thread_create+0x58>
    if(threads[i].flag==0){
  8b:	8d 14 40             	lea    (%eax,%eax,2),%edx
  8e:	83 3c 95 c8 0a 00 00 	cmpl   $0x0,0xac8(,%edx,4)
  95:	00 
  96:	75 eb                	jne    83 <thread_create+0x21>
      threads[i].maddr = n_stack;
  98:	8d 14 00             	lea    (%eax,%eax,1),%edx
  9b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  9e:	c1 e3 02             	shl    $0x2,%ebx
  a1:	89 8b c0 0a 00 00    	mov    %ecx,0xac0(%ebx)
      threads[i].pg1addr = n_stack;
  a7:	89 8b c4 0a 00 00    	mov    %ecx,0xac4(%ebx)
      threads[i].flag = 1;
  ad:	01 c2                	add    %eax,%edx
  af:	c7 04 95 c8 0a 00 00 	movl   $0x1,0xac8(,%edx,4)
  b6:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  ba:	51                   	push   %ecx
  bb:	ff 75 10             	push   0x10(%ebp)
  be:	ff 75 0c             	push   0xc(%ebp)
  c1:	ff 75 08             	push   0x8(%ebp)
  c4:	e8 b0 02 00 00       	call   379 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
  8b:	83 c4 10             	add    $0x10,%esp
  8e:	ba 00 00 00 00       	mov    $0x0,%edx
  93:	eb 03                	jmp    98 <thread_create+0x36>
  95:	83 c2 01             	add    $0x1,%edx
  98:	83 fa 3f             	cmp    $0x3f,%edx
  9b:	7f 19                	jg     b6 <thread_create+0x54>
    if(threads[i]->flag==0){
  9d:	8b 0c 95 e0 0a 00 00 	mov    0xae0(,%edx,4),%ecx
  a4:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  a8:	75 eb                	jne    95 <thread_create+0x33>
      threads[i]->maddr = n_stack;
  aa:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
  ac:	8b 14 95 e0 0a 00 00 	mov    0xae0(,%edx,4),%edx
  b3:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
  b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b9:	c9                   	leave  
  ba:	c3                   	ret    
    return -1;
  bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  c0:	eb f4                	jmp    b6 <thread_create+0x54>

000000c2 <thread_join>:
=======
  c9:	83 c4 10             	add    $0x10,%esp
}
  cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  cf:	c9                   	leave  
  d0:	c3                   	ret    
    return -1;
  d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  d6:	eb f4                	jmp    cc <thread_create+0x6a>

000000d8 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
  c2:	55                   	push   %ebp
  c3:	89 e5                	mov    %esp,%ebp
  c5:	56                   	push   %esi
  c6:	53                   	push   %ebx
  c7:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
  cd:	50                   	push   %eax
  ce:	e8 c5 02 00 00       	call   398 <join>
  d3:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	bb 00 00 00 00       	mov    $0x0,%ebx
  dd:	eb 03                	jmp    e2 <thread_join+0x20>
  df:	83 c3 01             	add    $0x1,%ebx
  e2:	83 fb 3f             	cmp    $0x3f,%ebx
  e5:	7f 23                	jg     10a <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
  e7:	8b 04 9d e0 0a 00 00 	mov    0xae0(,%ebx,4),%eax
  ee:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  f2:	75 eb                	jne    df <thread_join+0x1d>
  f4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  f7:	39 50 04             	cmp    %edx,0x4(%eax)
  fa:	75 e3                	jne    df <thread_join+0x1d>
      free(stk_addr);
  fc:	83 ec 0c             	sub    $0xc,%esp
  ff:	52                   	push   %edx
 100:	e8 a6 04 00 00       	call   5ab <free>
 105:	83 c4 10             	add    $0x10,%esp
 108:	eb d5                	jmp    df <thread_join+0x1d>
    }
  }
  return pid;
}
 10a:	89 f0                	mov    %esi,%eax
 10c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 10f:	5b                   	pop    %ebx
 110:	5e                   	pop    %esi
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    

00000113 <lock_acquire>:

void lock_acquire(lock_t *lock){
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	53                   	push   %ebx
 117:	83 ec 04             	sub    $0x4,%esp
 11a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 11d:	83 ec 08             	sub    $0x8,%esp
 120:	6a 01                	push   $0x1
 122:	53                   	push   %ebx
 123:	e8 29 ff ff ff       	call   51 <test_and_set>
 128:	83 c4 10             	add    $0x10,%esp
 12b:	83 f8 01             	cmp    $0x1,%eax
 12e:	74 ed                	je     11d <lock_acquire+0xa>
    ;
}
 130:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <lock_release>:

void lock_release(lock_t *lock) {
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 138:	8b 45 08             	mov    0x8(%ebp),%eax
 13b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 141:	5d                   	pop    %ebp
 142:	c3                   	ret    

00000143 <lock_init>:

void lock_init(lock_t *lock) {
 143:	55                   	push   %ebp
 144:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 146:	8b 45 08             	mov    0x8(%ebp),%eax
 149:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    

00000151 <strcpy>:
=======
  d8:	55                   	push   %ebp
  d9:	89 e5                	mov    %esp,%ebp
  db:	53                   	push   %ebx
  dc:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  df:	8d 45 f4             	lea    -0xc(%ebp),%eax
  e2:	50                   	push   %eax
  e3:	e8 99 02 00 00       	call   381 <join>
  e8:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
  ea:	83 c4 04             	add    $0x4,%esp
  ed:	ff 75 f4             	push   -0xc(%ebp)
  f0:	e8 9f 04 00 00       	call   594 <free>
  return pid;
}
  f5:	89 d8                	mov    %ebx,%eax
  f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  fa:	c9                   	leave  
  fb:	c3                   	ret    

000000fc <lock_acquire>:

void lock_acquire(lock_t *lock){
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	53                   	push   %ebx
 100:	83 ec 04             	sub    $0x4,%esp
 103:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 106:	83 ec 08             	sub    $0x8,%esp
 109:	6a 01                	push   $0x1
 10b:	53                   	push   %ebx
 10c:	e8 40 ff ff ff       	call   51 <test_and_set>
 111:	83 c4 10             	add    $0x10,%esp
 114:	83 f8 01             	cmp    $0x1,%eax
 117:	74 ed                	je     106 <lock_acquire+0xa>
    ;
}
 119:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 11c:	c9                   	leave  
 11d:	c3                   	ret    

0000011e <lock_release>:

void lock_release(lock_t *lock) {
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 121:	8b 45 08             	mov    0x8(%ebp),%eax
 124:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 12a:	5d                   	pop    %ebp
 12b:	c3                   	ret    

0000012c <lock_init>:

void lock_init(lock_t *lock) {
 12c:	55                   	push   %ebp
 12d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 12f:	8b 45 08             	mov    0x8(%ebp),%eax
 132:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 138:	5d                   	pop    %ebp
 139:	c3                   	ret    

0000013a <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 151:	55                   	push   %ebp
 152:	89 e5                	mov    %esp,%ebp
 154:	56                   	push   %esi
 155:	53                   	push   %ebx
 156:	8b 75 08             	mov    0x8(%ebp),%esi
 159:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
 13d:	56                   	push   %esi
 13e:	53                   	push   %ebx
 13f:	8b 75 08             	mov    0x8(%ebp),%esi
 142:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 15c:	89 f0                	mov    %esi,%eax
 15e:	89 d1                	mov    %edx,%ecx
 160:	83 c2 01             	add    $0x1,%edx
 163:	89 c3                	mov    %eax,%ebx
 165:	83 c0 01             	add    $0x1,%eax
 168:	0f b6 09             	movzbl (%ecx),%ecx
 16b:	88 0b                	mov    %cl,(%ebx)
 16d:	84 c9                	test   %cl,%cl
 16f:	75 ed                	jne    15e <strcpy+0xd>
    ;
  return os;
}
 171:	89 f0                	mov    %esi,%eax
 173:	5b                   	pop    %ebx
 174:	5e                   	pop    %esi
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    

00000177 <strcmp>:
=======
 145:	89 f0                	mov    %esi,%eax
 147:	89 d1                	mov    %edx,%ecx
 149:	83 c2 01             	add    $0x1,%edx
 14c:	89 c3                	mov    %eax,%ebx
 14e:	83 c0 01             	add    $0x1,%eax
 151:	0f b6 09             	movzbl (%ecx),%ecx
 154:	88 0b                	mov    %cl,(%ebx)
 156:	84 c9                	test   %cl,%cl
 158:	75 ed                	jne    147 <strcpy+0xd>
    ;
  return os;
}
 15a:	89 f0                	mov    %esi,%eax
 15c:	5b                   	pop    %ebx
 15d:	5e                   	pop    %esi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 177:	55                   	push   %ebp
 178:	89 e5                	mov    %esp,%ebp
 17a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 17d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 180:	eb 06                	jmp    188 <strcmp+0x11>
    p++, q++;
 182:	83 c1 01             	add    $0x1,%ecx
 185:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 188:	0f b6 01             	movzbl (%ecx),%eax
 18b:	84 c0                	test   %al,%al
 18d:	74 04                	je     193 <strcmp+0x1c>
 18f:	3a 02                	cmp    (%edx),%al
 191:	74 ef                	je     182 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 193:	0f b6 c0             	movzbl %al,%eax
 196:	0f b6 12             	movzbl (%edx),%edx
 199:	29 d0                	sub    %edx,%eax
}
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    

0000019d <strlen>:
=======
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 4d 08             	mov    0x8(%ebp),%ecx
 166:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 169:	eb 06                	jmp    171 <strcmp+0x11>
    p++, q++;
 16b:	83 c1 01             	add    $0x1,%ecx
 16e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 171:	0f b6 01             	movzbl (%ecx),%eax
 174:	84 c0                	test   %al,%al
 176:	74 04                	je     17c <strcmp+0x1c>
 178:	3a 02                	cmp    (%edx),%al
 17a:	74 ef                	je     16b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 17c:	0f b6 c0             	movzbl %al,%eax
 17f:	0f b6 12             	movzbl (%edx),%edx
 182:	29 d0                	sub    %edx,%eax
}
 184:	5d                   	pop    %ebp
 185:	c3                   	ret    

00000186 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 19d:	55                   	push   %ebp
 19e:	89 e5                	mov    %esp,%ebp
 1a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1a3:	b8 00 00 00 00       	mov    $0x0,%eax
 1a8:	eb 03                	jmp    1ad <strlen+0x10>
 1aa:	83 c0 01             	add    $0x1,%eax
 1ad:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1b1:	75 f7                	jne    1aa <strlen+0xd>
    ;
  return n;
}
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    

000001b5 <memset>:
=======
 186:	55                   	push   %ebp
 187:	89 e5                	mov    %esp,%ebp
 189:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 18c:	b8 00 00 00 00       	mov    $0x0,%eax
 191:	eb 03                	jmp    196 <strlen+0x10>
 193:	83 c0 01             	add    $0x1,%eax
 196:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 19a:	75 f7                	jne    193 <strlen+0xd>
    ;
  return n;
}
 19c:	5d                   	pop    %ebp
 19d:	c3                   	ret    

0000019e <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 1b5:	55                   	push   %ebp
 1b6:	89 e5                	mov    %esp,%ebp
 1b8:	57                   	push   %edi
 1b9:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 19e:	55                   	push   %ebp
 19f:	89 e5                	mov    %esp,%ebp
 1a1:	57                   	push   %edi
 1a2:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 1bc:	89 d7                	mov    %edx,%edi
 1be:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	fc                   	cld    
 1c5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c7:	89 d0                	mov    %edx,%eax
 1c9:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1cc:	c9                   	leave  
 1cd:	c3                   	ret    

000001ce <strchr>:
=======
 1a5:	89 d7                	mov    %edx,%edi
 1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	fc                   	cld    
 1ae:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b0:	89 d0                	mov    %edx,%eax
 1b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b5:	c9                   	leave  
 1b6:	c3                   	ret    

000001b7 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 1ce:	55                   	push   %ebp
 1cf:	89 e5                	mov    %esp,%ebp
 1d1:	8b 45 08             	mov    0x8(%ebp),%eax
 1d4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1d8:	eb 03                	jmp    1dd <strchr+0xf>
 1da:	83 c0 01             	add    $0x1,%eax
 1dd:	0f b6 10             	movzbl (%eax),%edx
 1e0:	84 d2                	test   %dl,%dl
 1e2:	74 06                	je     1ea <strchr+0x1c>
    if(*s == c)
 1e4:	38 ca                	cmp    %cl,%dl
 1e6:	75 f2                	jne    1da <strchr+0xc>
 1e8:	eb 05                	jmp    1ef <strchr+0x21>
      return (char*)s;
  return 0;
 1ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    

000001f1 <gets>:
=======
 1b7:	55                   	push   %ebp
 1b8:	89 e5                	mov    %esp,%ebp
 1ba:	8b 45 08             	mov    0x8(%ebp),%eax
 1bd:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1c1:	eb 03                	jmp    1c6 <strchr+0xf>
 1c3:	83 c0 01             	add    $0x1,%eax
 1c6:	0f b6 10             	movzbl (%eax),%edx
 1c9:	84 d2                	test   %dl,%dl
 1cb:	74 06                	je     1d3 <strchr+0x1c>
    if(*s == c)
 1cd:	38 ca                	cmp    %cl,%dl
 1cf:	75 f2                	jne    1c3 <strchr+0xc>
 1d1:	eb 05                	jmp    1d8 <strchr+0x21>
      return (char*)s;
  return 0;
 1d3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1d8:	5d                   	pop    %ebp
 1d9:	c3                   	ret    

000001da <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	57                   	push   %edi
 1f5:	56                   	push   %esi
 1f6:	53                   	push   %ebx
 1f7:	83 ec 1c             	sub    $0x1c,%esp
 1fa:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 1da:	55                   	push   %ebp
 1db:	89 e5                	mov    %esp,%ebp
 1dd:	57                   	push   %edi
 1de:	56                   	push   %esi
 1df:	53                   	push   %ebx
 1e0:	83 ec 1c             	sub    $0x1c,%esp
 1e3:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 1fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 202:	89 de                	mov    %ebx,%esi
 204:	83 c3 01             	add    $0x1,%ebx
 207:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20a:	7d 2e                	jge    23a <gets+0x49>
    cc = read(0, &c, 1);
 20c:	83 ec 04             	sub    $0x4,%esp
 20f:	6a 01                	push   $0x1
 211:	8d 45 e7             	lea    -0x19(%ebp),%eax
 214:	50                   	push   %eax
 215:	6a 00                	push   $0x0
 217:	e8 ec 00 00 00       	call   308 <read>
    if(cc < 1)
 21c:	83 c4 10             	add    $0x10,%esp
 21f:	85 c0                	test   %eax,%eax
 221:	7e 17                	jle    23a <gets+0x49>
      break;
    buf[i++] = c;
 223:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 227:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 22a:	3c 0a                	cmp    $0xa,%al
 22c:	0f 94 c2             	sete   %dl
 22f:	3c 0d                	cmp    $0xd,%al
 231:	0f 94 c0             	sete   %al
 234:	08 c2                	or     %al,%dl
 236:	74 ca                	je     202 <gets+0x11>
    buf[i++] = c;
 238:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 23a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 23e:	89 f8                	mov    %edi,%eax
 240:	8d 65 f4             	lea    -0xc(%ebp),%esp
 243:	5b                   	pop    %ebx
 244:	5e                   	pop    %esi
 245:	5f                   	pop    %edi
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    

00000248 <stat>:
=======
 1e6:	bb 00 00 00 00       	mov    $0x0,%ebx
 1eb:	89 de                	mov    %ebx,%esi
 1ed:	83 c3 01             	add    $0x1,%ebx
 1f0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f3:	7d 2e                	jge    223 <gets+0x49>
    cc = read(0, &c, 1);
 1f5:	83 ec 04             	sub    $0x4,%esp
 1f8:	6a 01                	push   $0x1
 1fa:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1fd:	50                   	push   %eax
 1fe:	6a 00                	push   $0x0
 200:	e8 ec 00 00 00       	call   2f1 <read>
    if(cc < 1)
 205:	83 c4 10             	add    $0x10,%esp
 208:	85 c0                	test   %eax,%eax
 20a:	7e 17                	jle    223 <gets+0x49>
      break;
    buf[i++] = c;
 20c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 210:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 213:	3c 0a                	cmp    $0xa,%al
 215:	0f 94 c2             	sete   %dl
 218:	3c 0d                	cmp    $0xd,%al
 21a:	0f 94 c0             	sete   %al
 21d:	08 c2                	or     %al,%dl
 21f:	74 ca                	je     1eb <gets+0x11>
    buf[i++] = c;
 221:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 223:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 227:	89 f8                	mov    %edi,%eax
 229:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22c:	5b                   	pop    %ebx
 22d:	5e                   	pop    %esi
 22e:	5f                   	pop    %edi
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    

00000231 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	56                   	push   %esi
 24c:	53                   	push   %ebx
=======
 231:	55                   	push   %ebp
 232:	89 e5                	mov    %esp,%ebp
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 24d:	83 ec 08             	sub    $0x8,%esp
 250:	6a 00                	push   $0x0
 252:	ff 75 08             	push   0x8(%ebp)
 255:	e8 d6 00 00 00       	call   330 <open>
  if(fd < 0)
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	85 c0                	test   %eax,%eax
 25f:	78 24                	js     285 <stat+0x3d>
 261:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 263:	83 ec 08             	sub    $0x8,%esp
 266:	ff 75 0c             	push   0xc(%ebp)
 269:	50                   	push   %eax
 26a:	e8 d9 00 00 00       	call   348 <fstat>
 26f:	89 c6                	mov    %eax,%esi
  close(fd);
 271:	89 1c 24             	mov    %ebx,(%esp)
 274:	e8 9f 00 00 00       	call   318 <close>
  return r;
 279:	83 c4 10             	add    $0x10,%esp
}
 27c:	89 f0                	mov    %esi,%eax
 27e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 281:	5b                   	pop    %ebx
 282:	5e                   	pop    %esi
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    
    return -1;
 285:	be ff ff ff ff       	mov    $0xffffffff,%esi
 28a:	eb f0                	jmp    27c <stat+0x34>

0000028c <atoi>:
=======
 236:	83 ec 08             	sub    $0x8,%esp
 239:	6a 00                	push   $0x0
 23b:	ff 75 08             	push   0x8(%ebp)
 23e:	e8 d6 00 00 00       	call   319 <open>
  if(fd < 0)
 243:	83 c4 10             	add    $0x10,%esp
 246:	85 c0                	test   %eax,%eax
 248:	78 24                	js     26e <stat+0x3d>
 24a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24c:	83 ec 08             	sub    $0x8,%esp
 24f:	ff 75 0c             	push   0xc(%ebp)
 252:	50                   	push   %eax
 253:	e8 d9 00 00 00       	call   331 <fstat>
 258:	89 c6                	mov    %eax,%esi
  close(fd);
 25a:	89 1c 24             	mov    %ebx,(%esp)
 25d:	e8 9f 00 00 00       	call   301 <close>
  return r;
 262:	83 c4 10             	add    $0x10,%esp
}
 265:	89 f0                	mov    %esi,%eax
 267:	8d 65 f8             	lea    -0x8(%ebp),%esp
 26a:	5b                   	pop    %ebx
 26b:	5e                   	pop    %esi
 26c:	5d                   	pop    %ebp
 26d:	c3                   	ret    
    return -1;
 26e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 273:	eb f0                	jmp    265 <stat+0x34>

00000275 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 28c:	55                   	push   %ebp
 28d:	89 e5                	mov    %esp,%ebp
 28f:	53                   	push   %ebx
 290:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 293:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 298:	eb 10                	jmp    2aa <atoi+0x1e>
    n = n*10 + *s++ - '0';
 29a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 29d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2a0:	83 c1 01             	add    $0x1,%ecx
 2a3:	0f be c0             	movsbl %al,%eax
 2a6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2aa:	0f b6 01             	movzbl (%ecx),%eax
 2ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2b0:	80 fb 09             	cmp    $0x9,%bl
 2b3:	76 e5                	jbe    29a <atoi+0xe>
  return n;
}
 2b5:	89 d0                	mov    %edx,%eax
 2b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2ba:	c9                   	leave  
 2bb:	c3                   	ret    

000002bc <memmove>:
=======
 275:	55                   	push   %ebp
 276:	89 e5                	mov    %esp,%ebp
 278:	53                   	push   %ebx
 279:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 27c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 281:	eb 10                	jmp    293 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 283:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 286:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 289:	83 c1 01             	add    $0x1,%ecx
 28c:	0f be c0             	movsbl %al,%eax
 28f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 293:	0f b6 01             	movzbl (%ecx),%eax
 296:	8d 58 d0             	lea    -0x30(%eax),%ebx
 299:	80 fb 09             	cmp    $0x9,%bl
 29c:	76 e5                	jbe    283 <atoi+0xe>
  return n;
}
 29e:	89 d0                	mov    %edx,%eax
 2a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a3:	c9                   	leave  
 2a4:	c3                   	ret    

000002a5 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	56                   	push   %esi
 2c0:	53                   	push   %ebx
 2c1:	8b 75 08             	mov    0x8(%ebp),%esi
 2c4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2c7:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 2a5:	55                   	push   %ebp
 2a6:	89 e5                	mov    %esp,%ebp
 2a8:	56                   	push   %esi
 2a9:	53                   	push   %ebx
 2aa:	8b 75 08             	mov    0x8(%ebp),%esi
 2ad:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b0:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 2ca:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2cc:	eb 0d                	jmp    2db <memmove+0x1f>
    *dst++ = *src++;
 2ce:	0f b6 01             	movzbl (%ecx),%eax
 2d1:	88 02                	mov    %al,(%edx)
 2d3:	8d 49 01             	lea    0x1(%ecx),%ecx
 2d6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2d9:	89 d8                	mov    %ebx,%eax
 2db:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2de:	85 c0                	test   %eax,%eax
 2e0:	7f ec                	jg     2ce <memmove+0x12>
  return vdst;
}
 2e2:	89 f0                	mov    %esi,%eax
 2e4:	5b                   	pop    %ebx
 2e5:	5e                   	pop    %esi
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    

000002e8 <fork>:
=======
 2b3:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2b5:	eb 0d                	jmp    2c4 <memmove+0x1f>
    *dst++ = *src++;
 2b7:	0f b6 01             	movzbl (%ecx),%eax
 2ba:	88 02                	mov    %al,(%edx)
 2bc:	8d 49 01             	lea    0x1(%ecx),%ecx
 2bf:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2c2:	89 d8                	mov    %ebx,%eax
 2c4:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2c7:	85 c0                	test   %eax,%eax
 2c9:	7f ec                	jg     2b7 <memmove+0x12>
  return vdst;
}
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    

000002d1 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 2e8:	b8 01 00 00 00       	mov    $0x1,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <exit>:
SYSCALL(exit)
 2f0:	b8 02 00 00 00       	mov    $0x2,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <wait>:
SYSCALL(wait)
 2f8:	b8 03 00 00 00       	mov    $0x3,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <pipe>:
SYSCALL(pipe)
 300:	b8 04 00 00 00       	mov    $0x4,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <read>:
SYSCALL(read)
 308:	b8 05 00 00 00       	mov    $0x5,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <write>:
SYSCALL(write)
 310:	b8 10 00 00 00       	mov    $0x10,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <close>:
SYSCALL(close)
 318:	b8 15 00 00 00       	mov    $0x15,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <kill>:
SYSCALL(kill)
 320:	b8 06 00 00 00       	mov    $0x6,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <exec>:
SYSCALL(exec)
 328:	b8 07 00 00 00       	mov    $0x7,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <open>:
SYSCALL(open)
 330:	b8 0f 00 00 00       	mov    $0xf,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <mknod>:
SYSCALL(mknod)
 338:	b8 11 00 00 00       	mov    $0x11,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <unlink>:
SYSCALL(unlink)
 340:	b8 12 00 00 00       	mov    $0x12,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <fstat>:
SYSCALL(fstat)
 348:	b8 08 00 00 00       	mov    $0x8,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <link>:
SYSCALL(link)
 350:	b8 13 00 00 00       	mov    $0x13,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <mkdir>:
SYSCALL(mkdir)
 358:	b8 14 00 00 00       	mov    $0x14,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <chdir>:
SYSCALL(chdir)
 360:	b8 09 00 00 00       	mov    $0x9,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <dup>:
SYSCALL(dup)
 368:	b8 0a 00 00 00       	mov    $0xa,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <getpid>:
SYSCALL(getpid)
 370:	b8 0b 00 00 00       	mov    $0xb,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <sbrk>:
SYSCALL(sbrk)
 378:	b8 0c 00 00 00       	mov    $0xc,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <sleep>:
SYSCALL(sleep)
 380:	b8 0d 00 00 00       	mov    $0xd,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <uptime>:
SYSCALL(uptime)
 388:	b8 0e 00 00 00       	mov    $0xe,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <clone>:
SYSCALL(clone)
 390:	b8 16 00 00 00       	mov    $0x16,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <join>:
 398:	b8 17 00 00 00       	mov    $0x17,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <putc>:
=======
 2d1:	b8 01 00 00 00       	mov    $0x1,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <exit>:
SYSCALL(exit)
 2d9:	b8 02 00 00 00       	mov    $0x2,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <wait>:
SYSCALL(wait)
 2e1:	b8 03 00 00 00       	mov    $0x3,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <pipe>:
SYSCALL(pipe)
 2e9:	b8 04 00 00 00       	mov    $0x4,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <read>:
SYSCALL(read)
 2f1:	b8 05 00 00 00       	mov    $0x5,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <write>:
SYSCALL(write)
 2f9:	b8 10 00 00 00       	mov    $0x10,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <close>:
SYSCALL(close)
 301:	b8 15 00 00 00       	mov    $0x15,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <kill>:
SYSCALL(kill)
 309:	b8 06 00 00 00       	mov    $0x6,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <exec>:
SYSCALL(exec)
 311:	b8 07 00 00 00       	mov    $0x7,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <open>:
SYSCALL(open)
 319:	b8 0f 00 00 00       	mov    $0xf,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <mknod>:
SYSCALL(mknod)
 321:	b8 11 00 00 00       	mov    $0x11,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <unlink>:
SYSCALL(unlink)
 329:	b8 12 00 00 00       	mov    $0x12,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <fstat>:
SYSCALL(fstat)
 331:	b8 08 00 00 00       	mov    $0x8,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <link>:
SYSCALL(link)
 339:	b8 13 00 00 00       	mov    $0x13,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <mkdir>:
SYSCALL(mkdir)
 341:	b8 14 00 00 00       	mov    $0x14,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <chdir>:
SYSCALL(chdir)
 349:	b8 09 00 00 00       	mov    $0x9,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <dup>:
SYSCALL(dup)
 351:	b8 0a 00 00 00       	mov    $0xa,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <getpid>:
SYSCALL(getpid)
 359:	b8 0b 00 00 00       	mov    $0xb,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <sbrk>:
SYSCALL(sbrk)
 361:	b8 0c 00 00 00       	mov    $0xc,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <sleep>:
SYSCALL(sleep)
 369:	b8 0d 00 00 00       	mov    $0xd,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <uptime>:
SYSCALL(uptime)
 371:	b8 0e 00 00 00       	mov    $0xe,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <clone>:
SYSCALL(clone)
 379:	b8 16 00 00 00       	mov    $0x16,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <join>:
 381:	b8 17 00 00 00       	mov    $0x17,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	83 ec 1c             	sub    $0x1c,%esp
 3a6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3a9:	6a 01                	push   $0x1
 3ab:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3ae:	52                   	push   %edx
 3af:	50                   	push   %eax
 3b0:	e8 5b ff ff ff       	call   310 <write>
}
 3b5:	83 c4 10             	add    $0x10,%esp
 3b8:	c9                   	leave  
 3b9:	c3                   	ret    

000003ba <printint>:
=======
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	83 ec 1c             	sub    $0x1c,%esp
 38f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 392:	6a 01                	push   $0x1
 394:	8d 55 f4             	lea    -0xc(%ebp),%edx
 397:	52                   	push   %edx
 398:	50                   	push   %eax
 399:	e8 5b ff ff ff       	call   2f9 <write>
}
 39e:	83 c4 10             	add    $0x10,%esp
 3a1:	c9                   	leave  
 3a2:	c3                   	ret    

000003a3 <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	57                   	push   %edi
 3be:	56                   	push   %esi
 3bf:	53                   	push   %ebx
 3c0:	83 ec 2c             	sub    $0x2c,%esp
 3c3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	89 ce                	mov    %ecx,%esi
=======
 3a3:	55                   	push   %ebp
 3a4:	89 e5                	mov    %esp,%ebp
 3a6:	57                   	push   %edi
 3a7:	56                   	push   %esi
 3a8:	53                   	push   %ebx
 3a9:	83 ec 2c             	sub    $0x2c,%esp
 3ac:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3af:	89 d0                	mov    %edx,%eax
 3b1:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 3ca:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3ce:	0f 95 c1             	setne  %cl
 3d1:	c1 ea 1f             	shr    $0x1f,%edx
 3d4:	84 d1                	test   %dl,%cl
 3d6:	74 44                	je     41c <printint+0x62>
    neg = 1;
    x = -xx;
 3d8:	f7 d8                	neg    %eax
 3da:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3dc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 3b3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3b7:	0f 95 c1             	setne  %cl
 3ba:	c1 ea 1f             	shr    $0x1f,%edx
 3bd:	84 d1                	test   %dl,%cl
 3bf:	74 44                	je     405 <printint+0x62>
    neg = 1;
    x = -xx;
 3c1:	f7 d8                	neg    %eax
 3c3:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3c5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 3e3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3e8:	89 c8                	mov    %ecx,%eax
 3ea:	ba 00 00 00 00       	mov    $0x0,%edx
 3ef:	f7 f6                	div    %esi
 3f1:	89 df                	mov    %ebx,%edi
 3f3:	83 c3 01             	add    $0x1,%ebx
 3f6:	0f b6 92 5c 07 00 00 	movzbl 0x75c(%edx),%edx
 3fd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 401:	89 ca                	mov    %ecx,%edx
 403:	89 c1                	mov    %eax,%ecx
 405:	39 d6                	cmp    %edx,%esi
 407:	76 df                	jbe    3e8 <printint+0x2e>
  if(neg)
 409:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 40d:	74 31                	je     440 <printint+0x86>
    buf[i++] = '-';
 40f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 414:	8d 5f 02             	lea    0x2(%edi),%ebx
 417:	8b 75 d0             	mov    -0x30(%ebp),%esi
 41a:	eb 17                	jmp    433 <printint+0x79>
    x = xx;
 41c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 41e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 425:	eb bc                	jmp    3e3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 427:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 42c:	89 f0                	mov    %esi,%eax
 42e:	e8 6d ff ff ff       	call   3a0 <putc>
  while(--i >= 0)
 433:	83 eb 01             	sub    $0x1,%ebx
 436:	79 ef                	jns    427 <printint+0x6d>
}
 438:	83 c4 2c             	add    $0x2c,%esp
 43b:	5b                   	pop    %ebx
 43c:	5e                   	pop    %esi
 43d:	5f                   	pop    %edi
 43e:	5d                   	pop    %ebp
 43f:	c3                   	ret    
 440:	8b 75 d0             	mov    -0x30(%ebp),%esi
 443:	eb ee                	jmp    433 <printint+0x79>

00000445 <printf>:
=======
 3cc:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3d1:	89 c8                	mov    %ecx,%eax
 3d3:	ba 00 00 00 00       	mov    $0x0,%edx
 3d8:	f7 f6                	div    %esi
 3da:	89 df                	mov    %ebx,%edi
 3dc:	83 c3 01             	add    $0x1,%ebx
 3df:	0f b6 92 44 07 00 00 	movzbl 0x744(%edx),%edx
 3e6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3ea:	89 ca                	mov    %ecx,%edx
 3ec:	89 c1                	mov    %eax,%ecx
 3ee:	39 d6                	cmp    %edx,%esi
 3f0:	76 df                	jbe    3d1 <printint+0x2e>
  if(neg)
 3f2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3f6:	74 31                	je     429 <printint+0x86>
    buf[i++] = '-';
 3f8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3fd:	8d 5f 02             	lea    0x2(%edi),%ebx
 400:	8b 75 d0             	mov    -0x30(%ebp),%esi
 403:	eb 17                	jmp    41c <printint+0x79>
    x = xx;
 405:	89 c1                	mov    %eax,%ecx
  neg = 0;
 407:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 40e:	eb bc                	jmp    3cc <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 410:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 415:	89 f0                	mov    %esi,%eax
 417:	e8 6d ff ff ff       	call   389 <putc>
  while(--i >= 0)
 41c:	83 eb 01             	sub    $0x1,%ebx
 41f:	79 ef                	jns    410 <printint+0x6d>
}
 421:	83 c4 2c             	add    $0x2c,%esp
 424:	5b                   	pop    %ebx
 425:	5e                   	pop    %esi
 426:	5f                   	pop    %edi
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    
 429:	8b 75 d0             	mov    -0x30(%ebp),%esi
 42c:	eb ee                	jmp    41c <printint+0x79>

0000042e <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 445:	55                   	push   %ebp
 446:	89 e5                	mov    %esp,%ebp
 448:	57                   	push   %edi
 449:	56                   	push   %esi
 44a:	53                   	push   %ebx
 44b:	83 ec 1c             	sub    $0x1c,%esp
=======
 42e:	55                   	push   %ebp
 42f:	89 e5                	mov    %esp,%ebp
 431:	57                   	push   %edi
 432:	56                   	push   %esi
 433:	53                   	push   %ebx
 434:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 44e:	8d 45 10             	lea    0x10(%ebp),%eax
 451:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 454:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 459:	bb 00 00 00 00       	mov    $0x0,%ebx
 45e:	eb 14                	jmp    474 <printf+0x2f>
=======
 437:	8d 45 10             	lea    0x10(%ebp),%eax
 43a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 43d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 442:	bb 00 00 00 00       	mov    $0x0,%ebx
 447:	eb 14                	jmp    45d <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 460:	89 fa                	mov    %edi,%edx
 462:	8b 45 08             	mov    0x8(%ebp),%eax
 465:	e8 36 ff ff ff       	call   3a0 <putc>
 46a:	eb 05                	jmp    471 <printf+0x2c>
      }
    } else if(state == '%'){
 46c:	83 fe 25             	cmp    $0x25,%esi
 46f:	74 25                	je     496 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 471:	83 c3 01             	add    $0x1,%ebx
 474:	8b 45 0c             	mov    0xc(%ebp),%eax
 477:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 47b:	84 c0                	test   %al,%al
 47d:	0f 84 20 01 00 00    	je     5a3 <printf+0x15e>
    c = fmt[i] & 0xff;
 483:	0f be f8             	movsbl %al,%edi
 486:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 489:	85 f6                	test   %esi,%esi
 48b:	75 df                	jne    46c <printf+0x27>
      if(c == '%'){
 48d:	83 f8 25             	cmp    $0x25,%eax
 490:	75 ce                	jne    460 <printf+0x1b>
        state = '%';
 492:	89 c6                	mov    %eax,%esi
 494:	eb db                	jmp    471 <printf+0x2c>
      if(c == 'd'){
 496:	83 f8 25             	cmp    $0x25,%eax
 499:	0f 84 cf 00 00 00    	je     56e <printf+0x129>
 49f:	0f 8c dd 00 00 00    	jl     582 <printf+0x13d>
 4a5:	83 f8 78             	cmp    $0x78,%eax
 4a8:	0f 8f d4 00 00 00    	jg     582 <printf+0x13d>
 4ae:	83 f8 63             	cmp    $0x63,%eax
 4b1:	0f 8c cb 00 00 00    	jl     582 <printf+0x13d>
 4b7:	83 e8 63             	sub    $0x63,%eax
 4ba:	83 f8 15             	cmp    $0x15,%eax
 4bd:	0f 87 bf 00 00 00    	ja     582 <printf+0x13d>
 4c3:	ff 24 85 04 07 00 00 	jmp    *0x704(,%eax,4)
        printint(fd, *ap, 10, 1);
 4ca:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4cd:	8b 17                	mov    (%edi),%edx
 4cf:	83 ec 0c             	sub    $0xc,%esp
 4d2:	6a 01                	push   $0x1
 4d4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4d9:	8b 45 08             	mov    0x8(%ebp),%eax
 4dc:	e8 d9 fe ff ff       	call   3ba <printint>
        ap++;
 4e1:	83 c7 04             	add    $0x4,%edi
 4e4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4e7:	83 c4 10             	add    $0x10,%esp
=======
 449:	89 fa                	mov    %edi,%edx
 44b:	8b 45 08             	mov    0x8(%ebp),%eax
 44e:	e8 36 ff ff ff       	call   389 <putc>
 453:	eb 05                	jmp    45a <printf+0x2c>
      }
    } else if(state == '%'){
 455:	83 fe 25             	cmp    $0x25,%esi
 458:	74 25                	je     47f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 45a:	83 c3 01             	add    $0x1,%ebx
 45d:	8b 45 0c             	mov    0xc(%ebp),%eax
 460:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 464:	84 c0                	test   %al,%al
 466:	0f 84 20 01 00 00    	je     58c <printf+0x15e>
    c = fmt[i] & 0xff;
 46c:	0f be f8             	movsbl %al,%edi
 46f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 472:	85 f6                	test   %esi,%esi
 474:	75 df                	jne    455 <printf+0x27>
      if(c == '%'){
 476:	83 f8 25             	cmp    $0x25,%eax
 479:	75 ce                	jne    449 <printf+0x1b>
        state = '%';
 47b:	89 c6                	mov    %eax,%esi
 47d:	eb db                	jmp    45a <printf+0x2c>
      if(c == 'd'){
 47f:	83 f8 25             	cmp    $0x25,%eax
 482:	0f 84 cf 00 00 00    	je     557 <printf+0x129>
 488:	0f 8c dd 00 00 00    	jl     56b <printf+0x13d>
 48e:	83 f8 78             	cmp    $0x78,%eax
 491:	0f 8f d4 00 00 00    	jg     56b <printf+0x13d>
 497:	83 f8 63             	cmp    $0x63,%eax
 49a:	0f 8c cb 00 00 00    	jl     56b <printf+0x13d>
 4a0:	83 e8 63             	sub    $0x63,%eax
 4a3:	83 f8 15             	cmp    $0x15,%eax
 4a6:	0f 87 bf 00 00 00    	ja     56b <printf+0x13d>
 4ac:	ff 24 85 ec 06 00 00 	jmp    *0x6ec(,%eax,4)
        printint(fd, *ap, 10, 1);
 4b3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b6:	8b 17                	mov    (%edi),%edx
 4b8:	83 ec 0c             	sub    $0xc,%esp
 4bb:	6a 01                	push   $0x1
 4bd:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4c2:	8b 45 08             	mov    0x8(%ebp),%eax
 4c5:	e8 d9 fe ff ff       	call   3a3 <printint>
        ap++;
 4ca:	83 c7 04             	add    $0x4,%edi
 4cd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4d0:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 4ea:	be 00 00 00 00       	mov    $0x0,%esi
 4ef:	eb 80                	jmp    471 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4f4:	8b 17                	mov    (%edi),%edx
 4f6:	83 ec 0c             	sub    $0xc,%esp
 4f9:	6a 00                	push   $0x0
 4fb:	b9 10 00 00 00       	mov    $0x10,%ecx
 500:	8b 45 08             	mov    0x8(%ebp),%eax
 503:	e8 b2 fe ff ff       	call   3ba <printint>
        ap++;
 508:	83 c7 04             	add    $0x4,%edi
 50b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 50e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 511:	be 00 00 00 00       	mov    $0x0,%esi
 516:	e9 56 ff ff ff       	jmp    471 <printf+0x2c>
        s = (char*)*ap;
 51b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 51e:	8b 30                	mov    (%eax),%esi
        ap++;
 520:	83 c0 04             	add    $0x4,%eax
 523:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 526:	85 f6                	test   %esi,%esi
 528:	75 15                	jne    53f <printf+0xfa>
          s = "(null)";
 52a:	be fd 06 00 00       	mov    $0x6fd,%esi
 52f:	eb 0e                	jmp    53f <printf+0xfa>
          putc(fd, *s);
 531:	0f be d2             	movsbl %dl,%edx
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	e8 64 fe ff ff       	call   3a0 <putc>
          s++;
 53c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 53f:	0f b6 16             	movzbl (%esi),%edx
 542:	84 d2                	test   %dl,%dl
 544:	75 eb                	jne    531 <printf+0xec>
      state = 0;
 546:	be 00 00 00 00       	mov    $0x0,%esi
 54b:	e9 21 ff ff ff       	jmp    471 <printf+0x2c>
        putc(fd, *ap);
 550:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 553:	0f be 17             	movsbl (%edi),%edx
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	e8 42 fe ff ff       	call   3a0 <putc>
        ap++;
 55e:	83 c7 04             	add    $0x4,%edi
 561:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 564:	be 00 00 00 00       	mov    $0x0,%esi
 569:	e9 03 ff ff ff       	jmp    471 <printf+0x2c>
        putc(fd, c);
 56e:	89 fa                	mov    %edi,%edx
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	e8 28 fe ff ff       	call   3a0 <putc>
      state = 0;
 578:	be 00 00 00 00       	mov    $0x0,%esi
 57d:	e9 ef fe ff ff       	jmp    471 <printf+0x2c>
        putc(fd, '%');
 582:	ba 25 00 00 00       	mov    $0x25,%edx
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	e8 11 fe ff ff       	call   3a0 <putc>
        putc(fd, c);
 58f:	89 fa                	mov    %edi,%edx
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	e8 07 fe ff ff       	call   3a0 <putc>
      state = 0;
 599:	be 00 00 00 00       	mov    $0x0,%esi
 59e:	e9 ce fe ff ff       	jmp    471 <printf+0x2c>
    }
  }
}
 5a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a6:	5b                   	pop    %ebx
 5a7:	5e                   	pop    %esi
 5a8:	5f                   	pop    %edi
 5a9:	5d                   	pop    %ebp
 5aa:	c3                   	ret    

000005ab <free>:
=======
 4d3:	be 00 00 00 00       	mov    $0x0,%esi
 4d8:	eb 80                	jmp    45a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4dd:	8b 17                	mov    (%edi),%edx
 4df:	83 ec 0c             	sub    $0xc,%esp
 4e2:	6a 00                	push   $0x0
 4e4:	b9 10 00 00 00       	mov    $0x10,%ecx
 4e9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ec:	e8 b2 fe ff ff       	call   3a3 <printint>
        ap++;
 4f1:	83 c7 04             	add    $0x4,%edi
 4f4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4f7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4fa:	be 00 00 00 00       	mov    $0x0,%esi
 4ff:	e9 56 ff ff ff       	jmp    45a <printf+0x2c>
        s = (char*)*ap;
 504:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 507:	8b 30                	mov    (%eax),%esi
        ap++;
 509:	83 c0 04             	add    $0x4,%eax
 50c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 50f:	85 f6                	test   %esi,%esi
 511:	75 15                	jne    528 <printf+0xfa>
          s = "(null)";
 513:	be e5 06 00 00       	mov    $0x6e5,%esi
 518:	eb 0e                	jmp    528 <printf+0xfa>
          putc(fd, *s);
 51a:	0f be d2             	movsbl %dl,%edx
 51d:	8b 45 08             	mov    0x8(%ebp),%eax
 520:	e8 64 fe ff ff       	call   389 <putc>
          s++;
 525:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 528:	0f b6 16             	movzbl (%esi),%edx
 52b:	84 d2                	test   %dl,%dl
 52d:	75 eb                	jne    51a <printf+0xec>
      state = 0;
 52f:	be 00 00 00 00       	mov    $0x0,%esi
 534:	e9 21 ff ff ff       	jmp    45a <printf+0x2c>
        putc(fd, *ap);
 539:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 53c:	0f be 17             	movsbl (%edi),%edx
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	e8 42 fe ff ff       	call   389 <putc>
        ap++;
 547:	83 c7 04             	add    $0x4,%edi
 54a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 54d:	be 00 00 00 00       	mov    $0x0,%esi
 552:	e9 03 ff ff ff       	jmp    45a <printf+0x2c>
        putc(fd, c);
 557:	89 fa                	mov    %edi,%edx
 559:	8b 45 08             	mov    0x8(%ebp),%eax
 55c:	e8 28 fe ff ff       	call   389 <putc>
      state = 0;
 561:	be 00 00 00 00       	mov    $0x0,%esi
 566:	e9 ef fe ff ff       	jmp    45a <printf+0x2c>
        putc(fd, '%');
 56b:	ba 25 00 00 00       	mov    $0x25,%edx
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	e8 11 fe ff ff       	call   389 <putc>
        putc(fd, c);
 578:	89 fa                	mov    %edi,%edx
 57a:	8b 45 08             	mov    0x8(%ebp),%eax
 57d:	e8 07 fe ff ff       	call   389 <putc>
      state = 0;
 582:	be 00 00 00 00       	mov    $0x0,%esi
 587:	e9 ce fe ff ff       	jmp    45a <printf+0x2c>
    }
  }
}
 58c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58f:	5b                   	pop    %ebx
 590:	5e                   	pop    %esi
 591:	5f                   	pop    %edi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    

00000594 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	57                   	push   %edi
 5af:	56                   	push   %esi
 5b0:	53                   	push   %ebx
 5b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5b4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b7:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 5bc:	eb 02                	jmp    5c0 <free+0x15>
 5be:	89 d0                	mov    %edx,%eax
 5c0:	39 c8                	cmp    %ecx,%eax
 5c2:	73 04                	jae    5c8 <free+0x1d>
 5c4:	39 08                	cmp    %ecx,(%eax)
 5c6:	77 12                	ja     5da <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c8:	8b 10                	mov    (%eax),%edx
 5ca:	39 c2                	cmp    %eax,%edx
 5cc:	77 f0                	ja     5be <free+0x13>
 5ce:	39 c8                	cmp    %ecx,%eax
 5d0:	72 08                	jb     5da <free+0x2f>
 5d2:	39 ca                	cmp    %ecx,%edx
 5d4:	77 04                	ja     5da <free+0x2f>
 5d6:	89 d0                	mov    %edx,%eax
 5d8:	eb e6                	jmp    5c0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5da:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5dd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5e0:	8b 10                	mov    (%eax),%edx
 5e2:	39 d7                	cmp    %edx,%edi
 5e4:	74 19                	je     5ff <free+0x54>
=======
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	57                   	push   %edi
 598:	56                   	push   %esi
 599:	53                   	push   %ebx
 59a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 59d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a0:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 5a5:	eb 02                	jmp    5a9 <free+0x15>
 5a7:	89 d0                	mov    %edx,%eax
 5a9:	39 c8                	cmp    %ecx,%eax
 5ab:	73 04                	jae    5b1 <free+0x1d>
 5ad:	39 08                	cmp    %ecx,(%eax)
 5af:	77 12                	ja     5c3 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5b1:	8b 10                	mov    (%eax),%edx
 5b3:	39 c2                	cmp    %eax,%edx
 5b5:	77 f0                	ja     5a7 <free+0x13>
 5b7:	39 c8                	cmp    %ecx,%eax
 5b9:	72 08                	jb     5c3 <free+0x2f>
 5bb:	39 ca                	cmp    %ecx,%edx
 5bd:	77 04                	ja     5c3 <free+0x2f>
 5bf:	89 d0                	mov    %edx,%eax
 5c1:	eb e6                	jmp    5a9 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5c3:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5c6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5c9:	8b 10                	mov    (%eax),%edx
 5cb:	39 d7                	cmp    %edx,%edi
 5cd:	74 19                	je     5e8 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 5e6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5e9:	8b 50 04             	mov    0x4(%eax),%edx
 5ec:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5ef:	39 ce                	cmp    %ecx,%esi
 5f1:	74 1b                	je     60e <free+0x63>
=======
 5cf:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5d2:	8b 50 04             	mov    0x4(%eax),%edx
 5d5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5d8:	39 ce                	cmp    %ecx,%esi
 5da:	74 1b                	je     5f7 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 5f3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5f5:	a3 e0 0b 00 00       	mov    %eax,0xbe0
}
 5fa:	5b                   	pop    %ebx
 5fb:	5e                   	pop    %esi
 5fc:	5f                   	pop    %edi
 5fd:	5d                   	pop    %ebp
 5fe:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5ff:	03 72 04             	add    0x4(%edx),%esi
 602:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 605:	8b 10                	mov    (%eax),%edx
 607:	8b 12                	mov    (%edx),%edx
 609:	89 53 f8             	mov    %edx,-0x8(%ebx)
 60c:	eb db                	jmp    5e9 <free+0x3e>
    p->s.size += bp->s.size;
 60e:	03 53 fc             	add    -0x4(%ebx),%edx
 611:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 614:	8b 53 f8             	mov    -0x8(%ebx),%edx
 617:	89 10                	mov    %edx,(%eax)
 619:	eb da                	jmp    5f5 <free+0x4a>

0000061b <morecore>:
=======
 5dc:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5de:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 5e3:	5b                   	pop    %ebx
 5e4:	5e                   	pop    %esi
 5e5:	5f                   	pop    %edi
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5e8:	03 72 04             	add    0x4(%edx),%esi
 5eb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5ee:	8b 10                	mov    (%eax),%edx
 5f0:	8b 12                	mov    (%edx),%edx
 5f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5f5:	eb db                	jmp    5d2 <free+0x3e>
    p->s.size += bp->s.size;
 5f7:	03 53 fc             	add    -0x4(%ebx),%edx
 5fa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5fd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 600:	89 10                	mov    %edx,(%eax)
 602:	eb da                	jmp    5de <free+0x4a>

00000604 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 61b:	55                   	push   %ebp
 61c:	89 e5                	mov    %esp,%ebp
 61e:	53                   	push   %ebx
 61f:	83 ec 04             	sub    $0x4,%esp
 622:	89 c3                	mov    %eax,%ebx
=======
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	53                   	push   %ebx
 608:	83 ec 04             	sub    $0x4,%esp
 60b:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 624:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 629:	77 05                	ja     630 <morecore+0x15>
    nu = 4096;
 62b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 630:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 637:	83 ec 0c             	sub    $0xc,%esp
 63a:	50                   	push   %eax
 63b:	e8 38 fd ff ff       	call   378 <sbrk>
  if(p == (char*)-1)
 640:	83 c4 10             	add    $0x10,%esp
 643:	83 f8 ff             	cmp    $0xffffffff,%eax
 646:	74 1c                	je     664 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 648:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 64b:	83 c0 08             	add    $0x8,%eax
 64e:	83 ec 0c             	sub    $0xc,%esp
 651:	50                   	push   %eax
 652:	e8 54 ff ff ff       	call   5ab <free>
  return freep;
 657:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 65c:	83 c4 10             	add    $0x10,%esp
}
 65f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 662:	c9                   	leave  
 663:	c3                   	ret    
    return 0;
 664:	b8 00 00 00 00       	mov    $0x0,%eax
 669:	eb f4                	jmp    65f <morecore+0x44>

0000066b <malloc>:
=======
 60d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 612:	77 05                	ja     619 <morecore+0x15>
    nu = 4096;
 614:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 619:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	50                   	push   %eax
 624:	e8 38 fd ff ff       	call   361 <sbrk>
  if(p == (char*)-1)
 629:	83 c4 10             	add    $0x10,%esp
 62c:	83 f8 ff             	cmp    $0xffffffff,%eax
 62f:	74 1c                	je     64d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 631:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 634:	83 c0 08             	add    $0x8,%eax
 637:	83 ec 0c             	sub    $0xc,%esp
 63a:	50                   	push   %eax
 63b:	e8 54 ff ff ff       	call   594 <free>
  return freep;
 640:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 645:	83 c4 10             	add    $0x10,%esp
}
 648:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 64b:	c9                   	leave  
 64c:	c3                   	ret    
    return 0;
 64d:	b8 00 00 00 00       	mov    $0x0,%eax
 652:	eb f4                	jmp    648 <morecore+0x44>

00000654 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 66b:	55                   	push   %ebp
 66c:	89 e5                	mov    %esp,%ebp
 66e:	53                   	push   %ebx
 66f:	83 ec 04             	sub    $0x4,%esp
=======
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	53                   	push   %ebx
 658:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 672:	8b 45 08             	mov    0x8(%ebp),%eax
 675:	8d 58 07             	lea    0x7(%eax),%ebx
 678:	c1 eb 03             	shr    $0x3,%ebx
 67b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 67e:	8b 0d e0 0b 00 00    	mov    0xbe0,%ecx
 684:	85 c9                	test   %ecx,%ecx
 686:	74 04                	je     68c <malloc+0x21>
=======
 65b:	8b 45 08             	mov    0x8(%ebp),%eax
 65e:	8d 58 07             	lea    0x7(%eax),%ebx
 661:	c1 eb 03             	shr    $0x3,%ebx
 664:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 667:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 66d:	85 c9                	test   %ecx,%ecx
 66f:	74 04                	je     675 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 688:	8b 01                	mov    (%ecx),%eax
 68a:	eb 4a                	jmp    6d6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 68c:	c7 05 e0 0b 00 00 e4 	movl   $0xbe4,0xbe0
 693:	0b 00 00 
 696:	c7 05 e4 0b 00 00 e4 	movl   $0xbe4,0xbe4
 69d:	0b 00 00 
    base.s.size = 0;
 6a0:	c7 05 e8 0b 00 00 00 	movl   $0x0,0xbe8
 6a7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6aa:	b9 e4 0b 00 00       	mov    $0xbe4,%ecx
 6af:	eb d7                	jmp    688 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6b1:	74 19                	je     6cc <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6b3:	29 da                	sub    %ebx,%edx
 6b5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6b8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6bb:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6be:	89 0d e0 0b 00 00    	mov    %ecx,0xbe0
      return (void*)(p + 1);
 6c4:	83 c0 08             	add    $0x8,%eax
=======
 671:	8b 01                	mov    (%ecx),%eax
 673:	eb 4a                	jmp    6bf <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 675:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 67c:	0d 00 00 
 67f:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 686:	0d 00 00 
    base.s.size = 0;
 689:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 690:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 693:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
 698:	eb d7                	jmp    671 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 69a:	74 19                	je     6b5 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 69c:	29 da                	sub    %ebx,%edx
 69e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6a1:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6a4:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6a7:	89 0d c0 0d 00 00    	mov    %ecx,0xdc0
      return (void*)(p + 1);
 6ad:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 6c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ca:	c9                   	leave  
 6cb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6cc:	8b 10                	mov    (%eax),%edx
 6ce:	89 11                	mov    %edx,(%ecx)
 6d0:	eb ec                	jmp    6be <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d2:	89 c1                	mov    %eax,%ecx
 6d4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6d6:	8b 50 04             	mov    0x4(%eax),%edx
 6d9:	39 da                	cmp    %ebx,%edx
 6db:	73 d4                	jae    6b1 <malloc+0x46>
    if(p == freep)
 6dd:	39 05 e0 0b 00 00    	cmp    %eax,0xbe0
 6e3:	75 ed                	jne    6d2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6e5:	89 d8                	mov    %ebx,%eax
 6e7:	e8 2f ff ff ff       	call   61b <morecore>
 6ec:	85 c0                	test   %eax,%eax
 6ee:	75 e2                	jne    6d2 <malloc+0x67>
 6f0:	eb d5                	jmp    6c7 <malloc+0x5c>
=======
 6b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6b3:	c9                   	leave  
 6b4:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6b5:	8b 10                	mov    (%eax),%edx
 6b7:	89 11                	mov    %edx,(%ecx)
 6b9:	eb ec                	jmp    6a7 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6bb:	89 c1                	mov    %eax,%ecx
 6bd:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6bf:	8b 50 04             	mov    0x4(%eax),%edx
 6c2:	39 da                	cmp    %ebx,%edx
 6c4:	73 d4                	jae    69a <malloc+0x46>
    if(p == freep)
 6c6:	39 05 c0 0d 00 00    	cmp    %eax,0xdc0
 6cc:	75 ed                	jne    6bb <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6ce:	89 d8                	mov    %ebx,%eax
 6d0:	e8 2f ff ff ff       	call   604 <morecore>
 6d5:	85 c0                	test   %eax,%eax
 6d7:	75 e2                	jne    6bb <malloc+0x67>
 6d9:	eb d5                	jmp    6b0 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
