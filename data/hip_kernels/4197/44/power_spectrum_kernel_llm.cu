#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Process all indices in parallel avoiding index zero
    for (int idx = thread_id + 1; idx < half_length; idx += blockDim.x) {
        float2 val = reinterpret_cast<float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    // Synchronize threads before processing special cases
    __syncthreads();
    
    // Handle special cases with thread 0
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];
        Aw[0] = use_power ? real * real : fabsf(real);
        Aw[half_length] = use_power ? im * im : fabsf(im);
    }
}