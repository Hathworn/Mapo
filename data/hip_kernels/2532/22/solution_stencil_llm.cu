#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void solution_stencil(float *zx, float *zy, float *g, float lambda, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;

    if (px < nx && py < ny)
    {
        int idx = px + py * nx;
        float DIVZ = 0.0f;

        // Optimize divergence computation with fewer condition checks
        if (px < (nx - 1)) DIVZ += zx[idx];
        else if (px > 0) DIVZ -= zx[idx - 1];
        
        if (py < (ny - 1)) DIVZ += zy[idx];
        else if (py > 0) DIVZ -= zy[idx - nx];

        // Update g with computed divergence
        g[idx] = -DIVZ * lambda + g[idx];
    }
}