#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 0.1

#undef MIN
#define MIN(a, b) ((a) < (b) ? (a) : (b))

#undef MAX
#define MAX(a, b) ((a) > (b) ? (a) : (b))

__global__ void histogram_kernel(float *I, float *minI, float *maxI, float *mask, int nbins, int c, int h, int w, float *hist) {
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;

    if (_id < c * size) {
        int id = _id % size, dc = _id / size;

        // Use shared memory for reduction if feasible
        extern __shared__ float local_hist[];

        // Initialize local histogram
        for (int i = threadIdx.x; i < nbins; i += blockDim.x) {
            local_hist[i] = 0.0f;
        }
        __syncthreads();

        if (mask[id] >= EPS) {
            float val = I[_id];
            float _minI = minI[dc];
            float _maxI = maxI[dc];

            if (_minI == _maxI) {
                _minI -= 1;
                _maxI += 1;
            }

            if (_minI <= val && val <= _maxI) {
                int idx = MIN((val - _minI) / (_maxI - _minI) * nbins, nbins - 1);
                atomicAdd(&local_hist[idx], 1.0f);
            }
        }

        __syncthreads();

        // Merge local histograms to global
        for (int i = threadIdx.x; i < nbins; i += blockDim.x) {
            atomicAdd(&hist[dc * nbins + i], local_hist[i]);
        }
    }
}