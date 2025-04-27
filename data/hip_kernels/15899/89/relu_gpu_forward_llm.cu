#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Ensure the total threads do not exceed N
    for (int tid = blockIdx.x * blockDim.x + threadIdx.x; tid < N; tid += blockDim.x * gridDim.x) {
        // Use max function for clarity
        out[tid] = max(in[tid], 0.0f);
    }
}