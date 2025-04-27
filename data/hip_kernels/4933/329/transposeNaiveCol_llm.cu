#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeNaiveCol(int *in, int *out, const int nx, const int ny)
{
    // Calculate the flatten thread id from 2D block and thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int idy = blockIdx.y * blockDim.y + threadIdx.y;

    if (idx < nx && idy < ny)
    {
        // More efficient memory access by using shared memory (eliminated)
        out[idy * nx + idx] = in[idx * ny + idy];
    }
}