#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop for better occupancy and resource utilization
    for (; tid < N; tid += gridDim.x * blockDim.x) {
        out[tid] = in[tid] > 0 ? in[tid] : 0;
    }
}