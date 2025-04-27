#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    int stride = gridDim.x * blockDim.x;  // Total number of threads in the grid
    for (; tid < size; tid += stride) {  // Loop through elements with a stride
        out[tid] = exp(in[tid]);  // Compute the exponential of input and store in output
    }
}
```
