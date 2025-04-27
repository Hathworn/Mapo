#include "hip/hip_runtime.h"
#include "includes.h"
__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) +
                   (threadIdx.y * blockDim.x) +
                   (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__device__ double2 pow(double2 a, int b) {
    double r = sqrt(a.x * a.x + a.y * a.y);
    double theta = atan2(a.y, a.x); // Use atan2 for correct quadrant
    return {pow(r, b) * cos(b * theta), pow(r, b) * sin(b * theta)};
}

__global__ void scalarPow(double2* in, double param, double2* out) {
    unsigned int gid = blockIdx.x * blockDim.x + threadIdx.x; // Simplified linear index
    double2 val = in[gid];
    double r = sqrt(val.x * val.x + val.y * val.y);
    double theta = atan2(val.y, val.x); // Use atan2 for correct quadrant
    double mag = pow(r, param);
    out[gid].x = mag * cos(param * theta);
    out[gid].y = mag * sin(param * theta);
}