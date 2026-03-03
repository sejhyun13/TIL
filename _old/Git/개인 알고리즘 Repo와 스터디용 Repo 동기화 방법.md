# 📂 Algorithm - Study Repo 동기화 매뉴얼 (Subtree 방식)

이 매뉴얼은 **백준허브**를 통해 동기화된 개인 알고리즘 Repo지토리의 전체 내용을, 공용 스터디 Repo로 가져와 양방향(주로 단방향 권장)으로 동기화하는 방법을 다룹니다.

## 0. 작업 전 설정
시작 전 필요한 설정은 다음과 같습니다(Git의 설치를 전제로 진행합니다).
1. 크롬/엣지 확장 프로그램 **‘[백준허브](https://chromewebstore.google.com/detail/%EB%B0%B1%EC%A4%80%ED%97%88%EB%B8%8Cbaekjoonhub/ccammcjdkpgjmcpijpahlehmapgmphmk)’ 설치**

2. 백준허브에서 내 개인 깃허브 Repo지토리와 연동(새 Repo 만들기와 기존 Repo 연동하기 둘 다 지원합니다.  
   자세한 사용법은 [공식 Github 내 README 참조](https://github.com/BaekjoonHub/BaekjoonHub)

3. **백준에서 해결한 문제들이 모두 백준허브 연동 Repo지토리에 업로드되도록 합니다**(문제 채점 화면 접속하면 자동으로 작동. 초록색 체크 표시가 뜨면 Repo지토리에 업로드된 것). 
 
4. 공용 스터디 Repo지토리를 **포크(fork)하여 개인 계정 내의 복사된 Repo지토리를 만듭니다.** 이 Repo지토리는 추후 **공용 스터디 Repo와의 동기화를 위한 PR에 사용**됩니다.

5. 포크된 Repo지토리를 `git clone [Repo주소]`를 통해 내 컴퓨터의 원하는 경로에 `clone`해 둡니다.


**이하의 설명에서 사용될 예시 Repo/폴더명은 다음과 같습니다.**
- '백준허브'와 연동된 **알고리즘 풀이 Repo지토리**명: `Algorithm`
- '공용 스터디' 에서 **포크된 개인 스터디 Repo지토리**명 및 `clone`한 **로컬 폴더**명 : `study`
- `study` 내부 **당신의 풀이 내역이 업로드될 폴더** : `name`

> **🚨`study` 내부에 `name` 폴더는 만들어 둘 필요가 없습니다**  
> 이후 진행 과정에서 자동으로 생성됩니다! 이미 원격 Repo에 만들어져 있는 경우에는 하단 1.2를 참조하세요.

위 세 이름은 문서에서 사용되는 예시이며, 실제 적용 시에는 자유롭게 변경하셔도 됩니다.
## 1. 초기 설정 (새 컴퓨터에서 최초 1회)

로컬의 `study` 폴더에서 원본인 `Algorithm` Repo지토리 주소를 등록하고 데이터를 처음 가져오는 단계입니다.

Git Bash 등의 터미널에서 진행합니다.

#### 1. `study` 폴더로 이동
`cd (study 폴더 경로)`

#### 2. `Algorithm` Repo를 'algo'라는 별칭으로 등록(별칭은 자유)
`git remote add algo [Algorithm Repo 주소]`
#### 3. `Algorithm` Repo의 main 내용을 `name` 폴더로 가져오기
`name` 폴더가 자동으로 생성되며 데이터가 복제됩니다.

`git subtree add --prefix=`*name* `algo main --squash`

> ❕**Algorithm Repo의 메인 branch 이름을 확인하세요!**  
> GitHub의 기본 branch는 main이기 때문에, GitLab으로 학습한 대로 master를 입력할 경우 branch를 찾지 못할 수 있습니다.  
> GitHub 설정에서 기본 branch명을 main에서 master로 변경하였다면 master를 입력해도 됩니다.

> **💡 만약 에러가 발생한다면?**
> 
> `fatal: refusing to merge unrelated histories` 메시지가 뜨면 명령어 끝에 `--allow-unrelated-histories`를 추가하세요.  
> `Algorithm` Repo의 내용을 가져와 `name` 폴더에 덮어쓰게 됩니다.

## 1.2 이미 `name` 폴더가 원격 Repo에 있는 경우
공용 폴더에서 이미 만들어 두었거나, 새로 만들게 되어 `study` 폴더에 이미 `name` 폴더가 있는 경우에는 다음 명령어를 입력하세요.  

`git subtree pull --prefix=`*name* `algo main --squash`  

`add`가 아닌 `pull`을 사용하여, 이미 있는 `name` 폴더에 `Algorithm`의 내용을 가져올 수 있게끔 합니다.


---

## 2. 일상적인 동기화 (작업 흐름)

가장 안전한 방법은 **원본(`Algorithm` Repo)에서 수정**하고 **타겟(`study` 폴더)에서 갱신 후 원격 Repo로 `push`** 하는 것입니다.

### Step 1. 원본 업데이트 (백준허브 연동된 `Algorithm` Repo)

평소처럼 알고리즘 문제를 풀면, 백준허브가 풀이 파일과 관련 정보를 자동으로 `Algorithm` Repo에 반영합니다.  

채점 화면에서 결과 옆에 **'초록색 체크✅'** 표시가 생기면 해당 문제의 반영이 완료된 것입니다.


### Step 2. 타겟 동기화 (study 폴더)

`Algorithm` Repo에 올라온 최신 코드를 로컬 환경(내 데스크탑)의 `study/name` 폴더로 당겨 옵니다.

(Git Bash 등의 터미널에서 진행)  

`cd (study_경로)`
#### 1. 개인 `study` Repo의 내용을 로컬로 Pull하기
`git pull`

#### 2. Algorithm의 변경사항을 `name` 폴더로 가져오기
`git subtree pull --prefix=`name `algo_src main --squash`

#### 3. 업데이트된 name 폴더 내용을 개인 study Repo에도 업로드
`git add .`  
`git commit -m '커밋메시지남길내용'`  
`git push origin master(브랜치명이 main이면 main)`

### Step 3. Sync Fork 와 Pull Request
당신이 문제를 푸는 것과 별개로, 다른 사용자들도 상술한 과정을 통해 Fork된 개인 Repo에 문제를 업로드하고 있기 때문에, 처음 공용 Repo와 각자의 `study` Repo는 내용이 제각기일 수 밖에 없습니다.  
이를 위해 주기적으로 Pull Request를 통해 내 `study` Repo의 변경사항을 공용 Repo에 반영시켜야만 합니다.  
(그래야 공용 Repo에 각자의 풀이 기록이 남으니까요)  

Step 2까지의 과정을 매일 알고리즘을 풀고 나서 한 번씩 하면, 개인 `study` Repo에 반영되어 개인 프로필의 기여 현황(잔디)이 늘어나게 됩니다.  
이후 공용 스터디 Repo지토리에 내 풀이 내역을 반영하려면, 공용 스터디 Repo 운영자에게 PR(Pull Request)를 하고 운영자가 승인하면 반영(merge, 통합)됩니다.

각 사용자가 각자 PR하여 개인 폴더에 반영된 내용은 여러분의 개인 `study` Repo에 반영되지 않습니다.  
이는 직접 해주셔야 하며, GitHub의 개인 `study` Repo에 있는 Sync Fork 버튼을 통해 가능합니다.  
Update Branch를 통해 공용 Repo의 수정사항을 개인 `study` Repo로 가져올 수 있습니다.
> ## **🚨Discard Commits를 누르면?**
> 당신이 업로드한 풀이 내역 커밋까지 공용 Repo에 있는 커밋으로 덮어씌워집니다.  
> 즉 당신이 마지막으로 PR한 시점의 풀이 내역으로 돌아가게 됩니다. 하지말라고

## 권장되는 작업 순서
가장 추천하는 방식은 내 작업을 내 로컬에 커밋만 해두고, 원본(공용)을 동기화한 뒤에 내보내는 방식입니다.

1. `Algorithm` Repo의 추가사항을 로컬의 `name` 폴더로 Pull 한 후 커밋까지 해 둡니다.

1. Sync Fork 실행: 개인 `study`의 GitHub 페이지에서 Sync Fork -> Update Branch를 누르거나, 터미널에서 원본(A)의 내용을 가져옵니다.

2. 내 로컬로 가져오기 (Pull): 포크 저장소(`study`)에 반영된 원본의 변경 사항을 내 컴퓨터로 `git pull` 합니다.

3. Push: 문제가 없다면 내 저장소(C)로 push 합니다.

4. PR 생성: 원본(A)으로 Pull Request를 보냅니다.

>### 왜 이 순서가 좋은가?
>서로의 작업이 달라서 충돌할 미연의 가능성을 최대한 줄일 수 있습니다.  
>어차피 각자 이름 폴더에서 작업하면 서로의 변경사항을 침범할 일은 거의 없긴 합니다.

---

## 4. 주요 명령어 해설

|**구문**|**역할**|
|---|---|
|`subtree pull`|외부 Repo의 특정 브랜치를 현재 Repo의 하위 폴더로 병합합니다.|
|`--prefix=`name|동기화할 대상 폴더명을 지정합니다.|
|`algo`|아까 등록한 원본 Repo지토리의 별칭입니다.|
|`--squash`|원본의 지저분한 커밋 내역을 하나로 합쳐서 가져옵니다.|

---

## 5. 핵심 주의사항

- **Remote 주소 관리:** `git remote add` 정보는 `.git` 설정에만 남고 GitHub에는 올라가지 않습니다. 따라서 **다른 컴퓨터**에서 작업할 때는 매번 `remote add`를 다시 해 주거나, .git 폴더를 통으로 기존 컴퓨터에서 옮겨 오면 됩니다.  
로컬의 `study` 폴더를 통째로 압축해서, 다른 컴퓨터에 복사하면 상술한 1번 과정(세팅)을 반복하지 않아도 됩니다.
    
- **폴더 구조 주의:** `Algorithm` Repo에 `백준` 폴더가 있다면, `study` Repo에서는 `name/백준/...` 형태가 됩니다.

> ## **🚨중요 : 반드시 자신 이름의 폴더에서만 작업하세요!**
> 로컬의 `study/name` 안이 아닌 다른 스터디원 폴더의 파일을 수정하면 나중에 공용 Repo에서 `pull` 할 때 다른 사용자의 커밋 기록과 충돌이 발생할 수 있습니다!  
그럼 많이 귀찮아짐,,

## 6. 요약(상기 주의사항은 반드시 참고하고 진행할것)
### **초기 세팅**  
`cd (study 폴더 경로)`  
`git remote add algo [Algorithm Repo 주소]`  
`git subtree add --prefix=`*name* `algo main --squash`  
(이미 name이 있다면 `git subtree pull --prefix=`*name* `algo main --squash`)  

### **문제 풀고 나서**  
Sync Fork 하기  
`cd (study_경로)`  
`git pull`  
`git subtree pull --prefix=`name `algo_src main --squash`  
`git add .`  
`git commit -m '커밋메시지남길내용'`  
`git push origin master(브랜치명이 main이면 main)`  
이후 Pull Request