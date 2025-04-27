#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_add(float* in1, float* in2, float* out, int size) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single if condition for range check to reduce branch divergence
    if (tid < size) {
        out[tid] = in1[tid] + in2[tid];

        // Loop through remaining elements using grid stride
        tid += gridDim.x * blockDim.x;
        while (tid < size) {
            out[tid] = in1[tid] + in2[tid];
            tid += gridDim.x * blockDim.x;
        }
    }
}