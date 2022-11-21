
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   8:	83 ec 0c             	sub    $0xc,%esp
   b:	53                   	push   %ebx
   c:	e8 b1 03 00 00       	call   3c2 <strlen>
  11:	01 d8                	add    %ebx,%eax
  13:	83 c4 10             	add    $0x10,%esp
  16:	eb 03                	jmp    1b <fmtname+0x1b>
  18:	83 e8 01             	sub    $0x1,%eax
  1b:	39 d8                	cmp    %ebx,%eax
  1d:	72 05                	jb     24 <fmtname+0x24>
  1f:	80 38 2f             	cmpb   $0x2f,(%eax)
  22:	75 f4                	jne    18 <fmtname+0x18>
    ;
  p++;
  24:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  27:	83 ec 0c             	sub    $0xc,%esp
  2a:	53                   	push   %ebx
  2b:	e8 92 03 00 00       	call   3c2 <strlen>
  30:	83 c4 10             	add    $0x10,%esp
  33:	83 f8 0d             	cmp    $0xd,%eax
  36:	76 09                	jbe    41 <fmtname+0x41>
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}
  38:	89 d8                	mov    %ebx,%eax
  3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3d:	5b                   	pop    %ebx
  3e:	5e                   	pop    %esi
  3f:	5d                   	pop    %ebp
  40:	c3                   	ret    
  memmove(buf, p, strlen(p));
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	53                   	push   %ebx
  45:	e8 78 03 00 00       	call   3c2 <strlen>
  4a:	83 c4 0c             	add    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	53                   	push   %ebx
  4f:	68 94 0d 00 00       	push   $0xd94
  54:	e8 88 04 00 00       	call   4e1 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  59:	89 1c 24             	mov    %ebx,(%esp)
  5c:	e8 61 03 00 00       	call   3c2 <strlen>
  61:	89 c6                	mov    %eax,%esi
  63:	89 1c 24             	mov    %ebx,(%esp)
  66:	e8 57 03 00 00       	call   3c2 <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	ba 0e 00 00 00       	mov    $0xe,%edx
  73:	29 f2                	sub    %esi,%edx
  75:	52                   	push   %edx
  76:	6a 20                	push   $0x20
  78:	05 94 0d 00 00       	add    $0xd94,%eax
  7d:	50                   	push   %eax
  7e:	e8 57 03 00 00       	call   3da <memset>
  return buf;
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb 94 0d 00 00       	mov    $0xd94,%ebx
  8b:	eb ab                	jmp    38 <fmtname+0x38>

0000008d <ls>:

