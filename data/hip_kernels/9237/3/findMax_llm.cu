#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findMax(int *m, int *cs, int n)
{
    // Calculate the global index
    int colnum = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check if the index is within bounds
    if (colnum < n)
    {
        int max = m[colnum];

        // Traverse through each row and find the maximum
        for (int k = 1; k < n; k++)
        {
            int value = m[colnum + n * k];
            if (value > max)
            {
                max = value;
            }
        }

        // Store the maximum value in the result array
        cs[colnum] = max;
    }
}