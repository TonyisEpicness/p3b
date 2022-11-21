
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
   c:	e8 1f 04 00 00       	call   430 <strlen>
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
  2b:	e8 00 04 00 00       	call   430 <strlen>
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
  45:	e8 e6 03 00 00       	call   430 <strlen>
  4a:	83 c4 0c             	add    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	53                   	push   %ebx
  4f:	68 20 0e 00 00       	push   $0xe20
  54:	e8 f6 04 00 00       	call   54f <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  59:	89 1c 24             	mov    %ebx,(%esp)
  5c:	e8 cf 03 00 00       	call   430 <strlen>
  61:	89 c6                	mov    %eax,%esi
  63:	89 1c 24             	mov    %ebx,(%esp)
  66:	e8 c5 03 00 00       	call   430 <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	ba 0e 00 00 00       	mov    $0xe,%edx
  73:	29 f2                	sub    %esi,%edx
  75:	52                   	push   %edx
  76:	6a 20                	push   $0x20
  78:	05 20 0e 00 00       	add    $0xe20,%eax
  7d:	50                   	push   %eax
  7e:	e8 c5 03 00 00       	call   448 <memset>
  return buf;
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb 20 0e 00 00       	mov    $0xe20,%ebx
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
  9f:	e8 1f 05 00 00       	call   5c3 <open>
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
  bc:	e8 1a 05 00 00       	call   5db <fstat>
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
 118:	68 b0 09 00 00       	push   $0x9b0
 11d:	6a 01                	push   $0x1
 11f:	e8 b4 05 00 00       	call   6d8 <printf>
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
 12b:	e8 7b 04 00 00       	call   5ab <close>
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
 13f:	68 88 09 00 00       	push   $0x988
 144:	6a 02                	push   $0x2
 146:	e8 8d 05 00 00       	call   6d8 <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 9c 09 00 00       	push   $0x99c
 159:	6a 02                	push   $0x2
 15b:	e8 78 05 00 00       	call   6d8 <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 43 04 00 00       	call   5ab <close>
    return;
 168:	83 c4 10             	add    $0x10,%esp
 16b:	eb c6                	jmp    133 <ls+0xa6>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 16d:	83 ec 0c             	sub    $0xc,%esp
 170:	53                   	push   %ebx
 171:	e8 ba 02 00 00       	call   430 <strlen>
 176:	83 c0 10             	add    $0x10,%eax
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3d 00 02 00 00       	cmp    $0x200,%eax
 181:	76 14                	jbe    197 <ls+0x10a>
      printf(1, "ls: path too long\n");
 183:	83 ec 08             	sub    $0x8,%esp
 186:	68 bd 09 00 00       	push   $0x9bd
 18b:	6a 01                	push   $0x1
 18d:	e8 46 05 00 00       	call   6d8 <printf>
      break;
 192:	83 c4 10             	add    $0x10,%esp
 195:	eb 90                	jmp    127 <ls+0x9a>
    strcpy(buf, path);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	53                   	push   %ebx
 19b:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a1:	56                   	push   %esi
 1a2:	e8 3d 02 00 00       	call   3e4 <strcpy>
    p = buf+strlen(buf);
 1a7:	89 34 24             	mov    %esi,(%esp)
 1aa:	e8 81 02 00 00       	call   430 <strlen>
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
 1cc:	68 9c 09 00 00       	push   $0x99c
 1d1:	6a 01                	push   $0x1
 1d3:	e8 00 05 00 00       	call   6d8 <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 ae 03 00 00       	call   59b <read>
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
 215:	e8 35 03 00 00       	call   54f <memmove>
      p[DIRSIZ] = 0;
 21a:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 21e:	83 c4 08             	add    $0x8,%esp
 221:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	e8 a7 02 00 00       	call   4db <stat>
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
 27f:	68 b0 09 00 00       	push   $0x9b0
 284:	6a 01                	push   $0x1
 286:	e8 4d 04 00 00       	call   6d8 <printf>
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
 2bb:	68 d0 09 00 00       	push   $0x9d0
 2c0:	e8 c8 fd ff ff       	call   8d <ls>
    exit();
 2c5:	e8 b9 02 00 00       	call   583 <exit>
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
 2df:	e8 9f 02 00 00       	call   583 <exit>

