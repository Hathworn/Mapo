#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(float* fpPlaneDepthMap, int fpPlaneDepthMap_p, float* maskMap, int maskMap_p, int width, int height, int xp, int yp, float fpPlaneDepth)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit for threads outside of the bounds
    if((x >= width) || (y >= height)) return;

    // Compute target position with offset
    int target_x = x + xp;
    int target_y = y + yp;

    // Check target position bounds condition
    if((target_x >= 0) && (target_y >= 0) && (target_x < width) && (target_y < height))
    {
        float depth = maskMap[y * maskMap_p + x];

        // Update map depth only when depth condition met
        if(depth > 0.0f)
        {
            fpPlaneDepthMap[target_y * fpPlaneDepthMap_p + target_x] = fpPlaneDepth;
        }
    }
}