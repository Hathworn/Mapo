#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __add__(int *array, int *size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= *size) return; // Use >= for boundary check

    int temp = 0;
    int before = (idx + 1) % *size;
    int after = (idx - 1 + *size) % *size; // Adjusted to prevent negative index

    temp += array[idx];
    temp += array[before];
    temp += array[after];

    __syncthreads(); // Synchronize threads before writing
    array[idx] = temp;
}