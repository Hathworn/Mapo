#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_gkylCartFieldScale(unsigned s, unsigned nv, double fact, double *out)
{
    // Calculate the global index offset
    int n = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Reduce number of iterations by unrolling the loop
    for (int i = n; i < nv; i += blockDim.x * gridDim.x)
    {
        int idx = s + i;
        if (idx < s + nv)
            out[idx] *= fact;
    }
}