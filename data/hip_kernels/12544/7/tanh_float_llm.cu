#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void tanh_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Iterate over the thread-stride loop
    while (i < n) {
        if (i >= idx && i % incy == 0) 
            result[i] = tanh(dy[i]);
        
        i += blockDim.x * gridDim.x;
    }
}