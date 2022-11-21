
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
 137:	e8 68 02 00 00       	call   3a4 <strchr>
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
 168:	e8 79 03 00 00       	call   4e6 <write>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	eb bc                	jmp    12e <grep+0x15>
    if(p == buf)
 172:	81 fe 80 0d 00 00    	cmp    $0xd80,%esi
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
 18f:	8d 81 80 0d 00 00    	lea    0xd80(%ecx),%eax
 195:	50                   	push   %eax
 196:	ff 75 0c             	push   0xc(%ebp)
 199:	e8 40 03 00 00       	call   4de <read>
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	85 c0                	test   %eax,%eax
 1a3:	7e 40                	jle    1e5 <grep+0xcc>
    m += n;
 1a5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1ab:	c6 82 80 0d 00 00 00 	movb   $0x0,0xd80(%edx)
    p = buf;
 1b2:	be 80 0d 00 00       	mov    $0xd80,%esi
    while((q = strchr(p, '\n')) != 0){
 1b7:	e9 75 ff ff ff       	jmp    131 <grep+0x18>
      m -= p - buf;
 1bc:	89 f0                	mov    %esi,%eax
 1be:	2d 80 0d 00 00       	sub    $0xd80,%eax
 1c3:	29 c1                	sub    %eax,%ecx
 1c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1c8:	83 ec 04             	sub    $0x4,%esp
 1cb:	51                   	push   %ecx
 1cc:	56                   	push   %esi
 1cd:	68 80 0d 00 00       	push   $0xd80
 1d2:	e8 bb 02 00 00       	call   492 <memmove>
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
 237:	e8 ca 02 00 00       	call   506 <open>
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
 254:	e8 95 02 00 00       	call   4ee <close>
  for(i = 2; i < argc; i++){
 259:	83 c6 01             	add    $0x1,%esi
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	eb c4                	jmp    225 <main+0x38>
    printf(2, "usage: grep pattern [file ...]\n");
 261:	83 ec 08             	sub    $0x8,%esp
 264:	68 c8 08 00 00       	push   $0x8c8
 269:	6a 02                	push   $0x2
 26b:	e8 ab 03 00 00       	call   61b <printf>
    exit();
 270:	e8 51 02 00 00       	call   4c6 <exit>
    grep(pattern, 0);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	50                   	push   %eax
 27b:	e8 99 fe ff ff       	call   119 <grep>
    exit();
 280:	e8 41 02 00 00       	call   4c6 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 285:	83 ec 04             	sub    $0x4,%esp
 288:	ff 37                	push   (%edi)
 28a:	68 e8 08 00 00       	push   $0x8e8
 28f:	6a 01                	push   $0x1
 291:	e8 85 03 00 00       	call   61b <printf>
      exit();
 296:	e8 2b 02 00 00       	call   4c6 <exit>
  exit();
 29b:	e8 26 02 00 00       	call   4c6 <exit>

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
  void *n_stack = malloc(PGSIZE);
 2b7:	68 00 10 00 00       	push   $0x1000
 2bc:	e8 80 05 00 00       	call   841 <malloc>
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
 2d2:	e8 8f 02 00 00       	call   566 <clone>


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
  return 0;
}
 2e3:	b8 00 00 00 00       	mov    $0x0,%eax
 2e8:	c3                   	ret    

000002e9 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	53                   	push   %ebx
 2ed:	83 ec 04             	sub    $0x4,%esp
 2f0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2f3:	83 ec 08             	sub    $0x8,%esp
 2f6:	6a 01                	push   $0x1
 2f8:	53                   	push   %ebx
 2f9:	e8 a2 ff ff ff       	call   2a0 <test_and_set>
 2fe:	83 c4 10             	add    $0x10,%esp
 301:	83 f8 01             	cmp    $0x1,%eax
 304:	74 ed                	je     2f3 <lock_acquire+0xa>
    ;
}
 306:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 309:	c9                   	leave  
 30a:	c3                   	ret    

0000030b <lock_release>:

