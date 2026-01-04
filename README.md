# 🎮 BattleIA - AI Battle Simulation

> A high-performance AI battle simulation featuring 8000 autonomous entities competing in a dynamic environment with ECS architecture and Elo ranking system.

![C++](https://img.shields.io/badge/C++-17-blue.svg)
![Raylib](https://img.shields.io/badge/Raylib-5.0-red.svg)
![EnTT](https://img.shields.io/badge/EnTT-3.x-green.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

## 🌟 Overview

BattleIA is an advanced AI combat simulation that showcases emergent behavior through:
- **8000+ AI Entities** competing simultaneously
- **Entity Component System (ECS)** using EnTT for optimal performance
- **Elo Rating System** for competitive ranking
- **Dynamic Environment** with multiple terrain types affecting gameplay
- **Real-time Visualization** powered by Raylib
- **Combat & Loot Systems** creating engaging AI behaviors

---

## 📖 Table of Contents

<details>
<summary><b>📚 User Documentation</b></summary>

### Getting Started

#### Installation & Setup

1. **Prerequisites**
   - Windows 10/11 (64-bit)
   - Visual Studio 2019 or later with C++17 support
   - 4GB RAM minimum (8GB recommended)

2. **Building the Project**
   ```bash
   # Clone the repository
   git clone [your-repo-url]
   cd BattleIA
   
   # Open the solution
   # Double-click BattleIA.slnx or open with Visual Studio
   
   # Build configuration
   # Select x64 | Debug or x64 | Release
   # Press F5 to build and run
   ```

3. **Running the Application**
   - Execute `x64/Debug/BattleIA.exe` or `x64/Release/BattleIA.exe`
   - The application will initialize 8000 AI entities automatically

#### Controls & Interface

**Camera Controls**
- **Mouse Wheel**: Zoom in/out (min: 0.01x, max: 3x)
- **Middle Mouse Button**: Pan camera
- **Click Entity**: Select and follow entity
- **Auto-Cam**: Automatically follows the Elo leader after 2 seconds

**Keyboard Shortcuts**
- **F11**: Toggle fullscreen
- **ESC**: Exit application
- **Space**: Pause/Resume simulation (if implemented)

**User Interface**

*Sidebar (Right Panel - 25% of screen)*
- **Entity List**: Scrollable list of all entities
- **Entity Cards**: Display health, Elo rating, and status
- **Sorting Options**: 
  - By Elo (default)
  - By Health
  - By Name
- **Real-time Stats**: Population count, alive entities, combat statistics

*HUD (Main View)*
- **FPS Counter**: Current frame rate
- **Entity Count**: Total alive/dead entities
- **Zoom Level**: Current camera zoom
- **Selected Entity Info**: Detailed stats when an entity is selected

#### Gameplay Mechanics

**AI Behavior**
- Entities autonomously navigate the map
- Combat engagement based on proximity
- Target selection using AI decision system
- Health regeneration and damage dealing
- Elo rating adjusts based on combat outcomes

**Terrain Effects**
- **Water** (Blue): 75% movement speed
- **Sand** (Yellow): Normal movement speed
- **Grass** (Green): Normal movement speed
- **Forest** (Dark Green): Reduced visibility
- **Mountain** (Gray): Impassable terrain
- **Path** (Gold): Increased movement speed

**Combat System**
- Projectile-based combat
- Range-based engagement
- Damage varies based on weapon and stats
- Winner gains Elo, loser loses Elo
- Loot drops on entity death

**End Game Conditions**
- Simulation continues until specified entity threshold
- Winner screen displays top performers
- Statistics and analytics shown at round end

#### Tips & Tricks

1. **Performance Optimization**
   - Lower zoom levels improve performance
   - Disable unnecessary visual effects if FPS drops
   
2. **Observing AI Behavior**
   - Select high-Elo entities to watch optimal strategies
   - Notice how terrain influences combat decisions
   
3. **Understanding Rankings**
   - Elo changes based on expected vs actual combat outcomes
   - Consistent winners rise quickly
   - Survival time also factors into final rankings

#### Troubleshooting

**Low FPS / Performance Issues**
- Reduce window size
- Close other applications
- Check GPU drivers are up to date
- Verify running on dedicated GPU (not integrated)

**Application Crashes**
- Ensure all DLL files are in the executable directory
- Check `raylib.dll` is present
- Verify save.dat file permissions

**Visual Glitches**
- Update graphics drivers
- Try windowed mode instead of fullscreen
- Reduce zoom level

</details>

<details>
<summary><b>🔧 Technical Documentation</b></summary>

### Architecture Overview

BattleIA uses a modern ECS (Entity Component System) architecture powered by EnTT, providing high performance for thousands of entities.

#### Project Structure

```
BattleIA/
├── src/
│   ├── Core/                 # Application core and game loop
│   │   ├── Application.cpp/h # Window management, initialization
│   │   ├── Game.cpp/h        # Main game logic orchestration
│   │   ├── GameLoop.cpp/h    # Update/Render loop
│   │   └── GameStates/       # State machine implementation
│   ├── Entities/             # ECS components and entity definitions
│   │   ├── Components.h      # Core ECS components
│   │   ├── EntityComponents.h# Entity-specific components
│   │   ├── Brain.h           # AI decision-making component
│   │   ├── Item.h            # Item/loot components
│   │   └── Projectile.h      # Projectile entity components
│   ├── Systems/              # ECS systems (behavior logic)
│   │   ├── AISystem.cpp/h    # AI decision-making and pathfinding
│   │   ├── CombatSystem.cpp/h# Combat resolution and damage
│   │   ├── MovementSystem.cpp/h # Entity movement and physics
│   │   ├── EloSystem.cpp/h   # Elo rating calculations
│   │   └── LootSystem.cpp/h  # Loot generation and drops
│   ├── Managers/             # Entity and resource management
│   │   ├── EntityManager.cpp/h    # Entity lifecycle
│   │   ├── ProjectileManager.cpp/h# Projectile management
│   │   ├── ItemManager.cpp/h      # Item/inventory management
│   │   ├── ZoneManager.cpp/h      # Zone/area management
│   │   ├── CameraManager.cpp/h    # Camera control
│   │   └── ResourceManager.cpp/h  # Asset loading
│   ├── Rendering/            # Graphics and visual systems
│   │   ├── Renderer.cpp/h         # Main rendering orchestration
│   │   ├── EntityRenderer.cpp/h   # Entity visual representation
│   │   ├── ProjectileRenderer.cpp/h # Projectile rendering
│   │   ├── MapRenderer.cpp/h      # Terrain rendering
│   │   ├── UIRenderer.cpp/h       # UI rendering
│   │   ├── EffectsRenderer.cpp/h  # Visual effects
│   │   └── FuturisticEffects.h    # Shader effects
│   ├── UI/                   # User interface components
│   │   ├── UIManager.cpp/h        # UI state management
│   │   ├── HUD.cpp/h              # Heads-up display
│   │   ├── Sidebar.cpp/h          # Entity list sidebar
│   │   ├── EndScreen.cpp/h        # Victory/statistics screen
│   │   └── Widgets/               # Reusable UI components
│   ├── World/                # Map and environment
│   │   ├── Map.cpp/h              # Map generation and data
│   │   ├── Tile.h                 # Tile definitions
│   │   └── Zone.cpp/h             # Zone definitions
│   ├── Utils/                # Utility functions
│   │   ├── MathUtils.cpp/h        # Vector math, interpolation
│   │   ├── CollisionUtils.cpp/h   # Collision detection
│   │   ├── RandomUtils.cpp/h      # Random number generation
│   │   ├── Logger.cpp/h           # Logging system
│   │   └── PlatformUtils.cpp/h    # Platform-specific code
│   └── Config/               # Configuration files
│       ├── GameConfig.h           # Game balance parameters
│       ├── RenderConfig.h         # Visual settings
│       ├── EloConfig.h            # Elo system parameters
│       ├── ItemConfig.h           # Item definitions
│       └── Constants.h            # Global constants
├── external/                 # Third-party libraries
│   ├── raylib/              # Graphics library
│   ├── entt/                # ECS framework
│   ├── raygui.h             # UI widgets
│   └── flecs/               # (Alternative ECS, not active)
├── assets/                   # Game assets
│   └── fonts/               # Font files
└── BattleIA.vcxproj         # Visual Studio project file
```

#### Core Technologies

**EnTT (Entity Component System)**
- Header-only library for high-performance ECS
- Sparse set implementation for optimal iteration
- Type-safe component access
- Efficient memory layout (cache-friendly)

**Raylib**
- Cross-platform graphics library
- OpenGL-based rendering
- Built-in 2D camera system
- Immediate-mode drawing API

**RayGUI**
- Immediate-mode GUI for Raylib
- Lightweight UI widgets
- Integrated with Raylib's drawing system

#### ECS Architecture

**Components** (`src/Entities/Components.h`)
```cpp
// Core components (examples)
struct Position { float x, y; };
struct Velocity { float dx, dy; };
struct Health { float current, max; };
struct EloRating { int rating; };
struct Brain { /* AI state */ };
struct CombatStats { /* damage, range, etc. */ };
```

**Systems** (`src/Systems/`)
- Each system processes entities with specific component combinations
- Systems run in a defined order each frame
- Examples: AISystem, CombatSystem, MovementSystem

**Managers** (`src/Managers/`)
- Higher-level orchestration of entities
- Handle spawning, despawning, and lifecycle events
- Interface between systems and game logic

#### Key Algorithms

**Elo Rating System** (`src/Systems/EloSystem.cpp`)
```cpp
// K-factor determines rating volatility
// Expected score calculation based on rating difference
// Winner gains points, loser loses points
// Formula: NewRating = OldRating + K * (ActualScore - ExpectedScore)
```

**AI Decision Making** (`src/Systems/AISystem.cpp`)
- Target selection based on proximity and threat level
- Pathfinding around obstacles
- Combat engagement/disengagement logic
- Retreat when health is low

**Spatial Partitioning**
- Grid-based spatial hashing for collision detection
- Reduces O(n²) collision checks to near O(n)

**Combat Resolution** (`src/Systems/CombatSystem.cpp`)
- Projectile-based combat system
- Range checking before engagement
- Damage calculation with variance
- Death handling and loot spawning

#### Configuration & Tuning

**GameConfig.h** - Main gameplay parameters
```cpp
inline constexpr int AI_COUNT = 8000;        // Number of entities
inline constexpr float AI_SPEED = 4.0f;      // Base movement speed
inline constexpr int AI_BASE_ELO = 100;      // Starting Elo rating
inline constexpr float TILE_SIZE = 64.0f;    // Terrain tile size
inline constexpr int MAP_SIZE = 800;         // Map dimensions
inline constexpr int CFG_TARGET_FPS = 120;   // Target frame rate
```

**EloConfig.h** - Elo system tuning
- K-factor adjustments
- Rating floors/ceilings
- Win/loss multipliers

**ItemConfig.h** - Loot system
- Item spawn rates
- Item stat ranges
- Rarity tiers

#### Performance Optimization

**Rendering Optimizations**
- Frustum culling (only draw visible entities)
- Sprite batching where possible
- Efficient draw call ordering
- LOD (Level of Detail) for distant entities

**Update Optimizations**
- Spatial partitioning for collision detection
- Component-based iteration (cache-friendly)
- Fixed timestep for simulation consistency
- Multithreading considerations (future)

**Memory Management**
- ECS provides automatic memory pooling
- Minimal dynamic allocations per frame
- Object pooling for projectiles
- Efficient component storage layout

#### Building & Debugging

**Build Configurations**
- **Debug**: Full debug symbols, assertions enabled, no optimizations
- **Release**: Optimizations enabled, minimal debug info

**Debug Tools**
- Logger system for runtime diagnostics
- Entity diagnosis function (`DiagnoseEntity.cpp`)
- Visual debug overlays (optional)

**Profiling**
- Use Visual Studio profiler for hotspot analysis
- Watch for ECS system execution times
- Monitor draw call counts

#### Extending the Codebase

**Adding a New Component**
1. Define in `src/Entities/Components.h` or `EntityComponents.h`
2. Add to entity creation in `EntityManager`
3. Create/modify systems to process the component

**Adding a New System**
1. Create `.cpp/.h` files in `src/Systems/`
2. Implement `Update()` method
3. Register in main game loop
4. Define component requirements

**Adding New Terrain Types**
1. Add tile type enum in `Tile.h`
2. Define visual properties in `MapRenderer.cpp`
3. Add movement modifiers in `MovementSystem.cpp`
4. Update map generation in `Map.cpp`

**Creating New UI Widgets**
1. Add widget class in `src/UI/Widgets/`
2. Implement `Draw()` and `Update()` methods
3. Integrate into `UIManager` or specific screens

#### Dependencies

**Runtime Dependencies**
- `raylib.dll` - Graphics library (included in `external/raylib/lib/`)
- Windows system DLLs (winmm, gdi32, opengl32, user32, shell32)

**Development Dependencies**
- Visual Studio 2019+ with C++17 support
- Windows SDK 10.0+

**Third-party Licenses**
- Raylib: zlib/libpng license
- EnTT: MIT license
- Inter Font: SIL Open Font License

#### Performance Benchmarks

Typical performance on recommended hardware:
- **8000 entities**: 60-120 FPS
- **Entity update time**: ~8-12ms per frame
- **Rendering time**: ~4-8ms per frame
- **Memory usage**: ~200-300 MB

#### Known Issues & Limitations

1. **Single-threaded**: Main game loop runs on one thread
2. **Windows-only**: Not currently cross-platform
3. **Fixed entity count**: Entities spawned at initialization
4. **No save/load**: Simulation state is not persistent (save.dat unused)

#### Future Improvements

- [ ] Multithreading for systems
- [ ] Cross-platform support (Linux, macOS)
- [ ] Network multiplayer
- [ ] Replay system
- [ ] Advanced AI strategies
- [ ] Modding support
- [ ] Save/load game state

</details>

<details>
<summary><b>🚀 Quick Start Guide</b></summary>

### Quick Start in 3 Steps

1. **Clone & Open**
   ```bash
   git clone [your-repo-url]
   cd BattleIA
   # Open BattleIA.slnx in Visual Studio
   ```

2. **Build**
   - Select `x64 | Debug` or `x64 | Release`
   - Press `F5` or `Ctrl+Shift+B`

3. **Run & Watch**
   - 8000 AI entities will spawn automatically
   - Watch them battle for supremacy!
   - Use mouse wheel to zoom, middle button to pan

### First-Time Users

**What to Watch For:**
- Entities with higher Elo (darker red) are stronger
- Watch the sidebar for real-time rankings
- Click on entities to follow them
- Notice how terrain affects movement

**Understanding the Simulation:**
- Each entity has its own AI brain
- Combat results affect Elo ratings
- Winners get stronger, losers get weaker
- Last entity standing wins!

</details>

---

## 🛠️ Technology Stack

- **Language**: C++17
- **Graphics**: Raylib 5.0
- **ECS Framework**: EnTT 3.x
- **UI**: RayGUI
- **Build System**: Visual Studio MSBuild
- **Platform**: Windows (x64)

## 📊 Features

- ✅ 8000+ concurrent AI entities
- ✅ Real-time Elo ranking system
- ✅ Dynamic combat simulation
- ✅ Procedural terrain generation
- ✅ Efficient ECS architecture
- ✅ Projectile-based combat
- ✅ Loot and inventory system
- ✅ Real-time UI with entity tracking
- ✅ Camera controls and auto-follow
- ✅ Performance-optimized rendering

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👏 Acknowledgments

- **Raylib** - Amazing graphics library
- **EnTT** - High-performance ECS framework
- **EnTT Community** - Excellent documentation and examples

## 📧 Contact

For questions, suggestions, or issues, please open an issue on the GitHub repository.

---

*Made with ❤️ for AI simulation enthusiasts*