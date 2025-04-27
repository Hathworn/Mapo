#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void evovle_kernel_shared(int N, char *oldGen, char *newGen, int *allzeros, int *change) {
    // Global indices for accessing the array
    int ix = (blockDim.x - 2) * blockIdx.x + threadIdx.x;
    int iy = (blockDim.y - 2) * blockIdx.y + threadIdx.y;
    int id = ix * (N+2) + iy;

    // Local thread indices for accessing shared memory
    int i = threadIdx.x;
    int j = threadIdx.y;
    int neighbors;

    // Declare shared memory
    __shared__ char oldGen_shared[BLOCK_SIZE][BLOCK_SIZE];

    // Copy cells to shared memory with boundary check
    if (ix <= N+1 && iy <= N+1) 
        oldGen_shared[i][j] = oldGen[id];

    // Synchronize threads within a block
    __syncthreads();

    // Check the block and thread boundaries
    if (ix <= N && iy <= N && i > 0 && i < blockDim.y-1 && j > 0 && j < blockDim.x-1) {
        // Calculate the number of neighbors
        neighbors = oldGen_shared[i+1][j] + oldGen_shared[i-1][j]
                  + oldGen_shared[i][j+1] + oldGen_shared[i][j-1]
                  + oldGen_shared[i+1][j+1] + oldGen_shared[i-1][j-1]
                  + oldGen_shared[i-1][j+1] + oldGen_shared[i+1][j-1];

        char cell = oldGen_shared[i][j];
        newGen[id] = (neighbors == 3 || (neighbors == 2 && cell));

        // Check any changes or all zero condition for termination
        atomicAdd(allzeros, newGen[id] != 0); 
        atomicAdd(change, newGen[id] != oldGen[id]);
    }
}