void
ls(char *path)
{
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	57                   	push   %edi
  91:	56                   	push   %esi
  92:	53                   	push   %ebx
  93:	81 ec 54 02 00 00    	sub    $0x254,%esp
  99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  9c:	6a 00                	push   $0x0
  9e:	53                   	push   %ebx
  9f:	e8 b1 04 00 00       	call   555 <open>
  a4:	83 c4 10             	add    $0x10,%esp
  a7:	85 c0                	test   %eax,%eax
  a9:	0f 88 8c 00 00 00    	js     13b <ls+0xae>
  af:	89 c7                	mov    %eax,%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  b1:	83 ec 08             	sub    $0x8,%esp
  b4:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
  ba:	50                   	push   %eax
  bb:	57                   	push   %edi
  bc:	e8 ac 04 00 00       	call   56d <fstat>
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	85 c0                	test   %eax,%eax
  c6:	0f 88 84 00 00 00    	js     150 <ls+0xc3>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  cc:	0f b7 85 c4 fd ff ff 	movzwl -0x23c(%ebp),%eax
  d3:	0f bf f0             	movswl %ax,%esi
  d6:	66 83 f8 01          	cmp    $0x1,%ax
  da:	0f 84 8d 00 00 00    	je     16d <ls+0xe0>
  e0:	66 83 f8 02          	cmp    $0x2,%ax
  e4:	75 41                	jne    127 <ls+0x9a>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
  e6:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
  ec:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
  f2:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
  f8:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
  fe:	83 ec 0c             	sub    $0xc,%esp
 101:	53                   	push   %ebx
 102:	e8 f9 fe ff ff       	call   0 <fmtname>
 107:	83 c4 08             	add    $0x8,%esp
 10a:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 110:	ff b5 b0 fd ff ff    	push   -0x250(%ebp)
 116:	56                   	push   %esi
 117:	50                   	push   %eax
 118:	68 40 09 00 00       	push   $0x940
 11d:	6a 01                	push   $0x1
 11f:	e8 46 05 00 00       	call   66a <printf>
    break;
 124:	83 c4 20             	add    $0x20,%esp
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 127:	83 ec 0c             	sub    $0xc,%esp
 12a:	57                   	push   %edi
 12b:	e8 0d 04 00 00       	call   53d <close>
 130:	83 c4 10             	add    $0x10,%esp
}
 133:	8d 65 f4             	lea    -0xc(%ebp),%esp
 136:	5b                   	pop    %ebx
 137:	5e                   	pop    %esi
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    
    printf(2, "ls: cannot open %s\n", path);
 13b:	83 ec 04             	sub    $0x4,%esp
 13e:	53                   	push   %ebx
 13f:	68 18 09 00 00       	push   $0x918
 144:	6a 02                	push   $0x2
 146:	e8 1f 05 00 00       	call   66a <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 2c 09 00 00       	push   $0x92c
 159:	6a 02                	push   $0x2
 15b:	e8 0a 05 00 00       	call   66a <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 d5 03 00 00       	call   53d <close>
    return;
 168:	83 c4 10             	add    $0x10,%esp
 16b:	eb c6                	jmp    133 <ls+0xa6>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 16d:	83 ec 0c             	sub    $0xc,%esp
 170:	53                   	push   %ebx
 171:	e8 4c 02 00 00       	call   3c2 <strlen>
 176:	83 c0 10             	add    $0x10,%eax
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3d 00 02 00 00       	cmp    $0x200,%eax
 181:	76 14                	jbe    197 <ls+0x10a>
      printf(1, "ls: path too long\n");
 183:	83 ec 08             	sub    $0x8,%esp
 186:	68 4d 09 00 00       	push   $0x94d
 18b:	6a 01                	push   $0x1
 18d:	e8 d8 04 00 00       	call   66a <printf>
      break;
 192:	83 c4 10             	add    $0x10,%esp
 195:	eb 90                	jmp    127 <ls+0x9a>
    strcpy(buf, path);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	53                   	push   %ebx
 19b:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a1:	56                   	push   %esi
 1a2:	e8 cf 01 00 00       	call   376 <strcpy>
    p = buf+strlen(buf);
 1a7:	89 34 24             	mov    %esi,(%esp)
 1aa:	e8 13 02 00 00       	call   3c2 <strlen>
 1af:	01 c6                	add    %eax,%esi
    *p++ = '/';
 1b1:	8d 46 01             	lea    0x1(%esi),%eax
 1b4:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 1ba:	c6 06 2f             	movb   $0x2f,(%esi)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	eb 19                	jmp    1db <ls+0x14e>
        printf(1, "ls: cannot stat %s\n", buf);
 1c2:	83 ec 04             	sub    $0x4,%esp
 1c5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1cb:	50                   	push   %eax
 1cc:	68 2c 09 00 00       	push   $0x92c
 1d1:	6a 01                	push   $0x1
 1d3:	e8 92 04 00 00       	call   66a <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 40 03 00 00       	call   52d <read>
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	83 f8 10             	cmp    $0x10,%eax
 1f3:	0f 85 2e ff ff ff    	jne    127 <ls+0x9a>
      if(de.inum == 0)
 1f9:	66 83 bd d8 fd ff ff 	cmpw   $0x0,-0x228(%ebp)
 200:	00 
 201:	74 d8                	je     1db <ls+0x14e>
      memmove(p, de.name, DIRSIZ);
 203:	83 ec 04             	sub    $0x4,%esp
 206:	6a 0e                	push   $0xe
 208:	8d 85 da fd ff ff    	lea    -0x226(%ebp),%eax
 20e:	50                   	push   %eax
 20f:	ff b5 ac fd ff ff    	push   -0x254(%ebp)
 215:	e8 c7 02 00 00       	call   4e1 <memmove>
      p[DIRSIZ] = 0;
 21a:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 21e:	83 c4 08             	add    $0x8,%esp
 221:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	e8 39 02 00 00       	call   46d <stat>
 234:	83 c4 10             	add    $0x10,%esp
 237:	85 c0                	test   %eax,%eax
 239:	78 87                	js     1c2 <ls+0x135>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 23b:	8b 9d d4 fd ff ff    	mov    -0x22c(%ebp),%ebx
 241:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
 247:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 24d:	0f b7 8d c4 fd ff ff 	movzwl -0x23c(%ebp),%ecx
 254:	66 89 8d b0 fd ff ff 	mov    %cx,-0x250(%ebp)
 25b:	83 ec 0c             	sub    $0xc,%esp
 25e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 264:	50                   	push   %eax
 265:	e8 96 fd ff ff       	call   0 <fmtname>
 26a:	89 c2                	mov    %eax,%edx
 26c:	83 c4 08             	add    $0x8,%esp
 26f:	53                   	push   %ebx
 270:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 276:	0f bf 85 b0 fd ff ff 	movswl -0x250(%ebp),%eax
 27d:	50                   	push   %eax
 27e:	52                   	push   %edx
 27f:	68 40 09 00 00       	push   $0x940
 284:	6a 01                	push   $0x1
 286:	e8 df 03 00 00       	call   66a <printf>
 28b:	83 c4 20             	add    $0x20,%esp
 28e:	e9 48 ff ff ff       	jmp    1db <ls+0x14e>

00000293 <main>:

