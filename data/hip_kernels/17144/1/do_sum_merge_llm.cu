#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void do_sum_merge(int *datas, int n) {
    // Calculate 1D thread ID
    int tid = blockDim.x * threadIdx.y + threadIdx.x;

    // Loop reduction
    while (n > 1) {
        int pair_index = n - 1 - tid;
        if (tid < (n + 1) / 2 && pair_index != tid) {
            datas[tid] += datas[pair_index];
            printf("%d->%d->%d\n", n, tid, datas[tid]);
        }
        // Divide n by 2 for next reduction step
        n /= 2;
        __syncthreads(); // Synchronize threads to ensure completion of current step
    }
}