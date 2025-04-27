#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y))
                 + threadIdx.x;
    return threadId;
}

__global__ void kring_Az(double *x, double *y, double *z, double xMax, double yMax, double zMax, double omegaX, double omegaY, double omegaZ, double omega, double fudge, double *A) {
    int gid = getGid3d3d();
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Optimized by reusing common subexpression
    double x_val = x[xid];
    double y_val = y[yid];
    double rad = sqrt(x_val * x_val + y_val * y_val);
    
    // Reduced operations by pre-computing constants
    double exp_coeff = omega * 0.01;
    double rad_coeff = -1.0 / (0.0001 * xMax);
    
    A[gid] = exp_coeff * exp(rad * rad * rad_coeff);
}