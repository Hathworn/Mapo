#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(float* fpPlaneDepthMap, int fpPlaneDepthMap_p, float* maskMap, int maskMap_p, int width, int height, int xp, int yp, float fpPlaneDepth)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure valid indices using early exit strategy
    if((x >= width) || (y >= height) || (x + xp < 0) || (y + yp < 0) || (x + xp >= width) || (y + yp >= height))
    {
        return;
    }

    // Simplified variable declaration and access 
    float depth = maskMap[y * maskMap_p + x];
    if(depth > 0.0f)
    {
        fpPlaneDepthMap[(y + yp) * fpPlaneDepthMap_p + (x + xp)] = fpPlaneDepth;
    }
}