## Linux Terminal 명령어 정리

Mac Terminal에서 자주 사용하는 명령어들을 정리한 파일입니다.

### `pwd`

- 현재 위치한 경로를 표시

- brew에서 설치 가능한 `tree`와 비슷하지만 `tree`는 해당 명령어를 실행한 위치의 하위 디렉토리의 구조를 시각화해서 보여준다.

```bash
 > pwd                                                           /Users/chungyeonkim/Desktop/shell-study/command
```

### `clear`

- terminal 작업창을 꺠끗하게 비워준다.

### `ls`

- 현재 디렉토리 하위에 위치한 파일 및 디렉토리 표시

```bash
> ls
README.md command   condition control   loop      test.sh
```

- `ls -a`

  - 숨겨져 있는 파일도 표시

  - ex) .DS_Store

- `ls -l`

  - 파일 및 디렉토리의 정보도 같이 표시

- `ls -la`
  - 숨겨진 파일 및 디렉토리의 정보도 같이 표시

### `cd [디렉토리]`

- 입력한 디렉토리로 이동한다.

```bash
~/Desktop/shell-study
> cd command

~/Desktop/shell-study/command
```

- `cd ..`

  - 한 칸 상위 디렉토리로 이동

- `cd ~` , `cd`

  - 최상위 경로로 이동

- `cd -`
  - 이전에 있었던 디렉토리로 이동

### `open .`

- 현재 파일 / 디렉토리를 연다.

### `find [파일이름 또는 디렉토리이름]`

- 입력한 문자열이 포함된 이름의 파일 또는 디렉토리를 찾을 수 있다.

```bash
> find loop
loop
loop/loop.sh
loop/README.md
```

### `which [파일이름]`

- 입력한 문자열을 이름으로 가진 파일의 위치를 표시한다.

```bash
> which node
/usr/local/bin/node

> which nest
/opt/homebrew/bin/nest
```

### `touch [파일이름]`

- 입력한 문자열을 이름으로 가지는 파일을 생성한다.

### `cat [파일이름] ~~~`

- 입력한 이름의 파일 내용을 확인한다. (여러개를 동시에 확인이 가능하다.)

```bash
> cat test.sh

#! /bin/zsh

A=1
B="문자 1"
C=`ls`

echo "숫자 1을 출력한다"
echo $A
echo "문자열 1을 출력한다"
echo $B
echo "ls 명령어의 결과물을 출력한다"
echo $C
```

### `echo [문자열]`

- 입력한 문자열을 터미널창에 출력한다.

- `echo [문자열]> [파일이름]`

  - 입력한 문자열을 해당 파일에 덮어씌운다 (이미 파일에 내용이 있어도 입력한
    문자열로 덮어씌워짐)

- `echo [문자열] >> [파일이름]`

  - 입력한 문자열을 해당파일의 맨 뒤에 이어서 입력한다. (덮어쓰기 X)

### `mkdir [문자열]`

- 입력한 문자열을 이름으로 가지는 디렉토리를 생성한다.

- `mkdir -p [문자열] / [문자열] ~~`

- 입력한 문자열대로 디렉토리 경로를 생성한다.
