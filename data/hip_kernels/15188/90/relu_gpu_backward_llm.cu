#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate global stride
    for (int i = tid; i < N; i += stride) { // Use loop with stride for better utilization
        ingrad[i] = indata[i] > 0 ? outgrad[i] : 0; // Update value conditionally
    }
}