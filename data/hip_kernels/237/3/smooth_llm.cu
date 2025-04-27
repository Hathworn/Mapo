#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;  // Fix indexing to correct order
    int numThreads = blockDim.x * gridDim.x;
    
    if (myIdx < numThreads) {  // Bounds checking for safety
        int myLeftIdx = max(myIdx - 1, 0);  // Use max for left boundary
        int myRightIdx = min(myIdx + 1, numThreads - 1);  // Use min for right boundary
        float myElt = v[myIdx];
        float myLeftElt = v[myLeftIdx];
        float myRightElt = v[myRightIdx];
        v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
    }
}