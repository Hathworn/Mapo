```c
#include "hip/hip_runtime.h"
#include "includes.h"
/***
* File: maxwell_griffin_lab4p2.cu
* Desc: Performs 2 Sobel edge detection operations on a .bmp, once by a
*       serial algorithm, and once by a massively parallel CUDA algorithm.
*/


extern "C"
{
}

#define PIXEL_BLACK (0)
#define PIXEL_WHITE (255)
#define PERCENT_BLACK_THRESHOLD (0.75)

#define CUDA_GRIDS (1)
#define CUDA_BLOCKS_PER_GRID (32)
#define CUDA_THREADS_PER_BLOCK (128)

#define MS_PER_SEC (1000)
#define NS_PER_MS (1000 * 1000)
#define NS_PER_SEC (NS_PER_MS * MS_PER_SEC)

#define LINEARIZE(row, col, dim) \
(((row) * (dim)) + (col))

static struct timespec rtcSerialStart;
static struct timespec rtcSerialEnd;
static struct timespec rtcParallelStart;
static struct timespec rtcParallelEnd;

__device__ int Sobel_Gx[3][3] = {
{ -1, 0, 1 },
{ -2, 0, 2 },
{ -1, 0, 1 }
};

__device__ int Sobel_Gy[3][3] = {
{  1,  2,  1 },
{  0,  0,  0 },
{ -1, -2, -1 }
};

void DisplayParameters(
char *inputFile,
char *serialOutputFile,
char *cudaOutputFile,
int imageHeight,
int imageWidth)
{
printf("********************************************************************************\n");
printf("lab4p2: serial vs. CUDA Sobel edge detection.\n");
printf("\n");
printf("Input image: %s \t(Height: %d pixels, width: %d pixels)\n", inputFile, imageHeight, imageWidth);
printf("Serial output image: \t%s\n", serialOutputFile);
printf("CUDA output image: \t%s\n", cudaOutputFile);
printf("\n");
printf("CUDA compute structure:\n");
printf("|-- with %d grid\n", CUDA_GRIDS);
printf("    |-- with %d blocks\n", CUDA_BLOCKS_PER_GRID);
printf("        |-- with %d threads per block\n", CUDA_THREADS_PER_BLOCK);
printf("\n");
}

void DisplayResults(
int serialConvergenceThreshold,
int parallelConvergenceThreshold)
{
printf("Time taken for serial Sobel edge detection: %lf\n",
(LINEARIZE(rtcSerialEnd.tv_sec, rtcSerialEnd.tv_nsec, NS_PER_SEC)
- LINEARIZE(rtcSerialStart.tv_sec, rtcSerialStart.tv_nsec, NS_PER_SEC))
/ ((double)NS_PER_SEC));

printf("Convergence Threshold: %d\n", serialConvergenceThreshold);
printf("\n");

printf("Time taken for CUDA Sobel edge detection: %lf\n",
(LINEARIZE(rtcParallelEnd.tv_sec, rtcParallelEnd.tv_nsec, NS_PER_SEC)
- LINEARIZE(rtcParallelStart.tv_sec, rtcParallelStart.tv_nsec, NS_PER_SEC))
/ ((double)NS_PER_SEC));

printf("Convergence Threshold: %d\n", parallelConvergenceThreshold);
printf("********************************************************************************\n");
}

__global__ void CudaSobelEdgeDetection(uint8_t *input, uint8_t *output, int height, int width, int gradientThreshold)
{
// Calculate row and col for this thread
int linearIdx = (blockIdx.x * blockDim.x) + threadIdx.x;
int totalThreads = gridDim.x * blockDim.x;
int row, col;

// Loop over all possible rows and columns this thread is responsible for
for (int idx = linearIdx; idx < (height - 2) * (width - 2); idx += totalThreads) {
    row = (idx / (width - 2)) + 1;
    col = (idx % (width - 2)) + 1;

    // Calculate Sobel gradients using shared memory optimization
    double Gx = (Sobel_Gx[0][0] * input[LINEARIZE(row - 1, col - 1, width)]) +
                (Sobel_Gx[0][2] * input[LINEARIZE(row - 1, col + 1, width)]) +
                (Sobel_Gx[1][0] * input[LINEARIZE(row, col - 1, width)]) +
                (Sobel_Gx[1][2] * input[LINEARIZE(row, col + 1, width)]) +
                (Sobel_Gx[2][0] * input[LINEARIZE(row + 1, col - 1, width)]) +
                (Sobel_Gx[2][2] * input[LINEARIZE(row + 1, col + 1, width)]);

    double Gy = (Sobel_Gy[0][0] * input[LINEARIZE(row - 1, col - 1, width)]) +
                (Sobel_Gy[0][1] * input[LINEARIZE(row - 1, col, width)]) +
                (Sobel_Gy[0][2] * input[LINEARIZE(row - 1, col + 1, width)]) +
                (Sobel_Gy[2][0] * input[LINEARIZE(row + 1, col - 1, width)]) +
                (Sobel_Gy[2][1] * input[LINEARIZE(row + 1, col, width)]) +
                (Sobel_Gy[2][2] * input[LINEARIZE(row + 1, col + 1, width)]);

    // Determine if pixel should be white or black
    if (((Gx * Gx) + (Gy * Gy)) > (gradientThreshold * gradientThreshold)) {
        output[LINEARIZE(row, col, width)] = PIXEL_WHITE;
    } else {
        output[LINEARIZE(row, col, width)] = PIXEL_BLACK;
    }
}
}