#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                  + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                   + (threadIdx.z * (blockDim.x * blockDim.y))
                   + (threadIdx.y * blockDim.x) + threadIdx.x;
    return threadId;
}

__global__ void ktest_Ax(double *x, double *y, double *z, double xMax, double yMax, double zMax, double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A) {
    // Optimize thread index calculation
    int gid = getGid3d3d();
    int yid = blockIdx.y * blockDim.y + threadIdx.y;
    // Optimize memory access pattern by reusing loaded data
    double yVal = y[yid] * 100000.0;
    A[gid] = (sin(yVal) + 1.0) * yMax * omega;
}