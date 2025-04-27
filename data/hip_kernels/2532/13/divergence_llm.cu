```cuda
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void divergence(float *v, float *d, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread only processes valid indices
    if (px < nx && py < ny)
    {
        int idx = px + py * nx;
        float AX = 0;
        
        // Unroll operations to reduce calculations
        if (px < nx - 1) AX += v[2 * idx];
        if (px > 0)      AX -= v[2 * (idx - 1)];

        if (py < ny - 1) AX += v[2 * idx + 1];
        if (py > 0)      AX -= v[2 * (idx - nx) + 1];

        // Store result
        d[idx] = AX;
    }
}