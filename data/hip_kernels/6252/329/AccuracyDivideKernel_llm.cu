#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Check if N is not zero to avoid division by zero
    if (N != 0) {
        // Perform atomic divide to safely handle concurrent writes
        atomicExch(accuracy, *accuracy / N);
    }
}