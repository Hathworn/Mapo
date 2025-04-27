#include "hip/hip_runtime.h"
#include "includes.h"

#define BDIMX 32
#define BDIMY 8

__global__ void transposeSmemUnroll(float *out, float *in, const int nx, const int ny)
{
    // Static 1D shared memory
    __shared__ float tile[BDIMY][BDIMX * 2];

    // Coordinate in original matrix
    unsigned int ix = 2 * blockIdx.x * BDIMX + threadIdx.x;
    unsigned int iy = blockIdx.y * BDIMY + threadIdx.y;

    // Linear global memory index for original matrix
    if (ix + BDIMX < nx && iy < ny) 
    {
        // Load two rows from global memory to shared memory
        unsigned int ti = iy * nx + ix;
        tile[threadIdx.y][threadIdx.x]       = in[ti];
        tile[threadIdx.y][threadIdx.x + BDIMX] = in[ti + BDIMX];
    }

    // Thread synchronization
    __syncthreads();
    
    // Coordinate in transposed matrix
    unsigned int ix2 = blockIdx.y * BDIMY + threadIdx.x;
    unsigned int iy2 = 2 * blockIdx.x * BDIMX + threadIdx.y;

    // Linear global memory index for transposed matrix
    if (ix2 < ny && iy2 + BDIMX < nx) 
    {
        // Store two rows to global memory from two columns of shared memory
        unsigned int to = iy2 * ny + ix2;
        out[to] = tile[threadIdx.x][threadIdx.y];
        out[to + ny * BDIMX] = tile[threadIdx.x + BDIMX][threadIdx.y];
    }
}