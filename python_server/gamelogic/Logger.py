from datetime import datetime


class Logger:
    PRINT_ON = True
    PRINT_IN_FILE = True
    ADD_TIME = True
    file_string = ""
    FILE_NAME = "log.txt"


    def log(self, input):
        text = str(input)

        now = datetime.now()
        current_time = now.strftime("%d.%m.%Y %H:%M:%S")
        time_str = ""
        if(self.ADD_TIME):
            time_str = current_time + ": "


        if(self.PRINT_ON):
            print(time_str + text)
        # if(self.PRINT_IN_FILE):
        #     self.file_string += text + '\n'

        # if put in destructor method, open function isn't available anymore
        if(self.PRINT_IN_FILE):
            with open(self.FILE_NAME, "a") as text_file:
                text_file.write(time_str + text + "\n")        
