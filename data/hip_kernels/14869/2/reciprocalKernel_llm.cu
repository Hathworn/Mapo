#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure all threads handle one data element
    if (idx < vectorSize) {
        float value = data[idx];
        // Avoid division by zero or invalid operation
        if (value != 0.0f) {
            data[idx] = 1.0f / value;
        } else {
            data[idx] = 0.0f; // Set appropriate value for zero or invalid data
        }
    }
}