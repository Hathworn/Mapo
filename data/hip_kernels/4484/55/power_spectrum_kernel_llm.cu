#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Utilize shared memory for improved performance
    __shared__ float2 shared_A[CU1DBLOCK];
    
    for (int idx = thread_id; idx < half_length; idx += CU1DBLOCK) {
        if (idx == 0) continue;

        // Load data into shared memory
        shared_A[thread_id] = reinterpret_cast<const float2 *>(Ar)[idx];
        __syncthreads();

        float ret = shared_A[thread_id].x * shared_A[thread_id].x + shared_A[thread_id].y * shared_A[thread_id].y;
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    // Process special case with single thread
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}