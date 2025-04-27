#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Matrix_PermuteRows(const float * A, int Acount, int Acols, const float * B, int Bcount, int Bcols, float * out0, int out0count, int out0cols)
{
    // Optimization: Calculate global thread ID using efficient 2D grid indexing.
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    
    if (id < Acount)
    {
        int id_row = id / Acols;
        int id_col = id % Acols;
        
        // Optimization: Precompute new row index once per thread and avoid repeating multiplications.
        int id_rowNew = __ldg(&B[id_row]) * Acols;
        
        // Optimization: Use __ldg for potentially faster global memory loads.
        out0[id] = __ldg(&A[id_col + id_rowNew]);
    }
}