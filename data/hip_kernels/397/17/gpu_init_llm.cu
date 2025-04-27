```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_init(int *mapad, int max, int size){
    // Compute global thread index
    int position = blockIdx.y * blockDim.y * gridDim.x * blockDim.x 
                 + blockIdx.x * blockDim.x
                 + threadIdx.y * blockDim.x 
                 + threadIdx.x;

    // Initialize if within bounds
    if(position < size) {
        mapad[position] = max;
    }
}