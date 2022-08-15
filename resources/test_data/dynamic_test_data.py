import random
import string
from typing import Optional

import names
import requests
from pydantic import Field, BaseModel

import common_const

__all__ = ['prepare_user_model_for_registration', 'register_user_via_api']


def prepare_user_model_for_registration(**kwargs):
    return CreateUserModel.create(**kwargs).dict()


def register_user_via_api():
    create_user_model = prepare_user_model_for_registration()
    response = requests.post(json=create_user_model, url=f"{common_const.URL}api/users")
    assert response.status_code == 201
    return create_user_model


# Ideally it would be share core api package between api and ui tests
class CreateUserModel(BaseModel):
    username: Optional[str] = Field(default_factory=lambda: generate_string())
    password: Optional[str] = Field(default_factory=lambda: generate_string())
    firstname: Optional[str] = Field(default_factory=lambda: names.get_first_name())
    lastname: Optional[str] = Field(default_factory=lambda: names.get_last_name())
    phone: Optional[str] = Field(default_factory=lambda: generate_string(letters=False, length=8))

    @staticmethod
    def create(**kwargs):
        return CreateUserModel(**kwargs)


def generate_string(letters: bool = True, digits: bool = True, punctuation: bool = False, length: int = 5) -> str:
    source_string = ""
    if letters:
        source_string += string.ascii_letters
    if digits:
        source_string += string.digits
    if punctuation:
        source_string += string.punctuation

    return ''.join(random.choices(source_string, k=length))
