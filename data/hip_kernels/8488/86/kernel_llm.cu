#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *a, size_t N)
{
    // Calculate global thread ID
    int tid = threadIdx.x + blockIdx.x * blockDim.x; 

    // Declare shared memory
    __shared__ float s[BS];

    // Calculate the number of blocks
    int blocks = (N + BS - 1) / BS;
    float sum = 0.0f;

    // Iterate over blocks to cover all elements
    for (int ib = 0; ib < blocks; ib++)
    {
        int off = ib * BS + threadIdx.x;
        
        // Load data into shared memory, check boundary
        if (off < N)
            s[threadIdx.x] = a[off];
        else
            s[threadIdx.x] = 0.0f; // Initialize with 0 if out of bounds

        __syncthreads(); // Ensure all threads have loaded the data

        // Perform reduction in shared memory
        for (int skip = BS / 2; skip > 0; skip >>= 1)
        {
            if (threadIdx.x < skip && (threadIdx.x + skip) < BS)
            {
                s[threadIdx.x] += s[threadIdx.x + skip];
            }
            __syncthreads(); // Synchronize before next step
        }

        // Accumulate result in sum
        if (threadIdx.x == 0)
        {
            sum += s[0];
        }
    }

    // Store final sum in the first element
    if (tid == 0) 
    {
        a[0] = sum;
    }
}