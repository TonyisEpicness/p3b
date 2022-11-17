
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

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
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit();
  3d:	e8 b1 05 00 00       	call   5f3 <exit>
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 c0 0a 00 00       	push   $0xac0
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 9f 05 00 00       	call   5f3 <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 bf 03 00 00       	call   430 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 96 03 00 00       	call   430 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 85 03 00 00       	call   430 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 d4 0e 00 00       	push   $0xed4
  b5:	e8 06 05 00 00       	call   5c0 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 6e 03 00 00       	call   430 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb d4 0e 00 00       	mov    $0xed4,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 5f 03 00 00       	call   430 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 d4 0e 00 00       	add    $0xed4,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 77 03 00 00       	call   460 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 1c 05 00 00       	call   633 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 17 05 00 00       	call   64b <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 c1 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 64                	je     1b0 <ls+0xb0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	74 1e                	je     170 <ls+0x70>
  close(fd);
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	53                   	push   %ebx
 156:	e8 c0 04 00 00       	call   61b <close>
 15b:	83 c4 10             	add    $0x10,%esp
}
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 a0 0a 00 00       	push   $0xaa0
 19d:	6a 01                	push   $0x1
 19f:	e8 ac 05 00 00       	call   750 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb a9                	jmp    152 <ls+0x52>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 77 02 00 00       	call   430 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 c6 01 00 00       	call   3a0 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 4e 02 00 00       	call   430 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 f9 03 00 00       	call   60b <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 34 ff ff ff    	jne    152 <ls+0x52>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 23a:	e8 81 03 00 00       	call   5c0 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 de 02 00 00       	call   530 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 a0 0a 00 00       	push   $0xaa0
 2a7:	6a 01                	push   $0x1
 2a9:	e8 a2 04 00 00       	call   750 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 78 0a 00 00       	push   $0xa78
 2c9:	6a 02                	push   $0x2
 2cb:	e8 80 04 00 00       	call   750 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 ad 0a 00 00       	push   $0xaad
 2e8:	6a 01                	push   $0x1
 2ea:	e8 61 04 00 00       	call   750 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5b fe ff ff       	jmp    152 <ls+0x52>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 8c 0a 00 00       	push   $0xa8c
 309:	6a 02                	push   $0x2
 30b:	e8 40 04 00 00       	call   750 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 03 03 00 00       	call   61b <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 8c 0a 00 00       	push   $0xa8c
 331:	6a 01                	push   $0x1
 333:	e8 18 04 00 00       	call   750 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <test_and_set>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int test_and_set(int *old_ptr, int new_ptr) {
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  *old_ptr = new_ptr;
 346:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *old_ptr;
 349:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 34b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 34d:	5d                   	pop    %ebp
 34e:	89 d0                	mov    %edx,%eax
 350:	c3                   	ret    
 351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <lock_acquire>:

void lock_acquire(lock_t *lock){
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 45 08             	mov    0x8(%ebp),%eax
  while(test_and_set(&lock->flag, 1) == 1)
 366:	83 38 01             	cmpl   $0x1,(%eax)
 369:	75 05                	jne    370 <lock_acquire+0x10>
 36b:	eb fe                	jmp    36b <lock_acquire+0xb>
 36d:	8d 76 00             	lea    0x0(%esi),%esi
 370:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 376:	5d                   	pop    %ebp
 377:	c3                   	ret    
 378:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <lock_release>:

void lock_release(lock_t *lock) {
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 383:	8b 45 08             	mov    0x8(%ebp),%eax
 386:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 38c:	5d                   	pop    %ebp
 38d:	c3                   	ret    
 38e:	66 90                	xchg   %ax,%ax

00000390 <lock_init>:
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 45 08             	mov    0x8(%ebp),%eax
 396:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 39c:	5d                   	pop    %ebp
 39d:	c3                   	ret    
 39e:	66 90                	xchg   %ax,%ax

000003a0 <strcpy>:
  lock->flag = 0;
}

char*
strcpy(char *s, const char *t)
{
 3a0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3a1:	31 c0                	xor    %eax,%eax
{
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	53                   	push   %ebx
 3a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 3b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	84 d2                	test   %dl,%dl
 3bc:	75 f2                	jne    3b0 <strcpy+0x10>
    ;
  return os;
}
 3be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c1:	89 c8                	mov    %ecx,%eax
 3c3:	c9                   	leave  
 3c4:	c3                   	ret    
 3c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 55 08             	mov    0x8(%ebp),%edx
 3d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3da:	0f b6 02             	movzbl (%edx),%eax
 3dd:	84 c0                	test   %al,%al
 3df:	75 17                	jne    3f8 <strcmp+0x28>
 3e1:	eb 3a                	jmp    41d <strcmp+0x4d>
 3e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3e7:	90                   	nop
 3e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3ec:	83 c2 01             	add    $0x1,%edx
 3ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3f2:	84 c0                	test   %al,%al
 3f4:	74 1a                	je     410 <strcmp+0x40>
    p++, q++;
 3f6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 3f8:	0f b6 19             	movzbl (%ecx),%ebx
 3fb:	38 c3                	cmp    %al,%bl
 3fd:	74 e9                	je     3e8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3ff:	29 d8                	sub    %ebx,%eax
}
 401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 404:	c9                   	leave  
 405:	c3                   	ret    
 406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 410:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 414:	31 c0                	xor    %eax,%eax
 416:	29 d8                	sub    %ebx,%eax
}
 418:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 41b:	c9                   	leave  
 41c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 41d:	0f b6 19             	movzbl (%ecx),%ebx
 420:	31 c0                	xor    %eax,%eax
 422:	eb db                	jmp    3ff <strcmp+0x2f>
 424:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <strlen>:

uint
strlen(const char *s)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 436:	80 3a 00             	cmpb   $0x0,(%edx)
 439:	74 15                	je     450 <strlen+0x20>
 43b:	31 c0                	xor    %eax,%eax
 43d:	8d 76 00             	lea    0x0(%esi),%esi
 440:	83 c0 01             	add    $0x1,%eax
 443:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 447:	89 c1                	mov    %eax,%ecx
 449:	75 f5                	jne    440 <strlen+0x10>
    ;
  return n;
}
 44b:	89 c8                	mov    %ecx,%eax
 44d:	5d                   	pop    %ebp
 44e:	c3                   	ret    
 44f:	90                   	nop
  for(n = 0; s[n]; n++)
 450:	31 c9                	xor    %ecx,%ecx
}
 452:	5d                   	pop    %ebp
 453:	89 c8                	mov    %ecx,%eax
 455:	c3                   	ret    
 456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi

