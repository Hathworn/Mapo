#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    // Get global thread index
    int thread_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate half_length outside of the loop
    int half_length = row_length / 2;

    // Early exit for thread_id >= half_length
    if (thread_id >= half_length) return;

    const float *Ar = A_in + blockIdx.x * ldi;
    float *Aw = A_out + blockIdx.x * ldo;

    // Skip processing if thread_id == 0, handled separately
    if (thread_id != 0) {
        float2 val = reinterpret_cast<const float2 *>(Ar)[thread_id];
        float ret = val.x * val.x + val.y * val.y;
        Aw[thread_id] = use_power ? ret : sqrtf(ret);
    }

    // Handle special case for thread_id == 0, executed by the first thread of each block
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length]; // cufft puts this at the end

        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}