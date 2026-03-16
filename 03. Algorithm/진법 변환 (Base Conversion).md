알고리즘 문제 풀이나 시스템 프로그래밍에서 빈번하게 등장하는 **진법 변환(Base Conversion)**에 대해 정리해 드립니다. 10진수를 다른 진수로 바꾸는 법과 그 반대의 과정을 중심으로 구성했습니다.

---

# 진법 변환 (Base Conversion)

* **날짜:** 2026-03-09
* **카테고리:** #Algorithm #Math #Python #Programming_Basics

## 1. 개념 및 목적

진법 변환은 하나의 숫자를 다른 수 체계로 표현하는 과정입니다. 일상에서 사용하는 10진수(Decimal)를 컴퓨터가 이해하는 2진수(Binary), 혹은 메모리 주소 표현에 쓰이는 16진수(Hexadecimal) 등으로 변환하여 데이터의 크기를 조절하거나 비트 단위 연산을 수행하는 데 목적이 있습니다.

## 2. 상세 작동 원리

### 2.1. 10진수에서 n진수로 변환 (나눗셈법)

10진수 정수를 바꾸고자 하는 진수 $n$으로 더 이상 나눌 수 없을 때까지 반복해서 나눕니다.

1. 10진수를 $n$으로 나눈 나머지를 기록합니다.
2. 몫을 다시 $n$으로 나눕니다.
3. 몫이 0이 되면, 기록한 나머지들을 **역순**으로 읽습니다.

### 2.2. n진수에서 10진수로 변환 (가중치 합산)

각 자릿수의 숫자와 해당 자릿수가 가지는 가중치($n^k$)를 곱하여 모두 더합니다.

1. 가장 오른쪽 자릿수(0번째)부터 왼쪽으로 가며 $n^0, n^1, n^2 \dots$ 순으로 가중치를 부여합니다.
2. 각 자릿수 값에 가중치를 곱합니다.
3. 모든 값을 합산합니다.

## 3. 예시 코드 (Python)

파이썬은 내장 함수를 제공할 뿐만 아니라, 직접 로직을 구현하기도 매우 간편합니다.

### n진수 -> 10진수
```python
# 1. 내장 함수 활용 (2, 8, 16진수)
number = 45
print(f"2진수: {bin(number)}")   # 0b101101
print(f"8진수: {oct(number)}")   # 0o55
print(f"16진수: {hex(number)}")  # 0x2d

# 2. n진수 -> 10진수 변환 (int 함수 활용)
binary_str = '101101'
print(f"10진수 변환: {int(binary_str, 2)}") 
# 예상 출력: 10진수 변환: 45

# 3. 2진수 -> 10진수 변환 (직접구현)
def binary_to_decimal(n):
    decimal_num = 0
    for i in range(len(n)):
        decimal_num += (2 ** i) * int(n[-(i+1)])
        # 각 자릿수의 값마다 2 ** (자릿수 위치) 를 곱하여 더함
    return decimal_num

```
### 10진수 -> n진수
```python
# 10진수 -> 2진수
def decimal_to_binary(n):
    binary_num = ''

    # 0보다 클 때까지 2로 나눈다
    # 나머지를 정답에 추가한다

    while n > 0:
        remain = n % 2

        binary_num = str(remain) + binary_num
        n //= 2

    return binary_num

# 10진수 -> n진수
def convert_base(num, base):
    char = "0123456789ABCDEF"
    q, r = divmod(num, base)
    if q == 0:
        return char[r]
    else:
        return convert_base(q, base) + char[r]

print(f"45를 3진수로: {convert_base(45, 3)}")
# 예상 출력: 45를 3진수로: 1200

```

## 4. 기술적 분석

* **효율성:** 파이썬의 `int(string, base)`와 같은 내장 함수는 C로 최적화되어 있어 매우 빠릅니다. 직접 구현 시에는 재귀보다는 반복문이나 `divmod`를 활용하는 것이 메모리 측면에서 유리할 수 있습니다.
* **표현 범위:** 16진수를 넘어가는 진법(예: 36진수 등)에서는 숫자를 대신할 알파벳(A-Z) 처리가 추가로 필요합니다.
* **실무적 의의:** 네트워크 프로그래밍이나 파일 입출력 시 바이트 데이터를 16진수로 변환하여 디버깅하는 경우가 많으므로 능숙하게 다룰 줄 알아야 합니다.

---

## 5. 연관 키워드

* [[int()]]
* [[비트 연산자 (Bitwise Operators)]]
* [[2의 보수 (2's Complement)]]
* [[부동 소수점 (Floating Point)]]
* [[ASCII & Unicode]]