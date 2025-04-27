```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updF_SoA(float *f, float *z1, float *z2, float *g, float tf, float lambda, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Pre-calculate indices
    int idx = px + py * nx;
    if (px < nx && py < ny)
    {
        float DIVZ = 0.0f;
        if (px < nx - 1) DIVZ += z1[idx];
        if (px > 0)      DIVZ -= z1[idx - 1];
        
        if (py < ny - 1) DIVZ += z2[idx];
        if (py > 0)      DIVZ -= z2[idx - nx];
        
        // Optimize division by precomputing reciprocal
        float invDenom = 1.0f / (1.0f + tf * lambda);
        f[idx] = (f[idx] + tf * DIVZ + tf * lambda * g[idx]) * invDenom; // Simplified update
    }
}