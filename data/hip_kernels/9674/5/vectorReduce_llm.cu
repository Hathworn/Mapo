#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorReduce(const float *global_input_data, float *global_output_data, const int numElements)
{
    __shared__ float sdata[10];
    __shared__ int sindice[10];

    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load elements into shared memory
    if (i < numElements) {
        sdata[tid] = global_input_data[i];
        sindice[tid] = tid;
    } else {
        sdata[tid] = FLT_MAX;  // Set maximum value for unused elements
        sindice[tid] = -1;     // Set invalid index for unused elements
    }
    __syncthreads();

    // Reduction process
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s && (i + s) < numElements) { // Ensure within range
            if (sdata[tid] > sdata[tid + s]) {
                sdata[tid] = sdata[tid + s];
                sindice[tid] = sindice[tid + s];
            }
        }
        __syncthreads();
    }

    // Write results to global memory
    if (tid == 0) {
        global_output_data[blockIdx.x * 2] = sdata[0];
        global_output_data[blockIdx.x * 2 + 1] = sindice[0];
    }
}