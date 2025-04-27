#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MD_ED_D(float *S, float *T, int trainSize, int window_size, int dimensions, float *data_out, int task, int gm) {

    long long int i, j, p;
    float sumErr = 0, dd = 0;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce redundant global memory accesses
    extern __shared__ float T2[];

    if (gm == 0) {
        int t, offset;
        if (task == 0) {
            offset = window_size;
            int wind = dimensions * window_size;
            t = idx * wind;
            if ((idx * wind) + wind > trainSize * wind) return;

            // Load data into shared memory once per block to minimize memory transactions
            if (threadIdx.x == 0) {
                for (i = 0; i < dimensions; i++)
                    for (j = 0; j < window_size; j++)
                        T2[window_size * i + j] = T[window_size * i + j];
            }

            __syncthreads();
        } else {
            offset = trainSize;
            t = idx;
            if ((idx + window_size) > trainSize) return;

            // Load data into shared memory once per block to minimize memory transactions
            if (threadIdx.x == 0) {
                for (i = 0; i < dimensions; i++)
                    for (j = 0; j < window_size; j++)
                        T2[window_size * i + j] = T[window_size * i + j];
            }
            __syncthreads();
        }

        // Optimize calculation using shared memory
        for (j = 0; j < window_size; j++) {
            dd = 0;
            for (p = 0; p < dimensions; p++) {
                float diff = S[(t + p * offset) + j] - T2[(p * window_size) + j];
                dd += diff * diff;
            }
            sumErr += dd;
        }
        data_out[idx] = sqrt(sumErr);
    } else {
        int t, offset;
        if (task == 0) {
            offset = window_size;
            int wind = dimensions * window_size;
            t = idx * wind;
            if ((idx * wind) + wind > trainSize * wind) return;
        } else {
            offset = trainSize;
            t = idx;
            if ((idx + window_size) > trainSize) return;
        }

        for (j = 0; j < window_size; j++) {
            dd = 0;
            for (p = 0; p < dimensions; p++) {
                float diff = S[(t + p * offset) + j] - T[(p * window_size) + j];
                dd += diff * diff;
            }
            sumErr += dd;
        }
        data_out[idx] = sqrt(sumErr);
    }
}