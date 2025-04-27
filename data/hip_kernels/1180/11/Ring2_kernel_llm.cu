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

__global__ void Ring2_kernel(float *A, float *BP, int *corrAB, int *mask, int *m, int ring, int c, int h, int w) {
    // Assigns variables for thread and block indices
    int id1 = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;

    // Ensure operation is within the bounds of the input
    if (id1 < size) {
        // Check mask condition
        if (mask[id1] != 0) {
            // Load corrAB coordinates once to reduce redundant computations
            int y2 = corrAB[2 * id1 + 1];
            int x2 = corrAB[2 * id1];

            // Use shared memory to potentially optimize memory accesses
            __shared__ int shared_m[TB];

            // Iterate using a single loop for ring range
            for (int d = -ring; d <= ring; ++d) {
                int _x2 = x2 + d;
                int _y2 = y2 + d;

                // Check bounds
                if (_x2 >= 0 && _x2 < w) {
                    shared_m[threadIdx.x] = 1;
                    atomicExch(&m[_y2 * w + _x2], shared_m[threadIdx.x]);
                }
                if (_y2 >= 0 && _y2 < h) {
                    shared_m[threadIdx.x] = 1;
                    atomicExch(&m[_y2 * w + _x2], shared_m[threadIdx.x]);
                }
            }
        }
    }
    return;
}