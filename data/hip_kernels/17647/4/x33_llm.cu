#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void x33(float* x34, float* x35, float* x36, int x37) {
    // Calculate unique global thread index
    int x39 = threadIdx.x + blockIdx.x * blockDim.x;
    int x38 = blockDim.x * gridDim.x;

    // Ensure the thread works on valid indices
    for (; x39 < x37; x39 += x38) {
        x36[x39] = x34[x39] / x35[x39]; // Element-wise division
    }
}