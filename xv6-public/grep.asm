
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	8b 75 08             	mov    0x8(%ebp),%esi
   c:	8b 7d 0c             	mov    0xc(%ebp),%edi
   f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  12:	83 ec 08             	sub    $0x8,%esp
  15:	53                   	push   %ebx
  16:	57                   	push   %edi
  17:	e8 2c 00 00 00       	call   48 <matchhere>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	85 c0                	test   %eax,%eax
  21:	75 18                	jne    3b <matchstar+0x3b>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  23:	0f b6 13             	movzbl (%ebx),%edx
  26:	84 d2                	test   %dl,%dl
  28:	74 16                	je     40 <matchstar+0x40>
  2a:	83 c3 01             	add    $0x1,%ebx
  2d:	0f be d2             	movsbl %dl,%edx
  30:	39 f2                	cmp    %esi,%edx
  32:	74 de                	je     12 <matchstar+0x12>
  34:	83 fe 2e             	cmp    $0x2e,%esi
  37:	74 d9                	je     12 <matchstar+0x12>
  39:	eb 05                	jmp    40 <matchstar+0x40>
      return 1;
  3b:	b8 01 00 00 00       	mov    $0x1,%eax
  return 0;
}
  40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  43:	5b                   	pop    %ebx
  44:	5e                   	pop    %esi
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <matchhere>:
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	8b 55 08             	mov    0x8(%ebp),%edx
  if(re[0] == '\0')
  51:	0f b6 02             	movzbl (%edx),%eax
  54:	84 c0                	test   %al,%al
  56:	74 68                	je     c0 <matchhere+0x78>
  if(re[1] == '*')
  58:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
  5c:	80 f9 2a             	cmp    $0x2a,%cl
  5f:	74 1d                	je     7e <matchhere+0x36>
  if(re[0] == '$' && re[1] == '\0')
  61:	3c 24                	cmp    $0x24,%al
  63:	74 31                	je     96 <matchhere+0x4e>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  65:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  68:	0f b6 09             	movzbl (%ecx),%ecx
  6b:	84 c9                	test   %cl,%cl
  6d:	74 58                	je     c7 <matchhere+0x7f>
  6f:	3c 2e                	cmp    $0x2e,%al
  71:	74 35                	je     a8 <matchhere+0x60>
  73:	38 c8                	cmp    %cl,%al
  75:	74 31                	je     a8 <matchhere+0x60>
  return 0;
  77:	b8 00 00 00 00       	mov    $0x0,%eax
  7c:	eb 47                	jmp    c5 <matchhere+0x7d>
    return matchstar(re[0], re+2, text);
  7e:	83 ec 04             	sub    $0x4,%esp
  81:	ff 75 0c             	push   0xc(%ebp)
  84:	83 c2 02             	add    $0x2,%edx
  87:	52                   	push   %edx
  88:	0f be c0             	movsbl %al,%eax
  8b:	50                   	push   %eax
  8c:	e8 6f ff ff ff       	call   0 <matchstar>
  91:	83 c4 10             	add    $0x10,%esp
  94:	eb 2f                	jmp    c5 <matchhere+0x7d>
  if(re[0] == '$' && re[1] == '\0')
  96:	84 c9                	test   %cl,%cl
  98:	75 cb                	jne    65 <matchhere+0x1d>
    return *text == '\0';
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	80 38 00             	cmpb   $0x0,(%eax)
  a0:	0f 94 c0             	sete   %al
  a3:	0f b6 c0             	movzbl %al,%eax
  a6:	eb 1d                	jmp    c5 <matchhere+0x7d>
    return matchhere(re+1, text+1);
  a8:	83 ec 08             	sub    $0x8,%esp
  ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  ae:	83 c0 01             	add    $0x1,%eax
  b1:	50                   	push   %eax
  b2:	83 c2 01             	add    $0x1,%edx
  b5:	52                   	push   %edx
  b6:	e8 8d ff ff ff       	call   48 <matchhere>
  bb:	83 c4 10             	add    $0x10,%esp
  be:	eb 05                	jmp    c5 <matchhere+0x7d>
    return 1;
  c0:	b8 01 00 00 00       	mov    $0x1,%eax
}
  c5:	c9                   	leave  
  c6:	c3                   	ret    
  return 0;
  c7:	b8 00 00 00 00       	mov    $0x0,%eax
  cc:	eb f7                	jmp    c5 <matchhere+0x7d>

000000ce <match>:
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	56                   	push   %esi
  d2:	53                   	push   %ebx
  d3:	8b 75 08             	mov    0x8(%ebp),%esi
  d6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
  d9:	80 3e 5e             	cmpb   $0x5e,(%esi)
  dc:	75 14                	jne    f2 <match+0x24>
    return matchhere(re+1, text);
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	53                   	push   %ebx
  e2:	83 c6 01             	add    $0x1,%esi
  e5:	56                   	push   %esi
  e6:	e8 5d ff ff ff       	call   48 <matchhere>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	eb 22                	jmp    112 <match+0x44>
  }while(*text++ != '\0');
  f0:	89 d3                	mov    %edx,%ebx
    if(matchhere(re, text))
  f2:	83 ec 08             	sub    $0x8,%esp
  f5:	53                   	push   %ebx
  f6:	56                   	push   %esi
  f7:	e8 4c ff ff ff       	call   48 <matchhere>
  fc:	83 c4 10             	add    $0x10,%esp
  ff:	85 c0                	test   %eax,%eax
 101:	75 0a                	jne    10d <match+0x3f>
  }while(*text++ != '\0');
 103:	8d 53 01             	lea    0x1(%ebx),%edx
 106:	80 3b 00             	cmpb   $0x0,(%ebx)
 109:	75 e5                	jne    f0 <match+0x22>
 10b:	eb 05                	jmp    112 <match+0x44>
      return 1;
 10d:	b8 01 00 00 00       	mov    $0x1,%eax
}
 112:	8d 65 f8             	lea    -0x8(%ebp),%esp
 115:	5b                   	pop    %ebx
 116:	5e                   	pop    %esi
 117:	5d                   	pop    %ebp
 118:	c3                   	ret    

