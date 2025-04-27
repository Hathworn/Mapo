#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    // Use shared memory to reduce global memory access
    __shared__ float shared_data[CU1DBLOCK * 2];
    
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        if (idx == 0) continue;

        // Load data into shared memory
        shared_data[2 * thread_id] = Ar[2 * idx];
        shared_data[2 * thread_id + 1] = Ar[2 * idx + 1];
        __syncthreads();

        float val_x = shared_data[2 * thread_id];
        float val_y = shared_data[2 * thread_id + 1];
        
        float ret = val_x * val_x + val_y * val_y;
        if (use_power) {
            Aw[idx] = ret;
        } else {
            Aw[idx] = sqrtf(ret);
        }
        __syncthreads();
    }

    // Special case handling by the first thread in block
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