int
main(int argc, char *argv[])
{
 293:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 297:	83 e4 f0             	and    $0xfffffff0,%esp
 29a:	ff 71 fc             	push   -0x4(%ecx)
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	57                   	push   %edi
 2a1:	56                   	push   %esi
 2a2:	53                   	push   %ebx
 2a3:	51                   	push   %ecx
 2a4:	83 ec 08             	sub    $0x8,%esp
 2a7:	8b 31                	mov    (%ecx),%esi
 2a9:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
 2ac:	83 fe 01             	cmp    $0x1,%esi
 2af:	7e 07                	jle    2b8 <main+0x25>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 2b1:	bb 01 00 00 00       	mov    $0x1,%ebx
 2b6:	eb 23                	jmp    2db <main+0x48>
    ls(".");
 2b8:	83 ec 0c             	sub    $0xc,%esp
 2bb:	68 60 09 00 00       	push   $0x960
 2c0:	e8 c8 fd ff ff       	call   8d <ls>
    exit();
 2c5:	e8 4b 02 00 00       	call   515 <exit>
    ls(argv[i]);
 2ca:	83 ec 0c             	sub    $0xc,%esp
 2cd:	ff 34 9f             	push   (%edi,%ebx,4)
 2d0:	e8 b8 fd ff ff       	call   8d <ls>
  for(i=1; i<argc; i++)
 2d5:	83 c3 01             	add    $0x1,%ebx
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	39 f3                	cmp    %esi,%ebx
 2dd:	7c eb                	jl     2ca <main+0x37>
  exit();
 2df:	e8 31 02 00 00       	call   515 <exit>

000002e4 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2ea:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2ec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ef:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2f1:	89 d0                	mov    %edx,%eax
 2f3:	5d                   	pop    %ebp
 2f4:	c3                   	ret    

000002f5 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2f5:	55                   	push   %ebp
 2f6:	89 e5                	mov    %esp,%ebp
 2f8:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2fb:	68 00 20 00 00       	push   $0x2000
 300:	e8 8b 05 00 00       	call   890 <malloc>
  if(n_stack == 0){
 305:	83 c4 10             	add    $0x10,%esp
 308:	85 c0                	test   %eax,%eax
 30a:	74 14                	je     320 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 30c:	50                   	push   %eax
 30d:	ff 75 10             	push   0x10(%ebp)
 310:	ff 75 0c             	push   0xc(%ebp)
 313:	ff 75 08             	push   0x8(%ebp)
 316:	e8 9a 02 00 00       	call   5b5 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 31b:	83 c4 10             	add    $0x10,%esp
}
 31e:	c9                   	leave  
 31f:	c3                   	ret    
    return -1;
 320:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 325:	eb f7                	jmp    31e <thread_create+0x29>

00000327 <thread_join>:

int thread_join() {
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 32d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 330:	50                   	push   %eax
 331:	e8 87 02 00 00       	call   5bd <join>
  
  return pid;
}
 336:	c9                   	leave  
 337:	c3                   	ret    

00000338 <lock_acquire>:

void lock_acquire(lock_t *lock){
 338:	55                   	push   %ebp
 339:	89 e5                	mov    %esp,%ebp
 33b:	53                   	push   %ebx
 33c:	83 ec 04             	sub    $0x4,%esp
 33f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 342:	83 ec 08             	sub    $0x8,%esp
 345:	6a 01                	push   $0x1
 347:	53                   	push   %ebx
 348:	e8 97 ff ff ff       	call   2e4 <test_and_set>
 34d:	83 c4 10             	add    $0x10,%esp
 350:	83 f8 01             	cmp    $0x1,%eax
 353:	74 ed                	je     342 <lock_acquire+0xa>
    ;
}
 355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 358:	c9                   	leave  
 359:	c3                   	ret    

0000035a <lock_release>:

void lock_release(lock_t *lock) {
 35a:	55                   	push   %ebp
 35b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
 360:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    

00000368 <lock_init>:

void lock_init(lock_t *lock) {
 368:	55                   	push   %ebp
 369:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 36b:	8b 45 08             	mov    0x8(%ebp),%eax
 36e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 374:	5d                   	pop    %ebp
 375:	c3                   	ret    

00000376 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 376:	55                   	push   %ebp
 377:	89 e5                	mov    %esp,%ebp
 379:	56                   	push   %esi
 37a:	53                   	push   %ebx
 37b:	8b 75 08             	mov    0x8(%ebp),%esi
 37e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 381:	89 f0                	mov    %esi,%eax
 383:	89 d1                	mov    %edx,%ecx
 385:	83 c2 01             	add    $0x1,%edx
 388:	89 c3                	mov    %eax,%ebx
 38a:	83 c0 01             	add    $0x1,%eax
 38d:	0f b6 09             	movzbl (%ecx),%ecx
 390:	88 0b                	mov    %cl,(%ebx)
 392:	84 c9                	test   %cl,%cl
 394:	75 ed                	jne    383 <strcpy+0xd>
    ;
  return os;
}
 396:	89 f0                	mov    %esi,%eax
 398:	5b                   	pop    %ebx
 399:	5e                   	pop    %esi
 39a:	5d                   	pop    %ebp
 39b:	c3                   	ret    

0000039c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
 39f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3a5:	eb 06                	jmp    3ad <strcmp+0x11>
    p++, q++;
 3a7:	83 c1 01             	add    $0x1,%ecx
 3aa:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3ad:	0f b6 01             	movzbl (%ecx),%eax
 3b0:	84 c0                	test   %al,%al
 3b2:	74 04                	je     3b8 <strcmp+0x1c>
 3b4:	3a 02                	cmp    (%edx),%al
 3b6:	74 ef                	je     3a7 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3b8:	0f b6 c0             	movzbl %al,%eax
 3bb:	0f b6 12             	movzbl (%edx),%edx
 3be:	29 d0                	sub    %edx,%eax
}
 3c0:	5d                   	pop    %ebp
 3c1:	c3                   	ret    

000003c2 <strlen>:

uint
strlen(const char *s)
{
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3c8:	b8 00 00 00 00       	mov    $0x0,%eax
 3cd:	eb 03                	jmp    3d2 <strlen+0x10>
 3cf:	83 c0 01             	add    $0x1,%eax
 3d2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3d6:	75 f7                	jne    3cf <strlen+0xd>
    ;
  return n;
}
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    

000003da <memset>:

void*
memset(void *dst, int c, uint n)
{
 3da:	55                   	push   %ebp
 3db:	89 e5                	mov    %esp,%ebp
 3dd:	57                   	push   %edi
 3de:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3e1:	89 d7                	mov    %edx,%edi
 3e3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e9:	fc                   	cld    
 3ea:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ec:	89 d0                	mov    %edx,%eax
 3ee:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3f1:	c9                   	leave  
 3f2:	c3                   	ret    

000003f3 <strchr>:

char*
strchr(const char *s, char c)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
 3f9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3fd:	eb 03                	jmp    402 <strchr+0xf>
 3ff:	83 c0 01             	add    $0x1,%eax
 402:	0f b6 10             	movzbl (%eax),%edx
 405:	84 d2                	test   %dl,%dl
 407:	74 06                	je     40f <strchr+0x1c>
    if(*s == c)
 409:	38 ca                	cmp    %cl,%dl
 40b:	75 f2                	jne    3ff <strchr+0xc>
 40d:	eb 05                	jmp    414 <strchr+0x21>
      return (char*)s;
  return 0;
 40f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 414:	5d                   	pop    %ebp
 415:	c3                   	ret    

00000416 <gets>:

char*
gets(char *buf, int max)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	57                   	push   %edi
 41a:	56                   	push   %esi
 41b:	53                   	push   %ebx
 41c:	83 ec 1c             	sub    $0x1c,%esp
 41f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 422:	bb 00 00 00 00       	mov    $0x0,%ebx
 427:	89 de                	mov    %ebx,%esi
 429:	83 c3 01             	add    $0x1,%ebx
 42c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 42f:	7d 2e                	jge    45f <gets+0x49>
    cc = read(0, &c, 1);
 431:	83 ec 04             	sub    $0x4,%esp
 434:	6a 01                	push   $0x1
 436:	8d 45 e7             	lea    -0x19(%ebp),%eax
 439:	50                   	push   %eax
 43a:	6a 00                	push   $0x0
 43c:	e8 ec 00 00 00       	call   52d <read>
    if(cc < 1)
 441:	83 c4 10             	add    $0x10,%esp
 444:	85 c0                	test   %eax,%eax
 446:	7e 17                	jle    45f <gets+0x49>
      break;
    buf[i++] = c;
 448:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 44c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 44f:	3c 0a                	cmp    $0xa,%al
 451:	0f 94 c2             	sete   %dl
 454:	3c 0d                	cmp    $0xd,%al
 456:	0f 94 c0             	sete   %al
 459:	08 c2                	or     %al,%dl
 45b:	74 ca                	je     427 <gets+0x11>
    buf[i++] = c;
 45d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 45f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 463:	89 f8                	mov    %edi,%eax
 465:	8d 65 f4             	lea    -0xc(%ebp),%esp
 468:	5b                   	pop    %ebx
 469:	5e                   	pop    %esi
 46a:	5f                   	pop    %edi
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    

0000046d <stat>:

int
stat(const char *n, struct stat *st)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	56                   	push   %esi
 471:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 472:	83 ec 08             	sub    $0x8,%esp
 475:	6a 00                	push   $0x0
 477:	ff 75 08             	push   0x8(%ebp)
 47a:	e8 d6 00 00 00       	call   555 <open>
  if(fd < 0)
 47f:	83 c4 10             	add    $0x10,%esp
 482:	85 c0                	test   %eax,%eax
 484:	78 24                	js     4aa <stat+0x3d>
 486:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 488:	83 ec 08             	sub    $0x8,%esp
 48b:	ff 75 0c             	push   0xc(%ebp)
 48e:	50                   	push   %eax
 48f:	e8 d9 00 00 00       	call   56d <fstat>
 494:	89 c6                	mov    %eax,%esi
  close(fd);
 496:	89 1c 24             	mov    %ebx,(%esp)
 499:	e8 9f 00 00 00       	call   53d <close>
  return r;
 49e:	83 c4 10             	add    $0x10,%esp
}
 4a1:	89 f0                	mov    %esi,%eax
 4a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4a6:	5b                   	pop    %ebx
 4a7:	5e                   	pop    %esi
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    
    return -1;
 4aa:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4af:	eb f0                	jmp    4a1 <stat+0x34>

000004b1 <atoi>:

int
atoi(const char *s)
{
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	53                   	push   %ebx
 4b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4b8:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4bd:	eb 10                	jmp    4cf <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4bf:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4c2:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4c5:	83 c1 01             	add    $0x1,%ecx
 4c8:	0f be c0             	movsbl %al,%eax
 4cb:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4cf:	0f b6 01             	movzbl (%ecx),%eax
 4d2:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4d5:	80 fb 09             	cmp    $0x9,%bl
 4d8:	76 e5                	jbe    4bf <atoi+0xe>
  return n;
}
 4da:	89 d0                	mov    %edx,%eax
 4dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4df:	c9                   	leave  
 4e0:	c3                   	ret    

000004e1 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4e1:	55                   	push   %ebp
 4e2:	89 e5                	mov    %esp,%ebp
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	8b 75 08             	mov    0x8(%ebp),%esi
 4e9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ec:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4ef:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4f1:	eb 0d                	jmp    500 <memmove+0x1f>
    *dst++ = *src++;
 4f3:	0f b6 01             	movzbl (%ecx),%eax
 4f6:	88 02                	mov    %al,(%edx)
 4f8:	8d 49 01             	lea    0x1(%ecx),%ecx
 4fb:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4fe:	89 d8                	mov    %ebx,%eax
 500:	8d 58 ff             	lea    -0x1(%eax),%ebx
 503:	85 c0                	test   %eax,%eax
 505:	7f ec                	jg     4f3 <memmove+0x12>
  return vdst;
}
 507:	89 f0                	mov    %esi,%eax
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    