000002e4 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

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
 2f8:	53                   	push   %ebx
 2f9:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2fc:	68 00 20 00 00       	push   $0x2000
 301:	e8 f8 05 00 00       	call   8fe <malloc>
  if(n_stack == 0){
 306:	83 c4 10             	add    $0x10,%esp
 309:	85 c0                	test   %eax,%eax
 30b:	74 41                	je     34e <thread_create+0x59>
 30d:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 30f:	50                   	push   %eax
 310:	ff 75 10             	push   0x10(%ebp)
 313:	ff 75 0c             	push   0xc(%ebp)
 316:	ff 75 08             	push   0x8(%ebp)
 319:	e8 05 03 00 00       	call   623 <clone>

  for(int i=0; i<64; i++){
 31e:	83 c4 10             	add    $0x10,%esp
 321:	ba 00 00 00 00       	mov    $0x0,%edx
 326:	eb 03                	jmp    32b <thread_create+0x36>
 328:	83 c2 01             	add    $0x1,%edx
 32b:	83 fa 3f             	cmp    $0x3f,%edx
 32e:	7f 19                	jg     349 <thread_create+0x54>
    if(threads[i]->flag==0){
 330:	8b 0c 95 40 0e 00 00 	mov    0xe40(,%edx,4),%ecx
 337:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 33b:	75 eb                	jne    328 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 33d:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 33f:	8b 14 95 40 0e 00 00 	mov    0xe40(,%edx,4),%edx
 346:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 349:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34c:	c9                   	leave  
 34d:	c3                   	ret    
    return -1;
 34e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 353:	eb f4                	jmp    349 <thread_create+0x54>

00000355 <thread_join>:

//TODO: fix
int thread_join() {
 355:	55                   	push   %ebp
 356:	89 e5                	mov    %esp,%ebp
 358:	56                   	push   %esi
 359:	53                   	push   %ebx
 35a:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 35d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 360:	50                   	push   %eax
 361:	e8 c5 02 00 00       	call   62b <join>
 366:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 368:	83 c4 10             	add    $0x10,%esp
 36b:	bb 00 00 00 00       	mov    $0x0,%ebx
 370:	eb 03                	jmp    375 <thread_join+0x20>
 372:	83 c3 01             	add    $0x1,%ebx
 375:	83 fb 3f             	cmp    $0x3f,%ebx
 378:	7f 23                	jg     39d <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 37a:	8b 04 9d 40 0e 00 00 	mov    0xe40(,%ebx,4),%eax
 381:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 385:	75 eb                	jne    372 <thread_join+0x1d>
 387:	8b 55 f4             	mov    -0xc(%ebp),%edx
 38a:	39 50 04             	cmp    %edx,0x4(%eax)
 38d:	75 e3                	jne    372 <thread_join+0x1d>
      free(stk_addr);
 38f:	83 ec 0c             	sub    $0xc,%esp
 392:	52                   	push   %edx
 393:	e8 a6 04 00 00       	call   83e <free>
 398:	83 c4 10             	add    $0x10,%esp
 39b:	eb d5                	jmp    372 <thread_join+0x1d>
    }
  }
  return pid;
}
 39d:	89 f0                	mov    %esi,%eax
 39f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a2:	5b                   	pop    %ebx
 3a3:	5e                   	pop    %esi
 3a4:	5d                   	pop    %ebp
 3a5:	c3                   	ret    

000003a6 <lock_acquire>:

void lock_acquire(lock_t *lock){
 3a6:	55                   	push   %ebp
 3a7:	89 e5                	mov    %esp,%ebp
 3a9:	53                   	push   %ebx
 3aa:	83 ec 04             	sub    $0x4,%esp
 3ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3b0:	83 ec 08             	sub    $0x8,%esp
 3b3:	6a 01                	push   $0x1
 3b5:	53                   	push   %ebx
 3b6:	e8 29 ff ff ff       	call   2e4 <test_and_set>
 3bb:	83 c4 10             	add    $0x10,%esp
 3be:	83 f8 01             	cmp    $0x1,%eax
 3c1:	74 ed                	je     3b0 <lock_acquire+0xa>
    ;
}
 3c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c6:	c9                   	leave  
 3c7:	c3                   	ret    

000003c8 <lock_release>:

void lock_release(lock_t *lock) {
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3cb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ce:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret    

000003d6 <lock_init>:

void lock_init(lock_t *lock) {
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3d9:	8b 45 08             	mov    0x8(%ebp),%eax
 3dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    

000003e4 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	56                   	push   %esi
 3e8:	53                   	push   %ebx
 3e9:	8b 75 08             	mov    0x8(%ebp),%esi
 3ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3ef:	89 f0                	mov    %esi,%eax
 3f1:	89 d1                	mov    %edx,%ecx
 3f3:	83 c2 01             	add    $0x1,%edx
 3f6:	89 c3                	mov    %eax,%ebx
 3f8:	83 c0 01             	add    $0x1,%eax
 3fb:	0f b6 09             	movzbl (%ecx),%ecx
 3fe:	88 0b                	mov    %cl,(%ebx)
 400:	84 c9                	test   %cl,%cl
 402:	75 ed                	jne    3f1 <strcpy+0xd>
    ;
  return os;
}
 404:	89 f0                	mov    %esi,%eax
 406:	5b                   	pop    %ebx
 407:	5e                   	pop    %esi
 408:	5d                   	pop    %ebp
 409:	c3                   	ret    

0000040a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 40a:	55                   	push   %ebp
 40b:	89 e5                	mov    %esp,%ebp
 40d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 410:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 413:	eb 06                	jmp    41b <strcmp+0x11>
    p++, q++;
 415:	83 c1 01             	add    $0x1,%ecx
 418:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 41b:	0f b6 01             	movzbl (%ecx),%eax
 41e:	84 c0                	test   %al,%al
 420:	74 04                	je     426 <strcmp+0x1c>
 422:	3a 02                	cmp    (%edx),%al
 424:	74 ef                	je     415 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 426:	0f b6 c0             	movzbl %al,%eax
 429:	0f b6 12             	movzbl (%edx),%edx
 42c:	29 d0                	sub    %edx,%eax
}
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    

00000430 <strlen>:

uint
strlen(const char *s)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 436:	b8 00 00 00 00       	mov    $0x0,%eax
 43b:	eb 03                	jmp    440 <strlen+0x10>
 43d:	83 c0 01             	add    $0x1,%eax
 440:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 444:	75 f7                	jne    43d <strlen+0xd>
    ;
  return n;
}
 446:	5d                   	pop    %ebp
 447:	c3                   	ret    