00000460 <memset>:

void*
memset(void *dst, int c, uint n)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 467:	8b 4d 10             	mov    0x10(%ebp),%ecx
 46a:	8b 45 0c             	mov    0xc(%ebp),%eax
 46d:	89 d7                	mov    %edx,%edi
 46f:	fc                   	cld    
 470:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 472:	8b 7d fc             	mov    -0x4(%ebp),%edi
 475:	89 d0                	mov    %edx,%eax
 477:	c9                   	leave  
 478:	c3                   	ret    
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000480 <strchr>:

char*
strchr(const char *s, char c)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 48a:	0f b6 10             	movzbl (%eax),%edx
 48d:	84 d2                	test   %dl,%dl
 48f:	75 12                	jne    4a3 <strchr+0x23>
 491:	eb 1d                	jmp    4b0 <strchr+0x30>
 493:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 497:	90                   	nop
 498:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 49c:	83 c0 01             	add    $0x1,%eax
 49f:	84 d2                	test   %dl,%dl
 4a1:	74 0d                	je     4b0 <strchr+0x30>
    if(*s == c)
 4a3:	38 d1                	cmp    %dl,%cl
 4a5:	75 f1                	jne    498 <strchr+0x18>
      return (char*)s;
  return 0;
}
 4a7:	5d                   	pop    %ebp
 4a8:	c3                   	ret    
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4b0:	31 c0                	xor    %eax,%eax
}
 4b2:	5d                   	pop    %ebp
 4b3:	c3                   	ret    
 4b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop

