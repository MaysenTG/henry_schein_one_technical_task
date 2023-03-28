# README

## **How I built it**
---
### **Questions**
Each question has a title, body, replies, reference to an account, and a answer reply ID (if it has one, nil otherwise)

Questions can only be created when logged in, and can only be edited by the account that created it. Questions have a one-to-many relationship with replies, and a one-to-many relationship with accounts. The owner of the question can mark a reply as the answer to their question, which is done by setting the `answer_reply_id` to the reply's ID.

Replies are scoped to a question, and can only be created when logged in. Replies have a one-to-many relationship with accounts, and a one-to-many relationship with questions.


I initially used Rails commands to generate the models for Questions and Replies. I then added the associations between them.


### **Replies**
Each reply has a body, reference to an account, and reference to a question. Replies can only be created when logged in. Replies have a one-to-many relationship with accounts, and a one-to-many relationship with questions. Replies can be marked as the answer to a question by setting the parent question's `answer_reply_id` to the reply's ID. Only the owner of the question can mark a reply as the answer to their question.

### **Accounts**
Each account has a username, email and password. Accounts have a one-to-many relationship with questions, and a one-to-many relationship with replies.


<br/>

---
## **Assumptions, considerations or trade-offs I made**
### Trade offs
I could have use a frontend framework like React or EmberJS, but I decided to use Rails views as I was able to create a better app within the alloted time. In the Ruby on Rails position, I would quickly become familiar with EmberJS.

I was also wanting to imlpement a reaction system for a question, but ran out of time to implement this feature and have it working properly. If I had the more time, I would implement a fully working Reaction model which holds a question ID, the account ID and the type of reaction (upvote, downvote).

### Assumptions
People need accounts to create questions and replies. Only the owner of a question can mark a reply as the answer to their question or edit the question.

### Considerations
I've ensured that the app's routes are tidy and easy to understand. I've ensured the error messages displayed are clear and easy to understand.

<br/>

---
## **Why you made your prioritization choices**.

### Accounts
It's possible Henry Schein One uses custom Auth solutions for Dentally, so while I could've gone and built my own login/account system, 
using devise was easy to setup and works. Being in a Rails dev role, I'll quickly become familiar with any custom account system you have.
