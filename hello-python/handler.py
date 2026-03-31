# 2023BCD0002 SAM RUBEN ABRAHAM
def handle(event, context):
    # convert message to string
    msg = str(event.body)
    return "User message: " + msg