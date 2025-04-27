#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to reduce global memory transactions
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    __shared__ float shared_accuracy; // Declare shared memory
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy; // Load accuracy into shared memory
    }
    __syncthreads(); // Synchronize threads
    if (threadIdx.x == 0) {
        shared_accuracy /= N; // Perform division in shared memory
        *accuracy = shared_accuracy; // Store back the result to global memory
    }
}