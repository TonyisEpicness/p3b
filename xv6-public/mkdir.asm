
_mkdir:     file format elf32-i386


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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 41 04             	mov    0x4(%ecx),%eax
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  1c:	83 ff 01             	cmp    $0x1,%edi
  1f:	7e 07                	jle    28 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: mkdir files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
  2b:	68 14 07 00 00       	push   $0x714
  30:	6a 02                	push   $0x2
  32:	e8 30 04 00 00       	call   467 <printf>
    exit();
  37:	e8 d6 02 00 00       	call   312 <exit>
=======
  2b:	68 00 07 00 00       	push   $0x700
  30:	6a 02                	push   $0x2
  32:	e8 19 04 00 00       	call   450 <printf>
    exit();
  37:	e8 bf 02 00 00       	call   2fb <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(mkdir(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
<<<<<<< HEAD
  4e:	e8 27 03 00 00       	call   37a <mkdir>
=======
  4e:	e8 10 03 00 00       	call   363 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
<<<<<<< HEAD
  5f:	68 2b 07 00 00       	push   $0x72b
  64:	6a 02                	push   $0x2
  66:	e8 fc 03 00 00       	call   467 <printf>
=======
  5f:	68 17 07 00 00       	push   $0x717
  64:	6a 02                	push   $0x2
  66:	e8 e5 03 00 00       	call   450 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
<<<<<<< HEAD
  6e:	e8 9f 02 00 00       	call   312 <exit>
=======
  6e:	e8 88 02 00 00       	call   2fb <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000073 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
  73:	55                   	push   %ebp
  74:	89 e5                	mov    %esp,%ebp
  76:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  79:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  7b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  7e:	89 08                	mov    %ecx,(%eax)
  return old;
}
  80:	89 d0                	mov    %edx,%eax
  82:	5d                   	pop    %ebp
  83:	c3                   	ret    

00000084 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	53                   	push   %ebx
  88:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  8b:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
  90:	e8 f8 05 00 00       	call   68d <malloc>
  if(n_stack == 0){
  95:	83 c4 10             	add    $0x10,%esp
  98:	85 c0                	test   %eax,%eax
  9a:	74 41                	je     dd <thread_create+0x59>
  9c:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
  9e:	50                   	push   %eax
  9f:	ff 75 10             	push   0x10(%ebp)
  a2:	ff 75 0c             	push   0xc(%ebp)
  a5:	ff 75 08             	push   0x8(%ebp)
  a8:	e8 05 03 00 00       	call   3b2 <clone>
=======
  90:	e8 e1 05 00 00       	call   676 <malloc>
  if(n_stack == 0){
  95:	83 c4 10             	add    $0x10,%esp
  98:	85 c0                	test   %eax,%eax
  9a:	74 57                	je     f3 <thread_create+0x6f>
  9c:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
  9e:	b8 00 00 00 00       	mov    $0x0,%eax
  a3:	eb 03                	jmp    a8 <thread_create+0x24>
  a5:	83 c0 01             	add    $0x1,%eax
  a8:	83 f8 3f             	cmp    $0x3f,%eax
  ab:	7f 2f                	jg     dc <thread_create+0x58>
    if(threads[i].flag==0){
  ad:	8d 14 40             	lea    (%eax,%eax,2),%edx
  b0:	83 3c 95 28 0b 00 00 	cmpl   $0x0,0xb28(,%edx,4)
  b7:	00 
  b8:	75 eb                	jne    a5 <thread_create+0x21>
      threads[i].maddr = n_stack;
  ba:	8d 14 00             	lea    (%eax,%eax,1),%edx
  bd:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  c0:	c1 e3 02             	shl    $0x2,%ebx
  c3:	89 8b 20 0b 00 00    	mov    %ecx,0xb20(%ebx)
      threads[i].pg1addr = n_stack;
  c9:	89 8b 24 0b 00 00    	mov    %ecx,0xb24(%ebx)
      threads[i].flag = 1;
  cf:	01 c2                	add    %eax,%edx
  d1:	c7 04 95 28 0b 00 00 	movl   $0x1,0xb28(,%edx,4)
  d8:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  dc:	51                   	push   %ecx
  dd:	ff 75 10             	push   0x10(%ebp)
  e0:	ff 75 0c             	push   0xc(%ebp)
  e3:	ff 75 08             	push   0x8(%ebp)
  e6:	e8 b0 02 00 00       	call   39b <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	ba 00 00 00 00       	mov    $0x0,%edx
  b5:	eb 03                	jmp    ba <thread_create+0x36>
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	83 fa 3f             	cmp    $0x3f,%edx
  bd:	7f 19                	jg     d8 <thread_create+0x54>
    if(threads[i]->flag==0){
  bf:	8b 0c 95 40 0b 00 00 	mov    0xb40(,%edx,4),%ecx
  c6:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  ca:	75 eb                	jne    b7 <thread_create+0x33>
      threads[i]->maddr = n_stack;
  cc:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
  ce:	8b 14 95 40 0b 00 00 	mov    0xb40(,%edx,4),%edx
  d5:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave  
  dc:	c3                   	ret    
    return -1;
  dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  e2:	eb f4                	jmp    d8 <thread_create+0x54>

000000e4 <thread_join>:
=======
  eb:	83 c4 10             	add    $0x10,%esp
}
  ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  f1:	c9                   	leave  
  f2:	c3                   	ret    
    return -1;
  f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f8:	eb f4                	jmp    ee <thread_create+0x6a>

000000fa <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	56                   	push   %esi
  e8:	53                   	push   %ebx
  e9:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  ec:	8d 45 f4             	lea    -0xc(%ebp),%eax
  ef:	50                   	push   %eax
  f0:	e8 c5 02 00 00       	call   3ba <join>
  f5:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	bb 00 00 00 00       	mov    $0x0,%ebx
  ff:	eb 03                	jmp    104 <thread_join+0x20>
 101:	83 c3 01             	add    $0x1,%ebx
 104:	83 fb 3f             	cmp    $0x3f,%ebx
 107:	7f 23                	jg     12c <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 109:	8b 04 9d 40 0b 00 00 	mov    0xb40(,%ebx,4),%eax
 110:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 114:	75 eb                	jne    101 <thread_join+0x1d>
 116:	8b 55 f4             	mov    -0xc(%ebp),%edx
 119:	39 50 04             	cmp    %edx,0x4(%eax)
 11c:	75 e3                	jne    101 <thread_join+0x1d>
      free(stk_addr);
 11e:	83 ec 0c             	sub    $0xc,%esp
 121:	52                   	push   %edx
 122:	e8 a6 04 00 00       	call   5cd <free>
 127:	83 c4 10             	add    $0x10,%esp
 12a:	eb d5                	jmp    101 <thread_join+0x1d>
    }
  }
  return pid;
}
 12c:	89 f0                	mov    %esi,%eax
 12e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 131:	5b                   	pop    %ebx
 132:	5e                   	pop    %esi
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <lock_acquire>:

void lock_acquire(lock_t *lock){
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	53                   	push   %ebx
 139:	83 ec 04             	sub    $0x4,%esp
 13c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 13f:	83 ec 08             	sub    $0x8,%esp
 142:	6a 01                	push   $0x1
 144:	53                   	push   %ebx
 145:	e8 29 ff ff ff       	call   73 <test_and_set>
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	83 f8 01             	cmp    $0x1,%eax
 150:	74 ed                	je     13f <lock_acquire+0xa>
    ;
}
 152:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 155:	c9                   	leave  
 156:	c3                   	ret    

00000157 <lock_release>:

void lock_release(lock_t *lock) {
 157:	55                   	push   %ebp
 158:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 15a:	8b 45 08             	mov    0x8(%ebp),%eax
 15d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    

00000165 <lock_init>:

void lock_init(lock_t *lock) {
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    

00000173 <strcpy>:
=======
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	53                   	push   %ebx
  fe:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 101:	8d 45 f4             	lea    -0xc(%ebp),%eax
 104:	50                   	push   %eax
 105:	e8 99 02 00 00       	call   3a3 <join>
 10a:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 10c:	83 c4 04             	add    $0x4,%esp
 10f:	ff 75 f4             	push   -0xc(%ebp)
 112:	e8 9f 04 00 00       	call   5b6 <free>
  return pid;
}
 117:	89 d8                	mov    %ebx,%eax
 119:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 11c:	c9                   	leave  
 11d:	c3                   	ret    

0000011e <lock_acquire>:

void lock_acquire(lock_t *lock){
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	53                   	push   %ebx
 122:	83 ec 04             	sub    $0x4,%esp
 125:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 128:	83 ec 08             	sub    $0x8,%esp
 12b:	6a 01                	push   $0x1
 12d:	53                   	push   %ebx
 12e:	e8 40 ff ff ff       	call   73 <test_and_set>
 133:	83 c4 10             	add    $0x10,%esp
 136:	83 f8 01             	cmp    $0x1,%eax
 139:	74 ed                	je     128 <lock_acquire+0xa>
    ;
}
 13b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13e:	c9                   	leave  
 13f:	c3                   	ret    

00000140 <lock_release>:

void lock_release(lock_t *lock) {
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 14c:	5d                   	pop    %ebp
 14d:	c3                   	ret    

0000014e <lock_init>:

void lock_init(lock_t *lock) {
 14e:	55                   	push   %ebp
 14f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 151:	8b 45 08             	mov    0x8(%ebp),%eax
 154:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    

0000015c <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 173:	55                   	push   %ebp
 174:	89 e5                	mov    %esp,%ebp
 176:	56                   	push   %esi
 177:	53                   	push   %ebx
 178:	8b 75 08             	mov    0x8(%ebp),%esi
 17b:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	56                   	push   %esi
 160:	53                   	push   %ebx
 161:	8b 75 08             	mov    0x8(%ebp),%esi
 164:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 17e:	89 f0                	mov    %esi,%eax
 180:	89 d1                	mov    %edx,%ecx
 182:	83 c2 01             	add    $0x1,%edx
 185:	89 c3                	mov    %eax,%ebx
 187:	83 c0 01             	add    $0x1,%eax
 18a:	0f b6 09             	movzbl (%ecx),%ecx
 18d:	88 0b                	mov    %cl,(%ebx)
 18f:	84 c9                	test   %cl,%cl
 191:	75 ed                	jne    180 <strcpy+0xd>
    ;
  return os;
}
 193:	89 f0                	mov    %esi,%eax
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5d                   	pop    %ebp
 198:	c3                   	ret    

00000199 <strcmp>:
=======
 167:	89 f0                	mov    %esi,%eax
 169:	89 d1                	mov    %edx,%ecx
 16b:	83 c2 01             	add    $0x1,%edx
 16e:	89 c3                	mov    %eax,%ebx
 170:	83 c0 01             	add    $0x1,%eax
 173:	0f b6 09             	movzbl (%ecx),%ecx
 176:	88 0b                	mov    %cl,(%ebx)
 178:	84 c9                	test   %cl,%cl
 17a:	75 ed                	jne    169 <strcpy+0xd>
    ;
  return os;
}
 17c:	89 f0                	mov    %esi,%eax
 17e:	5b                   	pop    %ebx
 17f:	5e                   	pop    %esi
 180:	5d                   	pop    %ebp
 181:	c3                   	ret    

00000182 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1a2:	eb 06                	jmp    1aa <strcmp+0x11>
    p++, q++;
 1a4:	83 c1 01             	add    $0x1,%ecx
 1a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1aa:	0f b6 01             	movzbl (%ecx),%eax
 1ad:	84 c0                	test   %al,%al
 1af:	74 04                	je     1b5 <strcmp+0x1c>
 1b1:	3a 02                	cmp    (%edx),%al
 1b3:	74 ef                	je     1a4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1b5:	0f b6 c0             	movzbl %al,%eax
 1b8:	0f b6 12             	movzbl (%edx),%edx
 1bb:	29 d0                	sub    %edx,%eax
}
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    

000001bf <strlen>:
=======
 182:	55                   	push   %ebp
 183:	89 e5                	mov    %esp,%ebp
 185:	8b 4d 08             	mov    0x8(%ebp),%ecx
 188:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 18b:	eb 06                	jmp    193 <strcmp+0x11>
    p++, q++;
 18d:	83 c1 01             	add    $0x1,%ecx
 190:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 193:	0f b6 01             	movzbl (%ecx),%eax
 196:	84 c0                	test   %al,%al
 198:	74 04                	je     19e <strcmp+0x1c>
 19a:	3a 02                	cmp    (%edx),%al
 19c:	74 ef                	je     18d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 19e:	0f b6 c0             	movzbl %al,%eax
 1a1:	0f b6 12             	movzbl (%edx),%edx
 1a4:	29 d0                	sub    %edx,%eax
}
 1a6:	5d                   	pop    %ebp
 1a7:	c3                   	ret    

