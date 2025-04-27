```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getRow_optimized(const float * A, float * row_id, float * out, int Acols) {
    // Calculate flattened global index
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    
    // Optimize memory access by calculating row offset only once
    int rowOffset = (int)(*row_id) * Acols;
    
    // Perform data assignment if within valid range
    if (id < Acols) {
        out[id] = A[id + rowOffset];
    }
}