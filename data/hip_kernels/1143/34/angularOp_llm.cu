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

__global__ void angularOp(double omega, double dt, double2* wfc, double* xpyypx, double2* out) {
    unsigned int gid = getGid3d3d();

    // Use local registers for temporary storage to reduce repeated memory access
    double2 wfc_val = wfc[gid];
    double xpyypx_val = xpyypx[gid];

    // Precompute common repetitive calculation
    double op = exp(-omega * xpyypx_val * dt);

    // Perform calculations using the precomputed value
    double2 result;
    result.x = wfc_val.x * op;
    result.y = wfc_val.y * op;

    // Output result to global memory
    out[gid] = result;
}