0000050d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 50d:	b8 01 00 00 00       	mov    $0x1,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <exit>:
SYSCALL(exit)
 515:	b8 02 00 00 00       	mov    $0x2,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <wait>:
SYSCALL(wait)
 51d:	b8 03 00 00 00       	mov    $0x3,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <pipe>:
SYSCALL(pipe)
 525:	b8 04 00 00 00       	mov    $0x4,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <read>:
SYSCALL(read)
 52d:	b8 05 00 00 00       	mov    $0x5,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <write>:
SYSCALL(write)
 535:	b8 10 00 00 00       	mov    $0x10,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <close>:
SYSCALL(close)
 53d:	b8 15 00 00 00       	mov    $0x15,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <kill>:
SYSCALL(kill)
 545:	b8 06 00 00 00       	mov    $0x6,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <exec>:
SYSCALL(exec)
 54d:	b8 07 00 00 00       	mov    $0x7,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <open>:
SYSCALL(open)
 555:	b8 0f 00 00 00       	mov    $0xf,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <mknod>:
SYSCALL(mknod)
 55d:	b8 11 00 00 00       	mov    $0x11,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <unlink>:
SYSCALL(unlink)
 565:	b8 12 00 00 00       	mov    $0x12,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <fstat>:
SYSCALL(fstat)
 56d:	b8 08 00 00 00       	mov    $0x8,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <link>:
