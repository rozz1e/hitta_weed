This script provides a simple way to harvest weed and process it, the resource is fully configurable and everything can be edited from the config file.
If you wish to edit the script and repost it credits would be appreciated.

 ## Preview

 ![harvest](https://github.com/blobb-max/previews/blob/main/weed_harvest.gif)
 ![process](https://github.com/blobb-max/previews/blob/main/weed_process.gif)

## Dependencies
- [esx_core](https://github.com/esx-framework/esx_core)
- [ox_lib](https://github.com/overextended/ox_lib)

## Features
- 0.01 ms (0.03 at most when processing)
- laboratory included (can be disabled in shared.lua)
- process point (coords in shared.lua)
- fully customizable.

## Installation
- Download ZIP
- Drag and drop resource into your server files, make sure to remove -main in the folder name
- Add items to database or inventory that you're using
- Insert resource in server.cfg
- Restart your server

And you are good to go, enjoy!

## Usage
1. Go to harvest point (line 5 in hitta_weed/shared.lua)
2. Harvest weed leafs
3. Go to process point (line 46 in hitta_weed/shared.lua)
4. Process leafs to buds

## Laboratory
If you want to use the script's own laboratory system to go inside the weed lab then leave ENABLED = TRUE on line 32.

```
    lab = {
        enabled = true, -- enable/disable laboratory
        entrance = vec3(990.24, -1852.76, 31.03), -- enter laboratory
        entranceHeading = 177.90, -- where the player should be heading when he leaves lab
        exit = vec3(1066.37, -3183.42, -39.16) -- exit laboratory
    },
```

## License
2024 HiTTA Scripts

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>
