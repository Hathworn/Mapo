#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(float* fpPlaneDepthMap, int fpPlaneDepthMap_p, float* maskMap, int maskMap_p, int width, int height, int xp, int yp, float fpPlaneDepth)
{
    // Compute global thread coordinates
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if coordinates are within bounds after translating by xp and yp
    int newX = x + xp;
    int newY = y + yp;
    if (newX >= 0 && newY >= 0 && newX < width && newY < height && x < width && y < height)
    {
        float depth = maskMap[y * maskMap_p + x];
        // Set fpPlaneDepthMap value if depth is greater than 0
        if (depth > 0.0f)
        {
            fpPlaneDepthMap[newY * fpPlaneDepthMap_p + newX] = fpPlaneDepth;
        }
    }
}