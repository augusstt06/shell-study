## 반복문

저번에 조건문을 공부한것에 이어서 반복문을 공부해보자

기본적인 사용 형태는 이렇다

```bash
for A in 1 2 3
do
	echo "Number is $A"
done
```

## 사용 예시

그러면 한번 자주 사용되는 예시를 한번 작성해보자

```bash
#! /bin/zsh

for A in `seq -w 1 100`
do
        echo $A
done
```

이떄 사용된 `seq` 명령어는 숫자를 나열하는 명령어이고, `-w`는 001,002처럼 자릿수를 맞추어 출력해주는 명령어이다.
seq에 대해서 조금 더 알아보자

### seq

`seq`는 지정한 숫자만큼 연속된 숫자를 나열해주는 명령어로써 반복문에서 많이 사용된다.
기본 형태는 다음과 같다.

```bash
# seq 1 2 10

> 1
  3
  5
  7
  9
```

엇 이전에 1부터 100까지 출력하는 코드에서는 1씩 증가했는데 이번엔 2씩 증가했다.
`seq` 명령어는 지정한 특정 숫자 값만큼 증가량을 출력할수도 있다.

> `seq 1 2 10`에서 1은 시작값을 나타낸다. 2는 얼만큼 증가시킬것인지를, 마지막으로 10은 종료값을 나타낸다.

(편의상 각각 first, increment, last로 사용하겠다.)
이 first, increment, last에 대해 몇가지 규칙이 존재한다.

- first와 increment은 생략할 수 있고 이때 first의 default는 1이다.
- first > last인 경우, increment의 default는 1이다.

```bash
# seq 5
> 1
  2
  3
  4
  5
```

이제 `seq`가 가지고 있는 몇가지 옵션들을 살펴보자

#### seq 옵션 요약

| <center>단축 명령어</center> | <center>일반 명령어</center> |                                          <center>설명<center/> |
| ---------------------------- | :--------------------------: | -------------------------------------------------------------: |
| -f                           |       --format=FORMAT        |         printf 명령어의 부동소수점 format을 사용하여 출력한다. |
| -s                           |         --separator          |             string을 사용하여 구분자를 지정한다. (기본값은 \n) |
| -w                           |       --equal-width ]        | 제일 큰 숫자의 너비를 기준으로 자릿수를 0으로 맞추어 출력한다. |
| --help                       |              -               |                                seq 명령어의 사용법을 출력한다. |
| --version                    |              -               |                                  seq 명령어의 버전을 출력한다. |

#### seq -f

기본적인 사용법은 이렇다.

```bash
seq -f%{format} 숫자

seq --format=%{format} 숫자
```

또한 출력형식을 정할수 있는데

- %.nf
  소수점 아래 n자리 까지 출력
- %e
  지수 표현으로 출력
- %g
  부동 소수점또는 지수표현중 출력값 길이가 짧은 쪽으로 출력

이제 실제로 format을 사용해보자

```bash
#2부터 4까지 0.5씩 증가하면서 소수점 아래 1번째 자리까지 출력

seq -f "the number is %.1f" 2 0.5 4
> the number is 2.0
  the number is 2.5
  the number is 3.0
  the number is 3.5
  the number is 4.0

#2부터 4까지 0.5씩 증가하면서 지수표현으로 출력
seq -f "the number is %e" 2 0.5 4
> the number is 2.000000e+00
  the number is 2.500000e+00
  the number is 3.000000e+00
  the number is 3.500000e+00
  the number is 4.000000e+00

#2부터 4까지 0.5씩 증가하면서 지수표현과 부동소수점 표현 중 출력길이가 짧은것으로 출력
seq -f "the number is %g" 2 0.5 4
> the number is 2
  the number is 2.5
  the number is 3
  the number is 3.5
  the number is 4
```

#### seq -s

이번에는 구분자를 지정하는 -s 옵션이다.
기본적으로 seq는 `\n` 줄바꿈으로 구분자가 지정되어 있는데 이것을 바꿀수 있다.

사용법은 이렇다

```bash
seq -s "구분자" 숫자

seq --separator="구분자" 숫자
```

이제 실제로 사용해보자

```bash
#default
seq 1 5

> 1
  2
  3
  4
  5
#구분자가 ""
seq -s "" 1 5
> 12345

#구분자가 " " (한칸 띄기)
seq -s " " 1 5
> 1 2 3 4 5

#구분자가 "," 쉼표
seq -s "," 1 5
> 1,2,3,4,5,

#-s 명령어를 사용하고 따로 구분자를 지정하지 않을시, 구분자는 1로 삽입된다.
seq -s 5
> 1121314151
```

#### seq -w

제일 큰 숫자의 너비를 기준으로 자릿수를 0으로 맞추어 출력한다.
사용법은 이렇다

```bash
seq -w 숫자

seq --equal-width 숫자
```

```bash
seq -2 5 10
> 05
  06
  07
  08
  09
  10
```

가장 큰 숫자의 너비가 두자리이므로 한자릿수에 0이 추가되어 출력된다.

이렇게 간단한 `seq` 명령어 사용법을 알아보았다.
그렇다면 처음에 작성했던 코드를 더 간단하게 작성할수 있을것 같다.

```bash
#! /bin/zsh

for A in `seq -w 1 100`
do
        echo $A
done
```

```bash
seq -w 100
```

엄청 간단해졌다. 사실 `seq` 명령어 자체가 반복문 역할을 수행하기 때문에 특정 경우가 아니면 굳이 `for` 문을 사용하지 않아도 될 것 같다.

### 일반 반복문

c, 자바스크립트와 유사한 형태이다. 바로 살펴보자

```bash
#일반 for 반복문
for ((i=0;i<=9;i++))

do

    echo "Normal loop $i"

done
> Normal loop 0
  Normal loop 1
  Normal loop 2
  Normal loop 3
  Normal loop 4
  Normal loop 5

#for 반복문과 seq
for i in `seq 1 5`
do
        echo "seq+normal loop $i"
done
> seq+normal loop 0
 seq+normal loop 1
 seq+normal loop 2
 seq+normal loop 3
 seq+normal loop 4
 seq+normal loop 5
```

자바스크립트와 약간의 차이점이 있다면 for 반복문 조건부분이 이중괄호라는 점이다.
