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

__global__ void l2_norm(double *in1, double *in2, double *in3, double *out) {
    // Get unique thread Id for current thread
    int gid = getGid3d3d();
    
    // Load values to local variables to reduce global memory access
    double val1 = in1[gid];
    double val2 = in2[gid];
    double val3 = in3[gid];
    
    // Calculate L2 norm using local variables
    out[gid] = sqrt(val1 * val1 + val2 * val2 + val3 * val3);
}