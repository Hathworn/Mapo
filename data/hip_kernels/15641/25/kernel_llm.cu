#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int* arr, int offset_min, int n) {
    // Use block and thread indices to calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within valid range
    if (i < 0 || i >= n) return;

    // Perform operation
    arr[i + offset_min] += 1;
}