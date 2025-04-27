#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Matrix_MultiplElementWise_optimized(const float * A, int Acount, int Acols, const float * B, int Bcount, int Bcols, float * out0, int out0count, int out0cols)
{
    int id = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;
    if (id < Acount) 
    {
        // Perform element-wise multiplication based on Bcols
        int id_row_col = (Bcols == 1) ? id / Acols : id % Acols;
        out0[id] = A[id] * B[id_row_col];
    }
}