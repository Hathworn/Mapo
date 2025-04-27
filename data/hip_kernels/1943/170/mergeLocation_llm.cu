#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure active thread processes valid points only
    if (ptidx >= npoints)
        return;

    short2 loc = loc_[ptidx];

    // Use FMAD for potential performance gain
    x[ptidx] = __fmul_rn(loc.x, scale);
    y[ptidx] = __fmul_rn(loc.y, scale);
}