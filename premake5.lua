workspace "HaketonEngine"
	architecture "x64"
	targetdir "build"
	
	configurations 
	{ 
		"Debug", 
		"Release",
		"Dist"
	}

	flags
	{
		"MultiProcessorCompile"
	}

	startproject "HaketonEditor"
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "Dependencies.lua"

group "Dependencies"
include "HaketonEngine/thirdparty/GLFW"
include "HaketonEngine/thirdparty/Glad"
include "HaketonEngine/thirdparty/ImGui"
group ""

group "Core"
project "HaketonEngine"
	location "HaketonEngine"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "hepch.h"
	pchsource "HaketonEngine/src/hepch.cpp"

	files 
	{ 
		"%{prj.name}/src/**.h", 
		"%{prj.name}/src/**.c", 
		"%{prj.name}/src/**.hpp", 
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/thirdparty",

		"%{IncludeDir.stb}",
		--"%{IncludeDir.yaml_cpp}",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.entt}",
	}
	
	links
	{ 
		"GLFW",
		"Glad",
		"ImGui",
		--"opengl32.lib",
	}
	
	--filter "files:Hazel/vendor/FastNoise/**.cpp or files:Hazel/vendor/yaml-cpp/src/**.cpp"
   	--flags { "NoPCH" }

	filter "system:windows"
		systemversion "latest"
		
		defines 
		{ 
			"HE_PLATFORM_WINDOWS",
			"HE_BUILD_DLL"
		}

	filter "configurations:Debug"
		defines "HE_DEBUG"
		symbols "On"
				
		links
		{
			--"%{Library.ShaderC_Debug}",
			--"%{Library.SPIRV_Cross_Debug}",
			--"%{Library.SPIRV_Cross_GLSL_Debug}",
			--"%{Library.SPIRV_Tools_Debug}",
		}

	filter "configurations:Release"
		defines
		{
			"HE_RELEASE",
			"NDEBUG" -- PhysX Requires This
		}

		links
		{
			--"%{Library.ShaderC_Release}",
			--"%{Library.SPIRV_Cross_Release}",
			--"%{Library.SPIRV_Cross_GLSL_Release}",
		}

		optimize "On"

	filter "configurations:Dist"
		defines "HE_DIST"
		optimize "On"


group "Tools"
project "HaketonEditor"
	location "HaketonEditor"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	links 
	{ 
		"HaketonEngine"
	}
	
	files 
	{ 
		"%{prj.name}/src/**.h", 
		"%{prj.name}/src/**.c", 
		"%{prj.name}/src/**.hpp", 
		"%{prj.name}/src/**.cpp" 
	}
	
	includedirs 
	{
		"%{prj.name}/src",
		"HaketonEngine/src",
		"HaketonEngine/vendor",
		"%{IncludeDir.entt}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.Glad}",
	}

	postbuildcommands 
	{
		--'{COPY} "../Hazel/vendor/NvidiaAftermath/lib/x64/GFSDK_Aftermath_Lib.x64.dll" "%{cfg.targetdir}"'
	}
	
	filter "system:windows"
		systemversion "latest"
				
		defines 
		{ 
			"HE_PLATFORM_WINDOWS"
		}
	
	filter "configurations:Debug"
		defines "HE_DEBUG"
		symbols "on"

		links
		{
		}

		postbuildcommands 
		{		
			--'{COPY} "../Hazel/vendor/VulkanSDK/Bin/shaderc_sharedd.dll" "%{cfg.targetdir}"'
		}
				
	filter "configurations:Release"
		defines "HE_RELEASE"
		optimize "on"

		links
		{
		}

		postbuildcommands 
		{
		}

	filter "configurations:Dist"
		defines "HE_DIST"
		optimize "on"

		links
		{
		}

		postbuildcommands 
		{
		}