000001a8 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 1bf:	55                   	push   %ebp
 1c0:	89 e5                	mov    %esp,%ebp
 1c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c5:	b8 00 00 00 00       	mov    $0x0,%eax
 1ca:	eb 03                	jmp    1cf <strlen+0x10>
 1cc:	83 c0 01             	add    $0x1,%eax
 1cf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1d3:	75 f7                	jne    1cc <strlen+0xd>
    ;
  return n;
}
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    

000001d7 <memset>:
=======
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1ae:	b8 00 00 00 00       	mov    $0x0,%eax
 1b3:	eb 03                	jmp    1b8 <strlen+0x10>
 1b5:	83 c0 01             	add    $0x1,%eax
 1b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1bc:	75 f7                	jne    1b5 <strlen+0xd>
    ;
  return n;
}
 1be:	5d                   	pop    %ebp
 1bf:	c3                   	ret    

000001c0 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 1d7:	55                   	push   %ebp
 1d8:	89 e5                	mov    %esp,%ebp
 1da:	57                   	push   %edi
 1db:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 1de:	89 d7                	mov    %edx,%edi
 1e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e6:	fc                   	cld    
 1e7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e9:	89 d0                	mov    %edx,%eax
 1eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1ee:	c9                   	leave  
 1ef:	c3                   	ret    

000001f0 <strchr>:
=======
 1c7:	89 d7                	mov    %edx,%edi
 1c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1d7:	c9                   	leave  
 1d8:	c3                   	ret    

000001d9 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	eb 03                	jmp    1ff <strchr+0xf>
 1fc:	83 c0 01             	add    $0x1,%eax
 1ff:	0f b6 10             	movzbl (%eax),%edx
 202:	84 d2                	test   %dl,%dl
 204:	74 06                	je     20c <strchr+0x1c>
    if(*s == c)
 206:	38 ca                	cmp    %cl,%dl
 208:	75 f2                	jne    1fc <strchr+0xc>
 20a:	eb 05                	jmp    211 <strchr+0x21>
      return (char*)s;
  return 0;
 20c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <gets>:
