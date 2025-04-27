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

    // Ensure the thread processes valid data
    if (_id >= c * size) return;
    
    int id = _id % size, dc = _id / size;

    // Check mask threshold
    if (mask[id] < EPS) return;

    float val = I[_id];
    float _minI = minI[dc];
    float _maxI = maxI[dc];

    // Adjust identical min and max
    if (_minI == _maxI) {
        _minI -= 1.0f;
        _maxI += 1.0f;
    }

    // Valid value range check 
    if (_minI <= val && val <= _maxI) {
        // Calculate bin index safely without intermediate overflow
        int idx = __float2int_rz((val - _minI) * nbins / (_maxI - _minI));
        idx = MIN(idx, nbins - 1);
        int index = dc * nbins + idx;

        // Use atomic operation for histogram update
        atomicAdd(&hist[index], 1.0f);
    }
}