#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

// Optimized kernel using shared memory
__global__ void computeStateMinMax(int noControls, int noDims, int noPaths, int* dataPoints, float* xvals, float* xmins, float* xmaxes) {
    extern __shared__ float sharedMem[];
    float* xmin = sharedMem;
    float* xmax = sharedMem + noDims;

    int tid = threadIdx.x;
    for (int ii = blockIdx.x; ii < noControls; ii += gridDim.x) {
        if (tid < noDims) {
            xmin[tid] = FLT_MAX;
            xmax[tid] = -FLT_MAX;
        }
        __syncthreads();

        if (tid < dataPoints[ii]) {
            for (int jj = 0; jj < noDims; jj++) {
                float xtemp = xvals[ii * noDims * noPaths + jj * noPaths + tid];
                atomicMin(&xmin[jj], xtemp);
                atomicMax(&xmax[jj], xtemp);
            }
        }
        __syncthreads();

        if (tid < noDims) {
            xmins[ii * noDims + tid] = xmin[tid];
            xmaxes[ii * noDims + tid] = xmax[tid];
        }
        __syncthreads();
    }

    if (blockIdx.x == 0 && tid < noDims) {
        xmins[noControls * noDims + tid] = xmin[tid];
        xmaxes[noControls * noDims + tid] = xmax[tid];

        for (int ii = 1; ii < noControls; ii++) {
            float xtemp = xmins[ii * noDims + tid];
            atomicMin(&xmins[noControls * noDims + tid], xtemp);

            xtemp = xmaxes[ii * noDims + tid];
            atomicMax(&xmaxes[noControls * noDims + tid], xtemp);
        }
    }
}