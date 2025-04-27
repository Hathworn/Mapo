#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy to register for faster access
    float localAccuracy = *accuracy;
    
    // Divide using register value
    localAccuracy /= N;
    
    // Store the result back to global memory
    *accuracy = localAccuracy;
}