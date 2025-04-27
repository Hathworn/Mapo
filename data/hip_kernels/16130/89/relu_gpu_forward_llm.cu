#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use of larger stride for accessing elements to ensure better performance and load balancing
    int stride = blockDim.x * gridDim.x;
    for (int index = tid; index < N; index += stride) {
        out[index] = in[index] > 0 ? in[index] : 0; // Apply relu operation
    }
}