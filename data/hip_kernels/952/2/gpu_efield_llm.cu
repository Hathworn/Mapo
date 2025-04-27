#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ size_t gpu_scalar_index(unsigned int x, unsigned int y)
{
    return NX * y + x;
}

__global__ void gpu_efield(double *fi, double *ex, double *ey)
{
    unsigned int y = blockIdx.y;
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for threads outside the x boundary
    if (x >= NX) return;

    unsigned int xp1 = (x + 1) % NX;
    unsigned int yp1 = (y + 1) % NY;
    unsigned int xm1 = (NX + x - 1) % NX;
    unsigned int ym1 = (NY + y - 1) % NY;

    size_t idx = gpu_scalar_index(x, y);
    double phi  = fi[idx];
    double phiL = fi[gpu_scalar_index(xm1, y)];
    double phiR = fi[gpu_scalar_index(xp1, y)];
    double phiU = fi[gpu_scalar_index(x, yp1)];
    double phiD = fi[gpu_scalar_index(x, ym1)];

    // Compute electric field components
    ex[idx] = 0.5 * (phiL - phiR) / dx;
    ey[idx] = 0.5 * (phiD - phiU) / dy;
}