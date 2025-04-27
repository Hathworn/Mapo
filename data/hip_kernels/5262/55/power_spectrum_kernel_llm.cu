#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    
    // Use shared memory for efficiency if possible (depending on size)
    float2 val;
    float ret;
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {  // Use block dimension for increment
        if (idx == 0) continue;  // Ignore special case in loop

        val = reinterpret_cast<const float2 *>(Ar)[idx];
        ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret);  // Use ternary operator for simplicity
    }

    // Handle special cases at the start and end
    if (thread_id == 0) {
        float real = Ar[0];
        float im = Ar[row_length];
        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}