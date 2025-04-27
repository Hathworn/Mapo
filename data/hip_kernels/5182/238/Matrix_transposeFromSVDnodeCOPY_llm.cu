#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_transposeFromSVDnodeCOPY(const float* A, int Acount, int Acols, float* out0)
{
    // Optimize id calculation
    int id = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;

    int Arows = Acount / Acols;

    if (id < Acount)
    {
        // Calculate x and y only when needed
        int x = id / Arows;
        int y = id % Arows;
        out0[x * Arows + y] = A[y * Acols + x];
    }
}