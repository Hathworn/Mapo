#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global thread index
    const float *Ar = A_in + blockIdx.x * ldi;
    float *Aw = A_out + blockIdx.x * ldo;

    int half_length = row_length / 2;
    
    if (thread_id < half_length) {
        // Handle special case: idx == 0
        if (thread_id == 0) {
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
        // General case for idx != 0
        else {
            float2 val = reinterpret_cast<const float2 *>(Ar)[thread_id];
            float ret = val.x * val.x + val.y * val.y;
            if (use_power) {
                Aw[thread_id] = ret;
            } else {
                Aw[thread_id] = sqrtf(ret);
            }
        }
    }
}