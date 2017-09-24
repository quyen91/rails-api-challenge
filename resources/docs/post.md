# Post api description

- [List of posts](#list-of-posts)

- [Add new post](#add-new-post)

- [List of comments in specific post](#list-of-comments-in-specific-post)

- [Add comment to the specific post](#add-comment-to-the-specific-post)


**List of posts**
----
  Returns json data with list of all posts.

* **URL**

  api/v1/posts/

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
      [
        # Post 1
        {
          "id": 14,
          "content": "This is first post",
          "user": {
              "id": 14,
              "username": "quyen4"
          },
          "newest_comments": []
        },
        # Post 2
        # ...
      ]
      ```

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />

  OR

  * **Code:** 401 UNAUTHORIZED <br />

* **Sample Call:**

  ```ruby
  curl -X GET 'https://codelinknetwork.herokuapp.com/api/v1/posts'
  ```


**Add new post**
----
  Create a new user in and insert into database.

* **URL**

  api/v1/posts/

* **Method:**

  `POST`

*  **URL Params**

   **Required:**
      None

* **Data Params**

  ```ruby
   post[title]=[String], required: true
   post[content]=[Text], required: true
  ```

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**  `{ "post_id": 1 }`

* **Error Response:**

  * **Code:** 442 Unprocessable Entity  <br />
    **Content:** `{ error : "Some errors" }`

* **Sample Call:**

  ```ruby
  curl -X POST -d "post[title]=this is title&post[content]=This is content"  https://codelinknetwork.herokuapp.com/api/v1/posts
  ```


**List of comments in specific post**
----
  Load all comments from specific post

* **URL**

  api/v1/posts/:id/comments

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
      [
        {
            "id": 1,
            "content": "This is comment content",
            "user_id": 10
        },
        {
            "id": 2,
            "content": "This is comment content",
            "user_id": 11
        },
      ]
    ```

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />

  OR

  * **Code:** 401 UNAUTHORIZED <br />

* **Sample Call:**

  ```ruby
 curl -X GET 'https://codelinknetwork.herokuapp.com/api/v1/posts/1/comments'
  ```


**Add comment to the specific post**
----
  Current user add a comments to a post

* **URL**

  api/v1/posts/1/comments

* **Method:**

  `POST`

*  **URL Params**

   **Required:**
      `id=[Integer]`

* **Data Params**

  ```ruby
   comment[content]=[Text], required: true
  ```

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**  `{ "comment_id": 1 }`

* **Error Response:**

  * **Code:** 442 Unprocessable Entity  <br />
    **Content:** `{ error : "Some errors" }`

* **Sample Call:**

  ```ruby
  curl -X POST -d "comment[content]=this is comment"  https://codelinknetwork.herokuapp.com/api/v1/posts/1/comments
  ```