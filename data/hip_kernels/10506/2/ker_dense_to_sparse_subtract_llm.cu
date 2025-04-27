#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ker_dense_to_sparse_subtract(int n, const unsigned int *idx, float *src, float *trg) {
    // Calculate our global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we do not go out of bounds
    if (id < n) {
        unsigned int targetIndex = idx[id]; // Optimize by reducing indirection
        float valueToSubtract = -src[id];   // Precompute subtraction
        atomicAdd(trg + targetIndex, valueToSubtract); // Perform atomic operation
    }
}