#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getRow_FloatPointer_naive(const float * A, int Acount, int Acols, const float * rowId, int empty_par1, int empty_par2, float * out0, int out0count, int out0cols)
{
    // Calculate unique thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within matrix column bounds
    if (id < Acols)
    {
        // Directly access the specified row and col
        out0[id] = A[id + static_cast<int>(rowId[0]) * Acols];
    }
}