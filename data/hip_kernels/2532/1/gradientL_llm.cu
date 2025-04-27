#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gradientL(float *u, float *g, int nx, int ny)
{
    // Calculate pixel indices
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;

    // Flatten 2D index to 1D
    int idx = px + py * nx;

    // Ensure computation only within valid range
    if (px < nx && py < ny)
    {
        // Initialize gradient components to zero
        g[2 * idx] = 0;
        g[2 * idx + 1] = 0;

        // Compute x-direction gradient if not at boundary
        if (px < (nx - 1)) 
            g[2 * idx] = u[idx + 1] - u[idx];
        
        // Compute y-direction gradient if not at boundary
        if (py < (ny - 1)) 
            g[2 * idx + 1] = u[idx + nx] - u[idx];
    }
}