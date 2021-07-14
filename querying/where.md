{% method %}
# Where

To filter table's rows by any value you can use `where` clause.
Each item of `where` clause should return boolean value.

Main format of `where` clause looks like bellow:
```javascript
const query = {
  filter: {
    where: {
      operator: DBOperators,
      args: Array<DBWhere | DBWhereArgs>
    } 
  } 
}
```
See types descriptions of [DB Operator](types.md#db-operator), [DB Where](types.md#db-where-clause) and 
[DB Where Arguments](types.md#db-where-arguments) for more details. 

`operator: string`: one of listed values:

**Logic Operators**

| Operator | Description |
|:---:|:---|
|`&`, `and` | (a = 5) AND (b = 6) |
|&#124;, `or` | (a = 5 OR a = 6) |
|`!`, `not` | IS NOT TRUE |

**Math Operators**

| Operator | Description |
|:---:|:---|
| `=` | = 3 |
| `!=`, `<>`, `ne` | != 3 |
| `>`, `gt` | \> 5 |
| `>=`, `gte` | \>= 5 |
| `<`, `lt` | < 7 |
| `<=`, `lte` | <= 7 |

**Other Operators**

| Operator | Description |
|:---:|:---|
| `in` | IN [1, 2] |
| `notIn` | NOT IN [1, 2] |
| `like` | LIKE '%hat' |
| `notLike` | NOT LIKE '%hat' |
| `iLike` | ILIKE '%hat' (case insensitive) |
| `notILike` | NOT ILIKE '%hat' |
| `startsWith` | LIKE 'hat%' |
| `endsWith` | LIKE '%hat' |
| `substring` | LIKE '%hat%' |
| `regexp` | REGEXP/~ '^[h &#124; a &#124; t]' |
| `notRegexp` | NOT REGEXP/~ '^[h &#124; a &#124; t]' |
| `iRegexp` | ~* '^[h &#124; a &#124; t]' |
| `notIRegexp` | !~* '^[h &#124; a &#124; t]' |
| `between` | BETWEEN 6 AND 10 |
| `notBetween` | NOT BETWEEN 11 AND 15 |
| `is` | IS NULL |
| `overlap` | && [1, 2] (PG array overlap operator) |
| `contains` | @> [1, 2] (PG array contains operator) |
| `contained` | <@ [1, 2] (PG array contained by operator) |
| `any` | ANY ARRAY[2, 3]::INTEGER |
| `all` | \> ALL (SELECT 1) |

`args: Array<DBWhere | DBWhereArgs>`: 
```javascript
{
  args: ['id', 3]
}
```
Where `id` is column name and `3` is value

{% sample lang="nodejs" -%}
```javascript
const query = {
  filter: {
    where: {
      operator: '=',
      args: [ 'id', 2 ] // id = 2
    } 
  },
  context: {
    tableName: '245ce633-796f-4dfa-ae6f-4b2762adbf44'
  }
}
```

This query will be converted to SQL statement:
```postgresql
SELECT * FROM "245ce633-796f-4dfa-ae6f-4b2762adbf44" WHERE "id" = 2;
```
{% endmethod %}

<br/>
<br/>
<br/>
