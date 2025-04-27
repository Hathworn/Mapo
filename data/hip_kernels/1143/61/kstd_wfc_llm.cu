#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) 
                   + (threadIdx.z * blockDim.y * blockDim.x)  // Optimize thread index calculation
                   + (threadIdx.y * blockDim.x) + threadIdx.x; 
    return threadId;
}

__global__ void kstd_wfc(double *x, double *y, double *z, double *items, double winding, double *phi, double2 *wfc) {

    int gid = getGid3d3d();
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    int zid = blockDim.z * blockIdx.z + threadIdx.z;

    double invItems14Squared = 1.0 / (items[14] * items[14]);  // Pre-compute inverse and square
    double expFactor = exp(-(x[xid] * x[xid] * invItems14Squared / (items[15] * items[15]) 
                         + y[yid] * y[yid] * invItems14Squared / (items[16] * items[16])
                         + z[zid] * z[zid] * invItems14Squared / (items[17] * items[17])));

    phi[gid] = -fmod(winding * atan2(y[yid], x[xid]), 2 * PI);

    double cosPhi = cos(phi[gid]);
    double sinPhi = sin(phi[gid]);

    // Minimize repeated computations
    wfc[gid].x = expFactor * cosPhi;
    wfc[gid].y = -expFactor * sinPhi;
}