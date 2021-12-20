# README

### Available routes:
- [x] Return all Courses: `GET api/v1/courses`
- [x] Find Course by id: `GET api/v1/courses/:id`
- [x] Create Course: `POST api/v1/courses`
- [x] Filter self_assignable Courses : `GET api/v1/courses?filter[self_assignable]=true`

### Available feature:
- [x] Ability to assign automatically new coach to a Course when current one was deleted

### Install project locally
- Dotenv is used to manage variables by environment so you can create and use .env.local to handle local variables like `DB_USERNAME` and `DB_PASSWORD`
- Setup DB with`rails db:create && rails db:migrate`
- Import courses `rails db:seed`
- Go to `localhost:3000`

### Testing with rspec