SYSCALL(link)
 575:	b8 13 00 00 00       	mov    $0x13,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <mkdir>:
SYSCALL(mkdir)
 57d:	b8 14 00 00 00       	mov    $0x14,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <chdir>:
SYSCALL(chdir)
 585:	b8 09 00 00 00       	mov    $0x9,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <dup>:
SYSCALL(dup)
 58d:	b8 0a 00 00 00       	mov    $0xa,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <getpid>:
SYSCALL(getpid)
 595:	b8 0b 00 00 00       	mov    $0xb,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <sbrk>:
SYSCALL(sbrk)
 59d:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <sleep>:
SYSCALL(sleep)
 5a5:	b8 0d 00 00 00       	mov    $0xd,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <uptime>:
SYSCALL(uptime)
 5ad:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <clone>:
SYSCALL(clone)
 5b5:	b8 16 00 00 00       	mov    $0x16,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <join>:
 5bd:	b8 17 00 00 00       	mov    $0x17,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5c5:	55                   	push   %ebp
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	83 ec 1c             	sub    $0x1c,%esp
 5cb:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5ce:	6a 01                	push   $0x1
 5d0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5d3:	52                   	push   %edx
 5d4:	50                   	push   %eax
 5d5:	e8 5b ff ff ff       	call   535 <write>
}
 5da:	83 c4 10             	add    $0x10,%esp
 5dd:	c9                   	leave  
 5de:	c3                   	ret    

