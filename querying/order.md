# Order

Sometimes you will need to get your rows from table in defined order.
You can reach that using parameter `order` in query.
Ordering can be done in two directions: ascending (`ASC`) and descending (`DESC`)

Say, to display price from bigger to less you can use such expression:

```javascript
const query = {
  filter: {
    order: [
      { column: 'price', direction: 'DESC' }
    ]
  }
}
```

...or such one:

```javascript
const query = {
  filter: {
    order: [
      { column: 3, direction: 'DESC' }
    ]
  }
}
```

...also such one:

```javascript
const query = {
  filter: {
    order: [
      { column: { column: 'price' }, direction: 'DESC' }
    ]
  }
}
```

...and even such one:

```javascript
const query = {
  filter: {
    order: [
      { column: { func: 'LOWER', args: [{ column: 'name' }] }, direction: 'DESC' }
    ]
  }
}
```

To use default ordering (`ASC`) you can:

...pass it explicitly:

```javascript
const query = {
  filter: {
    order: [
      { column: 'price', direction: 'ASC' }
    ]
  }
}
``` 

...or omit `direction` parameter:

```javascript
const query = {
  filter: {
    order: [
      { column: 'price' }
    ]
  }
}
```

...or just pass column name only:

```javascript
const query = {
  filter: {
    order: 'price'
  }
}
```

...or pass [DB Column](types.md#db-column) type

```javascript
const query = {
  filter: {
    order: { column: 'price' }
  }
}
```

...also you can pass number of column instead of its name:

```javascript
const query = {
  filter: {
    order: 3
  }
}
```

Simple rule: to make ordering by just one field use simple types like column name, number of column 
or [DB Column](types.md#db-column), to order by several fields - use an array of that values.

For more details see [DB Order By Clause](types.md#db-order-by-clause) type description.

Go to next [chapter](group.md) to understand how to use `group` parameter.

<br/>
<br/>
<br/>
