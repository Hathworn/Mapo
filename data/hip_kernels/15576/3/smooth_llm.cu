#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    // Use blockDim and blockIdx for optimized indexing
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;

    // Avoid branching by computing valid neighbor indices
    int myLeftIdx = max(0, myIdx - 1);
    int myRightIdx = min(numThreads - 1, myIdx + 1);

    // Load elements from global memory once
    float myElt = v[myIdx];
    float myLeftElt = v[myLeftIdx];
    float myRightElt = v[myRightIdx];

    // Store result in global memory
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}