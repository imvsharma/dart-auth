# Dart Basic Auth with OAuth 2.0

##  Prerequisite
    1.  Dart (Programming Language)
    2.  Aqueduct (Web Framework of Dart)
    3.  Postgres (Relational Database)

##  Running the Application

1.  Clone the repo `git clone https://github.com/imvsharma/dart-auth.git`
2.  Run `aqueduct serve`

##  End-points
1.  Create user: `curl -X POST http://localhost:8888/register -H 'Content-Type: application/json' -d '{"username":"bob", "password":"password"}'`

2.  Get token: `curl -X POST http://localhost:8888/auth/token -H 'Authorization: Basic Y29tLmFwcC50ZXN0Og==' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=bob&password=password&grant_type=password'`