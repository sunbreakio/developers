# Types

#### FDB Payload
```javascript
declare type FDBPayload = { 
  filter?: {
    attributes?: FDBAttribute,
    where?: FDBWhere,
    limit?: Number,
    offset?: Number,
    order?: FDBOrderBy,
    group?: FDBGrouopBy,
  }, 
  context?: Object 
}
```

---

#### FDB Attribute
```javascript
declare type FDBAttribute = FDBColumn | FDBFunction | FDBValue | FDBSubQuery | string
```

---

#### FDB Function
```javascript
declare type FDBFunction = { 
    func: string, 
    args: any[], 
    alias?: string 
}
```

#### FDB Column
```javascript
declare type FDBColumn = { 
  column: string | FDBFunction, 
  alias?: string 
} | string
```

#### FDB Value
```javascript
declare type FDBValue = { 
  value: string | number, 
  alias?: string 
}
```

#### FDB SubQuery
```javascript
declare type FDBSubQuery = { 
  select: FDBPayload 
}
```

#### FDB Operator
```javascript
declare type FDBOperator = string
```

---

#### FDB Where Clause
```javascript
declare type FDBWhere = { 
  operator: string, 
  args: Array<FDBWhere | FDBWhereArgs> 
}
```

#### FDB Where Arguments
```javascript
declare type FDBWhereArgs = Array<FDBWhereAttribute, FDBWhereLogic>
```

#### FDB Where Attribute
```javascript
declare type FDBWhereAttribute = FDBColumn | FDBFunction
```

#### FDB Where logic
```javascript
declare type FDBWhereLogic = FDBColumn | FDBFunction | Number | string
```

---

#### FDB Order By Clause
```javascript
declare type FDBOrderBy = FDBColumn | Number | { 
  column: FDBColumn | Number, 
  direction?: FDBOrderDirection 
}
```

#### FDB Order Direction
```javascript
declare type FDBOrderDirection = 'ASC' | 'DESC'
```

---

#### FDB Group By Clause
```javascript
declare type FDBGroupBy = FDBColumn | FDBFunction | string
```

---

#### FDB Logic
```javascript
declare type FDBLogic = FDBFunction | FDBWhere | FDBSubQuery | boolean
```

Go to the next [chapter](attributes.md) to know more about Attributes.

<br/>
<br/>
<br/>
