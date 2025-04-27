```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void floattoint(int *out, float *in) {
    // Optimize by ensuring each thread processes one element
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    out[idx] = __float_as_int(in[idx]); // Use intrinsic function for conversion
}