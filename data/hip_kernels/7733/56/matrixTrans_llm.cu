#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTrans(float * M, float * MT)
{
    // Use shared memory to reduce global memory accesses
    __shared__ float tile[TILE_DIM][TILE_DIM+1];

    int x = blockIdx.x * TILE_DIM + threadIdx.x; // global row index
    int y = blockIdx.y * TILE_DIM + threadIdx.y; // global column index

    if (x < N && y < N)
    {
        // Load data from global to shared memory
        tile[threadIdx.y][threadIdx.x] = M[y * N + x];
    }
    
    __syncthreads();

    // Transpose within shared memory
    x = blockIdx.y * TILE_DIM + threadIdx.x; // transposed global row index
    y = blockIdx.x * TILE_DIM + threadIdx.y; // transposed global column index

    if (x < N && y < N)
    {
        // Store back to global memory from shared memory
        MT[y * N + x] = tile[threadIdx.x][threadIdx.y];
    }
}
```

Make sure to define `TILE_DIM` as a macro or constant value, which should ideally match the size of the blocks for optimal performance.