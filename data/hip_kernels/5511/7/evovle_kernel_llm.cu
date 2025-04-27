```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void evovle_kernel(int N, char *oldGen, char *newGen, int *allzeros, int *change) {
    // 2D Indexing
    int ix = blockDim.x * blockIdx.x + threadIdx.x + 1;
    int iy = blockDim.y * blockIdx.y + threadIdx.y + 1;
    // Calculate global id
    int id = ix * (N+2) + iy;

    if (ix <= N && iy <= N) {
        int neighbors;
        // Shared memory for neighboring calculations optimization
        __shared__ char sharedOldGen[32][32]; // Assuming blockDim.x and blockDim.y <= 30 for simplicity
        
        // Load data into shared memory, include halo for neighbor access
        sharedOldGen[threadIdx.x + 1][threadIdx.y + 1] = oldGen[id];
        if (threadIdx.x == 0)
            sharedOldGen[0][threadIdx.y + 1] = oldGen[id - (N+2)];
        if (threadIdx.x == blockDim.x - 1)
            sharedOldGen[blockDim.x + 1][threadIdx.y + 1] = oldGen[id + (N+2)];
        if (threadIdx.y == 0)
            sharedOldGen[threadIdx.x + 1][0] = oldGen[id - 1];
        if (threadIdx.y == blockDim.y - 1)
            sharedOldGen[threadIdx.x + 1][blockDim.y + 1] = oldGen[id + 1];

        __syncthreads();

        // Calculate number of neighbors
        neighbors = sharedOldGen[threadIdx.x + 2][threadIdx.y + 1] + sharedOldGen[threadIdx.x][threadIdx.y + 1]  // lower upper
                  + sharedOldGen[threadIdx.x + 1][threadIdx.y + 2] + sharedOldGen[threadIdx.x + 1][threadIdx.y]  // right left
                  + sharedOldGen[threadIdx.x + 2][threadIdx.y + 2] + sharedOldGen[threadIdx.x][threadIdx.y]      // diagonals
                  + sharedOldGen[threadIdx.x][threadIdx.y + 2] + sharedOldGen[threadIdx.x + 2][threadIdx.y]; 

        // Cell update
        char cell = sharedOldGen[threadIdx.x + 1][threadIdx.y + 1];
        newGen[id] = neighbors == 3 || (neighbors == 2 && cell);

        // Terminating check
        if (newGen[id] != 0) atomicAdd(allzeros, 1);  // Use atomic operation for global memory
        if (newGen[id] != oldGen[id]) atomicAdd(change, 1); // Use atomic operation for global memory
    }
}