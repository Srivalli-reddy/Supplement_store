<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h2>Add New Product</h2>

    <form method="post" action="/admin/addProduct" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Product Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Price</label>
            <input type="number" name="price" class="form-control" step="0.01" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Product Image</label>
            <input type="file" name="imageFile" class="form-control" accept="image/*" required>
        </div>

        <button type="submit" class="btn btn-primary">Add Product</button>
        <a href="/admin/dashboard" class="btn btn-secondary">Back</a>
    </form>
</body>
</html>
