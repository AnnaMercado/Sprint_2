db.createCollection("clients", {
    bsonType: "object",
    properties: {
      name: { bsonType: "string" },
      address: {
        bsonType: "object",
        properties: {
          street: { bsonType: "string" },
          number: { bsonType: "int" },
          city: { bsonType: "string" },
          postal_code: { bsonType: "int" }
        }
      },
      telephone: { bsonType: "string" },
      email: { bsonType: "string" },
      register_date: { bsonType: "date" },
      new_client: { bsonType: "bool" },
      refered_by: { bsonType: "objectId" }
    }
  });
  