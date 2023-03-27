# README

## **How I built it**
---
### **Questions**
Each question has a title, body, replies, reference to an account, and a answer reply ID (if it has one, nil otherwise)

Questions can only be created when logged in, and can only be edited by the account that created it. Questions have a one-to-many relationship with replies, and a one-to-many relationship with accounts. The owner of the question can mark a reply as the answer to their question, which is done by setting the `answer_reply_id` to the reply's ID.

Replies are scoped to a question, and can only be created when logged in. Replies have a one-to-many relationship with accounts, and a one-to-many relationship with questions.


I initially used Rails commands to generate the models for Questions and Replies. I then added the associations between them.


### **Replies**


### **Accounts**

<br/>

---
## **Assumptions, considerations or trade-offs I made**


<br/>

---
## **Why you made your prioritization choices**.

### Accounts
It's possible Henry Schein One uses custom Auth solutions for Dentally, so while I could've gone and built my own login/account system, 
using devise was easy to setup and works. Being in a Rails dev role, I'll quickly become familiar with any custom account system you have.
