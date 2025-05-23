#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getCol_FloatId_optimized(const float *A, int Acount, int Acols, float *out0, int out0count, int out0cols, float col_id)
{
    int id = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;
    int col_index = (int)col_id; // Avoid repeated casting

    if (id < Acount / Acols)
    {
        out0[id] = A[id * Acols + col_index]; // Use precomputed index
    }
}