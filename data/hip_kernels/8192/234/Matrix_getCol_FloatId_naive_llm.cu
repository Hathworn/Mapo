#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getCol_FloatId_naive(const float * A, int Acount, int Acols, float * out0, int out0count, int out0cols, float col_id)
{
    // Compute unique global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop over rows with thread stride pattern for better utilization
    for (int row = id; row < Acount / Acols; row += blockDim.x * gridDim.x)
    {
        out0[row] = A[row * Acols + (int)col_id];
    }
}