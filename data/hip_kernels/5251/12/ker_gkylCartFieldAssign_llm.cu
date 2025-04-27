#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_gkylCartFieldAssign(unsigned s, unsigned nv, double fact, const double *inp, double *out)
{
    // Calculate global thread index
    int n = blockIdx.x * blockDim.x + threadIdx.x;
    // Adjust starting point by s
    int start = n + s;
    // Cache stride once
    int stride = blockDim.x * gridDim.x;

    // Loop over range using calculated stride
    for (int i = start; i < s + nv; i += stride) {
        // Update output
        out[i] = fact * inp[i];
    }
}