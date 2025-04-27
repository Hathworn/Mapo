#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaGetShiftedMidPrice(int N_inst, int batch_size, float *alphas, float *mid, float *shifted_prc) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Linear index for threads
    int stride = blockDim.x * gridDim.x;              // Total number of threads
    if (blockIdx.x < N_inst) {
        for (int i = idx; i < batch_size; i += stride) {
            shifted_prc[blockIdx.x * batch_size + i] = (1.0f + alphas[blockIdx.x * batch_size + i]) * mid[i];
        }
    }
}