000004c0 <gets>:

char*
gets(char *buf, int max)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4c5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 4c8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 4c9:	31 db                	xor    %ebx,%ebx
{
 4cb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 4ce:	eb 27                	jmp    4f7 <gets+0x37>
    cc = read(0, &c, 1);
 4d0:	83 ec 04             	sub    $0x4,%esp
 4d3:	6a 01                	push   $0x1
 4d5:	57                   	push   %edi
 4d6:	6a 00                	push   $0x0
 4d8:	e8 2e 01 00 00       	call   60b <read>
    if(cc < 1)
 4dd:	83 c4 10             	add    $0x10,%esp
 4e0:	85 c0                	test   %eax,%eax
 4e2:	7e 1d                	jle    501 <gets+0x41>
      break;
    buf[i++] = c;
 4e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4e8:	8b 55 08             	mov    0x8(%ebp),%edx
 4eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4ef:	3c 0a                	cmp    $0xa,%al
 4f1:	74 1d                	je     510 <gets+0x50>
 4f3:	3c 0d                	cmp    $0xd,%al
 4f5:	74 19                	je     510 <gets+0x50>
  for(i=0; i+1 < max; ){
 4f7:	89 de                	mov    %ebx,%esi
 4f9:	83 c3 01             	add    $0x1,%ebx
 4fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4ff:	7c cf                	jl     4d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 501:	8b 45 08             	mov    0x8(%ebp),%eax
 504:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 508:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50b:	5b                   	pop    %ebx
 50c:	5e                   	pop    %esi
 50d:	5f                   	pop    %edi
 50e:	5d                   	pop    %ebp
 50f:	c3                   	ret    
  buf[i] = '\0';
 510:	8b 45 08             	mov    0x8(%ebp),%eax
 513:	89 de                	mov    %ebx,%esi
 515:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 519:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5f                   	pop    %edi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret    
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop

00000530 <stat>:

int
stat(const char *n, struct stat *st)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	56                   	push   %esi
 534:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 535:	83 ec 08             	sub    $0x8,%esp
 538:	6a 00                	push   $0x0
 53a:	ff 75 08             	push   0x8(%ebp)
 53d:	e8 f1 00 00 00       	call   633 <open>
  if(fd < 0)
 542:	83 c4 10             	add    $0x10,%esp
 545:	85 c0                	test   %eax,%eax
 547:	78 27                	js     570 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 549:	83 ec 08             	sub    $0x8,%esp
 54c:	ff 75 0c             	push   0xc(%ebp)
 54f:	89 c3                	mov    %eax,%ebx
 551:	50                   	push   %eax
 552:	e8 f4 00 00 00       	call   64b <fstat>
  close(fd);
 557:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 55a:	89 c6                	mov    %eax,%esi
  close(fd);
 55c:	e8 ba 00 00 00       	call   61b <close>
  return r;
 561:	83 c4 10             	add    $0x10,%esp
}
 564:	8d 65 f8             	lea    -0x8(%ebp),%esp
 567:	89 f0                	mov    %esi,%eax
 569:	5b                   	pop    %ebx
 56a:	5e                   	pop    %esi
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret    
 56d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 570:	be ff ff ff ff       	mov    $0xffffffff,%esi
 575:	eb ed                	jmp    564 <stat+0x34>
 577:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57e:	66 90                	xchg   %ax,%ax

00000580 <atoi>:

int
atoi(const char *s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 587:	0f be 02             	movsbl (%edx),%eax
 58a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 58d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 590:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 595:	77 1e                	ja     5b5 <atoi+0x35>
 597:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 5a0:	83 c2 01             	add    $0x1,%edx
 5a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 5aa:	0f be 02             	movsbl (%edx),%eax
 5ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5b0:	80 fb 09             	cmp    $0x9,%bl
 5b3:	76 eb                	jbe    5a0 <atoi+0x20>
  return n;
}
 5b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5b8:	89 c8                	mov    %ecx,%eax
 5ba:	c9                   	leave  
 5bb:	c3                   	ret    
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	8b 45 10             	mov    0x10(%ebp),%eax
 5c7:	8b 55 08             	mov    0x8(%ebp),%edx
 5ca:	56                   	push   %esi
 5cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ce:	85 c0                	test   %eax,%eax
 5d0:	7e 13                	jle    5e5 <memmove+0x25>
 5d2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5d4:	89 d7                	mov    %edx,%edi
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5e1:	39 f8                	cmp    %edi,%eax
 5e3:	75 fb                	jne    5e0 <memmove+0x20>
  return vdst;
}
 5e5:	5e                   	pop    %esi
 5e6:	89 d0                	mov    %edx,%eax
 5e8:	5f                   	pop    %edi
 5e9:	5d                   	pop    %ebp
 5ea:	c3                   	ret    

