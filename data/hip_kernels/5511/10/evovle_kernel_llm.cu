```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void evolve_kernel(int N, char *oldGen, char *newGen, int *allzeros, int *change) {
    // Compute unique global index for each thread
    int ix = blockDim.x * blockIdx.x + threadIdx.x + 1;
    int iy = blockDim.y * blockIdx.y + threadIdx.y + 1;
    int id = ix * (N+2) + iy;

    // Initialize neighbors count
    int neighbors = 0;

    if (ix <= N && iy <= N) {
        // Calculate number of alive neighbors
        neighbors += oldGen[id + (N+2)] + oldGen[id - (N+2)]   // lower and upper 
                  + oldGen[id + 1] + oldGen[id - 1]             // right and left
                  + oldGen[id + (N+3)] + oldGen[id - (N+3)]     // diagonals
                  + oldGen[id - (N+1)] + oldGen[id + (N+1)];

        // Determine new cell state based on neighbors and current state
        newGen[id] = neighbors == 3 || (neighbors == 2 && oldGen[id]);

        // Atomic increment to avoid race conditions
        atomicAdd(allzeros, newGen[id] != 0 ? 1 : 0);        // Check if all cells are dead
        atomicAdd(change, newGen[id] != oldGen[id] ? 1 : 0); // Check if life changed
    }
}