000005df <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5df:	55                   	push   %ebp
 5e0:	89 e5                	mov    %esp,%ebp
 5e2:	57                   	push   %edi
 5e3:	56                   	push   %esi
 5e4:	53                   	push   %ebx
 5e5:	83 ec 2c             	sub    $0x2c,%esp
 5e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5eb:	89 d0                	mov    %edx,%eax
 5ed:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ef:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5f3:	0f 95 c1             	setne  %cl
 5f6:	c1 ea 1f             	shr    $0x1f,%edx
 5f9:	84 d1                	test   %dl,%cl
 5fb:	74 44                	je     641 <printint+0x62>
    neg = 1;
    x = -xx;
 5fd:	f7 d8                	neg    %eax
 5ff:	89 c1                	mov    %eax,%ecx
    neg = 1;
 601:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 608:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 60d:	89 c8                	mov    %ecx,%eax
 60f:	ba 00 00 00 00       	mov    $0x0,%edx
 614:	f7 f6                	div    %esi
 616:	89 df                	mov    %ebx,%edi
 618:	83 c3 01             	add    $0x1,%ebx
 61b:	0f b6 92 c4 09 00 00 	movzbl 0x9c4(%edx),%edx
 622:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 626:	89 ca                	mov    %ecx,%edx
 628:	89 c1                	mov    %eax,%ecx
 62a:	39 d6                	cmp    %edx,%esi
 62c:	76 df                	jbe    60d <printint+0x2e>
  if(neg)
 62e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 632:	74 31                	je     665 <printint+0x86>
    buf[i++] = '-';
 634:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 639:	8d 5f 02             	lea    0x2(%edi),%ebx
 63c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 63f:	eb 17                	jmp    658 <printint+0x79>
    x = xx;
 641:	89 c1                	mov    %eax,%ecx
  neg = 0;
 643:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 64a:	eb bc                	jmp    608 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 64c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 651:	89 f0                	mov    %esi,%eax
 653:	e8 6d ff ff ff       	call   5c5 <putc>
  while(--i >= 0)
 658:	83 eb 01             	sub    $0x1,%ebx
 65b:	79 ef                	jns    64c <printint+0x6d>
}
 65d:	83 c4 2c             	add    $0x2c,%esp
 660:	5b                   	pop    %ebx
 661:	5e                   	pop    %esi
 662:	5f                   	pop    %edi
 663:	5d                   	pop    %ebp
 664:	c3                   	ret    
 665:	8b 75 d0             	mov    -0x30(%ebp),%esi
 668:	eb ee                	jmp    658 <printint+0x79>