000005eb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5eb:	b8 01 00 00 00       	mov    $0x1,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <exit>:
SYSCALL(exit)
 5f3:	b8 02 00 00 00       	mov    $0x2,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <wait>:
SYSCALL(wait)
 5fb:	b8 03 00 00 00       	mov    $0x3,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <pipe>:
SYSCALL(pipe)
 603:	b8 04 00 00 00       	mov    $0x4,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <read>:
SYSCALL(read)
 60b:	b8 05 00 00 00       	mov    $0x5,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <write>:
SYSCALL(write)
 613:	b8 10 00 00 00       	mov    $0x10,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <close>:
SYSCALL(close)
 61b:	b8 15 00 00 00       	mov    $0x15,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <kill>:
SYSCALL(kill)
 623:	b8 06 00 00 00       	mov    $0x6,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <exec>:
SYSCALL(exec)
 62b:	b8 07 00 00 00       	mov    $0x7,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <open>:
SYSCALL(open)
 633:	b8 0f 00 00 00       	mov    $0xf,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <mknod>:
SYSCALL(mknod)
 63b:	b8 11 00 00 00       	mov    $0x11,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <unlink>:
SYSCALL(unlink)
 643:	b8 12 00 00 00       	mov    $0x12,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <fstat>:
SYSCALL(fstat)
 64b:	b8 08 00 00 00       	mov    $0x8,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <link>:
SYSCALL(link)
 653:	b8 13 00 00 00       	mov    $0x13,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <mkdir>:
SYSCALL(mkdir)
 65b:	b8 14 00 00 00       	mov    $0x14,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <chdir>:
SYSCALL(chdir)
 663:	b8 09 00 00 00       	mov    $0x9,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <dup>:
SYSCALL(dup)
 66b:	b8 0a 00 00 00       	mov    $0xa,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <getpid>:
SYSCALL(getpid)
 673:	b8 0b 00 00 00       	mov    $0xb,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <sbrk>:
SYSCALL(sbrk)
 67b:	b8 0c 00 00 00       	mov    $0xc,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <sleep>:
SYSCALL(sleep)
 683:	b8 0d 00 00 00       	mov    $0xd,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <uptime>:
SYSCALL(uptime)
 68b:	b8 0e 00 00 00       	mov    $0xe,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    
 693:	66 90                	xchg   %ax,%ax
 695:	66 90                	xchg   %ax,%ax
 697:	66 90                	xchg   %ax,%ax
 699:	66 90                	xchg   %ax,%ax
 69b:	66 90                	xchg   %ax,%ax
 69d:	66 90                	xchg   %ax,%ax
 69f:	90                   	nop

