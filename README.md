# NodeMCU Enumerator

Enumerates multiple ESP8266 / NodeMCU devices according their chipid, e.g. `/dev/nodemcu/5127392` or `/dev/nodemcu/0x4e3ce0` so you can address them easily, and no longer with the ever changing `/dev/ttyUSBx`.

## Requirements

Install `nodemcu-tool`
```
% sudo npm install nodemcu-tool -g
```

Make sure you (username) is part of the `dialout` group:
```
% sudo usermod -a -G dialout "your-username"
```
If you are added newly, preferably reboot the machine.

## Installation

```
% make install
```

you likely have to enter your password so `sudo` can operate can create `/dev/nodemcu` and set the correct group and permissions.

## Usage

```
% nodemcu-enum
/dev/ttyUSB0: /dev/nodemcu/5127392 or /dev/nodemcu/0x4e3ce0
/dev/ttyUSB1: /dev/nodemcu/10453822 or /dev/nodemcu/0x9f833e
/dev/ttyUSB2: /dev/nodemcu/10448928 or /dev/nodemcu/0x9f7020
/dev/ttyUSB3: /dev/nodemcu/10451203 or /dev/nodemcu/0x9f7903
```

then you can connect your devices like:
```
% nodemcu-tool --port /dev/nodemcu/5127392 terminal
% nodemcu-tool --port /dev/nodemcu/5127392 upload --keeppath shell/main.lua
...
```

**Note:**
- `nodemcu-enum` deletes all links in `/dev/nodemcu/*` before (re-)creating new links
- any device which is busy with `nodemcu-tool` or another tool may give an error `cannot query chipid` - best quit all sessions first

Whenever you disconnect or connect an ESP8266 / NodeMCU device, rerun `nodemcu-enum`.
