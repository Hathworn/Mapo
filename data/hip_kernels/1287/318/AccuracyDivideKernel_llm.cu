#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load value from global memory
    float acc = *accuracy;

    // Perform division using shared memory to reduce redundant global memory access
    __shared__ float sharedAcc;
    if (threadIdx.x == 0) {
        sharedAcc = acc / N;
    }
    __syncthreads();  // Synchronize threads

    // Write result back to global memory
    if (threadIdx.x == 0) {
        *accuracy = sharedAcc;
    }
}