# Group

Let's say you need to get max price in your table of products. Also you want get it in part of departments. 

You should use aggregate function `SUM` for column `price`:

```javascript
const query = {
  filter: {
    attributes: [
      { func: 'SUM', args: ['price'], alias: 'price' },
      { column: 'productId' }
    ],
    group: [
      'department',
      'productId'
    ]
  }
}
```

Result will be similar that:

```javascript
const result = {
  count: [
    { department: 'dep1', productId: 1, count: 1 },
    { department: 'dep2', productId: 4, count: 1 }
  ],
  rows: [
    { department: 'dep1', productId: 1, price: 1999 },
    { department: 'dep2', productId: 4, price: 3000 }
  ]
}
```

All columns that doesn't take a part in aggregate functions in query should be put to group clause

<br/>
<br/>
<br/>
