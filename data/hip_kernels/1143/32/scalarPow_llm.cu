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

__device__ double2 pow(double2 a, int b){
    double r = sqrt(a.x*a.x + a.y*a.y);
    double theta = atan(a.y / a.x);
    return {pow(r, b) * cos(b * theta), pow(r, b) * sin(b * theta)};
}

__global__ void scalarPow(double2* in, double param, double2* out){
    // Calculate global ID
    unsigned int gid = getGid3d3d();
    
    // Using temporary variables to avoid multiple indexing
    double2 input = in[gid];
    
    // Compute powers efficiently; avoid redundant pow function calls
    double r = sqrt(input.x * input.x + input.y * input.y);
    double theta = atan2(input.y, input.x); // Improved precision with atan2
    double pow_r_param = pow(r, param);
    
    // Store result directly after computation
    out[gid] = {pow_r_param * cos(param * theta), pow_r_param * sin(param * theta)};
}