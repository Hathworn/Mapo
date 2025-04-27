#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sax_kernel(const float a, const float* __restrict__ x, float* __restrict__ result, unsigned int len) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        result[idx] = a * x[idx]; // Use restrict for improved memory access
    }
}