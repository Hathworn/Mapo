#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a)
{
    int i = threadIdx.x;
    extern __shared__ int smem[];

    // Load input into shared memory in parallel
    smem[i] = a[i];
    __syncthreads();

    // Use if-else if-else statements for better readability and maintainability
    if (i == 0)  // Thread 0 calculates the sum of squares
    {
        int sum_squares = 0;
        for (int d = 0; d < 5; d++)
        {
            sum_squares += smem[d] * smem[d];
        }
        c[0] = sum_squares;
    }
    else if (i == 1) // Thread 1 performs summation
    {
        int sum = 0;
        for (int d = 0; d < 5; d++)
        {
            sum += smem[d];
        }
        c[1] = sum;
    }
    else if (i == 2)  // Thread 2 performs product
    {
        int product = 1;
        for (int d = 0; d < 5; d++)
        {
            product *= smem[d];
        }
        c[2] = product;
    }
}