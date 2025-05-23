#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    int total_threads = gridDim.x * blockDim.x;

    for (int idx = thread_id + block_id * blockDim.x; idx < half_length; idx += total_threads) {
        // ignore special case
        if (idx == 0) continue;

        float2 val = reinterpret_cast<float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = ret;
    }

    __syncthreads(); // Ensure all threads complete the above before continuing

    // handle special case
    if (thread_id == 0) {
        float real = Ar[0];
        // cufft puts this at the end, this is different than kaldi does with its
        // own internal implementation
        float im = Ar[row_length];

        Aw[0] = real * real;
        Aw[half_length] = im * im;
    }
}