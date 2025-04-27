#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) +
                   (threadIdx.y * blockDim.x) +
                   (threadIdx.z * (blockDim.x * blockDim.y)) + 
                   threadIdx.x;
    return threadId;
}

__global__ void ktorus_V(double *x, double *y, double *z, double* items, double *Ax, double *Ay, double *Az, double *V) {
    int gid = getGid3d3d();
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    int zid = blockDim.z * blockIdx.z + threadIdx.z;

    double deltaX = x[xid] - items[6];
    double deltaY = y[yid] - items[7];
    double rad = sqrt(deltaX * deltaX + deltaY * deltaY) - 0.5 * items[0];
    
    double omegaR = items[3] * items[3] + items[4] * items[4];
    double deltaZ = z[zid] - items[8];
    double V_tot = 2 * items[5] * items[5] * deltaZ * deltaZ + 
                   omegaR * (rad * rad + items[12] * rad * z[zid]);
    double AxVal = Ax[gid], AyVal = Ay[gid], AzVal = Az[gid];
    
    // Optimized calculation reduced repetitive memory accesses
    V[gid] = 0.5 * items[9] * (V_tot + 
                               AxVal * AxVal + 
                               AyVal * AyVal + 
                               AzVal * AzVal);
}