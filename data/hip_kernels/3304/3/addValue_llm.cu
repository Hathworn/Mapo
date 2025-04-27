#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addValue(int *array_val, int *b_array_val) {
    int x = threadIdx.x + blockIdx.x * blockDim.x; // Grid-stride loop for larger inputs
    int sum = 0;

    // Utilize shared memory for reducing global memory access time
    __shared__ int shared_array[COLUMNS];
    
    for (unsigned int i = 0; i < ROWS; i++) {
        if (x < COLUMNS) { // Ensure x is within bounds
            shared_array[x] = array_val[i * COLUMNS + x];
            __syncthreads(); // Synchronize threads to ensure shared memory is set
            sum += shared_array[x];
            __syncthreads(); // Synchronize threads before reusing shared memory
        }
    }

    if (x < COLUMNS) { // Ensure x is within bounds
        b_array_val[x] = sum;
    }
}