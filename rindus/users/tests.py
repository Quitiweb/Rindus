from django.test import TestCase

class TestUsersSimple:
    def test_one(self):
        x = "my users simple test"
        assert 'users' in x