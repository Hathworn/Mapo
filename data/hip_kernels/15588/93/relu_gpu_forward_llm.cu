#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate the stride based on the number of threads

    // Use loop to increase occupancy and process more elements in one go
    for (; tid < N; tid += stride) {
        out[tid] = in[tid] > 0 ? in[tid] : 0;
    }
}