#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void evovle_kernel_shared(int N, char *oldGen, char *newGen, int *allzeros, int *change)
{
    // Global indices with adjusted block boundaries
    int ix = (blockDim.x - 2) * blockIdx.x + threadIdx.x;
    int iy = (blockDim.y - 2) * blockIdx.y + threadIdx.y;
    int id = ix * (N+2) + iy;

    int i = threadIdx.x;
    int j = threadIdx.y;
    int neighbors;

    // Shared memory for storing sub-grid
    __shared__ char oldGen_shared[BLOCK_SIZE][BLOCK_SIZE];

    // Load cells into shared memory 
    if (ix <= N+1 && iy <= N+1)
        oldGen_shared[i][j] = oldGen[id];

    // Synchronize to make sure all cells are loaded into shared memory
    __syncthreads();

    // Check if within bounds of grid excluding ghost cells
    if (ix <= N && iy <= N) {
        // Ensure only active threads within boundary procceed
        if(i != 0 && i != (blockDim.x-1) && j != 0 && j != (blockDim.y-1)) {

            // Compute the number of neighbors from shared memory
            neighbors = oldGen_shared[i+1][j] + oldGen_shared[i-1][j]     // vertical
                      + oldGen_shared[i][j+1] + oldGen_shared[i][j-1]     // horizontal
                      + oldGen_shared[i+1][j+1] + oldGen_shared[i-1][j-1] // diagonals
                      + oldGen_shared[i-1][j+1] + oldGen_shared[i+1][j-1];

            char cell = oldGen_shared[i][j];
            newGen[id] = neighbors == 3 || (neighbors == 2 && cell); // Update condition

            // Update change/watching conditions atomically
            if (newGen[id] != 0) atomicAdd(allzeros, 1);
            if (newGen[id] != oldGen[id]) atomicAdd(change, 1);
        }
    }
}