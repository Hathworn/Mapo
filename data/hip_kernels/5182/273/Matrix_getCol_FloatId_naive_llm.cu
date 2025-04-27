#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getCol_FloatId_naive(const float *A, int Acount, int Acols, float *out0, int out0count, int out0cols, float col_id) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified global thread ID calculation for 1D grid
    if (id < out0count) {
        out0[id] = A[id * Acols + static_cast<int>(col_id)];  // Use static_cast for type conversion
    }
}