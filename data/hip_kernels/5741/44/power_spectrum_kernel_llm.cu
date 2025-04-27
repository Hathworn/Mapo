#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Use shared memory to reduce global memory accesses for better performance
    __shared__ float2 shared_A[512];
    if (thread_id < half_length) {
        shared_A[thread_id] = reinterpret_cast<float2 *>(Ar)[thread_id];
    }
    __syncthreads();

    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        // ignore special case
        if (idx == 0) continue;

        float2 val = shared_A[idx];
        float ret = val.x * val.x + val.y * val.y;
        if (use_power) {
            Aw[idx] = ret;
        } else {
            Aw[idx] = sqrtf(ret);
        }
    }

    // handle special case with optimized calculations
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
}