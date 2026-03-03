#!/bin/bash

# 입력받기
read -p "진행할 차수를 입력하세요 (2일차 과제면 2 입력) : " DAY
read -p "GitLab ID를 입력하세용 (ex: sejhyun13): " YOUR_ID
read -p "저장할 디렉토리 경로를 입력하세요 (기본값 : 현재 폴더): " INPUT_DIR

# 기본값 설정 및 경로 생성
BASE_DIR=${INPUT_DIR:-"."}

# 디렉토리가 없으면 생성 (생성 실패 시 스크립트 종료)
if [ "$BASE_DIR" != "." ]; then
    mkdir -p "$BASE_DIR" || { echo "[Error] 경로 생성 실패"; exit 1; }
fi

# 고정 변수
STR1="web"

# 실습/과제 변수 리스트
STR2_LIST=("ws" "hw")
VAR_LIST=("a" "b" "c" 1 2 3 4 5)

echo "------------------------------------------"
echo "작업 시작: $STR1 $DAY 일차 | ID: $YOUR_ID | 경로: $BASE_DIR"
echo "------------------------------------------"

# 이중 for로 모든 조합 실행
for s2 in "${STR2_LIST[@]}"
do
    for v in "${VAR_LIST[@]}"
    do
        TARGET="${STR1}_${s2}_${DAY}_${v}"
        REPO_URL="https://lab.ssafy.com/${YOUR_ID}/${TARGET}"
        SAVE_PATH="${BASE_DIR}/${TARGET}"

        # 해당 경로에 이미 있으면 넘김
        if [ -d "$SAVE_PATH" ]; then
            echo "[Skip] ${TARGET} 이 이미 존재합니다."
            continue
        fi

        # 원격 레포지토리가 존재하는지 먼저 확인
        if ! git ls-remote "$REPO_URL" > /dev/null 2>&1; then
            echo "[Error] 원격 저장소를 찾을 수 없음: ${TARGET}"
            continue
        fi

        echo "[Process] ${TARGET} Repo를 clone합니다..."
        git clone "$REPO_URL" "$SAVE_PATH"
        
        # 대기
        sleep 0.5
    done
done

echo "------------------------------------------"
echo "작업끝~~"