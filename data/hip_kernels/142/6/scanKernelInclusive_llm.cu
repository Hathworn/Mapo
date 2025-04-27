#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scanKernelInclusive(int *c, const int *a, size_t size, size_t offset)
{
    int myId = threadIdx.x + offset;

    // Boundary check within size and total offset
    if (myId < (size + offset)) 
    {
        c[myId] = a[myId];

        // Synchronize threads to ensure all elements are copied
        __syncthreads();

        // Reduce loop iterations by using warp-level shuffle for sum
        for (unsigned int _neighbor = 1; _neighbor <= (myId - offset); _neighbor <<= 1)
        {
            int op2 = 0;
            if (myId >= _neighbor + offset) 
            {
                op2 = __shfl_up_sync(0xFFFFFFFF, c[myId], _neighbor);
            }

            // Synchronize threads between load and store operations
            __syncthreads();
            
            c[myId] += op2;

            // Synchronize threads after update
            __syncthreads();
        }

        // Deal with offset for final scan result
        if (offset > 0) 
        {
            c[myId] += c[offset - 1];
        }
    }
}