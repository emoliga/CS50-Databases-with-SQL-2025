from cs50 import SQL

# Conectar a la base de datos
db = SQL("sqlite:///dont-panic.db")

# Solicitar nueva contraseña al usuario
password = input("Enter a password: ")

# Actualizar la contraseña del administrador usando prepared statement
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)

print("Password updated successfully!")
