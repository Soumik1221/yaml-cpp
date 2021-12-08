project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	cppdialect "c++17"
	staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-init/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		"include/**.h",
	}

	includedirs
	{
		"include",
	}

	filter "system:windows"
		system "windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "LE_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "LE_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Distribution"
		defines "LE_DIST"
		runtime "Release"
		optimize "on"