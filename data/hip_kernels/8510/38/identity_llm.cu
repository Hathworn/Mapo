#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void identity(int size, long *in, long *out) {
    // Compute global thread index
    const long ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds and copy data
    if (ix < size) {
        out[ix] = in[ix];
    }
}