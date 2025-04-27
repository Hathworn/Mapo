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

    // Optimize by reducing redundant calculations
    double x1 = in1[gid].x, y1 = in1[gid].y;
    double x2 = in2[gid].x, y2 = in2[gid].y;
    double x3 = in3[gid].x, y3 = in3[gid].y;
    
    // Precompute squares
    double square1 = x1 * x1 + y1 * y1;
    double square2 = x2 * x2 + y2 * y2;
    double square3 = x3 * x3 + y3 * y3;
    
    // Compute normalized sum
    out[gid] = sqrt(square1 + square2 + square3);
}