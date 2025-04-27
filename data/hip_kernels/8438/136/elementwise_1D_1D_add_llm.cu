#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_add(float* in1, float* in2, float* out, int size) {
    // Use shared memory to enhance memory access performance
    extern __shared__ float shared_in1[];
    extern __shared__ float shared_in2[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input data into shared memory
    if (tid < size) {
        shared_in1[threadIdx.x] = in1[tid];
        shared_in2[threadIdx.x] = in2[tid];
    }

    __syncthreads();

    // Improved stride calculation
    int stride = blockDim.x * gridDim.x;

    for (; tid < size; tid += stride) {
        if (tid < size) {
            // Perform computation using shared memory
            out[tid] = shared_in1[threadIdx.x] + shared_in2[threadIdx.x];
        }
    }
}