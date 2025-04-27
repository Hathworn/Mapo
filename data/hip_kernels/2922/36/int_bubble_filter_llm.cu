#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

__global__ void int_bubble_filter(int* input, const int* vec1, int* output, const int count)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid < count / 2) // Use '<' instead of '<=' for proper range coverage
    {
        int base = tid * 2;
        output[base] = vec1[base];
        output[base + 1] = vec1[base + 1];

        for (int n = 0; n < count * 2; n++)
        {
            int i = base + (n & 1); // Use bitwise operation for k toggle
            if (i + 1 < count)
            {
                int val1 = input[i];
                int val2 = input[i + 1];

                if ((!val1) && (val2))
                {
                    input[i] = 1;
                    input[i + 1] = 0;
                    output[i] = output[i + 1];
                    output[i + 1] = 0;
                }
                else
                {
                    if (!val1) output[i] = 0;
                    if (!val2) output[i + 1] = 0;
                }
            }
            __syncthreads();
        }
    }
}