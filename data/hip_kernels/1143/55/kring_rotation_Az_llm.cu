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

__global__ void kring_rotation_Az(double *x, double *y, double *z, double xMax, double yMax, double zMax, double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A){
    int gid = getGid3d3d();
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;

    // Cache x[xid] and y[yid] values to avoid redundant global memory accesses
    double x_val = x[xid];
    double y_val = y[yid];

    // Compute radius using cached values
    double r = sqrt(x_val * x_val + y_val * y_val);

    // Calculate and store result
    A[gid] = r * omega * omegaX;
}