void lock_release(lock_t *lock) {
 30b:	55                   	push   %ebp
 30c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 30e:	8b 45 08             	mov    0x8(%ebp),%eax
 311:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    

00000319 <lock_init>:

void lock_init(lock_t *lock) {
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 31c:	8b 45 08             	mov    0x8(%ebp),%eax
 31f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 325:	5d                   	pop    %ebp
 326:	c3                   	ret    

00000327 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	56                   	push   %esi
 32b:	53                   	push   %ebx
 32c:	8b 75 08             	mov    0x8(%ebp),%esi
 32f:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 332:	89 f0                	mov    %esi,%eax
 334:	89 d1                	mov    %edx,%ecx
 336:	83 c2 01             	add    $0x1,%edx
 339:	89 c3                	mov    %eax,%ebx
 33b:	83 c0 01             	add    $0x1,%eax
 33e:	0f b6 09             	movzbl (%ecx),%ecx
 341:	88 0b                	mov    %cl,(%ebx)
 343:	84 c9                	test   %cl,%cl
 345:	75 ed                	jne    334 <strcpy+0xd>
    ;
  return os;
}
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    

0000034d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	8b 4d 08             	mov    0x8(%ebp),%ecx
 353:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 356:	eb 06                	jmp    35e <strcmp+0x11>
    p++, q++;
 358:	83 c1 01             	add    $0x1,%ecx
 35b:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 35e:	0f b6 01             	movzbl (%ecx),%eax
 361:	84 c0                	test   %al,%al
 363:	74 04                	je     369 <strcmp+0x1c>
 365:	3a 02                	cmp    (%edx),%al
 367:	74 ef                	je     358 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 369:	0f b6 c0             	movzbl %al,%eax
 36c:	0f b6 12             	movzbl (%edx),%edx
 36f:	29 d0                	sub    %edx,%eax
}
 371:	5d                   	pop    %ebp
 372:	c3                   	ret    

00000373 <strlen>:

uint
strlen(const char *s)
{
 373:	55                   	push   %ebp
 374:	89 e5                	mov    %esp,%ebp
 376:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 379:	b8 00 00 00 00       	mov    $0x0,%eax
 37e:	eb 03                	jmp    383 <strlen+0x10>
 380:	83 c0 01             	add    $0x1,%eax
 383:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 387:	75 f7                	jne    380 <strlen+0xd>
    ;
  return n;
}
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    

0000038b <memset>:

