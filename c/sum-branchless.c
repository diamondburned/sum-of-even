typedef long long int int64_t;

const int mask = ~0;

void sum_branchless(int64_t *arr, int64_t narr, int64_t *out) {
  int64_t sum = 0;
  for (int64_t i = 0; i < narr; i++) {
    int64_t m = ~((arr[i] & 1) * mask);
    sum += arr[i] & m;
  }
  *out = sum;
}
