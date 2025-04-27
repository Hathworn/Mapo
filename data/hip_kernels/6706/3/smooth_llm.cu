#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    int myIdx = threadIdx.x + blockIdx.x * blockDim.x;  // Corrected index calculation
    int numElements = gridDim.x * blockDim.x;  // Total number of elements

    // Guard against accessing out-of-bound elements
    if (myIdx < numElements) {
        int myLeftIdx = max(0, myIdx - 1);  // Use max to handle edge case
        int myRightIdx = min(numElements - 1, myIdx + 1);  // Use min to handle edge case

        float myElt = v[myIdx];
        float myLeftElt = v[myLeftIdx];
        float myRightElt = v[myRightIdx];
        v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
    }
}