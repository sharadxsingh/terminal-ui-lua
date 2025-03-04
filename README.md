# terminal-ui-lua
# the milestones completed till now
**1. Stacks for Terminal State Management (Start Here)**


- Ensure terminal states **push before modification** and **pop after use**.
- **Test Case:** Print colored text → Change color → Restore original color.

 **2. Non-Blocking Input**

- Replace `io.read()` with a **coroutine-based or Copas-based solution**.
- Implement **real-time input handling** (keypresses should register instantly).
- **Test Case:** A simple text input field that updates live as the user types.

**3. Progress Indicators & Bars**

- Expand the progress system with **spinners, segmented bars, and percentage displays**.
- Implement **smooth real-time updates** without flickering.
- **Test Case:** Simulated **file download progress bar** with real-time updates.

**4. Hidden Inputs**

- Implement **password-style input** (e.g., user input appears as `****`).
- **Test Case:** A simple password field where input remains hidden
