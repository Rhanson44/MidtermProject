<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(to bottom, #a0d6ff, #698c2e);
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 1rem;
            background-color: #f0f0f0;
            border: 1px solid #698c2e;
        }
        .card-title, .card-subtitle {
            color: #698c2e;
        }
        .form-label {
            color: #333;
        }
        .form-control {
            background-color: #fff;
        }
        .btn-primary {
            background-color: #698c2e;
            border-color: #698c2e;
        }
        .btn-primary:hover {
            background-color: #4a6520;
            border-color: #4a6520;
        }
        .text-success {
            color: #28a745;
        }
        .text-danger {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card card-container">
            <div class="card-body">
                <h2 class="card-title text-center">Park It Like It's Hot</h2>
                <h4 class="card-subtitle mb-4 text-center">Register here</h4>
                <form action="register.do" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                </form>
                <div class="mt-3">
                    <p th:if="${message}" class="text-success" th:text="${message}"></p>
                    <p th:if="${error}" class="text-danger" th:text="${error}"></p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
