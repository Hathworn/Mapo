#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Use shared memory for faster access
    extern __shared__ float shared_in[];
    shared_in[threadIdx.x] = in[tid];
    __syncthreads();

    for (int i = tid; i < size; i += stride) {
        float val = shared_in[threadIdx.x];
        out[i] = val < min_val ? min_val : (val > max_val ? max_val : val);
    }
}