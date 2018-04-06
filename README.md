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

4. controller
  ```ruby
    # eidit
    @edit_post = Post.find(params[:id])
    #권한 검사 호출 authorize를 통해 policy post의 update와 매핑됨
    authorize @edit_post,:update?

    #destroy
    destroy_post = Post.find(params[:id])
    authorize destroy_post, :update?
  ```

 5. user.rb
  ```ruby
    # 실질적으로 해당 게시글이 자신의 것이 맞는지 확인하는 기능을 한다.
    def admin?(post)
      self == post.user
    end
  ```

 6. post_policy.rb
  ```ruby

    #Scope 밖에서

    def initialize(user, post)
      @user = user
      @post = post
    end

    def update?
      user.admin?(@post)
    end
  ```
  
 7. admin 권한 추가

  1. Gemfile 추가: `gem 'rails_admin', '~> 1.3'`
  2. `bundle install`
  3. `rails g rails_admin:install`
  4. 경로를 묻는다 디폴트 사용하려면 Enter
  5. 서버 시작하기 `rails s` Admin 화면을 보려면 `/admin`로 가기 (만약 디폴트로 경로를 설정 했다면 /admin)