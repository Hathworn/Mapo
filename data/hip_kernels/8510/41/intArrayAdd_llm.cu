#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void intArrayAdd(int size, const int *input, int *output, const int *inFreeArray, int length) {
    // Calculate global thread index
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;

    // Use shared memory for inFreeArray to reduce access latency
    __shared__ int sharedFreeArray[1024]; // Adjust size as needed

    // Load inFreeArray into shared memory (only by the first warp to avoid excessive shared memory use)
    if (threadIdx.x < length) {
        sharedFreeArray[threadIdx.x] = inFreeArray[threadIdx.x];
    }
    __syncthreads();

    if (ix < size) {
        // Pointers to the current segment of input and output arrays
        const int *inArrayBody = &input[ix * length];
        int *outArrayBody = &output[ix * length];

        // Loop over the length and perform addition
        for (long i = 0; i < length; i++) {
            outArrayBody[i] = inArrayBody[i] + sharedFreeArray[i];
        }
    }
}