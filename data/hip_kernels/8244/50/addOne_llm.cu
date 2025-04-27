#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addOne(int* array, int size) {
    // Calculate the global index for the current thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the index is within bounds
    if (idx < size) {
        array[idx]++;
    }
}