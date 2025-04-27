#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pod_racing(unsigned int *d_rand, unsigned int *win, unsigned int *loss, unsigned int size, int *iter) {
    int index = threadIdx.x + blockDim.x * blockIdx.x;
    __shared__ int shared_iter;  // Use shared memory for iter

    if (threadIdx.x == 0) {
        shared_iter = iter[0];
    }
    __syncthreads();

    const unsigned int flips[] = { 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1 };
    if (index < size) {
        // Check flip result and update win/loss accordingly
        if ((d_rand[index] % 2) != flips[shared_iter]) {
            shared_iter = 0;
            loss[index] = 1;
        } else {
            shared_iter++;
            if (shared_iter == 15) {
                win[index] = 1;
                shared_iter = 0;
            }
        }
    }

    __syncthreads();
    if (threadIdx.x == 0) {
        iter[0] = shared_iter;
    }
}