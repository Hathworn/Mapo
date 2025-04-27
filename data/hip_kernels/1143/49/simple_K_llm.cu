#include "hip/hip_runtime.h"
#include "includes.h"

#define HBAR 1.0545718e-34 // Define Planck constant if not already defined

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void simple_K(double *xp, double *yp, double *zp, double mass, double *K) {
    unsigned int gid = getGid3d3d();

    // Pre-compute HBAR^2 / (2 * mass) for reuse
    double factor = HBAR * HBAR / (2 * mass);

    // Use single index calculations for efficiency
    unsigned int xid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yid = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int zid = blockIdx.z * blockDim.z + threadIdx.z;

    // Ensure indices are within bounds
    if (xid < gridDim.x * blockDim.x && yid < gridDim.y * blockDim.y && zid < gridDim.z * blockDim.z) {
        double x_val = xp[xid];
        double y_val = yp[yid];
        double z_val = zp[zid];

        // Compute energy contribution from x, y, z components
        K[gid] = factor * (x_val * x_val + y_val * y_val + z_val * z_val);
    }
}