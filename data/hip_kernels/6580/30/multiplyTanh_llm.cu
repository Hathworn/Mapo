#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiplyTanh(float* out, const float* __restrict__ in1, const float* __restrict__ in2, int size) {
    // Use shared memory for input data if beneficial (depending on further optimizations)
    extern __shared__ float sharedIn1[]; 
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling for better performance on large arrays
    for (int i = id; i < size; i += blockDim.x * gridDim.x) {
        out[i] = in1[i] * in2[i];
    }
}