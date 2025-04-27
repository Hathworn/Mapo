#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

__global__ void int_bubble_filter(int* input, const int* vec1, int* output, const int count)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Improved boundary check to reduce warp divergence
    if (tid >= count / 2) return;

    // Optimized initialization using shared memory for reduced global memory access
    extern __shared__ int shared[];
    shared[threadIdx.x * 2] = vec1[tid * 2];
    shared[threadIdx.x * 2 + 1] = vec1[tid * 2 + 1];
    __syncthreads();

    int k = 1;
    for (int n = 0; n < count * 2; n++)
    {
        k = 1 - k;  // Toggle k between 0 and 1

        int i = (tid * 2) + k;
        if (i + 1 < count)
        {
            if (!input[i] && input[i + 1])
            {
                input[i] = 1;
                input[i + 1] = 0;
                output[i] = shared[threadIdx.x * 2 + 1];  // Use shared memory
                shared[threadIdx.x * 2 + 1] = 0;
            }
            else
            {
                if (!input[i])
                    output[i] = 0;
                if (!input[i + 1])
                    output[i + 1] = 0;
            }
        }
        __syncthreads();
    }

    // Move final results from shared memory back to output
    output[tid * 2] = shared[threadIdx.x * 2];
    output[tid * 2 + 1] = shared[threadIdx.x * 2 + 1];
}

#ifdef __cplusplus
}
#endif