void*
memset(void *dst, int c, uint n)
{
 38b:	55                   	push   %ebp
 38c:	89 e5                	mov    %esp,%ebp
 38e:	57                   	push   %edi
 38f:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 392:	89 d7                	mov    %edx,%edi
 394:	8b 4d 10             	mov    0x10(%ebp),%ecx
 397:	8b 45 0c             	mov    0xc(%ebp),%eax
 39a:	fc                   	cld    
 39b:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 39d:	89 d0                	mov    %edx,%eax
 39f:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3a2:	c9                   	leave  
 3a3:	c3                   	ret    

000003a4 <strchr>:

char*
strchr(const char *s, char c)
{
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3ae:	eb 03                	jmp    3b3 <strchr+0xf>
 3b0:	83 c0 01             	add    $0x1,%eax
 3b3:	0f b6 10             	movzbl (%eax),%edx
 3b6:	84 d2                	test   %dl,%dl
 3b8:	74 06                	je     3c0 <strchr+0x1c>
    if(*s == c)
 3ba:	38 ca                	cmp    %cl,%dl
 3bc:	75 f2                	jne    3b0 <strchr+0xc>
 3be:	eb 05                	jmp    3c5 <strchr+0x21>
      return (char*)s;
  return 0;
 3c0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    

000003c7 <gets>:

char*
gets(char *buf, int max)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	57                   	push   %edi
 3cb:	56                   	push   %esi
 3cc:	53                   	push   %ebx
 3cd:	83 ec 1c             	sub    $0x1c,%esp
 3d0:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d3:	bb 00 00 00 00       	mov    $0x0,%ebx
 3d8:	89 de                	mov    %ebx,%esi
 3da:	83 c3 01             	add    $0x1,%ebx
 3dd:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e0:	7d 2e                	jge    410 <gets+0x49>
    cc = read(0, &c, 1);
 3e2:	83 ec 04             	sub    $0x4,%esp
 3e5:	6a 01                	push   $0x1
 3e7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3ea:	50                   	push   %eax
 3eb:	6a 00                	push   $0x0
 3ed:	e8 ec 00 00 00       	call   4de <read>
    if(cc < 1)
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	85 c0                	test   %eax,%eax
 3f7:	7e 17                	jle    410 <gets+0x49>
      break;
    buf[i++] = c;
 3f9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3fd:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 400:	3c 0a                	cmp    $0xa,%al
 402:	0f 94 c2             	sete   %dl
 405:	3c 0d                	cmp    $0xd,%al
 407:	0f 94 c0             	sete   %al
 40a:	08 c2                	or     %al,%dl
 40c:	74 ca                	je     3d8 <gets+0x11>
    buf[i++] = c;
 40e:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 410:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 414:	89 f8                	mov    %edi,%eax
 416:	8d 65 f4             	lea    -0xc(%ebp),%esp
 419:	5b                   	pop    %ebx
 41a:	5e                   	pop    %esi
 41b:	5f                   	pop    %edi
 41c:	5d                   	pop    %ebp
 41d:	c3                   	ret    

0000041e <stat>:

int
stat(const char *n, struct stat *st)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	56                   	push   %esi
 422:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 423:	83 ec 08             	sub    $0x8,%esp
 426:	6a 00                	push   $0x0
 428:	ff 75 08             	push   0x8(%ebp)
 42b:	e8 d6 00 00 00       	call   506 <open>
  if(fd < 0)
 430:	83 c4 10             	add    $0x10,%esp
 433:	85 c0                	test   %eax,%eax
 435:	78 24                	js     45b <stat+0x3d>
 437:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 439:	83 ec 08             	sub    $0x8,%esp
 43c:	ff 75 0c             	push   0xc(%ebp)
 43f:	50                   	push   %eax
 440:	e8 d9 00 00 00       	call   51e <fstat>
 445:	89 c6                	mov    %eax,%esi
  close(fd);
 447:	89 1c 24             	mov    %ebx,(%esp)
 44a:	e8 9f 00 00 00       	call   4ee <close>
  return r;
 44f:	83 c4 10             	add    $0x10,%esp
}
 452:	89 f0                	mov    %esi,%eax
 454:	8d 65 f8             	lea    -0x8(%ebp),%esp
 457:	5b                   	pop    %ebx
 458:	5e                   	pop    %esi
 459:	5d                   	pop    %ebp
 45a:	c3                   	ret    
    return -1;
 45b:	be ff ff ff ff       	mov    $0xffffffff,%esi
 460:	eb f0                	jmp    452 <stat+0x34>

00000462 <atoi>:

int
atoi(const char *s)
{
 462:	55                   	push   %ebp
 463:	89 e5                	mov    %esp,%ebp
 465:	53                   	push   %ebx
 466:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 469:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 46e:	eb 10                	jmp    480 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 470:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 473:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 476:	83 c1 01             	add    $0x1,%ecx
 479:	0f be c0             	movsbl %al,%eax
 47c:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 480:	0f b6 01             	movzbl (%ecx),%eax
 483:	8d 58 d0             	lea    -0x30(%eax),%ebx
 486:	80 fb 09             	cmp    $0x9,%bl
 489:	76 e5                	jbe    470 <atoi+0xe>
  return n;
}
 48b:	89 d0                	mov    %edx,%eax
 48d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 490:	c9                   	leave  
 491:	c3                   	ret    

00000492 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	56                   	push   %esi
 496:	53                   	push   %ebx
 497:	8b 75 08             	mov    0x8(%ebp),%esi
 49a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 49d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4a0:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4a2:	eb 0d                	jmp    4b1 <memmove+0x1f>
    *dst++ = *src++;
 4a4:	0f b6 01             	movzbl (%ecx),%eax
 4a7:	88 02                	mov    %al,(%edx)
 4a9:	8d 49 01             	lea    0x1(%ecx),%ecx
 4ac:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4af:	89 d8                	mov    %ebx,%eax
 4b1:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4b4:	85 c0                	test   %eax,%eax
 4b6:	7f ec                	jg     4a4 <memmove+0x12>
  return vdst;
}
 4b8:	89 f0                	mov    %esi,%eax
 4ba:	5b                   	pop    %ebx
 4bb:	5e                   	pop    %esi
 4bc:	5d                   	pop    %ebp
 4bd:	c3                   	ret    

000004be <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4be:	b8 01 00 00 00       	mov    $0x1,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <exit>:
SYSCALL(exit)
 4c6:	b8 02 00 00 00       	mov    $0x2,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <wait>:
SYSCALL(wait)
 4ce:	b8 03 00 00 00       	mov    $0x3,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <pipe>:
SYSCALL(pipe)
 4d6:	b8 04 00 00 00       	mov    $0x4,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <read>:
