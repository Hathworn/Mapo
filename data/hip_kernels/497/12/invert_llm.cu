#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invert(float *output, int* input, const int size)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for better performance if input size is large
    extern __shared__ int shared_input[];

    if (i < size) 
    {
        // Load data to shared memory
        shared_input[threadIdx.x] = input[i];
        __syncthreads();

        int d = shared_input[threadIdx.x];
        if (d > 0)
        {
            output[i] = __fdividef(1.f, d);
        }
    }
}