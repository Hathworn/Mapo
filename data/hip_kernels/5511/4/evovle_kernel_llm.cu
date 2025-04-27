#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void evovle_kernel(int N, char *oldGen, char *newGen, int *allzeros, int *change)
{
    // Achieve indexing on 2D blocks
    int ix = blockDim.x * blockIdx.x + threadIdx.x + 1;
    int iy = blockDim.y * blockIdx.y + threadIdx.y + 1;
    // Thread calculates its global id
    int id = ix * (N+2) + iy;

    if (ix <= N && iy <= N) {
        int neighbors = oldGen[id+(N+2)] + oldGen[id-(N+2)] // lower upper
                      + oldGen[id+1] + oldGen[id-1]         // right left
                      + oldGen[id+(N+3)] + oldGen[id-(N+3)] // diagonals
                      + oldGen[id-(N+1)] + oldGen[id+(N+1)];
        
        // Conditional assignment to reduce branches
        char cell = oldGen[id];
        char newCell = (neighbors == 3 || (neighbors == 2 && cell));

        newGen[id] = newCell; // Fill in the cells

        // Atomic operations for concurrent update when the condition is met
        if (newCell != 0) atomicAdd(allzeros, 1); 
        if (newCell != cell) atomicAdd(change, 1);
    }
}