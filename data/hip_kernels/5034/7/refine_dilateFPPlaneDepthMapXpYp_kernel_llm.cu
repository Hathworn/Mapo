#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(float* fpPlaneDepthMap, int fpPlaneDepthMap_p, float* maskMap, int maskMap_p, int width, int height, int xp, int yp, float fpPlaneDepth)
{
    // Compute thread's global x and y index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Precompute adjusted indices
    int adjusted_x = x + xp;
    int adjusted_y = y + yp;
    
    // Check if both the original and adjusted indices are within bounds
    if(adjusted_x >= 0 && adjusted_y >= 0 && adjusted_x < width && adjusted_y < height && x < width && y < height)
    {
        // Retrieve depth only once
        float depth = maskMap[y * maskMap_p + x];
        if(depth > 0.0f)
        {
            // Update the target depth map
            fpPlaneDepthMap[adjusted_y * fpPlaneDepthMap_p + adjusted_x] = fpPlaneDepth;
        }
    }
}