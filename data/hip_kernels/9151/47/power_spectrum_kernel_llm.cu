#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Use shared memory to reduce global memory accesses
    __shared__ float2 shared_Ar[CU1DBLOCK];
    if (thread_id < half_length) {
        shared_Ar[thread_id] = reinterpret_cast<float2 *>(Ar)[thread_id];
    }
    __syncthreads();

    for (int idx = thread_id; idx < half_length; idx += CU1DBLOCK) {
        // Ignore special case
        if (idx == 0) continue;

        // Use shared memory instead of global memory directly
        float2 val = shared_Ar[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    // Handle special case using first thread
    if (threadIdx.x == 0) {
        float real = Ar[0];
        // cufft puts this at the end, different than kaldi does with its own internal implementation
        float im = Ar[row_length];

        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}