=======
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	8b 45 08             	mov    0x8(%ebp),%eax
 1df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1e3:	eb 03                	jmp    1e8 <strchr+0xf>
 1e5:	83 c0 01             	add    $0x1,%eax
 1e8:	0f b6 10             	movzbl (%eax),%edx
 1eb:	84 d2                	test   %dl,%dl
 1ed:	74 06                	je     1f5 <strchr+0x1c>
    if(*s == c)
 1ef:	38 ca                	cmp    %cl,%dl
 1f1:	75 f2                	jne    1e5 <strchr+0xc>
 1f3:	eb 05                	jmp    1fa <strchr+0x21>
      return (char*)s;
  return 0;
 1f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1fa:	5d                   	pop    %ebp
 1fb:	c3                   	ret    

000001fc <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	57                   	push   %edi
 217:	56                   	push   %esi
 218:	53                   	push   %ebx
 219:	83 ec 1c             	sub    $0x1c,%esp
 21c:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	57                   	push   %edi
 200:	56                   	push   %esi
 201:	53                   	push   %ebx
 202:	83 ec 1c             	sub    $0x1c,%esp
 205:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 21f:	bb 00 00 00 00       	mov    $0x0,%ebx
 224:	89 de                	mov    %ebx,%esi
 226:	83 c3 01             	add    $0x1,%ebx
 229:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 22c:	7d 2e                	jge    25c <gets+0x49>
    cc = read(0, &c, 1);
 22e:	83 ec 04             	sub    $0x4,%esp
 231:	6a 01                	push   $0x1
 233:	8d 45 e7             	lea    -0x19(%ebp),%eax
 236:	50                   	push   %eax
 237:	6a 00                	push   $0x0
 239:	e8 ec 00 00 00       	call   32a <read>
    if(cc < 1)
 23e:	83 c4 10             	add    $0x10,%esp
 241:	85 c0                	test   %eax,%eax
 243:	7e 17                	jle    25c <gets+0x49>
      break;
    buf[i++] = c;
 245:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 249:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 24c:	3c 0a                	cmp    $0xa,%al
 24e:	0f 94 c2             	sete   %dl
 251:	3c 0d                	cmp    $0xd,%al
 253:	0f 94 c0             	sete   %al
 256:	08 c2                	or     %al,%dl
 258:	74 ca                	je     224 <gets+0x11>
    buf[i++] = c;
 25a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 25c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 260:	89 f8                	mov    %edi,%eax
 262:	8d 65 f4             	lea    -0xc(%ebp),%esp
 265:	5b                   	pop    %ebx
 266:	5e                   	pop    %esi
 267:	5f                   	pop    %edi
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    

0000026a <stat>:
=======
 208:	bb 00 00 00 00       	mov    $0x0,%ebx
 20d:	89 de                	mov    %ebx,%esi
 20f:	83 c3 01             	add    $0x1,%ebx
 212:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 215:	7d 2e                	jge    245 <gets+0x49>
    cc = read(0, &c, 1);
 217:	83 ec 04             	sub    $0x4,%esp
 21a:	6a 01                	push   $0x1
 21c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 21f:	50                   	push   %eax
 220:	6a 00                	push   $0x0
 222:	e8 ec 00 00 00       	call   313 <read>
    if(cc < 1)
 227:	83 c4 10             	add    $0x10,%esp
 22a:	85 c0                	test   %eax,%eax
 22c:	7e 17                	jle    245 <gets+0x49>
      break;
    buf[i++] = c;
 22e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 232:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 235:	3c 0a                	cmp    $0xa,%al
 237:	0f 94 c2             	sete   %dl
 23a:	3c 0d                	cmp    $0xd,%al
 23c:	0f 94 c0             	sete   %al
 23f:	08 c2                	or     %al,%dl
 241:	74 ca                	je     20d <gets+0x11>
    buf[i++] = c;
 243:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 245:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 249:	89 f8                	mov    %edi,%eax
 24b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24e:	5b                   	pop    %ebx
 24f:	5e                   	pop    %esi
 250:	5f                   	pop    %edi
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    

00000253 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 26a:	55                   	push   %ebp
 26b:	89 e5                	mov    %esp,%ebp
 26d:	56                   	push   %esi
 26e:	53                   	push   %ebx
=======
 253:	55                   	push   %ebp
 254:	89 e5                	mov    %esp,%ebp
 256:	56                   	push   %esi
 257:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 26f:	83 ec 08             	sub    $0x8,%esp
 272:	6a 00                	push   $0x0
 274:	ff 75 08             	push   0x8(%ebp)
 277:	e8 d6 00 00 00       	call   352 <open>
  if(fd < 0)
 27c:	83 c4 10             	add    $0x10,%esp
 27f:	85 c0                	test   %eax,%eax
 281:	78 24                	js     2a7 <stat+0x3d>
 283:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	ff 75 0c             	push   0xc(%ebp)
 28b:	50                   	push   %eax
 28c:	e8 d9 00 00 00       	call   36a <fstat>
 291:	89 c6                	mov    %eax,%esi
  close(fd);
 293:	89 1c 24             	mov    %ebx,(%esp)
 296:	e8 9f 00 00 00       	call   33a <close>
  return r;
 29b:	83 c4 10             	add    $0x10,%esp
}
 29e:	89 f0                	mov    %esi,%eax
 2a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a3:	5b                   	pop    %ebx
 2a4:	5e                   	pop    %esi
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    
    return -1;
 2a7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2ac:	eb f0                	jmp    29e <stat+0x34>

000002ae <atoi>:
=======
 258:	83 ec 08             	sub    $0x8,%esp
 25b:	6a 00                	push   $0x0
 25d:	ff 75 08             	push   0x8(%ebp)
 260:	e8 d6 00 00 00       	call   33b <open>
  if(fd < 0)
 265:	83 c4 10             	add    $0x10,%esp
 268:	85 c0                	test   %eax,%eax
 26a:	78 24                	js     290 <stat+0x3d>
 26c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 26e:	83 ec 08             	sub    $0x8,%esp
 271:	ff 75 0c             	push   0xc(%ebp)
 274:	50                   	push   %eax
 275:	e8 d9 00 00 00       	call   353 <fstat>
 27a:	89 c6                	mov    %eax,%esi
  close(fd);
 27c:	89 1c 24             	mov    %ebx,(%esp)
 27f:	e8 9f 00 00 00       	call   323 <close>
  return r;
 284:	83 c4 10             	add    $0x10,%esp
}
 287:	89 f0                	mov    %esi,%eax
 289:	8d 65 f8             	lea    -0x8(%ebp),%esp
 28c:	5b                   	pop    %ebx
 28d:	5e                   	pop    %esi
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    
    return -1;
 290:	be ff ff ff ff       	mov    $0xffffffff,%esi
 295:	eb f0                	jmp    287 <stat+0x34>

00000297 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 2ae:	55                   	push   %ebp
 2af:	89 e5                	mov    %esp,%ebp
 2b1:	53                   	push   %ebx
 2b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2b5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2ba:	eb 10                	jmp    2cc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2bc:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2bf:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2c2:	83 c1 01             	add    $0x1,%ecx
 2c5:	0f be c0             	movsbl %al,%eax
 2c8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2cc:	0f b6 01             	movzbl (%ecx),%eax
 2cf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d2:	80 fb 09             	cmp    $0x9,%bl
 2d5:	76 e5                	jbe    2bc <atoi+0xe>
  return n;
}
 2d7:	89 d0                	mov    %edx,%eax
 2d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2dc:	c9                   	leave  
 2dd:	c3                   	ret    

