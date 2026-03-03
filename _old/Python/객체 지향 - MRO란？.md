
# Python Method Resolution Order (MRO) & C3 Linearization(c3 선형화)

Python의 MRO는 클래스 상속 구조에서 어떤 부모 클래스의 메서드를 먼저 실행할지 결정하는 규칙입니다. 특히 **다이아몬드 상속(Diamond Problem)** 문제를 해결하기 위해 도입되었습니다.

## 1. MRO의 핵심 원칙

C3 Linearization 알고리즘은 다음 세 가지 제약 조건을 만족하도록 설계되었습니다:

- **자식 클래스 우선:** 자식 클래스는 항상 부모 클래스보다 먼저 검색됩니다.
    
- **선언 순서 유지:** 다중 상속 시 클래스 선언문에 나열된 부모 클래스의 순서가 유지됩니다.
    
- **단조성(Monotonicity):** 상속 구조가 복잡해져도 상위 클래스 간의 상대적 순서가 뒤바뀌지 않습니다.
    

## 2. 알고리즘 작동 방식: Merge 구문

MRO를 계산하는 공식은 다음과 같습니다:

$$L[C(B_1, ..., B_n)] = C + merge(L[B_1], ..., L[B_n], [B_1, ..., B_n])$$

1. **L[C]:** 클래스 C의 선형화 리스트(Linearization list)입니다.
    
2. **Head & Tail:** 리스트의 첫 번째 요소를 Head, 나머지를 Tail이라고 합니다.
    
3. **Merge 과정:**
    
    - 각 리스트의 Head 중, 다른 리스트의 Tail에 포함되지 않은 요소를 선택합니다.
        
    - 선택된 요소를 결과 리스트에 추가하고, 모든 리스트에서 해당 요소를 제거합니다.
        
    - 모든 리스트가 빌 때까지 반복합니다. 만약 적절한 Head를 찾을 수 없다면 Python은 `TypeError`를 발생시킵니다.
        

## 3. 예시 코드 (다이아몬드 상속)

```python
class A:
    pass

class B(A):
    pass

class C(A):
    pass

class D(B, C):
    pass

# MRO 확인
print(D.mro())
```

### 상속 구조 분석

1. `L[A] = [A, object]`
    
2. `L[B] = [B, A, object]`
    
3. `L[C] = [C, A, object]`
    
4. `L[D]` 계산:
    
    - `D + merge(L[B], L[C], [B, C])`
        
    - `D + merge([B, A, O], [C, A, O], [B, C])`
        
    - **B** 선택 (어떤 Tail에도 없음) -> `[D, B] + merge([A, O], [C, A, O], [C])`
        
    - **C** 선택 (A는 `[C, A, O]`의 Tail에 있으므로 건너뜀) -> `[D, B, C] + merge([A, O], [A, O])`
        
    - **A** 선택 -> `[D, B, C, A, O]`
        

**최종 순서:** `D -> B -> C -> A -> object`

---

## 4. 실무적 유의사항

- **`super()` 활용:** `super()`는 단순히 "부모 클래스"를 찾는 것이 아니라, 해당 클래스의 **MRO 리스트 상의 다음 클래스**를 호출합니다.
    
- **MRO 에러:** 만약 상속 순서가 꼬여(예: `class X(A, B)`와 `class Y(B, A)`를 동시에 상속받는 경우) 일관된 선형화가 불가능하면 Python은 인터프리터 수준에서 예외를 던집니다.
    

---

MRO 알고리즘의 동작 과정을 시각적으로 확인하고 싶으시다면, 특정 상속 구조에 대한 시각화 이미지를 생성해 드릴 수도 있습니다. 필요하신가요?