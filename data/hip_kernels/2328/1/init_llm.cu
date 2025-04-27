#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

// image size
int rows = 1224, cols = 1624;
int imgSize = rows*cols;

// iterations for stereo matching algorithm
int iteration = 1;

// disparity range
int Dmin = 1;
int Dmax = 80;
int Drange = Dmax - Dmin + 1;
//int winRadius = 9;

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
__global__ void init(unsigned int seed, hiprandState_t* states, int cols)
{
    // Calculate unique thread index
    int idx = blockIdx.y * blockDim.y * cols + blockIdx.x * blockDim.x + threadIdx.y * cols + threadIdx.x;
    
    // Initialize RNG state
    hiprand_init(seed, idx, 0, &states[idx]);
}