#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(float* fpPlaneDepthMap, int fpPlaneDepthMap_p, float* maskMap, int maskMap_p, int width, int height, int xp, int yp, float fpPlaneDepth)
{
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Pre-calculate offsets
    int x_offset = x + xp;
    int y_offset = y + yp;

    // Check boundaries and perform computation
    if(x_offset >= 0 && y_offset >= 0 && x_offset < width && y_offset < height && x < width && y < height)
    {
        float depth = maskMap[y * maskMap_p + x];

        if(depth > 0.0f)
        {
            fpPlaneDepthMap[y_offset * fpPlaneDepthMap_p + x_offset] = fpPlaneDepth;
        }
    }
}