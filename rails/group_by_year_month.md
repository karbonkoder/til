Grouping by year and month to see how e.g. entries in model are created
```
Model.group('DATE_FORMAT(created_at, "%Y-%m")').count
```