00000448 <memset>:

void*
memset(void *dst, int c, uint n)
{
 448:	55                   	push   %ebp
 449:	89 e5                	mov    %esp,%ebp
 44b:	57                   	push   %edi
 44c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 44f:	89 d7                	mov    %edx,%edi
 451:	8b 4d 10             	mov    0x10(%ebp),%ecx
 454:	8b 45 0c             	mov    0xc(%ebp),%eax
 457:	fc                   	cld    
 458:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 45a:	89 d0                	mov    %edx,%eax
 45c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 45f:	c9                   	leave  
 460:	c3                   	ret    

00000461 <strchr>:

char*
strchr(const char *s, char c)
{
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	8b 45 08             	mov    0x8(%ebp),%eax
 467:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 46b:	eb 03                	jmp    470 <strchr+0xf>
 46d:	83 c0 01             	add    $0x1,%eax
 470:	0f b6 10             	movzbl (%eax),%edx
 473:	84 d2                	test   %dl,%dl
 475:	74 06                	je     47d <strchr+0x1c>
    if(*s == c)
 477:	38 ca                	cmp    %cl,%dl
 479:	75 f2                	jne    46d <strchr+0xc>
 47b:	eb 05                	jmp    482 <strchr+0x21>
      return (char*)s;
  return 0;
 47d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    

00000484 <gets>:

char*
gets(char *buf, int max)
{
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	57                   	push   %edi
 488:	56                   	push   %esi
 489:	53                   	push   %ebx
 48a:	83 ec 1c             	sub    $0x1c,%esp
 48d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 490:	bb 00 00 00 00       	mov    $0x0,%ebx
 495:	89 de                	mov    %ebx,%esi
 497:	83 c3 01             	add    $0x1,%ebx
 49a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 49d:	7d 2e                	jge    4cd <gets+0x49>
    cc = read(0, &c, 1);
 49f:	83 ec 04             	sub    $0x4,%esp
 4a2:	6a 01                	push   $0x1
 4a4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4a7:	50                   	push   %eax
 4a8:	6a 00                	push   $0x0
 4aa:	e8 ec 00 00 00       	call   59b <read>
    if(cc < 1)
 4af:	83 c4 10             	add    $0x10,%esp
 4b2:	85 c0                	test   %eax,%eax
 4b4:	7e 17                	jle    4cd <gets+0x49>
      break;
    buf[i++] = c;
 4b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4ba:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4bd:	3c 0a                	cmp    $0xa,%al
 4bf:	0f 94 c2             	sete   %dl
 4c2:	3c 0d                	cmp    $0xd,%al
 4c4:	0f 94 c0             	sete   %al
 4c7:	08 c2                	or     %al,%dl
 4c9:	74 ca                	je     495 <gets+0x11>
    buf[i++] = c;
 4cb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4cd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4d1:	89 f8                	mov    %edi,%eax
 4d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d6:	5b                   	pop    %ebx
 4d7:	5e                   	pop    %esi
 4d8:	5f                   	pop    %edi
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    

000004db <stat>:

int
stat(const char *n, struct stat *st)
{
 4db:	55                   	push   %ebp
 4dc:	89 e5                	mov    %esp,%ebp
 4de:	56                   	push   %esi
 4df:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e0:	83 ec 08             	sub    $0x8,%esp
 4e3:	6a 00                	push   $0x0
 4e5:	ff 75 08             	push   0x8(%ebp)
 4e8:	e8 d6 00 00 00       	call   5c3 <open>
  if(fd < 0)
 4ed:	83 c4 10             	add    $0x10,%esp
 4f0:	85 c0                	test   %eax,%eax
 4f2:	78 24                	js     518 <stat+0x3d>
 4f4:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4f6:	83 ec 08             	sub    $0x8,%esp
 4f9:	ff 75 0c             	push   0xc(%ebp)
 4fc:	50                   	push   %eax
 4fd:	e8 d9 00 00 00       	call   5db <fstat>
 502:	89 c6                	mov    %eax,%esi
  close(fd);
 504:	89 1c 24             	mov    %ebx,(%esp)
 507:	e8 9f 00 00 00       	call   5ab <close>
  return r;
 50c:	83 c4 10             	add    $0x10,%esp
}
 50f:	89 f0                	mov    %esi,%eax
 511:	8d 65 f8             	lea    -0x8(%ebp),%esp
 514:	5b                   	pop    %ebx
 515:	5e                   	pop    %esi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    
    return -1;
 518:	be ff ff ff ff       	mov    $0xffffffff,%esi
 51d:	eb f0                	jmp    50f <stat+0x34>

0000051f <atoi>:

int
atoi(const char *s)
{
 51f:	55                   	push   %ebp
 520:	89 e5                	mov    %esp,%ebp
 522:	53                   	push   %ebx
 523:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 526:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 52b:	eb 10                	jmp    53d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 52d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 530:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 533:	83 c1 01             	add    $0x1,%ecx
 536:	0f be c0             	movsbl %al,%eax
 539:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 53d:	0f b6 01             	movzbl (%ecx),%eax
 540:	8d 58 d0             	lea    -0x30(%eax),%ebx
 543:	80 fb 09             	cmp    $0x9,%bl
 546:	76 e5                	jbe    52d <atoi+0xe>
  return n;
}
 548:	89 d0                	mov    %edx,%eax
 54a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 54d:	c9                   	leave  
 54e:	c3                   	ret    

0000054f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 54f:	55                   	push   %ebp
 550:	89 e5                	mov    %esp,%ebp
 552:	56                   	push   %esi
 553:	53                   	push   %ebx
 554:	8b 75 08             	mov    0x8(%ebp),%esi
 557:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 55a:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 55d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 55f:	eb 0d                	jmp    56e <memmove+0x1f>
    *dst++ = *src++;
 561:	0f b6 01             	movzbl (%ecx),%eax
 564:	88 02                	mov    %al,(%edx)
 566:	8d 49 01             	lea    0x1(%ecx),%ecx
 569:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 56c:	89 d8                	mov    %ebx,%eax
 56e:	8d 58 ff             	lea    -0x1(%eax),%ebx
 571:	85 c0                	test   %eax,%eax
 573:	7f ec                	jg     561 <memmove+0x12>
  return vdst;
}
 575:	89 f0                	mov    %esi,%eax
 577:	5b                   	pop    %ebx
 578:	5e                   	pop    %esi
 579:	5d                   	pop    %ebp
 57a:	c3                   	ret    

0000057b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 57b:	b8 01 00 00 00       	mov    $0x1,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <exit>:
SYSCALL(exit)
 583:	b8 02 00 00 00       	mov    $0x2,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <wait>:
SYSCALL(wait)
 58b:	b8 03 00 00 00       	mov    $0x3,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <pipe>:
SYSCALL(pipe)
 593:	b8 04 00 00 00       	mov    $0x4,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <read>:
SYSCALL(read)
 59b:	b8 05 00 00 00       	mov    $0x5,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <write>:
SYSCALL(write)
 5a3:	b8 10 00 00 00       	mov    $0x10,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <close>:
SYSCALL(close)
 5ab:	b8 15 00 00 00       	mov    $0x15,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <kill>:
SYSCALL(kill)
 5b3:	b8 06 00 00 00       	mov    $0x6,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <exec>:
SYSCALL(exec)
 5bb:	b8 07 00 00 00       	mov    $0x7,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <open>:
SYSCALL(open)
 5c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <mknod>:
SYSCALL(mknod)
 5cb:	b8 11 00 00 00       	mov    $0x11,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <unlink>:
SYSCALL(unlink)
 5d3:	b8 12 00 00 00       	mov    $0x12,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <fstat>:
SYSCALL(fstat)
 5db:	b8 08 00 00 00       	mov    $0x8,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <link>:
SYSCALL(link)
 5e3:	b8 13 00 00 00       	mov    $0x13,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <mkdir>:
SYSCALL(mkdir)
 5eb:	b8 14 00 00 00       	mov    $0x14,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <chdir>:
SYSCALL(chdir)
 5f3:	b8 09 00 00 00       	mov    $0x9,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <dup>:
SYSCALL(dup)
 5fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <getpid>:
SYSCALL(getpid)
 603:	b8 0b 00 00 00       	mov    $0xb,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <sbrk>:
SYSCALL(sbrk)
 60b:	b8 0c 00 00 00       	mov    $0xc,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <sleep>:
SYSCALL(sleep)
 613:	b8 0d 00 00 00       	mov    $0xd,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <uptime>:
SYSCALL(uptime)
 61b:	b8 0e 00 00 00       	mov    $0xe,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <clone>:
SYSCALL(clone)
 623:	b8 16 00 00 00       	mov    $0x16,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <join>:
 62b:	b8 17 00 00 00       	mov    $0x17,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 633:	55                   	push   %ebp
 634:	89 e5                	mov    %esp,%ebp
 636:	83 ec 1c             	sub    $0x1c,%esp
 639:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 63c:	6a 01                	push   $0x1
 63e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 641:	52                   	push   %edx
 642:	50                   	push   %eax
 643:	e8 5b ff ff ff       	call   5a3 <write>
}
 648:	83 c4 10             	add    $0x10,%esp
 64b:	c9                   	leave  
 64c:	c3                   	ret    

0000064d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 64d:	55                   	push   %ebp
 64e:	89 e5                	mov    %esp,%ebp
 650:	57                   	push   %edi
 651:	56                   	push   %esi
 652:	53                   	push   %ebx
 653:	83 ec 2c             	sub    $0x2c,%esp
 656:	89 45 d0             	mov    %eax,-0x30(%ebp)
 659:	89 d0                	mov    %edx,%eax
 65b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 65d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 661:	0f 95 c1             	setne  %cl
 664:	c1 ea 1f             	shr    $0x1f,%edx
 667:	84 d1                	test   %dl,%cl
 669:	74 44                	je     6af <printint+0x62>
    neg = 1;
    x = -xx;
 66b:	f7 d8                	neg    %eax
 66d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 66f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 676:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 67b:	89 c8                	mov    %ecx,%eax
 67d:	ba 00 00 00 00       	mov    $0x0,%edx
 682:	f7 f6                	div    %esi
 684:	89 df                	mov    %ebx,%edi
 686:	83 c3 01             	add    $0x1,%ebx
 689:	0f b6 92 34 0a 00 00 	movzbl 0xa34(%edx),%edx
 690:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 694:	89 ca                	mov    %ecx,%edx
 696:	89 c1                	mov    %eax,%ecx
 698:	39 d6                	cmp    %edx,%esi
 69a:	76 df                	jbe    67b <printint+0x2e>
  if(neg)
 69c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6a0:	74 31                	je     6d3 <printint+0x86>
    buf[i++] = '-';
 6a2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6a7:	8d 5f 02             	lea    0x2(%edi),%ebx
 6aa:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ad:	eb 17                	jmp    6c6 <printint+0x79>
    x = xx;
 6af:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6b1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6b8:	eb bc                	jmp    676 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6ba:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6bf:	89 f0                	mov    %esi,%eax
 6c1:	e8 6d ff ff ff       	call   633 <putc>
  while(--i >= 0)
 6c6:	83 eb 01             	sub    $0x1,%ebx
 6c9:	79 ef                	jns    6ba <printint+0x6d>
}
 6cb:	83 c4 2c             	add    $0x2c,%esp
 6ce:	5b                   	pop    %ebx
 6cf:	5e                   	pop    %esi
 6d0:	5f                   	pop    %edi
 6d1:	5d                   	pop    %ebp
 6d2:	c3                   	ret    
 6d3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6d6:	eb ee                	jmp    6c6 <printint+0x79>

