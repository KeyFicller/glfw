project "glfw"
    kind "StaticLib"
    language "C"
    staticruntime "on"
    
    targetdir(g_workspaceDir .. "/bin/" .. g_outputDir .. "/%{prj.name}")
    objdir(g_workspaceDir .. "/bin-int/" .. g_outputDir .. "/%{prj.name}")

    defines {"_CRT_SECURE_NO_WARNINGS", "_GLFW_WIN32"}

	files
	{
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/**.h",
        "src/**.c"
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