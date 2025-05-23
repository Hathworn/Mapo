#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        // Skip the special case for idx == 0
        if (idx == 0) continue;

        // Load float2 value
        float2 val = reinterpret_cast<float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;

        // Conditional writing based on use_power flag
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    // Handle the special cases for idx == 0
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        // Apply condition for special case
        if (use_power) {
            Aw[0] = real * real;
            Aw[half_length] = im * im;
        } else {
            Aw[0] = fabsf(real);
            Aw[half_length] = fabsf(im);
        }
    }
}
```
