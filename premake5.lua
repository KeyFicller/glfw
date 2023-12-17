project "glfw"
    kind "SharedLib"
    language "C"
    staticruntime "on"
    
    targetdir(envir_work_space_directory .. "/bin/" .. envir_output_directory .. "/%{prj.name}")
    objdir(envir_work_space_directory .. "/bin-int/" .. envir_output_directory .. "/%{prj.name}")

    defines {"_CRT_SECURE_NO_WARNINGS", "_GLFW_WIN32", "_GLFW_BUILD_DLL"}

	files
	{
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/**.h",
        "src/**.c",
        "premake5.lua"
    }

    postbuildcommands
    {
        ("{COPY} %{cfg.buildtarget.relpath} \"../../bin/" .. envir_output_directory .. "/sandbox/\"")
    }
    
	filter "system:windows"
        systemversion "latest"

        links
        {
            "opengl32.lib"
        }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"