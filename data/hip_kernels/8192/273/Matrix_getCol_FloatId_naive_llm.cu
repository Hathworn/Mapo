#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void Matrix_getCol_FloatId_optimized(const float * A, int Acols, float * out0, int out0count, float col_id) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < out0count) {
        // Access target column directly more efficiently
        out0[id] = A[id * Acols + static_cast<int>(col_id)];
    }
}