SYSCALL(read)
 4de:	b8 05 00 00 00       	mov    $0x5,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <write>:
SYSCALL(write)
 4e6:	b8 10 00 00 00       	mov    $0x10,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <close>:
SYSCALL(close)
 4ee:	b8 15 00 00 00       	mov    $0x15,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <kill>:
SYSCALL(kill)
 4f6:	b8 06 00 00 00       	mov    $0x6,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <exec>:
SYSCALL(exec)
 4fe:	b8 07 00 00 00       	mov    $0x7,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <open>:
SYSCALL(open)
 506:	b8 0f 00 00 00       	mov    $0xf,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <mknod>:
SYSCALL(mknod)
 50e:	b8 11 00 00 00       	mov    $0x11,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <unlink>:
SYSCALL(unlink)
 516:	b8 12 00 00 00       	mov    $0x12,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <fstat>:
SYSCALL(fstat)
 51e:	b8 08 00 00 00       	mov    $0x8,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <link>:
SYSCALL(link)
 526:	b8 13 00 00 00       	mov    $0x13,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <mkdir>:
SYSCALL(mkdir)
 52e:	b8 14 00 00 00       	mov    $0x14,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <chdir>:
SYSCALL(chdir)
 536:	b8 09 00 00 00       	mov    $0x9,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <dup>:
SYSCALL(dup)
 53e:	b8 0a 00 00 00       	mov    $0xa,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <getpid>:
SYSCALL(getpid)
 546:	b8 0b 00 00 00       	mov    $0xb,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <sbrk>:
SYSCALL(sbrk)
 54e:	b8 0c 00 00 00       	mov    $0xc,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <sleep>:
SYSCALL(sleep)
 556:	b8 0d 00 00 00       	mov    $0xd,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <uptime>:
SYSCALL(uptime)
 55e:	b8 0e 00 00 00       	mov    $0xe,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <clone>:
SYSCALL(clone)
 566:	b8 16 00 00 00       	mov    $0x16,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <join>:
 56e:	b8 17 00 00 00       	mov    $0x17,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 576:	55                   	push   %ebp
 577:	89 e5                	mov    %esp,%ebp
 579:	83 ec 1c             	sub    $0x1c,%esp
 57c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 57f:	6a 01                	push   $0x1
 581:	8d 55 f4             	lea    -0xc(%ebp),%edx
 584:	52                   	push   %edx
 585:	50                   	push   %eax
 586:	e8 5b ff ff ff       	call   4e6 <write>
}
 58b:	83 c4 10             	add    $0x10,%esp
 58e:	c9                   	leave  
 58f:	c3                   	ret    

00000590 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 2c             	sub    $0x2c,%esp
 599:	89 45 d0             	mov    %eax,-0x30(%ebp)
 59c:	89 d0                	mov    %edx,%eax
 59e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5a0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5a4:	0f 95 c1             	setne  %cl
 5a7:	c1 ea 1f             	shr    $0x1f,%edx
 5aa:	84 d1                	test   %dl,%cl
 5ac:	74 44                	je     5f2 <printint+0x62>
    neg = 1;
    x = -xx;
 5ae:	f7 d8                	neg    %eax
 5b0:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5b2:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5b9:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5be:	89 c8                	mov    %ecx,%eax
 5c0:	ba 00 00 00 00       	mov    $0x0,%edx
 5c5:	f7 f6                	div    %esi
 5c7:	89 df                	mov    %ebx,%edi
 5c9:	83 c3 01             	add    $0x1,%ebx
 5cc:	0f b6 92 60 09 00 00 	movzbl 0x960(%edx),%edx
 5d3:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5d7:	89 ca                	mov    %ecx,%edx
 5d9:	89 c1                	mov    %eax,%ecx
 5db:	39 d6                	cmp    %edx,%esi
 5dd:	76 df                	jbe    5be <printint+0x2e>
  if(neg)
 5df:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5e3:	74 31                	je     616 <printint+0x86>
    buf[i++] = '-';
 5e5:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5ea:	8d 5f 02             	lea    0x2(%edi),%ebx
 5ed:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5f0:	eb 17                	jmp    609 <printint+0x79>
    x = xx;
 5f2:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5f4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5fb:	eb bc                	jmp    5b9 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5fd:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 602:	89 f0                	mov    %esi,%eax
 604:	e8 6d ff ff ff       	call   576 <putc>
  while(--i >= 0)
 609:	83 eb 01             	sub    $0x1,%ebx
 60c:	79 ef                	jns    5fd <printint+0x6d>
}
 60e:	83 c4 2c             	add    $0x2c,%esp
 611:	5b                   	pop    %ebx
 612:	5e                   	pop    %esi
 613:	5f                   	pop    %edi
 614:	5d                   	pop    %ebp
 615:	c3                   	ret    
 616:	8b 75 d0             	mov    -0x30(%ebp),%esi
 619:	eb ee                	jmp    609 <printint+0x79>

