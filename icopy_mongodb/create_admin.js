db.createUser(
  {
    user: "icopy",
    pwd: "icopy222",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" }, { role: "root", db: "admin" }, "readWriteAnyDatabase" ]
  }
)