0000066a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 66a:	55                   	push   %ebp
 66b:	89 e5                	mov    %esp,%ebp
 66d:	57                   	push   %edi
 66e:	56                   	push   %esi
 66f:	53                   	push   %ebx
 670:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 673:	8d 45 10             	lea    0x10(%ebp),%eax
 676:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 679:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 67e:	bb 00 00 00 00       	mov    $0x0,%ebx
 683:	eb 14                	jmp    699 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 685:	89 fa                	mov    %edi,%edx
 687:	8b 45 08             	mov    0x8(%ebp),%eax
 68a:	e8 36 ff ff ff       	call   5c5 <putc>
 68f:	eb 05                	jmp    696 <printf+0x2c>
      }
    } else if(state == '%'){
 691:	83 fe 25             	cmp    $0x25,%esi
 694:	74 25                	je     6bb <printf+0x51>
  for(i = 0; fmt[i]; i++){
 696:	83 c3 01             	add    $0x1,%ebx
 699:	8b 45 0c             	mov    0xc(%ebp),%eax
 69c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6a0:	84 c0                	test   %al,%al
 6a2:	0f 84 20 01 00 00    	je     7c8 <printf+0x15e>
    c = fmt[i] & 0xff;
 6a8:	0f be f8             	movsbl %al,%edi
 6ab:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ae:	85 f6                	test   %esi,%esi
 6b0:	75 df                	jne    691 <printf+0x27>
      if(c == '%'){
 6b2:	83 f8 25             	cmp    $0x25,%eax
 6b5:	75 ce                	jne    685 <printf+0x1b>
        state = '%';
 6b7:	89 c6                	mov    %eax,%esi
 6b9:	eb db                	jmp    696 <printf+0x2c>
      if(c == 'd'){
 6bb:	83 f8 25             	cmp    $0x25,%eax
 6be:	0f 84 cf 00 00 00    	je     793 <printf+0x129>
 6c4:	0f 8c dd 00 00 00    	jl     7a7 <printf+0x13d>
 6ca:	83 f8 78             	cmp    $0x78,%eax
 6cd:	0f 8f d4 00 00 00    	jg     7a7 <printf+0x13d>
 6d3:	83 f8 63             	cmp    $0x63,%eax
 6d6:	0f 8c cb 00 00 00    	jl     7a7 <printf+0x13d>
 6dc:	83 e8 63             	sub    $0x63,%eax
 6df:	83 f8 15             	cmp    $0x15,%eax
 6e2:	0f 87 bf 00 00 00    	ja     7a7 <printf+0x13d>
 6e8:	ff 24 85 6c 09 00 00 	jmp    *0x96c(,%eax,4)
        printint(fd, *ap, 10, 1);
 6ef:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f2:	8b 17                	mov    (%edi),%edx
 6f4:	83 ec 0c             	sub    $0xc,%esp
 6f7:	6a 01                	push   $0x1
 6f9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6fe:	8b 45 08             	mov    0x8(%ebp),%eax
 701:	e8 d9 fe ff ff       	call   5df <printint>
        ap++;
 706:	83 c7 04             	add    $0x4,%edi
 709:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 70c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 70f:	be 00 00 00 00       	mov    $0x0,%esi
 714:	eb 80                	jmp    696 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 716:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 719:	8b 17                	mov    (%edi),%edx
 71b:	83 ec 0c             	sub    $0xc,%esp
 71e:	6a 00                	push   $0x0
 720:	b9 10 00 00 00       	mov    $0x10,%ecx
 725:	8b 45 08             	mov    0x8(%ebp),%eax
 728:	e8 b2 fe ff ff       	call   5df <printint>
        ap++;
 72d:	83 c7 04             	add    $0x4,%edi
 730:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 733:	83 c4 10             	add    $0x10,%esp
      state = 0;
 736:	be 00 00 00 00       	mov    $0x0,%esi
 73b:	e9 56 ff ff ff       	jmp    696 <printf+0x2c>
        s = (char*)*ap;
 740:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 743:	8b 30                	mov    (%eax),%esi
        ap++;
 745:	83 c0 04             	add    $0x4,%eax
 748:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 74b:	85 f6                	test   %esi,%esi
 74d:	75 15                	jne    764 <printf+0xfa>
          s = "(null)";
 74f:	be 62 09 00 00       	mov    $0x962,%esi
 754:	eb 0e                	jmp    764 <printf+0xfa>
          putc(fd, *s);
 756:	0f be d2             	movsbl %dl,%edx
 759:	8b 45 08             	mov    0x8(%ebp),%eax
 75c:	e8 64 fe ff ff       	call   5c5 <putc>
          s++;
 761:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 764:	0f b6 16             	movzbl (%esi),%edx
 767:	84 d2                	test   %dl,%dl
 769:	75 eb                	jne    756 <printf+0xec>
      state = 0;
 76b:	be 00 00 00 00       	mov    $0x0,%esi
 770:	e9 21 ff ff ff       	jmp    696 <printf+0x2c>
        putc(fd, *ap);
 775:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 778:	0f be 17             	movsbl (%edi),%edx
 77b:	8b 45 08             	mov    0x8(%ebp),%eax
 77e:	e8 42 fe ff ff       	call   5c5 <putc>
        ap++;
 783:	83 c7 04             	add    $0x4,%edi
 786:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 789:	be 00 00 00 00       	mov    $0x0,%esi
 78e:	e9 03 ff ff ff       	jmp    696 <printf+0x2c>
        putc(fd, c);
 793:	89 fa                	mov    %edi,%edx
 795:	8b 45 08             	mov    0x8(%ebp),%eax
 798:	e8 28 fe ff ff       	call   5c5 <putc>
      state = 0;
 79d:	be 00 00 00 00       	mov    $0x0,%esi
 7a2:	e9 ef fe ff ff       	jmp    696 <printf+0x2c>
        putc(fd, '%');
 7a7:	ba 25 00 00 00       	mov    $0x25,%edx
 7ac:	8b 45 08             	mov    0x8(%ebp),%eax
 7af:	e8 11 fe ff ff       	call   5c5 <putc>
        putc(fd, c);
 7b4:	89 fa                	mov    %edi,%edx
 7b6:	8b 45 08             	mov    0x8(%ebp),%eax
 7b9:	e8 07 fe ff ff       	call   5c5 <putc>
      state = 0;
 7be:	be 00 00 00 00       	mov    $0x0,%esi
 7c3:	e9 ce fe ff ff       	jmp    696 <printf+0x2c>
    }
  }
}
 7c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret    

000007d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7dc:	a1 a4 0d 00 00       	mov    0xda4,%eax
 7e1:	eb 02                	jmp    7e5 <free+0x15>
 7e3:	89 d0                	mov    %edx,%eax
 7e5:	39 c8                	cmp    %ecx,%eax
 7e7:	73 04                	jae    7ed <free+0x1d>
 7e9:	39 08                	cmp    %ecx,(%eax)
 7eb:	77 12                	ja     7ff <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ed:	8b 10                	mov    (%eax),%edx
 7ef:	39 c2                	cmp    %eax,%edx
 7f1:	77 f0                	ja     7e3 <free+0x13>
 7f3:	39 c8                	cmp    %ecx,%eax
 7f5:	72 08                	jb     7ff <free+0x2f>
 7f7:	39 ca                	cmp    %ecx,%edx
 7f9:	77 04                	ja     7ff <free+0x2f>
 7fb:	89 d0                	mov    %edx,%eax
 7fd:	eb e6                	jmp    7e5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ff:	8b 73 fc             	mov    -0x4(%ebx),%esi
 802:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 805:	8b 10                	mov    (%eax),%edx
 807:	39 d7                	cmp    %edx,%edi
 809:	74 19                	je     824 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 80b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 80e:	8b 50 04             	mov    0x4(%eax),%edx
 811:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 814:	39 ce                	cmp    %ecx,%esi
 816:	74 1b                	je     833 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 818:	89 08                	mov    %ecx,(%eax)
  freep = p;
 81a:	a3 a4 0d 00 00       	mov    %eax,0xda4
}
 81f:	5b                   	pop    %ebx
 820:	5e                   	pop    %esi
 821:	5f                   	pop    %edi
 822:	5d                   	pop    %ebp
 823:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 824:	03 72 04             	add    0x4(%edx),%esi
 827:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 82a:	8b 10                	mov    (%eax),%edx
 82c:	8b 12                	mov    (%edx),%edx
 82e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 831:	eb db                	jmp    80e <free+0x3e>
    p->s.size += bp->s.size;
 833:	03 53 fc             	add    -0x4(%ebx),%edx
 836:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 839:	8b 53 f8             	mov    -0x8(%ebx),%edx
 83c:	89 10                	mov    %edx,(%eax)
 83e:	eb da                	jmp    81a <free+0x4a>

