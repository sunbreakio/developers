# Context

Part of query, object which allows to know parent data container.

For example: Metadata - it's table in DB, also it's container for data rows.

To manipulate objects we should pass `tableName` as context

---

# Long Access Token

Access Token which is living very long time. This token can be retrieved using API call 
[Database Connect](endpoints/database.md#connect).

When developing own plugin you can use it as Plugin Access Token and keep it in your storage.

---

# Short Access Token

This Access Token is living just 1 day. Can be retrieved using API call
[Auth Subscribe](endpoints/auth.md#subscribe).

To retrieve it you should call that endpoint with [Long Access Token](GLOSSARY.md#long-access-token).

---
