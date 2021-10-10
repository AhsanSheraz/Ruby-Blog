# README

This is the Ruby web based application, have restfull API's for a Blog application.

* **Pre-Req:** You should have docker & docker-compose install on your machine.
    * **To install Docker:** <a href='https://docs.docker.com/desktop/windows/install/'>Windows</a>, <a href='https://docs.docker.com/engine/install/ubuntu/'>Ubuntu</a>, <a href='https://docs.docker.com/desktop/mac/install/'>Mac</a>
    * **To install docker-compose:** <a href='https://docs.docker.com/compose/install/'>Docker Compose</a>

<h2>Steps to run the application:</h2>

* Clone the project by **"git clone repo-url"**
* Open project directory into terminal.
* Type **"docker-compose up --build"**
* After building and running all the container open <a href='http://localhost:5454/browser/'>pgadmin</a> for DB configuration.
    * **Login Email:** ahsan@pgadmin.org
    * **Password:** admin
* First create a server from the panel on the left side as shown below:
    * **step 1:** 
          </br>![Screenshot (46)](https://user-images.githubusercontent.com/51913596/136691728-26c5bb74-9a62-4f67-9974-22dd4f5bd208.png)
    * **step 2:** 
          </br>![Screenshot (43)](https://user-images.githubusercontent.com/51913596/136691653-318f6800-8795-4bca-b0aa-9c2b8214586b.png)
    * **step 3 :** At this step just click on **save**, after adding the configuration. 
          </br>![Screenshot (45)](https://user-images.githubusercontent.com/51913596/136691654-e0d3a97f-e3f7-4335-bf3f-6c97ce0c43d8.png)
 * Now create a DB with the name of **"blog_app_production"** as shown below:
    * **step 1:** 
          ![Screenshot (47)](https://user-images.githubusercontent.com/51913596/136691869-e2b62236-b49e-4aca-9fa5-e5a87201ca16.png)
    * **step 2:** At this step just click on **save**, after adding the DB name. 
          ![Screenshot (48)](https://user-images.githubusercontent.com/51913596/136691867-fbc0bd75-4ba0-4a79-a64b-237757130a53.png)

* Now hit the <a href='http://localhost:3000/'>Open App</a>, your application is up and running.
* Now open another terminal, run the below commands:
    * Run command **"docker exec -it blog-app bash"** to access docker container terminal.
    * Type command on docker container terminal **"rake db:migrate"** for db migrations.
    * At the end, type command **"rake db:seed"** to generate dummy data.
* Default login users:
    * **Email:** user[1 to 100]@example.com
    * **Password for all users:** password


<h2>API's covered in this app:</h2>

* **Note:** You need to set Authentication token in against each API (except login), to communicate the server.</br></br>
    * Set authorization in headers as shown below: </br>![Screenshot (49)](https://user-images.githubusercontent.com/51913596/136692400-ca326535-4e63-4f0e-9bfd-b87e3d06becd.png)


* **Login API: (POST request)**
    * **Description:** This API will be used for login and get token against a user. 
    * **URL:** http://localhost:3000/login
    * **Payload:** {
          "email": "user1@example.com",
          "password": "password"
      }
    * **Response:** { "token": "1ab103011d3672342821145e3762d949" }


* **Creat Post API: (POST request)**
    * **Description:** This API will craete a post against a user. 
    * **URL:** http://localhost:3000/posts
    * **Payload:** {
        "title": "Post Number postman",
        "context": "This post is agains",
        "user_ip": "192.168.1.100"
    }
    * **Response:** {
        "post": {
            "id": 6515,
            "title": "Post Number postman",
            "context": "This post is agains",
            "created_at": "2021-10-09T16:03:55.469Z"
        }
    }
    
    
* **Rate a Post API: (POST request)**
    * **Description:** This API will be used to rate a Post (Rating will be between 1 to 5). And it will return the average of all the ratings against that Post.
    * **URL:** http://localhost:3000/ratings
    * **Payload:** {
        "rate": 5,
        "post_id": 20
    }
    * **Response:** {
        "average_rating": 4.8,
        "post_id": 20
    }
    
    
* **Get top N post by average rating: (GET request)**
    * **Description:** This API will be used to get top N number of posts by average rating, by default value of showPosts is 5.
    * **URL:** http://localhost:3000/top/posts?showPosts=1
    * **Response:** {
        "message": [
            {
                "title": "Post Number 1528",
                "context": "This post is against user 1"
            }
          ]
        }
        
        
* **Get IP's & authors, against the IP of Post: (GET request)**
    * **Description:** This API will return list of user's/author's against the Post IP.
    * **URL:** http://localhost:3000/author/ips
    * **Response:** {
          "192.168.0.1": [
              "user1@example.com"
          ],
          "192.168.0.2": [
              "user2@example.com"
          ]
        }
        
        
 * **Get All Post: (GET request)**
    * **Description:** This API will return all the Posts. Pagination is also implement in this API, default it wil return 1 page with 5 values.
    * **URL:** http://localhost:3000/posts?page=1&per_page=2
    * **Response:** {
         "posts": [
              {
                  "id": 6516,
                  "title": "Post Number 1",
                  "context": "This post is against user 1",
                  "created_at": "2021-10-10T09:52:35.639Z"
              },
              {
                  "id": 6517,
                  "title": "Post Number 2",
                  "context": "This post is against user 1",
                  "created_at": "2021-10-10T09:52:35.659Z"
              }
          ]
        }
        
        
 * **Get All Users: (GET request)**
    * **Description:** This API will return all the registered User.
    * **URL:** http://localhost:3000/users
    * **Response:** {
         "users": [
              {
                  "id": 5,
                  "email": "user1@example.com",
                  "created_at": "2021-10-10T09:52:35.019Z"
              },
              {
                  "id": 6,
                  "email": "user2@example.com",
                  "created_at": "2021-10-10T09:53:22.370Z"
              }
          ]
        }
        
        
 * **Get All Ratings: (GET request)**
    * **Description:** This API will return all the Rating against every Post.
    * **URL:** http://localhost:3000/ratings
    * **Response:** {
         "ratings": [
              {
                  "id": 3479
              },
              {
                  "id": 3480
              }
          ]
        }
