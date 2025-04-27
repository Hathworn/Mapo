#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (i < N) {
        // Add 2 to input and store in output
        out[i] = in[i] + 2;
    }
}