#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_MultiplElementWise_optimized(const float *A, int Acount, int Acols, const float *B, int Bcount, int Bcols, float *out0, int out0count, int out0cols) 
{
    // Simplified thread ID calculation
    int id = blockIdx.x * blockDim.x + threadIdx.x; 

    // Ensure valid index
    if (id < Acount) 
    {
        if (Acount == Bcount) // matrix .* matrix
        {
            out0[id] = A[id] * B[id];
        } 
        else if (Bcols == 1) // matrix .* row vector
        {
            int id_row = id / Acols; // Calculate row index
            out0[id] = A[id] * B[id_row];
        } 
        else // matrix .* column vector
        {
            int id_col = id % Acols; // Calculate column index
            out0[id] = A[id] * B[id_col];
        }
    }
}