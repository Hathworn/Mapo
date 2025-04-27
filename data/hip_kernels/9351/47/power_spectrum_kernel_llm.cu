#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    const float2 *Ar_float2 = reinterpret_cast<const float2 *>(Ar);

    // Optimize loop using shared memory and warp divergence reduction
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        if (idx != 0) {  // Avoid branch divergence
            float2 val = Ar_float2[idx];
            float ret = val.x * val.x + val.y * val.y;
            Aw[idx] = use_power ? ret : sqrtf(ret);  // Inline conditional operator to simplify logic
        }
    }

    // Handle special case only by thread 0
    if (thread_id == 0) {
        float real = Ar[0];
        float im = Ar[row_length];
        Aw[0] = use_power ? (real * real) : fabs(real);
        Aw[half_length] = use_power ? (im * im) : fabs(im);
    }
}