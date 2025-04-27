#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x;
    float *Ar = A_in + blockIdx.x * ldi;
    float *Aw = A_out + blockIdx.x * ldo;
    int half_length = row_length / 2;

    // Process non-special cases
    if (thread_id < half_length && thread_id != 0) {
        float2 val = reinterpret_cast<float2 *>(Ar)[thread_id];
        float ret = val.x * val.x + val.y * val.y;
        Aw[thread_id] = use_power ? ret : sqrtf(ret);
    }

    // Handle special case in first thread of the block
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