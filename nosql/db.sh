use Sample

db.departments.insertMany([
    { _id: 1, name: "Engineering", location: "New York" },
    { _id: 2, name: "HR", location: "San Francisco" },
    { _id: 3, name: "Finance", location: "Chicago" },
    { _id: 4, name: "Marketing", location: "Los Angeles" },
    { _id: 5, name: "Sales", location: "Houston" }
]);

db.employees.insertMany([
    { _id: 101, name: "Alice", age: 30, department_id: 1, salary: 70000 },
    { _id: 102, name: "Bob", age: 25, department_id: 1, salary: 60000 },
    { _id: 103, name: "Charlie", age: 28, department_id: 2, salary: 50000 },
    { _id: 104, name: "David", age: 35, department_id: 3, salary: 80000 },
    { _id: 105, name: "Eve", age: 29, department_id: 2, salary: 55000 },
    { _id: 106, name: "Frank", age: 40, department_id: 3, salary: 90000 },
    { _id: 107, name: "Grace", age: 32, department_id: 1, salary: 72000 },
    { _id: 108, name: "Hank", age: 27, department_id: 4, salary: 50000 },
    { _id: 109, name: "Ivy", age: 31, department_id: 5, salary: 67000 },
    { _id: 110, name: "Jack", age: 26, department_id: 2, salary: 48000 },
    { _id: 111, name: "Karen", age: 38, department_id: 3, salary: 85000 },
    { _id: 112, name: "Leo", age: 24, department_id: 1, salary: 58000 },
    { _id: 113, name: "Mona", age: 29, department_id: 4, salary: 53000 },
    { _id: 114, name: "Nina", age: 30, department_id: 5, salary: 70000 },
    { _id: 115, name: "Oscar", age: 45, department_id: 2, salary: 75000 },
    { _id: 116, name: "Paul", age: 28, department_id: 3, salary: 62000 },
    { _id: 117, name: "Quinn", age: 27, department_id: 4, salary: 51000 },
    { _id: 118, name: "Rachel", age: 33, department_id: 5, salary: 73000 },
    { _id: 119, name: "Steve", age: 26, department_id: 1, salary: 56000 },
    { _id: 120, name: "Tom", age: 37, department_id: 2, salary: 77000 }
]);

db.employees.createIndex({ department_id: 1 })

