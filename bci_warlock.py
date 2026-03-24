#!/usr/bin/env python3
import random
from datetime import datetime
class WyrdWarlock:
    def __init__(self):
        self.mana = 666
        self.sigils = ["✧", "𐌅", "⛧", "🜁", "⚡"]
    def cast(self, intent: str):
        print(f"🧬 BCI SIGNAL RECEIVED: {intent.upper()}")
        noise = random.randint(8, 25)
        power = len(intent) * noise
        result = "".join(random.choice(self.sigils) for _ in range(power // 6))
        print(f"⚡ Warlock channels {power} units of raw wyrd...")
        print(f"✦ {result} ✦")
        print(f"Time of casting: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        return result
if __name__ == "__main__":
    print("🧠 BCI EEG connected. Speak your intent...")
    warlock = WyrdWarlock()
    try:
        while True:
            intent = input("\nIntent > ")
            if intent.strip() == "": continue
            warlock.cast(intent)
    except KeyboardInterrupt:
        print("\n\n✦ The wyrd fades... until next casting.")
