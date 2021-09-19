
-- Hazel Dependencies

VULKAN_SDK = os.getenv("VULKAN_SDK")

IncludeDir = {}
IncludeDir["stb"] = "%{wks.location}/HaketonEngine/thirdparty/stb/include"
IncludeDir["yaml_cpp"] = "%{wks.location}/HaketonEngine/thirdparty/yaml-cpp/include"
IncludeDir["GLFW"] = "%{wks.location}/HaketonEngine/thirdparty/GLFW/include"
IncludeDir["Glad"] = "%{wks.location}/HaketonEngine/thirdparty/Glad/include"
IncludeDir["ImGui"] = "%{wks.location}/HaketonEngine/thirdparty/ImGui"
IncludeDir["glm"] = "%{wks.location}/HaketonEngine/thirdparty/glm"
IncludeDir["entt"] = "%{wks.location}/HaketonEngine/thirdparty/entt/include"
--IncludeDir["shaderc"] = "%{wks.location}/HaketonEngine/thirdparty/shaderc/include"
--IncludeDir["SPIRV_Cross"] = "%{wks.location}/HaketonEngine/thirdparty/SPIRV-Cross"
--IncludeDir["VulkanSDK"] = "%{VULKAN_SDK}/Include"

LibraryDir = {}

--LibraryDir["VulkanSDK"] = "%{VULKAN_SDK}/Lib"
--LibraryDir["VulkanSDK_Debug"] = "%{wks.location}/HaketonEngine/thirdparty/VulkanSDK/Lib"

Library = {}
--Library["Vulkan"] = "%{LibraryDir.VulkanSDK}/vulkan-1.lib"
--Library["VulkanUtils"] = "%{LibraryDir.VulkanSDK}/VkLayer_utils.lib"

--Library["ShaderC_Debug"] = "%{LibraryDir.VulkanSDK_Debug}/shaderc_sharedd.lib"
--Library["SPIRV_Cross_Debug"] = "%{LibraryDir.VulkanSDK_Debug}/spirv-cross-cored.lib"
--Library["SPIRV_Cross_GLSL_Debug"] = "%{LibraryDir.VulkanSDK_Debug}/spirv-cross-glsld.lib"
--Library["SPIRV_Tools_Debug"] = "%{LibraryDir.VulkanSDK_Debug}/SPIRV-Toolsd.lib"

--Library["ShaderC_Release"] = "%{LibraryDir.VulkanSDK}/shaderc_shared.lib"
--Library["SPIRV_Cross_Release"] = "%{LibraryDir.VulkanSDK}/spirv-cross-core.lib"
--Library["SPIRV_Cross_GLSL_Release"] = "%{LibraryDir.VulkanSDK}/spirv-cross-glsl.lib"