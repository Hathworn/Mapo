#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;
    
    // Ensure indices are within bounds
    if (myIdx < numThreads) {
        int myLeftIdx = (myIdx == 0) ? 0 : myIdx - 1;
        int myRightIdx = (myIdx == (numThreads - 1)) ? numThreads - 1 : myIdx + 1;
        
        // Use shared memory to reduce global memory accesses
        extern __shared__ float shared[];
        shared[threadIdx.x] = v[myIdx];
        
        if (threadIdx.x > 0 && myIdx > 0) {
            shared[threadIdx.x - 1] = v[myIdx - 1];
        }
        if (threadIdx.x < blockDim.x - 1 && myIdx < numThreads - 1) {
            shared[threadIdx.x + 1] = v[myIdx + 1];
        }
        __syncthreads();
        
        float myElt = shared[threadIdx.x];
        float myLeftElt = (threadIdx.x > 0) ? shared[threadIdx.x - 1] : v[myLeftIdx];
        float myRightElt = (threadIdx.x < blockDim.x - 1) ? shared[threadIdx.x + 1] : v[myRightIdx];
        
        // Compute the smooth value
        v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
    }
}