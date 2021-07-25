# Spec: Audiences

Allows to get visitor audience ID.

The method has a visitor ID (UUID v4) as part of the URI.

{% method -%}
## Get

This method allows to find visitor audience ID.

**Method**

    GET

**URI**

    /audiences/v1/:visitorId

**Parameters (optional)**

	gmt_offset=<timezone offset in minutes>,
	referrer=<URL>,
	new_visitor=<boolean>,
	<characteristic-alias>=<value>


**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Result**
```json
/* for a single audience */
"4da8815b-43c2-442f-a482-2eb31ae3c1c5"

/* for multiple audiences */
["d6ad68d4-575c-4718-86be-60547d1184d5", "0a6aaefb-423e-4a30-a51a-119054060fd3"]

/* if no result */
null
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

fetch('https://dev.api.sunbreak.io/audiences/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45', requestOptions)
  .then(response => response.json())
  .then(result => console.log(result))
  .catch(error => console.error(error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://dev.api.sunbreak.io/audiences/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45',
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
$request->setUrl('https://dev.api.sunbreak.io/audiences/v1/245ce633-796f-4dfa-ae6f-4b2762adbf45');
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
