#include "hip/hip_runtime.h"
#include "includes.h"

// 2-point angular correlation

const int BLOCKSIZE = 256;
const int ROWSPERTHREAD = 256;

// Columns are D and rows are R

// All computation in single-precision

__global__ void DD_or_RR_kernel(int nCols, int nRows, float *arr, unsigned long long int *gHist) {
    // Compute global thread x and row offset
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * ROWSPERTHREAD;
    
    // Check if within bounds
    if (x < nCols && y + ROWSPERTHREAD > x) {
        // Optimized use of shared memory for histogram
        __shared__ unsigned int sHist[720];

        // Initialize shared memory using thread block instead of single thread for better efficiency
        for (int i = threadIdx.x; i < 720; i += blockDim.x) {
            sHist[i] = 0;
        }

        __syncthreads();

        // Calculate local values based on offset
        float asc1 = arr[x * 2];
        float dec1 = arr[x * 2 + 1];
        int offset = max(x - y + 1, 0);
        int nElements = min(nRows - y, ROWSPERTHREAD);

        for (int j = offset; j < nElements; j++) {
            float asc2 = arr[(y + j) * 2];
            float dec2 = arr[(y + j) * 2 + 1];
            float tmp = sinf(dec1) * sinf(dec2) + cosf(dec1) * cosf(dec2) * cosf(asc1 - asc2);
            tmp = fminf(tmp, 1.0f);
            tmp = fmaxf(tmp, -1.0f);
            float radianResult = acosf(tmp);
            float degreeResult = radianResult * 180.0f / 3.14159f;
            int resultIndex = floor(degreeResult * 4.0f);

            // Increment using atomic operations for shared histogram
            atomicAdd(&sHist[resultIndex], 2);
        }

        __syncthreads();

        // Use all threads to write back to global memory for reduced contention
        for (int i = threadIdx.x; i < 720; i += blockDim.x) {
            atomicAdd(&gHist[i], sHist[i]);
        }
    }
}