000002de <memmove>:
=======
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	53                   	push   %ebx
 29b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 29e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2a3:	eb 10                	jmp    2b5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2ab:	83 c1 01             	add    $0x1,%ecx
 2ae:	0f be c0             	movsbl %al,%eax
 2b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2b5:	0f b6 01             	movzbl (%ecx),%eax
 2b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2bb:	80 fb 09             	cmp    $0x9,%bl
 2be:	76 e5                	jbe    2a5 <atoi+0xe>
  return n;
}
 2c0:	89 d0                	mov    %edx,%eax
 2c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	56                   	push   %esi
 2e2:	53                   	push   %ebx
 2e3:	8b 75 08             	mov    0x8(%ebp),%esi
 2e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2e9:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	56                   	push   %esi
 2cb:	53                   	push   %ebx
 2cc:	8b 75 08             	mov    0x8(%ebp),%esi
 2cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d2:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 2ec:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2ee:	eb 0d                	jmp    2fd <memmove+0x1f>
    *dst++ = *src++;
 2f0:	0f b6 01             	movzbl (%ecx),%eax
 2f3:	88 02                	mov    %al,(%edx)
 2f5:	8d 49 01             	lea    0x1(%ecx),%ecx
 2f8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2fb:	89 d8                	mov    %ebx,%eax
 2fd:	8d 58 ff             	lea    -0x1(%eax),%ebx
 300:	85 c0                	test   %eax,%eax
 302:	7f ec                	jg     2f0 <memmove+0x12>
  return vdst;
}
 304:	89 f0                	mov    %esi,%eax
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    

0000030a <fork>:
=======
 2d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2d7:	eb 0d                	jmp    2e6 <memmove+0x1f>
    *dst++ = *src++;
 2d9:	0f b6 01             	movzbl (%ecx),%eax
 2dc:	88 02                	mov    %al,(%edx)
 2de:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2e4:	89 d8                	mov    %ebx,%eax
 2e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2e9:	85 c0                	test   %eax,%eax
 2eb:	7f ec                	jg     2d9 <memmove+0x12>
  return vdst;
}
 2ed:	89 f0                	mov    %esi,%eax
 2ef:	5b                   	pop    %ebx
 2f0:	5e                   	pop    %esi
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    

000002f3 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 30a:	b8 01 00 00 00       	mov    $0x1,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <exit>:
SYSCALL(exit)
 312:	b8 02 00 00 00       	mov    $0x2,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <wait>:
SYSCALL(wait)
 31a:	b8 03 00 00 00       	mov    $0x3,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <pipe>:
SYSCALL(pipe)
 322:	b8 04 00 00 00       	mov    $0x4,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <read>:
SYSCALL(read)
 32a:	b8 05 00 00 00       	mov    $0x5,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <write>:
SYSCALL(write)
 332:	b8 10 00 00 00       	mov    $0x10,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <close>:
SYSCALL(close)
 33a:	b8 15 00 00 00       	mov    $0x15,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <kill>:
SYSCALL(kill)
 342:	b8 06 00 00 00       	mov    $0x6,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <exec>:
SYSCALL(exec)
 34a:	b8 07 00 00 00       	mov    $0x7,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <open>:
SYSCALL(open)
 352:	b8 0f 00 00 00       	mov    $0xf,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <mknod>:
SYSCALL(mknod)
 35a:	b8 11 00 00 00       	mov    $0x11,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <unlink>:
SYSCALL(unlink)
 362:	b8 12 00 00 00       	mov    $0x12,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <fstat>:
SYSCALL(fstat)
 36a:	b8 08 00 00 00       	mov    $0x8,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <link>:
SYSCALL(link)
 372:	b8 13 00 00 00       	mov    $0x13,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <mkdir>:
SYSCALL(mkdir)
 37a:	b8 14 00 00 00       	mov    $0x14,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <chdir>:
SYSCALL(chdir)
 382:	b8 09 00 00 00       	mov    $0x9,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <dup>:
SYSCALL(dup)
 38a:	b8 0a 00 00 00       	mov    $0xa,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <getpid>:
SYSCALL(getpid)
 392:	b8 0b 00 00 00       	mov    $0xb,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <sbrk>:
SYSCALL(sbrk)
 39a:	b8 0c 00 00 00       	mov    $0xc,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <sleep>:
SYSCALL(sleep)
 3a2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <uptime>:
SYSCALL(uptime)
 3aa:	b8 0e 00 00 00       	mov    $0xe,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <clone>:
SYSCALL(clone)
 3b2:	b8 16 00 00 00       	mov    $0x16,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <join>:
 3ba:	b8 17 00 00 00       	mov    $0x17,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <putc>:
=======
 2f3:	b8 01 00 00 00       	mov    $0x1,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <exit>:
SYSCALL(exit)
 2fb:	b8 02 00 00 00       	mov    $0x2,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <wait>:
SYSCALL(wait)
 303:	b8 03 00 00 00       	mov    $0x3,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <pipe>:
SYSCALL(pipe)
 30b:	b8 04 00 00 00       	mov    $0x4,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <read>:
SYSCALL(read)
 313:	b8 05 00 00 00       	mov    $0x5,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <write>:
SYSCALL(write)
 31b:	b8 10 00 00 00       	mov    $0x10,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <close>:
SYSCALL(close)
 323:	b8 15 00 00 00       	mov    $0x15,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <kill>:
SYSCALL(kill)
 32b:	b8 06 00 00 00       	mov    $0x6,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <exec>:
SYSCALL(exec)
 333:	b8 07 00 00 00       	mov    $0x7,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <open>:
SYSCALL(open)
 33b:	b8 0f 00 00 00       	mov    $0xf,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <mknod>:
SYSCALL(mknod)
 343:	b8 11 00 00 00       	mov    $0x11,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <unlink>:
SYSCALL(unlink)
 34b:	b8 12 00 00 00       	mov    $0x12,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <fstat>:
SYSCALL(fstat)
 353:	b8 08 00 00 00       	mov    $0x8,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <link>:
SYSCALL(link)
 35b:	b8 13 00 00 00       	mov    $0x13,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <mkdir>:
SYSCALL(mkdir)
 363:	b8 14 00 00 00       	mov    $0x14,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <chdir>:
SYSCALL(chdir)
 36b:	b8 09 00 00 00       	mov    $0x9,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <dup>:
SYSCALL(dup)
 373:	b8 0a 00 00 00       	mov    $0xa,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <getpid>:
SYSCALL(getpid)
 37b:	b8 0b 00 00 00       	mov    $0xb,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <sbrk>:
SYSCALL(sbrk)
 383:	b8 0c 00 00 00       	mov    $0xc,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <sleep>:
SYSCALL(sleep)
 38b:	b8 0d 00 00 00       	mov    $0xd,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <uptime>:
SYSCALL(uptime)
 393:	b8 0e 00 00 00       	mov    $0xe,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <clone>:
SYSCALL(clone)
 39b:	b8 16 00 00 00       	mov    $0x16,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <join>:
 3a3:	b8 17 00 00 00       	mov    $0x17,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	83 ec 1c             	sub    $0x1c,%esp
 3c8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3cb:	6a 01                	push   $0x1
 3cd:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3d0:	52                   	push   %edx
 3d1:	50                   	push   %eax
 3d2:	e8 5b ff ff ff       	call   332 <write>
}
 3d7:	83 c4 10             	add    $0x10,%esp
 3da:	c9                   	leave  
 3db:	c3                   	ret    

