#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_transposeFromSVDnodeCOPY(const float* A, int Acount, int Acols, float* out0)
{
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    int Arows = Acount / Acols;

    // Loop to allow processing more data elements per thread
    for (int id = idx; id < Acount; id += stride)
    {
        int x = id / Arows; // Column index
        int y = id % Arows; // Row index

        out0[x * Arows + y] = A[y * Acols + x];
    }
}