000006d8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6d8:	55                   	push   %ebp
 6d9:	89 e5                	mov    %esp,%ebp
 6db:	57                   	push   %edi
 6dc:	56                   	push   %esi
 6dd:	53                   	push   %ebx
 6de:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6e1:	8d 45 10             	lea    0x10(%ebp),%eax
 6e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6e7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6ec:	bb 00 00 00 00       	mov    $0x0,%ebx
 6f1:	eb 14                	jmp    707 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6f3:	89 fa                	mov    %edi,%edx
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	e8 36 ff ff ff       	call   633 <putc>
 6fd:	eb 05                	jmp    704 <printf+0x2c>
      }
    } else if(state == '%'){
 6ff:	83 fe 25             	cmp    $0x25,%esi
 702:	74 25                	je     729 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 704:	83 c3 01             	add    $0x1,%ebx
 707:	8b 45 0c             	mov    0xc(%ebp),%eax
 70a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 70e:	84 c0                	test   %al,%al
 710:	0f 84 20 01 00 00    	je     836 <printf+0x15e>
    c = fmt[i] & 0xff;
 716:	0f be f8             	movsbl %al,%edi
 719:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 71c:	85 f6                	test   %esi,%esi
 71e:	75 df                	jne    6ff <printf+0x27>
      if(c == '%'){
 720:	83 f8 25             	cmp    $0x25,%eax
 723:	75 ce                	jne    6f3 <printf+0x1b>
        state = '%';
 725:	89 c6                	mov    %eax,%esi
 727:	eb db                	jmp    704 <printf+0x2c>
      if(c == 'd'){
 729:	83 f8 25             	cmp    $0x25,%eax
 72c:	0f 84 cf 00 00 00    	je     801 <printf+0x129>
 732:	0f 8c dd 00 00 00    	jl     815 <printf+0x13d>
 738:	83 f8 78             	cmp    $0x78,%eax
 73b:	0f 8f d4 00 00 00    	jg     815 <printf+0x13d>
 741:	83 f8 63             	cmp    $0x63,%eax
 744:	0f 8c cb 00 00 00    	jl     815 <printf+0x13d>
 74a:	83 e8 63             	sub    $0x63,%eax
 74d:	83 f8 15             	cmp    $0x15,%eax
 750:	0f 87 bf 00 00 00    	ja     815 <printf+0x13d>
 756:	ff 24 85 dc 09 00 00 	jmp    *0x9dc(,%eax,4)
        printint(fd, *ap, 10, 1);
 75d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 760:	8b 17                	mov    (%edi),%edx
 762:	83 ec 0c             	sub    $0xc,%esp
 765:	6a 01                	push   $0x1
 767:	b9 0a 00 00 00       	mov    $0xa,%ecx
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	e8 d9 fe ff ff       	call   64d <printint>
        ap++;
 774:	83 c7 04             	add    $0x4,%edi
 777:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 77a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 77d:	be 00 00 00 00       	mov    $0x0,%esi
 782:	eb 80                	jmp    704 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 784:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 787:	8b 17                	mov    (%edi),%edx
 789:	83 ec 0c             	sub    $0xc,%esp
 78c:	6a 00                	push   $0x0
 78e:	b9 10 00 00 00       	mov    $0x10,%ecx
 793:	8b 45 08             	mov    0x8(%ebp),%eax
 796:	e8 b2 fe ff ff       	call   64d <printint>
        ap++;
 79b:	83 c7 04             	add    $0x4,%edi
 79e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7a1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7a4:	be 00 00 00 00       	mov    $0x0,%esi
 7a9:	e9 56 ff ff ff       	jmp    704 <printf+0x2c>
        s = (char*)*ap;
 7ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b1:	8b 30                	mov    (%eax),%esi
        ap++;
 7b3:	83 c0 04             	add    $0x4,%eax
 7b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7b9:	85 f6                	test   %esi,%esi
 7bb:	75 15                	jne    7d2 <printf+0xfa>
          s = "(null)";
 7bd:	be d2 09 00 00       	mov    $0x9d2,%esi
 7c2:	eb 0e                	jmp    7d2 <printf+0xfa>
          putc(fd, *s);
 7c4:	0f be d2             	movsbl %dl,%edx
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	e8 64 fe ff ff       	call   633 <putc>
          s++;
 7cf:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7d2:	0f b6 16             	movzbl (%esi),%edx
 7d5:	84 d2                	test   %dl,%dl
 7d7:	75 eb                	jne    7c4 <printf+0xec>
      state = 0;
 7d9:	be 00 00 00 00       	mov    $0x0,%esi
 7de:	e9 21 ff ff ff       	jmp    704 <printf+0x2c>
        putc(fd, *ap);
 7e3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e6:	0f be 17             	movsbl (%edi),%edx
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ec:	e8 42 fe ff ff       	call   633 <putc>
        ap++;
 7f1:	83 c7 04             	add    $0x4,%edi
 7f4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7f7:	be 00 00 00 00       	mov    $0x0,%esi
 7fc:	e9 03 ff ff ff       	jmp    704 <printf+0x2c>
        putc(fd, c);
 801:	89 fa                	mov    %edi,%edx
 803:	8b 45 08             	mov    0x8(%ebp),%eax
 806:	e8 28 fe ff ff       	call   633 <putc>
      state = 0;
 80b:	be 00 00 00 00       	mov    $0x0,%esi
 810:	e9 ef fe ff ff       	jmp    704 <printf+0x2c>
        putc(fd, '%');
 815:	ba 25 00 00 00       	mov    $0x25,%edx
 81a:	8b 45 08             	mov    0x8(%ebp),%eax
 81d:	e8 11 fe ff ff       	call   633 <putc>
        putc(fd, c);
 822:	89 fa                	mov    %edi,%edx
 824:	8b 45 08             	mov    0x8(%ebp),%eax
 827:	e8 07 fe ff ff       	call   633 <putc>
      state = 0;
 82c:	be 00 00 00 00       	mov    $0x0,%esi
 831:	e9 ce fe ff ff       	jmp    704 <printf+0x2c>
    }
  }
}
 836:	8d 65 f4             	lea    -0xc(%ebp),%esp
 839:	5b                   	pop    %ebx
 83a:	5e                   	pop    %esi
 83b:	5f                   	pop    %edi
 83c:	5d                   	pop    %ebp
 83d:	c3                   	ret    

