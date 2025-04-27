#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    // Optimize loop with a conditional check outside
    if (thread_id < half_length && thread_id != 0) {
        float2 val = reinterpret_cast<const float2 *>(Ar)[thread_id];
        float ret = val.x * val.x + val.y * val.y;
        Aw[thread_id] = use_power ? ret : sqrtf(ret);
    }

    // Optimize special case handling by using thread synchronization
    __syncthreads();
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}