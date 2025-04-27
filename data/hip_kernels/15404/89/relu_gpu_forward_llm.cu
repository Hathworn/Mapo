#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for coalesced access
    for (int i = tid; i < N; i += stride) { // Loop with stride
        out[i] = in[i] > 0 ? in[i] : 0;
    }
}