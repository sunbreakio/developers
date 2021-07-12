# Offset

Offset allows to move you to the next limited set of rows when using of [limit](limit.md) 
parameter in query. Such way, for example, if you set `limit: 50` you should set `offset: 50`
to get rows in range `51 - 100`.

```javascript
const query = {
  filter: {
    limit: 50,
    offset: 50
  }
}
```

You will get rows in range from 51 to 100.

Main use case of this parameter often is implementation of pagination:

You have, say, 250 rows in table. It's impossible to show all rows to users in one screen. 
You can reach this through showing pages. 

The query for first page can look like bellow:
```javascript
const query = {
  filter: {
    limit: 25
  }
}
```

For the second one something like this:
```javascript
const query = {
  filter: {
    limit: 25,
    offset: 25
  } 
}
```

For the third one:
```javascript
const query = {
  filter: {
    limit: 25,
    offset: 50
  } 
}
```

And so on...

Go to the next [chapter](order.md) to know how you can get your rows in defined order.

<br/>
<br/>
<br/>
