#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZE 30000				//Length and width of inner grid in threads
#define DIM (SIZE + 2)			//Length and width of the entire grid in threads
#define GRID_SIZE 1500 			//Length and width of inner grid in blocks
#define BLOCK_SIZE 20 			//Length and width of block in threads
#define MEM_SIZE (sizeof(float) * DIM * DIM)
#define TIME_STEPS 1
#define PINNED 0

void fillGrid(float* grid);

__global__ void computeGrid(float* read, float* write) {
    // Use shared memory for faster access
    __shared__ float shBlock[BLOCK_SIZE + 2][BLOCK_SIZE + 2];

    // Calculate global and local indices
    int x = blockDim.x * blockIdx.x + threadIdx.x + 1;
    int y = blockDim.y * blockIdx.y + threadIdx.y + 1;
    int localX = threadIdx.x + 1;
    int localY = threadIdx.y + 1;

    // Load the main cell and four neighbors into shared memory
    shBlock[localY][localX] = read[DIM * y + x];
    if (threadIdx.x == 0) shBlock[localY][0] = read[DIM * y + x - 1];
    if (threadIdx.x == blockDim.x - 1) shBlock[localY][localX + 1] = read[DIM * y + x + 1];
    if (threadIdx.y == 0) shBlock[0][localX] = read[DIM * (y - 1) + x];
    if (threadIdx.y == blockDim.y - 1) shBlock[localY + 1][localX] = read[DIM * (y + 1) + x];
    
    // Synchronize to ensure all threads have loaded data
    __syncthreads();

    // Compute the result using shared memory
    if (threadIdx.x != 0 && threadIdx.x != blockDim.x - 1 && threadIdx.y != 0 && threadIdx.y != blockDim.y - 1) {
        write[DIM * y + x] = shBlock[localY - 1][localX] + shBlock[localY + 1][localX] +
                             shBlock[localY][localX - 1] + shBlock[localY][localX + 1];
    }
}