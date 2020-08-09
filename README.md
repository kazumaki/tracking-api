# Tracking API

Tracking API is a RESTful API that allows authenticated users to get their body measurements data.

## Database ERD

![Screenshot of the ERD](images/Final-Capstone-ERD.png)

## Live Version

[Live Version](http://vinic-tracking-api.herokuapp.com/)

## Getting Started

Clone the repository into your local computer.

```
$ git clone https://github.com/kazumaki/tracking-api.git
```

### Installing

#### Pre requirements

* Ruby 2.6.3
* Rails 6.0.2

#### Start installation

Install all gems:

```
$ bundle install
```

Database creation and migration

```
$ rails db:create db:migrate db:seed
```

Start API development server

```
$ rails s -p 3001
```

### Testing

Run test command

```
$ bundle exec rspec
```


## API Documentation

### Signup User
  Returns an authentication token to authorize the subsequent resquests.

* **URL**
  /signup

* **Method:**
  `POST`

* ** URL Params**
  None
 
 * **Data Params**
   **Required:**
   `name=[string]` `email=[string]` `password=[string]` `password_confirmation=[string]`

* **Success Response:**
  * **Code:** 201
	  **Content:** `{ auth_token: JWT_GENERATED_TOKEN }`

* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Missing any of the required fields" }`

* **Sample Call:**
  ```javascript
	axios.post("/signup", {
	    name: 'John Doe',
	    email: johndoe@mail.com,
	    password: 123456,
	    password_confirmation: 123456,
	  })
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

### Login User
  Returns an authentication token to authorize an existing user.

* **URL**
  /auth/login
* **Method:**
  `POST`

* ** URL Params**
  None
 
 * **Data Params**
   **Required:**
   `email=[string]` `password=[string]`

* **Success Response:**
  * **Code:** 200
	  **Content:** `{ auth_token: JWT_GENERATED_TOKEN }`

* **Error Response:**
  * **Code:** 401
    **Content:** `{ message: "Invalid Credentials" }`

* **Sample Call:**
  ```javascript
	axios.post("/auth/login",
	  {
	    email: johndoe@mail.com,
	    password: 123456,
	  }
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

### Add Measurement
  Returns a json data of the created measurements

* **URL**
  /measurements
* **Method:**
  `POST`

* ** URL Params**
  None
 
 * **Data Params**
   **Required:**
   `measurementType=[integer]` `value=[decimal]`

* **Success Response:**
  * **Code:** 201
	  **Content:** `{ id: 1, user_id: 1, measurement_type_id: 1 value: 10.0, created_at: 01/01/1979 }`

* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Validation failed: any of the required fileds are not present" }`
    
* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Missing token" }`

* **Sample Call:**
  ```javascript
	axios.post("/measurements",
	  {
	    measurementType: 1,
	    value: 10.0,
	  },
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))

### Get Measurements
  Returns a json data of all measurements that belongs to the authenticated user

* **URL**
  /measurements
* **Method:**
  `GET`

* ** URL Params**
  None
 
 * **Data Params**
  None

* **Success Response:**
  * **Code:** 200
	  **Content:** `[
{
        "created_at": "2020-08-06T15:32:21.411Z",
        "id": 1,
        "measurement_type_id": 2,
        "updated_at": "2020-08-06T15:32:21.411Z",
        "user_id": 1,
        "value": "0.4"
    },
    {
        "created_at": "2020-08-06T16:33:04.646Z",
        "id": 2,
        "measurement_type_id": 6,
        "updated_at": "2020-08-06T16:33:04.646Z",
        "user_id": 1,
        "value": "50.0"
    },
    {
        "created_at": "2020-08-06T16:54:42.179Z",
        "id": 3,
        "measurement_type_id": 1,
        "updated_at": "2020-08-06T16:54:42.179Z",
        "user_id": 1,
        "value": "10.0"
    },
]	  `

* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Missing token" }`

* **Sample Call:**
  ```javascript
	axios.get("/measurements",
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

### Get Measurement
  Returns a json data of a specific measurement

* **URL**
  /measurements/:id
* **Method:**
  `GET`

* ** URL Params**
   **Required:**
   `id=[integer]`
 
 * **Data Params**
	None

* **Success Response:**
  * **Code:** 200
	  **Content:** `{ id: 1, user_id: 1, measurement_type_id: 1 value: 10.0, created_at: 01/01/1979 }`

* **Error Response:**
  * **Code:** 404
    **Content:** `{ message: "Couldn't find Measurement with 'id'=ID" }`
 
* **Sample Call:**
  ```javascript
	axios.get("/measurements/:id",
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))

### Delete Measurement
  Returns a json data of a specific measurement

* **URL**
  /measurements/:id
* **Method:**
  `DELETE`

* ** URL Params**
   **Required:**
   `id=[integer]`
 
 * **Data Params**
	None

* **Success Response:**
  * **Code:** 204
	  **Content:** `empty`

* **Error Response:**
  * **Code:** 404
    **Content:** `{ message: "Couldn't find Measurement with 'id'=ID" }`
 
* **Sample Call:**
  ```javascript
	axios.delete("/measurements/:id",
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))



## Built With

* [Ruby](https://www.ruby-lang.org/en/) - Programming language used
* [Ruby on Rails](https://rubyonrails.org/) - Framework

## Author

👤 **Vinicius Campos Carvalho**

<a href="https://github.com/kazumaki" rel="noopener noreferrer" target="_blank">

  ![Profile Image](images/vinicius-profile.png) 

</a>

- Github: [@kazumaki](https://github.com/kazumaki)
- Twitter: [@iKazumaki](https://twitter.com/iKazumaki)
- Linkedin: [Vinicius Campos Carvalho](https://www.linkedin.com/in/vcamposcarvalho/)
- Email: [vcampos.pitangui@gmail.com](vcampos.pitangui@gmail.com)

<a href="https://github.com/kazumaki" rel="noopener noreferrer" target="_blank">
