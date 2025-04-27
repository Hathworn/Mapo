#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth(float * v_new, const float * v) {
    // Calculate global thread index using a more standard approach
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Assuming a proper grid size is set where myIdx < numElements
    float myElt = v[myIdx];
    float myLeftElt = (myIdx > 0) ? v[myIdx - 1] : myElt; // Handle left boundary
    float myRightElt = (myIdx < blockDim.x * gridDim.x - 1) ? v[myIdx + 1] : myElt; // Handle right boundary

    // Perform smoothing operation
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}