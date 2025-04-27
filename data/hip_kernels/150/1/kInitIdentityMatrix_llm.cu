#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kInitIdentityMatrix(float* a, int size, int num_elements) {
    // Calculate global index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Stride loop for all elements
    for (int x = idx; x < num_elements; x += blockDim.x * gridDim.x) {
        // Set diagonal elements to 1, others to 0
        a[x] = (x % size == x / size) ? 1.0f : 0.0f;
    }
}