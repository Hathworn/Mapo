#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x;
    int half_length = row_length / 2;

    if (thread_id < half_length) {
        if (thread_id == 0) {
            // Handle special case directly in kernel
            float real = A_in[blockIdx.x * ldi];
            float im = A_in[blockIdx.x * ldi + row_length];
            if (use_power) {
                A_out[blockIdx.x * ldo] = real * real;
                A_out[blockIdx.x * ldo + half_length] = im * im;
            } else {
                A_out[blockIdx.x * ldo] = fabs(real);
                A_out[blockIdx.x * ldo + half_length] = fabs(im);
            }
        } else {
            const float *Ar = A_in + blockIdx.x * ldi;
            float *Aw = A_out + blockIdx.x * ldo;
            float2 val = reinterpret_cast<const float2*>(Ar)[thread_id];
            float ret = val.x * val.x + val.y * val.y;
            Aw[thread_id] = use_power ? ret : sqrtf(ret);
        }
    }
}