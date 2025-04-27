#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_v1_kernel(float *d_output, float *d_input, int length)
{
    // Calculate the global index of the current thread
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if the index is within the bounds of the input array
    if (idx < length) {
        float element = 0.f;

        // Use shared memory for faster access
        extern __shared__ float shared_input[];

        // Load input data into shared memory
        shared_input[threadIdx.x] = d_input[idx];
        __syncthreads();

        // Perform the scan operation using shared memory
        for (int offset = 0; offset <= threadIdx.x; offset++) {
            element += shared_input[threadIdx.x - offset];
        }

        // Store the result in the output array
        d_output[idx] = element;
    }
}