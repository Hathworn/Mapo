#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float *v_new, const float *v) {
    // Calculate global thread index using built-in variables
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize boundary index handling
    int numThreads = blockDim.x * gridDim.x;
    float myElt = v[myIdx];
    float myLeftElt = (myIdx > 0) ? v[myIdx - 1] : v[0];
    float myRightElt = (myIdx < numThreads - 1) ? v[myIdx + 1] : v[numThreads - 1];
    // Efficiently compute smoothed element
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}