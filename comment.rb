GIVEN 

Imagine a small part of some project:
There is an Experience model, each experience has many feedback records and each feedback has many responses. They can be added and deleted.
Look at the file test_assignment.rb, it contains some DB schema details and active record models that are used. The DB contains thousands of experiences and hundreds of thousands of feedback records. One feedback record has many responses, some of them contain score info(how a user evaluate experience).

when you run SQL
SELECT DISTINCT question FROM responses
it returns
Let us know what you liked visited this experience
Let us know what can be improved
Rate the experience

when you run SQL
SELECT DISTINCT answers FROM responses WHERE question = “Rate the 	experience”
it returns
5 great
awesome (5)
4 OK
4
not bad 3
2 bad
1 awful

Please provide a solution for each question below:

1) List all the issues(the bigger the best) related to DB structure and code described in the task and possible solution for each issue.
2) Implement #rating on the experience to return rating of the experience
for example: 
experience.rating # => 4.33
a) at first, implement the calculator on the fly and it should take an acceptable amount of the time and use server resources as less as possible(don’t change existing DB schema)
b) then, provide a more efficient solution when the rating is stored in the experience model and is changed only on when the server receives feedback creation/destroy request (it requires changes fo the existing DB schema). This solution should work in the concurrent environment(lots of concurrent requests which add/delete feedback responses)
c) describe the pros and cons of each solution implementation above
3) (Optional) Implement the app(similar to described in the task):
a) it should contain a page with experiences list with rating info
b) it should contain a page where user can create a new experience
c) on the provider list page, the user can click button Leave Feedback and leave they feedback(they can’t see other feedback)
d) the app doesn’t need any authentication you can limit feedback by IP address, 1 feedback is allowed for 1 IP
e) the app should contain tests(model/controller unit tests)

* the answers on the second question can be provided as code changes in the test_assignment.rb file.

** "Feedback" is a mass (or non-count, or uncountable) noun. As such, it has no plural form. You can have "some feedback" or "a lot of feedback", but you can't have *"two feedbacks". Unlike some other common mass nouns (like "water"), "feedback" is a pure mass noun- it has no countable meanings or interpretations. 
https://www.google.com/search?q=feedback+plural+form


# == Schema Information
#
# Table name: experiences
#
# id :integer, not null, primary key
# name :string

# Table name: feedback
#
# id :integer, not null, primary key
# experience_id :integer

# Table name: responses
#
# id :integer, not null, primary key
# feedback_id :integer
# question :string
# answer :string

# Indexes
#
# index_responses_on_feedback_id (feedback_id)

# Foreign Keys
#
#  fk_rails_...  (responses.feedback_id => feedback.id)


DECISION

0. LETS RE-CREATE OUR TABLES


Table name: experiences
id
name




Table name: feedback
id
experience_id 





Table name: responses
id
feedback_id
question
answer


Let us know what you liked visited this experience



Let us know what can be improved



Rate the experience
5 great



awesome (5)



4 OK



4



not bad 3



2 bad



1 awful




 
1. List of the issues :

1 the problem of duplicate data. The value of the answer field in the answer table is repeated. These values should be replaced with numeric indexes.
 This will enable 
- reduce the size of databases,
- increase the speed of access to the database.
- reduces the number of possible errors
2. in the current data structure has not IP field for validation 
3. in the current data structure  we can not calculate value of rates, so we can not calculate total value,  so we can not calculate middle  value
4. in the current data structure  the date and time of the record creation in all tables is not indicated
5. there is a problem with removing data
6. when you need to make a change name of feedback’s raiting  


Solving problems is:

1.1 Adding a constraint. When you add a constraint, you may find that the database already contains data that does not satisfy the added constraint.
1.2. Adding a link. When you add a relationship, you may find that the database already contains foreign key table rows that do not have matching rows in the primary key table. That is, existing data may not satisfy the referential integrity condition.
1.3. Modifying a table that is part of an indexed view.
1.4.  Removing an object. When removing an object such as a column, table, or view from the database, first make sure that it is not referenced by another database object.

2. current database schema has not integer or float rate’s  indexes so we can not calculate value of rates, so we can not calculate total value,  so we can not calculate middle  value
fly calculator model:

class Experience < ApplicationRecord
validates :name, presence: true
has_many :responses

def total_raiting

res = (responses.pluck( :raiting).sum.to_f / responses.pluck( :raiting).count.to_f).round(2) 
res > 0 ? res : 0 
end

def total_responses_number
@total_responses_number ||= responses.count
end

end





3. Application:

it should contain a page with experiences list with rating info
it should contain a page where user can create a new experience
on the provider list page, the user can click button Leave Feedback and leave they feedback(they can’t see other feedback)
the app doesn’t need any authentication you can limit feedback by IP address, 1 feedback is allowed for 1 IP
the app should contain tests(model/controller unit tests)


 the link is here   https://frozen-beyond-38369.herokuapp.com/ 