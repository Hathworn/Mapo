```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MD_ED_I(float *S, float *T, int trainSize, int window_size, int dimensions, float *data_out, int task, int gm) {

    int idx, offset_x;
    float sumErr = 0;
    long long int i, j;

    if(gm == 0){

        extern __shared__ float sh_mem[];

        float *T2 = (float *)sh_mem;
        float *DTW_single_dim = (float *)&sh_mem[dimensions * window_size];

        if (task == 0) {
            idx = threadIdx.x * dimensions + threadIdx.y;
            offset_x = ((blockDim.x * blockDim.y * window_size) * blockIdx.x) + idx * window_size;

            if (((blockDim.x * blockDim.y * blockIdx.x) + idx) >= trainSize * dimensions)
                return;

        } else { // SUBSEQ_SEARCH
            idx = threadIdx.x * dimensions + threadIdx.y;
            offset_x = (blockDim.x * blockIdx.x) + ((threadIdx.y * trainSize) + threadIdx.x);

            if ((idx + window_size) > trainSize)
                return;
        }

        // Preload data into shared memory
        if (idx < dimensions * window_size) {
            T2[idx] = T[idx];
        }
        __syncthreads();

        // Reduce the number of stores to shared memory
        for (j = 0; j < window_size; j++) {
            float diff = S[offset_x + j] - T2[window_size * threadIdx.y + j];
            sumErr += diff * diff;
        }
        DTW_single_dim[idx] = sqrt(sumErr);

        __syncthreads();

        // Reduce threads writing to global memory; use single thread to sum up results
        if (idx == 0) {
            for (i = 0; i < blockDim.x; i++) {
                float blockSum = 0.0;
                for (j = 0; j < blockDim.y; j++) {
                    blockSum += DTW_single_dim[i * dimensions + j];
                }
                data_out[(blockIdx.x * blockDim.x) + i] = blockSum;
            }
        }

    } else {

        extern __shared__ float DTW_single_dim[];

        if (task == 0) {
            idx = threadIdx.x * dimensions + threadIdx.y;
            offset_x = ((blockDim.x * blockDim.y * window_size) * blockIdx.x) + idx * window_size;

            if (((blockDim.x * blockDim.y * blockIdx.x) + idx) >= trainSize * dimensions)
                return;

        } else { // SUBSEQ_SEARCH
            idx = threadIdx.x * dimensions + threadIdx.y;
            offset_x = (blockDim.x * blockIdx.x) + ((threadIdx.y * trainSize) + threadIdx.x);

            if ((idx + window_size) > trainSize)
                return;
        }

        // Direct use of global memory for T
        for (j = 0; j < window_size; j++) {
            float diff = S[offset_x + j] - T[window_size * threadIdx.y + j];
            sumErr += diff * diff;
        }
        DTW_single_dim[idx] = sqrt(sumErr);

        __syncthreads();

        if (idx == 0) {
            for (i = 0; i < blockDim.x; i++) {
                float blockSum = 0.0;
                for (j = 0; j < blockDim.y; j++) {
                    blockSum += DTW_single_dim[i * dimensions + j];
                }
                data_out[(blockIdx.x * blockDim.x) + i] = blockSum;
            }
        }

    }

}