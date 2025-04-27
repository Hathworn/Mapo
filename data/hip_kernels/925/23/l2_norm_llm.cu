#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                 + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * blockDim.y + threadIdx.y) * blockDim.x + threadIdx.x;
    return threadId;
}

__global__ void l2_norm(double2 *in1, double2 *in2, double *out) {
    // Calculate global thread ID once
    int gid = getGid3d3d();
    double2 a = in1[gid];
    double2 b = in2[gid];
    // Compute L2 norm using shared temporary variables
    double sum = a.x * a.x + a.y * a.y + b.x * b.x + b.y * b.y;
    out[gid] = sqrt(sum);
}