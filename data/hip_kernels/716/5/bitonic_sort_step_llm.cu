#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bitonic_sort_step(int *dev_values, int j, int k)
{
    unsigned int i = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int ixj = i ^ j;

    // Ensure valid pair
    if (ixj > i) {
        int temp;
        // Shared memory for faster access
        __shared__ int shared_data[1024]; // assuming a maximum of 1024 threads
        shared_data[threadIdx.x] = dev_values[i];
        shared_data[threadIdx.x + (blockDim.x / 2)] = dev_values[ixj];
        __syncthreads();

        // Ascending or descending sort
        bool swap_flag = ((i & k) == 0 && shared_data[threadIdx.x] > shared_data[threadIdx.x + (blockDim.x / 2)]) ||
                         ((i & k) != 0 && shared_data[threadIdx.x] < shared_data[threadIdx.x + (blockDim.x / 2)]);

        if (swap_flag) {
            temp = shared_data[threadIdx.x];
            shared_data[threadIdx.x] = shared_data[threadIdx.x + (blockDim.x / 2)];
            shared_data[threadIdx.x + (blockDim.x / 2)] = temp;
        }

        __syncthreads();
        // Write sorted data back to global memory
        dev_values[i] = shared_data[threadIdx.x];
        dev_values[ixj] = shared_data[threadIdx.x + (blockDim.x / 2)];
    }
}