#include "hip/hip_runtime.h"
#include "includes.h"

#define BUFSIZE 64
#define BLOCK_SIZE 16

__global__ void evovle_kernel_shared(int N, char *oldGen, char *newGen, int *allzeros, int *change) {
    // Calculate global indices
    int ix = (blockDim.x - 2) * blockIdx.x + threadIdx.x;
    int iy = (blockDim.y - 2) * blockIdx.y + threadIdx.y;
    int id = ix * (N+2) + iy;

    // Local indices for shared memory
    int i = threadIdx.x;
    int j = threadIdx.y;

    // Shared memory declaration for current block
    __shared__ char oldGen_shared[BLOCK_SIZE][BLOCK_SIZE];

    // Copy cells into shared memory
    if (ix <= N+1 && iy <= N+1)
        oldGen_shared[i][j] = oldGen[id];

    // Synchronize threads to ensure shared memory is populated
    __syncthreads();

    // Main computation: Check boundaries to avoid accessing out-of-bounds memory
    if (ix <= N && iy <= N && i > 0 && i < blockDim.y - 1 && j > 0 && j < blockDim.x - 1) {
        // Calculate neighbors
        int neighbors = oldGen_shared[i+1][j] + oldGen_shared[i-1][j] +
                        oldGen_shared[i][j+1] + oldGen_shared[i][j-1] +
                        oldGen_shared[i+1][j+1] + oldGen_shared[i-1][j-1] +
                        oldGen_shared[i-1][j+1] + oldGen_shared[i+1][j-1];

        // Update cell
        char cell = oldGen_shared[i][j];
        newGen[id] = (neighbors == 3 || (neighbors == 2 && cell));

        // Check for changes
        if (newGen[id] != 0) atomicAdd(allzeros, 1);
        if (newGen[id] != oldGen[id]) atomicAdd(change, 1);
    }
}