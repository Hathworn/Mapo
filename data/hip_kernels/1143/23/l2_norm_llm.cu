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

__global__ void l2_norm(double2 *in1, double2 *in2, double *out){
    int gid = getGid3d3d();

    // Use temporary variables to store components
    double x1 = in1[gid].x;
    double y1 = in1[gid].y;
    double x2 = in2[gid].x;
    double y2 = in2[gid].y;

    // Calculate the squared magnitudes more clearly
    double norm_val = x1 * x1 + y1 * y1 + x2 * x2 + y2 * y2;

    // Store the result
    out[gid] = sqrt(norm_val);
}