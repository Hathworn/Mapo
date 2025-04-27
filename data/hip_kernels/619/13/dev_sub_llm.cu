#include "hip/hip_runtime.h"
#include "includes.h"

#define IMUL(a, b) __mul24(a, b)
#define iDivUp(a,b) (((a)+(b)-1)/(b))
#define CONV1_THREAD_SIZE 256
#define CONVN_THREAD_SIZE1 16
#define CONVN_THREAD_SIZE2 31

#define nrFilters 28
#define nrDirs 8

__constant__ float d_v1popDirs[3][nrFilters] = {
    // Directions data...
};

__constant__ float motionProj[3][nrFilters][nrDirs] = {
    // Motion projection data...
};

#define scalingFiltSize 5
__constant__ float d_scalingFilt[scalingFiltSize] = {0.0884, 0.3536, 0.5303, 0.3536, 0.0884};

#define v1GaussFiltSize 9
__constant__ float d_v1GaussFilt[v1GaussFiltSize] = {0.0007, 0.0155, 0.0903, 0.2345, 0.3179, 0.2345, 0.0903, 0.0155, 0.0007};

#define complexV1FiltSize 11
__constant__ float d_complexV1Filt[complexV1FiltSize] = {0.0019, 0.0110, 0.0430, 0.1142, 0.2052, 0.2495, 0.2052, 0.1142, 0.0430, 0.0110, 0.0019};

#define normV1filtSize 25
__constant__ float d_normV1filt[normV1filtSize] = {0.0045, 0.0072, 0.0109, 0.0160, 0.0225, 0.0303, 0.0393, 0.0490, 0.0587, 0.0675, 0.0746, 0.0792, 0.0808, 0.0792, 0.0746, 0.0675, 0.0587, 0.0490, 0.0393, 0.0303, 0.0225, 0.0160, 0.0109, 0.0072, 0.0045};

#define diff1filtSize 3
__constant__ float d_diff1filt[diff1filtSize] = {-1/2.0, 0, 1/2.0};

#define diff2filtSize 3
__constant__ float d_diff2filt[diff2filtSize] = {1, -2, 1};

#define diff3filtSize 5
__constant__ float d_diff3filt[diff3filtSize] = {-1/2.0, 1, 0, -1, 1/2.0};

#define nrT 9

// Kernel for subtracting two images
__global__ void dev_sub(float *i1data, float *i2data, float* odata, int len) {
    const int tid = IMUL(blockDim.x, blockIdx.x) + threadIdx.x;
    const int threadN = IMUL(blockDim.x, gridDim.x);

    // Optimize with loop unrolling
    for(int i = tid; i < len; i += threadN) {
        odata[i] = i1data[i] - i2data[i];
    }
}