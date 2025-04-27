#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

/****** Single precision *****/

/****** Double precision *****/

#ifdef __cplusplus
}
#endif

__global__ void int_bubble_filter(int* input, const int* vec1, int* output, const int count)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int half_count = count / 2;
    if (tid < half_count)
    {
        output[tid * 2] = vec1[tid * 2];
        output[tid * 2 + 1] = vec1[tid * 2 + 1];
        __syncthreads(); // Ensure initial values are written before calculation begins

        for (int n = 0; n < 2 * count; n++)
        {
            int k = (n % 2 == 0) ? 0 : 1; // Replacing k = (k)?0:1; with n-based toggle
            int i = (tid * 2) + k;

            if (i + 1 < count)
            {
                if (!input[i] && input[i + 1])
                {
                    input[i] = 1;
                    input[i + 1] = 0;
                    output[i] = output[i + 1];
                    output[i + 1] = 0;
                }
                else
                {
                    if (!input[i])
                        output[i] = 0;
                    if (!input[i + 1])
                        output[i + 1] = 0;
                }
            }
            __syncthreads(); // Ensures all threads synchronize before next iteration
        }
    }
}