00000119 <grep>:
{
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	57                   	push   %edi
 11d:	56                   	push   %esi
 11e:	53                   	push   %ebx
 11f:	83 ec 1c             	sub    $0x1c,%esp
 122:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 125:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 12c:	eb 53                	jmp    181 <grep+0x68>
      p = q+1;
 12e:	8d 73 01             	lea    0x1(%ebx),%esi
    while((q = strchr(p, '\n')) != 0){
 131:	83 ec 08             	sub    $0x8,%esp
 134:	6a 0a                	push   $0xa
 136:	56                   	push   %esi
 137:	e8 73 02 00 00       	call   3af <strchr>
 13c:	89 c3                	mov    %eax,%ebx
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	74 2d                	je     172 <grep+0x59>
      *q = 0;
 145:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 148:	83 ec 08             	sub    $0x8,%esp
 14b:	56                   	push   %esi
 14c:	57                   	push   %edi
 14d:	e8 7c ff ff ff       	call   ce <match>
 152:	83 c4 10             	add    $0x10,%esp
 155:	85 c0                	test   %eax,%eax
 157:	74 d5                	je     12e <grep+0x15>
        *q = '\n';
 159:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 15c:	8d 43 01             	lea    0x1(%ebx),%eax
 15f:	83 ec 04             	sub    $0x4,%esp
 162:	29 f0                	sub    %esi,%eax
 164:	50                   	push   %eax
 165:	56                   	push   %esi
 166:	6a 01                	push   $0x1
 168:	e8 84 03 00 00       	call   4f1 <write>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	eb bc                	jmp    12e <grep+0x15>
    if(p == buf)
 172:	81 fe a0 0d 00 00    	cmp    $0xda0,%esi
 178:	74 62                	je     1dc <grep+0xc3>
    if(m > 0){
 17a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 17d:	85 c9                	test   %ecx,%ecx
 17f:	7f 3b                	jg     1bc <grep+0xa3>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 181:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 186:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 189:	29 c8                	sub    %ecx,%eax
 18b:	83 ec 04             	sub    $0x4,%esp
 18e:	50                   	push   %eax
 18f:	8d 81 a0 0d 00 00    	lea    0xda0(%ecx),%eax
 195:	50                   	push   %eax
 196:	ff 75 0c             	push   0xc(%ebp)
 199:	e8 4b 03 00 00       	call   4e9 <read>
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	85 c0                	test   %eax,%eax
 1a3:	7e 40                	jle    1e5 <grep+0xcc>
    m += n;
 1a5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1ab:	c6 82 a0 0d 00 00 00 	movb   $0x0,0xda0(%edx)
    p = buf;
 1b2:	be a0 0d 00 00       	mov    $0xda0,%esi
    while((q = strchr(p, '\n')) != 0){
 1b7:	e9 75 ff ff ff       	jmp    131 <grep+0x18>
      m -= p - buf;
 1bc:	89 f0                	mov    %esi,%eax
 1be:	2d a0 0d 00 00       	sub    $0xda0,%eax
 1c3:	29 c1                	sub    %eax,%ecx
 1c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1c8:	83 ec 04             	sub    $0x4,%esp
 1cb:	51                   	push   %ecx
 1cc:	56                   	push   %esi
 1cd:	68 a0 0d 00 00       	push   $0xda0
 1d2:	e8 c6 02 00 00       	call   49d <memmove>
 1d7:	83 c4 10             	add    $0x10,%esp
 1da:	eb a5                	jmp    181 <grep+0x68>
      m = 0;
 1dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1e3:	eb 9c                	jmp    181 <grep+0x68>
}
 1e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e8:	5b                   	pop    %ebx
 1e9:	5e                   	pop    %esi
 1ea:	5f                   	pop    %edi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    

000001ed <main>:
{
 1ed:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 1f1:	83 e4 f0             	and    $0xfffffff0,%esp
 1f4:	ff 71 fc             	push   -0x4(%ecx)
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	57                   	push   %edi
 1fb:	56                   	push   %esi
 1fc:	53                   	push   %ebx
 1fd:	51                   	push   %ecx
 1fe:	83 ec 18             	sub    $0x18,%esp
 201:	8b 01                	mov    (%ecx),%eax
 203:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 206:	8b 51 04             	mov    0x4(%ecx),%edx
 209:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(argc <= 1){
 20c:	83 f8 01             	cmp    $0x1,%eax
 20f:	7e 50                	jle    261 <main+0x74>
  pattern = argv[1];
 211:	8b 45 e0             	mov    -0x20(%ebp),%eax
 214:	8b 40 04             	mov    0x4(%eax),%eax
 217:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(argc <= 2){
 21a:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 21e:	7e 55                	jle    275 <main+0x88>
  for(i = 2; i < argc; i++){
 220:	be 02 00 00 00       	mov    $0x2,%esi
 225:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 228:	7d 71                	jge    29b <main+0xae>
    if((fd = open(argv[i], 0)) < 0){
 22a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22d:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 00                	push   $0x0
 235:	ff 37                	push   (%edi)
 237:	e8 d5 02 00 00       	call   511 <open>
 23c:	89 c3                	mov    %eax,%ebx
 23e:	83 c4 10             	add    $0x10,%esp
 241:	85 c0                	test   %eax,%eax
 243:	78 40                	js     285 <main+0x98>
    grep(pattern, fd);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	50                   	push   %eax
 249:	ff 75 dc             	push   -0x24(%ebp)
 24c:	e8 c8 fe ff ff       	call   119 <grep>
    close(fd);
 251:	89 1c 24             	mov    %ebx,(%esp)
 254:	e8 a0 02 00 00       	call   4f9 <close>
  for(i = 2; i < argc; i++){
 259:	83 c6 01             	add    $0x1,%esi
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	eb c4                	jmp    225 <main+0x38>
    printf(2, "usage: grep pattern [file ...]\n");
 261:	83 ec 08             	sub    $0x8,%esp
 264:	68 d4 08 00 00       	push   $0x8d4
 269:	6a 02                	push   $0x2
 26b:	e8 b6 03 00 00       	call   626 <printf>
    exit();
 270:	e8 5c 02 00 00       	call   4d1 <exit>
    grep(pattern, 0);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	50                   	push   %eax
 27b:	e8 99 fe ff ff       	call   119 <grep>
    exit();
 280:	e8 4c 02 00 00       	call   4d1 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 285:	83 ec 04             	sub    $0x4,%esp
 288:	ff 37                	push   (%edi)
 28a:	68 f4 08 00 00       	push   $0x8f4
 28f:	6a 01                	push   $0x1
 291:	e8 90 03 00 00       	call   626 <printf>
      exit();
 296:	e8 36 02 00 00       	call   4d1 <exit>
  exit();
 29b:	e8 31 02 00 00       	call   4d1 <exit>

000002a0 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2a6:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ab:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2ad:	89 d0                	mov    %edx,%eax
 2af:	5d                   	pop    %ebp
 2b0:	c3                   	ret    

000002b1 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2b1:	55                   	push   %ebp
 2b2:	89 e5                	mov    %esp,%ebp
 2b4:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2b7:	68 00 20 00 00       	push   $0x2000
 2bc:	e8 8b 05 00 00       	call   84c <malloc>
  if(n_stack == 0){
 2c1:	83 c4 10             	add    $0x10,%esp
 2c4:	85 c0                	test   %eax,%eax
 2c6:	74 14                	je     2dc <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2c8:	50                   	push   %eax
 2c9:	ff 75 10             	push   0x10(%ebp)
 2cc:	ff 75 0c             	push   0xc(%ebp)
 2cf:	ff 75 08             	push   0x8(%ebp)
 2d2:	e8 9a 02 00 00       	call   571 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 2d7:	83 c4 10             	add    $0x10,%esp
}
 2da:	c9                   	leave  
 2db:	c3                   	ret    
    return -1;
 2dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e1:	eb f7                	jmp    2da <thread_create+0x29>

000002e3 <thread_join>:

int thread_join() {
 2e3:	55                   	push   %ebp
 2e4:	89 e5                	mov    %esp,%ebp
 2e6:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2e9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2ec:	50                   	push   %eax
 2ed:	e8 87 02 00 00       	call   579 <join>
  
  return pid;
}
 2f2:	c9                   	leave  
 2f3:	c3                   	ret    

000002f4 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	53                   	push   %ebx
 2f8:	83 ec 04             	sub    $0x4,%esp
 2fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2fe:	83 ec 08             	sub    $0x8,%esp
 301:	6a 01                	push   $0x1
 303:	53                   	push   %ebx
 304:	e8 97 ff ff ff       	call   2a0 <test_and_set>
 309:	83 c4 10             	add    $0x10,%esp
 30c:	83 f8 01             	cmp    $0x1,%eax
 30f:	74 ed                	je     2fe <lock_acquire+0xa>
    ;
}
 311:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 314:	c9                   	leave  
 315:	c3                   	ret    

00000316 <lock_release>:

void lock_release(lock_t *lock) {
 316:	55                   	push   %ebp
 317:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 322:	5d                   	pop    %ebp
 323:	c3                   	ret    

00000324 <lock_init>:

void lock_init(lock_t *lock) {
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 330:	5d                   	pop    %ebp
 331:	c3                   	ret    

00000332 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	56                   	push   %esi
 336:	53                   	push   %ebx
 337:	8b 75 08             	mov    0x8(%ebp),%esi
 33a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 33d:	89 f0                	mov    %esi,%eax
 33f:	89 d1                	mov    %edx,%ecx
 341:	83 c2 01             	add    $0x1,%edx
 344:	89 c3                	mov    %eax,%ebx
 346:	83 c0 01             	add    $0x1,%eax
 349:	0f b6 09             	movzbl (%ecx),%ecx
 34c:	88 0b                	mov    %cl,(%ebx)
 34e:	84 c9                	test   %cl,%cl
 350:	75 ed                	jne    33f <strcpy+0xd>
    ;
  return os;
}
 352:	89 f0                	mov    %esi,%eax
 354:	5b                   	pop    %ebx
 355:	5e                   	pop    %esi
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    

00000358 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
 35b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 35e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 361:	eb 06                	jmp    369 <strcmp+0x11>
    p++, q++;
 363:	83 c1 01             	add    $0x1,%ecx
 366:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 369:	0f b6 01             	movzbl (%ecx),%eax
 36c:	84 c0                	test   %al,%al
 36e:	74 04                	je     374 <strcmp+0x1c>
 370:	3a 02                	cmp    (%edx),%al
 372:	74 ef                	je     363 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 374:	0f b6 c0             	movzbl %al,%eax
 377:	0f b6 12             	movzbl (%edx),%edx
 37a:	29 d0                	sub    %edx,%eax
}
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    

0000037e <strlen>:

uint
strlen(const char *s)
{
 37e:	55                   	push   %ebp
 37f:	89 e5                	mov    %esp,%ebp
 381:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 384:	b8 00 00 00 00       	mov    $0x0,%eax
 389:	eb 03                	jmp    38e <strlen+0x10>
 38b:	83 c0 01             	add    $0x1,%eax
 38e:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 392:	75 f7                	jne    38b <strlen+0xd>
    ;
  return n;
}
 394:	5d                   	pop    %ebp
 395:	c3                   	ret    

00000396 <memset>:

void*
memset(void *dst, int c, uint n)
{
 396:	55                   	push   %ebp
 397:	89 e5                	mov    %esp,%ebp
 399:	57                   	push   %edi
 39a:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 39d:	89 d7                	mov    %edx,%edi
 39f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a5:	fc                   	cld    
 3a6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3a8:	89 d0                	mov    %edx,%eax
 3aa:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <strchr>:

char*
strchr(const char *s, char c)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	8b 45 08             	mov    0x8(%ebp),%eax
 3b5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3b9:	eb 03                	jmp    3be <strchr+0xf>
 3bb:	83 c0 01             	add    $0x1,%eax
 3be:	0f b6 10             	movzbl (%eax),%edx
 3c1:	84 d2                	test   %dl,%dl
 3c3:	74 06                	je     3cb <strchr+0x1c>
    if(*s == c)
 3c5:	38 ca                	cmp    %cl,%dl
 3c7:	75 f2                	jne    3bb <strchr+0xc>
 3c9:	eb 05                	jmp    3d0 <strchr+0x21>
      return (char*)s;
  return 0;
 3cb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3d0:	5d                   	pop    %ebp
 3d1:	c3                   	ret    

000003d2 <gets>:

char*
gets(char *buf, int max)
{
 3d2:	55                   	push   %ebp
 3d3:	89 e5                	mov    %esp,%ebp
 3d5:	57                   	push   %edi
 3d6:	56                   	push   %esi
 3d7:	53                   	push   %ebx
 3d8:	83 ec 1c             	sub    $0x1c,%esp
 3db:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3de:	bb 00 00 00 00       	mov    $0x0,%ebx
 3e3:	89 de                	mov    %ebx,%esi
 3e5:	83 c3 01             	add    $0x1,%ebx
 3e8:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3eb:	7d 2e                	jge    41b <gets+0x49>
    cc = read(0, &c, 1);
 3ed:	83 ec 04             	sub    $0x4,%esp
 3f0:	6a 01                	push   $0x1
 3f2:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f5:	50                   	push   %eax
 3f6:	6a 00                	push   $0x0
 3f8:	e8 ec 00 00 00       	call   4e9 <read>
    if(cc < 1)
 3fd:	83 c4 10             	add    $0x10,%esp
 400:	85 c0                	test   %eax,%eax
 402:	7e 17                	jle    41b <gets+0x49>
      break;
    buf[i++] = c;
 404:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 408:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 40b:	3c 0a                	cmp    $0xa,%al
 40d:	0f 94 c2             	sete   %dl
 410:	3c 0d                	cmp    $0xd,%al
 412:	0f 94 c0             	sete   %al
 415:	08 c2                	or     %al,%dl
 417:	74 ca                	je     3e3 <gets+0x11>
    buf[i++] = c;
 419:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 41b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 41f:	89 f8                	mov    %edi,%eax
 421:	8d 65 f4             	lea    -0xc(%ebp),%esp
 424:	5b                   	pop    %ebx
 425:	5e                   	pop    %esi
 426:	5f                   	pop    %edi
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    

00000429 <stat>:

int
stat(const char *n, struct stat *st)
{
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
 42c:	56                   	push   %esi
 42d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 42e:	83 ec 08             	sub    $0x8,%esp
 431:	6a 00                	push   $0x0
 433:	ff 75 08             	push   0x8(%ebp)
 436:	e8 d6 00 00 00       	call   511 <open>
  if(fd < 0)
 43b:	83 c4 10             	add    $0x10,%esp
 43e:	85 c0                	test   %eax,%eax
 440:	78 24                	js     466 <stat+0x3d>
 442:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 444:	83 ec 08             	sub    $0x8,%esp
 447:	ff 75 0c             	push   0xc(%ebp)
 44a:	50                   	push   %eax
 44b:	e8 d9 00 00 00       	call   529 <fstat>
 450:	89 c6                	mov    %eax,%esi
  close(fd);
 452:	89 1c 24             	mov    %ebx,(%esp)
 455:	e8 9f 00 00 00       	call   4f9 <close>
  return r;
 45a:	83 c4 10             	add    $0x10,%esp
}
 45d:	89 f0                	mov    %esi,%eax
 45f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 462:	5b                   	pop    %ebx
 463:	5e                   	pop    %esi
 464:	5d                   	pop    %ebp
 465:	c3                   	ret    
    return -1;
 466:	be ff ff ff ff       	mov    $0xffffffff,%esi
 46b:	eb f0                	jmp    45d <stat+0x34>

0000046d <atoi>:

int
atoi(const char *s)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	53                   	push   %ebx
 471:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 474:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 479:	eb 10                	jmp    48b <atoi+0x1e>
    n = n*10 + *s++ - '0';
 47b:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 47e:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 481:	83 c1 01             	add    $0x1,%ecx
 484:	0f be c0             	movsbl %al,%eax
 487:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 48b:	0f b6 01             	movzbl (%ecx),%eax
 48e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 491:	80 fb 09             	cmp    $0x9,%bl
 494:	76 e5                	jbe    47b <atoi+0xe>
  return n;
}
 496:	89 d0                	mov    %edx,%eax
 498:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49b:	c9                   	leave  
 49c:	c3                   	ret    

0000049d <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 49d:	55                   	push   %ebp
 49e:	89 e5                	mov    %esp,%ebp
 4a0:	56                   	push   %esi
 4a1:	53                   	push   %ebx
 4a2:	8b 75 08             	mov    0x8(%ebp),%esi
 4a5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4a8:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4ab:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4ad:	eb 0d                	jmp    4bc <memmove+0x1f>
    *dst++ = *src++;
 4af:	0f b6 01             	movzbl (%ecx),%eax
 4b2:	88 02                	mov    %al,(%edx)
 4b4:	8d 49 01             	lea    0x1(%ecx),%ecx
 4b7:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4ba:	89 d8                	mov    %ebx,%eax
 4bc:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4bf:	85 c0                	test   %eax,%eax
 4c1:	7f ec                	jg     4af <memmove+0x12>
  return vdst;
}
 4c3:	89 f0                	mov    %esi,%eax
 4c5:	5b                   	pop    %ebx
 4c6:	5e                   	pop    %esi
 4c7:	5d                   	pop    %ebp
 4c8:	c3                   	ret    

000004c9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4c9:	b8 01 00 00 00       	mov    $0x1,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <exit>:
SYSCALL(exit)
 4d1:	b8 02 00 00 00       	mov    $0x2,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <wait>:
SYSCALL(wait)
 4d9:	b8 03 00 00 00       	mov    $0x3,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <pipe>:
SYSCALL(pipe)
 4e1:	b8 04 00 00 00       	mov    $0x4,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <read>:
SYSCALL(read)
 4e9:	b8 05 00 00 00       	mov    $0x5,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <write>:
SYSCALL(write)
 4f1:	b8 10 00 00 00       	mov    $0x10,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <close>:
SYSCALL(close)
 4f9:	b8 15 00 00 00       	mov    $0x15,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <kill>:
SYSCALL(kill)
 501:	b8 06 00 00 00       	mov    $0x6,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <exec>:
SYSCALL(exec)
 509:	b8 07 00 00 00       	mov    $0x7,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <open>:
SYSCALL(open)
 511:	b8 0f 00 00 00       	mov    $0xf,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <mknod>:
SYSCALL(mknod)
 519:	b8 11 00 00 00       	mov    $0x11,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <unlink>:
SYSCALL(unlink)
 521:	b8 12 00 00 00       	mov    $0x12,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <fstat>:
SYSCALL(fstat)
 529:	b8 08 00 00 00       	mov    $0x8,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <link>:
SYSCALL(link)
 531:	b8 13 00 00 00       	mov    $0x13,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <mkdir>:
SYSCALL(mkdir)
 539:	b8 14 00 00 00       	mov    $0x14,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <chdir>:
SYSCALL(chdir)
 541:	b8 09 00 00 00       	mov    $0x9,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    

00000549 <dup>:
SYSCALL(dup)
 549:	b8 0a 00 00 00       	mov    $0xa,%eax
 54e:	cd 40                	int    $0x40
 550:	c3                   	ret    

00000551 <getpid>:
SYSCALL(getpid)
 551:	b8 0b 00 00 00       	mov    $0xb,%eax
 556:	cd 40                	int    $0x40
 558:	c3                   	ret    

00000559 <sbrk>:
SYSCALL(sbrk)
 559:	b8 0c 00 00 00       	mov    $0xc,%eax
 55e:	cd 40                	int    $0x40
 560:	c3                   	ret    

00000561 <sleep>:
SYSCALL(sleep)
 561:	b8 0d 00 00 00       	mov    $0xd,%eax
 566:	cd 40                	int    $0x40
 568:	c3                   	ret    

00000569 <uptime>:
SYSCALL(uptime)
 569:	b8 0e 00 00 00       	mov    $0xe,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <clone>:
SYSCALL(clone)
 571:	b8 16 00 00 00       	mov    $0x16,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <join>:
 579:	b8 17 00 00 00       	mov    $0x17,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 581:	55                   	push   %ebp
 582:	89 e5                	mov    %esp,%ebp
 584:	83 ec 1c             	sub    $0x1c,%esp
 587:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 58a:	6a 01                	push   $0x1
 58c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 58f:	52                   	push   %edx
 590:	50                   	push   %eax
 591:	e8 5b ff ff ff       	call   4f1 <write>
}
 596:	83 c4 10             	add    $0x10,%esp
 599:	c9                   	leave  
 59a:	c3                   	ret    

0000059b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 59b:	55                   	push   %ebp
 59c:	89 e5                	mov    %esp,%ebp
 59e:	57                   	push   %edi
 59f:	56                   	push   %esi
 5a0:	53                   	push   %ebx
 5a1:	83 ec 2c             	sub    $0x2c,%esp
 5a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a7:	89 d0                	mov    %edx,%eax
 5a9:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ab:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5af:	0f 95 c1             	setne  %cl
 5b2:	c1 ea 1f             	shr    $0x1f,%edx
 5b5:	84 d1                	test   %dl,%cl
 5b7:	74 44                	je     5fd <printint+0x62>
    neg = 1;
    x = -xx;
 5b9:	f7 d8                	neg    %eax
 5bb:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5bd:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5c4:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5c9:	89 c8                	mov    %ecx,%eax
 5cb:	ba 00 00 00 00       	mov    $0x0,%edx
 5d0:	f7 f6                	div    %esi
 5d2:	89 df                	mov    %ebx,%edi
 5d4:	83 c3 01             	add    $0x1,%ebx
 5d7:	0f b6 92 6c 09 00 00 	movzbl 0x96c(%edx),%edx
 5de:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5e2:	89 ca                	mov    %ecx,%edx
 5e4:	89 c1                	mov    %eax,%ecx
 5e6:	39 d6                	cmp    %edx,%esi
 5e8:	76 df                	jbe    5c9 <printint+0x2e>
  if(neg)
 5ea:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5ee:	74 31                	je     621 <printint+0x86>
    buf[i++] = '-';
 5f0:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5f5:	8d 5f 02             	lea    0x2(%edi),%ebx
 5f8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5fb:	eb 17                	jmp    614 <printint+0x79>
    x = xx;
 5fd:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5ff:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 606:	eb bc                	jmp    5c4 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 608:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 60d:	89 f0                	mov    %esi,%eax
 60f:	e8 6d ff ff ff       	call   581 <putc>
  while(--i >= 0)
 614:	83 eb 01             	sub    $0x1,%ebx
 617:	79 ef                	jns    608 <printint+0x6d>
}
 619:	83 c4 2c             	add    $0x2c,%esp
 61c:	5b                   	pop    %ebx
 61d:	5e                   	pop    %esi
 61e:	5f                   	pop    %edi
 61f:	5d                   	pop    %ebp
 620:	c3                   	ret    
 621:	8b 75 d0             	mov    -0x30(%ebp),%esi
 624:	eb ee                	jmp    614 <printint+0x79>

00000626 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 626:	55                   	push   %ebp
 627:	89 e5                	mov    %esp,%ebp
 629:	57                   	push   %edi
 62a:	56                   	push   %esi
 62b:	53                   	push   %ebx
 62c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 62f:	8d 45 10             	lea    0x10(%ebp),%eax
 632:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 635:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 63a:	bb 00 00 00 00       	mov    $0x0,%ebx
 63f:	eb 14                	jmp    655 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 641:	89 fa                	mov    %edi,%edx
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	e8 36 ff ff ff       	call   581 <putc>
 64b:	eb 05                	jmp    652 <printf+0x2c>
      }
    } else if(state == '%'){
 64d:	83 fe 25             	cmp    $0x25,%esi
 650:	74 25                	je     677 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 652:	83 c3 01             	add    $0x1,%ebx
 655:	8b 45 0c             	mov    0xc(%ebp),%eax
 658:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 65c:	84 c0                	test   %al,%al
 65e:	0f 84 20 01 00 00    	je     784 <printf+0x15e>
    c = fmt[i] & 0xff;
 664:	0f be f8             	movsbl %al,%edi
 667:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 66a:	85 f6                	test   %esi,%esi
 66c:	75 df                	jne    64d <printf+0x27>
      if(c == '%'){
 66e:	83 f8 25             	cmp    $0x25,%eax
 671:	75 ce                	jne    641 <printf+0x1b>
        state = '%';
 673:	89 c6                	mov    %eax,%esi
 675:	eb db                	jmp    652 <printf+0x2c>
      if(c == 'd'){
 677:	83 f8 25             	cmp    $0x25,%eax
 67a:	0f 84 cf 00 00 00    	je     74f <printf+0x129>
 680:	0f 8c dd 00 00 00    	jl     763 <printf+0x13d>
 686:	83 f8 78             	cmp    $0x78,%eax
 689:	0f 8f d4 00 00 00    	jg     763 <printf+0x13d>
 68f:	83 f8 63             	cmp    $0x63,%eax
 692:	0f 8c cb 00 00 00    	jl     763 <printf+0x13d>
 698:	83 e8 63             	sub    $0x63,%eax
 69b:	83 f8 15             	cmp    $0x15,%eax
 69e:	0f 87 bf 00 00 00    	ja     763 <printf+0x13d>
 6a4:	ff 24 85 14 09 00 00 	jmp    *0x914(,%eax,4)
        printint(fd, *ap, 10, 1);
 6ab:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ae:	8b 17                	mov    (%edi),%edx
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	6a 01                	push   $0x1
 6b5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6ba:	8b 45 08             	mov    0x8(%ebp),%eax
 6bd:	e8 d9 fe ff ff       	call   59b <printint>
        ap++;
 6c2:	83 c7 04             	add    $0x4,%edi
 6c5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6c8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6cb:	be 00 00 00 00       	mov    $0x0,%esi
 6d0:	eb 80                	jmp    652 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6d2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d5:	8b 17                	mov    (%edi),%edx
 6d7:	83 ec 0c             	sub    $0xc,%esp
 6da:	6a 00                	push   $0x0
 6dc:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e1:	8b 45 08             	mov    0x8(%ebp),%eax
 6e4:	e8 b2 fe ff ff       	call   59b <printint>
        ap++;
 6e9:	83 c7 04             	add    $0x4,%edi
 6ec:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ef:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f2:	be 00 00 00 00       	mov    $0x0,%esi
 6f7:	e9 56 ff ff ff       	jmp    652 <printf+0x2c>
        s = (char*)*ap;
 6fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ff:	8b 30                	mov    (%eax),%esi
        ap++;
 701:	83 c0 04             	add    $0x4,%eax
 704:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 707:	85 f6                	test   %esi,%esi
 709:	75 15                	jne    720 <printf+0xfa>
          s = "(null)";
 70b:	be 0a 09 00 00       	mov    $0x90a,%esi
 710:	eb 0e                	jmp    720 <printf+0xfa>
          putc(fd, *s);
 712:	0f be d2             	movsbl %dl,%edx
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	e8 64 fe ff ff       	call   581 <putc>
          s++;
 71d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 720:	0f b6 16             	movzbl (%esi),%edx
 723:	84 d2                	test   %dl,%dl
 725:	75 eb                	jne    712 <printf+0xec>
      state = 0;
 727:	be 00 00 00 00       	mov    $0x0,%esi
 72c:	e9 21 ff ff ff       	jmp    652 <printf+0x2c>
        putc(fd, *ap);
 731:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 734:	0f be 17             	movsbl (%edi),%edx
 737:	8b 45 08             	mov    0x8(%ebp),%eax
 73a:	e8 42 fe ff ff       	call   581 <putc>
        ap++;
 73f:	83 c7 04             	add    $0x4,%edi
 742:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 745:	be 00 00 00 00       	mov    $0x0,%esi
 74a:	e9 03 ff ff ff       	jmp    652 <printf+0x2c>
        putc(fd, c);
 74f:	89 fa                	mov    %edi,%edx
 751:	8b 45 08             	mov    0x8(%ebp),%eax
 754:	e8 28 fe ff ff       	call   581 <putc>
      state = 0;
 759:	be 00 00 00 00       	mov    $0x0,%esi
 75e:	e9 ef fe ff ff       	jmp    652 <printf+0x2c>
        putc(fd, '%');
 763:	ba 25 00 00 00       	mov    $0x25,%edx
 768:	8b 45 08             	mov    0x8(%ebp),%eax
 76b:	e8 11 fe ff ff       	call   581 <putc>
        putc(fd, c);
 770:	89 fa                	mov    %edi,%edx
 772:	8b 45 08             	mov    0x8(%ebp),%eax
 775:	e8 07 fe ff ff       	call   581 <putc>
      state = 0;
 77a:	be 00 00 00 00       	mov    $0x0,%esi
 77f:	e9 ce fe ff ff       	jmp    652 <printf+0x2c>
    }
  }
}
 784:	8d 65 f4             	lea    -0xc(%ebp),%esp
 787:	5b                   	pop    %ebx
 788:	5e                   	pop    %esi
 789:	5f                   	pop    %edi
 78a:	5d                   	pop    %ebp
 78b:	c3                   	ret    

0000078c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 78c:	55                   	push   %ebp
 78d:	89 e5                	mov    %esp,%ebp
 78f:	57                   	push   %edi
 790:	56                   	push   %esi
 791:	53                   	push   %ebx
 792:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 795:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 798:	a1 a0 11 00 00       	mov    0x11a0,%eax
 79d:	eb 02                	jmp    7a1 <free+0x15>
 79f:	89 d0                	mov    %edx,%eax
 7a1:	39 c8                	cmp    %ecx,%eax
 7a3:	73 04                	jae    7a9 <free+0x1d>
 7a5:	39 08                	cmp    %ecx,(%eax)
 7a7:	77 12                	ja     7bb <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a9:	8b 10                	mov    (%eax),%edx
 7ab:	39 c2                	cmp    %eax,%edx
 7ad:	77 f0                	ja     79f <free+0x13>
 7af:	39 c8                	cmp    %ecx,%eax
 7b1:	72 08                	jb     7bb <free+0x2f>
 7b3:	39 ca                	cmp    %ecx,%edx
 7b5:	77 04                	ja     7bb <free+0x2f>
 7b7:	89 d0                	mov    %edx,%eax
 7b9:	eb e6                	jmp    7a1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7bb:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7be:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7c1:	8b 10                	mov    (%eax),%edx
 7c3:	39 d7                	cmp    %edx,%edi
 7c5:	74 19                	je     7e0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7c7:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ca:	8b 50 04             	mov    0x4(%eax),%edx
 7cd:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d0:	39 ce                	cmp    %ecx,%esi
 7d2:	74 1b                	je     7ef <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7d4:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7d6:	a3 a0 11 00 00       	mov    %eax,0x11a0
}
 7db:	5b                   	pop    %ebx
 7dc:	5e                   	pop    %esi
 7dd:	5f                   	pop    %edi
 7de:	5d                   	pop    %ebp
 7df:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7e0:	03 72 04             	add    0x4(%edx),%esi
 7e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e6:	8b 10                	mov    (%eax),%edx
 7e8:	8b 12                	mov    (%edx),%edx
 7ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7ed:	eb db                	jmp    7ca <free+0x3e>
    p->s.size += bp->s.size;
 7ef:	03 53 fc             	add    -0x4(%ebx),%edx
 7f2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7f8:	89 10                	mov    %edx,(%eax)
 7fa:	eb da                	jmp    7d6 <free+0x4a>

000007fc <morecore>:

static Header*
morecore(uint nu)
{
 7fc:	55                   	push   %ebp
 7fd:	89 e5                	mov    %esp,%ebp
 7ff:	53                   	push   %ebx
 800:	83 ec 04             	sub    $0x4,%esp
 803:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 805:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 80a:	77 05                	ja     811 <morecore+0x15>
    nu = 4096;
 80c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 811:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 818:	83 ec 0c             	sub    $0xc,%esp
 81b:	50                   	push   %eax
 81c:	e8 38 fd ff ff       	call   559 <sbrk>
  if(p == (char*)-1)
 821:	83 c4 10             	add    $0x10,%esp
 824:	83 f8 ff             	cmp    $0xffffffff,%eax
 827:	74 1c                	je     845 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 829:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 82c:	83 c0 08             	add    $0x8,%eax
 82f:	83 ec 0c             	sub    $0xc,%esp
 832:	50                   	push   %eax
 833:	e8 54 ff ff ff       	call   78c <free>
  return freep;
 838:	a1 a0 11 00 00       	mov    0x11a0,%eax
 83d:	83 c4 10             	add    $0x10,%esp
}
 840:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 843:	c9                   	leave  
 844:	c3                   	ret    
    return 0;
 845:	b8 00 00 00 00       	mov    $0x0,%eax
 84a:	eb f4                	jmp    840 <morecore+0x44>

0000084c <malloc>:

void*
malloc(uint nbytes)
{
 84c:	55                   	push   %ebp
 84d:	89 e5                	mov    %esp,%ebp
 84f:	53                   	push   %ebx
 850:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 853:	8b 45 08             	mov    0x8(%ebp),%eax
 856:	8d 58 07             	lea    0x7(%eax),%ebx
 859:	c1 eb 03             	shr    $0x3,%ebx
 85c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 85f:	8b 0d a0 11 00 00    	mov    0x11a0,%ecx
 865:	85 c9                	test   %ecx,%ecx
 867:	74 04                	je     86d <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 869:	8b 01                	mov    (%ecx),%eax
 86b:	eb 4a                	jmp    8b7 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 86d:	c7 05 a0 11 00 00 a4 	movl   $0x11a4,0x11a0
 874:	11 00 00 
 877:	c7 05 a4 11 00 00 a4 	movl   $0x11a4,0x11a4
 87e:	11 00 00 
    base.s.size = 0;
 881:	c7 05 a8 11 00 00 00 	movl   $0x0,0x11a8
 888:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 88b:	b9 a4 11 00 00       	mov    $0x11a4,%ecx
 890:	eb d7                	jmp    869 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 892:	74 19                	je     8ad <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 894:	29 da                	sub    %ebx,%edx
 896:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 89c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 89f:	89 0d a0 11 00 00    	mov    %ecx,0x11a0
      return (void*)(p + 1);
 8a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ab:	c9                   	leave  
 8ac:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8ad:	8b 10                	mov    (%eax),%edx
 8af:	89 11                	mov    %edx,(%ecx)
 8b1:	eb ec                	jmp    89f <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b3:	89 c1                	mov    %eax,%ecx
 8b5:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8b7:	8b 50 04             	mov    0x4(%eax),%edx
 8ba:	39 da                	cmp    %ebx,%edx
 8bc:	73 d4                	jae    892 <malloc+0x46>
    if(p == freep)
 8be:	39 05 a0 11 00 00    	cmp    %eax,0x11a0
 8c4:	75 ed                	jne    8b3 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8c6:	89 d8                	mov    %ebx,%eax
 8c8:	e8 2f ff ff ff       	call   7fc <morecore>
 8cd:	85 c0                	test   %eax,%eax
 8cf:	75 e2                	jne    8b3 <malloc+0x67>
 8d1:	eb d5                	jmp    8a8 <malloc+0x5c>