0000083e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 83e:	55                   	push   %ebp
 83f:	89 e5                	mov    %esp,%ebp
 841:	57                   	push   %edi
 842:	56                   	push   %esi
 843:	53                   	push   %ebx
 844:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 847:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84a:	a1 40 0f 00 00       	mov    0xf40,%eax
 84f:	eb 02                	jmp    853 <free+0x15>
 851:	89 d0                	mov    %edx,%eax
 853:	39 c8                	cmp    %ecx,%eax
 855:	73 04                	jae    85b <free+0x1d>
 857:	39 08                	cmp    %ecx,(%eax)
 859:	77 12                	ja     86d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 85b:	8b 10                	mov    (%eax),%edx
 85d:	39 c2                	cmp    %eax,%edx
 85f:	77 f0                	ja     851 <free+0x13>
 861:	39 c8                	cmp    %ecx,%eax
 863:	72 08                	jb     86d <free+0x2f>
 865:	39 ca                	cmp    %ecx,%edx
 867:	77 04                	ja     86d <free+0x2f>
 869:	89 d0                	mov    %edx,%eax
 86b:	eb e6                	jmp    853 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 86d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 870:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 873:	8b 10                	mov    (%eax),%edx
 875:	39 d7                	cmp    %edx,%edi
 877:	74 19                	je     892 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 879:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 87c:	8b 50 04             	mov    0x4(%eax),%edx
 87f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 882:	39 ce                	cmp    %ecx,%esi
 884:	74 1b                	je     8a1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 886:	89 08                	mov    %ecx,(%eax)
  freep = p;
 888:	a3 40 0f 00 00       	mov    %eax,0xf40
}
 88d:	5b                   	pop    %ebx
 88e:	5e                   	pop    %esi
 88f:	5f                   	pop    %edi
 890:	5d                   	pop    %ebp
 891:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 892:	03 72 04             	add    0x4(%edx),%esi
 895:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 898:	8b 10                	mov    (%eax),%edx
 89a:	8b 12                	mov    (%edx),%edx
 89c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 89f:	eb db                	jmp    87c <free+0x3e>
    p->s.size += bp->s.size;
 8a1:	03 53 fc             	add    -0x4(%ebx),%edx
 8a4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8aa:	89 10                	mov    %edx,(%eax)
 8ac:	eb da                	jmp    888 <free+0x4a>

