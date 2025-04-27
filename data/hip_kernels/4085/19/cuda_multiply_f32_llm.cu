#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_multiply_f32(float *input_output, size_t size, float multipler)
{
    // Use shared memory for faster access
    extern __shared__ float shared_input_output[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (idx < size) {
        shared_input_output[threadIdx.x] = input_output[idx];
        __syncthreads(); // Ensure all threads have loaded their data into shared memory

        // Perform multiplication
        shared_input_output[threadIdx.x] *= multipler;
        
        __syncthreads(); // Ensure all threads have completed processing

        // Write back to global memory
        input_output[idx] = shared_input_output[threadIdx.x];
    }
}