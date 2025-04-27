#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread indexing for speedup in case accuracy is an array
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx == 0) {
        // Perform division once with the first thread and if there's only one accuracy value
        *accuracy /= N;
    }
}