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


## select 제어문
이전 포스팅에서 다뤘던 case 제어문에 이어서 select 제어문에 대하여 알아보자

`select`제어문은 조건의 여부에 따라 다음 명령을 수행하는 제어문이다.
사용자에게 여러가지의 메뉴를 번호로 표기하여 입력을 받아 명령을 수행하는 방식으로 시행된다.

기본적인 사용법은 아래와 같다.

```bash
select Variable "A" "B" "C"
do
	"you choose $Variable"
done

./select.sh

> 1) A
  2) B
  3) C

#? 2
you choose B
```
중간의 #? 2는 2를 입력한다는 의미이다.

이제 한번 예시 코드를 작성해보자
```bash
#! /bin/zsh

PS3="Seclet one option number : "

echo
select var in "A" "B" "C" "D"
do
        echo
        echo "you choose ${var}"
        echo
        break
done
```
못보던 `PS3` 변수가 선언되었다.
이 변수는 기본 사용법에서 사용된 `#?`를 사용자 지정 문자열로 나타내 주는 변수이다.
실행해보자
```bash
 ./select.sh                                                                    
> 1) A  2) B  3) C  4) D
Seclet one option number : 4

you choose D
```
내가 선언한 A,B,C,D의 변수를 선택할때는 해당번호를 입력해야 한다.

조금 더 응용해보자

```bash
#! /bin/zsh

PS3="Select number #"

echo
number(){
select i
do
        echo
        echo "you choose $i"
        echo
        break
done
}
number one two three four five
```

number라는 함수 안에 select문을 사용한 예제이다.

이번엔 `case`문을 함께 사용해보자

```bash
#! /bin/zsh

PS3="Select number #"

echo
select action in start stop status restart
do
        echo
        case $action in
                start)
                        echo "service start";;
                stop)
                        echo "service stop";;
                status)
                        echo "service status";;
                restart)
                        echo "service restart";;
                *)
                        echo "Error!"
                exit 1;;
        esac
        break
done
```
선택지로 주어지는 `start, stop, status, restart`들은 `action`이라는 변수에 저장이 되어 해당 변수에 따라 case문이 작동하여 지정된 문자열을 출력한다.
지정한 번호가 아닌 그 외의 번호를 입력할시 "Error!"를 출력한다.



## while

내가 아는 그 `while`문이다. 주어진 조건이 참 / 거짓일때까지 명령을 반복해서 수행한다.
기본 사용법을 알아보자
```bash
while condition
do 
	statement 1
    statement 2
    .
    .
    .
    statement n
done
```

`while`문은 condition 조건이 필요하다.
해당 조건이 거짓일때까지 `do`와 `done`사이의 명령이 반복되어 수행되며, done 바로 이전 명령이 마지막 명령이 된다. 어떤 명령도 수행되지 않은 경우에는 종료값이 0이 된다.

간단한 예시 코드를 작성해보자

```bash
#! /bin/zsh

A=1

while [ $A -lt 5 ]
do
        echo "A = $A"
        A=`expr $A + 1`
done
```
변수 A가 5보다 작다면 A를 출력하고 1씩 더하는 반복문이다.
> 여기서 사용된 `expr` 는 정수를 계산하기 위해 사용되는 명령어이다.
유의할 점은 계산식 작성시, 기호와 정수사이에는 공백이 무조건 존재해야 한다.
```bash
expr 4 % 3
> 1
```

---
**reference**

[파이프?](https://etloveguitar.tistory.com/21)
[case 제어문](https://rhrhth23.tistory.com/91)
[select 제어문](https://rhrhth23.tistory.com/91)


