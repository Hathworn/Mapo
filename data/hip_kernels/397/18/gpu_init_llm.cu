```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_init(int *mapad, int max, int size){

    // Calculate the global thread index
    int position = blockIdx.x * blockDim.x + threadIdx.x + 
                   blockIdx.y * blockDim.x * gridDim.x;

    // Initialize mapad if position is within bounds
    if (position < size) {
        mapad[position] = max;
    }
}