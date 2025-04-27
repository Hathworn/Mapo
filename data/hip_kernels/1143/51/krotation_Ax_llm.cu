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

__global__ void krotation_Ax(double *x, double *y, double *z, double xMax, double yMax, double zMax, double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A) {
    // Obtain global thread index
    int gid = getGid3d3d();
    
    // Compute linear index based on y-dimension of the block and grid
    int yid = blockIdx.y * blockDim.y + threadIdx.y;

    // Optimization: Pre-calculate common expression used in the assignment
    double common_term = -omega * omegaX;

    // Perform the operation
    A[gid] = y[yid] * common_term;
}