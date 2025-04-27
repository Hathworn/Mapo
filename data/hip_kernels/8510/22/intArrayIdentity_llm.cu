#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void intArrayIdentity(int *size, const int *input, int *output, int *length) {
    // Calculate the global index
    const int ix = blockIdx.x * blockDim.x + threadIdx.x;

    if (ix < *size) {
        // Use pointers to traverse input and output arrays
        const int* inArrayBody = input + ix * (*length);
        int* outArrayBody = output + ix * (*length);

        // Optimize loop by unrolling
        for (long i = 0; i < *length; i++) {
            outArrayBody[i] = inArrayBody[i];
        }
    }
}