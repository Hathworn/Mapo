#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth(float * v_new, const float * v) {
    // Compute the global index
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;

    // Optimize boundary checks using min and max
    int myLeftIdx = max(0, myIdx - 1);
    int myRightIdx = min(numThreads - 1, myIdx + 1);

    // Load data
    float myElt = v[myIdx];
    float myLeftElt = v[myLeftIdx];
    float myRightElt = v[myRightIdx];

    // Compute the smoothed value
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}