0000061b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 61b:	55                   	push   %ebp
 61c:	89 e5                	mov    %esp,%ebp
 61e:	57                   	push   %edi
 61f:	56                   	push   %esi
 620:	53                   	push   %ebx
 621:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 624:	8d 45 10             	lea    0x10(%ebp),%eax
 627:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 62a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 62f:	bb 00 00 00 00       	mov    $0x0,%ebx
 634:	eb 14                	jmp    64a <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 636:	89 fa                	mov    %edi,%edx
 638:	8b 45 08             	mov    0x8(%ebp),%eax
 63b:	e8 36 ff ff ff       	call   576 <putc>
 640:	eb 05                	jmp    647 <printf+0x2c>
      }
    } else if(state == '%'){
 642:	83 fe 25             	cmp    $0x25,%esi
 645:	74 25                	je     66c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 647:	83 c3 01             	add    $0x1,%ebx
 64a:	8b 45 0c             	mov    0xc(%ebp),%eax
 64d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 651:	84 c0                	test   %al,%al
 653:	0f 84 20 01 00 00    	je     779 <printf+0x15e>
    c = fmt[i] & 0xff;
 659:	0f be f8             	movsbl %al,%edi
 65c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 65f:	85 f6                	test   %esi,%esi
 661:	75 df                	jne    642 <printf+0x27>
      if(c == '%'){
 663:	83 f8 25             	cmp    $0x25,%eax
 666:	75 ce                	jne    636 <printf+0x1b>
        state = '%';
 668:	89 c6                	mov    %eax,%esi
 66a:	eb db                	jmp    647 <printf+0x2c>
      if(c == 'd'){
 66c:	83 f8 25             	cmp    $0x25,%eax
 66f:	0f 84 cf 00 00 00    	je     744 <printf+0x129>
 675:	0f 8c dd 00 00 00    	jl     758 <printf+0x13d>
 67b:	83 f8 78             	cmp    $0x78,%eax
 67e:	0f 8f d4 00 00 00    	jg     758 <printf+0x13d>
 684:	83 f8 63             	cmp    $0x63,%eax
 687:	0f 8c cb 00 00 00    	jl     758 <printf+0x13d>
 68d:	83 e8 63             	sub    $0x63,%eax
 690:	83 f8 15             	cmp    $0x15,%eax
 693:	0f 87 bf 00 00 00    	ja     758 <printf+0x13d>
 699:	ff 24 85 08 09 00 00 	jmp    *0x908(,%eax,4)
        printint(fd, *ap, 10, 1);
 6a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6a3:	8b 17                	mov    (%edi),%edx
 6a5:	83 ec 0c             	sub    $0xc,%esp
 6a8:	6a 01                	push   $0x1
 6aa:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6af:	8b 45 08             	mov    0x8(%ebp),%eax
 6b2:	e8 d9 fe ff ff       	call   590 <printint>
        ap++;
 6b7:	83 c7 04             	add    $0x4,%edi
 6ba:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6bd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6c0:	be 00 00 00 00       	mov    $0x0,%esi
 6c5:	eb 80                	jmp    647 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ca:	8b 17                	mov    (%edi),%edx
 6cc:	83 ec 0c             	sub    $0xc,%esp
 6cf:	6a 00                	push   $0x0
 6d1:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d6:	8b 45 08             	mov    0x8(%ebp),%eax
 6d9:	e8 b2 fe ff ff       	call   590 <printint>
        ap++;
 6de:	83 c7 04             	add    $0x4,%edi
 6e1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6e4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6e7:	be 00 00 00 00       	mov    $0x0,%esi
 6ec:	e9 56 ff ff ff       	jmp    647 <printf+0x2c>
        s = (char*)*ap;
 6f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f4:	8b 30                	mov    (%eax),%esi
        ap++;
 6f6:	83 c0 04             	add    $0x4,%eax
 6f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6fc:	85 f6                	test   %esi,%esi
 6fe:	75 15                	jne    715 <printf+0xfa>
          s = "(null)";
 700:	be fe 08 00 00       	mov    $0x8fe,%esi
 705:	eb 0e                	jmp    715 <printf+0xfa>
          putc(fd, *s);
 707:	0f be d2             	movsbl %dl,%edx
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	e8 64 fe ff ff       	call   576 <putc>
          s++;
 712:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 715:	0f b6 16             	movzbl (%esi),%edx
 718:	84 d2                	test   %dl,%dl
 71a:	75 eb                	jne    707 <printf+0xec>
      state = 0;
 71c:	be 00 00 00 00       	mov    $0x0,%esi
 721:	e9 21 ff ff ff       	jmp    647 <printf+0x2c>
        putc(fd, *ap);
 726:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 729:	0f be 17             	movsbl (%edi),%edx
 72c:	8b 45 08             	mov    0x8(%ebp),%eax
 72f:	e8 42 fe ff ff       	call   576 <putc>
        ap++;
 734:	83 c7 04             	add    $0x4,%edi
 737:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 73a:	be 00 00 00 00       	mov    $0x0,%esi
 73f:	e9 03 ff ff ff       	jmp    647 <printf+0x2c>
        putc(fd, c);
 744:	89 fa                	mov    %edi,%edx
 746:	8b 45 08             	mov    0x8(%ebp),%eax
 749:	e8 28 fe ff ff       	call   576 <putc>
      state = 0;
 74e:	be 00 00 00 00       	mov    $0x0,%esi
 753:	e9 ef fe ff ff       	jmp    647 <printf+0x2c>
        putc(fd, '%');
 758:	ba 25 00 00 00       	mov    $0x25,%edx
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	e8 11 fe ff ff       	call   576 <putc>
        putc(fd, c);
 765:	89 fa                	mov    %edi,%edx
 767:	8b 45 08             	mov    0x8(%ebp),%eax
 76a:	e8 07 fe ff ff       	call   576 <putc>
      state = 0;
 76f:	be 00 00 00 00       	mov    $0x0,%esi
 774:	e9 ce fe ff ff       	jmp    647 <printf+0x2c>
    }
  }
}
 779:	8d 65 f4             	lea    -0xc(%ebp),%esp
 77c:	5b                   	pop    %ebx
 77d:	5e                   	pop    %esi
 77e:	5f                   	pop    %edi
 77f:	5d                   	pop    %ebp
 780:	c3                   	ret    