000003dc <printint>:
=======
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	83 ec 1c             	sub    $0x1c,%esp
 3b1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3b4:	6a 01                	push   $0x1
 3b6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3b9:	52                   	push   %edx
 3ba:	50                   	push   %eax
 3bb:	e8 5b ff ff ff       	call   31b <write>
}
 3c0:	83 c4 10             	add    $0x10,%esp
 3c3:	c9                   	leave  
 3c4:	c3                   	ret    

000003c5 <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 3dc:	55                   	push   %ebp
 3dd:	89 e5                	mov    %esp,%ebp
 3df:	57                   	push   %edi
 3e0:	56                   	push   %esi
 3e1:	53                   	push   %ebx
 3e2:	83 ec 2c             	sub    $0x2c,%esp
 3e5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3e8:	89 d0                	mov    %edx,%eax
 3ea:	89 ce                	mov    %ecx,%esi
=======
 3c5:	55                   	push   %ebp
 3c6:	89 e5                	mov    %esp,%ebp
 3c8:	57                   	push   %edi
 3c9:	56                   	push   %esi
 3ca:	53                   	push   %ebx
 3cb:	83 ec 2c             	sub    $0x2c,%esp
 3ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3d1:	89 d0                	mov    %edx,%eax
 3d3:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 3ec:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3f0:	0f 95 c1             	setne  %cl
 3f3:	c1 ea 1f             	shr    $0x1f,%edx
 3f6:	84 d1                	test   %dl,%cl
 3f8:	74 44                	je     43e <printint+0x62>
    neg = 1;
    x = -xx;
 3fa:	f7 d8                	neg    %eax
 3fc:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3fe:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 3d5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3d9:	0f 95 c1             	setne  %cl
 3dc:	c1 ea 1f             	shr    $0x1f,%edx
 3df:	84 d1                	test   %dl,%cl
 3e1:	74 44                	je     427 <printint+0x62>
    neg = 1;
    x = -xx;
 3e3:	f7 d8                	neg    %eax
 3e5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3e7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 405:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 40a:	89 c8                	mov    %ecx,%eax
 40c:	ba 00 00 00 00       	mov    $0x0,%edx
 411:	f7 f6                	div    %esi
 413:	89 df                	mov    %ebx,%edi
 415:	83 c3 01             	add    $0x1,%ebx
 418:	0f b6 92 a8 07 00 00 	movzbl 0x7a8(%edx),%edx
 41f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 423:	89 ca                	mov    %ecx,%edx
 425:	89 c1                	mov    %eax,%ecx
 427:	39 d6                	cmp    %edx,%esi
 429:	76 df                	jbe    40a <printint+0x2e>
  if(neg)
 42b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 42f:	74 31                	je     462 <printint+0x86>
    buf[i++] = '-';
 431:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 436:	8d 5f 02             	lea    0x2(%edi),%ebx
 439:	8b 75 d0             	mov    -0x30(%ebp),%esi
 43c:	eb 17                	jmp    455 <printint+0x79>
    x = xx;
 43e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 440:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 447:	eb bc                	jmp    405 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 449:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 44e:	89 f0                	mov    %esi,%eax
 450:	e8 6d ff ff ff       	call   3c2 <putc>
  while(--i >= 0)
 455:	83 eb 01             	sub    $0x1,%ebx
 458:	79 ef                	jns    449 <printint+0x6d>
}
 45a:	83 c4 2c             	add    $0x2c,%esp
 45d:	5b                   	pop    %ebx
 45e:	5e                   	pop    %esi
 45f:	5f                   	pop    %edi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    
 462:	8b 75 d0             	mov    -0x30(%ebp),%esi
 465:	eb ee                	jmp    455 <printint+0x79>

00000467 <printf>:
=======
 3ee:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	ba 00 00 00 00       	mov    $0x0,%edx
 3fa:	f7 f6                	div    %esi
 3fc:	89 df                	mov    %ebx,%edi
 3fe:	83 c3 01             	add    $0x1,%ebx
 401:	0f b6 92 94 07 00 00 	movzbl 0x794(%edx),%edx
 408:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 40c:	89 ca                	mov    %ecx,%edx
 40e:	89 c1                	mov    %eax,%ecx
 410:	39 d6                	cmp    %edx,%esi
 412:	76 df                	jbe    3f3 <printint+0x2e>
  if(neg)
 414:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 418:	74 31                	je     44b <printint+0x86>
    buf[i++] = '-';
 41a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 41f:	8d 5f 02             	lea    0x2(%edi),%ebx
 422:	8b 75 d0             	mov    -0x30(%ebp),%esi
 425:	eb 17                	jmp    43e <printint+0x79>
    x = xx;
 427:	89 c1                	mov    %eax,%ecx
  neg = 0;
 429:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 430:	eb bc                	jmp    3ee <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 432:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 437:	89 f0                	mov    %esi,%eax
 439:	e8 6d ff ff ff       	call   3ab <putc>
  while(--i >= 0)
 43e:	83 eb 01             	sub    $0x1,%ebx
 441:	79 ef                	jns    432 <printint+0x6d>
}
 443:	83 c4 2c             	add    $0x2c,%esp
 446:	5b                   	pop    %ebx
 447:	5e                   	pop    %esi
 448:	5f                   	pop    %edi
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret    
 44b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 44e:	eb ee                	jmp    43e <printint+0x79>

00000450 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	57                   	push   %edi
 46b:	56                   	push   %esi
 46c:	53                   	push   %ebx
 46d:	83 ec 1c             	sub    $0x1c,%esp
=======
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 470:	8d 45 10             	lea    0x10(%ebp),%eax
 473:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 476:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 47b:	bb 00 00 00 00       	mov    $0x0,%ebx
 480:	eb 14                	jmp    496 <printf+0x2f>
