#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square(int *array, int arrayCount)
{
    // Use shared memory to optimize
    extern __shared__ int dynamicSmem[];
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    if (idx < arrayCount) {
        dynamicSmem[threadIdx.x] = array[idx];
        __syncthreads(); // Ensure all threads have loaded data to shared memory

        array[idx] = dynamicSmem[threadIdx.x] * dynamicSmem[threadIdx.x];
    }
}