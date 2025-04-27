#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unrolling loop to maximize memory coalescing
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];
        x[ptidx] = __fmul_rn(loc.x, scale); // Use fast multiply
        y[ptidx] = __fmul_rn(loc.y, scale); // Use fast multiply
    }
}