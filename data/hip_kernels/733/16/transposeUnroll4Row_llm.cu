#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Row(float *out, float *in, const int nx, const int ny)
{
    // Calculate indices with fewer operations
    unsigned int ix = (blockDim.x * blockIdx.x + threadIdx.x) * 4;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    unsigned int ti = iy * nx + ix; // access in rows
    unsigned int to = ix * ny + iy; // access in columns

    // Use shared memory to reduce global memory accesses
    __shared__ float tile[4][4 + 1];  // Add padding to avoid bank conflicts

    if ((ix + 3 < nx) && (iy < ny))
    {
        // Each thread loads 4 elements into shared memory
        for (int i = 0; i < 4; i++)
        {
            tile[threadIdx.y][threadIdx.x + i * blockDim.x] = in[ti + i * blockDim.x];
        }
    }
    __syncthreads();

    // Only threads within bounds perform the write operation
    if ((iy + 3 * blockDim.y < ny) && (ix < nx))
    {
        for (int i = 0; i < 4; i++)
        {
            out[to + i * ny * blockDim.y] = tile[threadIdx.x + i * blockDim.x][threadIdx.y];
        }
    }
}