#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction_neighbored_pairs_improved_1( int * int_array, int * temp_array, int size)
{
    int tid = threadIdx.x;
    int gid = blockDim.x * blockIdx.x + threadIdx.x;

    // local data block pointer
    int * i_data = int_array + blockDim.x * blockIdx.x;

    if (gid >= size) // Fix boundary check
        return;

    // Use shared memory to optimize global memory access
    extern __shared__ int shared_data[];
    shared_data[tid] = (gid < size) ? int_array[gid] : 0;
    __syncthreads();

    for (int offset = 1; offset <= blockDim.x / 2; offset *= 2)
    {
        int index = 2 * offset * tid;
        if (index < blockDim.x)
        {
            // Operate on shared memory
            shared_data[index] += shared_data[index + offset];
        }
        __syncthreads();
    }

    if (tid == 0)
    {
        temp_array[blockIdx.x] = shared_data[0]; // Write result from shared memory
    }
}