
# [TIL] Python: BFS vs DFS 작동 원리와 구현 차이

- **날짜:** 2026-02-05
    
- **카테고리:** #Algorithm #Graph #Python
    

## 1. 개념 요약

- **BFS (Breadth-First Search):** 시작 노드에서 가까운 노드부터 우선적으로 탐색하는 방식입니다. 주로 '최단 경로'를 찾을 때 사용됩니다.
    
- **DFS (Depth-First Search):** 한 방향으로 갈 수 있는 끝까지 탐색한 후, 다시 돌아와 다른 방향을 탐색하는 방식입니다. 모든 노드를 방문하거나 '경로의 특징'을 저장해야 할 때 사용됩니다.
    

## 2. 상세 작동 원리

### 2.1. BFS (너비 우선 탐색)

1. **큐(Queue) 자료구조 활용:** 선입선출(FIFO) 원칙에 따라 먼저 들어온 노드를 먼저 꺼내 그 인접 노드를 방문합니다.
    
2. **레벨 단위 탐색:** 시작점에서 거리가 1인 노드들 → 거리가 2인 노드들 순으로 확장해 나갑니다.
    
3. **최단 거리 보장:** 가중치가 없는 그래프에서 처음 방문하는 시점이 곧 해당 노드까지의 최단 경로임이 수학적으로 보장됩니다.
    

### 2.2. DFS (깊이 우선 탐색)

1. **스택(Stack) 또는 재귀(Recursion) 활용:** 후입선출(LIFO) 원칙 혹은 자기 자신을 호출하는 재귀 함수의 특성을 이용해 깊게 파고듭니다.
    
2. **백트래킹(Backtracking):** 더 이상 갈 곳이 없으면 직전의 갈림길 노드로 되돌아가 다른 자식 노드를 탐색합니다.
    
3. **메모리 효율:** BFS에 비해 현재 경로상의 노드들만 기억하면 되므로, 그래프의 너비가 아주 넓을 때 공간 복잡도 면에서 유리할 수 있습니다. (단, 재귀 깊이 제한 주의)
    

## 3. 예시 코드 (Python)

```python
from collections import deque

# 그래프 예시 (인접 리스트)
graph = {
    1: [2, 3, 4],
    2: [5],
    3: [6],
    4: [],
    5: [],
    6: []
}

def bfs(start_node):
    visited = []
    queue = deque([start_node])
    
    while queue:
        node = queue.popleft()
        if node not in visited:
            visited.append(node)
            queue.extend(graph[node])
    return visited

def dfs(node, visited=None):
    if visited is None:
        visited = []
    
    visited.append(node)
    for neighbor in graph[node]:
        if neighbor not in visited:
            dfs(neighbor, visited)
    return visited

# 실행 결과 확인
print(f"BFS 탐색 순서: {bfs(1)}")
"""
예상 출력:
BFS 탐색 순서: [1, 2, 3, 4, 5, 6]
"""

print(f"DFS 탐색 순서: {dfs(1)}")
"""
예상 출력:
DFS 탐색 순서: [1, 2, 5, 3, 6, 4]
"""
```

## 4. 기술적 분석 (객관적 평가)

- **시간 복잡도:** 두 방식 모두 모든 노드($V$)와 간선($E$)을 확인하므로 $O(V + E)$로 동일합니다.
    
- **선택 기준:**
    
    - **최단 거리**를 찾아야 한다면? $\rightarrow$ **BFS** (큐 사용)
        
    - **경로의 수**를 구하거나 **재귀적인 구조**라면? $\rightarrow$ **DFS** (재귀 사용)
        
- **주의사항:** 파이썬은 기본 재귀 깊이 제한이 작으므로, DFS 사용 시 `sys.setrecursionlimit()`을 통해 제한을 늘려주어야 하는 경우가 많습니다.
    

---

## 5. 연관 키워드

- [[Queue (FIFO)]]
    
- [[Stack (LIFO)]]
    
- [[백트래킹 (Backtracking)]]
    
- [[다익스트라 알고리즘 (Dijkstra)]] - 가중치 그래프의 BFS 확장형
