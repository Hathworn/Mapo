#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for faster access
    __shared__ float shared_accuracy;

    // Only one thread reads and divides accuracy
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy / N;
    }

    // Ensure all threads can safely read the shared value
    __syncthreads();

    // Assign the divided result back to the output
    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy;
    }
}