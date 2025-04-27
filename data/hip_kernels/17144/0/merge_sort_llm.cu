#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

// Optimization in the merge_sort kernel function
__global__ void merge_sort(int *datas, int n) {
    int tid = blockDim.x * threadIdx.y + threadIdx.x;
    extern __shared__ int shared[];

    // Load data into shared memory
    if (tid < n) shared[tid] = datas[tid];
    __syncthreads();

    // Merge sort logic optimized
    for (int gap = 2, cnt = 1; gap < n * 2; gap <<= 1, cnt++) {
        if (tid % gap == 0) {
            int left = tid + n * ((cnt + 1) % 2);
            int mid = tid + gap / 2 + n * ((cnt + 1) % 2);
            int end = tid + gap + ((cnt + 1) % 2) * n;
            int full_end = (1 + (cnt + 1) % 2) * n;
            int res_ind = n * (cnt % 2) + tid;

            // Efficient merging process
            // Use shared memory efficiently
            while ((left < mid && left < full_end) || (right < end && right < full_end)) {
                if (!(left < mid && left < full_end)) {
                    shared[res_ind] = shared[right];
                    right++;
                } else if (!(right < end && right < full_end)) {
                    shared[res_ind] = shared[left];
                    left++;
                } else {
                    shared[res_ind] = (shared[right] > shared[left]) ? shared[left++] : shared[right++];
                }
                res_ind++;
            }
        }
        __syncthreads();
    }
    
    // Update global memory
    if (tid < n) datas[tid] = shared[tid + ((cnt + 1) % 2) * n];
}