db.createCollection("clients", {
    bsonType: "object",
    properties: {
      name: { bsonType: "string" },
      address: {
        bsonType: "object",
        properties: {
          street: { bsonType: "string" },
          number: { bsonType: "int" },
          floor: { bsonType: "string" },
          door: { bsonType: "string" },
          city: { bsonType: "string" },
          postal_code: { bsonType: "int" },
          country: { bsonType: "string" }
        }
      },
      telephone: { bsonType: "string" },
      email: { bsonType: "string" },
      register_date: { bsonType: "date" },
      new_client: { bsonType: "bool" },
      refered_by: { bsonType: "objectId" },
      last_shoping: {
        bsonType: "array",
        items: {
          bsonType: "object",
          properties: {
            glass_id: { bsonType: "objectId" },
            purchase_date: { bsonType: "date" }
          }
        }
      }
    }
  });
  