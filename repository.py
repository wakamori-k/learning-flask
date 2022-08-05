from typing import Dict
from unicodedata import name

from user import User

class UserRepository:
    def __init__(self):
        self.users: Dict[int, User] = {}
    
    def create(self, user: User) -> bool:
        if user.id in self.users:
            return False

        self.users[user.id] = user
        return True

    def read(self, id: int) -> User:
        return self.users.get(id, None)

    def update(self, user: User) -> bool:
        if user.id not in self.users:
            return False
        
        self.users[user.id] = user
        return True

    def delete(self, id: int) -> bool:
        if id not in self.users:
            return False

        del self.users[id]
        return True
