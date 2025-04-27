#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sortKernelMulti(int *arr, int arr_len, int num_elem, int oddEven)
{
    int i = 2 * (blockIdx.x * blockDim.x * num_elem) + oddEven + 2 * threadIdx.x;
    int iterEnd = min(arr_len - 1, i + 2 * blockDim.x * num_elem);

    // Optimize by unrolling the loop to reduce branch overhead and improve instruction throughput
    #pragma unroll
    for (; i < iterEnd; i += 2 * blockDim.x)
    {
        int a = arr[i];
        int b = arr[i + 1];
        if (a > b)
        {
            arr[i] = b;
            arr[i + 1] = a;
        }
    }
}