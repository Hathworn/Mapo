#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    
    // Efficient shared memory usage
    __shared__ float shared_Ar[CU1DBLOCK * 2];

    // Load data into shared memory
    for (int idx = thread_id * 2; idx < row_length; idx += CU1DBLOCK * 2) {
        shared_Ar[idx] = Ar[idx];
        if (idx + 1 < row_length) {
            shared_Ar[idx + 1] = Ar[idx + 1];
        }
    }
    __syncthreads();

    for (int idx = thread_id; idx < half_length; idx += CU1DBLOCK) {
        if (idx == 0) continue;

        float2 val = reinterpret_cast<float2 *>(shared_Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        if (use_power) {
            Aw[idx] = ret;
        } else {
            Aw[idx] = sqrtf(ret);
        }
    }

    // Streamline special case handling
    if (thread_id == 0) {
        float real = shared_Ar[0];
        float im = shared_Ar[row_length - 1];

        if (use_power) {
            Aw[0] = real * real;
            Aw[half_length] = im * im;
        } else {
            Aw[0] = fabs(real);
            Aw[half_length] = fabs(im);
        }
    }
}