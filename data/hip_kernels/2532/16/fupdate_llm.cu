```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fupdate(float *f, float *z, float *g, float invlambda, int nx, int ny)
{
    // Optimize memory access and computation
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = px + py * nx;
    
    if (px < nx && py < ny) 
    {
        float DIVZ = 0.0f;

        // Pre-calculate indices for divergent terms to minimize repeated calculations
        int z_idx = 2 * idx;
        int nx_offset = py * nx;

        if (px < nx - 1) DIVZ += z[z_idx];
        if (py < ny - 1) DIVZ += z[z_idx + 1];
        if (px > 0) DIVZ -= z[z_idx - 2];
        if (py > 0) DIVZ -= z[z_idx - 2 * nx + 1];

        // Adjust f update calculation for precision
        f[idx] = DIVZ - g[idx] * invlambda;
    }
}