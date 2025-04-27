#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale) {
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by limiting memory access and arithmetic operations
    if (ptidx < npoints) {
        short2 loc = __ldg(&loc_[ptidx]); // Use __ldg to cache global memory

        float scaled_x = loc.x * scale;
        float scaled_y = loc.y * scale;

        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}