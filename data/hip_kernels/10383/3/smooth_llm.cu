#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x; // Correct thread index calculation
    int numThreads = gridDim.x * blockDim.x;
    if (myIdx < numThreads) { // Boundary check within the valid range
        int myLeftIdx = (myIdx == 0) ? 0 : myIdx - 1; // Safe access to left index
        int myRightIdx = (myIdx == (numThreads - 1)) ? numThreads - 1 : myIdx + 1; // Safe access to right index
        float myElt = v[myIdx];
        float myLeftElt = v[myLeftIdx];
        float myRightElt = v[myRightIdx];
        v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt; // Update new value
    }
}