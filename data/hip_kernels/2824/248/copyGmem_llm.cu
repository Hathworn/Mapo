#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyGmem(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory for coalesced access and reduce global memory transactions
    __shared__ float tile[32][32 + 1]; // Avoid bank conflicts by adding padding

    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    unsigned int index_in = iy * nx + ix;

    // Load data into shared memory
    if (ix < nx && iy < ny) {
        tile[threadIdx.y][threadIdx.x] = in[index_in];
    }
    __syncthreads();

    // Calculate transposed index
    unsigned int transposed_ix = blockIdx.y * blockDim.y + threadIdx.x;
    unsigned int transposed_iy = blockIdx.x * blockDim.x + threadIdx.y;

    // Write data from shared memory to global memory with transposition
    unsigned int index_out = transposed_iy * nx + transposed_ix;
    if (transposed_ix < ny && transposed_iy < nx) {
        out[index_out] = tile[threadIdx.x][threadIdx.y];
    }
}