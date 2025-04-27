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

__global__ void histogram_kernel(float *I, float *minI, float *maxI, float *mask, int nbins, int c, int h, int w, float *hist)
{
    // Calculate the global thread ID
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;
    
    // Check if the thread ID is within bounds
    if (_id < c * size) {
        int id = _id % size;
        int dc = _id / size;
        
        // Skip mask elements below the threshold
        if (mask[id] >= EPS) {
            float val = I[_id];
            float _minI = minI[dc];
            float _maxI = maxI[dc];
            
            // Adjust min and max to avoid division by zero
            if (_minI == _maxI) {
                _minI -= 1.0f;
                _maxI += 1.0f;
            }
            
            // Only process values within the range
            if (_minI <= val && val <= _maxI) {
                // Compute and clamp bin index
                int idx = MIN(static_cast<int>((val - _minI) / (_maxI - _minI) * nbins), nbins - 1);
                int index = dc * nbins + idx;
                
                // Use atomic add to update the histogram
                atomicAdd(&hist[index], 1.0f);
            }
        }
    }
}