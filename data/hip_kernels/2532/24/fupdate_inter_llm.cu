#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fupdate_inter(float *z, float *g, float invlambda, int nx, int ny)
{
    // Calculate unique thread index for current pixel
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = px + py * nx;

    if (px < nx && py < ny) {
        // Compute the divergence efficiently
        float DIVZ = 0.0f;
        
        // Horizontal divergence contributions
        if (px < (nx - 1)) DIVZ += z[3 * idx + 0];
        if (px > 0)       DIVZ -= z[3 * (idx - 1) + 0];

        // Vertical divergence contributions
        if (py < (ny - 1)) DIVZ += z[3 * idx + 1];
        if (py > 0)       DIVZ -= z[3 * (idx - nx) + 1];

        // Update the third component of z
        z[3 * idx + 2] = DIVZ - g[idx] * invlambda;
    }
}