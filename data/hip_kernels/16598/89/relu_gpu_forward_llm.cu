#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop through all elements to utilize each thread effectively
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        out[i] = in[i] > 0 ? in[i] : 0;
    }
}