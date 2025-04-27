#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Vector Addition - Simple addition using HIP.
* Author - Malhar Bhatt
* Subject - High Performance Computing
*/

/** Function Add -
* Usage - Add 2 values
* Returns - Void
*/
__global__ void add(int num1, int num2, int *ans)
{
    // Use shared memory to minimize global memory access
    __shared__ int temp_1, temp_2;

    // Load data into shared memory
    if (threadIdx.x == 0) {
        temp_1 = num1;
        temp_2 = num2;
    }

    // Ensure all threads have loaded data
    __syncthreads();

    // Perform operation
    if (threadIdx.x == 0) {
        *ans = temp_1 + temp_2;
    }
    // No need for further __syncthreads() as only one thread updates *ans
}