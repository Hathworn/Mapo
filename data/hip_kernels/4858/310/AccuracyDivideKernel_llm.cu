#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use block and thread indices to ensure parallel access to accuracy
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        accuracy[idx] /= N;  // Ensure each element is processed individually
    }
}