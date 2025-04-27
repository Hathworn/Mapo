#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float relu(float a) {
    return a < 0 ? 0 : a;
}
__global__ void relu_kernel(float *vec, int len) {
    // Calculate unique thread index using built-in variables for better readability
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll the loop to optimize memory access and reduce control flow divergence
    for (int i = index; i < len; i += blockDim.x * gridDim.x) {
        vec[i] = relu(vec[i]);
    }
}