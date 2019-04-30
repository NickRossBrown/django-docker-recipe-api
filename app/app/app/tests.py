from django.test import TestCase

from app.simpleMath import addSomething

class ExampleTest(TestCase):

    def Test_Add_Something(self):
        """Sample test"""
        self.assertEqual(addSomething(1,2), 4)