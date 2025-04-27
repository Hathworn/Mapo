#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x; // Correct index calculation
    int numThreads = blockDim.x * gridDim.x;
    
    // Efficient boundary checks using min and max
    int myLeftIdx = max(0, myIdx - 1);
    int myRightIdx = min(numThreads - 1, myIdx + 1);

    // Load elements from global to local cache
    float myElt = v[myIdx];
    float myLeftElt = v[myLeftIdx];
    float myRightElt = v[myRightIdx];

    // Store the result in v_new
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}