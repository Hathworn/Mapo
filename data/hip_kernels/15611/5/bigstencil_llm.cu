#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds
    if (i < n) {
        out[i] = in[i] + 2;
    }
}