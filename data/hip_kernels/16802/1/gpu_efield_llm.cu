#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ size_t gpu_scalar_index(unsigned int x, unsigned int y, unsigned int z)
{
    return NX * (NY * z + y) + x;
}

__global__ void gpu_efield(double *fi, double *ex, double *ey, double *ez) {
    unsigned int y = blockIdx.y;
    unsigned int z = blockIdx.z;
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Precompute commonly used indices to reduce computation overhead
    size_t idx = gpu_scalar_index(x, y, z);
    
    unsigned int xp1 = (x + 1) % NX;
    unsigned int yp1 = (y + 1) % NY;
    unsigned int zp1 = (z + 1) % NZ;

    unsigned int xm1 = (NX + x - 1) % NX;
    unsigned int ym1 = (NY + y - 1) % NY;
    unsigned int zm1 = (NZ + z - 1) % NZ;
    
    // Reduce repeated function calls by storing results in temporary variables
    double fi_xm1 = fi[gpu_scalar_index(xm1, y, z)];
    double fi_xp1 = fi[gpu_scalar_index(xp1, y, z)];
    double fi_ym1 = fi[gpu_scalar_index(x, ym1, z)];
    double fi_yp1 = fi[gpu_scalar_index(x, yp1, z)];
    double fi_zm1 = fi[gpu_scalar_index(x, y, zm1)];
    double fi_zp1 = fi[gpu_scalar_index(x, y, zp1)];

    ex[idx] = 0.5 * (fi_xm1 - fi_xp1) / dx;
    ey[idx] = 0.5 * (fi_ym1 - fi_yp1) / dy;
    ez[idx] = 0.5 * (fi_zm1 - fi_zp1) / dz;
}