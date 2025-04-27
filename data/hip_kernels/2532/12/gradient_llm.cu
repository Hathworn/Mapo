#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradient(float *u, float *g, int nx, int ny)
{
    // Calculate global index
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate linear index
    int idx = px + py * nx;

    // Check boundaries
    if (px < nx && py < ny)
    {
        // Initialize gradient components to zero
        g[2 * idx] = 0;
        g[2 * idx + 1] = 0;

        // Compute gradient along the x-direction if within bounds
        if (px < nx - 1) g[2 * idx] = u[idx + 1] - u[idx];

        // Compute gradient along the y-direction if within bounds
        if (py < ny - 1) g[2 * idx + 1] = u[idx + nx] - u[idx];
    }
}