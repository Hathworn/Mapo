#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void oddevensort(int *in, int *out, int size)
{
    __shared__ bool swappedodd;
    __shared__ bool swappedeven;
    int temp;
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    bool oddeven = true;

    while (true)
    {
        __syncthreads(); // Synchronize at the start of the loop
        if (oddeven)
        {
            swappedodd = false;
            __syncthreads();

            if (idx < size / 2)
            {
                int i = 2 * idx;
                if (i + 1 < size && in[i] > in[i + 1])
                {
                    temp = in[i];
                    in[i] = in[i + 1];
                    in[i + 1] = temp;
                    swappedodd = true;
                }
            }
            __syncthreads();
        }
        else
        {
            swappedeven = false;
            __syncthreads();

            if (idx < (size / 2) - 1)
            {
                int i = 2 * idx + 1;
                if (i + 1 < size && in[i] > in[i + 1])
                {
                    temp = in[i];
                    in[i] = in[i + 1];
                    in[i + 1] = temp;
                    swappedeven = true;
                }
            }
            __syncthreads();
        }

        if (!swappedodd && !swappedeven)
        {
            break;
        }
        oddeven = !oddeven;
    }

    // Write the sorted output
    if (idx < size)
    {
        out[idx] = in[idx];
    }
}