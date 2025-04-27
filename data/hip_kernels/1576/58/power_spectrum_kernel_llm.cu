#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length >> 1; // Use bit shift for division by 2

    // Use simplified indexing and loop unrolling for better performance
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        float2 val = reinterpret_cast<const float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    __syncthreads(); // Ensure all threads have completed processing

    // Handle special cases with all threads to avoid branch divergence
    if (thread_id < 2) {
        float real = Ar[0];
        float im = Ar[row_length];
        if (thread_id == 0) {
            Aw[0] = use_power ? (real * real) : fabs(real);
        } else if (thread_id == 1) {
            Aw[half_length] = use_power ? (im * im) : fabs(im);
        }
    }
}