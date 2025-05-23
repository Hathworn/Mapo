#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo) {
    int block_id = blockIdx.x;
    int thread_id = blockIdx.x * blockDim.x + threadIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    // Optimize memory access pattern and handle boundaries
    for (int idx = thread_id; idx < half_length; idx += gridDim.x * blockDim.x) {
        if (idx == 0) continue;

        float2 val = reinterpret_cast<float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = ret;
    }

    // Handle special case with synchronization
    __syncthreads();
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        Aw[0] = real * real;
        Aw[half_length] = im * im;
    }
}