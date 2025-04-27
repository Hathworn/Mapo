#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void KernelLBSSimple(int aCount, const int* b_global, int bCount, int* indices_global) {

    __shared__ int data_shared[NT * VT];

    int tid = threadIdx.x;
    int x[VT];

    // Load bCount elements from B into data_shared using coalesced access
    int chunk_size = (bCount + NT - 1) / NT;
    int start = tid * chunk_size;
    int end = min(start + chunk_size, bCount);
    for (int index = start; index < end; ++index) {
        data_shared[index] = b_global[index];
    }
    __syncthreads();

    // Each thread searches for its Merge Path partition.
    int diag = VT * tid;
    int begin = max(0, diag - bCount);
    int end = min(diag, aCount);
    while (begin < end) {
        int mid = (begin + end) >> 1;
        int aKey = mid;
        int bKey = data_shared[diag - 1 - mid];
        if (aKey < bKey) begin = mid + 1;
        else end = mid;
    }
    int mp = begin;

    // Sequentially search, comparing indices a to elements data_shared[b].
    int a = mp;
    int b = diag - a;

    #pragma unroll
    for (int i = 0; i < VT; ++i) {
        bool p;
        if (b >= bCount) p = true;
        else if (a >= aCount) p = false;
        else p = a < data_shared[b];

        if (p)
            data_shared[bCount + a++] = b - 1; // Advance A
        else
            ++b; // Advance B
    }
    __syncthreads();

    // Store all indices to global memory.
    for (int i = tid; i < aCount; i += NT)
        indices_global[i] = data_shared[bCount + i];
}