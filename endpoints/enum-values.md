# Spec: Enum Values

This API is part of [Enums](enums.md) API.

Each method has [context](../GLOSSARY.md#context): `enumId` - it should be ID of existing Enum

{% method -%}
## Create

This method allows to create one or more enum values for specific 'enumId'

**Method**

    POST

**URI**

    /api/enum_values

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "data": [
        {
            "label": "Red",
            "options": {
                "order": 1
            }
        },
        {
            "label": "Green",
            "options": {
                "order": 2
            }
        },
        {
            "label": "Yellow",
            "options": {
                "order": 3
            }
        },
        {
            "label": "Black",
            "options": {
                "order": 4
            }
        },
        {
            "label": "White",
            "options": {
                "order": 5
            }
        }
    ],
    "context": {
        "enumId": 48
    }
}
```

**Result**
```json
[
    {
        "id": 106,
        "label": "Red",
        "options": {
            "order": 1
        },
        "systemName": "5a546bb9-95f9-4d75-ab8b-babf69dd3083",
        "enumId": 48,
        "updatedAt": "2020-04-07T15:45:50.241Z",
        "createdAt": "2020-04-07T15:45:50.241Z"
    },
    {
        "id": 107,
        "label": "Green",
        "options": {
            "order": 2
        },
        "systemName": "2e57c867-84c2-40e1-842f-e076a6f662b0",
        "enumId": 48,
        "updatedAt": "2020-04-07T15:45:50.241Z",
        "createdAt": "2020-04-07T15:45:50.241Z"
    },
    {
        "id": 108,
        "label": "Yellow",
        "options": {
            "order": 3
        },
        "systemName": "8c80cef6-f587-4f16-9fb1-bc22d1998095",
        "enumId": 48,
        "updatedAt": "2020-04-07T15:45:50.242Z",
        "createdAt": "2020-04-07T15:45:50.242Z"
    },
    {
        "id": 109,
        "label": "Black",
        "options": {
            "order": 4
        },
        "systemName": "f1d8ebb4-7155-4d9e-bd16-11d503c354b2",
        "enumId": 48,
        "updatedAt": "2020-04-07T15:45:50.242Z",
        "createdAt": "2020-04-07T15:45:50.242Z"
    },
    {
        "id": 110,
        "label": "White",
        "options": {
            "order": 5
        },
        "systemName": "5b78d536-f938-4339-ab65-59748d0259c8",
        "enumId": 48,
        "updatedAt": "2020-04-07T15:45:50.242Z",
        "createdAt": "2020-04-07T15:45:50.242Z"
    }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"data":[{"label":"Red","options":{"order":1}},{"label":"Green","options":{"order":2}},{"label":"Yellow","options":{"order":3}},{"label":"Black","options":{"order":4}},{"label":"White","options":{"order":5}}],"context":{"enumId":48}});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://dev.api.sunbreak.io/api/enum_values", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://dev.api.sunbreak.io/api/enum_values',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"data":[{"label":"Red","options":{"order":1}},{"label":"Green","options":{"order":2}},{"label":"Yellow","options":{"order":3}},{"label":"Black","options":{"order":4}},{"label":"White","options":{"order":5}}],"context":{"enumId":48}})

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
$request->setUrl('https://dev.api.sunbreak.io/api/enum_values');
$request->setMethod(HTTP_Request2::METHOD_POST);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "data": [\n        {\n            "label": "Red",\n            "options": {\n                "order": 1\n            }\n        },\n        {\n            "label": "Green",\n            "options": {\n                "order": 2\n            }\n        },\n        {\n            "label": "Yellow",\n            "options": {\n                "order": 3\n            }\n        },\n        {\n            "label": "Black",\n            "options": {\n                "order": 4\n            }\n        },\n        {\n            "label": "White",\n            "options": {\n                "order": 5\n            }\n        }\n    ],\n    "context": {\n        "enumId": 48\n    }\n}');
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
## Get

This method allows to find existing enumValue by its 'label' and 'enumId'.

See [Where](../querying/where.md) for more details.

**Method**

    GET

