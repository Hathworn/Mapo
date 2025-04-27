#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getRow_FloatPointer_optimized(const float * A, int Acount, int Acols, const float * rowId, int empty_par1, int empty_par2, float * out0, int out0count, int out0cols)
{
    // Calculate unique thread id with fewer operations
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread id is within bounds
    if (id < Acols)
    {
        // Optimize memory access pattern by reducing unnecessary operations
        int rowIndex = static_cast<int>(rowId[0]);
        out0[id] = A[id + rowIndex * Acols];
    }
}