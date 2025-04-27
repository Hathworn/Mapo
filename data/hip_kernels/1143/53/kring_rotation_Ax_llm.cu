#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                + threadIdx.z * (blockDim.x * blockDim.y) + threadIdx.y * blockDim.x + threadIdx.x;
    return threadId;
}

__global__ void kring_rotation_Ax(double *x, double *y, double *z, double xMax, double yMax, double zMax,
                                  double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A) {
                                   
    // Calculate unique global thread ID
    int gid = getGid3d3d();
    
    // Calculate thread coordinates in 3D space
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Precompute values to avoid repeated calculations
    double precomputedZ = z[blockDim.z * blockIdx.z + threadIdx.z] + zMax; // Move computation here
    double theta = atan2(y[yid], x[xid]);
    double cosTheta = cos(theta);

    // Calculate the value for A matrix
    A[gid] = precomputedZ * cosTheta * omega * omegaX;
}