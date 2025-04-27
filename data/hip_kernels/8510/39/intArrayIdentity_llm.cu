#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void intArrayIdentity(int size, int *input, int *output, int length) {
    // Calculate global thread index
    const int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only if within bounds
    if (ix < size) {
        // Get pointers to the input and output sections
        const int *inArrayBody = &input[ix * length];
        int *outArrayBody = &output[ix * length];

        // Use shared memory for better memory access patterns
        extern __shared__ int sdata[];
        
        // Copy to shared memory
        for (int i = threadIdx.x; i < length; i += blockDim.x) {
            sdata[i] = inArrayBody[i];
        }
        
        __syncthreads();

        // Copy from shared memory to global memory
        for (int i = threadIdx.x; i < length; i += blockDim.x) {
            outArrayBody[i] = sdata[i];
        }
    }
}