**URI**

    /api/enum_values

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "filter": {
        "where": {
          "operator": "=",
          "args": ["label", "Red"]
        }
    },
    "context": {
        "enumId": 48
    }
}
```

**Result**
```json
{
    "count": 1,
    "rows": [
        {
            "id": 106,
            "systemName": "5a546bb9-95f9-4d75-ab8b-babf69dd3083",
            "label": "Red",
            "options": {
                "order": 1
            },
            "enumId": 48,
            "createdAt": "2020-04-07T15:45:50.241Z",
            "updatedAt": "2020-04-07T15:45:50.241Z"
        }
    ]
}
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"filter":{"where":{"operator":"=","args":["label","Red"]}},"context":{"enumId":42}});

var requestOptions = {
  method: 'GET',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://dev.api.sunbreak.io/api/enum_values", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://dev.api.sunbreak.io/api/enum_values',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"filter":{"where":{"operator":"=","args":["label","Red"]}},"context":{"enumId":42}})

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
$request->setUrl('https://dev.api.sunbreak.io/api/enum_values');
$request->setMethod(HTTP_Request2::METHOD_GET);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n	"filter": {\n		"where": {\n			"operator": "=",\n			"args": ["label", "Red"]\n		}\n	},\n	"context": {\n		"enumId": 42\n	}\n}');
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
## Update

This method allows update existing enum value

**Method**

    PUT

**URI**

    /api/enum_values

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "data": [
        {
            "id": 106,
            "label": "Pink"
        }
    ],
    "context": {
        "enumId": 48
    }
}
```

**Result**
```json
[
    {
        "id": 106,
        "systemName": "5a546bb9-95f9-4d75-ab8b-babf69dd3083",
        "label": "Pink",
        "options": {
            "order": 1
        },
        "enumId": 48,
        "createdAt": "2020-04-07T15:45:50.241Z",
        "updatedAt": "2020-04-07T16:50:34.562Z"
    }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"data":[{"id":106,"label":"Pink"}],"context":{"enumId":42}});

var requestOptions = {
  method: 'PUT',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://dev.api.sunbreak.io/api/enum_values", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'PUT',
  'url': 'https://dev.api.sunbreak.io/api/enum_values',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"data":[{"id":106,"label":"Pink"}],"context":{"enumId":42}})

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
$request->setUrl('https://dev.api.sunbreak.io/api/enum_values');
$request->setMethod(HTTP_Request2::METHOD_PUT);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "data": [\n        {\n            "id": 106,\n            "label": "Pink"\n        }\n    ],\n    "context": {\n        "enumId": 42\n    }\n}');
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
## Delete

This method allows to delete existing enum value by its 'id'.

See [Where](../querying/where.md) for more details.

**Method**

    DELETE

**URI**

    /api/enum_values

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "filter": {
        "where": {
            "operator": "=",
            "args": [
                "id",
                106
            ]
        }
    },
    "context": {
        "enumId": 48
    }
}
```

**Result**
```json
[
    {
        "id": 106,
        "systemName": "5a546bb9-95f9-4d75-ab8b-babf69dd3083",
        "label": "Pink",
        "options": {
            "order": 1
        },
        "enumId": 48,
        "createdAt": "2020-04-07T15:45:50.241Z",
        "updatedAt": "2020-04-07T16:50:34.562Z"
    }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"filter":{"where":{"operator":"=","args":["id",105]}},"context":{"enumId":48}});

var requestOptions = {
  method: 'DELETE',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://dev.api.sunbreak.io/api/enum_values", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'DELETE',
  'url': 'https://dev.api.sunbreak.io/api/enum_values',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"filter":{"where":{"operator":"=","args":["id",105]}},"context":{"enumId":48}})

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
$request->setUrl('https://dev.api.sunbreak.io/api/enum_values');
$request->setMethod(HTTP_Request2::METHOD_DELETE);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "filter": {\n        "where": {\n            "operator": "=",\n            "args": [\n                "id",\n                105\n            ]\n        }\n    },\n    "context": {\n        "enumId": 48\n    }\n}');
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

<br/>
<br/>
<br/>
