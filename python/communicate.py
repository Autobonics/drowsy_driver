import serial
import time


class Communicate:
    def __init__(self, port, baudrate):
        self.port = port
        self.baudrate = baudrate
        self.obj = serial.Serial(port=self.port, baudrate=self.baudrate, timeout=1)
        self.firstContact = False

    def __str__(self):
        return f"port -{self.port}, Baudrate - {self.baudrate}, Handshaken - {self.is_handshaken()} "

    def get_str(self):
        return self.obj.readline().decode("ascii").split("\r\n")[0]

    def get_str_list(self):
        str = self.get_str()
        return str #.split("-")[:-1]

    def get_int_list(self):
        # list = self.get_str_list()
        val = self.get_str_list()
        try:
            # return [int(val) for val in list]
            return int(val)
        except ValueError:
            pass

    def handshake(self):
        if self.firstContact == False:
            if self.get_str() == "A":
                self.obj.write(
                    b"e"
                )  # to indicate the arduino that the connection is established
                self.obj.reset_input_buffer()  # clear the serial port buffer
                self.obj.reset_output_buffer()
                self.firstContact = (
                    True  # you've had first contact from the microcontroller
                )

            else:
                return self.firstContact
        return self.firstContact

    def is_handshaken(self):
        return self.firstContact

    def sent_get_request(self):
        self.obj.write(b"t")

    def rotate(self):
        self.obj.write(b"r")

    def reverse(self):
        self.obj.write(b"q")

    def stop(self):
        self.obj.write(b"s")

    def speed1(self):
        self.obj.write(b"1")

    def speed2(self):
        self.obj.write(b"2")

    def speed3(self):
        self.obj.write(b"3")

    def speed4(self):
        self.obj.write(b"4")

    def speed5(self):
        self.obj.write(b"5")

    def sendMail(self):
        self.obj.write(b"m")

    def sendAlertOn(self):
        self.obj.write(b"a")

    def sendAlertOff(self):
        self.obj.write(b"o")

    def reset(self):
        self.obj.reset_input_buffer()  # clear the serial port buffer
        self.obj.reset_output_buffer()

    def close(self):
        self.obj.close()

    def open(self):
        self.obj.open()


# def initialize():
#     obj = Communicate("COM18", 9600)
#     time.sleep(1)
#     obj.handshake()
#     return obj


def get_value(obj):
    obj.sent_get_request()
    # List = obj.get_int_list()
    value = obj.get_int_list()
    obj.reset()
    # return List
    return value
