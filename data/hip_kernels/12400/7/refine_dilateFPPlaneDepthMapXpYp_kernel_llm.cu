#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(float* __restrict__ fpPlaneDepthMap, int fpPlaneDepthMap_p, const float* __restrict__ maskMap, int maskMap_p, int width, int height, int xp, int yp, float fpPlaneDepth)
{
    // Calculate global thread coordinates
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds and perform operation only for valid coordinates
    if((x + xp >= 0) && (y + yp >= 0) && (x + xp < width) && (y + yp < height) && (x < width) && (y < height))
    {
        // Read once from global memory
        float depth = maskMap[y * maskMap_p + x];
        if(depth > 0.0f)
        {
            // Write the computed depth value to global memory
            fpPlaneDepthMap[(y + yp) * fpPlaneDepthMap_p + (x + xp)] = fpPlaneDepth;
        }
    }
}