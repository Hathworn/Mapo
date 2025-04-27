#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

__global__ void  KparamAR(double* a, double* b, double* c, double ss, double dtAR, int width, int height) 
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check boundaries at the start to avoid unnecessary computation
    if (i >= width || j >= height) return;

    // Compute symmetric indices efficiently
    int x = (i > width / 2) ? width - i : i;
    int y = (j > height / 2) ? height - j : j;

    // Use pre-calculated value for similar operations
    double r_squared = (double)x*x + (double)y*y;
    double r = sqrt(r_squared) + EPS; // Precalculate sqrt value

    // Remove redundant calculations
    double dtAR_ss_r = dtAR * ss * r;
    a[i + j * width] = 2 - dtAR_ss_r * 2 - dtAR_ss_r * dtAR_ss_r;
    b[i + j * width] = -1 + dtAR_ss_r * 2;
    c[i + j * width] = 1;
}