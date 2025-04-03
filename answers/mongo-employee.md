# MONGO

Login

```sh
mongosh -u "admin" -p "password" --authenticationDatabase "admin"
```

Find 

```sh
db.employees.find().pretty()
```

Find Employees in Engineering Department

```sh
db.employees.find({ department_id: 1 })
```

Find Employees with Salary Greater Than 70K

```sh
db.employees.find({ salary: { $gt: 70000 } })
```

Find Employees in finance department

```sh
db.employees.find({ department_id: 3 })
```

Find Employees Aged Between 25 and 30

```sh
db.employees.find({ age: { $gte: 25, $lte: 30 } })
```

Find Employees Sorted by Salary (Descending)

```sh
db.employees.find().sort({ salary: -1 })
```

Find Employees Whose Name Starts with 'A'

```sh
db.employees.find({ name: /^A/ })
```

Find Employees with Salary Between 50K and 80K, Sorted by Age (Ascending)

```sh
db.employees.find({ salary: { $gte: 50000, $lte: 80000 } }).sort({ age: 1 })
```

Find Employees Who Have Either Engineering or Finance Department

```sh
db.employees.find({ department_id: { $in: [1, 3] } })
```

Find the Department with the Highest Average Salary

```sh
db.employees.aggregate([
    { $group: { _id: "$department_id", avgSalary: { $avg: "$salary" } } },
    { $sort: { avgSalary: -1 } },
    { $limit: 1 }
])
```

Join Employees and Departments (Using Aggregation)

```sh
db.employees.aggregate([
    {
        $lookup: {
            from: "departments",
            localField: "department_id",
            foreignField: "_id",
            as: "department_info"
        }
    },
    { $unwind: "$department_info" }
])
```

Salary per department

```sh
db.employees.aggregate([
    { $group: { _id: "$department_id", avgSalary: { $avg: "$salary" } } }
])
```

Count Employees in Each Department

```sh
db.employees.aggregate([
    { $group: { _id: "$department_id", totalEmployees: { $sum: 1 } } }
])
```

Get the Top 3 Highest Paid Employees

```sh
db.employees.aggregate([
    { $sort: { salary: -1 } },
    { $limit: 3 }
])
```

Find Employees and Their Department Names

```sh
db.employees.aggregate([
    {
        $lookup: {
            from: "departments",
            localField: "department_id",
            foreignField: "_id",
            as: "department_info"
        }
    },
    { $unwind: "$department_info" },
    { $project: { name: 1, salary: 1, "department_info.name": 1, _id: 0 } }
])
```


Update employee salary

```sh
db.employees.updateOne(
    { name: "Alice" },
    { $set: { salary: 75000 } }
)
```

Change Department for an Employee

```sh
db.employees.updateOne(
    { name: "Grace" },
    { $set: { department_id: 2 } }
)
```

Delete an employee

```sh
db.employees.deleteOne({ name: "Bob" })
```
