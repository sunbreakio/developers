# SQL Query Format

We use [Sequelize](https://sequelize.org) library to communicate to PostgresQL database. 
This library can be used only inside source code of your apps, but to order allow use it remotely, 
we developed own format of SQL Queries.  

Common view of this query looks like that:

```javascript
const query = {
  filter: {
    attributes: [{}],
    where: {},
    limit: 0,
    offset: 0,
    order: [{}],
    group: {}
  },
  context: {}
}
```

See Type [DB Payload](types.md#db-payload) for more details.

Go to next [chapter](types.md) to get some more details

<br/>
<br/>
<br/>