=======
 459:	8d 45 10             	lea    0x10(%ebp),%eax
 45c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 45f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 464:	bb 00 00 00 00       	mov    $0x0,%ebx
 469:	eb 14                	jmp    47f <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 482:	89 fa                	mov    %edi,%edx
 484:	8b 45 08             	mov    0x8(%ebp),%eax
 487:	e8 36 ff ff ff       	call   3c2 <putc>
 48c:	eb 05                	jmp    493 <printf+0x2c>
      }
    } else if(state == '%'){
 48e:	83 fe 25             	cmp    $0x25,%esi
 491:	74 25                	je     4b8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 493:	83 c3 01             	add    $0x1,%ebx
 496:	8b 45 0c             	mov    0xc(%ebp),%eax
 499:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 49d:	84 c0                	test   %al,%al
 49f:	0f 84 20 01 00 00    	je     5c5 <printf+0x15e>
    c = fmt[i] & 0xff;
 4a5:	0f be f8             	movsbl %al,%edi
 4a8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4ab:	85 f6                	test   %esi,%esi
 4ad:	75 df                	jne    48e <printf+0x27>
      if(c == '%'){
 4af:	83 f8 25             	cmp    $0x25,%eax
 4b2:	75 ce                	jne    482 <printf+0x1b>
        state = '%';
 4b4:	89 c6                	mov    %eax,%esi
 4b6:	eb db                	jmp    493 <printf+0x2c>
      if(c == 'd'){
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	0f 84 cf 00 00 00    	je     590 <printf+0x129>
 4c1:	0f 8c dd 00 00 00    	jl     5a4 <printf+0x13d>
 4c7:	83 f8 78             	cmp    $0x78,%eax
 4ca:	0f 8f d4 00 00 00    	jg     5a4 <printf+0x13d>
 4d0:	83 f8 63             	cmp    $0x63,%eax
 4d3:	0f 8c cb 00 00 00    	jl     5a4 <printf+0x13d>
 4d9:	83 e8 63             	sub    $0x63,%eax
 4dc:	83 f8 15             	cmp    $0x15,%eax
 4df:	0f 87 bf 00 00 00    	ja     5a4 <printf+0x13d>
 4e5:	ff 24 85 50 07 00 00 	jmp    *0x750(,%eax,4)
        printint(fd, *ap, 10, 1);
 4ec:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ef:	8b 17                	mov    (%edi),%edx
 4f1:	83 ec 0c             	sub    $0xc,%esp
 4f4:	6a 01                	push   $0x1
 4f6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4fb:	8b 45 08             	mov    0x8(%ebp),%eax
 4fe:	e8 d9 fe ff ff       	call   3dc <printint>
        ap++;
 503:	83 c7 04             	add    $0x4,%edi
 506:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 509:	83 c4 10             	add    $0x10,%esp
=======
 46b:	89 fa                	mov    %edi,%edx
 46d:	8b 45 08             	mov    0x8(%ebp),%eax
 470:	e8 36 ff ff ff       	call   3ab <putc>
 475:	eb 05                	jmp    47c <printf+0x2c>
      }
    } else if(state == '%'){
 477:	83 fe 25             	cmp    $0x25,%esi
 47a:	74 25                	je     4a1 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 47c:	83 c3 01             	add    $0x1,%ebx
 47f:	8b 45 0c             	mov    0xc(%ebp),%eax
 482:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 486:	84 c0                	test   %al,%al
 488:	0f 84 20 01 00 00    	je     5ae <printf+0x15e>
    c = fmt[i] & 0xff;
 48e:	0f be f8             	movsbl %al,%edi
 491:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 494:	85 f6                	test   %esi,%esi
 496:	75 df                	jne    477 <printf+0x27>
      if(c == '%'){
 498:	83 f8 25             	cmp    $0x25,%eax
 49b:	75 ce                	jne    46b <printf+0x1b>
        state = '%';
 49d:	89 c6                	mov    %eax,%esi
 49f:	eb db                	jmp    47c <printf+0x2c>
      if(c == 'd'){
 4a1:	83 f8 25             	cmp    $0x25,%eax
 4a4:	0f 84 cf 00 00 00    	je     579 <printf+0x129>
 4aa:	0f 8c dd 00 00 00    	jl     58d <printf+0x13d>
 4b0:	83 f8 78             	cmp    $0x78,%eax
 4b3:	0f 8f d4 00 00 00    	jg     58d <printf+0x13d>
 4b9:	83 f8 63             	cmp    $0x63,%eax
 4bc:	0f 8c cb 00 00 00    	jl     58d <printf+0x13d>
 4c2:	83 e8 63             	sub    $0x63,%eax
 4c5:	83 f8 15             	cmp    $0x15,%eax
 4c8:	0f 87 bf 00 00 00    	ja     58d <printf+0x13d>
 4ce:	ff 24 85 3c 07 00 00 	jmp    *0x73c(,%eax,4)
        printint(fd, *ap, 10, 1);
 4d5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d8:	8b 17                	mov    (%edi),%edx
 4da:	83 ec 0c             	sub    $0xc,%esp
 4dd:	6a 01                	push   $0x1
 4df:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4e4:	8b 45 08             	mov    0x8(%ebp),%eax
 4e7:	e8 d9 fe ff ff       	call   3c5 <printint>
        ap++;
 4ec:	83 c7 04             	add    $0x4,%edi
 4ef:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4f2:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 50c:	be 00 00 00 00       	mov    $0x0,%esi
 511:	eb 80                	jmp    493 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 513:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 516:	8b 17                	mov    (%edi),%edx
 518:	83 ec 0c             	sub    $0xc,%esp
 51b:	6a 00                	push   $0x0
 51d:	b9 10 00 00 00       	mov    $0x10,%ecx
 522:	8b 45 08             	mov    0x8(%ebp),%eax
 525:	e8 b2 fe ff ff       	call   3dc <printint>
        ap++;
 52a:	83 c7 04             	add    $0x4,%edi
 52d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 530:	83 c4 10             	add    $0x10,%esp
      state = 0;
 533:	be 00 00 00 00       	mov    $0x0,%esi
 538:	e9 56 ff ff ff       	jmp    493 <printf+0x2c>
        s = (char*)*ap;
 53d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 540:	8b 30                	mov    (%eax),%esi
        ap++;
 542:	83 c0 04             	add    $0x4,%eax
 545:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 548:	85 f6                	test   %esi,%esi
 54a:	75 15                	jne    561 <printf+0xfa>
          s = "(null)";
 54c:	be 47 07 00 00       	mov    $0x747,%esi
 551:	eb 0e                	jmp    561 <printf+0xfa>
          putc(fd, *s);
 553:	0f be d2             	movsbl %dl,%edx
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	e8 64 fe ff ff       	call   3c2 <putc>
          s++;
 55e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 561:	0f b6 16             	movzbl (%esi),%edx
 564:	84 d2                	test   %dl,%dl
 566:	75 eb                	jne    553 <printf+0xec>
      state = 0;
 568:	be 00 00 00 00       	mov    $0x0,%esi
 56d:	e9 21 ff ff ff       	jmp    493 <printf+0x2c>
        putc(fd, *ap);
 572:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 575:	0f be 17             	movsbl (%edi),%edx
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	e8 42 fe ff ff       	call   3c2 <putc>
        ap++;
 580:	83 c7 04             	add    $0x4,%edi
 583:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 586:	be 00 00 00 00       	mov    $0x0,%esi
 58b:	e9 03 ff ff ff       	jmp    493 <printf+0x2c>
        putc(fd, c);
 590:	89 fa                	mov    %edi,%edx
 592:	8b 45 08             	mov    0x8(%ebp),%eax
 595:	e8 28 fe ff ff       	call   3c2 <putc>
      state = 0;
 59a:	be 00 00 00 00       	mov    $0x0,%esi
 59f:	e9 ef fe ff ff       	jmp    493 <printf+0x2c>
        putc(fd, '%');
 5a4:	ba 25 00 00 00       	mov    $0x25,%edx
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	e8 11 fe ff ff       	call   3c2 <putc>
        putc(fd, c);
 5b1:	89 fa                	mov    %edi,%edx
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	e8 07 fe ff ff       	call   3c2 <putc>
      state = 0;
 5bb:	be 00 00 00 00       	mov    $0x0,%esi
 5c0:	e9 ce fe ff ff       	jmp    493 <printf+0x2c>
    }
  }
}
 5c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c8:	5b                   	pop    %ebx
 5c9:	5e                   	pop    %esi
 5ca:	5f                   	pop    %edi
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret    

000005cd <free>:
=======
 4f5:	be 00 00 00 00       	mov    $0x0,%esi
 4fa:	eb 80                	jmp    47c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ff:	8b 17                	mov    (%edi),%edx
 501:	83 ec 0c             	sub    $0xc,%esp
 504:	6a 00                	push   $0x0
 506:	b9 10 00 00 00       	mov    $0x10,%ecx
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	e8 b2 fe ff ff       	call   3c5 <printint>
        ap++;
 513:	83 c7 04             	add    $0x4,%edi
 516:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 519:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51c:	be 00 00 00 00       	mov    $0x0,%esi
 521:	e9 56 ff ff ff       	jmp    47c <printf+0x2c>
        s = (char*)*ap;
 526:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 529:	8b 30                	mov    (%eax),%esi
        ap++;
 52b:	83 c0 04             	add    $0x4,%eax
 52e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 531:	85 f6                	test   %esi,%esi
 533:	75 15                	jne    54a <printf+0xfa>
          s = "(null)";
 535:	be 33 07 00 00       	mov    $0x733,%esi
 53a:	eb 0e                	jmp    54a <printf+0xfa>
          putc(fd, *s);
 53c:	0f be d2             	movsbl %dl,%edx
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	e8 64 fe ff ff       	call   3ab <putc>
          s++;
 547:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 54a:	0f b6 16             	movzbl (%esi),%edx
 54d:	84 d2                	test   %dl,%dl
 54f:	75 eb                	jne    53c <printf+0xec>
      state = 0;
 551:	be 00 00 00 00       	mov    $0x0,%esi
 556:	e9 21 ff ff ff       	jmp    47c <printf+0x2c>
        putc(fd, *ap);
 55b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 55e:	0f be 17             	movsbl (%edi),%edx
 561:	8b 45 08             	mov    0x8(%ebp),%eax
 564:	e8 42 fe ff ff       	call   3ab <putc>
        ap++;
 569:	83 c7 04             	add    $0x4,%edi
 56c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 56f:	be 00 00 00 00       	mov    $0x0,%esi
 574:	e9 03 ff ff ff       	jmp    47c <printf+0x2c>
        putc(fd, c);
 579:	89 fa                	mov    %edi,%edx
 57b:	8b 45 08             	mov    0x8(%ebp),%eax
 57e:	e8 28 fe ff ff       	call   3ab <putc>
      state = 0;
 583:	be 00 00 00 00       	mov    $0x0,%esi
 588:	e9 ef fe ff ff       	jmp    47c <printf+0x2c>
        putc(fd, '%');
 58d:	ba 25 00 00 00       	mov    $0x25,%edx
 592:	8b 45 08             	mov    0x8(%ebp),%eax
 595:	e8 11 fe ff ff       	call   3ab <putc>
        putc(fd, c);
 59a:	89 fa                	mov    %edi,%edx
 59c:	8b 45 08             	mov    0x8(%ebp),%eax
 59f:	e8 07 fe ff ff       	call   3ab <putc>
      state = 0;
 5a4:	be 00 00 00 00       	mov    $0x0,%esi
 5a9:	e9 ce fe ff ff       	jmp    47c <printf+0x2c>
    }
  }
}
 5ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b1:	5b                   	pop    %ebx
 5b2:	5e                   	pop    %esi
 5b3:	5f                   	pop    %edi
 5b4:	5d                   	pop    %ebp
 5b5:	c3                   	ret    

