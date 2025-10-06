# Quaternionic Storage Visualization in MATLAB

## Overview

This project visualizes **quaternionic storage of 3D rotation** in MATLAB through an interactive plot with a manual slider.

- Left panel: **Quaternion path on S³ (projected to 3D)** with trace and ±q mirrored path.
- Right panel: **3D rotated vector** corresponding to the quaternion.
- Demonstrates:
  - **Half-angle storage** (`θ/2` inside the quaternion).
  - **SU(2) double-cover property** (±q represent the same rotation).
  - **Continuous rotation** without gimbal lock.

---

## How to Use

1. Open `QuaternionVisualization.m` in MATLAB.
2. Run the script.
3. Adjust the **slider** at the bottom to set the rotation angle θ.
4. Observe:
   - Left: quaternion moves along S³ projection.
   - Right: rotated vector (red) vs original (blue).
5. No autoplay — this version is fully manual for user control.

---

## Mathematical Background

A rotation quaternion is defined as:
~~~
s = cos(theta/2)
v = [ ux*sin(theta/2), uy*sin(theta/2), uz*sin(theta/2) ]
q = [ s, v[0], v[1], v[2] ]
~~~

- **θ** — rotation angle in 3D space  
- **u** — unit vector rotation axis  
- **Half-angle** — stored as θ/2 in quaternion space.  

Applying the rotation to vector **v**:

~~~
v' = q, v, q^{-1}
~~~

---

## Features

| Feature | Description |
|----------|-------------|
| S³ Projection | Quaternion trajectory shown in 3D projection |
| ±q Mirroring | Faint mirrored path showing double cover |
| Trace Line | Visual trace of quaternion path |
| 3D Rotation | Red rotated vector vs blue reference |
| Slider | Manual control of rotation angle |

---

## Files Included

- `QuaternionVisualization.m` — main MATLAB script  
- `diagram.png` — schematic showing S³ projection and vector rotation  
- `README.md` — documentation (this file)

---

## Requirements

- MATLAB R2020a or later  
- No additional toolboxes required

---

## Credits

Developed for quaternionic visualization and SU(2) storage exploration in MATLAB.
