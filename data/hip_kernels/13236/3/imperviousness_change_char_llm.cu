#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM_small 64
#define BLOCK_DIM 256

static const unsigned int threads = 512;
bool print_intermediate_arrays = false;
const char *BASE_PATH = "/home/giuliano/git/cuda/reduction";

const char *kern_0 = "filter_roi";
const char *kern_1 = "imperviousness_change_histc_sh_4";
const char *kern_2 = "imperviousness_change";
char buffer[255];

const char *FIL_ROI = "/media/DATI/db-backup/ssgci-data/testing/ssgci_roi.tif";
const char *FIL_BIN1 = "/media/DATI/db-backup/ssgci-data/testing/ssgci_bin.tif";
const char *FIL_BIN2 = "/media/DATI/db-backup/ssgci-data/testing/ssgci_bin2.tif";

const char *FIL_LTAKE_grid = "/home/giuliano/git/cuda/reduction/data/LTAKE_map.tif";
const char *FIL_LTAKE_count = "/home/giuliano/git/cuda/reduction/data/LTAKE_count.txt";

__global__ void imperviousness_change_char(const unsigned char *dev_BIN1, const unsigned char *dev_BIN2, unsigned int WIDTH, unsigned int HEIGHT, char *dev_LTAKE_map)
{
    unsigned long int tix = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    // Optimization: Checking boundary within the main loop
    if (tix < WIDTH * HEIGHT) {
        dev_LTAKE_map[tix] = dev_BIN2[tix] - dev_BIN1[tix]; // Compute difference and store
    }
}