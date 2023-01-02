def test_app_response_hello(client):
    assert client.get('/').text == "Hello World!"
