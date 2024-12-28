#!/usr/bin/env python3
import os
from powerdnsadmin.models.user import User
from powerdnsadmin import create_app

app = create_app()

with app.app_context():
    user = User(
        username=os.getenv("POWERDNS_ADMIN_USERNAME", "admin"),
        plain_text_password=os.getenv("POWERDNS_ADMIN_PASSWORD", "password"),
        email=os.getenv("POWERDNS_ADMIN_EMAIL", "admin@example.com"),
        confirmed=True
    )
    result = user.create_local_user()
    print(result["msg"])

