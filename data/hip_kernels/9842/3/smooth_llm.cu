#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockDim.x * blockIdx.x + threadIdx.x; // Correct thread index calculation
    int numThreads = blockDim.x * gridDim.x;
    
    // Boundary checks in case of out of bounds
    if (myIdx < numThreads) {
        int myLeftIdx = (myIdx == 0) ? 0 : myIdx - 1;
        int myRightIdx = (myIdx == (numThreads - 1)) ? numThreads - 1 : myIdx + 1;

        // Read elements
        float myElt = v[myIdx];
        float myLeftElt = v[myLeftIdx];
        float myRightElt = v[myRightIdx];

        // Smooth and write
        v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
    }
}