000008ae <morecore>:

static Header*
morecore(uint nu)
{
 8ae:	55                   	push   %ebp
 8af:	89 e5                	mov    %esp,%ebp
 8b1:	53                   	push   %ebx
 8b2:	83 ec 04             	sub    $0x4,%esp
 8b5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8b7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8bc:	77 05                	ja     8c3 <morecore+0x15>
    nu = 4096;
 8be:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8c3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8ca:	83 ec 0c             	sub    $0xc,%esp
 8cd:	50                   	push   %eax
 8ce:	e8 38 fd ff ff       	call   60b <sbrk>
  if(p == (char*)-1)
 8d3:	83 c4 10             	add    $0x10,%esp
 8d6:	83 f8 ff             	cmp    $0xffffffff,%eax
 8d9:	74 1c                	je     8f7 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8db:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8de:	83 c0 08             	add    $0x8,%eax
 8e1:	83 ec 0c             	sub    $0xc,%esp
 8e4:	50                   	push   %eax
 8e5:	e8 54 ff ff ff       	call   83e <free>
  return freep;
 8ea:	a1 40 0f 00 00       	mov    0xf40,%eax
 8ef:	83 c4 10             	add    $0x10,%esp
}
 8f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8f5:	c9                   	leave  
 8f6:	c3                   	ret    
    return 0;
 8f7:	b8 00 00 00 00       	mov    $0x0,%eax
 8fc:	eb f4                	jmp    8f2 <morecore+0x44>

