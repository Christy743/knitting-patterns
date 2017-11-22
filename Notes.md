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
    ***Username
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
  *username
  *email
  *Password_digest
    **User has_many Patterns

#Project Model
  *id
  *user_id
  *name
  *directions
  *material_id
  *yarn_type
  *needle_type
  *notions_type
  *belongs_to User
  *has_many Materials

#Material Model
  *id
  *material_name
  *project_id
  *type - yarn, needles, notions

#Routes
  *ApplicationController
  *UsersController
  *SessionController - not sure if needed
  *PatternsController
