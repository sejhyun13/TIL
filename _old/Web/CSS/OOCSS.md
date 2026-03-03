# OOCSS (Object-Oriented CSS, 객체 지향 CSS)

* **날짜:** 2026-02-26
* **카테고리:** #Web #CSS #DesignPattern #OOCSS

## 1. 개념 및 목적

OOCSS는 니콜 설리반(Nicole Sullivan)이 제안한 방법론으로, CSS에서 **객체 지향 프로그래밍(OOP)의 원칙**을 적용한 것입니다. 화면에 보이는 UI를 반복 가능한 추상적인 객체로 분리하여, 새로운 페이지를 만들 때 기존의 스타일 조각들을 조합해 빠르게 구축하는 것을 목적으로 합니다.

## 2. 두 가지 핵심 원칙 상세

### 2.1. 구조와 모양의 분리 (Separation of Structure from Skin)

가장 중요한 원칙으로, 요소의 **레이아웃(뼈대)**과 **디자인(피부)**을 결정하는 속성을 서로 다른 클래스로 분리하는 것입니다.

* **구조 (Structure):** 눈에 보이지 않는 틀입니다. `width`, `height`, `padding`, `margin`, `border-width`, `overflow` 등이 해당됩니다.
* **모양 (Skin):** 눈에 보이는 시각적 요소입니다. `color`, `background-color`, `border-color`, `box-shadow` 등이 해당됩니다.

이 원칙을 지키면, 동일한 구조를 가진 버튼이나 박스를 색상만 바꿔서 여러 버전으로 재사용하기 매우 용이해집니다.

### 2.2. 컨테이너와 내용의 분리 (Separation of Content from Container)

특정 요소가 어디에 위치하느냐에 따라 스타일이 결정되는 **의존성을 끊는 것**입니다.

* **나쁜 예:** `.sidebar h2 { font-size: 15px; }` (h2가 사이드바에 있을 때만 스타일이 적용됨)
* **좋은 예:** `.category-title { font-size: 15px; }` (어느 위치에 있든 해당 클래스만 부여하면 동일한 스타일 유지)

이를 통해 컴포넌트의 위치 독립성을 확보할 수 있으며, HTML 구조가 변경되어도 CSS를 대폭 수정할 필요가 없어집니다.

## 3. 예시 코드 (Before vs After)

### 일반적인 방식 (중복 발생)

```css
/* 중복되는 코드가 많아 수정이 어렵습니다. */
.main-box {
  width: 400px;
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f9f9f9;
  box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
}

.side-box {
  width: 200px;
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #eee;
  box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
}

```

### OOCSS 방식 (재사용성 극대화)

```css
/* 공통 구조(객체) 선언 */
.box {
  overflow: hidden;
  border: 1px solid #ccc;
  box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
}

/* 개별 속성 정의 */
.w-main { width: 400px; }
.w-side { width: 200px; }
.bg-light { background-color: #f9f9f9; }
.bg-dark { background-color: #eee; }

```

**HTML 적용:**

```html
<div class="box w-main bg-light">메인 박스</div>
<div class="box w-side bg-dark">사이드 박스</div>

```

## 4. 기술적 분석 (객관적 평가)

* **장점:**
* **DRY(Don't Repeat Yourself) 실현:** 코드 중복이 획기적으로 줄어들어 CSS 파일 용량이 감소합니다.
* **확장성:** 새로운 UI 요소를 기존 클래스들의 조합만으로 빠르게 생성할 수 있습니다.


* **단점:**
* **HTML의 복잡도 증가:** 하나의 요소에 여러 개의 클래스를 부여해야 하므로 마크업이 다소 지저분해 보일 수 있습니다.
* **추상화의 난이도:** 초기에 어떤 것을 '공통 객체'로 추출할지 결정하는 설계 과정이 까다롭습니다.



---

## 5. 연관 키워드

* [[BEM (Block Element Modifier)]] - OOCSS의 클래스 작명 한계를 보완하는 방법론
* [[Utility-First CSS (Tailwind CSS)]] - OOCSS의 원칙을 극단적으로 확장한 형태
* [[SMACSS]] - 스타일을 카테고리별로 분류하는 방법론
* [[CSS 모듈화]]

---

OOCSS를 한마디로 요약하자면 **"레고 블록처럼 CSS를 만드는 것"**이라고 할 수 있습니다. 처음에는 클래스가 많아져서 어색할 수 있지만, 프로젝트 규모가 커질수록 그 진가를 발휘하는 방법론이에요.