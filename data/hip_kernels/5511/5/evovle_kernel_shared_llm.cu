#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void evovle_kernel_shared(int N, char *oldGen, char *newGen, int *allzeros, int *change)
{
    // Global
    int ix = (blockDim.x - 2) * blockIdx.x + threadIdx.x;
    int iy = (blockDim.y - 2) * blockIdx.y + threadIdx.y;
    int id = ix * (N+2) + iy;

    int i = threadIdx.x;
    int j = threadIdx.y;
    int neighbors;

    // Declare the shared memory on a per block level
    __shared__ char oldGen_shared[BLOCK_SIZE][BLOCK_SIZE];

    // Copy cells into shared memory
    if (ix <= N+1 && iy <= N+1)
        oldGen_shared[i][j] = oldGen[id];

    // Sync threads on block
    __syncthreads();

    if (ix <= N && iy <= N) {
        // Avoid boundary conflicts
        if(i != 0 && i != (blockDim.y-1) && j != 0 && j != (blockDim.x-1)) {
            // Calculate neighbors more efficiently using shared memory
            neighbors = oldGen_shared[i+1][j] + oldGen_shared[i-1][j]
                      + oldGen_shared[i][j+1] + oldGen_shared[i][j-1]
                      + oldGen_shared[i+1][j+1] + oldGen_shared[i-1][j-1]
                      + oldGen_shared[i-1][j+1] + oldGen_shared[i+1][j-1];

            char cell = oldGen_shared[i][j];
            newGen[id] = (neighbors == 3 || (neighbors == 2 && cell));

            // Atomic operations to avoid race conditions
            if (newGen[id] != 0) atomicAdd(allzeros, 1);
            if (newGen[id] != oldGen[id]) atomicAdd(change, 1);
        }
    }
}