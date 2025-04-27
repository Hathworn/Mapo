#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log(float* in, float* out, int size) {
    // Calculate thread ID using built-in variables
    int tid = blockIdx.x * blockDim.x + threadIdx.x; 
    int stride = gridDim.x * blockDim.x;

    // Loop over input elements with stride
    for (int i = tid; i < size; i += stride) {
        // Perform log calculation if index is within boundaries
        out[i] = logf(in[i]); // Use logf for better performance with float
    }
}