#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Use shared memory to improve memory access efficiency
    __shared__ float2 shared_data[CU1DBLOCK];
    
    for (int idx = thread_id; idx < half_length; idx += CU1DBLOCK) {
        if (idx == 0) continue;

        shared_data[threadIdx.x] = reinterpret_cast<const float2 *>(Ar)[idx];
        __syncthreads();
        
        float val_x = shared_data[threadIdx.x].x;
        float val_y = shared_data[threadIdx.x].y;
        
        float ret = val_x * val_x + val_y * val_y;
        if (use_power) {
            Aw[idx] = ret;
        } else {
            Aw[idx] = sqrtf(ret);
        }
        __syncthreads();
    }

    // Handle special case, only once per block
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