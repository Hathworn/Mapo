#include "hip/hip_runtime.h"
#include "includes.h"

//#define NDEBUG

const static float eps = 1e-6;
const static size_t blocSize = 8;
const static size_t size = 1024;

__global__ void matMultiply2D(float* matA, float* matB, float* Dest, int dimensions)
{
    // Shared memory for sub-matrices
    __shared__ float tileA[blocSize][blocSize];
    __shared__ float tileB[blocSize][blocSize];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    int ix = tx + bx * blockDim.x;
    int iy = ty + by * blockDim.y;

    float res = 0.0f;
    // Loop over tiles
    for (int t = 0; t < (dimensions + blocSize - 1) / blocSize; ++t)
    {
        // Load tiles into shared memory
        if (ix < dimensions && (t * blocSize + ty) < dimensions)
            tileA[ty][tx] = matA[ix * dimensions + t * blocSize + ty];
        else
            tileA[ty][tx] = 0.0f;
        
        if (iy < dimensions && (t * blocSize + tx) < dimensions)
            tileB[ty][tx] = matB[(t * blocSize + tx) * dimensions + iy];
        else
            tileB[ty][tx] = 0.0f;

        __syncthreads(); // Synchronize to make sure all data is loaded
        
        // Compute product of tiles
        for (unsigned k = 0; k < blocSize; ++k)
        {
            res += tileA[ty][k] * tileB[k][tx];
        }
        
        __syncthreads(); // Synchronize before loading new tile
    }

    // Write the result to the destination matrix
    if (ix < dimensions && iy < dimensions)
    {
        Dest[ix * dimensions + iy] = res;
    }
}