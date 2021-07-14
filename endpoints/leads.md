# Leads

Allows to add, get, change Salesforce Leads info to visitor profile.

Each method has a visitor ID (UUID v4) as part of the URI.

The current visitor ID is associated with his "short-access-token".

{% method -%}
## Get

This method allows to get Salesforce info from existing visitor profile by its `visitorId`.

**Method**

    GET
    
**URI**

    /leads/v1/:visitorId

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>
    
**Result**
```json
{
	/* salesforce.leads table fields */
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

fetch('https://mycooldomain.com/leads/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45', requestOptions)
  .then(response => response.json())
  .then(result => console.log(result))
  .catch(error => console.error(error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://mycooldomain.com/leads/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45',
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
$request->setUrl('https://mycooldomain.com/leads/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45');
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
## Put

This method allows to update the profile for the current visitor.

**Method**

    PUT
    
**URI**

    /leads/v1/:visitorId

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

    
**Body**
```json
{
    "email": "my@mail.com",
	"segment": "segment-db-name" /* optional */
}
```

**Result**
```json
{
	/* default profile fields */
	"created_at": "YYYY-MM-DDThh:mm:ss",
    "geoip": {},
	"last_ip": "x.x.x.x",
	"user_metadata": {},
	"visited_query_strings": [],
	"visited_pages": [],
	/* new fields */
	"email": "my@mail.com",
	"salesforce": {}
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
		email: 'my@mail.com'
  })
};

fetch('https://mycooldomain.com/leads/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45', requestOptions)
  .then(response => response.json())
  .then(result => console.log(result))
  .catch(error => console.error(error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://mycooldomain.com/leads/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
		email: 'my@mail.com'
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
$request->setUrl('https://mycooldomain.com/leads/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45');
$request->setMethod(HTTP_Request2::METHOD_PUT);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setBody('{"email": "my@mail.com"}');
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