000005b6 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 5cd:	55                   	push   %ebp
 5ce:	89 e5                	mov    %esp,%ebp
 5d0:	57                   	push   %edi
 5d1:	56                   	push   %esi
 5d2:	53                   	push   %ebx
 5d3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5d6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d9:	a1 40 0c 00 00       	mov    0xc40,%eax
 5de:	eb 02                	jmp    5e2 <free+0x15>
 5e0:	89 d0                	mov    %edx,%eax
 5e2:	39 c8                	cmp    %ecx,%eax
 5e4:	73 04                	jae    5ea <free+0x1d>
 5e6:	39 08                	cmp    %ecx,(%eax)
 5e8:	77 12                	ja     5fc <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ea:	8b 10                	mov    (%eax),%edx
 5ec:	39 c2                	cmp    %eax,%edx
 5ee:	77 f0                	ja     5e0 <free+0x13>
 5f0:	39 c8                	cmp    %ecx,%eax
 5f2:	72 08                	jb     5fc <free+0x2f>
 5f4:	39 ca                	cmp    %ecx,%edx
 5f6:	77 04                	ja     5fc <free+0x2f>
 5f8:	89 d0                	mov    %edx,%eax
 5fa:	eb e6                	jmp    5e2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5fc:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ff:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 602:	8b 10                	mov    (%eax),%edx
 604:	39 d7                	cmp    %edx,%edi
 606:	74 19                	je     621 <free+0x54>
=======
 5b6:	55                   	push   %ebp
 5b7:	89 e5                	mov    %esp,%ebp
 5b9:	57                   	push   %edi
 5ba:	56                   	push   %esi
 5bb:	53                   	push   %ebx
 5bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5bf:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c2:	a1 20 0e 00 00       	mov    0xe20,%eax
 5c7:	eb 02                	jmp    5cb <free+0x15>
 5c9:	89 d0                	mov    %edx,%eax
 5cb:	39 c8                	cmp    %ecx,%eax
 5cd:	73 04                	jae    5d3 <free+0x1d>
 5cf:	39 08                	cmp    %ecx,(%eax)
 5d1:	77 12                	ja     5e5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d3:	8b 10                	mov    (%eax),%edx
 5d5:	39 c2                	cmp    %eax,%edx
 5d7:	77 f0                	ja     5c9 <free+0x13>
 5d9:	39 c8                	cmp    %ecx,%eax
 5db:	72 08                	jb     5e5 <free+0x2f>
 5dd:	39 ca                	cmp    %ecx,%edx
 5df:	77 04                	ja     5e5 <free+0x2f>
 5e1:	89 d0                	mov    %edx,%eax
 5e3:	eb e6                	jmp    5cb <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5e8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5eb:	8b 10                	mov    (%eax),%edx
 5ed:	39 d7                	cmp    %edx,%edi
 5ef:	74 19                	je     60a <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 608:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 60b:	8b 50 04             	mov    0x4(%eax),%edx
 60e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 611:	39 ce                	cmp    %ecx,%esi
 613:	74 1b                	je     630 <free+0x63>
=======
 5f1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5f4:	8b 50 04             	mov    0x4(%eax),%edx
 5f7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5fa:	39 ce                	cmp    %ecx,%esi
 5fc:	74 1b                	je     619 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 615:	89 08                	mov    %ecx,(%eax)
  freep = p;
 617:	a3 40 0c 00 00       	mov    %eax,0xc40
}
 61c:	5b                   	pop    %ebx
 61d:	5e                   	pop    %esi
 61e:	5f                   	pop    %edi
 61f:	5d                   	pop    %ebp
 620:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 621:	03 72 04             	add    0x4(%edx),%esi
 624:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 627:	8b 10                	mov    (%eax),%edx
 629:	8b 12                	mov    (%edx),%edx
 62b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 62e:	eb db                	jmp    60b <free+0x3e>
    p->s.size += bp->s.size;
 630:	03 53 fc             	add    -0x4(%ebx),%edx
 633:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 636:	8b 53 f8             	mov    -0x8(%ebx),%edx
 639:	89 10                	mov    %edx,(%eax)
 63b:	eb da                	jmp    617 <free+0x4a>

0000063d <morecore>:
=======
 5fe:	89 08                	mov    %ecx,(%eax)
  freep = p;
 600:	a3 20 0e 00 00       	mov    %eax,0xe20
}
 605:	5b                   	pop    %ebx
 606:	5e                   	pop    %esi
 607:	5f                   	pop    %edi
 608:	5d                   	pop    %ebp
 609:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 60a:	03 72 04             	add    0x4(%edx),%esi
 60d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 610:	8b 10                	mov    (%eax),%edx
 612:	8b 12                	mov    (%edx),%edx
 614:	89 53 f8             	mov    %edx,-0x8(%ebx)
 617:	eb db                	jmp    5f4 <free+0x3e>
    p->s.size += bp->s.size;
 619:	03 53 fc             	add    -0x4(%ebx),%edx
 61c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 61f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 622:	89 10                	mov    %edx,(%eax)
 624:	eb da                	jmp    600 <free+0x4a>

