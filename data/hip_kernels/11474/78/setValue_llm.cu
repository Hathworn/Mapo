#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void setValue(float *data, int idx, float value) {
    if(blockIdx.x == 0 && threadIdx.x == 0) { // Ensure only one thread writes by checking blockIdx
        data[idx] = value;
    }
}