#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void calc_predict(int objs, int objs_train, double* __restrict__ a, double b, int* __restrict__ y_train, double* __restrict__ kval, int* __restrict__ y) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    if (id < objs) {
        double fx = b;
        for (int i = 0; i < objs_train; i++) {
            // Coalesced memory access for kval
            fx += a[i] * y_train[i] * kval[id * objs_train + i]; // Changed indexing for kval
        }
        y[id] = fx >= 0 ? 1 : -1;
    }
}