#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_tanh(const float* src, float* dst, const int n) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with strided access to cover all elements
    for (int index = tid; index < n; index += blockDim.x * gridDim.x) {
        dst[index] = tanhf(src[index]);
    }
}