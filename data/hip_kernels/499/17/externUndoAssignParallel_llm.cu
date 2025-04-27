#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void externUndoAssignParallel(int* domain, int size, int value) {

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check if index is valid and not equal to value
    if (idx < size && idx != value) {
        // Use atomic operation to increment domain element to avoid race conditions
        atomicAdd(&domain[idx], 1);
    }
}