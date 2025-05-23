#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ size_t gpu_scalar_index(unsigned int x, unsigned int y)
{
    return NX * y + x;
}

__global__ void gpu_initialization(double *r, double *c, double *fi, double *u, double *v, double *ex, double *ey)
{
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y; // Use blockDim.y and threadIdx.y for 2D block
    if (x < NX && y < NY) // Boundary check to ensure coordinates are within array limits
    {
        size_t sidx = gpu_scalar_index(x, y);
        r[sidx] = rho0;
        c[sidx] = 0.0;
        fi[sidx] = voltage * (Ly - dy * y) / Ly;
        u[sidx] = 0.0;
        v[sidx] = 0.0;
        ex[sidx] = 0.0;
        ey[sidx] = 0.0;
    }
}