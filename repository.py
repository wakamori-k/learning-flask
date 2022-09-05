from typing import Dict

from database import db
from user import User

class UserRepository:
    def create(self, user: User) -> bool:
        exist_user = self.read(id = user.id)
        if exist_user:
            return False        
        
        db.session.add(user)
        db.session.commit()

        return True

    def read(self, id: int) -> User:
        return db.session.query(User).filter_by(id=id).first()

    def update(self, user: User) -> bool:
        exist_user = self.read(id = user.id)
        if exist_user is None:
            return False
        
        exist_user.name = user.name
        db.session.add(exist_user)
        db.session.commit()        

        return True

    def delete(self, id: int) -> bool:
        user = self.read(id = id)
        if user is None:
            return False
        
        db.session.delete(user)
        db.session.commit()

        return True
