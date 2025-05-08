db.createCollection("glasses", {
    bsonType: "object",
    properties: {
      brand: { bsonType: "string" },
      graduation: {
        bsonType: "object",
        properties: {
          left: { bsonType: "double" },
          right: { bsonType: "double" }
        }
      },
      glass_color: {
        bsonType: "object",
        properties: {
          left: { bsonType: "string" },
          right: { bsonType: "string" }
        }
      },
      frame_type: { bsonType: "string" },
      frame_color: { bsonType: "string" },
      provider: { bsonType: "objectId" },
      price: { bsonType: "double" },
      employee_id: { bsonType: "objectId" },
      sale_date: { bsonType: "date" }
    }
  });
  