# 깊이 우선 탐색(DFS, Depth-First Search)

## 코드
```python

V, E는 제공됨

def dfs(v):
	# 방문 체크
	visited[v] = 1
	# 할일
	수행작업
	# 다음 노드
	for w in adj[v]:
		if visited[w] != 1:
			dfs(w)


visited = [0] * (V+1)
adj = [[] for _ in range(V+1)
for i in range(E):
	s, e = edge[2 * i], edge[2 * i + 1]
	adj[s].append(e)
	
dfs(시작노드)
```