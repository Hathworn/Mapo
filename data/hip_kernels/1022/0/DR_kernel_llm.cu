#include "hip/hip_runtime.h"
#include "includes.h"

// 2-point angular correlation

const int BLOCKSIZE = 256;
const int ROWSPERTHREAD = 256;

__global__ void DR_kernel(int nCols, int nRows, float *D, float *R, unsigned long long int *gHist) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * ROWSPERTHREAD;

    if (x < nCols) {
        __shared__ unsigned int sHist[720];

        // Initialize shared memory using all threads (faster parallel initialization)
        for (int i = threadIdx.x; i < 720; i += blockDim.x) {
            sHist[i] = 0;
        }

        __syncthreads();

        float asc1 = D[x * 2];
        float dec1 = D[x * 2 + 1];

        int nElements = min(nRows - y, ROWSPERTHREAD);

        for (int j = 0; j < nElements; j++) {
            float asc2 = R[(y + j) * 2];
            float dec2 = R[(y + j) * 2 + 1];

            float tmp = sinf(dec1) * sinf(dec2) + cosf(dec1) * cosf(dec2) * cosf(asc1 - asc2);
            tmp = fminf(fmaxf(tmp, -1.0f), 1.0f); // Combine clamping operations

            float radianResult = acosf(tmp);
            float degreeResult = radianResult * 180.0f / 3.14159f;

            int resultIndex = floor(degreeResult * 4.0f);

            atomicAdd(&sHist[resultIndex], 1);
        }

        __syncthreads();

        // Use all threads to update the global histogram (faster parallel reduction)
        for (int i = threadIdx.x; i < 720; i += blockDim.x) {
            atomicAdd(&gHist[i], sHist[i]);
        }
    }
}