#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x; // Correct index calculation
    int numThreads = blockDim.x * gridDim.x;
    
    if (myIdx >= numThreads) return; // Ensure index within bounds

    // Use shared memory for neighboring elements access if needed 
    extern __shared__ float shmem[]; 
    int localIdx = threadIdx.x;
    shmem[localIdx] = v[myIdx];
    
    __syncthreads(); // Synchronize threads in a block

    float myLeftElt = (localIdx == 0) ? v[myIdx - 1] : shmem[localIdx - 1];
    float myRightElt = (localIdx == blockDim.x - 1) ? v[myIdx + 1] : shmem[localIdx + 1];
    
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * shmem[localIdx] + 0.25f * myRightElt;
}