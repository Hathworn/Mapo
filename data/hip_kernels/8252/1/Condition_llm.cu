```c
#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef TIME
#define COMM 1
#elif NOTIME
#define COMM 0
#endif

#define MASK_WIDTH 5
#define TILE_WIDTH 32
#define GPU 1
#define COMMENT "skeletization_GPU"
#define RGB_COMPONENT_COLOR 255

typedef struct {
    unsigned char red, green, blue;
} PPMPixel;

typedef struct {
    int x, y;
    PPMPixel *data;
} PPMImage;

typedef struct {
    int x, y;
} Par;

double time_total;

// Optimized global kernel function
__global__ void Condition(int *GrayScale_, int *d_changing1, int *cont, int linhas, int colunas, int flag)
{
    // Pre-calculated offsets to access neighboring pixels
    constexpr int X_index[] = {-1, -1, 0, 1, 1, 1, 0, -1};
    constexpr int Y_index[] = {0, 1, 1, 1, 0, -1, -1, -1};

    // Use shared memory for neighbor values to reduce redundant global memory accesses
    __shared__ int neighbors_shared[TILE_WIDTH][TILE_WIDTH][8];
    
    int col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    int fil = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int index = fil * colunas + col;

    if (fil > 0 && col > 0 && fil < linhas-1 && col < colunas-1)
    {
        d_changing1[index] = 0;
        
        // Load neighbors into shared memory
        for (int i = 0; i < 8; i++) {
            neighbors_shared[threadIdx.y][threadIdx.x][i] = GrayScale_[(fil + X_index[i]) * colunas + (col + Y_index[i])];
        }
        __syncthreads();

        // Calculate total and ans using shared memory
        int total = 0, ans = 0;
        for(int i = 0; i < 8; i++) {
            total += neighbors_shared[threadIdx.y][threadIdx.x][i];
            if (i < 7 && neighbors_shared[threadIdx.y][threadIdx.x][i] == 0 && neighbors_shared[threadIdx.y][threadIdx.x][i+1] == 1) {
                ans++;
            }
        }
        if(neighbors_shared[threadIdx.y][threadIdx.x][7] == 0 && neighbors_shared[threadIdx.y][threadIdx.x][0] == 1) {
            ans++;
        }

        if(flag != 1) {
            if(GrayScale_[fil * colunas + col] == 1 && total >= 2 && total <= 6 && ans == 1 &&
               neighbors_shared[threadIdx.y][threadIdx.x][0] * neighbors_shared[threadIdx.y][threadIdx.x][2] * neighbors_shared[threadIdx.y][threadIdx.x][4] == 0 &&
               neighbors_shared[threadIdx.y][threadIdx.x][2] * neighbors_shared[threadIdx.y][threadIdx.x][4] * neighbors_shared[threadIdx.y][threadIdx.x][6] == 0) {
                d_changing1[index] = 1;
                cont[flag] = 1;
            }
        }
        else {
            if(GrayScale_[fil * colunas + col] == 1 && total >= 2 && total <= 6 && ans == 1 &&
               neighbors_shared[threadIdx.y][threadIdx.x][0] * neighbors_shared[threadIdx.y][threadIdx.x][2] * neighbors_shared[threadIdx.y][threadIdx.x][6] == 0 &&
               neighbors_shared[threadIdx.y][threadIdx.x][0] * neighbors_shared[threadIdx.y][threadIdx.x][4] * neighbors_shared[threadIdx.y][threadIdx.x][6] == 0) {
                d_changing1[index] = 1;
                cont[flag] = 1;
            }
        }
    }
}