00000840 <morecore>:

static Header*
morecore(uint nu)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	53                   	push   %ebx
 844:	83 ec 04             	sub    $0x4,%esp
 847:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 849:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 84e:	77 05                	ja     855 <morecore+0x15>
    nu = 4096;
 850:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 855:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 85c:	83 ec 0c             	sub    $0xc,%esp
 85f:	50                   	push   %eax
 860:	e8 38 fd ff ff       	call   59d <sbrk>
  if(p == (char*)-1)
 865:	83 c4 10             	add    $0x10,%esp
 868:	83 f8 ff             	cmp    $0xffffffff,%eax
 86b:	74 1c                	je     889 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 86d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 870:	83 c0 08             	add    $0x8,%eax
 873:	83 ec 0c             	sub    $0xc,%esp
 876:	50                   	push   %eax
 877:	e8 54 ff ff ff       	call   7d0 <free>
  return freep;
 87c:	a1 a4 0d 00 00       	mov    0xda4,%eax
 881:	83 c4 10             	add    $0x10,%esp
}
 884:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 887:	c9                   	leave  
 888:	c3                   	ret    
    return 0;
 889:	b8 00 00 00 00       	mov    $0x0,%eax
 88e:	eb f4                	jmp    884 <morecore+0x44>

00000890 <malloc>:

void*
malloc(uint nbytes)
{
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	53                   	push   %ebx
 894:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 897:	8b 45 08             	mov    0x8(%ebp),%eax
 89a:	8d 58 07             	lea    0x7(%eax),%ebx
 89d:	c1 eb 03             	shr    $0x3,%ebx
 8a0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8a3:	8b 0d a4 0d 00 00    	mov    0xda4,%ecx
 8a9:	85 c9                	test   %ecx,%ecx
 8ab:	74 04                	je     8b1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ad:	8b 01                	mov    (%ecx),%eax
 8af:	eb 4a                	jmp    8fb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8b1:	c7 05 a4 0d 00 00 a8 	movl   $0xda8,0xda4
 8b8:	0d 00 00 
 8bb:	c7 05 a8 0d 00 00 a8 	movl   $0xda8,0xda8
 8c2:	0d 00 00 
    base.s.size = 0;
 8c5:	c7 05 ac 0d 00 00 00 	movl   $0x0,0xdac
 8cc:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8cf:	b9 a8 0d 00 00       	mov    $0xda8,%ecx
 8d4:	eb d7                	jmp    8ad <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8d6:	74 19                	je     8f1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8d8:	29 da                	sub    %ebx,%edx
 8da:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8dd:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8e0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8e3:	89 0d a4 0d 00 00    	mov    %ecx,0xda4
      return (void*)(p + 1);
 8e9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ef:	c9                   	leave  
 8f0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8f1:	8b 10                	mov    (%eax),%edx
 8f3:	89 11                	mov    %edx,(%ecx)
 8f5:	eb ec                	jmp    8e3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f7:	89 c1                	mov    %eax,%ecx
 8f9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8fb:	8b 50 04             	mov    0x4(%eax),%edx
 8fe:	39 da                	cmp    %ebx,%edx
 900:	73 d4                	jae    8d6 <malloc+0x46>
    if(p == freep)
 902:	39 05 a4 0d 00 00    	cmp    %eax,0xda4
 908:	75 ed                	jne    8f7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 90a:	89 d8                	mov    %ebx,%eax
 90c:	e8 2f ff ff ff       	call   840 <morecore>
 911:	85 c0                	test   %eax,%eax
 913:	75 e2                	jne    8f7 <malloc+0x67>
 915:	eb d5                	jmp    8ec <malloc+0x5c>
