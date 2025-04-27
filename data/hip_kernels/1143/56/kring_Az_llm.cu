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

__global__ void kring_Az(double *x, double *y, double *z, double xMax, double yMax, double zMax, double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A){
    int gid = getGid3d3d();

    // Optimize these calculations to avoid unnecessary reads and recompute
    int xid = blockIdx.x * blockDim.x + threadIdx.x;
    int yid = blockIdx.y * blockDim.y + threadIdx.y;

    double x_val = x[xid]; // Cache global memory read
    double y_val = y[yid]; // Cache global memory read
    double rad = sqrt(x_val * x_val + y_val * y_val);

    // Pre-compute constant expression
    double exp_factor = __expf(-rad * rad / (0.0001f * xMax)) * 0.01f;

    A[gid] = omega * exp_factor;
}