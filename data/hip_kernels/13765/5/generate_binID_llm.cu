#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_binID(const float* dIn, int* out, const int binNumber, const float lumMin, const float lumMax, const int size) {
    // Calculate global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (i < size) {
        // Calculate the range outside the loop
        float range = lumMax - lumMin;

        // Compute bin index
        int bin = __fdividef(dIn[i] - lumMin, range) * binNumber; // Use fast divide

        // Assign bin to output
        out[i] = bin;
    }
}