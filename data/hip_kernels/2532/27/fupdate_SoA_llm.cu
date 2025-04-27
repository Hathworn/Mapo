#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fupdate_SoA(float *f, float *z1, float *z2, float *g, float invlambda, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = px + py * nx;
    
    if (px < nx && py < ny)
    {
        // Load Z1 and Z2 values once to reduce global memory access
        float Z1c = z1[idx];
        float Z2c = z2[idx];
        float Z1l = (px > 0) ? z1[idx - 1] : 0.0f;
        float Z2d = (py > 0) ? z2[idx - nx] : 0.0f;

        // compute the divergence using conditional reduction
        float DIVZ = Z1c - Z1l + Z2c - Z2d;

        // update f
        f[idx] = DIVZ - g[idx] * invlambda;
    }
}