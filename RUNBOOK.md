# STEM Night Runbook

## Updating a tutorial (any time)

1. Edit the `.md` file (e.g. `Simple.md`).
2. Commit and push to GitHub.
3. Done. The website links pick it up automatically (allow a few minutes for MakeCode's cache).

## Lab WITH internet

Open these on the kid computers (same links as duaneerickson.com):

| Tutorial | Link |
|---|---|
| Make Me Move | https://arcade.makecode.com/#tutorial:github:derickson73/STEM-Nights/Simple |
| Bouncing Sprite | https://arcade.makecode.com/#tutorial:github:derickson73/STEM-Nights/Easy |
| Basic | https://arcade.makecode.com/#tutorial:github:derickson73/STEM-Nights/Basic |

## NO internet (laptop server)

**The night before (while you still have internet):** double-click `Start-StemNight.cmd`.
It pulls the latest tutorials. Close it after it starts.

**At the event:**

1. Connect the laptop and the kid computers to the same network or router.
2. Double-click `Start-StemNight.cmd`.
3. If Windows asks about the firewall, click **Allow** (Private networks).
4. Copy one of the printed links onto the board, e.g.
   `http://192.168.1.20:3232/index.html#tutorial:/stem/Simple`
5. Leave the window open. Press **Ctrl+C** to stop when the night is over.

**Troubleshooting**

- *"Can't find pxt-arcade"* → edit the path inside `Start-StemNight.cmd`.
- *"'pxt' isn't installed"* → run `npm install -g pxt` (needs internet once).
- *Kid computers can't connect* → check they're on the same network and that the firewall prompt was allowed. Try the link on the laptop itself first.
- *Brand-new laptop* (one-time setup, needs internet):
  ```
  npm install -g pxt
  git clone https://github.com/microsoft/pxt-arcade
  cd pxt-arcade
  npm install
  git clone https://github.com/derickson73/STEM-Nights
  ```
