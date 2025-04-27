#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(float* fpPlaneDepthMap, int fpPlaneDepthMap_p, float* maskMap, int maskMap_p, int width, int height, int xp, int yp, float fpPlaneDepth)
{
    // Calculate the global thread coordinates
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Avoid redundant boundary checks and ensure coordinates are within bounds
    if((x < width) && (y < height))
    {
        // Reuse calculated depth value if condition is met
        float depth = maskMap[y * maskMap_p + x];
        if(depth > 0.0f)
        {
            int new_x = x + xp;
            int new_y = y + yp;
            
            // Final check to ensure the modified coordinates are within bounds
            if((new_x >= 0) && (new_y >= 0) && (new_x < width) && (new_y < height))
            {
                fpPlaneDepthMap[new_y * fpPlaneDepthMap_p + new_x] = fpPlaneDepth;
            }
        }
    }
}