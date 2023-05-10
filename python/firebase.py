import firebase_admin
from firebase_admin import credentials
from firebase_admin import db


class CloudData:
    def __init__(self, reference):
        cred_obj = credentials.Certificate(
            "drowsy-driver-d0f37-firebase-adminsdk-3mpev-47141aa555.json"
        )

        self.default_app = firebase_admin.initialize_app(
            cred_obj,
            {"databaseURL": "https://drowsy-driver-d0f37-default-rtdb.firebaseio.com/"},
        )
        self.ref = db.reference(reference)

    def uploadTilt(self, isTilt):
        data = {
            "isTilt": isTilt
        }
        # self.ref.set(data)
        self.ref.child('reading').update(data)

    def uploadSleeping(self, isSleeping):
        data = {
            "reading2": {
                "isSleeping": isSleeping
            }
        }
        self.ref.update(data)

    def set_listener(self, callback):
        ref = self.ref.child("data")
        ref.listen(callback)


# import json
# with open("book_info.json", "r") as f:
# file_contents = json.load(f
