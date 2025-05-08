db.createCollection("provider", {
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
      fax: { bsonType: "string" },
      nif: { bsonType: "string" }
    }
  });
  