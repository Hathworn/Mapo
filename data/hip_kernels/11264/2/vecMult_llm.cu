#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecMult(float* a, float* b, float* c, const int N) {
    // Calculate the global index of the thread
    const int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure index is within bounds and perform multiplication
    if (i < N)
        c[i] = a[i] * b[i];
}