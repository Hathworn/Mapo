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

__global__ void kring_rotation_Ay(double *x, double *y, double *z, double xMax, double yMax, double zMax, double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A) {
    // Utilize shared memory for frequently accessed data
    __shared__ double sx[BLOCK_SIZE];
    __shared__ double sy[BLOCK_SIZE];
    
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    int zid = blockDim.z * blockIdx.z + threadIdx.z;
    int gid = getGid3d3d();

    // Load data into shared memory
    if (threadIdx.x < blockDim.x) sx[threadIdx.x] = x[xid];
    if (threadIdx.y < blockDim.y) sy[threadIdx.y] = y[yid];
    __syncthreads();
    
    // Ensure thread safety and avoid race conditions
    if(xid < xMax && yid < yMax && zid < zMax) {
        // Compute only after ensuring data is available in shared memory
        double theta = atan2(sy[threadIdx.y], sx[threadIdx.x]);
        A[gid] = (z[zid] + zMax) * sin(theta) * omega * omegaX;
    }
}