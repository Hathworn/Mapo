#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BitonicMergeSort(float *d_output, float *d_input, int subarray_size) 
{
    extern __shared__ float shared_data[];

    // Internal index for sorting of the subarray
    int index = threadIdx.x;
    int index_global = index + blockDim.x * blockIdx.x;

    // Calculate the number of portions
    int portions = __float2int_rd(log2f((float)subarray_size)) - 1;

    // Copying of data portion dedicated to this block into shared memory
    shared_data[index] = d_input[index_global];
    __syncthreads();

    // Perform bitonic sort
    for (int portion = 0; portion <= portions; portion++) 
    {
        int offset = 1 << portion;
        int threads_in_box = offset << 1;  // Calculate at the beginning of each portion
        int boxI = threadIdx.x / threads_in_box;

        for (int subportion = portion; subportion >= 0; subportion--) 
        {
            offset = 1 << subportion;
            threads_in_box = offset << 1;
            int arrow_bottom = index % threads_in_box;

            float temp = shared_data[index];

            if (((boxI + 1) % 2) == 1) 
            {
                // Top down
                if (arrow_bottom < offset && shared_data[index + offset] < temp) 
                {
                    shared_data[index] = shared_data[index + offset];
                    shared_data[index + offset] = temp;
                }
            } 
            else 
            {
                // Bottom up
                if (arrow_bottom >= offset && shared_data[index - offset] < temp) 
                {
                    shared_data[index] = shared_data[index - offset];
                    shared_data[index - offset] = temp;
                }
            }
            __syncthreads();  // Synchronize threads at the end of each subportion
        }
    }

    // Store the sorted subarray back to global memory
    d_output[index_global] = shared_data[index];
}
```  