000006a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 3c             	sub    $0x3c,%esp
 6a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6ac:	89 d1                	mov    %edx,%ecx
{
 6ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 6b1:	85 d2                	test   %edx,%edx
 6b3:	0f 89 7f 00 00 00    	jns    738 <printint+0x98>
 6b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6bd:	74 79                	je     738 <printint+0x98>
    neg = 1;
 6bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 6c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 6c8:	31 db                	xor    %ebx,%ebx
 6ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6d0:	89 c8                	mov    %ecx,%eax
 6d2:	31 d2                	xor    %edx,%edx
 6d4:	89 cf                	mov    %ecx,%edi
 6d6:	f7 75 c4             	divl   -0x3c(%ebp)
 6d9:	0f b6 92 24 0b 00 00 	movzbl 0xb24(%edx),%edx
 6e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6e3:	89 d8                	mov    %ebx,%eax
 6e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6f1:	76 dd                	jbe    6d0 <printint+0x30>
  if(neg)
 6f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6f6:	85 c9                	test   %ecx,%ecx
 6f8:	74 0c                	je     706 <printint+0x66>
    buf[i++] = '-';
 6fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 701:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 706:	8b 7d b8             	mov    -0x48(%ebp),%edi
 709:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 70d:	eb 07                	jmp    716 <printint+0x76>
 70f:	90                   	nop
    putc(fd, buf[i]);
 710:	0f b6 13             	movzbl (%ebx),%edx
 713:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 716:	83 ec 04             	sub    $0x4,%esp
 719:	88 55 d7             	mov    %dl,-0x29(%ebp)
 71c:	6a 01                	push   $0x1
 71e:	56                   	push   %esi
 71f:	57                   	push   %edi
 720:	e8 ee fe ff ff       	call   613 <write>
  while(--i >= 0)
 725:	83 c4 10             	add    $0x10,%esp
 728:	39 de                	cmp    %ebx,%esi
 72a:	75 e4                	jne    710 <printint+0x70>
}
 72c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 72f:	5b                   	pop    %ebx
 730:	5e                   	pop    %esi
 731:	5f                   	pop    %edi
 732:	5d                   	pop    %ebp
 733:	c3                   	ret    
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 738:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 73f:	eb 87                	jmp    6c8 <printint+0x28>
 741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 748:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74f:	90                   	nop

