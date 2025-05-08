db.createCollection("employees", {
    bsonType: "object",
    properties: {
      name: { bsonType: "string" }
    }
  });
  