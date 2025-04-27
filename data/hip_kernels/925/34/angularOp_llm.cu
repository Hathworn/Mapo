#include "hip/hip_runtime.h"
#include "includes.h"
__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + threadIdx.x + threadIdx.y * blockDim.x
                 + threadIdx.z * (blockDim.x * blockDim.y);
    return threadId;
}

__global__ void angularOp(double omega, double dt, double2* wfc, double* xpyypx, double2* out){
    unsigned int gid = getGid3d3d();
    double op = exp(-omega * xpyypx[gid] * dt); // Compute once and reuse
    double2 wf = wfc[gid]; // Reduce global memory access
    double2 result;
    result.x = wf.x * op;
    result.y = wf.y * op;
    out[gid] = result;
}
```
