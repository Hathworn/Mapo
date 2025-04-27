#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getRow_FloatId_naive(const float * A, int Acount, int Acols, float * out0, int out0count, int out0cols, const float row_id)
{
    // Calculate global thread ID more efficiently by reducing redundant calculations
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid unnecessary floating-point conversion
    int row_offset = __float2int_rd(row_id) * Acols;

    // Only execute if id is less than Acols
    if (id < Acols)
    {
        out0[id] = A[id + row_offset];
    }
}