# Visitors

Allows to add, get, change visitor profile.

Each method has a visitor ID (UUID v4) as part of the URI.

The current visitor ID is associated with his "short-access-token".

{% method -%}
## Get

This method allows to find existing visitor profile by its `visitorId`, otherwise creates a new one.

**Method**

    GET
    
**URI**

    /visitors/v1/:visitorId

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>
    
**Result**
```json
{
	"created_at": "YYYY-MM-DDThh:mm:ss",
    "geoip": {},
	"last_ip": "x.x.x.x",
	"user_metadata": {},
	"visited_query_strings": [],
	"visited_pages": []
}
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append('Authorization', 'Bearer <short-access-token>');
myHeaders.append('Content-Type', 'application/json');

var requestOptions = {
  method: 'GET',
  headers: myHeaders,
  redirect: 'follow'
};

fetch('https://mycooldomain.com/visitors/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45', requestOptions)
  .then(response => response.json())
  .then(result => console.log(result))
  .catch(error => console.error(error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://mycooldomain.com/visitors/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  }
};
request(options, function (error, response) { 
  if (error) throw new Error(error);
  console.log(response.body);
});
```

{% sample lang="php" -%}
```php
<?php
require_once 'HTTP/Request2.php';
$request = new HTTP_Request2();
$request->setUrl('https://mycooldomain.com/visitors/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45');
$request->setMethod(HTTP_Request2::METHOD_GET);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
try {
  $response = $request->send();
  if ($response->getStatus() == 200) {
    echo $response->getBody();
  }
  else {
    echo 'Unexpected HTTP status: ' . $response->getStatus() . ' ' .
    $response->getReasonPhrase();
  }
}
catch(HTTP_Request2_Exception $e) {
  echo 'Error: ' . $e->getMessage();
}
```
{% endmethod %}

---

{% method -%}
## Post

This method allows to create a profile for the current visitor.

**Method**

    POST
    
**URI**

    /visitors/v1/:visitorId

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>
    
**Result**
```json
{
	"created_at": "YYYY-MM-DDThh:mm:ss",
    "geoip": {},
	"last_ip": "x.x.x.x",
	"user_metadata": {},
	"visited_query_strings": [],
	"visited_pages": []
}
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append('Authorization', 'Bearer <short-access-token>');
myHeaders.append('Content-Type', 'application/json');

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  redirect: 'follow'
};

fetch('https://mycooldomain.com/visitors/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45', requestOptions)
  .then(response => response.json())
  .then(result => console.log(result))
  .catch(error => console.error(error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://mycooldomain.com/visitors/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  }
};
request(options, function (error, response) { 
  if (error) throw new Error(error);
  console.log(response.body);
});
```

{% sample lang="php" -%}
```php
<?php
require_once 'HTTP/Request2.php';
$request = new HTTP_Request2();
$request->setUrl('https://mycooldomain.com/visitors/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45');
$request->setMethod(HTTP_Request2::METHOD_POST);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
try {
  $response = $request->send();
  if ($response->getStatus() == 200) {
    echo $response->getBody();
  }
  else {
    echo 'Unexpected HTTP status: ' . $response->getStatus() . ' ' .
    $response->getReasonPhrase();
  }
}
catch(HTTP_Request2_Exception $e) {
  echo 'Error: ' . $e->getMessage();
}
```
{% endmethod %}

---

{% method -%}
## Put

This method allows to update the profile for the current visitor.

**Method**

    PUT
    
**URI**

    /visitors/v1/:visitorId

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

    
**Body**
```json
{
    "visited_pages": "page-name"
}
```

**Result**
```json
{
	"created_at": "YYYY-MM-DDThh:mm:ss",
    "geoip": {},
	"last_ip": "x.x.x.x",
	"user_metadata": {},
	"visited_query_strings": [],
	"visited_pages": []
}
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append('Authorization', 'Bearer <short-access-token>');
myHeaders.append('Content-Type', 'application/json');

var requestOptions = {
  method: 'PUT',
  headers: myHeaders,
  redirect: 'follow',
  body: JSON.stringify({
		visited_pages: 'page-name'
	})
};

fetch('https://mycooldomain.com/visitors/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45', requestOptions)
  .then(response => response.json())
  .then(result => console.log(result))
  .catch(error => console.error(error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://mycooldomain.com/visitors/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
		visited_pages: 'page-name'
  })
};
request(options, function (error, response) { 
  if (error) throw new Error(error);
  console.log(response.body);
});
```

{% sample lang="php" -%}
```php
<?php
require_once 'HTTP/Request2.php';
$request = new HTTP_Request2();
$request->setUrl('https://mycooldomain.com/visitors/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45');
$request->setMethod(HTTP_Request2::METHOD_POST);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setBody('{"visited_pages": ["page-name"]}');
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
try {
  $response = $request->send();
  if ($response->getStatus() == 200) {
    echo $response->getBody();
  }
  else {
    echo 'Unexpected HTTP status: ' . $response->getStatus() . ' ' .
    $response->getReasonPhrase();
  }
}
catch(HTTP_Request2_Exception $e) {
  echo 'Error: ' . $e->getMessage();
}
```
{% endmethod %}
