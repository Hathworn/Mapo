#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    
    // Optimize loop by unrolling and reducing branch divergence
    for (int idx = thread_id; idx < half_length; idx += CU1DBLOCK) {
        float2 val = reinterpret_cast<const float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    // Use shared memory and synchronize threads to handle special case efficiently
    __shared__ float shared_real;
    __shared__ float shared_im;

    if (threadIdx.x == 0) {
        shared_real = Ar[0];
        shared_im = Ar[row_length];
    }
    __syncthreads();

    // Update special case results
    if (threadIdx.x == 0) {
        Aw[0] = use_power ? shared_real * shared_real : fabs(shared_real);
        Aw[half_length] = use_power ? shared_im * shared_im : fabs(shared_im);
    }
}