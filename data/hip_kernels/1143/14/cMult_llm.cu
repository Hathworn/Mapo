#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ unsigned int getGid3d3d() {
    return blockIdx.x + blockIdx.y * gridDim.x
        + gridDim.x * gridDim.y * blockIdx.z;
}

__global__ void cMult(double2* in1, double2* in2, double2* out) {
    unsigned int gid = getGid3d3d() * blockDim.x * blockDim.y * blockDim.z
                       + threadIdx.z * blockDim.x * blockDim.y
                       + threadIdx.y * blockDim.x + threadIdx.x;
                       
    double2 tin1 = in1[gid];
    double2 tin2 = in2[gid];
    
    // Perform complex number multiplication
    out[gid].x = tin1.x * tin2.x - tin1.y * tin2.y;
    out[gid].y = tin1.x * tin2.y + tin1.y * tin2.x;
}