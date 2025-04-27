#include "hip/hip_runtime.h"
#include "includes.h"

#define IMUL(a, b) __mul24(a, b)
#define iDivUp(a,b) ((a)+(b)-1)/(b)
#define CONV1_THREAD_SIZE 256
#define CONVN_THREAD_SIZE1 16
#define CONVN_THREAD_SIZE2 31 //31 is faster than 32 because shared memory is too full

#define nrFilters 28
#define nrDirs 8

__constant__ float d_v1popDirs[3][nrFilters] = {
{ 0.7246,-0.9718, 0.7496,-0.5837,-0.0810, 0.9439, 0.3203,-0.8712,-0.1593,-0.5142, 0.9304, 0.3737,-0.8031,-0.8126, 0.6004,-0.5738, 0.0024, 0.5969, 0.1436, 0.7757,-0.4004,-0.5108, 0.2375,-0.2221,-0.5140, 0.5194,-0.0870, 0.3838},
{-0.6559,-0.1019, 0.6240,-0.7797, 0.9692,-0.2312,-0.9151, 0.4207,-0.9533, 0.8175, 0.2398, 0.8810,-0.4430, 0.0588,-0.5384, 0.5644, 0.7931, 0.5142,-0.7680,-0.0669,-0.6670,-0.2747, 0.5034, 0.5042, 0.1580, 0.1332,-0.5159,-0.3549},
{ 0.2113, 0.2126, 0.2210, 0.2266, 0.2327, 0.2359, 0.2451, 0.2529, 0.2567, 0.2593, 0.2772, 0.2902, 0.3984, 0.5799, 0.5913, 0.5935, 0.6091, 0.6160, 0.6241, 0.6275, 0.6283, 0.8146, 0.8308, 0.8345, 0.8431, 0.8441, 0.8522, 0.8525}
};

__constant__ float motionProj[3][nrFilters][nrDirs] = {
// Data omitted for brevity
};

// Constants omitted for brevity

__global__ void dev_mean3(float *idata, float *odata, int nrXnrY, int nrZ) {
    int     tid = IMUL(blockDim.x, blockIdx.x) + threadIdx.x;
    int threadN = IMUL(blockDim.x, gridDim.x);
    int blockSize = nrXnrY * nrZ;

    for(int i = tid; i < nrXnrY; i += threadN) {
        // Use local register 'sum' instead of shared memory for efficiency
        float sum = 0.0f;
        int ind = i + blockIdx.y * blockSize;

        for (int j = 0; j < nrZ; j++) {
            // Ensure coalesced memory access by loading contiguous data
            sum += idata[ind + j * nrXnrY];
        }

        // Write the result directly to global memory
        odata[i + blockIdx.y * nrXnrY] = sum / nrZ;
    }
}