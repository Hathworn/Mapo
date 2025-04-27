#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_offset(int *key, int *idx, int *offset, int size) {

    int idxX = threadIdx.x + blockIdx.x * blockDim.x;

    // Use shared memory for storing temporary values to minimize global memory reads
    __shared__ int sharedKey[256]; // Assume blockDim.x <= 256

    // Load data into shared memory
    if (idxX < size) {
        sharedKey[threadIdx.x] = key[idxX];
    }
    __syncthreads();

    // Perform initialization only once if the block contains idxX == 0
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        offset[1] = 0;
    }

    if (idxX < size) {
        int keyVal = sharedKey[threadIdx.x];
        if (threadIdx.x == 0 && idxX > 0) {
            int keyValPrev = key[idxX - 1]; // Read previous key from global memory
            if (keyVal != keyValPrev) {
                offset[keyVal + 1] = idxX;
            }
        }
        else if (threadIdx.x > 0) {
            int keyValPrev = sharedKey[threadIdx.x - 1];
            if (keyVal != keyValPrev) {
                offset[keyVal + 1] = idxX;
            }
        }
    }

    // Perform final offset setup only for the last element
    if (idxX == size - 1) {
        int keyVal = sharedKey[threadIdx.x];
        offset[0] = keyVal + 1;
        offset[keyVal + 2] = size;
    }
}