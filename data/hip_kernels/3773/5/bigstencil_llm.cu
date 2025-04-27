#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't access out of bounds memory
    if (i < gridDim.x * blockDim.x) {
        out[i] = in[i] + 2;
    }
}