#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void calc_e(int objs, double* a, double b, int* y, double* kval, double* e) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    if (id < objs) {
        double fx = b;
        // Use shared memory for coalesced access
        __shared__ double shared_a[256];
        __shared__ int shared_y[256];

        for (int i = threadIdx.x; i < objs; i += blockDim.x) {
            if (threadIdx.x < objs) {
                shared_a[threadIdx.x] = a[threadIdx.x];
                shared_y[threadIdx.x] = y[threadIdx.x];
            }
            __syncthreads();

            for (int offset = 0; offset < objs; offset += blockDim.x) {
                int idx = offset + threadIdx.x;
                if (idx < objs) {
                    fx += shared_a[threadIdx.x] * shared_y[threadIdx.x] * kval[idx * objs + id];
                }
                __syncthreads();
            }
        }
        e[id] = fx - y[id];
    }
}