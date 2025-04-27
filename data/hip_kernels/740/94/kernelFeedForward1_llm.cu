#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFeedForward1(float *zs, int bound2, float *weights, int w_off, float *activations1) {
    // Initialize z for this thread
    float z = 0.0f;

    // Use shared memory to reduce global memory accesses
    __shared__ float shared_activations1[BLOCK_SIZE];
    
    int tx = threadIdx.x;

    // Loop with stride to cover all elements
    for (int i = tx; i < bound2; i += blockDim.x) {
        if (i < bound2) { // Bounds check
            shared_activations1[i] = activations1[i];
        }
        __syncthreads(); // Synchronize after loading
                
        // Accumulate dot product
        z += weights[w_off + (tx * bound2) + i] * shared_activations1[i];
        __syncthreads();
    }

    // Write the result to global memory
    zs[tx] = z;
}