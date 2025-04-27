#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_gkylCartFieldAssignAll(unsigned s, unsigned nv, double val, double *out)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x + s;
    int stride = blockDim.x * gridDim.x; 
    // Calculate global index and loop stride

    for (int n = idx; n < s + nv; n += stride)
    {
        // Assign value only within the range of s to s + nv
        out[n] = val;
    }
}