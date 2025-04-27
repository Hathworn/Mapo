```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideScalar(float* mat, float alpha, float* dest, unsigned int len) {
    // Use built-in variable to compute index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop with stride equal to total number of threads
    while (idx < len) {
        dest[idx] = mat[idx] / alpha;
        idx += blockDim.x * gridDim.x;
    }
}