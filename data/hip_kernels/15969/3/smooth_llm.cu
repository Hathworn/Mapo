#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    // Use block-level looping to ensure all indices are covered
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < blockDim.x * gridDim.x; i += blockDim.x * gridDim.x) {
        int myLeftIdx = (i == 0) ? 0 : i - 1; // Boundary check for left index
        int myRightIdx = (i == (blockDim.x * gridDim.x - 1)) ? blockDim.x * gridDim.x - 1 : i + 1; // Boundary check for right index
        float myElt = v[i];
        float myLeftElt = v[myLeftIdx];
        float myRightElt = v[myRightIdx];
        v_new[i] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt; // Update kernel logic
    }
}