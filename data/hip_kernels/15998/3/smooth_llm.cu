#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * __restrict__ v_new, const float * __restrict__ v) {
    // Calculate global index for the current thread
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;

    // Ensure thread does not access out-of-bounds memory
    if (myIdx < numThreads) {
        // Calculate indices of neighboring elements
        int myLeftIdx = max(0, myIdx - 1);
        int myRightIdx = min(numThreads - 1, myIdx + 1);

        // Fetch required elements from global memory once
        float myElt = v[myIdx];
        float myLeftElt = v[myLeftIdx];
        float myRightElt = v[myRightIdx];

        // Calculate smoothed value
        v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
    }
}