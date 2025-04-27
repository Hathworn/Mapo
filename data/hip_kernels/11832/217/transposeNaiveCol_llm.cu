#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate transposed global indices
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Use shared memory for more efficient memory access
    __shared__ float tile[32][32 + 1]; // Adding padding to avoid bank conflicts

    if (ix < nx && iy < ny)
    {
        unsigned int index_in = iy * nx + ix;
        tile[threadIdx.y][threadIdx.x] = in[index_in];
    }
    
    __syncthreads();

    ix = blockDim.y * blockIdx.y + threadIdx.x; // Transpose - swap indices
    iy = blockDim.x * blockIdx.x + threadIdx.y;
    
    if (iy < nx && ix < ny)
    {
        unsigned int index_out = ix * nx + iy;
        out[index_out] = tile[threadIdx.x][threadIdx.y];
    }
}