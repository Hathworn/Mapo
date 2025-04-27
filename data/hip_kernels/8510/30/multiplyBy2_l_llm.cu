#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplyBy2_l(int *size, long *in, long *out) {
    // Use a register to avoid pointer dereferencing
    const long total_size = *size;
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    
    if (ix < total_size) {
        out[ix] = in[ix] * 2;
    }
}