00000781 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 781:	55                   	push   %ebp
 782:	89 e5                	mov    %esp,%ebp
 784:	57                   	push   %edi
 785:	56                   	push   %esi
 786:	53                   	push   %ebx
 787:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 78a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78d:	a1 80 11 00 00       	mov    0x1180,%eax
 792:	eb 02                	jmp    796 <free+0x15>
 794:	89 d0                	mov    %edx,%eax
 796:	39 c8                	cmp    %ecx,%eax
 798:	73 04                	jae    79e <free+0x1d>
 79a:	39 08                	cmp    %ecx,(%eax)
 79c:	77 12                	ja     7b0 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79e:	8b 10                	mov    (%eax),%edx
 7a0:	39 c2                	cmp    %eax,%edx
 7a2:	77 f0                	ja     794 <free+0x13>
 7a4:	39 c8                	cmp    %ecx,%eax
 7a6:	72 08                	jb     7b0 <free+0x2f>
 7a8:	39 ca                	cmp    %ecx,%edx
 7aa:	77 04                	ja     7b0 <free+0x2f>
 7ac:	89 d0                	mov    %edx,%eax
 7ae:	eb e6                	jmp    796 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	39 d7                	cmp    %edx,%edi
 7ba:	74 19                	je     7d5 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7bc:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bf:	8b 50 04             	mov    0x4(%eax),%edx
 7c2:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c5:	39 ce                	cmp    %ecx,%esi
 7c7:	74 1b                	je     7e4 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7c9:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7cb:	a3 80 11 00 00       	mov    %eax,0x1180
}
 7d0:	5b                   	pop    %ebx
 7d1:	5e                   	pop    %esi
 7d2:	5f                   	pop    %edi
 7d3:	5d                   	pop    %ebp
 7d4:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7d5:	03 72 04             	add    0x4(%edx),%esi
 7d8:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7db:	8b 10                	mov    (%eax),%edx
 7dd:	8b 12                	mov    (%edx),%edx
 7df:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7e2:	eb db                	jmp    7bf <free+0x3e>
    p->s.size += bp->s.size;
 7e4:	03 53 fc             	add    -0x4(%ebx),%edx
 7e7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ea:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7ed:	89 10                	mov    %edx,(%eax)
 7ef:	eb da                	jmp    7cb <free+0x4a>

