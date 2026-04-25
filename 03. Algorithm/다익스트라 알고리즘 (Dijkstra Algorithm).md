특정 노드에서부터 **다른 모든 노드들까지의 거리**를 구하는 알고리즘.  
각 간선에 가중치가 부여되어 노드 간의 거리가 주어졌을 때 사용함

## 코드 예제
```python
from heapq import heappop, heappush

'''
각 노드별 이어진 노드까지의 거리가 (거리, 다음 노드) 순으로 graph에 저장되어 있다고 가정
'''

def dijkstra(start, goal): #시작 노드, 종착 노드 지정
	INF = float('inf') # 가중치 최댓값 지정(무한대로 설정)
	dist = [INF] * (n+1)
	dist[start] = 0 # 시작 노드의 가중치는 0으로(자기 자신이므로 거리 0)
	
	pq = [(0, start)] # 우선순위 큐 생성, (가중치, 노드) 순으로 값 삽입
	
	while pq:
		weight, node = heappop(pq) # 특정 노드와 거리 pop
		
		if dist[node] >= weight: # 특정 노드까지의 기존 거리가 새로 뽑은 거리보다 크면
			for nxt_weight, nxt_node in graph[node]: 
			# 그래프에서 이어진 노드와 그곳까지의 거리 확인
			new_weight = weight + nxt_weight
			# 새로운 가중치 = node까지의 거리 + node->nxt_node 거리
			if new_weight < dist[nxt_node]: # 근데 얘가 기존 거리보다 짧으면?
				dist[nxt_node] = new_weight # 갱신
				heappush(pq, (new_weight, nxt_node)) # 힙에 추가
				
	
	return dist[goal]
```

