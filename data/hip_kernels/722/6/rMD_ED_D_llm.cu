```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rMD_ED_D(float *S, float *T, int window_size, int dimensions, float *data_out, int trainSize, int gm) {

    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if index is out of bounds
    if (idx >= (trainSize * window_size))
        return;

    extern __shared__ float T2[];

    int s = dimensions * 2 * window_size * (idx / window_size);
    int t = s + idx % window_size;
    float sumErr = 0.0f;

    if (gm == 0) {

        // Load T to shared memory once per block
        if (threadIdx.x < dimensions * window_size) {
            T2[threadIdx.x] = T[threadIdx.x];
        }
        __syncthreads();

        // Calculate error for shared memory case
        for (int j = 0; j < window_size; j++) {
            float dd = 0.0f;
            for (int p = 0; p < dimensions; p++) {
                float diff = S[(t + p * 2 * window_size) + j] - T2[(p * window_size) + j];
                dd += diff * diff;
            }
            sumErr += dd;
        }
        
    } else {

        // Calculate error for non-shared memory case
        for (int j = 0; j < window_size; j++) {
            float dd = 0.0f;
            for (int p = 0; p < dimensions; p++) {
                float diff = S[(t + p * 2 * window_size) + j] - T[(p * window_size) + j];
                dd += diff * diff;
            }
            sumErr += dd;
        }
        
    }

    // Store the result
    data_out[idx] = sqrt(sumErr);
}