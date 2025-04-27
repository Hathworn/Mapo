#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorReduce(const float *global_input_data, float *global_output_data, int numElements)
{
    __shared__ float sdata[1024];
    __shared__ int sindice[1024];

    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (i < numElements) {
        sdata[tid] = global_input_data[i];
        sindice[tid] = tid;
    } else {
        sdata[tid] = FLT_MAX; // Load maximum float value to handle out-of-bounds indices
        sindice[tid] = -1;    // Invalid index for out-of-bounds elements
    }
    __syncthreads();

    // Perform reduction
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s && i + s < numElements) {
            if (sdata[tid] > sdata[tid + s]) {
                sdata[tid] = sdata[tid + s];
                sindice[tid] = sindice[tid + s];
            }
        }
        __syncthreads();
    }

    // Output result
    if (tid == 0) {
        global_output_data[blockIdx.x * 2] = sdata[0]; // Use block index for output
        global_output_data[blockIdx.x * 2 + 1] = sindice[0];
    }
}