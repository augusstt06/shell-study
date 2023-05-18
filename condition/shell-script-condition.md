## 조건문

Shell Script에서도 if 조건문을 사용할 수 있다.
이때 띄어씌기를 유의해야 하는데,
`if [ 조건1 기호 조건2 ]` 처럼 조건과 기호사이에는 공백이 있어야 하며 대괄호에도 공백이 있어야 한다.

또한 명령이 한줄한줄 실행되기 때문에 `;` 세미콜론으로 한줄로 작성할 수 있으나, 코드가 길어지면 오류가 날 가능성이 높기 때문에 줄바꿈을 실시한다.

이제 기본 사용법을 알아보자

```bash
#! /bin/zsh

if [ 조건1 기호 조건2 ]
then
        참일때 명령
else
        거짓일때 명령
fi
```

위처럼 if문을 종료시, `fi`를 입력한다.
여러 조건을 비교하기 위해 `elif`를 사용할시,

```bash
#! /bin/zsh

if [ 값1 조건 조건2 ]
then
elif [ 값3 조건 값4 ]
then
 		참일때 명령
else
        거짓일때 명령
fi
```

으로 사용이 가능하다.

한번 조건문을 작성해보자

```bash
vim condition.sh

#! /bin/zsh
if [ 1 -eq 1 ]
then
        echo yes
else
        echo no
fi

./condition.sh
> yes

```

정상적으로 작동한다.

여기서 아주 중요한 유의점이 있는데, 정수형 변수 비교 연산자와 문자형 변수 비교 연산자를 분리해야 한다는 것이다.
두 연산자를 구분하지 않고 사용할시, 에러메시지가 출력된다.

```bash
#! /bin/zsh

A="test"
B="test"

if [ $A -eq $B ]
then
        echo yes
else
        echo no
fi

~/De/shell-study  ./condition.sh
> ./condition.sh:[:6: integer expression expected: test
no
```

> 정수형 비교 **-eq** 문자형 비교 **=**

다시 작성해보자

```bash
#! /bin/zsh

A="test"
B="test"
C=1
D=1

if [ $A = $B ]
then
        echo "문자형 비교 성공"
else
        echo "문자형 비교 실패"
fi

if [ $C -eq $D ]
then
        echo "정수형 비교 성공"
else
        echo "정수형 비교 실패"
fi

```

이상하게도 `==`사용시 `./condition.sh:8: = not found` 에러가 발생하여 `=`로 바꾸었더니 정상실행된다. 이유에 대해서 좀 더 찾아봐야겠다.

```bash
 ~/De/shell-study ./condition.sh
> 문자형 비교 성공
  정수형 비교 성공

```

등호 이외에 여러 연산자가 존재하는데 아래와 같다.

### 문자열 비교 연산자

| <center>옵션</center> | <center>사용법</center> |   <center>설명<center/> |
| --------------------- | :---------------------: | ----------------------: |
| X                     |        if [ 값 ]        | 빈 문자열이 아니라면 참 |
| =                     |    if [ 값1 = 값2 ]     |       두 값이 같다면 참 |
| !=                    |    if [ 값1 != 값2 ]    |     두 값이 다르다면 참 |
| -n                    |      if [ -n 값 ]       | 값이 null이 아니라면 참 |
| -z                    |      if [ -z 값 ]       |      값이 null이라면 참 |

### 정수형 비교 연산자

| <center>연산자</center> | <center>역할</center> | <center>사용법</center> |                 <center>설명<center/> |
| ----------------------- | :-------------------: | ----------------------: | ------------------------------------: |
| -eq                     |           =           |      if [ 값1 -eq 값2 ] |                     두 값이 같다면 참 |
| -ne                     |          !=           |       if [ 값1 != 값2 ] |                   두 값이 다르다면 참 |
| -gt                     |           >           |      if [ 값1 -gt 값2 ] |                    값1이 더 크다면 참 |
| -ge                     |          >=           |      if [ 값1 -ge 값2 ] |             값1이 더 크거나 같다면 참 |
| -lt                     |           <           |      if [ 값1 -lt 값2 ] |                    값1이 더 작다면 참 |
| -le                     |          <=           |      if [ 값1 -le 값2 ] |             값1이 더 작거나 같다면 참 |
| -a                      |        and(&&)        |   if [ 조건1 -a 조건2 ] | 조건1과 조건2의 값이 모두 참이어야 참 |
| -o                      |          or           |   if [ 조건1 -o 조건2 ] |     조건1 또는 조건2의 값이 참이면 참 |

### 조건문 작성

위의 연산자들을 사용해서 실제로 파일을 작성해보자

```bash
#! /bin/zsh

if [ 1 -eq 1 -a 1 -eq -1 ]
then
        echo true
else
        echo false
fi

if [ 1 -eq 1 -o 1 -eq -1 ]
then
        echo true
else
        echo false
fi
```

