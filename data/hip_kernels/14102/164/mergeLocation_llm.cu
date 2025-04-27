#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized mergeLocation kernel function
__global__ void mergeLocation(const short2* __restrict__ loc_, float* __restrict__ x, float* __restrict__ y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid unnecessary branching and memory access within bounds
    if (ptidx >= npoints) return;
    
    short2 loc = loc_[ptidx];
    
    // Direct computation to reduce instruction count
    x[ptidx] = __fmul_rn(loc.x, scale);
    y[ptidx] = __fmul_rn(loc.y, scale);
}