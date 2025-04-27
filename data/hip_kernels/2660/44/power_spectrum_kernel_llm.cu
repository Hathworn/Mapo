```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Use shared memory for coalesced access; assume enough shared memory
    extern __shared__ float shared_A[];
    float2 *shared_A_val = reinterpret_cast<float2 *>(shared_A);

    // Load data into shared memory
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        shared_A_val[idx] = reinterpret_cast<float2 *>(Ar)[idx];
    }
    __syncthreads();

    // Compute power spectrum
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        if (idx == 0) continue; // Ignore special case

        float2 val = shared_A_val[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    __syncthreads();

    // Handle special case for the first and last elements
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}