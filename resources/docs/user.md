# User api description

- [List of users](#list-of-users)

- [Register new user](#register-new-user)

- [Load posts from specific user](#load-posts-from-specific-user)


**List of users**
----
  Returns json data with list of all users.

* **URL**

  api/v1/users/

* **Method:**

  `GET`

*  **URL Params**

   **Required:**

   None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**
      ```ruby
      users: [
        { id : 1, username : "Codelink dev 1" },
        { id : 2, username : "Codelink dev 2" }
      ]
      ```

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />

  OR

  * **Code:** 401 UNAUTHORIZED <br />

* **Sample Call:**

  ```ruby
  curl -X GET 'https://codelinknetwork.herokuapp.com/api/v1/users'
  ```


**Register new user**
----
  Create a new user in and insert into database.

* **URL**

  api/v1/users/register

* **Method:**

  `POST`

*  **URL Params**

   **Required:**
      None

* **Data Params**

  ```ruby
   user[username]=[String], required: true
   user[email]=[String]
  ```

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**  `{ "user_id": 1 }`

* **Error Response:**

  * **Code:** 442 Unprocessable Entity  <br />
    **Content:** `{ error : "Some errors" }`

* **Sample Call:**

  ```ruby
  curl -X POST -d "user[username]=codername&user[email]=doa9595@gmail.com"  https://codelinknetwork.herokuapp.com/api/v1/users/register
  ```


**Load posts from specific user**
----
  Load all posts from specific user

* **URL**

  api/v1/users/:id/load_posts

* **Method:**

  `GET`

*  **URL Params**

   **Required:**
    `id=[Integer]`

* **Data Params**
    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**
    ```ruby
      {
        "posts": [
            # Post 1
            {
                "id": 1,
                "content": "MyText",
                "user": {
                    "id": 1,
                    "username": "Example username 1"
                },
                "newest_comments": [
                    {
                        "id": 3,
                        "content": "This is comment content",
                        "user_id": 11
                    },
                    {
                        "id": 2,
                        "content": "This is comment content",
                        "user_id": 10
                    }
                ]
            },
            # Post 2
            # ...
        ]
      }
    ```

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />

  OR

  * **Code:** 401 UNAUTHORIZED <br />

* **Sample Call:**

  ```ruby
 curl -X GET 'https://codelinknetwork.herokuapp.com/api/v1/users/1/load_posts'
  ```
