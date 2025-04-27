#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void to_float(float *out, int *in, int size) {
    // Calculate global thread ID
    int element = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop to handle large arrays
    for (int i = element; i < size; i += gridDim.x * blockDim.x) {
        out[i] = static_cast<float>(in[i]); // Use explicit cast
    }
}