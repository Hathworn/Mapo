#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_gkylCartFieldAbs(unsigned s, unsigned nv, double *out)
{
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x + s;
    
    // Optimize by unrolling loop to maximize memory access coherency and reduce overhead
    int stride = blockDim.x * gridDim.x;
    for (int n = idx; n < s + nv; n += stride) {
        out[n] = fabs(out[n]);
    }
}