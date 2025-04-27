#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dBinaryCrossEntropyCost(float* predictions, float* target, float* dY, int size) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Bounds check
    if (index >= size) return;
    
    // Efficient memory access and storing result
    float pred = predictions[index];
    float targ = target[index];
    dY[index] = -1.0f * (targ / pred - (1 - targ) / (1 - pred));
}