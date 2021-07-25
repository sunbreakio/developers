# Spec: Blocks

Allows to get block content.

{% method -%}
## Get

This method allows to get block content (HTML) by block ID and audience ID.

**Method**

    GET

**URI**

    /blocks/v1/:blockId

**Parameters**

	audience=<UUIDv4>

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Result**
```json
/* html-content */
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

fetch('https://dev.api.sunbreak.io/blocks/v1/23be832b-09b4-425b-b545-265cc5d9e4b2?audience=4da8815b-43c2-442f-a482-2eb31ae3c1c5', requestOptions)
  .then(response => response.json())
  .then(result => console.log(result))
  .catch(error => console.error(error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://dev.api.sunbreak.io/blocks/v1/23be832b-09b4-425b-b545-265cc5d9e4b2?audience=4da8815b-43c2-442f-a482-2eb31ae3c1c5',
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
$request->setUrl('https://dev.api.sunbreak.io/blocks/v1/23be832b-09b4-425b-b545-265cc5d9e4b2?audience=4da8815b-43c2-442f-a482-2eb31ae3c1c5');
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
