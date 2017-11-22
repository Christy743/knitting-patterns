#Knitting Patterns
Application to build a db to share patterns amongst knitters

##Data needed
1. Users
2. Patterns
3. Materials - yarn, knitting needles and finishing items
4. Password_digest
5. Email
6. User name

PAGES:

*Home Page
  **List of knitting projects
  **Sign In or Sign Up
  **Welcome to Knitting patterns

*Register Page
  **Sign up
    ***Name - username
    ***Email
    ***Password
  **Sign In

*Sign In Page
  **Name/username
  **Password
  **Sign Up link

*New Project Page
  **Materials
  **Pattern
    ***Edit project
    ***Delete project

*Project Page
  **Individual project
    ***Materials
    ***Pattern

#User Model
  *id
  *email
  *Password_digest
    **User has_many Patterns

#Project Model
  *id
  *user_id
  *name
  *description
  *yarn_type
  *needle_type
  *notions_type

#Material Model
  *id
  *name
  *type - yarn, needles, notions

#Routes
  *ApplicationController
  *UsersController
  *SessionController - not sure if needed
  *PatternsController
