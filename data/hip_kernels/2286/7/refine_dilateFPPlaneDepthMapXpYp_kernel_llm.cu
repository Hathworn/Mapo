#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(float* fpPlaneDepthMap, int fpPlaneDepthMap_p, float* maskMap, int maskMap_p, int width, int height, int xp, int yp, float fpPlaneDepth)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds only once for improved performance
    if((x < width) && (y < height))
    {
        int new_x = x + xp;
        int new_y = y + yp;

        // Simplified bounds checking for the target position
        if((new_x >= 0) && (new_y >= 0) && (new_x < width) && (new_y < height))
        {
            float depth = maskMap[y * maskMap_p + x];
            if(depth > 0.0f)
            {
                fpPlaneDepthMap[new_y * fpPlaneDepthMap_p + new_x] = fpPlaneDepth;
            }
        }
    }
}