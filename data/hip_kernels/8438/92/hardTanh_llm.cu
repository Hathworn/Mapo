#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    const int tid = threadIdx.x + blockIdx.x * blockDim.x;
    const int stride = gridDim.x * blockDim.x;

    // Use shared memory to optimize memory access
    extern __shared__ float shared_in[];

    for (int i = tid; i < size; i += stride) {
        shared_in[threadIdx.x] = in[i];
        __syncthreads();

        // Perform computation using shared memory
        const float val = threadIdx.x < blockDim.x ? shared_in[threadIdx.x] : in[i];
        out[i] = val < min_val ? min_val : (val > max_val ? max_val : val);
    }
}