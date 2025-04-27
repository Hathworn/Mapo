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

__global__ void add_kernel(int* device_result, int* device_blocksum)
{
    int thid = threadIdx.x;
    int N = blockDim.x;
    int offset = blockIdx.x * 4 * blockDim.x;
    int temp1 = device_blocksum[blockIdx.x];

    // Use loop unrolling to reduce loop overhead
    #pragma unroll
    for (int i = 0; i < 4; ++i) {
        device_result[offset + thid + i * N] += temp1;
    }
}