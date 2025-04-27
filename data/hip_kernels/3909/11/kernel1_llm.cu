#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel1(float *dW, float *dWcurr, int N) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure id is within bounds and copy data
    if (id < N) {
        dWcurr[id] = dW[id];
    }
    // Coalesce memory access by using stride loop
    id += blockDim.x * gridDim.x;
    while (id < N) {
        dWcurr[id] = dW[id];
        id += blockDim.x * gridDim.x;
    }
}