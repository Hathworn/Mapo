#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth(float * v_new, const float * v) {
    // Calculate global thread index
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;
    
    // Calculate indices for neighboring elements
    int myLeftIdx = max(0, myIdx - 1);  // Prevent out-of-bounds access at start
    int myRightIdx = min(numThreads - 1, myIdx + 1);  // Prevent out-of-bounds access at end
    
    // Load element and its neighbors
    float myElt = v[myIdx];
    float myLeftElt = v[myLeftIdx];
    float myRightElt = v[myRightIdx];

    // Compute the new value with smoothing
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}