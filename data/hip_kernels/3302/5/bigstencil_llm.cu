#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensuring thread index is within bounds
    if (i < N) {
        out[i] = in[i] + 2;
    }
}