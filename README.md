# TravelBox itinerary organizer
- Deployed front-end: https://tazukopowell.com/travel-planner-front-end/
- Deployed back-end: https://aqueous-forest-96537.herokuapp.com
- Front-end repo: https://github.com/tazpowell/travel-planner-front-end

## Back-end
This repo is the back-end for my TravelBox web app.
It is a simple organizer for saving trip itineray items. Users can create and delete items associated with their account and update the fields.

The application uses two resources, Users and Items.

## Technologies
Ruby on Rails, Ruby


## API
### User authentication
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password`     | `users#changepw`  |
| DELETE | `/sign-out`            | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl "https://aqueous-forest-96537.herokuapp.com/sign-up" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
echo
```

```sh
EMAIL=sample@email.com PASSWORD=sample sh scripts/auth/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "sample@email.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl "https://aqueous-forest-96537.herokuapp.com/sign-in" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
echo
```

```sh
EMAIL=sample@email.com PASSWORD=sample sh scripts/auth/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "sample@email.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password

Request:

```sh
curl "https://aqueous-forest-96537.herokuapp.com/change-password" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
echo
```

```sh
OLDPW='sample' NEWPW='elpmas' TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/auth/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out

Request:

```sh
curl "https://aqueous-forest-96537.herokuapp.com/sign-out" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}"
echo
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/auth/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Items
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/items`               | `items#index`     |
| GET    | `/items/:id`           | `items#show`      |
| POST   | `/items`               | `items#create`    |
| PATCH  | `/items/:id`           | `items#update`    |
| DELETE | `/items/:id`           | `items#destroy`   |

All items CRUD requests must include a header "Authorization: Token token=${TOKEN}".

#### GET /items

Request:

```sh
curl "https://aqueous-forest-96537.herokuapp.com/items" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/items/get-all-items.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "items": [
    {
      "id": 1,
      "name": "Tokyo Skytree",
      "date": "2019-10-01",
      "active": "true",
      "user": {
        "id": 1,
        "email": "sample@email.com"
      }
    },
    {
      "id": 2,
      "name": "Ghibli Museum",
      "date": "2019-10-03",
      "active": "false",
      "user": {
        "id": 1,
        "email": "sample@email.com"
      }
    }
  ]
}
```

#### GET /items/:id

Request:

```sh
curl "https://aqueous-forest-96537.herokuapp.com/items/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
```

```sh
ID=2 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/items/get-one-item.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "item": {
    "id": 2,
    "name": "Ghibli Museum",
    "date": "2019-10-03",
    "active": "false",
    "user": {
      "id": 1,
      "email": "sample@email.com"
    }
  }
}
```

#### POST /items

Request:

```sh
curl "https://aqueous-forest-96537.herokuapp.com/items" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "date": "'"${DATE}"'",
      "active": "'"${ACTIVE}"'"
    }
  }'

echo
```

```sh
NAME='Robot Cafe' DATE='2019-10-10' ACTIVE=true TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/items/create-item.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "item": {
    "id": 3,
    "name": "Robot Cafe",
    "date": "2019-10-10",
    "active": "true",
    "user": {
      "id": 1,
      "email": "sample@email.com"
    }
  }
}
```

#### PATCH /items/:id

Request:

```sh
curl "https://aqueous-forest-96537.herokuapp.com/items/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "date": "'"${DATE}"'",
      "active": "'"${ACTIVE}"'"
    }
  }'
echo
```

```sh
ID=3 NAME='Robot Cafe 2' DATE='2019-10-31' ACTIVE=false TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/items/update-item.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "item": {
    "id": 3,
    "name": "Robot Cafe 2",
    "date": "2019-10-31",
    "active": "false",
    "user": {
      "id": 1,
      "email": "sample@email.com"
    }
  }
}
```

#### DELETE /items/:id

Request:

```sh
curl "https://aqueous-forest-96537.herokuapp.com/items/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"
echo

```

```sh
ID=3 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/items/delete-item.sh
```

Response:

```md
HTTP/1.1 204 No Content
```


## Development Process
#### Planning
- Review project requirements and select project idea
- Create user stories, ERD, and wireframe

#### Set up
- Create front and back end repos
- Deploy front end to GitHub pages
- Deploy back end to Heroku

#### API
- Scaffold 'Items' resource and add relationship to User resource
- Test end points with curl scripts

#### Client
- Test api with curl scripts
- Create & test functions to send requests to API
- Create forms and buttons for User (sign-up, sign-in, change-pw, sign-out)
- Create forms and buttons for Items (create, show, update, delete)

## Problem Solving
- Used console logs and debugger to troubleshoot bugs
- Created a to do list of features and bugs, and worked through them one at a time
- Commited after resolving an issue or completing a task
- Opened GitHub issue on the general project repo to get instructor's help when googling for references and solutions did not yield desired results

## Future Iterations
V1b:
front end:
- Rebuild nav so it collapses correctly in mobile widths
- Update visual layout of an item card
- Add sort functionality for items (by date, active status, categories)
- Rename 'Active' status to make it easy to understand its meaning (such as 'Add to trip')

back end:
- Add additional fields in Items resource

V2:
- Create join table named 'Days' that would allow items to be grouped into a 'day' within a trip
- Add a drag and drop functionality to move items in and out of a day

V3:
- Create a 'Trips' resource that would hold multiple 'days'

## Wireframes & User Stories
[ERD](https://drive.google.com/file/d/1uf5ehJOGMscqj45FaQ5igSpEMWfo4RkL/view?usp=sharing)

Version 1
### As an unregisterd user, I want to:
- sign up with email and password
- be told when my passwords do not match
- after a successful sign up, be automatically signed in

### As a registered user, I want to:
- sign in with my email and password
- be shown an error message if my sign in unsuccessful

### After a successful sign-in, I want to:
show/hide my items:
- automatically see all of my items
- have the ability to hide all my items from view
- re-display all of my items after hiding them
- be alerted when I have no items to hide or show

sign-out:
- sign out when I finish my session
- be shown an error messsage when sign out is unsuccessful

change password:
- change my password to a new password
- be shown an error if my old password is same as new password
- be shown an error message when change password is unsuccessful

items:
- create a new item and view it immediately
- edit an item's name, date, or active status
- delete an item
