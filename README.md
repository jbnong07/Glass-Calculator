# Glass Calculator
글래스모피즘 느낌의 버튼을 적용한 옛날 아이폰 계산기

## 미구현 기능
- [ ] 글래스 모피즘을 위한 블러처리(https://github.com/gabrieltheodoropoulos/GTBlurView)
- [ ] 디스플레이에 표시되는 글자에 따른 글자 크기의 동적 변화
- [ ] 디스플레이에 표시될 텍스트의 폰트 변경
- [ ] AC/C 버튼
- [ ] 연산자 클릭 시 연산처리 전까지 클릭상태를 표시하는 피드백(색상 변경 후 유지) 추가


## 필요한 리팩터링
- [x] ~~RowStack과 ZeroRowStack을 병합한 뒤 ButtonStackProtocol 삭제~~ 11.24


## 과제 목표
### Sparta's Goal

#### Lv1. UILabel 설정
- [X] `UILabel`을 사용해 수식을 표시하는 라벨 구성.

#### Lv2. 가로 스택뷰
- [x] 4개의 버튼을 포함한 가로 스택뷰 생성 및 레이아웃 설정.

#### Lv3. 세로 스택뷰
- [x] 여러 가로 스택뷰를 포함한 세로 스택뷰 구성 및 레이아웃 설정.

#### Lv4. 연산 버튼 색상
- [x] `+`, `-`, `*`, `/`, `AC`, `=` 버튼 색상을 오렌지로 설정.

#### Lv5. 원형 버튼 생성
- [x] 버튼들을 원형으로 설정하며 메서드로 생성하도록 구현.

#### Lv6. 버튼 값 추가 및 초기값 설정
- [x] 버튼 클릭 시 라벨에 값 추가 및 맨 앞의 `0` 제거.

#### Lv7. AC 버튼 동작
- [x] `AC` 버튼 클릭 시 모든 값을 초기화하고 `"0"`으로 설정.

#### Lv8. = 버튼 동작
- [x] 수식을 입력 후 `=` 버튼 클릭 시 결과값을 계산하여 표시.

### My Goal
#### Lv9. 버튼 클릭 애니메이션
- [ ] 버튼이 눌리면 scale effect가 생김, 버튼의 색이 진해지고 연산자의 경우 연산이 처리되기 전까지 색 유지.

#### Lv8. 계산 알고리즘 직접 만들기
- [x] 예전 아이폰 계산기와 비슷한 계산 로직 만들기.

## 커밋 컨벤션
### 깃모지 및 태그 정의
| **깃모지**  | **태그**      | **사용 목적**           | **예시**                         |
|-------------|---------------|-------------------------|----------------------------------|
| 🎉 `:tada:` | `[Init]`      | 프로젝트 초기화         | `🎉[Init]InitialCommit`          |
| ✨ `:sparkles:` | `[Feature]` | 새로운 기능 추가        | `✨[Feature]AddLoginAPI`         |
| 🐛 `:bug:`  | `[Fix]`       | 버그 수정               | `🐛[Fix]ResolveLoginError`       |
| ♻️ `:recycle:` | `[Refactor]` | 코드 리팩토링           | `♻️[Refactor]SimplifyLogic`      |
| 🔥 `:fire:` | `[Remove]`    | 코드/파일 삭제          | `🔥[Remove]DeleteUnusedFile`     |
| 📝 `:memo:` | `[Docs]`      | 문서 추가/수정          | `📝[Docs]UpdateREADME`           |

### 커밋 메시지 구조
1. **커밋 타이틀**
   - **형식**: `<깃모지>[태그]작업내용`
   - 깃모지와 태그를 포함한 요약.
   - 예: `✨[Feature]AddUserRegistration`
3. **커밋 본문 (선택 사항)**  
   - 필요한 경우 작업의 자세한 설명을 추가.
   - 예:
     ```
     ✨[Feature]AddUserRegistration
     - Implement user registration API
     - Add form validation
     ```

## 사용 규칙
1. **깃모지와 태그를 항상 포함**: 작업의 목적을 명확히 하기 위함.
2. **한 커밋, 한 가지 작업**: 변경 사항을 명확히 구분.
