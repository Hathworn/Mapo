#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void kharmonic_V(double *x, double *y, double *z, double* items, double *Ax, double *Ay, double *Az, double *V) {
    int gid = getGid3d3d();

    // Use shared memory to load items data to reduce global memory access
    __shared__ double s_items[12];
    if (threadIdx.x < 12) {
        s_items[threadIdx.x] = items[threadIdx.x];
    }
    __syncthreads();

    // Calculate indices
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    int zid = blockDim.z * blockIdx.z + threadIdx.z;

    // Compute potentials
    double V_x = s_items[3] * (x[xid] + s_items[6]);
    double V_y = s_items[10] * s_items[4] * (y[yid] + s_items[7]);
    double V_z = s_items[11] * s_items[5] * (z[zid] + s_items[8]);

    // Compute final potential energy
    V[gid] = 0.5 * s_items[9] * ((V_x * V_x + V_y * V_y + V_z * V_z)
                + (Ax[gid] * Ax[gid] + Ay[gid] * Ay[gid] + Az[gid] * Az[gid]));
}