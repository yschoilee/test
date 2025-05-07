const factorial = n => {
    if (n == 0) {
        return 1;
    }
    else {
        return n * factorial(n-1);
    }
}
const permutation = (n, r) => factorial(n) / factorial(n-r);
const combination = (n, r) => factorial(n) / (factorial(n-r) * factorial(r));
const multiPermutation = (n, r) => n ** r;
const multiCombination = (n, r) => combination(n + r -1, r);




module.exports = {
    permutation: (n, r) => permutation(n, r),
    combination: (n,r) => combination(n, r),
    multiPermutation: (n, r) => multiPermutation(n, r),
    multiCombination: (n,r) => multiCombination(n, r),
};