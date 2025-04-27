#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int locate(int val, int *data, int n)
{
    int i_left = 0;
    int i_right = n-1;
    int i = (i_left + i_right) / 2;
    while (i_right - i_left > 1) {
        if (data[i] > val) i_right = i;
        else if (data[i] < val) i_left = i;
        else break;
        i = (i_left + i_right) / 2;
    }
    return i;
}

__global__ void prescan_arbitrary_unoptimized(int *output, int *input, int n, int powerOfTwo) {
    extern __shared__ int temp[];
    int threadID = threadIdx.x;

    // Load input into shared memory with boundary check
    if (2 * threadID < n) {
        temp[2 * threadID] = input[2 * threadID];
        temp[2 * threadID + 1] = input[2 * threadID + 1];
    } else {
        temp[2 * threadID] = 0;
        temp[2 * threadID + 1] = 0;
    }

    int offset = 1;
    for (int d = powerOfTwo >> 1; d > 0; d >>= 1)
    {
        __syncthreads();
        if (threadID < d)
        {
            int ai = offset * (2 * threadID + 1) - 1;
            int bi = offset * (2 * threadID + 2) - 1;
            temp[bi] += temp[ai];
        }
        offset *= 2;
    }

    // Clear the last element in the shared memory
    if (threadID == 0) { temp[powerOfTwo - 1] = 0; }

    for (int d = 1; d < powerOfTwo; d *= 2)
    {
        offset >>= 1;
        __syncthreads();
        if (threadID < d)
        {
            int ai = offset * (2 * threadID + 1) - 1;
            int bi = offset * (2 * threadID + 2) - 1;
            int t = temp[ai];
            temp[ai] = temp[bi];
            temp[bi] += t;
        }
    }
    __syncthreads();

    // Write results to device memory with boundary check
    if (2 * threadID < n) {
        output[2 * threadID] = temp[2 * threadID];
        output[2 * threadID + 1] = temp[2 * threadID + 1];
    }
}