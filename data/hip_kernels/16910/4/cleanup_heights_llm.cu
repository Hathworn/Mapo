#include "hip/hip_runtime.h"
#include "includes.h"

const int Nthreads = 1024, maxFR = 5000, NrankMax = 6;

__global__ void cleanup_heights(const double *Params, const float *x, const int *st, const int *id, int *st1, int *id1, int *counter) {
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int Nmax = min(maxFR, counter[0]);
    volatile __shared__ float s_id[maxFR], s_x[maxFR];
    __shared__ int local_counter;
    
    // Load data into shared memory efficiently
    for (int i = tid; i < Nmax; i += blockDim.x) {
        s_x[i] = x[i];
        s_id[i] = id[i];
    }
    __syncthreads();

    // Initialize local counter in shared memory
    if (tid == 0) local_counter = 0;
    __syncthreads();

    if (bid * blockDim.x + tid < Nmax) {
        float xmax = s_x[tid];
        bool flag = true;
        // Optimize loop and use early exit on condition
        for (int t = 0; t < Nmax; t++) {
            int d = abs(s_id[t] - s_id[tid]);
            if (d < 5 && xmax < s_x[t]) {
                flag = false;
                break; // Exit early if condition is met
            }
        }
        // If flag is set, it's the local maximum across nearby channels
        if (flag) {
            int indx = atomicAdd(&local_counter, 1); // Use local_counter for atomic operation
            if (indx < maxFR) {
                st1[indx] = st[tid];
                id1[indx] = s_id[tid];
            }
        }
    }
    __syncthreads();

    // Add local counters to global counter
    if (tid == 0) {
        atomicAdd(&counter[1], local_counter);
    }
}