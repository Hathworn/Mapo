#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x; // Correct index calculation
    int numThreads = blockDim.x * gridDim.x;
    if(myIdx < numThreads) { // Ensure thread stays within bounds
        int myLeftIdx = max(myIdx - 1, 0); // Use max to handle left boundary
        int myRightIdx = min(myIdx + 1, numThreads - 1); // Use min to handle right boundary
        float myElt = v[myIdx];
        float myLeftElt = v[myLeftIdx];
        float myRightElt = v[myRightIdx];
        v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt; // Simplified smoothing calculation
    }
}