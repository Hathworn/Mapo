```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    // Calculate global index for the thread
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int numThreads = gridDim.x * blockDim.x;
    
    // Simplify boundary check using min/max functions
    int myLeftIdx = max(myIdx - 1, 0);
    int myRightIdx = min(myIdx + 1, numThreads - 1);

    // Use shared memory to reduce global memory access latency
    __shared__ float shared_v[1024];  // Adjust size based on maximum block size
    shared_v[threadIdx.x] = v[myIdx];
    __syncthreads();
    
    // Boundary safe access with shared memory
    float myLeftElt = (myIdx != 0) ? shared_v[myLeftIdx - blockIdx.x * blockDim.x] : v[myLeftIdx];
    float myRightElt = (myIdx != numThreads - 1) ? shared_v[myRightIdx - blockIdx.x * blockDim.x] : v[myRightIdx];
    
    // Compute smoothed value
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * shared_v[threadIdx.x] + 0.25f * myRightElt;
}