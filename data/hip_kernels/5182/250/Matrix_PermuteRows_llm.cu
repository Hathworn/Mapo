#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_PermuteRows(const float * A, int Acount, int Acols, const float * B, int Bcount, int Bcols, float * out0, int out0count, int out0cols)
{
    // Calculate unique thread index
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Proceed if within bounds
    if (id < Acount)
    {
        int id_row = id / Acols;
        int id_col = id % Acols;
        int id_rowNew = __fmul_rd(B[id_row], Acols); // Use fast multiply intrinsic

        // Use shared memory for higher speed access if required
        // __shared__ float sharedA[TILE_DIM][TILE_DIM]; // Example: Define TILE_DIM

        out0[id] = A[id_col + id_rowNew];
    }
}