000007f1 <morecore>:

static Header*
morecore(uint nu)
{
 7f1:	55                   	push   %ebp
 7f2:	89 e5                	mov    %esp,%ebp
 7f4:	53                   	push   %ebx
 7f5:	83 ec 04             	sub    $0x4,%esp
 7f8:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7fa:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7ff:	77 05                	ja     806 <morecore+0x15>
    nu = 4096;
 801:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 806:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 80d:	83 ec 0c             	sub    $0xc,%esp
 810:	50                   	push   %eax
 811:	e8 38 fd ff ff       	call   54e <sbrk>
  if(p == (char*)-1)
 816:	83 c4 10             	add    $0x10,%esp
 819:	83 f8 ff             	cmp    $0xffffffff,%eax
 81c:	74 1c                	je     83a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 81e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 821:	83 c0 08             	add    $0x8,%eax
 824:	83 ec 0c             	sub    $0xc,%esp
 827:	50                   	push   %eax
 828:	e8 54 ff ff ff       	call   781 <free>
  return freep;
 82d:	a1 80 11 00 00       	mov    0x1180,%eax
 832:	83 c4 10             	add    $0x10,%esp
}
 835:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 838:	c9                   	leave  
 839:	c3                   	ret    
    return 0;
 83a:	b8 00 00 00 00       	mov    $0x0,%eax
 83f:	eb f4                	jmp    835 <morecore+0x44>

00000841 <malloc>:

void*
malloc(uint nbytes)
{
 841:	55                   	push   %ebp
 842:	89 e5                	mov    %esp,%ebp
 844:	53                   	push   %ebx
 845:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 848:	8b 45 08             	mov    0x8(%ebp),%eax
 84b:	8d 58 07             	lea    0x7(%eax),%ebx
 84e:	c1 eb 03             	shr    $0x3,%ebx
 851:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 854:	8b 0d 80 11 00 00    	mov    0x1180,%ecx
 85a:	85 c9                	test   %ecx,%ecx
 85c:	74 04                	je     862 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85e:	8b 01                	mov    (%ecx),%eax
 860:	eb 4a                	jmp    8ac <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 862:	c7 05 80 11 00 00 84 	movl   $0x1184,0x1180
 869:	11 00 00 
 86c:	c7 05 84 11 00 00 84 	movl   $0x1184,0x1184
 873:	11 00 00 
    base.s.size = 0;
 876:	c7 05 88 11 00 00 00 	movl   $0x0,0x1188
 87d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 880:	b9 84 11 00 00       	mov    $0x1184,%ecx
 885:	eb d7                	jmp    85e <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 887:	74 19                	je     8a2 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 889:	29 da                	sub    %ebx,%edx
 88b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 88e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 891:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 894:	89 0d 80 11 00 00    	mov    %ecx,0x1180
      return (void*)(p + 1);
 89a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 89d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a0:	c9                   	leave  
 8a1:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8a2:	8b 10                	mov    (%eax),%edx
 8a4:	89 11                	mov    %edx,(%ecx)
 8a6:	eb ec                	jmp    894 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a8:	89 c1                	mov    %eax,%ecx
 8aa:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8ac:	8b 50 04             	mov    0x4(%eax),%edx
 8af:	39 da                	cmp    %ebx,%edx
 8b1:	73 d4                	jae    887 <malloc+0x46>
    if(p == freep)
 8b3:	39 05 80 11 00 00    	cmp    %eax,0x1180
 8b9:	75 ed                	jne    8a8 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8bb:	89 d8                	mov    %ebx,%eax
 8bd:	e8 2f ff ff ff       	call   7f1 <morecore>
 8c2:	85 c0                	test   %eax,%eax
 8c4:	75 e2                	jne    8a8 <malloc+0x67>
 8c6:	eb d5                	jmp    89d <malloc+0x5c>
