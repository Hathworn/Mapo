#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void evovle_kernel(int N, char *oldGen, char *newGen, int *allzeros, int *change)
{
    // Efficient indexing for the thread
    int ix = blockIdx.x * blockDim.x + threadIdx.x + 1;
    int iy = blockIdx.y * blockDim.y + threadIdx.y + 1;
    int id = ix * (N+2) + iy;

    if (ix <= N && iy <= N) {
        int neighbors = oldGen[id+(N+2)] + oldGen[id-(N+2)]    // lower upper 
                      + oldGen[id+1] + oldGen[id-1]           // right left 
                      + oldGen[id+(N+3)] + oldGen[id-(N+3)]   // diagonals 
                      + oldGen[id-(N+1)] + oldGen[id+(N+1)];

        char cell = oldGen[id];
        newGen[id] = (neighbors == 3 || (neighbors == 2 && cell)); // Compute new cell state

        // Atomic operations for safe increment
        if (newGen[id] != 0) atomicAdd(allzeros, 1);          // Counter for live cells
        if (newGen[id] != oldGen[id]) atomicAdd(change, 1);   // Counter for changes
    }
}