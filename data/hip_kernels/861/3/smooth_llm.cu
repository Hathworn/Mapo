#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    // Calculate the global index for the current thread
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimized calculation of left and right indices using modulo for boundary conditions
    int myLeftIdx = (myIdx - 1 + blockDim.x * gridDim.x) % (blockDim.x * gridDim.x);
    int myRightIdx = (myIdx + 1) % (blockDim.x * gridDim.x);

    // Retrieve elements at the computed indices
    float myElt = v[myIdx];
    float myLeftElt = v[myLeftIdx];
    float myRightElt = v[myRightIdx];

    // Calculate the new value and write it to output
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}