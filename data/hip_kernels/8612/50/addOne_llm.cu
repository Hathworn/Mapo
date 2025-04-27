```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addOne(int* array, int size) {
    // Use threadIdx.x to increase parallelism, ensuring threads process array within bounds
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        array[index]++;
    }
}