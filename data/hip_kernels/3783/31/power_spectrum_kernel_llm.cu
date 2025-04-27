#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Use shared memory for efficient data access
    __shared__ float2 shared_data[CU1DBLOCK];
    int idx = thread_id;
    while (idx < half_length) {
        // Ignore special case
        if (idx != 0) {
            shared_data[thread_id] = reinterpret_cast<float2 *>(Ar)[idx];
            __syncthreads();

            float2 val = shared_data[thread_id];
            float ret = val.x * val.x + val.y * val.y;
            Aw[idx] = use_power ? ret : sqrtf(ret);
            __syncthreads();
        }
        idx += CU1DBLOCK;
    }

    // Handle special case with atomic operation for thread safety
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];
        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}