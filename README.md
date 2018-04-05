# Pundit Practice

## 기본 기능

- 게시판 CRUD + 어느 회원이 작성했는지

- devise를 이용한 로그인, 회원가입, 로그아웃

***
## Pundit 적용하기

1. Gemfile
  `gem 'pundit'`

2. controllers/application_controller
  `include Pundit`

3. bash
  `bundle install`
  `rails g pundit:install`
  `rails g pundit:policy post` -> 유저의 게시글(post)에 대한 권한을 설정해 줄 파일을 생성
