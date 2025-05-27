## 🔧 \[Release] GiveCar Command for ESX Legacy

> A simple script that allows you to spawn a vehicle for a player and automatically register it to their account using the standard ESX vehicle system.

---

### ✨ Features

* ✅ Command: `/givecar [id] [car-model]`
* ✅ Spawns the vehicle directly in front of the player
* ✅ Registers ownership in the database (`owned_vehicles`)
* ✅ Compatible with ESX garages – the player can store it normally
* ✅ Uses `oxmysql`
* ✅ Built for ESX Legacy (works out of the box)

---

### 🛠️ Installation

1. Place the script folder (e.g. `givecar`) inside your `resources` folder.
2. Add this line to your `server.cfg`:

```
ensure givecar
```

3. Make sure `es_extended` and `oxmysql` are started before this script.

---

### 📦 Requirements

* **ESX Legacy**
* **oxmysql**
* Your server uses the default `owned_vehicles` system

---

### 📜 How it works

* Run the command `/givecar [player_id] [car_model]` from the console.
* The vehicle will be spawned in front of the target player.
* It will be saved to their `owned_vehicles` with a random plate.
* The player can store it in their garage as usual.

---

### 💬 Example

```
/givecar 1 sultan
→ Vehicle “sultan” spawned and assigned to player with ID 1.
```

---

### ⚠️ Notes

* This command is **intended for admins** or console use only.
* You can extend the script to add permission checks or logs.

