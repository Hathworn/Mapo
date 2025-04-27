#include "hip/hip_runtime.h"
#include "includes.h"

#define BUFSIZE 64
#define BLOCK_SIZE 16

// Optimized kernel for evolve function
__global__ void evovle_kernel(int N, char *oldGen, char *newGen, int *allzeros, int *change)
{
    // Achieve indexing on 2D blocks
    int ix = blockDim.x * blockIdx.x + threadIdx.x + 1;
    int iy = blockDim.y * blockIdx.y + threadIdx.y + 1;
    // Thread calculates its global id
    int id = ix * (N + 2) + iy;

    if (ix <= N && iy <= N) {
        // Reduce redundant calculations by using temporary variables
        int rowOffset = (N + 2);
        int neighbors = oldGen[id + rowOffset] + oldGen[id - rowOffset] // lower upper
                      + oldGen[id + 1] + oldGen[id - 1]               // right left
                      + oldGen[id + rowOffset + 1] + oldGen[id - rowOffset - 1] // diagonals
                      + oldGen[id - rowOffset + 1] + oldGen[id + rowOffset - 1];

        char cell = oldGen[id];
        newGen[id] = neighbors == 3 || (neighbors == 2 && cell); // Fill in the cells

        // Terminating Checkings
        if (newGen[id] != 0) atomicAdd(allzeros, 1); // Check if all cells are dead
        if (newGen[id] != oldGen[id]) atomicAdd(change, 1); // Check if life stayed the same
    }
}