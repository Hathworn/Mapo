#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if i is within bounds to avoid out-of-bound access
    if (i < gridDim.x * blockDim.x) {
        out[i] = in[i] + 2;
    }
}