#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void x24(float* x25, float* x26, float* x27, int x28) {
    int x30 = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Use a stride loop for better memory access pattern
    for (int i = x30; i < x28; i += stride) {
        x27[i] = x25[i] * x26[i];
    }
}