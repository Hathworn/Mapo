#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sortKernelSimple(int *arr, int arr_len, int odd)
{
    // Optimize by using shared memory to reduce global memory access
    extern __shared__ int shared[];
    int i = 2 * (blockIdx.x * blockDim.x + threadIdx.x) + odd;

    if (i < arr_len - 1)
    {
        // Load data into shared memory
        shared[threadIdx.x * 2] = arr[i];
        shared[threadIdx.x * 2 + 1] = arr[i + 1];
        __syncthreads();

        // Sort the loaded elements
        int a = shared[threadIdx.x * 2];
        int b = shared[threadIdx.x * 2 + 1];
        if (a > b)
        {
            shared[threadIdx.x * 2] = b;
            shared[threadIdx.x * 2 + 1] = a;
        }
        __syncthreads();

        // Write back the sorted elements to global memory
        arr[i] = shared[threadIdx.x * 2];
        arr[i + 1] = shared[threadIdx.x * 2 + 1];
    }
}