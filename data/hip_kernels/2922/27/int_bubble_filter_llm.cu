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

    // Optimize by unrolling the loop and using shared memory
    if (tid < count / 2)
    {
        output[tid * 2] = vec1[tid * 2];
        output[tid * 2 + 1] = vec1[tid * 2 + 1];

        extern __shared__ int s_input[];  // Shared memory for input array
        extern __shared__ int s_output[]; // Shared memory for output array

        s_input[tid * 2] = input[tid * 2];
        s_input[tid * 2 + 1] = input[tid * 2 + 1];
        s_output[tid * 2] = output[tid * 2];
        s_output[tid * 2 + 1] = output[tid * 2 + 1];

        __syncthreads();

        for (int n = 0; n < count*2; n++)
        {
            int k = (n % 2);
            int i = (tid * 2) + k;
            if (i + 1 < count)
            {
                if ((!s_input[i]) && (s_input[i + 1]))
                {
                    s_input[i] = 1;
                    s_input[i + 1] = 0;
                    s_output[i] = s_output[i + 1];
                    s_output[i + 1] = 0;
                }
                else
                {
                    if (!s_input[i])
                        s_output[i] = 0;
                    if (!s_input[i + 1])
                        s_output[i + 1] = 0;
                }
            }
            __syncthreads();
        }

        output[tid * 2] = s_output[tid * 2];
        output[tid * 2 + 1] = s_output[tid * 2 + 1];
    }
}