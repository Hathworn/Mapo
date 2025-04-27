#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Using register storage for local computation
    float local_accuracy = *accuracy; 
    local_accuracy /= N;
    *accuracy = local_accuracy;
}