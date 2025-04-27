#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getRow_FloatId_naive(const float * A, int Acount, int Acols, float * out0, int out0count, int out0cols, float row_id) {
    // Calculate 1D grid-stride loop index to increase parallelism
    int id = blockDim.x * blockIdx.x + threadIdx.x; // Simplified grid index calculation
    int stride = blockDim.x * gridDim.x;            // Determine stride for grid-stride loop
    
    for (int idx = id; idx < Acols; idx += stride) { // Use grid-stride loop for accessing matrix row
        out0[idx] = A[idx + (int)row_id * Acols];    // Copy target row elements to output
    }
}