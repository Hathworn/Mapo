#include "hip/hip_runtime.h"
#include "includes.h"

//function declaration
unsigned int getmax(unsigned int *, unsigned int);
//unsigned int getmaxSeq(unsigned int *, unsigned int);

__global__ void getmaxcu(unsigned int* num, int size, int threadCount)
{
    __shared__ int localBiggest[32];
    int tid = threadIdx.x; // Cache threadIdx.x
    int wid = tid / 32;    // Warp index for current thread

    if (tid < 32) {
        localBiggest[tid] = 0; // Initialize shared memory using first 32 threads
    }
    __syncthreads();

    int current = blockIdx.x * blockDim.x + tid; // Calculate global thread ID

    if (current < size) {
        atomicMax(&localBiggest[wid], num[current]); // Use atomicMax for correctness and performance within a warp
    }
    __syncthreads();

    if (tid == 0) {
        int biggest = localBiggest[0];
        for (int i = 1; i < 32; i++) {
            if (biggest < localBiggest[i]) {
                biggest = localBiggest[i]; // Find the largest number in this block
            }
        }
        num[blockIdx.x] = biggest; // Store result in global memory
    }
}