000008fe <malloc>:

void*
malloc(uint nbytes)
{
 8fe:	55                   	push   %ebp
 8ff:	89 e5                	mov    %esp,%ebp
 901:	53                   	push   %ebx
 902:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 905:	8b 45 08             	mov    0x8(%ebp),%eax
 908:	8d 58 07             	lea    0x7(%eax),%ebx
 90b:	c1 eb 03             	shr    $0x3,%ebx
 90e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 911:	8b 0d 40 0f 00 00    	mov    0xf40,%ecx
 917:	85 c9                	test   %ecx,%ecx
 919:	74 04                	je     91f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91b:	8b 01                	mov    (%ecx),%eax
 91d:	eb 4a                	jmp    969 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 91f:	c7 05 40 0f 00 00 44 	movl   $0xf44,0xf40
 926:	0f 00 00 
 929:	c7 05 44 0f 00 00 44 	movl   $0xf44,0xf44
 930:	0f 00 00 
    base.s.size = 0;
 933:	c7 05 48 0f 00 00 00 	movl   $0x0,0xf48
 93a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 93d:	b9 44 0f 00 00       	mov    $0xf44,%ecx
 942:	eb d7                	jmp    91b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 944:	74 19                	je     95f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 946:	29 da                	sub    %ebx,%edx
 948:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 94b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 94e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 951:	89 0d 40 0f 00 00    	mov    %ecx,0xf40
      return (void*)(p + 1);
 957:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 95a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 95d:	c9                   	leave  
 95e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 95f:	8b 10                	mov    (%eax),%edx
 961:	89 11                	mov    %edx,(%ecx)
 963:	eb ec                	jmp    951 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 965:	89 c1                	mov    %eax,%ecx
 967:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 969:	8b 50 04             	mov    0x4(%eax),%edx
 96c:	39 da                	cmp    %ebx,%edx
 96e:	73 d4                	jae    944 <malloc+0x46>
    if(p == freep)
 970:	39 05 40 0f 00 00    	cmp    %eax,0xf40
 976:	75 ed                	jne    965 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 978:	89 d8                	mov    %ebx,%eax
 97a:	e8 2f ff ff ff       	call   8ae <morecore>
 97f:	85 c0                	test   %eax,%eax
 981:	75 e2                	jne    965 <malloc+0x67>
 983:	eb d5                	jmp    95a <malloc+0x5c>
