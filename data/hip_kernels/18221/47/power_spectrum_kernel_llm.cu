#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int half_length = row_length / 2;

    if (idx < half_length) {
        float *Ar = A_in + blockIdx.x * ldi;
        float *Aw = A_out + blockIdx.x * ldo;

        // Special case handled by thread 0
        if (idx == 0) {
            float real = Ar[0];
            float im = Ar[row_length];

            if (use_power) {
                Aw[0] = real * real;
                Aw[half_length] = im * im;
            } else {
                Aw[0] = fabs(real);
                Aw[half_length] = fabs(im);
            }
            return;
        }

        // Calculate power or magnitude for standard case
        float2 val = reinterpret_cast<float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }
}