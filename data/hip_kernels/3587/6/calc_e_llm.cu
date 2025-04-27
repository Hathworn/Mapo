#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void calc_e(int objs, double* a, double b, int* y, double* kval, double* e) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    if (id < objs) {
        double fx = b;
        for (int i = 0; i < objs; i++) {
            // Use shared memory to improve memory access pattern
            __shared__ double shared_a_y[/* appropriate size based on usage */];
            if (threadIdx.x == 0) {
                shared_a_y[i] = a[i] * y[i];
            }
            __syncthreads();
            
            fx += shared_a_y[i] * kval[i * objs + id];
        }
        e[id] = fx - y[id];
    }
}