#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void fupdate_dummy(float *f, float *z1, float *z2, float *g, float invlambda, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = px + py * nx;

    if (px < nx && py < ny)
    {
        // Use local variables to store reusable values
        float Z1c = z1[idx];
        float Z2c = z2[idx];
        float gVal = g[idx];

        // Compute divergence using conditional operators for cleaner code
        float DIVZ = ((px < nx - 1) ? Z1c : 0) + ((py < ny - 1) ? Z2c : 0);

        // Update f
        f[idx] = DIVZ - gVal * invlambda;
    }
}