#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void arrayTest(int n, long *factor, long *arr, long *result, int *const_arr1, long *const_arr2)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if the thread index is out of bounds
    if (i >= n) return;

    int idx = i * 3;

    // Load factor[i] once to optimize memory access
    long factor_i = factor[i]; 

    // Unroll loop for better performance
    result[idx] = arr[idx] * factor_i;
    result[idx + 1] = arr[idx + 1] * factor_i;
    result[idx + 2] = arr[idx + 2] * factor_i;
}