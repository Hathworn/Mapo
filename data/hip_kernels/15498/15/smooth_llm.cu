#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth(float *v_new, const float *v) {
    // Calculate global thread index directly
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to reduce global memory access
    extern __shared__ float shared[];
    int localIdx = threadIdx.x;
    
    // Load elements into shared memory
    shared[localIdx] = v[myIdx];
    
    if (localIdx > 0) {
        shared[localIdx - 1] = v[myIdx - 1];
    }
    
    if (localIdx < blockDim.x - 1) {
        shared[localIdx + 1] = v[myIdx + 1];
    }
    
    __syncthreads();
    
    // Calculate indices
    int numThreads = blockDim.x * gridDim.x;
    int myLeftIdx = (myIdx == 0) ? 0 : localIdx - 1;
    int myRightIdx = (myIdx == numThreads - 1) ? localIdx : localIdx + 1;
    
    // Compute new value using shared memory
    float myElt = shared[localIdx];
    float myLeftElt = shared[myLeftIdx];
    float myRightElt = shared[myRightIdx];
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}