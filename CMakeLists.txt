cmake_minimum_required(VERSION 3.15)
project(BattleIA VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Options de build
if(MSVC)
    add_compile_options(/W3 /utf-8)
else()
    add_compile_options(-W3 -O2)
endif()

# Recherche de Raylib
# Sur Linux/macOS on utilise pkg-config ou find_package
# Sur Windows on laisse vcpkg ou l'utilisateur gérer
find_package(raylib 5.0 QUIET)
if(NOT raylib_FOUND)
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(RAYLIB raylib)
endif()

# Sources
file(GLOB_RECURSE SOURCES "src/*.cpp")
# Exclure les fichiers de diagnostic ou incomplets
list(FILTER SOURCES EXCLUDE REGEX "DiagnoseEntity.cpp")
list(FILTER SOURCES EXCLUDE REGEX "FlecsEntityManager.cpp")

add_executable(BattleIA_App ${SOURCES})

# Inclusions
target_include_directories(BattleIA_App PRIVATE 
    src 
    external 
    external/entt
)

# Liens
if(raylib_FOUND)
    target_link_libraries(BattleIA_App PRIVATE raylib)
else()
    target_link_libraries(BattleIA_App PRIVATE ${RAYLIB_LIBRARIES})
    target_include_directories(BattleIA_App PRIVATE ${RAYLIB_INCLUDE_DIRS})
    target_link_directories(BattleIA_App PRIVATE ${RAYLIB_LIBRARY_DIRS})
endif()

if(UNIX AND NOT APPLE)
    target_link_libraries(BattleIA_App PRIVATE GL m pthread dl rt X11)
elseif(APPLE)
    target_link_libraries(BattleIA_App PRIVATE "-framework OpenGL" "-framework Cocoa" "-framework IOKit" "-framework CoreVideo")
endif()

# Installation des ressources dans le dossier de build
file(COPY assets DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
