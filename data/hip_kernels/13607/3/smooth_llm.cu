#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth(float *v_new, const float *v) {
    int totalThreads = blockDim.x * gridDim.x; // Pre-calculate total threads
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x; // Corrected thread index calculation

    // Early exit if index is out of bounds
    if (myIdx >= totalThreads) return; 
    
    int myLeftIdx = (myIdx == 0) ? 0 : myIdx - 1;
    int myRightIdx = (myIdx == totalThreads - 1) ? totalThreads - 1 : myIdx + 1;
    
    float myElt = v[myIdx];
    float myLeftElt = v[myLeftIdx];
    float myRightElt = v[myRightIdx];
    
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}