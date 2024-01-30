![Brazzers Development Discord](https://i.imgur.com/nXhPxIO.png)

<details>
    <summary><b>Important Links</b></summary>
        <p>
            <a href="https://discord.gg/J7EH9f9Bp3">
                <img alt="GitHub" src="https://logos-download.com/wp-content/uploads/2021/01/Discord_Logo_full.png"
                width="150" height="55">
            </a>
        </p>
        <p>
            <a href="https://ko-fi.com/mannyonbrazzers">
                <img alt="GitHub" src="https://uploads-ssl.webflow.com/5c14e387dab576fe667689cf/61e11149b3af2ee970bb8ead_Ko-fi_logo.png"
                width="150" height="55">
            </a>
        </p>
</details>

# Installation steps

Add this to your items.lua in ox_inventory:
```lua

	["nitrous"] = {
		label = "Nitrous Oxide",
		weight = 35000,
		stack = false,
		client = {
			image = "nitrous.png",
			export = 'brazzers-nitrous.nitrous',
		}
	},

```

Drag and drop the resource into your resource list and you're done.

## Features
1. Nitrous flowrate based system - Players are able to cycle nitrous/ purge flow rates effecting consumption, boost, and more
2. Nitrous states are all handled utilizing state bags
3. Nitrous flow/ purge is all synced across all clients
4. Extensive Config
5. Multi-Language Support
6. 
## Dependencies
1. ox_lib
2. ox_inventory