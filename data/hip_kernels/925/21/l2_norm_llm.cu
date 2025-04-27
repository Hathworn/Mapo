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

__global__ void l2_norm(double2 *in1, double2 *in2, double2 *in3, double *out) {
    int gid = getGid3d3d();

    // Load values into registers to reduce global memory access latency
    double2 val1 = in1[gid];
    double2 val2 = in2[gid];
    double2 val3 = in3[gid];

    // Calculate the sum of squares to improve readability
    double sum_squares = val1.x * val1.x + val1.y * val1.y
        + val2.x * val2.x + val2.y * val2.y
        + val3.x * val3.x + val3.y * val3.y;

    // Compute square root and store in output array
    out[gid] = sqrt(sum_squares);
}