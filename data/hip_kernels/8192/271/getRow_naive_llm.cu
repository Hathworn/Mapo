#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getRow_optimized(const float * A, float * row_id, float * out, int Acols) {
    // Calculate the unique global thread ID
    int id = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;
    
    // Ensure that the thread accesses within bounds
    if (id < Acols) {
        // Compute the base index once outside the loop to enhance performance
        int baseIndex = static_cast<int>(*row_id) * Acols;
        out[id] = A[id + baseIndex];
    }
}