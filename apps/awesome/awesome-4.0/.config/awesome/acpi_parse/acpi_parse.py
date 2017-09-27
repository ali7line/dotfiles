import re

with open('battery.log', 'rt') as f:
    data = f.read()
    print(data)

battery_status = r'Battery (\d+): (\w+), (\d+)%'

mobj = re.match(battery_status, data)
if mobj:
    print(mobj.group(1))
    print(mobj.group(2))
    print(mobj.group(3))
