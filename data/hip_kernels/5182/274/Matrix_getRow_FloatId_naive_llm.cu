#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getRow_FloatId_optimized(const float *A, int Acount, int Acols, float *out0, int out0count, int out0cols, float row_id) {
    // Calculate 1D block index for better grid and block coordination
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < Acols) { 
        // Pre-calculate row start index in global memory to reduce redundant computation
        int row_start_idx = static_cast<int>(row_id) * Acols;
        out0[id] = A[row_start_idx + id];
    }
}