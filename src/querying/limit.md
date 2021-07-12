# Limit

When you have a big table you don't want to wait while whole table's rows are retrieved from database.
Limit allows to restrict number and speedup loading of resulting set of rows.

You can set parameter `limit` in query by such way:

```javascript
const query = {
  filter: {
    limit: 50
  }
}
```

In result you will get maximum 50 rows.

But what if you need the next 50 rows from table?

Go to the next [chapter](offset.md) to know that.

<br/>
<br/>
<br/>
