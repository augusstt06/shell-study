## case 제어문
조건문 if와 비슷하지만, if문은 스크립트의 내용이 길어짐에 따라 수행시간이 길어질수 있다는 단점이 존재한다.
이 단점을 보완하기 위해 제어 `case`문을 사용하는데 이 제어문은 입력된 경우의 변수에 따라 주어진 행동을 수행한다.

기본적인 사용패턴은 아래와 같다.

```bash
case expression in
	pattern 1)
    	statements ;;
    pattern 2)
    	statements ;;
esac
```

간단한 예시 코드를 한번 작성해보자

```bash
#! /bin/zsh

A="black"

case $A in
        black)
                echo "this is black";;
        red)
                echo "this is red";;

esac

./case.sh
> this is black
```
expression이 변수 A이므로 pattern 1의 조건을 만족시켜 this is black이라는 리턴값이 출력된다.
만약 어느 조건도 만족시키지 않았다면 아무런 동작 없이 case문이 종료된다.

## 파이프 활용
제어문에서 파이프를 사용하는 예시코드이다.

```bash
#! /bin/zsh

A="melon"

case $A in
	apple | banana)
    	echo "this is fruit;;
    carrit | cabbage)
    	echo "this is vegetable";;
#*)는 위의 pattern이 아닌 모든 값이 밑의 pattern으로 넘긴다는 뜻이다.
    *)
    echo "Neither vegetable nor fruits";;
esac
```

잠시 파이프가 뭔지 한번 알아보자
>### 파이프란?
파이프란 프로세스. 프로그램, 명령어 등의 결과를 다른 프로그램으로 넘겨주는 것을 말한다.(이때 넘겨주는 순서는 보장하지 않는다)
```bash
ls * | grep "pipe"
```
위의 코드는 현재 디렉토리에 있는 파일 이름 중에 "pipe"가 들어간 것이 있으면 출력하라는 코드이다.
즉, `ls *` 명령어의 결과로 출력된 모든 하위파일을 `grep "pipe"` 명령어로 넘겨주어 "pipe"이름을 가진 모든 파일을 출력하는 것이다.

파이프가 이제 뭔지 알았으니 다시 한번 코드를 확인해보자.
`|`를 활용하여 2개의 패턴을 활용하였다. 이처럼 여러개의 패턴을 사용할 때는 파이프를 이용한다.

## 위치 매개변수 활용
```bash
./case.sh a b c
```
위의 명령어는 내가 저장한 `case.sh` 쉘 파일을 실행하는 명령어이다. 
이때 위치 매개변수를 활용할수 있는데

- `./case.sh`
실행할 파일이름이다. `$0`으로 표현한다.

- `a, b, c ... `
실행할 파일 뒤에 오는 매개변수로써 차례대로 `$1, $2, $3 ....`으로 표현하고 계속해서 매개변수로 삽입이 가능하다.
이때 이 매개변수들은 실행파일안의 제어문을 차례대로 가리킨다.
`$x`로 표현한다.
이때 이 매개변수들은 실행파일안의 제어문을 차례대로 가리킨다.

한번 예제코드를 작성해보자

```bash
#! /bin/zsh

B="$1"

case $B in
        apple | banana)
                echo "this is fruit";;
        carrot | cabbage)
                echo "this is vegetable";;
        *)
                echo "Neither vegetable nor fruits";;
esac


./case_var.sh banana
> this is fruit

./case_var.sh cabbage
> this is vegetable

./case_var.sh cabbage
> Neither vegetable nor fruits
```



---
**reference**

[파이프?](https://etloveguitar.tistory.com/21)
[case 제어문](https://rhrhth23.tistory.com/91)



