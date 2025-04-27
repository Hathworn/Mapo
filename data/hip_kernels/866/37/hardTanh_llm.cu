#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Optimize by unrolling the loop for better performance
    #pragma unroll
    for (int i = tid; i < size; i += stride) {
        float val = in[i];
        val = val < min_val ? min_val : val;
        val = val > max_val ? max_val : val;
        out[i] = val;
    }
}