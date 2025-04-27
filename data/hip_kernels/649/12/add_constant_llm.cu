#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_constant(int* arr, int k, int arr_size) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop unrolling for better performance on large arrays
    int stride = blockDim.x * gridDim.x;
    for (; i < arr_size; i += stride) {
        arr[i] += k;
    }
}