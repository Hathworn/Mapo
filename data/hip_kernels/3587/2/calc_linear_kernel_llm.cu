#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void calc_linear_kernel(int objs, int coords, double* x, double* out) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int total_threads = blockDim.x * gridDim.x;
    
    // Use stride to distribute work among threads efficiently
    for (int id = tid; id < objs * objs; id += total_threads) {
        int i = id / objs;
        int j = id % objs;
        
        if (i < objs) {
            double r = 0.0;
            for (int k = 0; k < coords; ++k) {
                r += x[objs * k + i] * x[objs * k + j];
            }
            out[objs * i + j] = r;
        }
    }
}