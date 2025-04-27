#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int* arr, int offset_min, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use early exit strategy to reduce divergence
    if (i >= n || i < 0) return;

    // Efficient array access
    int idx = i + offset_min;
    arr[idx] += 1;
}