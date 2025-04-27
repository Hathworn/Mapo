#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveCol(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Utilize shared memory for data movement
    __shared__ float tile[32][32]; // Assuming block size is 32x32

    if (ix < nx && iy < ny)
    {
        tile[threadIdx.y][threadIdx.x] = in[ix * ny + iy];
    }

    __syncthreads(); // Ensure all tiles are loaded

    // Calculate transposed indices
    unsigned int transposed_ix = blockDim.y * blockIdx.y + threadIdx.x;
    unsigned int transposed_iy = blockDim.x * blockIdx.x + threadIdx.y;

    if (transposed_ix < ny && transposed_iy < nx)
    {
        out[transposed_iy * ny + transposed_ix] = tile[threadIdx.x][threadIdx.y];
    }
}