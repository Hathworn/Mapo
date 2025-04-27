#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void complexAbsSum(double2 *in1, double2 *in2, double *out) {
    int gid = getGid3d3d();
    
    // Unroll computation of temp
    double real = in1[gid].x + in2[gid].x;
    double imag = in1[gid].y + in2[gid].y;
    
    // Direct computation without temporary storage
    out[gid] = sqrt(real * real + imag * imag);
}