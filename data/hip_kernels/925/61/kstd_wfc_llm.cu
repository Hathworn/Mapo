#include "hip/hip_runtime.h"
#include "includes.h"
__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void kstd_wfc(double *x, double *y, double *z, double *items, double winding, double *phi, double2 *wfc) {
    int gid = getGid3d3d();
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    int zid = blockDim.z * blockIdx.z + threadIdx.z;

    // Precompute reused values
    double inv_item14_sq = 1.0 / (items[14] * items[14]);
    double inv_items15_sq = 1.0 / (items[15] * items[15]);
    double inv_items16_sq = 1.0 / (items[16] * items[16]);
    double inv_items17_sq = 1.0 / (items[17] * items[17]);

    phi[gid] = -fmod(winding * atan2(y[yid], x[xid]), 2 * PI);

    double exponent = exp(-(x[xid] * x[xid] * inv_item14_sq * inv_items15_sq
                          + y[yid] * y[yid] * inv_item14_sq * inv_items16_sq
                          + z[zid] * z[zid] * inv_item14_sq * inv_items17_sq));
    // Reduce redundant computations
    wfc[gid].x = exponent * cos(phi[gid]);
    wfc[gid].y = -exponent * sin(phi[gid]);
}