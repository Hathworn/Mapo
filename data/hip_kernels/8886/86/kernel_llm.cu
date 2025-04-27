#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(float *a, size_t N)
{
    int tid = threadIdx.x;
    __shared__ float s[BS];
    float sum = 0.0f;

    for (int ib = blockIdx.x; ib < (N + BS - 1) / BS; ib += gridDim.x) // Use grid-stride loop
    {
        int off = ib * BS + tid;
        s[tid] = (off < N) ? a[off] : 0.0f; // Prevent out-of-bounds access
        
        __syncthreads(); // Ensure all threads have loaded data

        for (int skip = BS / 2; skip > 0; skip >>= 1) // Perform parallel reduction
        {
            if (tid < skip)
                s[tid] += s[tid + skip];
            __syncthreads(); // Ensure all threads complete each step
        }
        
        if (tid == 0) // Only one thread updates the global sum
            sum += s[0];
    }

    if (tid == 0) // Store result from the first thread
        a[0] = sum;
}