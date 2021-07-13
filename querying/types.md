# Types

#### DB Payload
```javascript
declare type DBPayload = { 
  filter?: {
    attributes?: DBAttribute,
    where?: DBWhere,
    limit?: Number,
    offset?: Number,
    order?: DBOrderBy,
    group?: DBGrouopBy,
  }, 
  context?: Object 
}
```

---

#### DB Attribute
```javascript
declare type DBAttribute = DBColumn | DBFunction | DBValue | DBSubQuery | string
```

---

#### DB Function
```javascript
declare type DBFunction = { 
    func: string, 
    args: any[], 
    alias?: string 
}
```

#### DB Column
```javascript
declare type DBColumn = { 
  column: string | DBFunction, 
  alias?: string 
} | string
```

#### DB Value
```javascript
declare type DBValue = { 
  value: string | number, 
  alias?: string 
}
```

#### DB SubQuery
```javascript
declare type DBSubQuery = { 
  select: DBPayload 
}
```

#### DB Operator
```javascript
declare type DBOperator = string
```

---

#### DB Where Clause
```javascript
declare type DBWhere = { 
  operator: string, 
  args: Array<DBWhere | DBWhereArgs> 
}
```

#### DB Where Arguments
```javascript
declare type DBWhereArgs = Array<DBWhereAttribute, DBWhereLogic>
```

#### DB Where Attribute
```javascript
declare type DBWhereAttribute = DBColumn | DBFunction
```

#### DB Where logic
```javascript
declare type DBWhereLogic = DBColumn | DBFunction | Number | string
```

---

#### DB Order By Clause
```javascript
declare type DBOrderBy = DBColumn | Number | { 
  column: DBColumn | Number, 
  direction?: DBOrderDirection 
}
```

#### DB Order Direction
```javascript
declare type DBOrderDirection = 'ASC' | 'DESC'
```

---

#### DB Group By Clause
```javascript
declare type DBGroupBy = DBColumn | DBFunction | string
```

---

#### DB Logic
```javascript
declare type DBLogic = DBFunction | DBWhere | DBSubQuery | boolean
```

Go to the next [chapter](attributes.md) to know more about Attributes.

<br/>
<br/>
<br/>
