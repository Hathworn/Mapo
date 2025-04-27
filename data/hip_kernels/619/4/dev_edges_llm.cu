#include "hip/hip_runtime.h"
#include "includes.h"

#define IMUL(a, b) __mul24(a, b)
#define iDivUp(a, b) ((a) + (b) - 1) / (b)
#define CONV1_THREAD_SIZE 256
#define CONVN_THREAD_SIZE1 16
#define CONVN_THREAD_SIZE2 31

#define nrFilters 28
#define nrDirs 8

__constant__ float d_v1popDirs[3][nrFilters] = {
    {0.7246, -0.9718, 0.7496, -0.5837, -0.0810, 0.9439, 0.3203, -0.8712, -0.1593, -0.5142, 0.9304, 0.3737, -0.8031, -0.8126, 0.6004, -0.5738, 0.0024, 0.5969, 0.1436, 0.7757, -0.4004, -0.5108, 0.2375, -0.2221, -0.5140, 0.5194, -0.0870, 0.3838},
    {-0.6559, -0.1019, 0.6240, -0.7797, 0.9692, -0.2312, -0.9151, 0.4207, -0.9533, 0.8175, 0.2398, 0.8810, -0.4430, 0.0588, -0.5384, 0.5644, 0.7931, 0.5142, -0.7680, -0.0669, -0.6670, -0.2747, 0.5034, 0.5042, 0.1580, 0.1332, -0.5159, -0.3549},
    {0.2113, 0.2126, 0.2210, 0.2266, 0.2327, 0.2359, 0.2451, 0.2529, 0.2567, 0.2593, 0.2772, 0.2902, 0.3984, 0.5799, 0.5913, 0.5935, 0.6091, 0.6160, 0.6241, 0.6275, 0.6283, 0.8146, 0.8308, 0.8345, 0.8431, 0.8441, 0.8522, 0.8525}
};

__constant__ float motionProj[3][nrFilters][nrDirs] = {
    // Values omitted for brevity
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

__global__ void dev_edges(float *data, int len, int nrX_, int nrY_) {
    const int tid = IMUL(blockDim.x, blockIdx.x) + threadIdx.x;
    const int threadN = IMUL(blockDim.x, gridDim.x);

    for(int i = tid; i < len; i += threadN) {
        int X = i % nrX_;
        int Y = (i / nrX_) % nrY_;
        int scale = i / (nrX_ * nrY_ * 28);

        float edgedist = (float)min(min(X, nrX_ - 1 - X), min(Y, nrY_ - 1 - Y));
        float edgeFactor = 1.0f;

        // Simplified conditions and used fminf for readability
        if (scale == 0) {
            edgeFactor = fminf(125.0f, edgedist * edgedist * edgedist) / 125.0f;
        } else if (scale == 1) {
            edgeFactor = fminf(1296.0f, powf(edgedist, 4.0f)) / 1296.0f;
        } else {
            edgeFactor = fminf(7776.0f, powf(edgedist, 5.0f)) / 7776.0f;
        }

        data[i] *= edgeFactor;
    }
}