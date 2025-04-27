#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;
#define ITERATIONS 40000

enum pixel_position {INSIDE_MASK, BOUNDRY, OUTSIDE};

__global__ void poisson_jacobi_kernel(float *targetimg, float *outimg, int *boundary_array, int c, int w, int h, int boundBoxMinX, int boundBoxMaxX, int boundBoxMinY, int boundBoxMaxY) {
    int x = threadIdx.x + blockIdx.x * blockDim.x + boundBoxMinX;
    int y = threadIdx.y + blockIdx.y * blockDim.y + boundBoxMinY;

    // Check if x, y are within valid range before processing
    if (x < boundBoxMinX || x >= boundBoxMaxX || y < boundBoxMinY || y >= boundBoxMaxY)
        return;

    for (int channel = 0; channel < c; channel++) {
        int id = x + y * w + channel * w * h;

        // Avoid out-of-bounds accesses using boundary conditions
        int idx_nextX = (x + 1 < w) ? (x + 1 + y * w + channel * w * h) : id;
        int idx_prevX = (x - 1 >= 0) ? (x - 1 + y * w + channel * w * h) : id;
        int idx_nextY = (y + 1 < h) ? (x + (y + 1) * w + channel * w * h) : id;
        int idx_prevY = (y - 1 >= 0) ? (x + (y - 1) * w + channel * w * h) : id;

        if (boundary_array[id] == INSIDE_MASK) {
            double neighbor_target = targetimg[idx_nextY] + targetimg[idx_nextX] + targetimg[idx_prevX] + targetimg[idx_prevY];
            double neighbor_output = outimg[idx_nextY] + outimg[idx_nextX] + outimg[idx_prevX] + outimg[idx_prevY];
            outimg[id] = 0.25f * (4 * targetimg[id] - neighbor_target + neighbor_output); // Use 'f' for float operations
        }
    }
}