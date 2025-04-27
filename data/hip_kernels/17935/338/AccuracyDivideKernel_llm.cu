#include "hip/hip_runtime.h"
#include "includes.h"

// Use atomic operation to ensure thread safety when updating *accuracy
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    float current_accuracy = *accuracy;
    atomicExch(accuracy, current_accuracy / N);
}