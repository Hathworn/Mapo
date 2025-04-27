#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecMult(float* a, float* b, float* c, const int N) {
    // Optimized index computation
    const int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if (i < N) {
        c[i] = a[i] * b[i];
    }
}