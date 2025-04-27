```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_getCol_FloatPointer_naive(const float * A, int Acount, int Acols, const float * colId, int empty_par1, int empty_par2, float * out0, int out0count, int out0cols)
{
    // Improved calculation of unique thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread id is within valid range
    if (id < Acount / Acols)
    {
        // Load colId value in shared memory to reduce global memory access
        __shared__ int columnIdx;
        if (threadIdx.x == 0) {
            columnIdx = (int)colId[0];
        }
        __syncthreads();

        // Use shared column index
        out0[id] = A[id*Acols + columnIdx];
    }
}