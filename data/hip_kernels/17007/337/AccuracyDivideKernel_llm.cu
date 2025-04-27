#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256  // Define threads per block for optimal performance

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use threadIdx.x to parallelize computation and improve performance
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        // Use atomic operation to ensure safe division update for accuracy
        atomicExch(accuracy, *accuracy / N);
    }
}