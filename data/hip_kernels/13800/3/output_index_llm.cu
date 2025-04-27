#include "hip/hip_runtime.h"
#include "includes.h"

#define ITER 4
#define BANK_OFFSET1(n) (n) + (((n) >> 5))
#define BANK_OFFSET(n) (n) + (((n) >> 5))
#define NUM_BLOCKS(length, dim) nextPow2(length) / (2 * dim)
#define ELEM 4
#define TOTAL_THREADS 512
#define TWO_PWR(n) (1 << (n))
extern float toBW(int bytes, float sec);

__device__ __inline__ void prefix_sum_warp(int thid, int* temp, int N)
{
    if (thid < 16)
    {
        int i = temp[thid];
        if (thid >= 1) temp[thid] += temp[thid - 1];
        if (thid >= 2) temp[thid] += temp[thid - 2];
        if (thid >= 4) temp[thid] += temp[thid - 4];
        if (thid >= 8) temp[thid] += temp[thid - 8];
        temp[thid] -= i;
    }
}

__global__ void output_index(
    int* device_hist, int* pdevice_hist, 
    int* device_input, int* device_out, 
    int length, int num_blocks, int nibble)
{
    __shared__ int temp[TWO_PWR(ITER)];

    int t = 4 * blockIdx.x * blockDim.x + threadIdx.x;
    int thid = threadIdx.x;

    if (t < length)
    {
        // Pre-fetch data into registers to minimize memory access latency
        int val1 = device_input[t];
        int val2 = device_input[t + TOTAL_THREADS];
        int val3 = device_input[t + 2 * TOTAL_THREADS];
        int val4 = device_input[t + 3 * TOTAL_THREADS];
        
        // Load histogram data into shared memory, unrolling loop to minimize overhead
        if (thid < 32 && thid < ITER) 
        {
            temp[4 * thid] = device_hist[4 * thid * num_blocks + blockIdx.x];
            temp[4 * thid + 1] = device_hist[(4 * thid + 1) * num_blocks + blockIdx.x];
            temp[4 * thid + 2] = device_hist[(4 * thid + 2) * num_blocks + blockIdx.x];
            temp[4 * thid + 3] = device_hist[(4 * thid + 3) * num_blocks + blockIdx.x];
        }

        prefix_sum_warp(thid, temp, TWO_PWR(ITER));
        __syncthreads();

        // Calculate indices using pre-computed shared memory values
        int nibble1 = nibble << 2;
        int mask = (1 << ITER) - 1;
        int lindex1 = temp[(val1 >> nibble1) & mask];
        int lindex2 = temp[(val2 >> nibble1) & mask];
        int lindex3 = temp[(val3 >> nibble1) & mask];
        int lindex4 = temp[(val4 >> nibble1) & mask];
        int gindex1 = pdevice_hist[((val1 >> nibble1) & mask) * num_blocks + blockIdx.x];
        int gindex2 = pdevice_hist[((val2 >> nibble1) & mask) * num_blocks + blockIdx.x];
        int gindex3 = pdevice_hist[((val3 >> nibble1) & mask) * num_blocks + blockIdx.x];
        int gindex4 = pdevice_hist[((val4 >> nibble1) & mask) * num_blocks + blockIdx.x];

        // Write output values using calculated global indices
        device_out[thid + gindex1 - lindex1] = val1;
        device_out[thid + TOTAL_THREADS + gindex2 - lindex2] = val2;
        device_out[thid + 2 * TOTAL_THREADS + gindex3 - lindex3] = val3;
        device_out[thid + 3 * TOTAL_THREADS + gindex4 - lindex4] = val4;
    }
}