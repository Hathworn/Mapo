#include "hip/hip_runtime.h"
#include "includes.h"

#define C0  0
#define CZ1 1
#define CX1 2
#define CY1 3
#define CZ2 4
#define CX2 5
#define CY2 6
#define CZ3 7
#define CX3 8
#define CY3 9
#define CZ4 10
#define CX4 11
#define CY4 12

__global__ void inject_Source(int id, int ii, float *p, float *_tableS, float *_sourceV, int *_locsS, int _dir, int _jt, int _ntSrc){
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    // Check bounds to prevent memory access errors
    if (ix < _ntSrc) {
        float partial_sum = 0.0f;

        // Unroll loop for performance improvement
        #pragma unroll
        for (int offset = 0; offset < 8; offset++) {
            partial_sum += _tableS[ii + offset] * _sourceV[_ntSrc * ix + id + offset];
        }

        // Atomic operations to avoid race conditions
        atomicAdd(&p[_locsS[ix]], (float)_dir / _jt * partial_sum);
    }
}