#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    // Use shared memory for improved memory access efficiency
    extern __shared__ float2 shared_mem[];
    
    // Load data into shared memory
    for(int i = thread_id; i < half_length; i += blockDim.x) {
        shared_mem[i] = reinterpret_cast<const float2 *>(Ar)[i];
    }
    __syncthreads();

    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        // Ignore special case
        if (idx == 0) continue;

        // Compute power spectrum
        float2 val = shared_mem[idx];
        float ret = val.x * val.x + val.y * val.y;
        if (use_power) {
            Aw[idx] = ret;
        } else {
            Aw[idx] = sqrtf(ret);
        }
    }

    // Handle special case
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        if (use_power) {
            Aw[0] = real * real;
            Aw[half_length] = im * im;
        } else {
            Aw[0] = fabs(real);
            Aw[half_length] = fabs(im);
        }
    }
}