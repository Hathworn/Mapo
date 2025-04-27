#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplyBy2(int *size, int *in, int *out) {
    // Use a register variable for size to reduce memory access
    const int totalSize = *size;
    const int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid unnecessary memory access by checking within the loop
    if (ix < totalSize) {
        out[ix] = in[ix] * 2;
    }
}