#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by using thread synchronization for shared reduction
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    __shared__ float shared_acc;
    if (threadIdx.x == 0) {
        shared_acc = *accuracy; // Load accuracy into shared memory
    }
    __syncthreads();

    if (threadIdx.x == 0) {
        shared_acc /= N; // Perform division from shared memory
        *accuracy = shared_acc; // Write result back to global memory
    }
}