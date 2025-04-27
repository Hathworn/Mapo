#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void floattoint(int *out, float *in) {
    // Use thread index to support parallel execution
    int idx = threadIdx.x;
    // Compute conversion within bounds check for efficiency
    if (idx < 1) {
        out[idx] = __float_as_int(in[idx]);
    }
}