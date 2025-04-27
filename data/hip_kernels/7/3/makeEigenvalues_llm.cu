#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeEigenvalues(float *eigenvalues, float *blockHessian, int *blocknums, int *blocksizes, int *hessiannums, int N, int numblocks) {
    // Use shared memory to reduce repetitive calculations and increase efficiency
    __shared__ int sharedBlockNums[1024];
    __shared__ int sharedHessianNums[1024];
    __shared__ int sharedBlockSizes[1024];

    int elementNum = blockIdx.x * blockDim.x + threadIdx.x;

    if (elementNum >= N) {
        return;
    }

    if(threadIdx.x < numblocks) {
        sharedBlockNums[threadIdx.x] = blocknums[threadIdx.x];
        sharedHessianNums[threadIdx.x] = hessiannums[threadIdx.x];
        sharedBlockSizes[threadIdx.x] = blocksizes[threadIdx.x];
    }
    __syncthreads();

    int b = 0;

    // Optimize: Unroll the loop and use shared memory
    for (int i = 0; i < numblocks; i++) {
        if (sharedBlockNums[i] > elementNum / 3) {
            b = i - 1;
            break;
        }
    }

    int x = elementNum - 3 * sharedBlockNums[b];
    
    // Calculate the offset using the block's starting position and size
    int spot = sharedHessianNums[b] + x * (3 * sharedBlockSizes[b]) + x;

    eigenvalues[elementNum] = blockHessian[spot];
}