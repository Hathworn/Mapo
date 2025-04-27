#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Utilizing fast math intrinsic for improved performance
    if (tid < N) ingrad[tid] = __fmul_rn(__int2float_rn(indata[tid] > 0), outgrad[tid]);
}