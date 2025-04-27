#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reluForward(float* R, float* V, int x, int y) {
    // Use shared memory to minimize global memory accesses
    extern __shared__ float shared_V[];
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    if (index < x * y) {
        // Load data into shared memory
        shared_V[threadIdx.x] = V[index];
        __syncthreads(); // Ensure all threads have written to shared memory

        // Perform ReLU operation
        R[index] = fmaxf(shared_V[threadIdx.x], 0);
    }
}