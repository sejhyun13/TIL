```python
def recur(cnt):
    if cnt == 2:
        print(path)
        return
    
    # 한 번의 선택에서 세 가지 경우의 수
    for i in range(3):
        if i in path:
        # 주의! in은 시간복잡도가 O(N), 시간초과 날 수 있음
            continue

        path.append(i)
        recur(cnt + 1)
        path.pop()

recur(0)
```

### 백트래킹
- 조건을 추가하여 불만족하는 경우 더 탐색하지 않고 이전으로 퇴각하는 방법
```python
def recur2(cnt):
    if cnt == 3:
        print(*path)
        return

    for i in range(3):
        if used[i] = True: # 이미 i를 사용하였다면
            continue 
            # ~이 아닐 때/안될 때 -> continue 사용 권장

        used[i] = True # 방문처리
        path.append(i)
        recur(cnt+1)
        path.pop()

recur2(0)
```
