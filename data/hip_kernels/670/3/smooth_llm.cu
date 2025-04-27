#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;  // Fix thread index computation
    int numThreads = blockDim.x * gridDim.x;
    if (myIdx < numThreads) {  // Bound check to prevent out of range access
        int myLeftIdx = max(0, myIdx - 1);  // Use max to handle boundary safely
        int myRightIdx = min(numThreads - 1, myIdx + 1);  // Use min to handle boundary safely
        float myElt = v[myIdx];
        float myLeftElt = v[myLeftIdx];
        float myRightElt = v[myRightIdx];
        v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
    }
}