00000750 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 759:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 75c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 75f:	0f b6 13             	movzbl (%ebx),%edx
 762:	84 d2                	test   %dl,%dl
 764:	74 6a                	je     7d0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 766:	8d 45 10             	lea    0x10(%ebp),%eax
 769:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 76c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 76f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 771:	89 45 d0             	mov    %eax,-0x30(%ebp)
 774:	eb 36                	jmp    7ac <printf+0x5c>
 776:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77d:	8d 76 00             	lea    0x0(%esi),%esi
 780:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 783:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 788:	83 f8 25             	cmp    $0x25,%eax
 78b:	74 15                	je     7a2 <printf+0x52>
  write(fd, &c, 1);
 78d:	83 ec 04             	sub    $0x4,%esp
 790:	88 55 e7             	mov    %dl,-0x19(%ebp)
 793:	6a 01                	push   $0x1
 795:	57                   	push   %edi
 796:	56                   	push   %esi
 797:	e8 77 fe ff ff       	call   613 <write>
 79c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 79f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7a2:	0f b6 13             	movzbl (%ebx),%edx
 7a5:	83 c3 01             	add    $0x1,%ebx
 7a8:	84 d2                	test   %dl,%dl
 7aa:	74 24                	je     7d0 <printf+0x80>
    c = fmt[i] & 0xff;
 7ac:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 7af:	85 c9                	test   %ecx,%ecx
 7b1:	74 cd                	je     780 <printf+0x30>
      }
    } else if(state == '%'){
 7b3:	83 f9 25             	cmp    $0x25,%ecx
 7b6:	75 ea                	jne    7a2 <printf+0x52>
      if(c == 'd'){
 7b8:	83 f8 25             	cmp    $0x25,%eax
 7bb:	0f 84 07 01 00 00    	je     8c8 <printf+0x178>
 7c1:	83 e8 63             	sub    $0x63,%eax
 7c4:	83 f8 15             	cmp    $0x15,%eax
 7c7:	77 17                	ja     7e0 <printf+0x90>
 7c9:	ff 24 85 cc 0a 00 00 	jmp    *0xacc(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7d3:	5b                   	pop    %ebx
 7d4:	5e                   	pop    %esi
 7d5:	5f                   	pop    %edi
 7d6:	5d                   	pop    %ebp
 7d7:	c3                   	ret    
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
  write(fd, &c, 1);
 7e0:	83 ec 04             	sub    $0x4,%esp
 7e3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 7e6:	6a 01                	push   $0x1
 7e8:	57                   	push   %edi
 7e9:	56                   	push   %esi
 7ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7ee:	e8 20 fe ff ff       	call   613 <write>
        putc(fd, c);
 7f3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 7f7:	83 c4 0c             	add    $0xc,%esp
 7fa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7fd:	6a 01                	push   $0x1
 7ff:	57                   	push   %edi
 800:	56                   	push   %esi
 801:	e8 0d fe ff ff       	call   613 <write>
        putc(fd, c);
 806:	83 c4 10             	add    $0x10,%esp
      state = 0;
 809:	31 c9                	xor    %ecx,%ecx
 80b:	eb 95                	jmp    7a2 <printf+0x52>
 80d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 810:	83 ec 0c             	sub    $0xc,%esp
 813:	b9 10 00 00 00       	mov    $0x10,%ecx
 818:	6a 00                	push   $0x0
 81a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 81d:	8b 10                	mov    (%eax),%edx
 81f:	89 f0                	mov    %esi,%eax
 821:	e8 7a fe ff ff       	call   6a0 <printint>
        ap++;
 826:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 82a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 82d:	31 c9                	xor    %ecx,%ecx
 82f:	e9 6e ff ff ff       	jmp    7a2 <printf+0x52>
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 838:	8b 45 d0             	mov    -0x30(%ebp),%eax
 83b:	8b 10                	mov    (%eax),%edx
        ap++;
 83d:	83 c0 04             	add    $0x4,%eax
 840:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 843:	85 d2                	test   %edx,%edx
 845:	0f 84 8d 00 00 00    	je     8d8 <printf+0x188>
        while(*s != 0){
 84b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 84e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 850:	84 c0                	test   %al,%al
 852:	0f 84 4a ff ff ff    	je     7a2 <printf+0x52>
 858:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 85b:	89 d3                	mov    %edx,%ebx
 85d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 860:	83 ec 04             	sub    $0x4,%esp
          s++;
 863:	83 c3 01             	add    $0x1,%ebx
 866:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 869:	6a 01                	push   $0x1
 86b:	57                   	push   %edi
 86c:	56                   	push   %esi
 86d:	e8 a1 fd ff ff       	call   613 <write>
        while(*s != 0){
 872:	0f b6 03             	movzbl (%ebx),%eax
 875:	83 c4 10             	add    $0x10,%esp
 878:	84 c0                	test   %al,%al
 87a:	75 e4                	jne    860 <printf+0x110>
      state = 0;
 87c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 87f:	31 c9                	xor    %ecx,%ecx
 881:	e9 1c ff ff ff       	jmp    7a2 <printf+0x52>
 886:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 88d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 890:	83 ec 0c             	sub    $0xc,%esp
 893:	b9 0a 00 00 00       	mov    $0xa,%ecx
 898:	6a 01                	push   $0x1
 89a:	e9 7b ff ff ff       	jmp    81a <printf+0xca>
 89f:	90                   	nop
        putc(fd, *ap);
 8a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 8a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8a6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 8a8:	6a 01                	push   $0x1
 8aa:	57                   	push   %edi
 8ab:	56                   	push   %esi
        putc(fd, *ap);
 8ac:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8af:	e8 5f fd ff ff       	call   613 <write>
        ap++;
 8b4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8bb:	31 c9                	xor    %ecx,%ecx
 8bd:	e9 e0 fe ff ff       	jmp    7a2 <printf+0x52>
 8c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 8c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 8cb:	83 ec 04             	sub    $0x4,%esp
 8ce:	e9 2a ff ff ff       	jmp    7fd <printf+0xad>
 8d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8d7:	90                   	nop
          s = "(null)";
 8d8:	ba c2 0a 00 00       	mov    $0xac2,%edx
        while(*s != 0){
 8dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8e0:	b8 28 00 00 00       	mov    $0x28,%eax
 8e5:	89 d3                	mov    %edx,%ebx
 8e7:	e9 74 ff ff ff       	jmp    860 <printf+0x110>
 8ec:	66 90                	xchg   %ax,%ax
 8ee:	66 90                	xchg   %ax,%ax

000008f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f1:	a1 e4 0e 00 00       	mov    0xee4,%eax
{
 8f6:	89 e5                	mov    %esp,%ebp
 8f8:	57                   	push   %edi
 8f9:	56                   	push   %esi
 8fa:	53                   	push   %ebx
 8fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 908:	89 c2                	mov    %eax,%edx
 90a:	8b 00                	mov    (%eax),%eax
 90c:	39 ca                	cmp    %ecx,%edx
 90e:	73 30                	jae    940 <free+0x50>
 910:	39 c1                	cmp    %eax,%ecx
 912:	72 04                	jb     918 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 914:	39 c2                	cmp    %eax,%edx
 916:	72 f0                	jb     908 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 918:	8b 73 fc             	mov    -0x4(%ebx),%esi
 91b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 91e:	39 f8                	cmp    %edi,%eax
 920:	74 30                	je     952 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 922:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 925:	8b 42 04             	mov    0x4(%edx),%eax
 928:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 92b:	39 f1                	cmp    %esi,%ecx
 92d:	74 3a                	je     969 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 92f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 931:	5b                   	pop    %ebx
  freep = p;
 932:	89 15 e4 0e 00 00    	mov    %edx,0xee4
}
 938:	5e                   	pop    %esi
 939:	5f                   	pop    %edi
 93a:	5d                   	pop    %ebp
 93b:	c3                   	ret    
 93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 940:	39 c2                	cmp    %eax,%edx
 942:	72 c4                	jb     908 <free+0x18>
 944:	39 c1                	cmp    %eax,%ecx
 946:	73 c0                	jae    908 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 948:	8b 73 fc             	mov    -0x4(%ebx),%esi
 94b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 94e:	39 f8                	cmp    %edi,%eax
 950:	75 d0                	jne    922 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 952:	03 70 04             	add    0x4(%eax),%esi
 955:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 958:	8b 02                	mov    (%edx),%eax
 95a:	8b 00                	mov    (%eax),%eax
 95c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 95f:	8b 42 04             	mov    0x4(%edx),%eax
 962:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 965:	39 f1                	cmp    %esi,%ecx
 967:	75 c6                	jne    92f <free+0x3f>
    p->s.size += bp->s.size;
 969:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 96c:	89 15 e4 0e 00 00    	mov    %edx,0xee4
    p->s.size += bp->s.size;
 972:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 975:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 978:	89 0a                	mov    %ecx,(%edx)
}
 97a:	5b                   	pop    %ebx
 97b:	5e                   	pop    %esi
 97c:	5f                   	pop    %edi
 97d:	5d                   	pop    %ebp
 97e:	c3                   	ret    
 97f:	90                   	nop

00000980 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
 983:	57                   	push   %edi
 984:	56                   	push   %esi
 985:	53                   	push   %ebx
 986:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 989:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 98c:	8b 3d e4 0e 00 00    	mov    0xee4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 992:	8d 70 07             	lea    0x7(%eax),%esi
 995:	c1 ee 03             	shr    $0x3,%esi
 998:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 99b:	85 ff                	test   %edi,%edi
 99d:	0f 84 9d 00 00 00    	je     a40 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 9a5:	8b 4a 04             	mov    0x4(%edx),%ecx
 9a8:	39 f1                	cmp    %esi,%ecx
 9aa:	73 6a                	jae    a16 <malloc+0x96>
 9ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9b1:	39 de                	cmp    %ebx,%esi
 9b3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 9b6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 9c0:	eb 17                	jmp    9d9 <malloc+0x59>
 9c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9ca:	8b 48 04             	mov    0x4(%eax),%ecx
 9cd:	39 f1                	cmp    %esi,%ecx
 9cf:	73 4f                	jae    a20 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9d1:	8b 3d e4 0e 00 00    	mov    0xee4,%edi
 9d7:	89 c2                	mov    %eax,%edx
 9d9:	39 d7                	cmp    %edx,%edi
 9db:	75 eb                	jne    9c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9dd:	83 ec 0c             	sub    $0xc,%esp
 9e0:	ff 75 e4             	push   -0x1c(%ebp)
 9e3:	e8 93 fc ff ff       	call   67b <sbrk>
  if(p == (char*)-1)
 9e8:	83 c4 10             	add    $0x10,%esp
 9eb:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ee:	74 1c                	je     a0c <malloc+0x8c>
  hp->s.size = nu;
 9f0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9f3:	83 ec 0c             	sub    $0xc,%esp
 9f6:	83 c0 08             	add    $0x8,%eax
 9f9:	50                   	push   %eax
 9fa:	e8 f1 fe ff ff       	call   8f0 <free>
  return freep;
 9ff:	8b 15 e4 0e 00 00    	mov    0xee4,%edx
      if((p = morecore(nunits)) == 0)
 a05:	83 c4 10             	add    $0x10,%esp
 a08:	85 d2                	test   %edx,%edx
 a0a:	75 bc                	jne    9c8 <malloc+0x48>
        return 0;
  }
}
 a0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a0f:	31 c0                	xor    %eax,%eax
}
 a11:	5b                   	pop    %ebx
 a12:	5e                   	pop    %esi
 a13:	5f                   	pop    %edi
 a14:	5d                   	pop    %ebp
 a15:	c3                   	ret    
    if(p->s.size >= nunits){
 a16:	89 d0                	mov    %edx,%eax
 a18:	89 fa                	mov    %edi,%edx
 a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a20:	39 ce                	cmp    %ecx,%esi
 a22:	74 4c                	je     a70 <malloc+0xf0>
        p->s.size -= nunits;
 a24:	29 f1                	sub    %esi,%ecx
 a26:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a29:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a2c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a2f:	89 15 e4 0e 00 00    	mov    %edx,0xee4
}
 a35:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a38:	83 c0 08             	add    $0x8,%eax
}
 a3b:	5b                   	pop    %ebx
 a3c:	5e                   	pop    %esi
 a3d:	5f                   	pop    %edi
 a3e:	5d                   	pop    %ebp
 a3f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 a40:	c7 05 e4 0e 00 00 e8 	movl   $0xee8,0xee4
 a47:	0e 00 00 
    base.s.size = 0;
 a4a:	bf e8 0e 00 00       	mov    $0xee8,%edi
    base.s.ptr = freep = prevp = &base;
 a4f:	c7 05 e8 0e 00 00 e8 	movl   $0xee8,0xee8
 a56:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a59:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 a5b:	c7 05 ec 0e 00 00 00 	movl   $0x0,0xeec
 a62:	00 00 00 
    if(p->s.size >= nunits){
 a65:	e9 42 ff ff ff       	jmp    9ac <malloc+0x2c>
 a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a70:	8b 08                	mov    (%eax),%ecx
 a72:	89 0a                	mov    %ecx,(%edx)
 a74:	eb b9                	jmp    a2f <malloc+0xaf>
