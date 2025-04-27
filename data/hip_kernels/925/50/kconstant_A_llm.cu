#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    // Optimize thread ID calculation using built-in function
    int threadId = threadIdx.x + blockIdx.x * blockDim.x 
                 + threadIdx.y * blockDim.x * gridDim.x 
                 + blockIdx.y * blockDim.x * blockDim.y * gridDim.x
                 + threadIdx.z * blockDim.x * blockDim.y * gridDim.x * gridDim.y
                 + blockIdx.z * blockDim.x * blockDim.y * gridDim.x * gridDim.y;
    return threadId;
}

__global__ void kconstant_A(double *x, double *y, double *z, double xMax, double yMax, double zMax, double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A){
    int gid = getGid3d3d();
    // Optimize array access with direct indexing
    A[gid] = 0;
}