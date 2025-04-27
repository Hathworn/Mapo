#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void serialReduction(int *d_array, int numberOfElements)
{
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to store intermediate sums
    extern __shared__ int s_data[];

    // Load elements into shared memory and perform reduction in parallel
    int sum = 0;
    for(int i = tid; i < numberOfElements; i += blockDim.x * gridDim.x)
    {
        sum += d_array[i];
    }
    s_data[threadIdx.x] = sum;
    __syncthreads();

    // Perform reduction within the block
    for(int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        if(threadIdx.x < stride)
        {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Thread 0 of each block outputs the block result
    if(threadIdx.x == 0)
    {
        atomicAdd(d_array, s_data[0]);
    }
}