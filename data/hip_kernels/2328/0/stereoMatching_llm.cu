#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

// image size
int rows = 1224, cols = 1624;
int imgSize = rows * cols;

// iterations for stereo matching algorithm
int iteration = 1;

// disparity range
int Dmin = 1;
int Dmax = 80;
int Drange = Dmax - Dmin + 1;

// device image pointer
float* dLImgPtr_f = NULL;
float* dRImgPtr_f = NULL;
size_t lPitch, rPitch;

// texture memory for stereo image pair <Type, Dim, ReadMode>
texture<float, 2, hipReadModeElementType> lTex;
texture<float, 2, hipReadModeElementType> rTex;

// timing arrays
const int nt = 2;
double start[nt], end[nt];
double random_start[nt], random_end[nt];
double main_start[nt], main_end[nt];

// evaluate window-based disimilarity
__device__ float evaluateCost(float u, float v, float matchIdx, int cols, int rows, int winRadius)
{
    float cost = 0.0f;

    for (int h = -winRadius; h <= winRadius; h++) {
        for (int w = -winRadius; w <= winRadius; w++) {
            cost += fabsf(tex2D(lTex, matchIdx + w / (float)cols, v + h / (float)rows)
                        - tex2D(rTex, u + w / (float)cols, v + h / (float)rows));
        }
    }

    return cost;
}

__global__ void stereoMatching(float* dRDispPtr, float* dRPlanes, int cols, int rows, hiprandState* states, int iteration)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    int winRadius = 9;

    // Skip border pixels
    if (x >= cols - winRadius || x < winRadius || y >= rows - winRadius || y < winRadius)
        return;

    float u = x / (float)cols;
    float v = y / (float)rows;
    int idx = y * cols + x;

    // Set planes to be fronto-parallel during first iteration
    if (iteration != 0) {
        dRPlanes[idx * 3] = 0.0f;
        dRPlanes[idx * 3 + 1] = 0.0f;
        dRPlanes[idx * 3 + 2] = 1.0f;
    }

    // Current pixel disparity
    float min_cost = evaluateCost(u, v, u + dRDispPtr[idx] * 80.0f / (float)cols, cols, rows, winRadius);

    // Check left neighbor disparity
    float left_disp = dRDispPtr[idx - 1];
    float left_cost = evaluateCost(u, v, u + left_disp * 80.0f / (float)cols, cols, rows, winRadius);
    if (left_cost < min_cost) {
        min_cost = left_cost;
        dRDispPtr[idx] = left_disp;
    }

    // Check upper neighbor disparity
    float upper_disp = dRDispPtr[idx - cols];
    float upper_cost = evaluateCost(u, v, u + upper_disp * 80.0f / (float)cols, cols, rows, winRadius);
    if (upper_cost < min_cost) {
        min_cost = upper_cost;
        dRDispPtr[idx] = upper_disp;
    }

    // Random disparity within border
    float rand_disp, rand_cost;
    do {
        rand_disp = hiprand_uniform(&states[idx]) * 80.0f;
    } while ((u + rand_disp / (float)cols < (float)winRadius / cols) || (u + rand_disp / (float)cols >= (float)(cols - winRadius) / cols));

    rand_cost = evaluateCost(u, v, u + rand_disp * 80.0f / (float)cols, cols, rows, winRadius);
    if (rand_cost < min_cost) {
        min_cost = rand_cost;
        dRDispPtr[idx] = rand_disp;
    }
}