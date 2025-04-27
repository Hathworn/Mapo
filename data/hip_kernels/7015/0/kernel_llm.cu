#include "hip/hip_runtime.h"
#include "includes.h"

namespace ann {








// CUDA2





}

__global__ void kernel(int n, float *arr){

    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if(idx < n) { // Process only valid indices
        float val = arr[idx];
        val *= 2.0f;
        arr[idx] = val;
    }
}