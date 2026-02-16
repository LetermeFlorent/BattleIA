cmake_minimum_required(VERSION 3.15)
project(BattleIA VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# --- Gestion automatique de Raylib (Version Master pour compatibilité 5.5+) ---
include(FetchContent)
FetchContent_Declare(
  raylib
  GIT_REPOSITORY https://github.com/raysan5/raylib.git
  GIT_TAG master
)
set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_GAMES OFF CACHE BOOL "" FORCE)
set(DOWNLOAD_EXTRACT_TIMESTAMP ON)
FetchContent_MakeAvailable(raylib)

# --- Configuration du projet ---
file(GLOB_RECURSE SOURCES "src/*.cpp")
list(FILTER SOURCES EXCLUDE REGEX "DiagnoseEntity.cpp")
list(FILTER SOURCES EXCLUDE REGEX "FlecsEntityManager.cpp")

add_executable(BattleIA_App ${SOURCES})

target_include_directories(BattleIA_App PRIVATE 
    src 
    external 
    external/entt
)

target_link_libraries(BattleIA_App PRIVATE raylib)

if(UNIX AND NOT APPLE)
    target_link_libraries(BattleIA_App PRIVATE GL m pthread dl rt X11 Xcursor Xinerama Xi)
elseif(APPLE)
    target_link_libraries(BattleIA_App PRIVATE "-framework OpenGL" "-framework Cocoa" "-framework IOKit" "-framework CoreVideo")
elseif(WIN32)
    target_link_libraries(BattleIA_App PRIVATE winmm gdi32 opengl32 user32 shell32)
endif()

# Copie des ressources
file(COPY assets DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
