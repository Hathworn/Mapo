#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth(float * v_new, const float * v) {
// Use 1D block and grid for efficient memory access and computation
int myIdx = blockIdx.x * blockDim.x + threadIdx.x;
int numThreads = blockDim.x * gridDim.x;

// Prevent out-of-bounds access
if (myIdx < numThreads) {
    // Clamp indices to avoid accessing out of array bounds
    int myLeftIdx = max(0, myIdx - 1);
    int myRightIdx = min(numThreads - 1, myIdx + 1);

    // Load elements once for computation
    float myElt = v[myIdx];
    float myLeftElt = v[myLeftIdx];
    float myRightElt = v[myRightIdx];

    // Store result in global memory
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}
}