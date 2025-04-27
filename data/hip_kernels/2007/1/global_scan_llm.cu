```c
#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void global_scan(float* d_out, float* d_in, int num_elements)
{
    int index = threadIdx.x; // Get thread index
    int stride;
    float temp;

    if (index < num_elements) // Ensure threads do not access out-of-bound memory
    {
        d_out[index] = d_in[index];
    }
    __syncthreads();

    for (stride = 1; stride < num_elements; stride *= 2) // Iterate through power of 2 strides
    {
        if (index >= stride) // Ensure valid memory access
        {
            temp = d_out[index] + d_out[index - stride];
        }
        __syncthreads();

        if (index >= stride) // Update output array
        {
            d_out[index] = temp;
        }
        __syncthreads();
    }
}