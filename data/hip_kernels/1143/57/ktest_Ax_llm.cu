#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                  + threadIdx.z * (blockDim.x * blockDim.y)
                  + threadIdx.y * blockDim.x
                  + threadIdx.x;
    return threadId;
}

__global__ void ktest_Ax(double *x, double *y, double *z, double xMax, double yMax, double zMax, double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A) {
    int gid = getGid3d3d();
    
    // Precompute values shared by threads in the same block
    __shared__ double shared_yMaxOmega;
    if (threadIdx.x == 0 && threadIdx.y == 0 && threadIdx.z == 0) {
        shared_yMaxOmega = yMax * omega;
    }
    __syncthreads(); // Ensure all threads have the shared value

    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    A[gid] = (sin(y[yid] * 100000) + 1) * shared_yMaxOmega;  // Use shared value
}