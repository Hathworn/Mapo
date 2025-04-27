```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void column_sums(const float *A, float *sums, size_t ds) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x; // 1D thread index
    if (idx < ds) {
        float sum = 0.0f;
        // Use stride for better memory coalescing
        for (size_t i = idx; i < ds * ds; i += ds) {
            sum += A[i];
        }
        sums[idx] = sum;
    }
}