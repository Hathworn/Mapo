#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* __restrict__ in, int* __restrict__ out) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Load data from global memory to register
    int temp = in[i];
    // Perform computation
    temp += 2;
    // Store results back to global memory
    out[i] = temp;
}