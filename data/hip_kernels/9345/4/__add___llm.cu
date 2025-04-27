#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __add__(int *array, int *size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if idx is out of bounds
    if (idx >= *size) return;

    // Eliminate redundant operations
    int before = (idx + 1) % *size;
    int after = (idx == 0) ? (*size - 1) : (idx - 1);

    int temp = array[idx] + array[before] + array[after];
    
    __syncthreads(); // Synchronization barrier
    
    // Update array value
    array[idx] = temp;
}