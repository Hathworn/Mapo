#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *a, size_t N)
{
    int tid = threadIdx.x;
    __shared__ float s[BS];
    float sum = 0.0f;
    int blocks = (N + BS - 1) / BS;

    for (int ib = 0; ib < blocks; ib++)
    {
        int off = ib * BS + tid;
        s[tid] = (off < N) ? a[off] : 0.0f;  // Use conditional assignment to handle out-of-bounds access

        __syncthreads();  // Ensure shared memory load is complete

        for (int skip = BS / 2; skip > 0; skip >>= 1)
        {
            if (tid < skip)
                s[tid] += s[tid + skip];
            __syncthreads();  // Synchronize to ensure all additions are complete
        }

        if (tid == 0) 
            sum += s[0];  // Only accumulate sum in the first thread of the block
    }

    if (tid == 0) 
        a[0] = sum;  // Only the first thread writes the result
}