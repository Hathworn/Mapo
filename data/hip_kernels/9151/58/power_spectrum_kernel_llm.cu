#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    int idx = thread_id;

    // Use shared memory for better memory access performance
    __shared__ float data_shared[CU1DBLOCK][2];

    while (idx < half_length) {
        if (idx != 0) { // skip special case
            data_shared[thread_id][0] = Ar[2 * idx];   // load real part
            data_shared[thread_id][1] = Ar[2 * idx + 1]; // load imaginary part
            __syncthreads();

            float ret = data_shared[thread_id][0] * data_shared[thread_id][0] +
                        data_shared[thread_id][1] * data_shared[thread_id][1];
            if (use_power) {
                Aw[idx] = ret;
            } else {
                Aw[idx] = sqrtf(ret);
            }
        }
        idx += CU1DBLOCK;
        __syncthreads();
    }

    // Handle special case
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