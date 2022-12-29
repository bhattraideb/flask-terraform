import pytest
from app import app


@pytest.fixture(name="get_client")
def get_client():
    return app.test_client()


def test_app_response_hello(get_client):
    assert get_client.get('/').text == "Hello World!"
