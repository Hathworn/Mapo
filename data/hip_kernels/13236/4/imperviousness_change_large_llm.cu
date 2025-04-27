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

/* Kernel optimized */
__global__ void imperviousness_change_large(const unsigned char *dev_BIN1, const unsigned char *dev_BIN2, unsigned int WIDTH, unsigned int HEIGHT, int *dev_LTAKE_map, int mapel_per_thread) {
    unsigned long int tid = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned long int tix = tid * mapel_per_thread;

    if (tix < WIDTH * HEIGHT) { // Avoid unnecessary computations
        for (long int ii = 0; ii < mapel_per_thread; ii++) {
            if (tix + ii < WIDTH * HEIGHT) {
                dev_LTAKE_map[tix + ii] = static_cast<int>(dev_BIN2[tix + ii]) - static_cast<int>(dev_BIN1[tix + ii]);
            }
        }
    }
}