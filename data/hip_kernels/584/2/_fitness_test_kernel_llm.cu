#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int fitness_fun(unsigned char* actual_genes, unsigned char* expected_genes, int genes_len) {
    if (actual_genes == NULL) {
        printf("actual genes are NULL\n");
        return 1;
    }
    if (expected_genes == NULL) {
        printf("expected_genes are NULL\n");
        return 2;
    }

    int match_counter = 0;
    for (int geneIndex = 0; geneIndex < genes_len; geneIndex++) {
        unsigned char a_byte = expected_genes[geneIndex];
        unsigned char b_byte = actual_genes[geneIndex];
        unsigned char res_byte = ~(a_byte ^ b_byte);

        unsigned int res_int = (unsigned int) res_byte;
        match_counter += __popc(res_int);
    }
    return match_counter;
}

__global__ void _fitness_test_kernel(unsigned char* expected_genes, unsigned char* actual_genes, const int genes_size, int* ftnss_ptr) {
    // Use single thread for computation
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *ftnss_ptr = fitness_fun(actual_genes, expected_genes, genes_size);
    }
}