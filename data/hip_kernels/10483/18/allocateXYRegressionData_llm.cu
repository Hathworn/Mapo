#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void allocateXYRegressionData(int noPaths, int noControls, int noDims, int nYears, float* speciesParams, int year, int* controls, float* xin, float *condExp, int *dataPoints, float *xvals, float *yvals) {

    // Use shared memory for storing dataPoints to reduce global memory access
    extern __shared__ int sharedDataPoints[];

    int tid = threadIdx.x;
    if (tid < noControls) {
        sharedDataPoints[tid] = 0;
    }
    __syncthreads();

    int ii = blockIdx.x * blockDim.x + tid;
    if (ii < noPaths) {
        if (controls[ii] >= noControls) {
            printf("Invalid control %d\n", controls[ii]);
        }

        bool valid = true;
        for (int jj = 0; jj < (noDims - 1); jj++) {
            if (xin[ii * noDims + jj] < speciesParams[8 * jj + 3]) {
                valid = false;
                break;
            }
        }

        if (valid || controls[ii] == 0) {
            int controlIdx = controls[ii];
            int dataPointIdx = atomicAdd(&sharedDataPoints[controlIdx], 1);

            // Save the conditional expectation
            yvals[noPaths * controlIdx + dataPointIdx] = condExp[(year + 1) * noPaths + ii];

            // Save the input dimension values to the corresponding data group
            for (int jj = 0; jj < noDims; jj++) {
                xvals[controlIdx * noPaths * noDims + jj * noPaths + dataPointIdx] = xin[ii * noDims + jj];
            }
        }
    }

    __syncthreads();
    // Copy data from shared to global memory after processing
    if (tid < noControls) {
        atomicAdd(&dataPoints[tid], sharedDataPoints[tid]);
    }
}