이번에 42서울 체크인 미팅을 신청했는데 후에 있을 라피신에서 쉘 스크립트를 사용한다고 하여 미리 접하고 공부해보려 한다.

## 📌 Shell Script

Shell은 운영체제에서 사용자가 입력하는 명령을 읽고 해석하여 실행해 주는 프로그램이다.
즉, 커널과 사용자를 연결해주는 역할을 담당한다.
Shell Script는 Shell에서 사용할 수 있는 명령어들을 모아서 만든 파일이다. 다시말해, Shell을 이용하여 명령어들을 순차적으로 실행시켜주는 인터프리터 라고 생각하면 된다.

Unix와 Linx에서 사용되는 Shell은 `./bash`, `./sh`, `./zsh` 등등이 있다.

```bash
echo $SHELL                  ok  base py  15:08:30
/bin/zsh
```

현재 내가 사용하고 있는 Shell은 `./zsh`이다.

Shell Script를 사용하여 얻는 여러가지 장점이 있다.

- 반복작업의 자동화

- 빠른 속도
  컴파일 단계를 거치지 않기 때문에 디버깅하는 동안 빠른 실행이 가능하다.

## 사용법

이전에 Shell Script를 사용해본적이 없기 때문에 아주 기초적인 부분부터 학습할 예정이다.

### 실행파일 생성 / 편집

Shell Script를 사용하기 위해서는 실행파일을 먼저 생성해야 한다.
`touch test.sh`
의 명령어로 리눅스 실행 파일을 생성할 수 있다.
`vim test.sh`
의 명령어로 생성과 작성을 동시에 실행도 가능하다.

이제 생성도 했으니 한번 실행해보자
실행 명령어는
`./test.sh`

```bash
touch test.sh             ok  base py  15:24:09

ls                        ok  base py  15:24:15
README.md test.sh

./test.sh                 ok  base py  15:24:20
zsh: permission denied: ./test.sh
```

실행 권한이 없다고 표시 되는데 실행파일은 권한을 따로 부여해야 실행파일에 대한 작성과 실행이 가능하다.
`chmod 755 파일이름`
의 명령어로 권한부여가 가능하다.

```bash
chmod 755 test.sh    126 err  base py  15:24:48

./test.sh                 ok  base py  15:26:12

```

아직 파일에 아무것도 작성하지 않았으므로 나타나는 것이 없지만 권한문제는 해결되었다.
파일을 작성해보자
`vim test.sh`

```
#! /bin/zsh

echo "Hello World!"
~
~
~
"test.sh" 3L, 33B
```

위의 코드는 `test.sh` 편집 화면이다.
가장 상위의 `#! /bin/zsh`는 이 Shell Script를 zsh쉘을 사용하여 실행하겠다는 의미이다.
(보통 `#! /bin/bash`를 많이 사용한다고 한다.)
최초 진입시 편집모드로 들어가려면 `i`를 누르면 된다.
추가적으로 `echo` 명령어는 입력한 문자열을 터미널에 출력하는 기능을 한다.

작성을 완료 했다면 `esc`를 입력하여 편집모드를 종료하고 `:wq`를 입력하여 저장하고 파일에서 나간다.
다시 실행해보자

```bash
./test.sh         ok  3m 37s  base py  15:35:30
Hello World!
```

작성한 문자열이 잘 실행되는 것을 볼 수 있다.

### 변수 선언

이제 변수를 해 보자.
생성한 변수는 프로그램이 실행되는 동안 계속해서 사용이 가능하며, 어떤것을 변수에 할당하느냐에 따라 데이터의 크기가 달라진다.
`=`를 사용하여 변수를 할당할 수 있다.

할당된 변수의 데이터를 참조하려면 변수치환을 해야 하는데 `$변수이름`의 명령어로 사용이 가능하다.
추가적으로 큰따옴표안에서 치환을 실시해도 동일하게 작동하는데 반하여, 작은따옴표안에서 치환을 실시하면 치환되지 않아 입력한 문자열이 그대로 출력된다.
만약 변수를 할당하지 않고 치환하게 되면 `null`값을 표시한다.

```bash
#! /bin/zsh

echo "Hello World!"

A=1
B = 2
```

```bash
./test.sh
./test.sh:6: command not found: b
```

변수를 선언할때 위처럼 앞뒤로 공백이 있어선 안된다.

```bash
#! /bin/zsh

echo "Hello World!"

A=1
echo $A
```

```bash
./test.sh
Hello World!
1
```

변수를 성공적으로 선언한것을 볼 수 있다.
추가적으로 Shell에서는 대문자와 소문자를 구별하여 인식하기 때문에 변수 이름을 대문자로 통일해야 코드오류를 피할수 있다. 그리고 되도록 변수선언은 최상단에 위치하여 수정과 가독성을 좋게 유지해야 한다.

문자변수를 선언할시에는 큰 따옴표 `"~~"`를, 숫자변수를 선언할시에는 따옴표 없이 선언한다.

```bash
#! /bin/zsh

echo "Hello World!"

A=1
B="문자 1"
echo $A
echo $B
```

```bash
./test.sh            ok  12s  base py  15:49:11

Hello World!
1
문자 1
```

숫자와 문자 말고도 명령어로 실행해서 나온 값을 변수에 할당할수도 있다.
이때, 변수에 사용될 명령어는 백틱으로 묶어서 사용한다.

```bash
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

```bash
./test.sh          ok  1m 9s  base py  15:52:43

숫자 1을 출력한다
1
문자열 1을 출력한다
문자 1
ls 명령어의 결과물을 출력한다
README.md
test.sh
```

---

**reference**

[티스토리](https://rhrhth23.tistory.com/33)
