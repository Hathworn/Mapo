#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getRow_FloatId_optimized(const float * A, int Acount, int Acols, float * out0, int out0count, int out0cols, const float row_id)
{
    // Calculate global thread ID effectively using 2D block and grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds
    if (id < Acols) 
    {
        // Compute row offset once and reuse
        int rowOffset = __fmaf_rd(row_id, Acols, id); // FMA for address calculation
        // Load matrix element and set output
        out0[id] = A[rowOffset];
    }
}