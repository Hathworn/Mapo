#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dBinaryCrossEntropyCost(float* predictions, float* target, float* dY, int x) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds and perform calculations
    if (index < x) { 
        float pred = predictions[index];
        float tgt = target[index];
        
        // Optimize the calculation using temporary variables
        float inversePred = 1.0f - pred;
        float inverseTgt = 1.0f - tgt;
        
        dY[index] = -1.0f * (tgt / pred - inverseTgt / inversePred);
    }
}