#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * blockDim.y * blockDim.x) 
                 + (threadIdx.y * blockDim.x) + threadIdx.x;
    return threadId;
}

__global__ void krotation_Ay(double *x, double *y, double *z, double xMax, double yMax, double zMax, 
                             double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A) {
    int gid = getGid3d3d();
    if (gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z) {  // Ensure gid is within bounds
        int xid = blockDim.x * blockIdx.x + threadIdx.x;  // Calculate X index
        A[gid] = x[xid] * omega * omegaY;  // Compute result
    }
}