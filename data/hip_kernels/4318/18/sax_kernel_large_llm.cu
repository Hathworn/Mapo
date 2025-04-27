#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sax_kernel_large(const float a, const float* x, float* result, unsigned int len, unsigned int rowsz) {
    // Calculate the global index for each thread
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * rowsz;

    // Ensure valid index before accessing memory
    if (idx < len) {
        // Efficiently compute the result
        result[idx] = a * x[idx];
    }
}