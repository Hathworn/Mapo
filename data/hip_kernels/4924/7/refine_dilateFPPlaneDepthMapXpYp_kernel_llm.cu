#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(
    float* fpPlaneDepthMap, 
    int fpPlaneDepthMap_p, 
    float* maskMap, 
    int maskMap_p, 
    int width, 
    int height, 
    int xp, 
    int yp, 
    float fpPlaneDepth) 
{
    // Calculate the absolute 2D coordinates for each thread
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check if coordinates are within the bounds of both the original and target positions
    if (x < width && y < height) 
    {
        // Calculate potential new positions
        int newX = x + xp;
        int newY = y + yp;
        
        // Verify new positions are within bounds
        if (newX >= 0 && newY >= 0 && newX < width && newY < height) 
        {
            // Read depth from maskMap and check if it's greater than zero
            float depth = maskMap[y * maskMap_p + x];
            if (depth > 0.0f) 
            {
                // Update fpPlaneDepthMap at the new position
                fpPlaneDepthMap[newY * fpPlaneDepthMap_p + newX] = fpPlaneDepth;
            }
        }
    }
}