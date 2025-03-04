# terminal-ui-lua
# the milestones completed till now
**1. Stacks for Terminal State Management**


- Ensuring terminal states **push before modification** and **pop after use**.
- **Test Case:** Print colored text → Change color → Restore original color.

 **2. Non-Blocking Input**

- Replacing `io.read()` with a **coroutine-based or Copas-based solution**.
- Implementing **real-time input handling** .
- **Test Case:** A simple text input field that updates live as the user types.

**3. Progress Indicators & Bars**

- Expanding the progress system with **spinners, segmented bars, and percentage displays**.
- Implementing **smooth real-time updates** without flickering.
- **Test Case:** Simulated **file download progress bar** with real-time updates.

**4. Hidden Inputs**

- Implementing **password-style input** (e.g., user input appears as `****`).
- **Test Case:** A simple password field where input remains hidden
