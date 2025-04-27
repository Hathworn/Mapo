#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiplyBy2_self(int *size, int *in, int *out) {
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;

    // Unroll loop to improve performance
    if (ix < *size) {
        int value = in[ix] * 2;
        out[ix] = value;
        in[ix] = value;
    }
}