#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Calculate thread id using efficient bitwise operations
    int tid = (blockIdx.x * blockDim.x) + threadIdx.x;
    
    // Use a loop to handle more data per thread if necessary
    for (int i = tid; i < N; i += gridDim.x * blockDim.x) {
        out[i] = in[i] > 0 ? in[i] : 0;
    }
}