`-a` 연산자를 사용하여 두 조건이 둘다 참이어야 true가 출력되는 조건문과 `-o`를 사용하여 두 조건중 하나만 참이어도 true가 출력되는 조건문이다.

```bash
 ~/De/shell-study  ./condition.sh
> false
  true
```

### 파일 조건 연산

기본적인 문자열이나 숫자 말고도 파일을 서로 비교하는 연산자도 존재한다.

| <center>옵션</center> | <center>사용법</center> |                      <center>설명<center/> |
| --------------------- | :---------------------: | -----------------------------------------: |
| -b                    |     if [ -b 파일 ]      |                파일이 블럭 디바이스라면 참 |
| -c                    |     if [ -c 파일 ]      |                파일이 문자 디바이스라면 참 |
| -d                    |     if [ -d 파일 ]      |                     파일이 디렉토리라면 참 |
| -e                    |     if [ -e 파일 ]      |                       파일이 존재한다면 참 |
| -f                    |     if [ -f 파일 ]      |          파일이 존재하고 정규파일이라면 참 |
| -g                    |     if [ -g 파일 ]      |                      파일이 setidg 라면 참 |
| -G                    |     if [ -G 파일 ]      |    파일의 그룹이 현재 사용자 그룹이라면 참 |
| -h                    |     if [ -h 파일 ]      |                     파일이 하드링크라면 참 |
| -k                    |     if [ -k 파일 ]      |                   파일이 Sticky bit라면 참 |
| -L                    |     if [ -L 파일 ]      |                  파일이 심볼릭 링크라면 참 |
| -O                    |     if [ -O 파일 ]      |         파일의 소유자가 현재 사용자라면 참 |
| -P                    |     if [ -P 파일 ]      |   파일의 속성이 파이프라면 참 (prw-r--r--) |
| -r                    |     if [ -r 파일 ]      |    현재 사용자가 읽을수 있는 파일이라면 참 |
| -s                    |     if [ -s 파일 ]      |                  파일이 비어있지 않다면 참 |
| -S                    |     if [ -S 파일 ]      |                파일이 소켓 디바이스라면 참 |
| -t                    |      if [ -t FD ]       |              FD가 열려있는 터미널이라면 참 |
| -u                    |     if [ -u 파일 ]      |                       파일이 setuid라면 참 |
| -w                    |     if [ -w 파일 ]      |     현재 사용자가 쓸 수 있는 파일이라면 참 |
| -x                    |     if [ -x 파일 ]      | 현재 사용자가 실행할 수 있는 파일이라면 참 |
| -nt                   | if [ 파일1 -nt 파일2 ]  |       파일1이 파일2보다 최근 파일이라면 참 |
| -ot                   | if [ 파일1 -ot 파일2 ]  |     파일1이 파일2보다 오래된 파일이라면 참 |
| -ef                   | if [ 파일1 -ef 파일2 ]  |   파일1이 파일2보다 하드링크 파일이라면 참 |

파일 연산자를 이용하여 간단한 스크립트를 작성해보자
현재 디렉토리 안에 "create-dir"이라는 폴더가 없다면 폴더를 생성하고 그 안에 "newfile.sh"라는 파일을 생성하는 스크립트를 작성할 것이다.

현재 디렉토리구조는 이렇다

```bash
ls
> README.md         condition.sh      file_condition.sh test.sh
```

이제 file_condition.sh 파일을 작성해보자

```bash
vim file_condition.sh
#! /bin/zsh

DIR="/Users/chungyeonkim/Desktop/shell-study/create-dir"

if [ ! -d $DIR ]
then
        mkdir $DIR
        if [ -e $DIR/newfile.sh ]
                then
                        echo "이미newfile.sh가 있습니다"
                else
                        touch $DIR/newfile.sh
                        echo "설정한 디렉토리에 newfile.sh를 생성하였습니다."
        fi
else
        echo "해당 경로에 디렉토리가 존재합니다"
fi
```

첫번째 조건문에서 변수 `DIR`에 할당한 디렉토리가 있는지 확인 후, 디렉토리가 없다면 DIR 디렉토리를 생성하고 두번째 조건문으로 넘어간다.
두번째 조건문에서는 `newfile.sh`가 있는지 확인 후, 있다면 문자열을, 없다면 해달 파일을 생성하고 문자열로 알려준다.
한번 파일을 실행해보자

```bash
./file_condition.sh

> 설정한 디렉토리에 newfile.sh를 생성하였습니다.

ls
README.md         create-dir        test.sh
condition.sh      file_condition.sh

cd create-dir

ls
> newfile.sh
```

성공적으로 파일이 실행되어 디렉토리와 파일이 생성되는걸 확인할 수 있다.

내가 모르는 용어가 정말 많다 Sticky bit, 하드링크 setuid 등등.. 공부할게 정말 많다는걸 다시 한번 느낀다.