00000626 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 63d:	55                   	push   %ebp
 63e:	89 e5                	mov    %esp,%ebp
 640:	53                   	push   %ebx
 641:	83 ec 04             	sub    $0x4,%esp
 644:	89 c3                	mov    %eax,%ebx
=======
 626:	55                   	push   %ebp
 627:	89 e5                	mov    %esp,%ebp
 629:	53                   	push   %ebx
 62a:	83 ec 04             	sub    $0x4,%esp
 62d:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 646:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 64b:	77 05                	ja     652 <morecore+0x15>
    nu = 4096;
 64d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 652:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 659:	83 ec 0c             	sub    $0xc,%esp
 65c:	50                   	push   %eax
 65d:	e8 38 fd ff ff       	call   39a <sbrk>
  if(p == (char*)-1)
 662:	83 c4 10             	add    $0x10,%esp
 665:	83 f8 ff             	cmp    $0xffffffff,%eax
 668:	74 1c                	je     686 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 66a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 66d:	83 c0 08             	add    $0x8,%eax
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	50                   	push   %eax
 674:	e8 54 ff ff ff       	call   5cd <free>
  return freep;
 679:	a1 40 0c 00 00       	mov    0xc40,%eax
 67e:	83 c4 10             	add    $0x10,%esp
}
 681:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 684:	c9                   	leave  
 685:	c3                   	ret    
    return 0;
 686:	b8 00 00 00 00       	mov    $0x0,%eax
 68b:	eb f4                	jmp    681 <morecore+0x44>

0000068d <malloc>:
=======
 62f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 634:	77 05                	ja     63b <morecore+0x15>
    nu = 4096;
 636:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 63b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 642:	83 ec 0c             	sub    $0xc,%esp
 645:	50                   	push   %eax
 646:	e8 38 fd ff ff       	call   383 <sbrk>
  if(p == (char*)-1)
 64b:	83 c4 10             	add    $0x10,%esp
 64e:	83 f8 ff             	cmp    $0xffffffff,%eax
 651:	74 1c                	je     66f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 653:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 656:	83 c0 08             	add    $0x8,%eax
 659:	83 ec 0c             	sub    $0xc,%esp
 65c:	50                   	push   %eax
 65d:	e8 54 ff ff ff       	call   5b6 <free>
  return freep;
 662:	a1 20 0e 00 00       	mov    0xe20,%eax
 667:	83 c4 10             	add    $0x10,%esp
}
 66a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 66d:	c9                   	leave  
 66e:	c3                   	ret    
    return 0;
 66f:	b8 00 00 00 00       	mov    $0x0,%eax
 674:	eb f4                	jmp    66a <morecore+0x44>

00000676 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 68d:	55                   	push   %ebp
 68e:	89 e5                	mov    %esp,%ebp
 690:	53                   	push   %ebx
 691:	83 ec 04             	sub    $0x4,%esp
=======
 676:	55                   	push   %ebp
 677:	89 e5                	mov    %esp,%ebp
 679:	53                   	push   %ebx
 67a:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	8d 58 07             	lea    0x7(%eax),%ebx
 69a:	c1 eb 03             	shr    $0x3,%ebx
 69d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6a0:	8b 0d 40 0c 00 00    	mov    0xc40,%ecx
 6a6:	85 c9                	test   %ecx,%ecx
 6a8:	74 04                	je     6ae <malloc+0x21>
=======
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	8d 58 07             	lea    0x7(%eax),%ebx
 683:	c1 eb 03             	shr    $0x3,%ebx
 686:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 689:	8b 0d 20 0e 00 00    	mov    0xe20,%ecx
 68f:	85 c9                	test   %ecx,%ecx
 691:	74 04                	je     697 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 6aa:	8b 01                	mov    (%ecx),%eax
 6ac:	eb 4a                	jmp    6f8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6ae:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 6b5:	0c 00 00 
 6b8:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 6bf:	0c 00 00 
    base.s.size = 0;
 6c2:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 6c9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6cc:	b9 44 0c 00 00       	mov    $0xc44,%ecx
 6d1:	eb d7                	jmp    6aa <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6d3:	74 19                	je     6ee <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6d5:	29 da                	sub    %ebx,%edx
 6d7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6da:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6dd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6e0:	89 0d 40 0c 00 00    	mov    %ecx,0xc40
      return (void*)(p + 1);
 6e6:	83 c0 08             	add    $0x8,%eax
=======
 693:	8b 01                	mov    (%ecx),%eax
 695:	eb 4a                	jmp    6e1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 697:	c7 05 20 0e 00 00 24 	movl   $0xe24,0xe20
 69e:	0e 00 00 
 6a1:	c7 05 24 0e 00 00 24 	movl   $0xe24,0xe24
 6a8:	0e 00 00 
    base.s.size = 0;
 6ab:	c7 05 28 0e 00 00 00 	movl   $0x0,0xe28
 6b2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6b5:	b9 24 0e 00 00       	mov    $0xe24,%ecx
 6ba:	eb d7                	jmp    693 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6bc:	74 19                	je     6d7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6be:	29 da                	sub    %ebx,%edx
 6c0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6c3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6c6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6c9:	89 0d 20 0e 00 00    	mov    %ecx,0xe20
      return (void*)(p + 1);
 6cf:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 6e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ec:	c9                   	leave  
 6ed:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6ee:	8b 10                	mov    (%eax),%edx
 6f0:	89 11                	mov    %edx,(%ecx)
 6f2:	eb ec                	jmp    6e0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f4:	89 c1                	mov    %eax,%ecx
 6f6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6f8:	8b 50 04             	mov    0x4(%eax),%edx
 6fb:	39 da                	cmp    %ebx,%edx
 6fd:	73 d4                	jae    6d3 <malloc+0x46>
    if(p == freep)
 6ff:	39 05 40 0c 00 00    	cmp    %eax,0xc40
 705:	75 ed                	jne    6f4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 707:	89 d8                	mov    %ebx,%eax
 709:	e8 2f ff ff ff       	call   63d <morecore>
 70e:	85 c0                	test   %eax,%eax
 710:	75 e2                	jne    6f4 <malloc+0x67>
 712:	eb d5                	jmp    6e9 <malloc+0x5c>
=======
 6d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d5:	c9                   	leave  
 6d6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6d7:	8b 10                	mov    (%eax),%edx
 6d9:	89 11                	mov    %edx,(%ecx)
 6db:	eb ec                	jmp    6c9 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6dd:	89 c1                	mov    %eax,%ecx
 6df:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6e1:	8b 50 04             	mov    0x4(%eax),%edx
 6e4:	39 da                	cmp    %ebx,%edx
 6e6:	73 d4                	jae    6bc <malloc+0x46>
    if(p == freep)
 6e8:	39 05 20 0e 00 00    	cmp    %eax,0xe20
 6ee:	75 ed                	jne    6dd <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6f0:	89 d8                	mov    %ebx,%eax
 6f2:	e8 2f ff ff ff       	call   626 <morecore>
 6f7:	85 c0                	test   %eax,%eax
 6f9:	75 e2                	jne    6dd <malloc+0x67>
 6fb:	eb d5                	jmp    6d2 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
