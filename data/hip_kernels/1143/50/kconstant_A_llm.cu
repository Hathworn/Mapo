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

__global__ void kconstant_A(double *x, double *y, double *z, double xMax, double yMax, double zMax, double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A) {
    // Utilize blockIdx and threadIdx to directly compute gid for increased performance
    int gid = blockIdx.z * (gridDim.y * gridDim.x * blockDim.x * blockDim.y * blockDim.z)
            + blockIdx.y * (gridDim.x * blockDim.x * blockDim.y * blockDim.z)
            + blockIdx.x * (blockDim.x * blockDim.y * blockDim.z)
            + threadIdx.z * (blockDim.x * blockDim.y)
            + threadIdx.y * blockDim.x
            + threadIdx.x;
    
    // Direct memory access for better optimization
    A[gid] = 0.0;
}