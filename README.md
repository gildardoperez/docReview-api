# Task
We want to move over some of our site functionality to a microservices architecture API gateway. To accomplish that we want to
rewrite our “comment on your doctor” functionality into an HTTP service that will be used by users. Please create an API that will allow users to leave a comment and rate a doctor.

We want to store at least the following:
- doctor_id
- comment_body
- created_at
- rating
- author_id

The database schema thus far is the following. Feel free to make any changes as you see fit.
doctors:
- doctor_id
- group_id
- name
- address
- latitude
- longitude

doctors_specialties:
- doctor_id
- specialty_id

specialties
- specialty_id
- name

Bonus Questions

## Installation

* `git clone <repository-url>` this repository
* change into the new directory
* `> rvm use ruby-2.3.1`
* `> bundle install`
* `> rake db:migrate`
* `> rake db:seed`
* `> rails server`
